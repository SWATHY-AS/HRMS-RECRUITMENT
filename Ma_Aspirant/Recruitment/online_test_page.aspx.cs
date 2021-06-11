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
    public partial class online_test_page : System.Web.UI.Page
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
        [WebMethod()]
        public static string insertion_testt(string input)
        {
            //String s;
            ServiceReference1.ServiceClient obj = new ServiceReference1.ServiceClient();
            DataTable ds = new DataTable();
            // dt = obj.getdata("18", pid);
            System.Net.ServicePointManager.SecurityProtocol = System.Net.SecurityProtocolType.Tls | System.Net.SecurityProtocolType.Tls11 | System.Net.SecurityProtocolType.Tls12;

            ds = obj.proc_hrm_common_select("46", "1",input);
            string result = "";
            try
            {
                if (ds.Rows.Count > 0)
                {
                    result = ds.Rows[0][0].ToString();
                }
            }
            catch (Exception ex)
            {

            }

            return result;
        }
        [WebMethod()]
        public static string finish_testt(string input)
        {
            //String s;
            ServiceReference1.ServiceClient obj = new ServiceReference1.ServiceClient();
            DataTable ds = new DataTable();
            // dt = obj.getdata("18", pid);
            System.Net.ServicePointManager.SecurityProtocol = System.Net.SecurityProtocolType.Tls | System.Net.SecurityProtocolType.Tls11 | System.Net.SecurityProtocolType.Tls12;

            ds = obj.proc_hrm_common_select("46", "2", input);
            string result = "";
            try
            {
                if (ds.Rows.Count > 0)
                {
                    result = ds.Rows[0][0].ToString();
                }
            }
            catch (Exception ex)
            {

            }

            return result;
        }
    }

}