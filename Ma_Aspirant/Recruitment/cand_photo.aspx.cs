using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;
using System.Data;
using System.Runtime.Serialization;
using System.ServiceModel;
//using System.ServiceModel.Web;
using System.Text;
using System.Net;
using System.IO;
using Newtonsoft.Json.Linq;
using RecruitmentJSON;
using System.Net.Security;
using System.Xml.Linq;
using System.Xml.Serialization;
using System.Xml.XmlConfiguration;
using System.Xml;
using Newtonsoft.Json;
using Newtonsoft.Json.Converters;


namespace Ma_Aspirant.Recruitment
{
    public partial class cand_photo : System.Web.UI.Page
    {
        static string tr = "", br = "", qu = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(HttpContext.Current.Session["type_id"] as string))
            {
                Response.Redirect("~/Opprtunity.aspx");
            }
            else
            {

                tr = HttpContext.Current.Session["type_id"].ToString();
                qu = HttpContext.Current.Session["qual"].ToString();
                this.txt_post.Text = tr.ToString();
                this.txt_qual.Text = qu.ToString();
            }
            if (string.IsNullOrEmpty(HttpContext.Current.Session["branch_id"] as string))
            {
                Response.Redirect("~/Opprtunity.aspx");
            }
            else
            {
                br = HttpContext.Current.Session["branch_id"].ToString();
                this.txt_br.Text = br.ToString();
            }
        }

        [WebMethod(EnableSession = true)]
        public static string Documents_upload(string input, string upload_file)
        {

            //  Byte[] imgByte = System.Text.Encoding.UTF8.GetBytes(upload_file);




            string result = "";

            //  Byte[] imgByte = System.Text.Encoding.UTF8.GetBytes(upload_file);
            string InputString = upload_file.Split(',')[1];
             Byte[] imgByte = Convert.FromBase64String(InputString);
            ServiceReference1.ServiceClient obj = new ServiceReference1.ServiceClient();
            // System.Net.ServicePointManager.SecurityProtocol = System.Net.SecurityProtocolType.Tls | System.Net.SecurityProtocolType.Tls11 | System.Net.SecurityProtocolType.Tls12;
            System.Net.ServicePointManager.SecurityProtocol = System.Net.SecurityProtocolType.Tls | System.Net.SecurityProtocolType.Tls11 | System.Net.SecurityProtocolType.Tls12;

            //   result = obj.GETAADHARETAILS(InputString);
            result = obj.EnrolDocumentUpload("1", input, imgByte);
            return result;
        }


        [WebMethod(EnableSession = true)]
        public static string cam_upload(string input)
        {
            string result = "";
            ServiceReference1.ServiceClient obj = new ServiceReference1.ServiceClient();
            string imageName1 = DateTime.Now.ToString("dd-MM-yy hh-mm-ss");
            string emp = input + imageName1;
            Byte[] imgByte = Convert.FromBase64String(HttpContext.Current.Session["emp_photo"].ToString());
            System.Net.ServicePointManager.SecurityProtocol = System.Net.SecurityProtocolType.Tls | System.Net.SecurityProtocolType.Tls11 | System.Net.SecurityProtocolType.Tls12;

            result = obj.EnrolDocumentUpload("1", input, imgByte);
            return result;
        }

    
    
    }
}