using Newtonsoft.Json.Linq;
using RecruitmentJSON;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Text;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;

namespace Ma_Aspirant.BA
{
    public partial class BARenew : System.Web.UI.Page
    {
        static string pass;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [WebMethod()]
        public static string checkDetails(string aucid)
        {
            DataTable ds = new DataTable();
            ServiceReference1.ServiceClient obj = new ServiceReference1.ServiceClient();

            System.Net.ServicePointManager.SecurityProtocol = System.Net.SecurityProtocolType.Tls | System.Net.SecurityProtocolType.Tls11 | System.Net.SecurityProtocolType.Tls12;

            ds = obj.get_data(72, aucid);//Check details

            if (ds.Rows.Count > 0)
            {
                string res1 = ds.Rows[0][0].ToString();

                return res1;
            }
            else
            {
                return "666";
            }



        }

        [WebMethod()]
        public static string searchBA(string data)
        {
            DataTable ds = new DataTable();
            ServiceReference1.ServiceClient obj = new ServiceReference1.ServiceClient();
            string res1 = "";
            System.Net.ServicePointManager.SecurityProtocol = System.Net.SecurityProtocolType.Tls | System.Net.SecurityProtocolType.Tls11 | System.Net.SecurityProtocolType.Tls12;
            try
            {
                ds = obj.get_data(80, data);//Get auctioneer data

                if (ds.Rows[0][0].ToString() != "666")
                {
                    if (ds.Rows[0][0].ToString() == "333")
                    {
                        res1 = "333";
                    }
                    else
                    {
                        res1 = ds.Rows[0][0].ToString() + "~" + Convert.ToDateTime(ds.Rows[0][1].ToString()).ToString("dd/MMM/yyyy") + "~" + ds.Rows[0][2].ToString() + "~" + ds.Rows[0][3].ToString() + "~" + ds.Rows[0][4].ToString();
                    }
                    return res1;
                }
                else
                {
                    return "666";
                }
            }
            catch (Exception ex)
            {
                return ex.Message;
            }


        }


        //string input, string image
        //public static string doc_upload(string input, string image)
        //{
        //    string result = "";
        //    DataTable ds = new DataTable();
        //    // input = "10006µ"+ input.Split('µ')[1].ToString();
        //    ServiceReference1.ServiceClient obj = new ServiceReference1.ServiceClient();
        //    try
        //    {

        //        string imageName1 = DateTime.Now.ToString("dd-MM-yy hh-mm-ss");
        //        string emp = input + imageName1;
        //        string InputString = image.Split(',')[1];

        //        byte[] imgByte = Convert.FromBase64String(InputString);
        //        System.Net.ServicePointManager.SecurityProtocol = System.Net.SecurityProtocolType.Tls | System.Net.SecurityProtocolType.Tls11 | System.Net.SecurityProtocolType.Tls12;

        //        result = obj.EnrolDocumentUpload("5", input, imgByte);



        //        return result;
        //    }
        //    catch (Exception ex)
        //    {
        //        return "222";
        //    }
        //}



        [WebMethod()]
        public static string sendotp(string data)
        {
            DataTable ds = new DataTable();
            ServiceReference1.ServiceClient obj = new ServiceReference1.ServiceClient();
            string res1 = "";
            System.Net.ServicePointManager.SecurityProtocol = System.Net.SecurityProtocolType.Tls | System.Net.SecurityProtocolType.Tls11 | System.Net.SecurityProtocolType.Tls12;
            try
            {
                string ba_code = data.Split('µ')[0].ToString();
               // string otp_txt = data.Split('µ')[1].ToString();
                ds = obj.get_data(82, ba_code);
                string ba_mob = ds.Rows[0][0].ToString();
                solution_infini_flag.mana.SMSTool sms = new solution_infini_flag.mana.SMSTool();//solution ifini to send and resend otp

                sms.ser_flag = 0;


                pass = GetRandomStringpass(6);//generate OTP
                                              // pass = "1234";
                HttpContext.Current.Session["otp"] = pass;
                sms.Message = "Dear Sir,Your BA agrement renewal is " + pass + ". DO NOT SHARE WITH ANY ONE";
                sms.mobileNumber = (long)Convert.ToDouble(ba_mob.ToString().Trim());
                sms.account_id = 3;
                string msgid = sms.SendSms();

                return res1;
            }
            catch (Exception ex)
            {
                return ex.Message;
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
        [WebMethod]
        public static string verifyotp(string data)
        {
            DataTable dt = new DataTable();
            ServiceReference1.ServiceClient obj = new ServiceReference1.ServiceClient();
            
            string res1 = "";
            // string data = number + '~' + pass;
            // System.Net.ServicePointManager.SecurityProtocol = System.Net.SecurityProtocolType.Tls | System.Net.SecurityProtocolType.Tls11 | System.Net.SecurityProtocolType.Tls12;
            System.Net.ServicePointManager.SecurityProtocol = System.Net.SecurityProtocolType.Tls | System.Net.SecurityProtocolType.Tls11 | System.Net.SecurityProtocolType.Tls12;
            HttpContext.Current.Session["otp"] = pass;
            string OTP = data.Split('µ')[0].ToString();
            // if (HttpContext.Current.Session["otp"].ToString() == otp.ToString())
            if (pass == OTP)
            {

                dt = obj.get_data(83, data);
                return "Successfully Renewed";
            }

            else
            {
                return "OTP NOT VERIFIED";
            }


        }


    }
}