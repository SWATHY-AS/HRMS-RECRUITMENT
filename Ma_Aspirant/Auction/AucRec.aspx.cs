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

namespace Ma_Aspirant.Auction
{
    public partial class AucRec : System.Web.UI.Page
    {
        //sefef

        static string tr = "", br = "", qu = "";
        ServiceReference1.ServiceClient obj = new ServiceReference1.ServiceClient();
        static string pass;
        private static object id;
        private static object name;

        protected void Page_Load(object sender, EventArgs e)
        {

        }


        public class qual
        {
            public string qid { get; set; }
            public string q_name { get; set; }
        }
        public class univ
        {
            public string uid { get; set; }
            public string u_name { get; set; }
        }

        public class brDtls
        {
            public string bid { get; set; }
            public string bname { get; set; }
        }

        //string indata
        [WebMethod(EnableSession = true)]
        public static List<brDtls> GetBranches(string indata)
        {
            ServiceReference1.ServiceClient objbr = new ServiceReference1.ServiceClient();
            List<brDtls> brdtls = new List<brDtls>();
            DataTable dt = new DataTable();            
            dt = objbr.get_data(71, indata);          
         

            if (dt.Rows.Count > 0)
            {
                foreach (DataRow dr in dt.Rows)
                {
                    brdtls.Add(new brDtls()
                    {
                        bid = dr[0].ToString(),
                        bname = dr[1].ToString()
                    });
                }
            }
            return brdtls;
        }



        [WebMethod(EnableSession = true)]
        public static string GetVotedetails(string ID, string post)
        {
            string reslt;
            ServiceReference1.ServiceClient obj = new ServiceReference1.ServiceClient();
            //  System.Net.ServicePointManager.SecurityProtocol = System.Net.SecurityProtocolType.Tls | System.Net.SecurityProtocolType.Tls11 | System.Net.SecurityProtocolType.Tls12;

            // string reslt = obj.GETVOTDETAILS(ID);
            reslt = GETVOTDETAILS_ser(ID);
            //05 mar 2020  age checking
            if (reslt == "FAILED")
            { return reslt; }
            else
            {
                string s = "";
                ServiceReference1.ServiceClient obj1 = new ServiceReference1.ServiceClient();

                DataTable ds = new DataTable();
                System.Net.ServicePointManager.SecurityProtocol = System.Net.SecurityProtocolType.Tls | System.Net.SecurityProtocolType.Tls11 | System.Net.SecurityProtocolType.Tls12;
                //array1[0].ToString() + "~" + array1[1].ToString() + "~" + array1[2].ToString() + "~" + array1[3].ToString() + "~" + array1[4].ToString() + "~" + array1[5].ToString() + "~" + array1[6].ToString() + "~" + array1[7].ToString() + "~" + array1[8].ToString() + "~" + array1[9].ToString();
                string[] qq = reslt.Split('~');
                string age = qq[7] + 'µ' + post;
                ds = obj1.proc_hrm_common_select("15", "33", age);

                if (ds.Rows.Count > 0)
                {
                    s = ds.Rows[0][0].ToString();
                }
                if (s == "111")
                {
                    return s + 'µ' + reslt;
                }
                else { return s; }
            }

        }
        [WebMethod(EnableSession = true)]
        public static string GetPandetails_name(string ID)
        {
            ServiceReference1.ServiceClient obj = new ServiceReference1.ServiceClient();

            string reslt = GETPANDETAILS_ser(ID);

            // return bb;
            char[] delimiterChars = { '"', '~' };

            string[] words = reslt.Split(delimiterChars);

            int i = words.Length;


            if (i <= 10)
            {
                //change  needed    27 feb2020
                //string bb = words[3];
                string bb = words[1] + " " + words[3];

                return bb;
            }
            else
            {
                //string bb = words[4] + " " + words[10];
                string bb = words[3] + " " + words[9];

                return bb;
            }

        }
        [WebMethod(EnableSession = true)]
        public static string GetBankdetails_name(string no, string ifsc)
        {
            ServiceReference1.ServiceClient obj = new ServiceReference1.ServiceClient();

            string reslt = GETACCOUNTDETAILS_ser(no, ifsc);
            char[] delimiterChars = { '"', '~' };
            string[] words = reslt.Split(delimiterChars);
            string bb = words[0];
            return bb;
        }

