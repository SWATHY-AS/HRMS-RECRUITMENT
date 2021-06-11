using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;
using System.Web.SessionState;
using System.Data;
namespace Ma_Aspirant
{
    public partial class Login_HO : System.Web.UI.Page
    {
        static string pass;
        protected void Page_Load(object sender, EventArgs e)
        {
        }
      
        [WebMethod(EnableSession = true)]
        public static string sendOTPfn(string number)
                    {
           
                string s = "";
                ServiceReference1.ServiceClient obj = new ServiceReference1.ServiceClient();
                DataTable ds = new DataTable();
                var input = number;

                ds = obj.proc_hrm_common_select("44","52", input);
                if (ds.Rows.Count > 0)
                {
                    if (ds.Rows[0][0].ToString() == "111")
                    {

                        solution_infini_flag.mana.SMSTool sms = new solution_infini_flag.mana.SMSTool();//solution ifini to send and resend otp

                        sms.ser_flag = 0;

                    //    pass = "1234";
                        pass = GetRandomStringpass(6);//generate OTP
                        HttpContext.Current.Session["otp"] = pass;


                        sms.Message = "Dear Candidate,Your OTP for Manappuram Portal is " + pass + ". DO NOT SHARE WITH ANY ONE";
                        sms.mobileNumber = (long)Convert.ToDouble(number.ToString().Trim());
                        sms.account_id = 3;
                        string msgid = sms.SendSms();
                        DataTable ds1 = new DataTable();
                        ServiceReference1.ServiceClient obj1 = new ServiceReference1.ServiceClient();
                        string data = number + '~' + pass;
                            System.Net.ServicePointManager.SecurityProtocol = System.Net.SecurityProtocolType.Tls | System.Net.SecurityProtocolType.Tls11 | System.Net.SecurityProtocolType.Tls12;

                        ds1 = obj1.proc_hrm_common_select("44","54", data);
                        return "SUCCESS";
                    }
                    else { return "Please Enter Correct Mobile Number"; }
                }
                else
                {
                    return "Please Enter Correct Mobile Number";
                }
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

        [WebMethod(EnableSession = true)]
        public static string loginauth(string number,string otp,string candcod)
        {
            var data = number + '~' + otp;
            DataTable ds1 = new DataTable();
            ServiceReference1.ServiceClient obj1 = new ServiceReference1.ServiceClient();
            System.Net.ServicePointManager.SecurityProtocol = System.Net.SecurityProtocolType.Tls | System.Net.SecurityProtocolType.Tls11 | System.Net.SecurityProtocolType.Tls12;

            ds1 = obj1.proc_hrm_common_select("44","55", data);
            if (ds1.Rows[0][0].ToString() == "111")
           // string p = HttpContext.Current.Session["otp"].ToString();
           // if (HttpContext.Current.Session["otp"].ToString() == otp.ToString())
            {
                HttpContext.Current.Session["candcode"] = candcod.ToString();
                string s = "";
                ServiceReference1.ServiceClient obj = new ServiceReference1.ServiceClient();
                DataTable ds = new DataTable();
                var input = number + '~' + candcod;
                System.Net.ServicePointManager.SecurityProtocol = System.Net.SecurityProtocolType.Tls | System.Net.SecurityProtocolType.Tls11 | System.Net.SecurityProtocolType.Tls12;

                ds = obj.proc_hrm_common_select("44","51", input);
                if (ds.Rows.Count > 0)
                {
                    if (ds.Rows[0][0].ToString() == "111")
                    {
                        return "Valid";
                    }
                    else
                    {
                        return "InValid";
                    }
                }
                else
                { return "Invalid OTP"; }
            }

               else
            {
                return "Invalid OTP";
            }
           
           
        }



    }
}