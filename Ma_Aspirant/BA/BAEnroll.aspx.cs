using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Ma_Aspirant.BA
{
    public partial class BAEnroll : System.Web.UI.Page
    {
        static string tr = "", br = "", qu = "";

        ServiceReference1.ServiceClient obj = new ServiceReference1.ServiceClient();
        static string pass;
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        public class drpDtls
        {
            public string did { get; set; }
            public string dname { get; set; }
        }

        [WebMethod(EnableSession = true)]
        public static string sendOTPfn(string number)
        {

            solution_infini_flag.mana.SMSTool sms = new solution_infini_flag.mana.SMSTool();//solution ifini to send and resend otp

            sms.ser_flag = 0;


            pass = GetRandomStringpass(6);//generate OTP
                                          // pass = "1234";
            HttpContext.Current.Session["otp"] = pass;
            sms.Message = "Dear Candidate,Your OTP for Manappuram Portal is " + pass + ". DO NOT SHARE WITH ANY ONE";
            sms.mobileNumber = (long)Convert.ToDouble(number.ToString().Trim());
            sms.account_id = 3;
            string msgid = sms.SendSms();
            DataTable ds = new DataTable();
            ServiceReference1.ServiceClient obj = new ServiceReference1.ServiceClient();
            string data = number + '~' + pass;
            System.Net.ServicePointManager.SecurityProtocol = System.Net.SecurityProtocolType.Tls | System.Net.SecurityProtocolType.Tls11 | System.Net.SecurityProtocolType.Tls12;

            ds = obj.get_data(54, data);
            return "SUCCESS";
        }

        [WebMethod]
        public static string GetRandomStringpass(int length)
        {
            string[] array = new string[9]
            {
                "0","1","2","3","4","5","6","8","9"
            };
            System.Text.StringBuilder sb = new System.Text.StringBuilder();
            for (int i = 0; i < length; i++) sb.Append(array[GetRandomNumber(9)]);
            return sb.ToString();
        }

        [WebMethod]
        public static int GetRandomNumber(int maxNumber)
        {
            if (maxNumber < 1)
                throw new System.Exception("The max Number value should be greater than 1");
            byte[] b = new byte[4];
            new System.Security.Cryptography.RNGCryptoServiceProvider().GetBytes(b);
            int seed = (b[0] & 0x7f) << 24 | b[1] << 16 | b[2] << 8 | b[3];
            System.Random r = new System.Random(seed);
            return r.Next(1, maxNumber);
        }
        [WebMethod]
        public static string loginauth(string otp)
        {
            DataTable ds = new DataTable();
            ServiceReference1.ServiceClient obj = new ServiceReference1.ServiceClient();
            // string data = number + '~' + pass;
            // System.Net.ServicePointManager.SecurityProtocol = System.Net.SecurityProtocolType.Tls | System.Net.SecurityProtocolType.Tls11 | System.Net.SecurityProtocolType.Tls12;
            System.Net.ServicePointManager.SecurityProtocol = System.Net.SecurityProtocolType.Tls | System.Net.SecurityProtocolType.Tls11 | System.Net.SecurityProtocolType.Tls12;

            ds = obj.get_data(55, otp);
            // if (HttpContext.Current.Session["otp"].ToString() == otp.ToString())
            if (ds.Rows[0][0].ToString() == "111")
            {
                return "111";
            }

            else
            {
                return "Invalid OTP";
            }


        }

        [WebMethod(EnableSession = true)]
        public static string sendOTPfn_mail(string number)
        {
            string s = "", Msg = "";
            pass = GetRandomStringpass(6);//generate OTP
                                          // pass = "1234";
            HttpContext.Current.Session["otp"] = pass;
            // ---------------------------------------------MAIL1 PART----------------------------------------------
            // string msg = retunmsg;
            SmtpClient server = new SmtpClient("smtp.office365.com");
            server.Port = 587;
            server.EnableSsl = true;
            server.UseDefaultCredentials = false;
            //server.Credentials = new System.Net.NetworkCredential("55323@manappuram.com", "Winter123*", "smtp.office365.com"); 
            server.Credentials = new System.Net.NetworkCredential("bateams@manappuram.com", "RM@789ab", "smtp.office365.com");
            server.Timeout = 5000;
            server.TargetName = "STARTTLS/smtp.office365.com";
            server.DeliveryMethod = SmtpDeliveryMethod.Network;
            MailMessage mail = new MailMessage();
            mail.From = new MailAddress("bateams@manappuram.com");



            //  ----------------------------------------------mail body creation----------------------------------------------

            mail.Subject = " Manappuram BA";
            mail.IsBodyHtml = false;
            mail.Body = "Dear  Sir," + " \r\n\r\n " + "Otp : " + pass;
            System.Net.ServicePointManager.SecurityProtocol = System.Net.SecurityProtocolType.Tls | System.Net.SecurityProtocolType.Tls11 | System.Net.SecurityProtocolType.Tls12;
            mail.To.Add(number);
            DataTable ds = new DataTable();
            ServiceReference1.ServiceClient obj = new ServiceReference1.ServiceClient();
            string data = number + '~' + pass;
            System.Net.ServicePointManager.SecurityProtocol = System.Net.SecurityProtocolType.Tls | System.Net.SecurityProtocolType.Tls11 | System.Net.SecurityProtocolType.Tls12;

            ds = obj.get_data(66, data);
            //}
            //else
            //{
            //    mail.Subject = "Failed";
            //}
            //  mail.Body = "<p style='font-family: Arial;font-size:14px;color:#565656;'>Dear Sir/Madam <br/><br/> " + empcode + " " + empname + ",<br/><br/> employee transfer request processed.Present Hostel not available here. \n Branch Id " + branch_id + " and branch name " + br_name + "<br/><br/>Thanks & Regards,<br/>File Tracking Team<br/>Please do not reply to this email ID as this is an automatically generated email and reply to this ID is not being monitored</p>";
            mail.IsBodyHtml = false;
            server.Send(mail);
            Msg = "Mail Send";

            return Msg;
        }

        [WebMethod]
        public static string loginauth_mail(string otp)
        {
            DataTable ds = new DataTable();
            ServiceReference1.ServiceClient obj = new ServiceReference1.ServiceClient();
            // string data = number + '~' + pass;
            // System.Net.ServicePointManager.SecurityProtocol = System.Net.SecurityProtocolType.Tls | System.Net.SecurityProtocolType.Tls11 | System.Net.SecurityProtocolType.Tls12;
            System.Net.ServicePointManager.SecurityProtocol = System.Net.SecurityProtocolType.Tls | System.Net.SecurityProtocolType.Tls11 | System.Net.SecurityProtocolType.Tls12;

            ds = obj.get_data(67, otp);
            // if (HttpContext.Current.Session["otp"].ToString() == otp.ToString())
            if (ds.Rows[0][0].ToString() == "111")
            {
                return "111";
            }

            else
            {
                return "Invalid OTP";
            }


        }

        [WebMethod(EnableSession = true)]
        public static List<drpDtls> GetDropList(string indata)
        {
            ServiceReference1.ServiceClient objbr = new ServiceReference1.ServiceClient();
            List<drpDtls> brdtls = new List<drpDtls>();
            DataTable dt = new DataTable();
            dt = objbr.get_data(71, indata);


            if (dt.Rows.Count > 0)
            {
                foreach (DataRow dr in dt.Rows)
                {
                    brdtls.Add(new drpDtls()
                    {
                        did = dr[0].ToString(),
                        dname = dr[1].ToString()
                    });
                }
            }
            return brdtls;
        }

        [WebMethod(EnableSession = true)]
        //string input, string image
        public static string BAEnrollment(string input, string image1, string image2, string image3, string image4)
        {
            string result = "";
            DataTable ds = new DataTable();
            // input = "10006µ"+ input.Split('µ')[1].ToString();
            ServiceReference1.ServiceClient obj = new ServiceReference1.ServiceClient();
            try
            {

                string imageName1 = DateTime.Now.ToString("dd-MM-yy hh-mm-ss");
                // string emp = input + imageName1;
                string InputString = image1.Split(',')[1];
                byte[] imgByte = Convert.FromBase64String(InputString);



                string imageName2 = DateTime.Now.ToString("dd-MM-yy hh-mm-ss");
                string InputString1 = image2.Split(',')[1];
                byte[] imgByte1 = Convert.FromBase64String(InputString1);



                string imageName3 = DateTime.Now.ToString("dd-MM-yy hh-mm-ss");
                string InputString2 = image3.Split(',')[1];
                byte[] imgByte2 = Convert.FromBase64String(InputString2);



                string imageName4 = DateTime.Now.ToString("dd-MM-yy hh-mm-ss");
                string InputString3 = image4.Split(',')[1];
                byte[] imgByte3 = Convert.FromBase64String(InputString3);


                System.Net.ServicePointManager.SecurityProtocol = System.Net.SecurityProtocolType.Tls | System.Net.SecurityProtocolType.Tls11 | System.Net.SecurityProtocolType.Tls12;

                //  result = obj.EnrolDocumentUpload("4", input, imgByte);

                result = obj.BAEnrollment("BAEN", input, imgByte, imgByte1, imgByte2, imgByte3);

                return result;
            }
            catch (Exception ex)
            {
                return "222";
            }
        }
    }
}