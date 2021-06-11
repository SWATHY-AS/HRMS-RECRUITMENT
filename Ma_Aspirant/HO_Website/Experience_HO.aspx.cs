using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Data;
using System.Web.UI.WebControls;
 using System.Web.Services;
namespace Ma_Aspirant.HO_Website
{
    public partial class Experience_HO : System.Web.UI.Page
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

                this.hdUserId.Value = candcode;
                this.txt_session.Text = candcode.ToString();
            }
        }

        public class empexp_cn
        {
            public string cn_id { get; set; }
            public string cn_name { get; set; }
        }
        
        [WebMethod(EnableSession = true)]

        public static List<empexp_cn> emp_exp_country()
        {
            ServiceReference1.ServiceClient obj;
            List<empexp_cn> emp_exp_con = new List<empexp_cn>();
            obj = new ServiceReference1.ServiceClient();
            DataTable ds = new DataTable();
            // ds = obj.getdata("36", "0");
            ds = obj.proc_hrm_common_select("44","80", "0");
            try
            {
                if (ds.Rows.Count > 0)
                {
                    foreach (DataRow dr in ds.Rows)
                    {
                        emp_exp_con.Add(new empexp_cn()
                        {
                            cn_id = dr["country_id"].ToString(),
                            cn_name = dr["country_name"].ToString()
                        });
                    }
                }
            }
            catch (Exception ex)
            {
            }
            return emp_exp_con;
        }

        [WebMethod(EnableSession = true)]
        public static string expinsert_dtl(string input)
        {
            string s = "";
            ServiceReference1.ServiceClient obj;
            obj = new ServiceReference1.ServiceClient();
            DataTable ds = new DataTable();
            ds = obj.proc_hrm_common_select("44","81", input);
            if (ds.Rows.Count > 0)
            {
                s = ds.Rows[0][0].ToString();
            }
            return s;
        }

    

        public class prev_exp
         {
             public string emp_code { get; set; }
             public string emp_name { get; set; }
         }
         public static List<prev_exp> emp_prev_exp { get; set; }
         [WebMethod(EnableSession = true)]
         public static List<prev_exp> prev_exp_dtl(string input)
         {
             

             ServiceReference1.ServiceClient obj;
             List<prev_exp> emp_prev_exp = new List<prev_exp>();
             obj = new ServiceReference1.ServiceClient();
             DataTable ds = new DataTable();
           //  ds = obj.getdata("90", "0");
             ds = obj.proc_hrm_common_select("44","81", input);
             try
             {
                 if (ds.Rows.Count > 0)
                 {
                     foreach (DataRow dr in ds.Rows)
                     {
                         emp_prev_exp.Add(new prev_exp()
                         {
                             emp_code = dr["EMP_CODE"].ToString(),
                             emp_name = dr["EMP_NAME"].ToString()
                         });
                     }
                 }
             }
             catch (Exception ex)
             {
             }
             return emp_prev_exp;
         }

         [WebMethod(EnableSession = true)]
         public static string get_form(string input)
         {
             string s = "";
             ServiceReference1.ServiceClient obj = new ServiceReference1.ServiceClient();

             DataTable ds = new DataTable();

             System.Net.ServicePointManager.SecurityProtocol = System.Net.SecurityProtocolType.Tls | System.Net.SecurityProtocolType.Tls11 | System.Net.SecurityProtocolType.Tls12;

             ds = obj.proc_hrm_common_select("44", "78", input);
             if (ds.Rows.Count > 0)
             {


                 s = ds.Rows[0][0].ToString();
             }

             return s;
         }
         ////exp return
         //[WebMethod(EnableSession = true)]
         //public static string get_exp_dtl(string input)
         //{
         //    string s = "";
         //    ServiceReference1.ServiceClient obj;
         //    obj = new ServiceReference1.ServiceClient();
         //    DataTable ds = new DataTable();
         //    ds = obj.proc_hrm_common_select("44","82", input);
         //    if (ds.Rows.Count > 0)
         //    {
         //        s = ds.Rows[0][0].ToString();
         //    }

         //    return s;
         //}
         public class get_exp_data
         {
             public string emp_cde { get; set; }
             public string orgname { get; set; }
             public string orgdesi { get; set; }
             public string orggrade { get; set; }
             public string orgAddr { get; set; }
             public string country { get; set; }
             public string org_ttpe { get; set; }
             public string period_frm { get; set; }
             public string period_to { get; set; }
             public string Remarks { get; set; }
         }

         [WebMethod(EnableSession = true)]

         public static List<get_exp_data> get_exp_dtl2(string input)
         {
             ServiceReference1.ServiceClient obj;
             List<get_exp_data> emp_exp_con = new List<get_exp_data>();
             obj = new ServiceReference1.ServiceClient();
             DataTable ds = new DataTable();
             // ds = obj.getdata("36", "0");
             ds = obj.proc_hrm_common_select("44", "82", input);
             try
             {
                 if (ds.Rows.Count > 0)
                 {
                     foreach (DataRow dr in ds.Rows)
                     {
                         emp_exp_con.Add(new get_exp_data()
                         {
                             emp_cde = dr["emp_code"].ToString(),
                             orgname = dr["org_name"].ToString(),
                             orgdesi = dr["org_designation"].ToString(),
                             orggrade = dr["org_grade"].ToString(),
                             orgAddr = dr["org_address"].ToString(),
                             country = dr["country"].ToString(),
                             org_ttpe = dr["org_type"].ToString(),
                             period_frm = dr["period_fromdt"].ToString(),
                             period_to = dr["period_todt"].ToString(),
                             Remarks = dr["remarks"].ToString()
                         });
                     }
                 }
             }
             catch (Exception ex)
             {
             }
             return emp_exp_con;
         }

}
}