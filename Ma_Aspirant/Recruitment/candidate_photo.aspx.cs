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
using System.Web.Script.Services;
using System.Net.Mail;


namespace Ma_Aspirant.Recruitment
{
    public partial class candidate_photo : System.Web.UI.Page
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

                // candcode = HttpContext.Current.Session["candcode"].ToString();
                candcode = Session["candcode"].ToString();


                this.txt_session.Text = candcode.ToString();
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
       
        //[WebMethod(EnableSession = true)]
        //public static string training_pdf(string input)
        //{
        //    byte[] s;
        //    ServiceReference1.ServiceClient obj = new ServiceReference1.ServiceClient();
        //    DataTable ds = new DataTable();
        //    System.Net.ServicePointManager.SecurityProtocol = System.Net.SecurityProtocolType.Tls | System.Net.SecurityProtocolType.Tls11 | System.Net.SecurityProtocolType.Tls12;

        //    ds = obj.get_data(69, input);
        //    string DocFileName = ds.Rows[0][1].ToString();
        //    if (ds.Rows.Count > 0)
        //    {
        //        if ((ds.Rows[0][0].ToString()) != "")
        //        {
        //            s = (byte[])(ds.Rows[0][0]);
        //            string ct = ds.Rows[0][2].ToString();
        //            candidate_photo d = new candidate_photo();
        //            d.DownloadFile(DocFileName, s, ct);
        //        }



        //    }
        //    return DocFileName;
        //}

       



        [WebMethod(EnableSession = true)]
        public static string training_pdf(string input)
        {
            string s = "";
            ServiceReference1.ServiceClient obj;
            obj = new ServiceReference1.ServiceClient();
            DataTable ds = new DataTable();
            System.Net.ServicePointManager.SecurityProtocol = System.Net.SecurityProtocolType.Tls | System.Net.SecurityProtocolType.Tls11 | System.Net.SecurityProtocolType.Tls12;

            ds = obj.proc_hrm_common_select("16", "35", input);
            //   ds = obj.get_data(30, input);
            if (ds.Rows.Count > 0)
            {
                s = ds.Rows[0][0].ToString();
                string[] qq = s.Split('~');
                if (qq[1] == "111")
                {if(qq[2]!=" ")
                {
                    sendOTPfn_mail(input + '~' + qq[3]+ '~' +qq[2]);
                }
                }
            }
            return s;
        }

        [WebMethod(EnableSession = true)]
        public static string get_form(string input)
        {
            string s = "";
            ServiceReference1.ServiceClient obj = new ServiceReference1.ServiceClient();

            DataTable ds = new DataTable();

            System.Net.ServicePointManager.SecurityProtocol = System.Net.SecurityProtocolType.Tls | System.Net.SecurityProtocolType.Tls11 | System.Net.SecurityProtocolType.Tls12;

            ds = obj.get_data(81, input);
            if (ds.Rows.Count > 0)
            {


                s = ds.Rows[0][0].ToString();
            }

            return s;
        }


        [WebMethod(EnableSession = true)]
        public static string sendOTPfn_mail(string number)
        {
            string s = "", Msg = "";
            string[] qq = number.Split('~');
            // ---------------------------------------------MAIL1 PART----------------------------------------------
            // string msg = retunmsg;
            SmtpClient server = new SmtpClient("smtp.office365.com");
            server.Port = 587;
            server.EnableSsl = true;
            server.UseDefaultCredentials = false;
            //server.Credentials = new System.Net.NetworkCredential("55323@manappuram.com", "Winter123*", "smtp.office365.com"); 
            server.Credentials = new System.Net.NetworkCredential("hralerts@manappuram.com", "BR$234%t", "smtp.office365.com");
            server.Timeout = 5000;
            server.TargetName = "STARTTLS/smtp.office365.com";
            server.DeliveryMethod = SmtpDeliveryMethod.Network;
            MailMessage mail = new MailMessage();
            mail.From = new MailAddress("hralerts@manappuram.com");



            //  ----------------------------------------------mail body creation----------------------------------------------

            mail.Subject = " Manappuram Recruitment";
            mail.IsBodyHtml = false;
            mail.Body = "Dear  BH," + " \r\n\r\n " + qq[1]+"("+qq[0]+") Candidate completed updating his/her details. ";
            System.Net.ServicePointManager.SecurityProtocol = System.Net.SecurityProtocolType.Tls | System.Net.SecurityProtocolType.Tls11 | System.Net.SecurityProtocolType.Tls12;
            mail.To.Add(qq[2]);
            DataTable ds = new DataTable();
            ServiceReference1.ServiceClient obj = new ServiceReference1.ServiceClient();
            string data = number;
          //  System.Net.ServicePointManager.SecurityProtocol = System.Net.SecurityProtocolType.Tls | System.Net.SecurityProtocolType.Tls11 | System.Net.SecurityProtocolType.Tls12;
           // ds = obj.proc_hrm_common_select("16", "35", qq[1]);
                     mail.IsBodyHtml = false;
            server.Send(mail);
            Msg = "Mail Send";

            return Msg;
        }
        [WebMethod(EnableSession = true)]
        public static string test_checking(string input)
        {

            string s = "";
            ServiceReference1.ServiceClient obj;
            obj = new ServiceReference1.ServiceClient();
            DataTable ds = new DataTable();
            //System.Net.ServicePointManager.SecurityProtocol = System.Net.SecurityProtocolType.Tls | System.Net.SecurityProtocolType.Tls11 | System.Net.SecurityProtocolType.Tls12;

            ds = obj.proc_hrm_common_select("46", "3", input);
            //   ds = obj.get_data(30, input);
            if (ds.Rows.Count > 0)
            {
                s = ds.Rows[0][0].ToString();
              
            }
            return s;

        }


    }
}