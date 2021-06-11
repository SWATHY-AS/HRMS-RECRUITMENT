using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;
using System.Data;


namespace Ma_Aspirant.Recruitment
{
    public partial class Photo_Upload : System.Web.UI.Page
    {
        static string ibr = "", usr = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            //  if (string.IsNullOrEmpty(Session["branch_id"] as string))
            if (Session["branch_id"].ToString() == "")
            {
                Response.Redirect("~/BH_Login.aspx");
            }
            else
            {
                usr = Session["username"].ToString();
                ibr = Session["branch_id"].ToString();
            }
            this.txt_br.Text = ibr.ToString();
            this.txt_session.Text = usr.ToString();
        }

        public class cand_code
        {
            public string cand_id { get; set; }
            public string cand_name { get; set; }
        }
        public List<cand_code> cand_cd { get; set; }
        [WebMethod()]
        public static List<cand_code> cand_codedtl(string input)
        {
            ServiceReference1.ServiceClient obj = new ServiceReference1.ServiceClient();
            List<cand_code> cand_cd = new List<cand_code>();

            DataTable ds = new DataTable();
           // ds = obj.get_data(44, HttpContext.Current.Session["ibr_id"].ToString());
           System.Net.ServicePointManager.SecurityProtocol = System.Net.SecurityProtocolType.Tls | System.Net.SecurityProtocolType.Tls11 | System.Net.SecurityProtocolType.Tls12;

            ds = obj.get_data(53,input);
            try
            {
                if (ds.Rows.Count > 0)
                {
                    foreach (DataRow dr in ds.Rows)
                    {
                        cand_cd.Add(new cand_code()
                        {
                            cand_id = dr["cand_code"].ToString(),
                            cand_name = dr["cand_name"].ToString()
                        });
                    }
                }
            }
            catch (Exception ex)
            {
            }
            return cand_cd;
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
            System.Net.ServicePointManager.SecurityProtocol = System.Net.SecurityProtocolType.Tls | System.Net.SecurityProtocolType.Tls11 | System.Net.SecurityProtocolType.Tls12;

            result = obj.EnrolDocumentUpload("2", input, imgByte);

            return result;
        }
    }
}