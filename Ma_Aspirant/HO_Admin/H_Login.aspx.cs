using System.Linq;
using System.Web;
using System.Web.UI;
using System.Text;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Security.Cryptography;

using System.Data;
using System.IO;
using System.Web.Services;
using System.Web.Script.Services;
using System;
using System.Web.UI.HtmlControls;
using System.Collections.Generic;

using System.Net.NetworkInformation;

using System.Web.SessionState;
using System.ComponentModel;
using System.Net;
using System.Drawing;
using System.Drawing.Imaging;


namespace Ma_Aspirant
{
    public partial class H_Login : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            //HttpContext.Current.Session["branch_id"] = null;
            //HttpContext.Current.Session["department_id"] = null;
            //HttpContext.Current.Session["post_id"] = null;
            //HttpContext.Current.Session["firm_id"] = null;
            //HttpContext.Current.Session["username"] = null;


        }
        //string Message = "hai";
        //protected void ShowMessage(string Message)
        //{
        //    ScriptManager.RegisterStartupScript(this, this.GetType(), System.Guid.NewGuid().ToString(), "ShowMessage('" + Message + "');", true);
        //}

        [WebMethod]
        public static string loginauth(string username, string password)
        {
          //  ServiceReference3.ServiceClient ob = new ServiceReference3.ServiceClient();

            ServiceReference1.ServiceClient ob = new ServiceReference1.ServiceClient();
            DataTable dt = new DataTable();
            //  string indata = username + '~' + password;
            string indata = username + '~' + password;
            string ID = "", s,bh;

            //string res = obj.testmethod("1", indata);
            System.Net.ServicePointManager.SecurityProtocol = System.Net.SecurityProtocolType.Tls | System.Net.SecurityProtocolType.Tls11 | System.Net.SecurityProtocolType.Tls12;

            s = ob.getdata_login("3", indata);
           // sandeep
           // dt= ob.proc_hrm_common_select("45","3", indata);
            
            DataTable ds = new DataTable();
           


            if (s != null)
            {
                string[] res = s.Split('~');
                int r1 = Convert.ToInt32(res[0]);
                if (r1 == 1)
                {
                    string[] ss = res[1].Split('µ');
                    if (username == ss[4])
                    {
                        // HttpContext.Current.Session["branch_id"] = Convert.ToInt32(res[1]);


                        HttpContext.Current.Session["branch_id"] = Convert.ToInt32(ss[0]);
                        HttpContext.Current.Session["department_id"] = Convert.ToInt32(ss[1]);
                        HttpContext.Current.Session["post_id"] = Convert.ToInt32(ss[2]);
                        HttpContext.Current.Session["firm_id"] = Convert.ToInt32(ss[3]);
                        HttpContext.Current.Session["username"] = ss[4];// username;//Convert.ToInt32(ss[4]);
                        System.Net.ServicePointManager.SecurityProtocol = System.Net.SecurityProtocolType.Tls | System.Net.SecurityProtocolType.Tls11 | System.Net.SecurityProtocolType.Tls12;

                        ds = ob.proc_hrm_common_select("44","69", ss[4]);
                        if (ds.Rows.Count > 0)
                        {
                            s = ds.Rows[0][0].ToString();
                        }
                        if (s == "222")
                        {
                            return "Invalid";
                        }
                        else
                        {
                            return "Valid";
                        }
                    }
                    else { return "Invalid"; }
                }
                else
                {
                    return "Invalid";

                }

            }
            else
            {
                return "Invalid";

            }



        }

    
    }
}