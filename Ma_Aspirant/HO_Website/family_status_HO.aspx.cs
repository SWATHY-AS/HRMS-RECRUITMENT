using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.IO;
using System.Text;
namespace Ma_Aspirant.Recruitment
{
    public partial class family_status_HO : System.Web.UI.Page

    {

        static string candcode = "";
        ServiceReference1.ServiceClient obj = new ServiceReference1.ServiceClient();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(HttpContext.Current.Session["candcode"] as string))
            {
                Response.Redirect("~/HO_Website/Login_HO.aspx");
            }
            else
            {

                // candcode = HttpContext.Current.Session["candcode"].ToString();
                candcode = Session["candcode"].ToString();


                this.txt_session.Text = candcode.ToString();
            }
            
        }


      

        public class qualctg
        {
            public string qc_id { get; set; }
            public string qc_name { get; set; }
        }

        public List<qualctg> qctginfo { get; set; }
        [WebMethod(EnableSession = true)]
        public static List<qualctg> qcatg_dtl()
        {
            ServiceReference1.ServiceClient obj;
            List<qualctg> qctginfo = new List<qualctg>();
            obj = new ServiceReference1.ServiceClient();
            DataTable ds = new DataTable();
            //  ds = obj.getdata("9", "0");
          //  ds = obj.select_data("22", "0");
         //   System.Net.ServicePointManager.SecurityProtocol = System.Net.SecurityProtocolType.Tls | System.Net.SecurityProtocolType.Tls11 | System.Net.SecurityProtocolType.Tls12;

            ds = obj.get_data(58, "0");
            try
            {
                if (ds.Rows.Count > 0)
                {
                    foreach (DataRow dr in ds.Rows)
                    {
                        qctginfo.Add(new qualctg()
                        {
                            qc_id = dr["category_id"].ToString(),
                            qc_name = dr["category"].ToString()
                        });
                    }
                }
            }
            catch (Exception ex)
            {
            }
            return qctginfo;
        }


        [WebMethod(EnableSession = true)]
        public static string get_fam_dtl(string input)
        {
            string s = "";
            ServiceReference1.ServiceClient obj;
            obj = new ServiceReference1.ServiceClient();
            DataTable ds = new DataTable();
            System.Net.ServicePointManager.SecurityProtocol = System.Net.SecurityProtocolType.Tls | System.Net.SecurityProtocolType.Tls11 | System.Net.SecurityProtocolType.Tls12;

            ds = obj.get_data(59, input);

            if (ds.Rows.Count > 0)
            {

                s = ds.Rows[0][0].ToString();
            }

            return s;
        }

        [WebMethod(EnableSession = true)]
        public static string enroll_family_dtl(string input)
        {
            string s = "";
            ServiceReference1.ServiceClient obj;
            obj = new ServiceReference1.ServiceClient();
            DataTable ds = new DataTable();
            System.Net.ServicePointManager.SecurityProtocol = System.Net.SecurityProtocolType.Tls | System.Net.SecurityProtocolType.Tls11 | System.Net.SecurityProtocolType.Tls12;

            ds = obj.proc_hrm_common_select("16", "30", input); 
            if (ds.Rows.Count > 0)
            {
                s = ds.Rows[0][0].ToString();
            }
            return s;
        }
        [WebMethod(EnableSession = true)]
        public static string enroll_family_update(string input)
        {
            string s = "";
            ServiceReference1.ServiceClient obj;
            obj = new ServiceReference1.ServiceClient();
            DataTable ds = new DataTable();
            System.Net.ServicePointManager.SecurityProtocol = System.Net.SecurityProtocolType.Tls | System.Net.SecurityProtocolType.Tls11 | System.Net.SecurityProtocolType.Tls12;

          ds=  obj.proc_hrm_common_select("16", "30", input); 
         //   ds = obj.get_data(30, input);
            if (ds.Rows.Count > 0)
            {
                s = ds.Rows[0][0].ToString();
            }
            return s;
        }





        [WebMethod(EnableSession = true)]
        public static string get_family(string input)
        {
            string s = "";
            ServiceReference1.ServiceClient obj = new ServiceReference1.ServiceClient();

            DataTable ds = new DataTable();
            System.Net.ServicePointManager.SecurityProtocol = System.Net.SecurityProtocolType.Tls | System.Net.SecurityProtocolType.Tls11 | System.Net.SecurityProtocolType.Tls12;

            //    System.Net.ServicePointManager.SecurityProtocol = System.Net.SecurityProtocolType.Tls | System.Net.SecurityProtocolType.Tls11 | System.Net.SecurityProtocolType.Tls12;
            ds = obj.proc_hrm_common_select("15", "31", input); 
           // ds = obj.get_data(50, input);
            if (ds.Rows.Count > 0)
            {


                s = ds.Rows[0][0].ToString();
            }

            return s;
        }
        
            
 //27may

        [WebMethod(EnableSession = true)]
        public static string get_family_dtl2(string input)
        {
            string s = "";
            ServiceReference1.ServiceClient obj = new ServiceReference1.ServiceClient();
            DataTable ds = new DataTable();
            System.Net.ServicePointManager.SecurityProtocol = System.Net.SecurityProtocolType.Tls | System.Net.SecurityProtocolType.Tls11 | System.Net.SecurityProtocolType.Tls12;

            ds = obj.get_data(63, input);
            //  ds = obj.access_hrm("23", input);
            if (ds.Rows.Count > 0)
            {
                s = ds.Rows[0][0].ToString() + "~" + ds.Rows[0][1].ToString() + "~" + ds.Rows[0][2].ToString() + "~" + ds.Rows[0][3].ToString() + "~" +
                    ds.Rows[0][4].ToString() + "~" + ds.Rows[0][5].ToString() + "~" + ds.Rows[0][6].ToString() + "~" + ds.Rows[0][7].ToString() + "~" +
                    ds.Rows[0][8].ToString() + "~" + ds.Rows[0][9].ToString() + "~" + ds.Rows[0][10].ToString() + "~" +
                    ds.Rows[0][11].ToString() + "~" + ds.Rows[0][12].ToString() + "~" + ds.Rows[0][13].ToString() + "~" + ds.Rows[0][14].ToString();


            }
            return s;
        }

        public class empsib
        {
            public string sib_name { get; set; }
            public string qualification { get; set; }
            public string occup { get; set; }
            public string occup_any { get; set; }
            public string sal { get; set; }
            public string gen { get; set; }

        }
        public List<empsib> emp_dtsib { get; set; }
        [WebMethod(EnableSession = true)]
        public static List<empsib> get_sib_dtl(string input)
        {
            ServiceReference1.ServiceClient obj = new ServiceReference1.ServiceClient();



            List<empsib> emp_dtsib = new List<empsib>();

            DataTable ds = new DataTable();
            System.Net.ServicePointManager.SecurityProtocol = System.Net.SecurityProtocolType.Tls | System.Net.SecurityProtocolType.Tls11 | System.Net.SecurityProtocolType.Tls12;

            ds = obj.get_data(64, input);
            //ds = obj.access_hrm("27", input);
            //     ds = obj.getdata("78", input);
            try
            {
                if (ds.Rows.Count > 0)
                {
                    foreach (DataRow dr in ds.Rows)
                    {
                        emp_dtsib.Add(new empsib()
                        {
                            sib_name = dr["sib_name"].ToString(),
                            qualification = dr["sib_qual"].ToString(),
                            occup = dr["sib_occup"].ToString(),
                            occup_any = dr["sib_occu_any"].ToString(),
                            sal = dr["sib_sal"].ToString(),
                            gen = dr["gender"].ToString(),

                        });
                    }
                }
            }
            catch (Exception ex)
            {
            }
            return emp_dtsib;


        }

        //31may
        [WebMethod(EnableSession = true)]
        public static string get_form(string input)
        {
            string s = "";
            ServiceReference1.ServiceClient obj = new ServiceReference1.ServiceClient();

            DataTable ds = new DataTable();

            System.Net.ServicePointManager.SecurityProtocol = System.Net.SecurityProtocolType.Tls | System.Net.SecurityProtocolType.Tls11 | System.Net.SecurityProtocolType.Tls12;

            ds = obj.get_data(74, input);
            if (ds.Rows.Count > 0)
            {


                s = ds.Rows[0][0].ToString();
            }

            return s;
        }

    }
}