        [WebMethod(EnableSession = true)]
        public static double GetBankdetails(string no, string ifsc, string source)
        {
            double result14 = 0.0;
            char[] delimiterChars = { '"', '~' };
            ServiceReference1.ServiceClient obj = new ServiceReference1.ServiceClient();
            System.Net.ServicePointManager.SecurityProtocol = System.Net.SecurityProtocolType.Tls | System.Net.SecurityProtocolType.Tls11 | System.Net.SecurityProtocolType.Tls12;

            //      string reslt = obj.GETACCOUNTDETAILS(no, ifsc);
            string reslt = GETACCOUNTDETAILS_ser(no, ifsc);
            string[] words = reslt.Split(delimiterChars);
            if (words[0].ToString() == "INVALID")
            { return result14; }
            string bb = words[0];
            result14 = CalculateSimilarity(source, bb);
            return result14;
        }
        [WebMethod(EnableSession = true)]
        public static double GetPandetails(string ID, string source)
        {
            double result14 = 0.0;
            char[] delimiterChars = { '"', '~' };
            ServiceReference1.ServiceClient obj = new ServiceReference1.ServiceClient();
            System.Net.ServicePointManager.SecurityProtocol = System.Net.SecurityProtocolType.Tls | System.Net.SecurityProtocolType.Tls11 | System.Net.SecurityProtocolType.Tls12;

            // string reslt = obj.GETPANDETAILS(ID);
            string reslt = GETPANDETAILS_ser(ID);
            string[] words = reslt.Split(delimiterChars);

            int i = words.Length;

            if (words[0].ToString() == "INVALID")
            { return result14; }
            if (i <= 10)
            {
                //   string bb = words[4];
                string bb = words[3];
                result14 = CalculateSimilarity(source, bb);
                string vv = result14 + "¬" + bb;
                // return result14+"¬"+bb;
                return result14;
            }
            else
            {
                //string bb = words[4] + " " + words[10];
                string bb = words[3] + " " + words[9];
                result14 = CalculateSimilarity(source, bb);
                return result14;
            }
        }
        //pan verification



        // 5 "last_name": "SWATHY",
        //  6 "first_name": "ARAKAMPARAMBIL",
        //7  "middle_name": "SASI",
        //  "pan_holder_title": "Kumari",
        //  "pan_last_updated": "17/08/2017"


        //"\"VALID\"~\"CYRIAC\"~\"26/04/2019\"~\"CHERUPUSHPAM\""
        //"VALID"~"RAVEENDRAN NAIR"~"06/07/2018"~"RETHEESH"
        //"VALID"~"JITHIN"~"30/07/2017"~null
        //"VALID"~"UNNIKRISHNAN"~"18/12/2018"~"KRISHNAPRIYA"
        //"\"VALID\"~\"SWATHY\"~\"17/08/2017\"~\"ARAKAMPARAMBIL\""

