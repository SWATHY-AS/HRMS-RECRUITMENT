using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.Script.Services;
using System.Net.Mail;


namespace Ma_Aspirant.Recruitment
{
    public partial class BH_notific : System.Web.UI.Page
    {
        static string  ibr = "",usr="";
        protected void Page_Load(object sender, EventArgs e)
        {
          //  if (string.IsNullOrEmpty(Session["branch_id"] as string))
            //if (string.IsNullOrEmpty(Session["branch_id"] as string))
            //{
            //    Response.Redirect("~/BH_Login.aspx");
            //}
            //else
            //{
                usr = Session["username"].ToString();
                ibr = Session["branch_id"].ToString();
           // }
                this.txt_br.Text = ibr.ToString();
            this.txt_session.Text = usr.ToString();
            //if (string.IsNullOrEmpty(HttpContext.Current.Session["branch_id"] as string))
            //{
            //    Response.Redirect("~/BH_Login.aspx");
            //}
            //else
            //{

            //    ibr = HttpContext.Current.Session["branch_id"].ToString();
            //}
        }

        public class cand_code
        {
            public string cand_id { get; set; }
            public string cand_name { get; set; }
        }
        [WebMethod()]
        public static string branch_detail(string input)
        {
            DataTable ds = new DataTable();
            ServiceReference1.ServiceClient obj = new ServiceReference1.ServiceClient();
            string br_name = "";
            System.Net.ServicePointManager.SecurityProtocol = System.Net.SecurityProtocolType.Tls | System.Net.SecurityProtocolType.Tls11 | System.Net.SecurityProtocolType.Tls12;

            ds = obj.get_data(10, input);


            try
            {
               
                br_name = ds.Rows[0][2].ToString();


                return  br_name;

            }
            catch (Exception ex)
            {
                return "";
            }

        }

        [WebMethod(EnableSession = true)]

        public static List<cand_code> cand_codedtl(string input)
        {
            ServiceReference1.ServiceClient obj = new ServiceReference1.ServiceClient();
            List<cand_code> cand_cd = new List<cand_code>();

            DataTable ds = new DataTable();
            System.Net.ServicePointManager.SecurityProtocol = System.Net.SecurityProtocolType.Tls | System.Net.SecurityProtocolType.Tls11 | System.Net.SecurityProtocolType.Tls12;

            ds = obj.get_data(28, input);
            try
            {
                if (ds.Rows.Count > 0)
                {
                    foreach (DataRow dr in ds.Rows)
                    {
                        cand_cd.Add(new cand_code()
                        {
                            cand_id = dr["cand_code"].ToString(),
                            cand_name = dr["cand_code"].ToString()
                        });
                    }
                }
            }
            catch (Exception ex)
            {
            }
            return cand_cd;
        }

        [WebMethod()]
        public static string cand_detail(string cid)
        {
            DataTable ds = new DataTable();
            ServiceReference1.ServiceClient obj = new ServiceReference1.ServiceClient();
            string data = "";
            System.Net.ServicePointManager.SecurityProtocol = System.Net.SecurityProtocolType.Tls | System.Net.SecurityProtocolType.Tls11 | System.Net.SecurityProtocolType.Tls12;

            ds = obj.get_data(21, cid);


            try
            {
                // 15 q.q_name,u.university_name,t.qual_reg_no,t.passyear,t.percentage
              
             
          //      data = ds.Rows[0][9].ToString() + "~" + ds.Rows[0][1].ToString() + "~" + ds.Rows[0][2].ToString() + "~" + ds.Rows[0][3].ToString() + "~" + ds.Rows[0][6].ToString() + "~" + ds.Rows[0][7].ToString() + "~" + ds.Rows[0][11].ToString() + "~" + ds.Rows[0][12].ToString() + "~" + ds.Rows[0][13].ToString() + "~" + ds.Rows[0][14].ToString() + "~" + ds.Rows[0][15].ToString() + "~" + ds.Rows[0][16].ToString() + "~" + ds.Rows[0][17].ToString() + "~" + ds.Rows[0][18].ToString() + "~" + ds.Rows[0][19].ToString();

                data = ds.Rows[0][0].ToString() + "~" + ds.Rows[0][1].ToString() + "~" + ds.Rows[0][2].ToString() + "~" + ds.Rows[0][3].ToString() + "~" + ds.Rows[0][4].ToString() + "~" + ds.Rows[0][5].ToString() + "~" + ds.Rows[0][6].ToString() + "~" + ds.Rows[0][7].ToString() + "~" + ds.Rows[0][8].ToString() + "~" + ds.Rows[0][9].ToString() + "~" + ds.Rows[0][10].ToString() + "~" + ds.Rows[0][11].ToString() + "~" + ds.Rows[0][12].ToString() + "~" + ds.Rows[0][13].ToString() + "~" + ds.Rows[0][14].ToString() + "~" + ds.Rows[0][15].ToString() + "~" + ds.Rows[0][16].ToString() + "~" + ds.Rows[0][17].ToString() + "~" + ds.Rows[0][18].ToString() + "~" + ds.Rows[0][19].ToString() + "~" + ds.Rows[0][20].ToString();
                return data;

            }
            catch (Exception ex)
            {
                return "";
            }

        }

