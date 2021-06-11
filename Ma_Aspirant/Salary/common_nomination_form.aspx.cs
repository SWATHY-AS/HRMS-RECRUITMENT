using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Collections;
using iTextSharp.text;
using iTextSharp.text.pdf;
using System.Text;
using System.Drawing;
using System.Web.Services;
using System.Web.Configuration;
using System.Net;
using iTextSharp.text.html.simpleparser;


namespace Ma_Aspirant.Salary
{
    public partial class common_nomination_form : System.Web.UI.Page
    {
        static string candcode = "";
        static string id = "";
        static string usr = "";
        static string emp_code = "";
        static string pdfFileName = "";
        static string newFilePath = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(HttpContext.Current.Session["candcode"] as string))
            {
                Response.Redirect("~/HO_Website/Login_HO.aspx");
            }
            else
            {

                // candcode = HttpContext.Current.Session["candcode"].ToString();
                candcode = Session["candcode"].ToString();


                this.txt_session.Text = candcode.ToString();
            }
            this.txt_session.Text = candcode.ToString();
            ServiceReference1.ServiceClient obj = new ServiceReference1.ServiceClient();
            hfield_emp_code.Value = candcode.ToString();
        }
        [WebMethod(EnableSession = true)]
        public static string dataInsertion(string input)
        {

            string result = "";
            try
            {
                string ecode = input.Split('*')[0].ToString();
                ServiceReference1.ServiceClient obj = new ServiceReference1.ServiceClient();

                DataTable ds = new DataTable();
               // ds = obj.proc_hrm_common_select("1", "35", input);

                 ds = obj.nominee_data("4", ecode, input); //Get employee details
               // NominationForm(ecode, input);
                result = ds.Rows[0][0].ToString();
                //downloadFile();

            }
            catch (Exception e)
            {
                result = e.Message.ToString();
            }
            return result;
        }
        public static void NominationForm(string input, string input1)
        {



            string[] stringArray = input1.Split('~');
            string df = stringArray[0];


            string filePath = HttpContext.Current.Server.MapPath("~/image");
            Document doc = new Document(PageSize.A3, 7f, 5f, 5f, 0f);
            // Document doc = new Document(PageSize.A4, 13f, 6f, 5f, 0f);


            var dateAndTime = DateTime.Now;
            var date = dateAndTime.ToString("yyyy-MM-dd");


            pdfFileName = input + date + ".pdf";

            try
            {
                newFilePath = filePath + "\\" + pdfFileName; //GetFileName(filePath, "UserProfile"); //  


                if (File.Exists(newFilePath))
                {


                    System.IO.File.Delete(newFilePath);





                }









                PdfWriter writer = PdfWriter.GetInstance(doc, new FileStream(newFilePath, FileMode.Create));
                doc.NewPage();

                doc.Open();




                ServiceReference1.ServiceClient obj = new ServiceReference1.ServiceClient();

                DataTable ds = new DataTable();

              
                PdfPTable Detailstable = new PdfPTable(3);
                Detailstable.SetTotalWidth(new float[] { 30f, 5f, 50f });
                Detailstable.HorizontalAlignment = Element.ALIGN_CENTER;


               

                Detailstable.CompleteRow();

                iTextSharp.text.Font Style = FontFactory.GetFont("Arial", 13, BaseColor.BLACK);
                Style.SetStyle(iTextSharp.text.Font.UNDERLINE);
                iTextSharp.text.Font Styleh = FontFactory.GetFont("Arial", 12, BaseColor.BLACK);
                Styleh.SetStyle(iTextSharp.text.Font.UNDERLINE);
                iTextSharp.text.Font Style1 = FontFactory.GetFont("Arial", 12, BaseColor.BLACK);
                iTextSharp.text.Font Style2 = FontFactory.GetFont("BOLD", 12, BaseColor.BLACK);
                iTextSharp.text.Font Style3 = FontFactory.GetFont("italic", 12, BaseColor.BLACK);
                PdfPCell cell = new PdfPCell(new Phrase(new Chunk("MANAPPURAM FINANCE LIMITED\n", Styleh)));
                cell.FixedHeight = 30f;
                cell.Colspan = 3;
                cell.HorizontalAlignment = Element.ALIGN_CENTER;
                cell.Border = 0;
                Detailstable.DefaultCell.Border = 0;
                Detailstable.AddCell(cell);

                PdfPCell headcell_1 = new PdfPCell(new Phrase(new Chunk("Common Nomination Form for Gratuity, Full & Final Settlement\n", Styleh)));
                headcell_1.FixedHeight = 30f;
                headcell_1.Colspan = 3;
                headcell_1.HorizontalAlignment = Element.ALIGN_CENTER;
                headcell_1.Border = 0;
                Detailstable.DefaultCell.Border = 0;
                Detailstable.AddCell(headcell_1);

                PdfPCell headcell_2 = new PdfPCell(new Phrase(new Chunk("Employees, Group Insurance Scheme & EDLI\n", Styleh)));
                headcell_2.FixedHeight = 30f;
                headcell_2.Colspan = 3;
                headcell_2.HorizontalAlignment = Element.ALIGN_CENTER;
                headcell_2.Border = 0;
                Detailstable.DefaultCell.Border = 0;
                Detailstable.AddCell(headcell_2);





                //ServiceReference1.ServiceClient obj = new ServiceReference1.ServiceClient();

                DataTable ds6 = new DataTable();
                ds6 = obj.select_tds_data("1", input); //Get employee details
                //result = "I " + ds.Rows[0][1].ToString() + " Employee Code " + ds.Rows[0][0].ToString() + ", hereby nominate the persons mentioned below and confer on him/her the right to receive the entire amounts due to me from the Company under the following heads:-";
                PdfPCell headcell_3 = new PdfPCell(new Phrase(new Chunk("I " + ds6.Rows[0][1].ToString() + " Employeecode   " + ds6.Rows[0][0].ToString() + " hereby nominate the Person/s mentioned below and confer  on him/her the right to receive the entire amount due to me from the company under the following heads:-", Style3)));

                headcell_3.FixedHeight = 30f;
                headcell_3.Colspan = 3;
                headcell_3.HorizontalAlignment = Element.ALIGN_CENTER;
                headcell_3.Border = 0;
                Detailstable.DefaultCell.Border = 0;
                Detailstable.AddCell(headcell_3);




                DataTable noimnee_dtl_ds = new DataTable();

                noimnee_dtl_ds = obj.nominee_data("2", input, input);
                PdfPTable NomineeDetailstable = new PdfPTable(7);//table have 1 column
                NomineeDetailstable.SetWidths(new float[] { 2f, 6f, 6f, 6f, 5f, 8f, 6f });
                for (int i = 0; i < noimnee_dtl_ds.Rows.Count; i++)
                {
                    for (int j = 0; j < noimnee_dtl_ds.Columns.Count; j++)
                        NomineeDetailstable.AddCell(noimnee_dtl_ds.Rows[i][j].ToString());
                }






                //'string[] ecode = input1.Split(new char[] { '*' });

                Detailstable.AddCell(new Phrase("GRATUITY SETTLEMENT  ", Style));

                Detailstable.AddCell("   ");
                Detailstable.AddCell("  ");



                Detailstable.AddCell(new Phrase("1) Name of Nominee ", Style1));
                Detailstable.AddCell("   :");
                // Detailstable.AddCell( input1.Split('*')[2].ToString());
                // Detailstable.AddCell(stringArray[0].Split('*')[2].ToString());
                Detailstable.AddCell(noimnee_dtl_ds.Rows[0][0].ToString().ToString());


                Detailstable.AddCell(new Phrase("2)Date Of Birth ", Style1));
                Detailstable.AddCell("   :");
                // Detailstable.AddCell(stringArray[0].Split('*')[3].ToString());
                Detailstable.AddCell(noimnee_dtl_ds.Rows[0][1].ToString().ToString());

                Detailstable.AddCell(new Phrase("3) Relation with employee ", Style1));
                Detailstable.AddCell("   :");
                //Detailstable.AddCell(stringArray[0].Split('*')[4].ToString());
                Detailstable.AddCell(noimnee_dtl_ds.Rows[0][2].ToString().ToString());

                Detailstable.AddCell(new Phrase("4)Address of Nominee ", Style1));
                Detailstable.AddCell("   :");
                //Detailstable.AddCell(stringArray[0].Split('*')[5].ToString());
                Detailstable.AddCell(noimnee_dtl_ds.Rows[0][3].ToString().ToString());

                Detailstable.AddCell(new Phrase("5) Contact Number and MailID ", Style1));
                Detailstable.AddCell("   :");
                //Detailstable.AddCell(stringArray[0].Split('*')[6].ToString());
                Detailstable.AddCell(noimnee_dtl_ds.Rows[0][4].ToString().ToString());

                doc.NewPage();

                doc.Open();





                Detailstable.AddCell(new Phrase("FULL AND FINAL SETTLEMENT", Style));
                Detailstable.AddCell("  ");
                Detailstable.AddCell("  ");

                Detailstable.AddCell(new Phrase("1) Name of Nominee ", Style1));
                Detailstable.AddCell("   :");
                //Detailstable.AddCell(stringArray[1].Split('*')[2].ToString());
                Detailstable.AddCell(noimnee_dtl_ds.Rows[1][0].ToString().ToString());
                Detailstable.AddCell(new Phrase("2)Date Of Birth ", Style1));
                Detailstable.AddCell("   :");
                // Detailstable.AddCell(stringArray[1].Split('*')[3].ToString());
                Detailstable.AddCell(noimnee_dtl_ds.Rows[1][1].ToString().ToString());
                Detailstable.AddCell(new Phrase("3) Relation with employee ", Style1));
                Detailstable.AddCell("   :");
                // Detailstable.AddCell(stringArray[1].Split('*')[4].ToString());
                Detailstable.AddCell(noimnee_dtl_ds.Rows[1][2].ToString().ToString());
                Detailstable.AddCell(new Phrase("4)Address of Nominee  ", Style1));
                Detailstable.AddCell("   :");
                Detailstable.AddCell(noimnee_dtl_ds.Rows[1][3].ToString().ToString());
                //Detailstable.AddCell(stringArray[1].Split('*')[5].ToString());

                Detailstable.AddCell(new Phrase("5) Contact Number and MailID ", Style1));
                Detailstable.AddCell("   :");
                // Detailstable.AddCell(stringArray[1].Split('*')[6].ToString());
                Detailstable.AddCell(noimnee_dtl_ds.Rows[1][4].ToString().ToString());
                doc.NewPage();

                doc.Open();
                Detailstable.AddCell(new Phrase("EDLI", Style));
                Detailstable.AddCell("   ");
                Detailstable.AddCell("  ");

                Detailstable.AddCell(new Phrase("1)  Name of Nominee ", Style1));
                Detailstable.AddCell("   :");
                //Detailstable.AddCell(stringArray[2].Split('*')[2].ToString());
                Detailstable.AddCell(noimnee_dtl_ds.Rows[2][0].ToString().ToString());
                Detailstable.AddCell(new Phrase("2)Date Of Birth ", Style1));
                Detailstable.AddCell("   :");
                // Detailstable.AddCell(stringArray[2].Split('*')[3].ToString());
                Detailstable.AddCell(noimnee_dtl_ds.Rows[2][1].ToString().ToString());
                Detailstable.AddCell(new Phrase("3)Relation with employee", Style1));
                Detailstable.AddCell("   :");
                // Detailstable.AddCell(stringArray[2].Split('*')[4].ToString());
                Detailstable.AddCell(noimnee_dtl_ds.Rows[2][2].ToString().ToString());
                Detailstable.AddCell(new Phrase("4)Address of Nominee", Style1));
                Detailstable.AddCell("   :");
                //Detailstable.AddCell(stringArray[2].Split('*')[5].ToString());
                Detailstable.AddCell(noimnee_dtl_ds.Rows[2][3].ToString().ToString());
                Detailstable.AddCell(new Phrase("5)  Contact Number and MailID ", Style1));
                Detailstable.AddCell("   :");
                // Detailstable.AddCell(stringArray[2].Split('*')[6].ToString());
                Detailstable.AddCell(noimnee_dtl_ds.Rows[2][4].ToString().ToString());

                doc.NewPage();

                doc.Open();


                Detailstable.AddCell(new Phrase("UNPAID SALARY", Style));
                Detailstable.AddCell("   ");
                Detailstable.AddCell("  ");

                Detailstable.AddCell(new Phrase("1)  Name of Nominee ", Style1));
                Detailstable.AddCell("   :");
                // Detailstable.AddCell(stringArray[3].Split('*')[2].ToString());
                Detailstable.AddCell(noimnee_dtl_ds.Rows[3][0].ToString().ToString());
                Detailstable.AddCell(new Phrase("2)Date Of Birth ", Style1));
                Detailstable.AddCell("   :");
                // Detailstable.AddCell(stringArray[3].Split('*')[3].ToString());
                Detailstable.AddCell(noimnee_dtl_ds.Rows[3][1].ToString().ToString());
                Detailstable.AddCell(new Phrase("3)Relation with employee", Style1));
                Detailstable.AddCell("   :");
                // Detailstable.AddCell(stringArray[3].Split('*')[4].ToString());
                Detailstable.AddCell(noimnee_dtl_ds.Rows[3][2].ToString().ToString());
                Detailstable.AddCell(new Phrase("4)Address of Nominee", Style1));
                Detailstable.AddCell("   :");
                // Detailstable.AddCell(stringArray[3].Split('*')[5].ToString());
                Detailstable.AddCell(noimnee_dtl_ds.Rows[3][3].ToString().ToString());
                Detailstable.AddCell(new Phrase("5)  Contact Number and MailID ", Style1));
                Detailstable.AddCell("   :");
                // Detailstable.AddCell(stringArray[3].Split('*')[6].ToString());
                Detailstable.AddCell(noimnee_dtl_ds.Rows[3][4].ToString().ToString());
                doc.NewPage();

                doc.Open();


                PdfPCell headcell_4 = new PdfPCell(new Phrase(new Chunk("CLAIM AMOUNT FROM GROUP ACCIDENT INSURANCE POLICY BASED ON ENTITLEMENT/COVERAGE", Style)));
                headcell_4.FixedHeight = 30f;
                headcell_4.Colspan = 3;
                headcell_4.HorizontalAlignment = Element.ALIGN_LEFT;
                headcell_4.Border = 0;
                headcell_4.SetLeading(20f, 0f);
                Detailstable.DefaultCell.Border = 0;
                Detailstable.AddCell(headcell_4);




                Detailstable.AddCell(new Phrase("1)  Name of Nominee ", Style1));
                Detailstable.AddCell("   :");
                // Detailstable.AddCell(stringArray[4].Split('*')[2].ToString());
                Detailstable.AddCell(noimnee_dtl_ds.Rows[4][0].ToString().ToString());
                Detailstable.AddCell(new Phrase("2)Date Of Birth ", Style1));
                Detailstable.AddCell("   :");
                // Detailstable.AddCell(stringArray[4].Split('*')[3].ToString());
                Detailstable.AddCell(noimnee_dtl_ds.Rows[4][1].ToString().ToString());
                Detailstable.AddCell(new Phrase("3)Relation with employee", Style1));
                Detailstable.AddCell("   :");
                // Detailstable.AddCell(stringArray[4].Split('*')[4].ToString());
                Detailstable.AddCell(noimnee_dtl_ds.Rows[4][2].ToString().ToString());
                Detailstable.AddCell(new Phrase("4)Address of Nominee", Style1));
                Detailstable.AddCell("   :");
                //Detailstable.AddCell(stringArray[4].Split('*')[5].ToString());
                Detailstable.AddCell(noimnee_dtl_ds.Rows[4][3].ToString().ToString());






                Detailstable.AddCell(new Phrase("5)  Contact Number and MailID ", Style1));
                Detailstable.AddCell("   :");
                //  Detailstable.AddCell(stringArray[4].Split('*')[6].ToString());
                Detailstable.AddCell(noimnee_dtl_ds.Rows[4][4].ToString().ToString());
                doc.NewPage();

                doc.Open();




                Paragraph space = new Paragraph(" ");
                doc.Add(space);
                doc.Add(Detailstable);

              

                Paragraph p = new Paragraph();
                p.Add(new Phrase("\n\n   These nominations supersede any nominations made by me earlier.", Style1));
                // p.Add(new Phrase("\n\n   Place: ", Style1));
                p.Add(new Phrase("\n\n   Date:" + DateTime.Now, Style1));
                // p.Add(new Phrase("\n\n   Employee name: ", Style1));
                // p.Add(new Phrase("\n\n   Signature: ", Style1));
                doc.Add(p);




            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                doc.Close();
            }
        }
        protected void btn_Download_Click(object sender, EventArgs e)
        {

        }
        protected void btn_upld_Click(object sender, EventArgs e)
        {

        }
        //27febKp
        [WebMethod(EnableSession = true)]
        public static string get_form(string input)
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
        //31maydocscanning
        [WebMethod(EnableSession = true)]
        public static string get_form1(string input)
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
        public static string data_check(string input)
        {
            string s = "";
            ServiceReference1.ServiceClient obj = new ServiceReference1.ServiceClient();

            DataTable ds = new DataTable();

            System.Net.ServicePointManager.SecurityProtocol = System.Net.SecurityProtocolType.Tls | System.Net.SecurityProtocolType.Tls11 | System.Net.SecurityProtocolType.Tls12;

            ds = obj.get_data(86, input);
            if (ds.Rows.Count > 0)
            {


                s = ds.Rows[0][0].ToString();
            }

            return s;
        }
        public class empnomin
        {
            public string particulars { get; set; }
            public string nomin_name { get; set; }
            public string relation { get; set; }
            public string dob { get; set; }
            public string address { get; set; }
            public string cont_dtls { get; set; }
            

        }
        public List<empnomin> emp_nomindtls { get; set; }
        [WebMethod(EnableSession = true)]
        public static List<empnomin> get_nomin_dtl_view(string input)
        {
            ServiceReference1.ServiceClient obj = new ServiceReference1.ServiceClient();
            List<empnomin> emp_nomindtls = new List<empnomin>();

            DataTable ds = new DataTable();
            System.Net.ServicePointManager.SecurityProtocol = System.Net.SecurityProtocolType.Tls | System.Net.SecurityProtocolType.Tls11 | System.Net.SecurityProtocolType.Tls12;

            ds = obj.get_data(87, input);
            //     ds = obj.getdata("78", input);
            try
            {
                if (ds.Rows.Count > 0)
                {
                    foreach (DataRow dr in ds.Rows)
                    {
                        emp_nomindtls.Add(new empnomin()
                        {
                            particulars = dr["particulars"].ToString(),
                            nomin_name = dr["nomin_name"].ToString(),
                            relation = dr["nomin_relat"].ToString(),
                            dob = dr["dob"].ToString(),
                            address = dr["nomin_address"].ToString(),
                            cont_dtls = dr["nomin_cont_emailid"].ToString(),
                            
                        });
                    }
                }
            }
            catch (Exception ex)
            {
            }
            return emp_nomindtls;


        }
        [WebMethod(EnableSession = true)]
        public static string emp_details(string input)
        {
            string result = "";
            try
            {
                ServiceReference1.ServiceClient obj = new ServiceReference1.ServiceClient();

                DataTable ds = new DataTable();
                ds = obj.select_tds_data("1", input); //Get employee details
                result = "I " + ds.Rows[0][1].ToString() + " Candidate Code " + ds.Rows[0][0].ToString() + ", hereby nominate the person/s mentioned below and confer on him/her the right to receive the entire amounts due to me from the Company under the following heads:-";
            }
            catch (Exception e)
            {
                result = e.Message.ToString();
            }
            return result;
        }
    }
}