        public static double CalculateSimilarity(string source, string target)
        {
            if ((source == null) || (target == null)) return 0.0;
            if ((source.Length == 0) || (target.Length == 0)) return 0.0;
            if (source == target) return 1.0 * 100;

            int stepsToSame = ComputeLevenshteinDistance(source, target);
            return (1.0 - ((double)stepsToSame / (double)Math.Max(source.Length, target.Length))) * 100;
        }
        public static int ComputeLevenshteinDistance(string source, string target)
        {
            if ((source == null) || (target == null)) return 0;
            if ((source.Length == 0) || (target.Length == 0)) return 0;
            if (source == target) return source.Length;

            int sourceWordCount = source.Length;
            int targetWordCount = target.Length;

            // Step 1
            if (sourceWordCount == 0)
                return targetWordCount;

            if (targetWordCount == 0)
                return sourceWordCount;

            int[,] distance = new int[sourceWordCount + 1, targetWordCount + 1];

            // Step 2
            for (int i = 0; i <= sourceWordCount; distance[i, 0] = i++) ;
            for (int j = 0; j <= targetWordCount; distance[0, j] = j++) ;

            for (int i = 1; i <= sourceWordCount; i++)
            {
                for (int j = 1; j <= targetWordCount; j++)
                {
                    // Step 3
                    int cost = (target[j - 1] == source[i - 1]) ? 0 : 1;

                    // Step 4
                    distance[i, j] = Math.Min(Math.Min(distance[i - 1, j] + 1, distance[i, j - 1] + 1), distance[i - 1, j - 1] + cost);
                }
            }

            return distance[sourceWordCount, targetWordCount];
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
        public static List<qual> qual_dtl(string qid, string tp)
        {
            ServiceReference1.ServiceClient obj = new ServiceReference1.ServiceClient();
            List<qual> quainfo = new List<qual>();
            DataTable ds = new DataTable();

            try
            {
                if (tp == "1")
                {
                    System.Net.ServicePointManager.SecurityProtocol = System.Net.SecurityProtocolType.Tls | System.Net.SecurityProtocolType.Tls11 | System.Net.SecurityProtocolType.Tls12;

                    ds = obj.get_data(7, qid);
                    if (ds.Rows.Count > 0)
                    {
                        foreach (DataRow dr in ds.Rows)
                        {
                            quainfo.Add(new qual()
                            {
                                qid = dr["q_id"].ToString(),
                                q_name = dr["q_name"].ToString()
                            });
                        }
                    }
                }
                else
                {

                    for (int i = 1; i <= 2; i++)
                    {

                        if (i == 1)
                        {
                            quainfo.Add(new qual()
                            {
                                qid = "18",
                                q_name = "MATRICULATION"

                            });
                        }
                        else
                        {
                            quainfo.Add(new qual()
                            {
                                qid = "24",
                                q_name = "PLUS TWO"

                            });
                        }

                    }


                }

            }
            catch (Exception ex)
            {
            }
            return quainfo;
        }

        [WebMethod(EnableSession = true)]
        public static List<univ> uni_dtl()
        {
            ServiceReference1.ServiceClient obj = new ServiceReference1.ServiceClient();
            List<univ> uniinfo = new List<univ>();

            DataTable ds = new DataTable();
            //    ds = obj.getdata("10", cid);
            System.Net.ServicePointManager.SecurityProtocol = System.Net.SecurityProtocolType.Tls | System.Net.SecurityProtocolType.Tls11 | System.Net.SecurityProtocolType.Tls12;

            ds = obj.get_data(16, "0");
            try
            {
                if (ds.Rows.Count > 0)
                {
                    foreach (DataRow dr in ds.Rows)
                    {
                        uniinfo.Add(new univ()
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
            return uniinfo;
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
        public static string shortlist(string data)
        {
            DataTable ds = new DataTable();
            ServiceReference1.ServiceClient obj = new ServiceReference1.ServiceClient();

            System.Net.ServicePointManager.SecurityProtocol = System.Net.SecurityProtocolType.Tls | System.Net.SecurityProtocolType.Tls11 | System.Net.SecurityProtocolType.Tls12;

            ds = obj.get_data(70, data);//Insert auctioneer data

            if (ds.Rows.Count > 0)
            { 
            string res1 = ds.Rows[0][0].ToString();          

            return res1;
        }
        else{
                return "333";
        }

           

        }
        [WebMethod()]
        public static string sendsms_mail(string name, string numb, string code, string br)

        {
            DataTable ds, ds1 = new DataTable();
            ServiceReference1.ServiceClient obj = new ServiceReference1.ServiceClient();
            //solution_infini_flag.mana.SMSTool sms = new solution_infini_flag.mana.SMSTool();//solution ifini to send sms
            //  solution_infini_flag.mana.SMSTool sms1 = new solution_infini_flag.mana.SMSTool();//solution ifini to send sms
            //solution_infini_flag.mana.SMSTool smsbh = new solution_infini_flag.mana.SMSTool();//solution ifini to send sms

            sinfini_Manappuramhr.mana.SMSTool sms = new sinfini_Manappuramhr.mana.SMSTool();
            sinfini_Manappuramhr.mana.SMSTool sms1 = new sinfini_Manappuramhr.mana.SMSTool();
            sinfini_Manappuramhr.mana.SMSTool smsbh = new sinfini_Manappuramhr.mana.SMSTool();

            //  sms.ser_flag = 0;

            sms.Message = "Hi " + name + ", Thank you for applying to Manappuram Job Portal. if you are shortlisted we will inform you through this contact number.";// Your Application ID is"+ code;
                                                                                                                                                                     // ds = obj.get_data(23, code + '~' + br);

            // string res1 = ds.Rows[0][0].ToString();

            //     sms1.Message = "Please use the recieved code to login to our site 10.0.0.111/Recruitment/Login.aspx and complete the shortlisting process.";
            smsbh.Message = "Notification to schedule an Interview. Please visit the website!!";
            System.Net.ServicePointManager.SecurityProtocol = System.Net.SecurityProtocolType.Tls | System.Net.SecurityProtocolType.Tls11 | System.Net.SecurityProtocolType.Tls12;

            ds1 = obj.get_data(25, br);
            string bhno = ds1.Rows[0][0].ToString();
            long vOut1 = (long)Convert.ToDouble(bhno != "" ? bhno : "0");  //BH Contact number              
            long vOut = (long)Convert.ToDouble(numb != "" ? numb : "0"); //candidate contact number
            sms.mobileNumber = vOut;
            // sms.account_id = 3;
            string msgid = sms.SendSms(); // msg to candidate
                                          //  // sms1.mobileNumber = vOut;
                                          ////   sms1.account_id = 3;
                                          // //  string msgid1 = sms1.SendSms();
            smsbh.mobileNumber = vOut1;
            // smsbh.account_id = 3;
            string msgid2 = smsbh.SendSms(); // bh
            return "SUCCESS";


        }
        [WebMethod(EnableSession = true)]
        public static string Documents_upload(string upload_file, string post)
        {

            //  Byte[] imgByte = System.Text.Encoding.UTF8.GetBytes(upload_file);




            string result = "";

            //  Byte[] imgByte = System.Text.Encoding.UTF8.GetBytes(upload_file);
            string InputString = upload_file.Split(',')[1];
            //  Byte[] imgByte = Convert.FromBase64String(InputString);
            ServiceReference1.ServiceClient obj = new ServiceReference1.ServiceClient();
            System.Net.ServicePointManager.SecurityProtocol = System.Net.SecurityProtocolType.Tls | System.Net.SecurityProtocolType.Tls11 | System.Net.SecurityProtocolType.Tls12;

            //   result = obj.GETAADHARETAILS(InputString);
            result = GETAADHARETAILS_ser(InputString);
            //  741407430450~Resika V K~F~30/05/1990~D/O: Karthikeyan~Vengali House~Peringottukara~Kizhakkummuri~Kilakkummuri~Thrissur~Kerala~680571

            //  return result;





            if (result == "FAILED")
            { return result; }
            else
            {
                string s = "";
                ServiceReference1.ServiceClient obj1 = new ServiceReference1.ServiceClient();

                DataTable ds = new DataTable();
                System.Net.ServicePointManager.SecurityProtocol = System.Net.SecurityProtocolType.Tls | System.Net.SecurityProtocolType.Tls11 | System.Net.SecurityProtocolType.Tls12;
                //array1[0].ToString() + "~" + array1[1].ToString() + "~" + array1[2].ToString() + "~" + array1[3].ToString() + "~" + array1[4].ToString() + "~" + array1[5].ToString() + "~" + array1[6].ToString() + "~" + array1[7].ToString() + "~" + array1[8].ToString() + "~" + array1[9].ToString();
                string[] qq = result.Split('~');
                string age = qq[3] + 'µ' + post;
                ds = obj1.proc_hrm_common_select("15", "33", age);

                if (ds.Rows.Count > 0)
                {
                    s = ds.Rows[0][0].ToString();
                }
                if (s == "111")
                {
                    return s + 'µ' + result;
                }
                else { return s; }
            }
        }

        [WebMethod(EnableSession = true)]
        public static string upload()
        {
            string result = HttpContext.Current.Session["emp_data"].ToString();


            return result;
        }


        [WebMethod(EnableSession = true)]
        //string input, string image
        public static string doc_upload(string input, string image)
        {
            string result = "";
           // input = "10006µ"+ input.Split('µ')[1].ToString();
            ServiceReference1.ServiceClient obj = new ServiceReference1.ServiceClient();
            try
            {
                string imageName1 = DateTime.Now.ToString("dd-MM-yy hh-mm-ss");
                string emp = input + imageName1;
                string InputString = image.Split(',')[1];

                byte[] imgByte = Convert.FromBase64String(InputString);
                System.Net.ServicePointManager.SecurityProtocol = System.Net.SecurityProtocolType.Tls | System.Net.SecurityProtocolType.Tls11 | System.Net.SecurityProtocolType.Tls12;

                result = obj.EnrolDocumentUpload("3", input, imgByte);
                return result;
            }
            catch(Exception ex){
                return "sd";
            }
        }


        [WebMethod(EnableSession = true)]
        public static string pan_valid(string input)
        {
            //String s;

            DataTable ds = new DataTable();
            ServiceReference1.ServiceClient obj = new ServiceReference1.ServiceClient();
            // string data = number + '~' + pass;
            System.Net.ServicePointManager.SecurityProtocol = System.Net.SecurityProtocolType.Tls | System.Net.SecurityProtocolType.Tls11 | System.Net.SecurityProtocolType.Tls12;

            ds = obj.get_data(56, input);


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





        //-------------------new change
        public static string GETAADHARETAILS_ser(string image)
        {
            Dictionary<string, string> parameters = new Dictionary<string, string>();

            parameters.Add("image", image);
            //parameters.Add("consent", "Y");
            //parameters.Add("consent_text", "I hereby authorize to give my ID Proof details to MAFIL");
            //parameters.Add("firmId", "1");
            //parameters.Add("empId", "335123");


            string postData = JSONConvert.encode(parameters);
            //MessageBox.Show (this.merchantKey);
            // string checksum = CheckSum.generateCheckSumByJson("kLd@Qx6eq9aL7FqO", postData);
            //MessageBox.Show(postData);

            ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls12 | SecurityProtocolType.Tls11 | SecurityProtocolType.Tls | SecurityProtocolType.Ssl3;

            //   HttpWebRequest webRequest = (HttpWebRequest)WebRequest.Create("https://mac.mactech.net.in/qrreadApi/api/QRReader");
            HttpWebRequest webRequest = (HttpWebRequest)WebRequest.Create(" https://unsecurepl.manappuram.com/qrreadApi/api/QRReader");


            webRequest.Method = "POST";
            webRequest.ContentType = "application/json-patch+json";


            webRequest.ContentLength = postData.Length;
            webRequest.Proxy = WebRequest.DefaultWebProxy;
            webRequest.Credentials = System.Net.CredentialCache.DefaultCredentials; ;
            webRequest.Proxy.Credentials = System.Net.CredentialCache.DefaultCredentials;

            using (StreamWriter requestWriter2 = new StreamWriter(webRequest.GetRequestStream()))
            {
                requestWriter2.Write(postData);
            }
            HttpWebResponse webresponse = (HttpWebResponse)webRequest.GetResponse();
            Encoding enc = System.Text.Encoding.GetEncoding("utf-8");
            StreamReader loResponseStream = new StreamReader(webresponse.GetResponseStream(), enc);
            String strResult = loResponseStream.ReadToEnd();

            dynamic rs = JObject.Parse(strResult);
            // List<JToken> data = rs.Children().ToList;

            //{
            //  "qrDetails": [
            //    "<?xml version=\"1.0\" encoding=\"UTF-8\"?> <PrintLetterBarcodeData uid=\"741407430450\" name=\"Resika V K\" gender=\"F\" yob=\"1990\" co=\"D/O: Karthikeyan\" house=\"Vengali House\" loc=\"Peringottukara\" vtc=\"Kizhakkummuri\" po=\"Kilakkummuri\" dist=\"Thrissur\" subdist=\"Thrissur\" state=\"Kerala\" pc=\"680571\" dob=\"30/05/1990\"/>"
            //  ],
            //  "flag": 1,
            //  "status": "Sucess",
            //  "apiStatus": "Completed",
            //  "responseMsg": "Success"
            //}
            //String[] array1 = new String[12];
            String[] array1 = new String[4];
            array1[0] = rs["status"].ToString();
            array1[1] = rs["apiStatus"].ToString();
            array1[2] = rs["responseMsg"].ToString();
            DataTable dT = new DataTable();
            string sss = array1[2].ToString();

            //  if (array1[2].ToString() == "\"Success\"")
            if (array1[2].ToString() == "Success")
            {


                //"[\r\n  \"<?xml version=\\\"1.0\\\" encoding=\\\"UTF-8\\\"?> <PrintLetterBarcodeData uid=\\\"741407430450\\\" 
                //  name=\\\"Resika V K\\\" gender=\\\"F\\\" yob=\\\"1990\\\" co=\\\"D/O: Karthikeyan\\\" 
                //  house=\\\"Vengali House\\\" loc=\\\"Peringottukara\\\" vtc=\\\"Kizhakkummuri\\\" po=\\\"Kilakkummuri\\\"
                //dist=\\\"Thrissur\\\" subdist=\\\"Thrissur\\\" state=\\\"Kerala\\\" pc=\\\"680571\\\" dob=\\\"30/05/1990\\\"/>\"\r\n]"
                array1[3] = rs["qrDetails"].ToString();


                string[] p = rs["qrDetails"].ToString().Split('[');
                string ss = p[1].ToString().Trim();
                string[] ss1 = ss.ToString().Split(']');
                ss = ss1[0].ToString().TrimEnd();

                // return pageContent;
                XmlDocument xmlDocument = new XmlDocument();
                ss = ss.Replace("\"<", "<");
                ss = ss.Replace(">\"", ">");
                ss = ss.Replace(@"\", string.Empty);
                xmlDocument.LoadXml(ss);
                XmlElement root = xmlDocument.DocumentElement;
                string s1 = root.Attributes["uid"].Value;
                string s2 = root.Attributes["name"].Value;
                string s3 = root.Attributes["gender"].Value;
                string s4 = root.Attributes["dob"].Value;
                string s5 = root.Attributes["co"].Value;
                string s6 = root.Attributes["house"].Value;
                string s7 = root.Attributes["loc"].Value;
                string s8 = root.Attributes["vtc"].Value;
                string s9 = root.Attributes["po"].Value;
                string s10 = root.Attributes["dist"].Value;
                string s11 = root.Attributes["state"].Value;
                string s12 = root.Attributes["pc"].Value;
                return s1 + "~" + s2 + "~" + s3 + "~" + s4 + "~" + s5 + "~" + s6 + "~" + s7 + "~" + s8 + "~" + s9 + "~" + s10 + "~" + s11 + "~" + s12;
            }
            else
            {
                return sss;

            }



        }


        public static string GETVOTDETAILS_ser(string epic_no)
        {
            Dictionary<string, string> parameters = new Dictionary<string, string>();

            parameters.Add("epic_no", epic_no);
            parameters.Add("consent", "Y");
            parameters.Add("consent_text", "I hereby authorize to give my ID Proof details to MAFIL");
            parameters.Add("firmId", "1");
            parameters.Add("empId", "335123");


            string postData = JSONConvert.encode(parameters);
            //MessageBox.Show (this.merchantKey);
            // string checksum = CheckSum.generateCheckSumByJson("kLd@Qx6eq9aL7FqO", postData);
            //MessageBox.Show(postData);

            ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls12 | SecurityProtocolType.Tls11 | SecurityProtocolType.Tls | SecurityProtocolType.Ssl3;

            //  HttpWebRequest webRequest = (HttpWebRequest)WebRequest.Create("https://mac.mactech.net.in/TEST/AadhaarAPI/api/voterid");




            HttpWebRequest webRequest = (HttpWebRequest)WebRequest.Create("https://unsecurepl.manappuram.com/AadhaarAPI/api/voterid");
            webRequest.Method = "POST";
            webRequest.ContentType = "application/json";


            webRequest.ContentLength = postData.Length;
            webRequest.Proxy = WebRequest.DefaultWebProxy;
            webRequest.Credentials = System.Net.CredentialCache.DefaultCredentials; ;
            webRequest.Proxy.Credentials = System.Net.CredentialCache.DefaultCredentials;

            using (StreamWriter requestWriter2 = new StreamWriter(webRequest.GetRequestStream()))
            {
                requestWriter2.Write(postData);
            }
            HttpWebResponse webresponse = (HttpWebResponse)webRequest.GetResponse();
            Encoding enc = System.Text.Encoding.GetEncoding("utf-8");
            StreamReader loResponseStream = new StreamReader(webresponse.GetResponseStream(), enc);
            String strResult = loResponseStream.ReadToEnd();
            dynamic rs = JObject.Parse(strResult);

            String[] array1 = new String[10];
            array1[0] = rs["status"].ToString();
            array1[1] = rs["apiStatus"].ToString();
            array1[2] = rs["responseMsg"].ToString();

            // { "status":"SUCCESS","apiStatus":"COMPLETED","responseMsg":"SUCCESS","data":{ "ps_lat_long":"0.0,0.0","rln_name_v1":"ഉണ്ണികൃഷ്ണന്‍","rln_name_v2":"","rln_name_v3":"","part_no":"46","rln_type":"F","section_no":"2","id":"ZOZ0630970","epic_no":"ZOZ0630970","rln_name":"Unnikrishnan","district":"THRISSUR","last_update":"17-01-2020","state":"Kerala","ac_no":"69","house_no":"1/181 Pallath","ps_name":"S.N. Smaraka U.P.School, Perinjanam","pc_name":"CHALAKUDY","slno_inpart":"25","name":"Krishnapriya","part_name":"S.N. Smaraka U.P.School, Perinjanam Eastern Bldg.Northern portion","dob":"21-05-1996","gender":"F","age":"23","ac_name":"KAIPAMANGALAM","name_v1":"കൃഷ്ണപ്രിയ","st_code":"S11","name_v3":"","name_v2":""},"errorList":null}

            //if (array1[2].ToString() == "\"SUCCESS\"")
            if (array1[2].ToString() == "SUCCESS")

            {
                array1[3] = rs["data"]["name"].ToString();
                array1[4] = rs["data"]["district"].ToString();
                array1[5] = rs["data"]["state"].ToString();
                array1[6] = rs["data"]["house_no"].ToString();
                array1[7] = rs["data"]["dob"].ToString();
                array1[8] = rs["data"]["gender"].ToString();
                array1[9] = rs["data"]["age"].ToString();
                return array1[0].ToString() + "~" + array1[1].ToString() + "~" + array1[2].ToString() + "~" + array1[3].ToString() + "~" + array1[4].ToString() + "~" + array1[5].ToString() + "~" + array1[6].ToString() + "~" + array1[7].ToString() + "~" + array1[8].ToString() + "~" + array1[9].ToString();


            }
            else
            {
                return "FAILED";

            }


        }

        public static string GETPANDETAILS_ser(string pan)
        {
            Dictionary<string, string> parameters = new Dictionary<string, string>();
            string res = "";
            try
            {
                parameters.Add("pan", pan);
                parameters.Add("firmId", "1");
                parameters.Add("empId", "335123");


                string postData = JSONConvert.encode(parameters);
                //MessageBox.Show (this.merchantKey);
                // string checksum = CheckSum.generateCheckSumByJson("kLd@Qx6eq9aL7FqO", postData);
                //MessageBox.Show(postData);

                ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls12 | SecurityProtocolType.Tls11 | SecurityProtocolType.Tls | SecurityProtocolType.Ssl3;
                //     HttpWebRequest webRequest = (HttpWebRequest)WebRequest.Create("https://mac.mactech.net.in/TEST/AadhaarAPI/api/pan");

                HttpWebRequest webRequest = (HttpWebRequest)WebRequest.Create("https://unsecurepl.manappuram.com/AadhaarAPI/api/pan");
                webRequest.Method = "POST";
                webRequest.ContentType = "application/json";


                webRequest.ContentLength = postData.Length;
                webRequest.Proxy = WebRequest.DefaultWebProxy;
                webRequest.Credentials = System.Net.CredentialCache.DefaultCredentials; ;
                webRequest.Proxy.Credentials = System.Net.CredentialCache.DefaultCredentials;

                using (StreamWriter requestWriter2 = new StreamWriter(webRequest.GetRequestStream()))
                {
                    requestWriter2.Write(postData);
                }
                HttpWebResponse webresponse = (HttpWebResponse)webRequest.GetResponse();
                Encoding enc = System.Text.Encoding.GetEncoding("utf-8");
                StreamReader loResponseStream = new StreamReader(webresponse.GetResponseStream(), enc);
                String strResult = loResponseStream.ReadToEnd();
                dynamic rs = JObject.Parse(strResult);

                String[] array1 = new String[10];
                array1[0] = rs["status"].ToString();
                array1[1] = rs["apiStatus"].ToString();
                array1[2] = rs["responseMsg"].ToString();
                // if (array1[2].ToString() == "\"SUCCESS\"")
                if (array1[2].ToString() == "SUCCESS")
                {
                    array1[3] = rs["data"][0]["pan_number"].ToString();
                    array1[4] = rs["data"][0]["pan_status"].ToString();
                    array1[5] = rs["data"][0]["last_name"].ToString();
                    array1[6] = rs["data"][0]["first_name"].ToString();
                    array1[7] = rs["data"][0]["middle_name"].ToString();
                    array1[8] = rs["data"][0]["pan_holder_title"].ToString();
                    array1[9] = rs["data"][0]["pan_last_updated"].ToString();

                    // if (array1[4].ToString() == "\"VALID\"")
                    if (array1[4].ToString() == "VALID")
                    {
                        return array1[4].ToString() + "~" + array1[5].ToString() + "~" + array1[9].ToString() + "~" + array1[6].ToString();


                    }
                    else
                    {
                        return "INVALID!";

                    }
                }
                else
                {
                    return "INVALID";

                }




            }
            catch (Exception e)
            {
                res = e.Message + '~' + e.StackTrace + '~' + e.InnerException + "~" + e.Source + "~" + e.TargetSite;
                return res;
            }


        }

        public static string GETACCOUNTDETAILS_ser(string no, string ifsc)
        {
            Dictionary<string, string> parameters = new Dictionary<string, string>();

            parameters.Add("account", no);
            parameters.Add("ifsc", ifsc);
            parameters.Add("firmId", "1");
            parameters.Add("empId", "335123");


            string postData = JSONConvert.encode(parameters);
            //MessageBox.Show (this.merchantKey);
            // string checksum = CheckSum.generateCheckSumByJson("kLd@Qx6eq9aL7FqO", postData);
            //MessageBox.Show(postData);


            //HttpWebRequest webRequest = (HttpWebRequest)WebRequest.Create("https://mac.mactech.net.in/TEST/AadhaarAPI/api/bank");
            ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls12 | SecurityProtocolType.Tls11 | SecurityProtocolType.Tls | SecurityProtocolType.Ssl3;

            HttpWebRequest webRequest = (HttpWebRequest)WebRequest.Create(" https://unsecurepl.manappuram.com/AadhaarAPI/api/bank");
            webRequest.Method = "POST";
            webRequest.ContentType = "application/json";


            webRequest.ContentLength = postData.Length;
            webRequest.Proxy = WebRequest.DefaultWebProxy;
            webRequest.Credentials = System.Net.CredentialCache.DefaultCredentials; ;
            webRequest.Proxy.Credentials = System.Net.CredentialCache.DefaultCredentials;

            using (StreamWriter requestWriter2 = new StreamWriter(webRequest.GetRequestStream()))
            {
                requestWriter2.Write(postData);
            }
            HttpWebResponse webresponse = (HttpWebResponse)webRequest.GetResponse();
            Encoding enc = System.Text.Encoding.GetEncoding("utf-8");
            StreamReader loResponseStream = new StreamReader(webresponse.GetResponseStream(), enc);
            String strResult = loResponseStream.ReadToEnd();
            dynamic rs = JObject.Parse(strResult);


            String[] array1 = new String[9];
            array1[0] = rs["status"].ToString();
            array1[1] = rs["apiStatus"].ToString();
            array1[2] = rs["responseMsg"].ToString();
            //  if (array1[2].ToString() == "\"SUCCESS\"")
            if (array1[2].ToString() == "SUCCESS")
            {
                array1[3] = rs["data"]["beneName"].ToString();
                array1[4] = rs["data"]["bankRef"].ToString();
                array1[5] = rs["data"]["account"].ToString();

                array1[6] = rs["data"]["ifsc"].ToString();
                array1[7] = rs["data"]["status"].ToString();
                array1[8] = rs["data"]["remark"].ToString();

                // if (array1[7].ToString() == "\"VERIFIED\"")
                if (array1[7].ToString() == "VERIFIED")
                {
                    return array1[3].ToString() + "~" + array1[7].ToString() + "~" + array1[8].ToString();


                }
                else
                {
                    return "INVALID";

                }
            }
            else
            {
                return "INVALID";

            }


        }




        ///mail
        ///


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
            server.Credentials = new System.Net.NetworkCredential("hralerts@manappuram.com", "BR$234%t", "smtp.office365.com");
            server.Timeout = 5000;
            server.TargetName = "STARTTLS/smtp.office365.com";
            server.DeliveryMethod = SmtpDeliveryMethod.Network;
            MailMessage mail = new MailMessage();
            mail.From = new MailAddress("hralerts@manappuram.com");



            //  ----------------------------------------------mail body creation----------------------------------------------

            mail.Subject = " Manappuram Recruitment";
            mail.IsBodyHtml = false;
            mail.Body = "Dear  Candidate," + " \r\n\r\n " + "Otp" + pass;
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



        //sdgfsdg
    }
}