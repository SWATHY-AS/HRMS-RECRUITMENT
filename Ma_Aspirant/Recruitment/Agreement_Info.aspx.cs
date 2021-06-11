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
    public partial class Agreement_Info : System.Web.UI.Page
    {

        static string candcode = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(HttpContext.Current.Session["candcode"] as string))
            {
                Response.Redirect("~/Login.aspx");
            }
            else
            {

                candcode = HttpContext.Current.Session["candcode"].ToString();
            }

        }
        [WebMethod(EnableSession = true)]
        public static string agree_detail()
        {

            string s = "";
            ServiceReference1.ServiceClient obj = new ServiceReference1.ServiceClient();           
            DataTable ds = new DataTable();
            // ds = obj.getdata("133", "0");
            ds = obj.get_data(21, candcode);


            if (ds.Rows.Count > 0)

            {

                s = ds.Rows[0][0].ToString() + "~" + ds.Rows[0][9].ToString() + "~" + ds.Rows[0][10].ToString();
            }
            return s;


        }
        [WebMethod(EnableSession = true)]
        public static string insert_agree(string input)
        {
            string res1="";
            DataTable ds = new DataTable();
            ServiceReference1.ServiceClient obj = new ServiceReference1.ServiceClient();


            ds = obj.get_data(43, candcode+"~"+input);

            if (ds.Rows.Count > 0)
            {
              res1 = ds.Rows[0][0].ToString();
            }
            return res1;
            //if (res1 == "111")
            //{ return "111"; }
            //else { return "000"; }



        }
    }
}