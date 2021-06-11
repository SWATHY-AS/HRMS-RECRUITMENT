using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;
using System.Data;

using System.IO;

namespace Ma_Aspirant.Recruitment
{
    public partial class Doc_Scanning : System.Web.UI.Page
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

            ds = obj.get_data(33, input);
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

            ds = obj.get_data(20, "test");
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

            ds = obj.get_data(30, input);

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

            ds = obj.get_data(31, input);
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

            ds = obj.get_data(33, input);
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

            ds = obj.get_data(34, input);
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



        //31maydocscanning
        [WebMethod(EnableSession = true)]
        public static string get_form(string input)
        {
            string s = "";
            ServiceReference1.ServiceClient obj = new ServiceReference1.ServiceClient();

            DataTable ds = new DataTable();

            System.Net.ServicePointManager.SecurityProtocol = System.Net.SecurityProtocolType.Tls | System.Net.SecurityProtocolType.Tls11 | System.Net.SecurityProtocolType.Tls12;

            ds = obj.get_data(76, input);
            if (ds.Rows.Count > 0)
            {


                s = ds.Rows[0][0].ToString();
            }

            return s;
        }
        [WebMethod(EnableSession = true)]
        public static string get_form1(string input)
        {
            string s = "";
            ServiceReference1.ServiceClient obj = new ServiceReference1.ServiceClient();

            DataTable ds = new DataTable();

            System.Net.ServicePointManager.SecurityProtocol = System.Net.SecurityProtocolType.Tls | System.Net.SecurityProtocolType.Tls11 | System.Net.SecurityProtocolType.Tls12;

            ds = obj.get_data(85, input);
            if (ds.Rows.Count > 0)
            {


                s = ds.Rows[0][0].ToString();
            }

            return s;
        }


    }
}