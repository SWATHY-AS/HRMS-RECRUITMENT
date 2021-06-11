using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;
using System.Data;
using System.Net.Mail;


using System.IO;

namespace Ma_Aspirant.Recruitment
{
    public partial class Doc_Scanning_HO : System.Web.UI.Page
    {

        static string candcode = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(HttpContext.Current.Session["candcode"] as string))
            {
                Response.Redirect("~/HO_Website/Login_HO.aspx");
            }
            else
            {
                candcode = Session["candcode"].ToString();


                this.txt_session.Text = candcode.ToString();
               // candcode = HttpContext.Current.Session["candcode"].ToString();
            }

            
        }
      
        public class doc1
        {
            public string docid { get; set; }
            public string doc_name { get; set; }
        }
        public class docview
        {
            public string doctyp { get; set; }
            public string docdes { get; set; }
            //public string did { get; set; }
            public string child1 { get; set; }
            //public string cid { get; set; } 
        }
        public class doc2
        {
            public string docid1 { get; set; }
            public string doc_name1 { get; set; }
        }
        public List<docview> cand_doc { get; set; }
        [WebMethod(EnableSession = true)]
        public static List<docview> get_doc_dtl(string input)
        {
            ServiceReference1.ServiceClient obj = new ServiceReference1.ServiceClient();
            List<docview> cand_doc = new List<docview>();
            DataTable ds = new DataTable();
            System.Net.ServicePointManager.SecurityProtocol = System.Net.SecurityProtocolType.Tls | System.Net.SecurityProtocolType.Tls11 | System.Net.SecurityProtocolType.Tls12;

            ds = obj.proc_hrm_common_select("44","33", input);
            try
            {
                if (ds.Rows.Count > 0)
                {
                    foreach (DataRow dr in ds.Rows)
                    {
                        cand_doc.Add(new docview()
                        {
                            doctyp = dr["parent_id"].ToString(),
                            child1 = dr["child_id"].ToString(),
                            docdes = dr["description"].ToString(),

                        });
                    }
                }
            }
            catch (Exception ex)
            {
            }
            return cand_doc;


        }
       
        public List<doc1> docdtl { get; set; }
        [WebMethod(EnableSession = true)]
        public static List<doc1> doc_dtl_view()
        {
            ServiceReference1.ServiceClient obj = new ServiceReference1.ServiceClient();
            List<doc1> docdtl = new List<doc1>();
            DataTable ds = new DataTable();
            System.Net.ServicePointManager.SecurityProtocol = System.Net.SecurityProtocolType.Tls | System.Net.SecurityProtocolType.Tls11 | System.Net.SecurityProtocolType.Tls12;

            ds = obj.proc_hrm_common_select("44","20", "test");
            try
            {
                if (ds.Rows.Count > 0)
                {
                    foreach (DataRow dr in ds.Rows)
                    {
                        docdtl.Add(new doc1()
                        {
                            docid = dr["doc_id"].ToString(),
                            doc_name = dr["doc_type"].ToString()
                        });
                    }
                }
            }
            catch (Exception ex)
            {
            }
            return docdtl;
        }


        [WebMethod(EnableSession = true)]
        public static string doc_parent(string input)
        {
            string s = "";
            ServiceReference1.ServiceClient obj = new ServiceReference1.ServiceClient();
            DataTable ds = new DataTable();
            //  ds = obj.getdata("114", input);
            System.Net.ServicePointManager.SecurityProtocol = System.Net.SecurityProtocolType.Tls | System.Net.SecurityProtocolType.Tls11 | System.Net.SecurityProtocolType.Tls12;

            ds = obj.proc_hrm_common_select("44","30", input);

            if (ds.Rows.Count > 0)
            {
                s = ds.Rows[0][0].ToString();
            }

            return s;
        }

        [WebMethod(EnableSession = true)]
        public static List<doc2> doc_dtl_view1(string input)
        {
            List<doc2> docdtl1 = new List<doc2>();
            ServiceReference1.ServiceClient obj = new ServiceReference1.ServiceClient();
            DataTable ds = new DataTable();
            System.Net.ServicePointManager.SecurityProtocol = System.Net.SecurityProtocolType.Tls | System.Net.SecurityProtocolType.Tls11 | System.Net.SecurityProtocolType.Tls12;

            ds = obj.proc_hrm_common_select("44","31", input);
            try
            {
                if (ds.Rows.Count > 0)
                {
                    foreach (DataRow dr in ds.Rows)
                    {
                        docdtl1.Add(new doc2()
                        {
                            docid1 = dr["doc_id"].ToString(),
                            doc_name1 = dr["doc_type"].ToString()
                        });
                    }
                }
            }
            catch (Exception ex)
            {
            }
            return docdtl1;
        }
        [WebMethod(EnableSession = true)]
        public static string Documents_upload(string input, string upload_file)
        {
            string result = "";

            //  Byte[] imgByte = System.Text.Encoding.UTF8.GetBytes(upload_file);
            string InputString = upload_file.Split(',')[1];
            Byte[] imgByte = Convert.FromBase64String(InputString);
            ServiceReference1.ServiceClient obj = new ServiceReference1.ServiceClient();           
          //  doc1 + "~" + doc2 + "~" + des1 + "~" + d3[0] + "~" + fileName;
           // ds = obj.get_data(32, candcode + "~" + input + "~" + imgByte);
           // result = obj.EnrolDocumentUpload("1", candcode + "~" + input, imgByte);
            System.Net.ServicePointManager.SecurityProtocol = System.Net.SecurityProtocolType.Tls | System.Net.SecurityProtocolType.Tls11 | System.Net.SecurityProtocolType.Tls12;

            result = obj.EnrolDocumentUpload("1", input, imgByte);      
            return result;
        }


        //15 june
        [WebMethod(EnableSession = true)]
        public static string Doc_upload(string input, string upload_file)
        {
            string result = "";

            //  Byte[] imgByte = System.Text.Encoding.UTF8.GetBytes(upload_file);
            string InputString = upload_file.Split(',')[1];
            Byte[] imgByte = Convert.FromBase64String(InputString);
            ServiceReference1.ServiceClient obj = new ServiceReference1.ServiceClient();
            //  doc1 + "~" + doc2 + "~" + des1 + "~" + d3[0] + "~" + fileName;
            // ds = obj.get_data(32, candcode + "~" + input + "~" + imgByte);
            // result = obj.EnrolDocumentUpload("1", candcode + "~" + input, imgByte);
            System.Net.ServicePointManager.SecurityProtocol = System.Net.SecurityProtocolType.Tls | System.Net.SecurityProtocolType.Tls11 | System.Net.SecurityProtocolType.Tls12;

            result = obj.EnrolDocumentUpload("1", input, imgByte);
            return result;
        }


        //27 may change

        public class docview1
        {

            public string did { get; set; }
            public string cid { get; set; }
            public string des { get; set; }
            public string parent { get; set; }
            public string child { get; set; }
            public string seqid { get; set; }
        }
        public List<docview1> emp_doc { get; set; }
        [WebMethod(EnableSession = true)]
        public static List<docview1> get_doc_dtl_view(string input)
        {

            List<docview1> emp_doc = new List<docview1>();
            ServiceReference1.ServiceClient obj = new ServiceReference1.ServiceClient();
            DataTable ds = new DataTable();
            System.Net.ServicePointManager.SecurityProtocol = System.Net.SecurityProtocolType.Tls | System.Net.SecurityProtocolType.Tls11 | System.Net.SecurityProtocolType.Tls12;

            ds = obj.proc_hrm_common_select("44","33", input);
            try
            {
                if (ds.Rows.Count > 0)
                {
                    foreach (DataRow dr in ds.Rows)
                    {
                        emp_doc.Add(new docview1()
                        {
                            parent = dr["parent_id"].ToString(),
                            child = dr["child_id"].ToString(),
                            des = dr["description"].ToString(),
                            did = dr["docid"].ToString(),
                            cid = dr["chid"].ToString(),
                            seqid = dr["doc_seq_no"].ToString(),
                            // NO_OF_ATTEMPT1 = dr["NO_OF_ATTEMPT"].ToString(),
                        });
                    }
                }
            }
            catch (Exception ex)
            {
            }
            return emp_doc;


        }

        [WebMethod(EnableSession = true)]
        public static string Documents_download(string input)
        {
            byte[] s;
            ServiceReference1.ServiceClient obj = new ServiceReference1.ServiceClient();
            DataTable ds = new DataTable();
            System.Net.ServicePointManager.SecurityProtocol = System.Net.SecurityProtocolType.Tls | System.Net.SecurityProtocolType.Tls11 | System.Net.SecurityProtocolType.Tls12;

            ds = obj.proc_hrm_common_select("44","34", input);
            string DocFileName = ds.Rows[0][1].ToString();
            if (ds.Rows.Count > 0)
            {
                if ((ds.Rows[0][0].ToString()) != "")
                {
                    s = (byte[])(ds.Rows[0][0]);
                    string ct = ds.Rows[0][2].ToString();
                    BH_Verify d = new BH_Verify();
                    d.DownloadFile(DocFileName, s, ct);
                }



            }
            return DocFileName;
        }

        public void DownloadFile(string fn, byte[] s, string ct)
        {
            string FileName = fn;
            System.Web.HttpResponse Response = System.Web.HttpContext.Current.Response;
            using (Stream file = File.OpenWrite(Server.MapPath("~/Images/" + fn)))
            {
                file.Write(s, 0, s.Length);
            }
        }
        [WebMethod(EnableSession = true)]
        public static string deleteDownloadFile(string input)
        {
            string fname = input;
            Doc_Scanning d = new Doc_Scanning();
            d.fileDelete(fname);
            return "File Deleted Successfully";
        }
        public void fileDelete(string fname)
        {
            System.IO.File.Delete(Server.MapPath("~/Images/" + fname));
        }



        //31may
        [WebMethod(EnableSession = true)]
        public static string get_form(string input)
        {
            string s = "";
            ServiceReference1.ServiceClient obj = new ServiceReference1.ServiceClient();

            DataTable ds = new DataTable();

            System.Net.ServicePointManager.SecurityProtocol = System.Net.SecurityProtocolType.Tls | System.Net.SecurityProtocolType.Tls11 | System.Net.SecurityProtocolType.Tls12;

            ds = obj.proc_hrm_common_select("44","76", input);
            if (ds.Rows.Count > 0)
            {


                s = ds.Rows[0][0].ToString();
            }

            return s;
        }

        //Sandeep
        [WebMethod(EnableSession = true)]
        public static string qual_checking(string input)
        {
            string s = "";
            ServiceReference1.ServiceClient obj = new ServiceReference1.ServiceClient();

            DataTable ds = new DataTable();

            System.Net.ServicePointManager.SecurityProtocol = System.Net.SecurityProtocolType.Tls | System.Net.SecurityProtocolType.Tls11 | System.Net.SecurityProtocolType.Tls12;

            ds = obj.proc_hrm_common_select("44", "79", input);
            if (ds.Rows.Count > 0)
            {


                s = ds.Rows[0][0].ToString();
            }

            return s;
        }

        [WebMethod(EnableSession = true)]
        public static string sendOTPfn_mail(string input)
        
        {
            string s = "", Msg = "";
            string[] qq = input.Split('~');
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
            mail.Body = "Dear  Candiate," + " \r\n\r\n " + qq[1] + "(" + qq[0] + ") we will contact you if you are shortlisted.";
            System.Net.ServicePointManager.SecurityProtocol = System.Net.SecurityProtocolType.Tls | System.Net.SecurityProtocolType.Tls11 | System.Net.SecurityProtocolType.Tls12;
            mail.To.Add(qq[3]);
            DataTable ds = new DataTable();
            ServiceReference1.ServiceClient obj = new ServiceReference1.ServiceClient();
            string data = input;
            //  System.Net.ServicePointManager.SecurityProtocol = System.Net.SecurityProtocolType.Tls | System.Net.SecurityProtocolType.Tls11 | System.Net.SecurityProtocolType.Tls12;
            // ds = obj.proc_hrm_common_select("16", "35", qq[1]);
            mail.IsBodyHtml = false;
            server.Send(mail);
            Msg = "Mail Send";

            return Msg;
        }

        //Sandeep-----------
        [WebMethod(EnableSession = true)]
        public static string Get_Emp_detail(string input)
        {
            string s = "";
            ServiceReference1.ServiceClient obj = new ServiceReference1.ServiceClient();
            DataTable ds = new DataTable();
            //  ds = obj.getdata("114", input);
            System.Net.ServicePointManager.SecurityProtocol = System.Net.SecurityProtocolType.Tls | System.Net.SecurityProtocolType.Tls11 | System.Net.SecurityProtocolType.Tls12;

            ds = obj.proc_hrm_common_select("44", "73", input);

            if (ds.Rows.Count > 0)
            {     ///Can code                       Can_Name                              cont_num                          email
                s = ds.Rows[0][0].ToString() + '~' + ds.Rows[0][1].ToString() + '~' + ds.Rows[0][17].ToString() + '~' + ds.Rows[0][40].ToString();

            }

            return s;
        }
        [WebMethod(EnableSession = true)]
        public static string sendsms_maill(string input, string numb)
        {
            DataTable ds, ds1 = new DataTable();
            ServiceReference1.ServiceClient obj = new ServiceReference1.ServiceClient();

            solution_infini_flag.mana.SMSTool sms = new solution_infini_flag.mana.SMSTool();//solution ifini to send and resend otp

            sms.ser_flag = 0;


            sms.Message = "Hi " + input + ", Thank you for applying to Manappuram Job Portal. we will contact you if you are shortlisted.";
            // ds = obj.get_data(23, code + '~' + br);
            long vOut = (long)Convert.ToDouble(numb != "" ? numb : "0"); //candidate contact number
            sms.mobileNumber = vOut;
            // sms.account_id = 3;
            sms.account_id = 3;
            string msgid = sms.SendSms(); // msg to candidate
            // string res1 = ds.Rows[0][0].ToString();      
            return "Okay";
        }

        //    //31






        //    //---------------26may2020 start
        //    //string s = ds1.Rows[0][3].ToString();
        //    string s = email;
        //    if (s != "0")
        //    {
        //        SmtpClient server = new SmtpClient("smtp.office365.com");
        //        server.Port = 587;
        //        server.EnableSsl = true;
        //        server.UseDefaultCredentials = false;
        //        //server.Credentials = new System.Net.NetworkCredential("55323@manappuram.com", "Winter123*", "smtp.office365.com"); 
        //        server.Credentials = new System.Net.NetworkCredential("hralerts@manappuram.com", "BR$234%t", "smtp.office365.com");
        //        server.Timeout = 5000;
        //        server.TargetName = "STARTTLS/smtp.office365.com";
        //        server.DeliveryMethod = SmtpDeliveryMethod.Network;
        //        MailMessage mail = new MailMessage();
        //        mail.From = new MailAddress("hralerts@manappuram.com");
        //        //  ----------------------------------------------mail body creation----------------------------------------------
        //        mail.Subject = " Manappuram Recruitment";
        //        mail.IsBodyHtml = false;
        //        //  mail.Body = "Dear  " + name + "," + " \r\n\r\n  Your Interview scheduled at Manappuram Branch " + brname + " on " + date + " at" + time + ". \r\n Please use application number " + code + " to login to our site https://online.manappuram.com/Recruitment/Login.aspx and  \r\n complete the shortlisting process (upload documents,add personal and qualification details) and bring all mandatory documents you uploaded in the website.\r\n   Documents :\r\nQualification Certificate,Pancard,Aadhar Card,Bank PassBook,Voter ID,Address Proof";
        //        mail.Body = "Dear  Candidate, \r\n\r\n Thank you for applying to Manappuram Job Portal.Your Application ID is" + code + " . \r\n\r\n Kindly login to our site and fill the details  https://online.manappuram.com/Recruitment/Login.aspx";

        //        mail.To.Add(s);
        //        mail.IsBodyHtml = false;
        //        server.Send(mail);
        //        string Msg = "Mail and SMS Send successfully";
        //        // return Msg;
        //        return "SUCCESS";
        //    }
        //    else
        //    {
        //        return "SUCCESS";
        //    }


        //}
        


    }
}