        [WebMethod()]
        public static string insert_detail(string date, string time,string code,string number, string name,string brname)
        {
            DataTable ds = new DataTable();
            ServiceReference1.ServiceClient obj = new ServiceReference1.ServiceClient();
            System.Net.ServicePointManager.SecurityProtocol = System.Net.SecurityProtocolType.Tls | System.Net.SecurityProtocolType.Tls11 | System.Net.SecurityProtocolType.Tls12;
          
                        ds = obj.get_data(29, date + '~' + time+'~'+ code);
                        string res1 = ds.Rows[0][0].ToString();                       
                        if (res1 == "111")
              {
                  sinfini_Manappuramhr.mana.SMSTool sms = new sinfini_Manappuramhr.mana.SMSTool();


               //  solution_infini_flag.mana.SMSTool sms = new solution_infini_flag.mana.SMSTool();//solution ifini to send sms
               //  sms.ser_flag = 0;
                  string[] qq = code.Split('~');

                  sms.Message = "Hi " + name + ",Your Interview scheduled at Manappuram Branch " + brname + " on " + date + " at" + time + ".  Please use application number " + qq[0].ToString() + " to login to our site https://online.manappuram.com/Recruitment/Login.aspx and complete the shortlisting process (upload documents,add personal and qualification details) and bring all mandatory documents you uploaded in the website.";
                    long vOut = (long)Convert.ToDouble(number != "" ? number : "0"); //candidate contact number
                    sms.mobileNumber = vOut;
                 //   sms.account_id = 3;
                    string msgid = sms.SendSms();
                    //return "SMS sent successfully!"; 07mar  commented
                        
                        //------------------------------------------------------------
                    DataTable ds1 = new DataTable();
                    ServiceReference1.ServiceClient obj1 = new ServiceReference1.ServiceClient();
                    string data = number;
                    System.Net.ServicePointManager.SecurityProtocol = System.Net.SecurityProtocolType.Tls | System.Net.SecurityProtocolType.Tls11 | System.Net.SecurityProtocolType.Tls12;

                    string s = "", num="";
                    ds = obj.get_data(68, code);
                    if (ds.Rows.Count > 0)
                    {
                        s = ds.Rows[0][0].ToString();
                        num = ds.Rows[0][1].ToString();
                    }
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
                  //  mail.Body = "Dear  " + name + "," + " \r\n\r\n  Your Interview scheduled at Manappuram Branch " + brname + " on " + date + " at" + time + ". \r\n Please use application number " + code + " to login to our site https://online.manappuram.com/Recruitment/Login.aspx and  \r\n complete the shortlisting process (upload documents,add personal and qualification details) and bring all mandatory documents you uploaded in the website.\r\n   Documents :\r\nQualification Certificate,Pancard,Aadhar Card,Bank PassBook,Voter ID,Address Proof";
                    mail.Body = "Dear " + name + ", \r\n\r\n Your Interview scheduled at Manappuram Branch " + brname + " on " + date + " at" + time + ". \r\n\r\n Please use application number " + qq[0].ToString() + " to login to our site https://online.manappuram.com/Recruitment/Login.aspx and  complete the shortlisting process (upload documents,add personal and qualification details) and bring all mandatory documents you uploaded in the website. \r\n\r\n  Mandatory Documents : \r\n\r\n Qualification Certificate,Pancard,Aadhar Card,Bank PassBook,Voter ID,Address Proof \r\n\r\nThanks & Regards, \r\n\r\nManappuram HR \r\n\r\nContact Number" + num;
                            
                    mail.To.Add(s);
                    
                    //}
                    //else
                    //{
                    //    mail.Subject = "Failed";
                    //}
                    //  mail.Body = "<p style='font-family: Arial;font-size:14px;color:#565656;'>Dear Sir/Madam <br/><br/> " + empcode + " " + empname + ",<br/><br/> employee transfer request processed.Present Hostel not available here. \n Branch Id " + branch_id + " and branch name " + br_name + "<br/><br/>Thanks & Regards,<br/>File Tracking Team<br/>Please do not reply to this email ID as this is an automatically generated email and reply to this ID is not being monitored</p>";
                    mail.IsBodyHtml = false;
                    server.Send(mail);
                    string Msg = "Mail and SMS Send successfully";

                    return Msg;

                            //-------------------------------------------------------
                        
                        
                        }

                        else { return "Failed to send SMS!"; }
                        //Shortlisted    


        }
    }
}