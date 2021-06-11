using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;
using System.Data;
namespace Ma_Aspirant.Recruitment
{
    public partial class qualification : System.Web.UI.Page
    {
        static string candcode = "";
        ServiceReference1.ServiceClient obj = new ServiceReference1.ServiceClient();



        protected void Page_Load(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(HttpContext.Current.Session["candcode"] as string))
            {
                Response.Redirect("~/Login.aspx");
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
        public static List<qualctg> qcatg_dtl(string empid)
        {
            ServiceReference1.ServiceClient obj = new ServiceReference1.ServiceClient();
            List<qualctg> qctginfo = new List<qualctg>();
            DataTable ds = new DataTable();
            System.Net.ServicePointManager.SecurityProtocol = System.Net.SecurityProtocolType.Tls | System.Net.SecurityProtocolType.Tls11 | System.Net.SecurityProtocolType.Tls12;

            ds = obj.get_data(47, empid);
         //   ds = obj.select_data("22", "0");
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
        public class cand_qualtyp
        {
            public string qualification_id { get; set; }
            public string qualification { get; set; }
        }
        public class univ
        {
            public string uid { get; set; }
            public string u_name { get; set; }
        }
        public List<univ> univnfo { get; set; }
        public List<cand_qualtyp> qual { get; set; }
        [WebMethod(EnableSession = true)]

        public static List<cand_qualtyp> qual_dtl_rec(string input)
        {
            ServiceReference1.ServiceClient obj = new ServiceReference1.ServiceClient();
            List<cand_qualtyp> qual = new List<cand_qualtyp>();
            DataTable ds = new DataTable();
            System.Net.ServicePointManager.SecurityProtocol = System.Net.SecurityProtocolType.Tls | System.Net.SecurityProtocolType.Tls11 | System.Net.SecurityProtocolType.Tls12;

            //  ds = obj.getdata("13", indata);
            ds = obj.get_data(48, input);
            try
            {
                if (ds.Rows.Count > 0)
                {
                    foreach (DataRow dr in ds.Rows)
                    {
                        qual.Add(new cand_qualtyp()
                        {
                            qualification_id = dr["q_id"].ToString(),
                            qualification = dr["q_name"].ToString()
                        });
                    }
                }
            }
            catch (Exception ex)
            {
            }
            return qual;
        }
        [WebMethod(EnableSession = true)]
        public static List<univ> univ_dtl_rec()
        {
            ServiceReference1.ServiceClient obj = new ServiceReference1.ServiceClient();
            List<univ> uninfo = new List<univ>();
            DataTable ds = new DataTable();
            System.Net.ServicePointManager.SecurityProtocol = System.Net.SecurityProtocolType.Tls | System.Net.SecurityProtocolType.Tls11 | System.Net.SecurityProtocolType.Tls12;

            ds = obj.get_data(49, "0");
            try
            {
                if (ds.Rows.Count > 0)
                {
                    foreach (DataRow dr in ds.Rows)
                    {
                        uninfo.Add(new univ()
                        {
                            uid = dr["univ_id"].ToString(),
                            u_name = dr["university_name"].ToString()
                        });
                    }
                }
            }
            catch (Exception ex)
            {
            }
            return uninfo;
        }

         [WebMethod(EnableSession = true)]
             public static string insert_quali(string data,string qualdata,string qual_data2,string qual_data3, string qual_data4,string emerg_data)
        {
            string s = "";
            DataTable dsbasic,dsqual1, dsqual2, dsqual3, dsqual4,dsemrgn = new DataTable();
            ServiceReference1.ServiceClient obj = new ServiceReference1.ServiceClient();
            System.Net.ServicePointManager.SecurityProtocol = System.Net.SecurityProtocolType.Tls | System.Net.SecurityProtocolType.Tls11 | System.Net.SecurityProtocolType.Tls12;

            //dsqual1 = obj.get_data(39, data);
            //string resqual1 = dsqual1.Rows[0][0].ToString();
            dsqual1 = obj.proc_hrm_common_select("16", "32", data); 
           
            if (dsqual1.Rows.Count > 0)
            {
                s = dsqual1.Rows[0][0].ToString();
            }
          
             return s;



        }

             [WebMethod(EnableSession = true)]
             public static string get_qual_dtl(string input)
             {
                 string s = "";
                 ServiceReference1.ServiceClient obj = new ServiceReference1.ServiceClient();
              
                 DataTable ds = new DataTable();

                System.Net.ServicePointManager.SecurityProtocol = System.Net.SecurityProtocolType.Tls | System.Net.SecurityProtocolType.Tls11 | System.Net.SecurityProtocolType.Tls12;

                 ds = obj.get_data(50, input);
                 if (ds.Rows.Count > 0)
                 {


                     s = ds.Rows[0][0].ToString();
                 }

                 return s;
             }
        
            
             [WebMethod(EnableSession = true)]
             public static string high_qual(string input)
             {
                 string s = "";
                 ServiceReference1.ServiceClient obj = new ServiceReference1.ServiceClient();
              
                 DataTable ds = new DataTable();

                 System.Net.ServicePointManager.SecurityProtocol = System.Net.SecurityProtocolType.Tls | System.Net.SecurityProtocolType.Tls11 | System.Net.SecurityProtocolType.Tls12;

                 ds = obj.get_data(65, input);
                 if (ds.Rows.Count > 0)
                 {


                     s = ds.Rows[0][0].ToString() + '~' + ds.Rows[0][1].ToString() + '~' + ds.Rows[0][2].ToString();
                 }

                 return s;
             }

             [WebMethod(EnableSession = true)]
             public static string check_data(string input)
                {
                 string s = "";
                 ServiceReference1.ServiceClient obj = new ServiceReference1.ServiceClient();

                 DataTable ds = new DataTable();

                   System.Net.ServicePointManager.SecurityProtocol = System.Net.SecurityProtocolType.Tls | System.Net.SecurityProtocolType.Tls11 | System.Net.SecurityProtocolType.Tls12;

                 ds =obj.proc_hrm_common_select("15", "30", input); 
                 if (ds.Rows.Count > 0)
                 {


                     s = ds.Rows[0][0].ToString() ;
                 }

                 return s;
             }

        //27may
             public class empqudt
             {
                 public string category { get; set; }
                 public string qualification { get; set; }
                 public string university { get; set; }
                 public string institution { get; set; }
                 public string YEAR_PASS { get; set; }
                 public string percentage { get; set; }
                 public string grade { get; set; }
                 public string NO_OF_ATTEMPT { get; set; }
                 public string typ_reg { get; set; }
                 public string high { get; set; }

             }
             public List<empqudt> emp_dtquql { get; set; }
             [WebMethod(EnableSession = true)]
             public static List<empqudt> get_qual_dtl_view(string input)
             {
                 ServiceReference1.ServiceClient obj = new ServiceReference1.ServiceClient();
                 List<empqudt> emp_dtquql = new List<empqudt>();

                 DataTable ds = new DataTable();
                 System.Net.ServicePointManager.SecurityProtocol = System.Net.SecurityProtocolType.Tls | System.Net.SecurityProtocolType.Tls11 | System.Net.SecurityProtocolType.Tls12;

                 ds = obj.get_data(60, input);
                 //     ds = obj.getdata("78", input);
                 try
                 {
                     if (ds.Rows.Count > 0)
                     {
                         foreach (DataRow dr in ds.Rows)
                         {
                             emp_dtquql.Add(new empqudt()
                             {
                                 category = dr["category"].ToString(),
                                 qualification = dr["qualification"].ToString(),
                                 university = dr["university_name"].ToString(),
                                 institution = dr["institution"].ToString(),
                                 YEAR_PASS = dr["YEAR_PASS"].ToString(),
                                 percentage = dr["percentage"].ToString(),
                                 grade = dr["grade"].ToString(),
                                 NO_OF_ATTEMPT = dr["NO_OF_ATTEMPT"].ToString(),
                                 typ_reg = dr["typ"].ToString(),
                                 high = dr["high"].ToString(),
                             });
                         }
                     }
                 }
                 catch (Exception ex)
                 {
                 }
                 return emp_dtquql;


             }

    //31may
             [WebMethod(EnableSession = true)]
             public static string get_form(string input)
             {
                 string s = "";
                 ServiceReference1.ServiceClient obj = new ServiceReference1.ServiceClient();

                 DataTable ds = new DataTable();

                 System.Net.ServicePointManager.SecurityProtocol = System.Net.SecurityProtocolType.Tls | System.Net.SecurityProtocolType.Tls11 | System.Net.SecurityProtocolType.Tls12;

                 ds = obj.get_data(78, input);
                 if (ds.Rows.Count > 0)
                 {


                     s = ds.Rows[0][0].ToString();
                 }

                 return s;
             }

    
    }
}