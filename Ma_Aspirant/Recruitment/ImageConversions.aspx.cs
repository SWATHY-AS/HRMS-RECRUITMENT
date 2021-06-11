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

    public partial class ImageConversions : System.Web.UI.Page
    {
        
        private string sql, sql1, mcid, mnid, agid, message, mcode;
        
        private StringBuilder hsrt_str = new StringBuilder();
        
        private string imagePath, cp;
        protected void Page_Load(object sender, EventArgs e)
        {
            CreatePhoto();
            candPhoto();
        }
        protected System.Web.UI.HtmlControls.HtmlInputText txt_name;
        private void CreatePhoto()
        {
            try
            {
                
                string imageName = DateTime.Now.ToString("dd-MM-yy hh-mm-ss");
                string imagePath1 = string.Format("~/Captures/{0}.png", imageName);
                cp = this.Server.MapPath(imagePath1);
                imagePath = cp + imageName;
                string strPhoto = Request.Form["imageData"];

                string result = "";

            
                //  Byte[] imgByte = Convert.FromBase64String(InputString);
                ServiceReference1.ServiceClient obj = new ServiceReference1.ServiceClient();
                result = GETAADHARETAILS_ser(strPhoto);
             //   result = obj.GETAADHARETAILS(strPhoto);
                this.Session["emp_data"] = result;
               
            }
            catch (Exception Ex)
            {
                hsrt_str.Append("alert('" + Ex.Message + "');");
                //Request.ClientScript.RegisterClientScriptBlock(this.GetType(), "ret_v", hsrt_str.ToString(), true);
            }
        }


        //candphoto  24 feb 2020
        private void candPhoto()
        {
            try
            {

                string imageName1 = DateTime.Now.ToString("dd-MM-yy hh-mm-ss");
                string imagePath1 = string.Format("~/Captures/{0}.png", imageName1);
                cp = this.Server.MapPath(imagePath1);
                imagePath = cp + imageName1;
                string strPhoto = Request.Form["imageData"];

               // string result = "";


                //  Byte[] imgByte = Convert.FromBase64String(InputString);
            
                //   result = obj.GETAADHARETAILS(strPhoto);
                this.Session["emp_photo"] = strPhoto;

            }
            catch (Exception Ex)
            {
                hsrt_str.Append("alert('" + Ex.Message + "');");
                //Request.ClientScript.RegisterClientScriptBlock(this.GetType(), "ret_v", hsrt_str.ToString(), true);
            }
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

            //HttpWebRequest webRequest = (HttpWebRequest)WebRequest.Create("https://mac.mactech.net.in/qrreadApi/api/QRReader");
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
    }
}
