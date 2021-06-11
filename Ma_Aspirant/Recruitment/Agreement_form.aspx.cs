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

namespace Ma_Aspirant.Recruitment
{
    public partial class Agreement_form : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [WebMethod(EnableSession = true)]
        public static string Report(string input)
        {

            Document doc = new Document(PageSize.A4, 7f, 5f, 5f, 0f);
            string filePath = HttpContext.Current.Server.MapPath("~/ViewReport");

            try
            {
                string pdfFileName = input + ".pdf";
                // string pdfFileName = input + "new" + ".pdf";
                string newFilePath = filePath + "\\" + pdfFileName; //GetFileName(filePath, "UserProfile"); //  
                PdfWriter writer = PdfWriter.GetInstance(doc, new FileStream(newFilePath, FileMode.Create));
                doc.Open();
                iTextSharp.text.Font mainFont = FontFactory.GetFont("Segoe UI", 22, new iTextSharp.text.BaseColor(System.Drawing.ColorTranslator.FromHtml("#999")));
                iTextSharp.text.Font infoFont1 = FontFactory.GetFont("Kalinga", 10, new iTextSharp.text.BaseColor(System.Drawing.ColorTranslator.FromHtml("#666")));
                iTextSharp.text.Font expHeadFond = FontFactory.GetFont("Calibri (Body)", 12, new iTextSharp.text.BaseColor(System.Drawing.ColorTranslator.FromHtml("#666")));
                PdfContentByte contentByte = writer.DirectContent;
                iTextSharp.text.Font lineFont = FontFactory.GetFont("Kalinga", 6, new iTextSharp.text.BaseColor(Color.Black));
                Chunk lineChunk = new Chunk("    ____________________________________________________________________________________________________________________________________________________________________________   ", lineFont);


                ServiceReference1.ServiceClient obj;
                obj = new ServiceReference1.ServiceClient();
                DataTable ds = new DataTable();
                DataTable psd1 = new DataTable();
                DataTable psd2 = new DataTable();
                DataTable psd3 = new DataTable();
                DataTable psd4 = new DataTable();
                DataTable psd5 = new DataTable();
                DataTable psd6 = new DataTable();
                DataTable psd7 = new DataTable();

                // Employee Details.
                ds = obj.get_data(112, input);
                string emp_code, EMP_NAME, designation, dep_name, perm_add1, father_name, spouse_name, pin_code, post_office, district_name, state_name, BASIC_PAY, gender, status, join_dt;
                if (ds.Rows.Count > 0)
                {
                    emp_code = ds.Rows[0][0].ToString();
                    EMP_NAME = ds.Rows[0][1].ToString();
                    designation = ds.Rows[0][2].ToString();
                    dep_name = ds.Rows[0][3].ToString();
                    perm_add1 = ds.Rows[0][5].ToString();
                    father_name = ds.Rows[0][6].ToString();
                    spouse_name = ds.Rows[0][7].ToString();
                    pin_code = ds.Rows[0][8].ToString();
                    post_office = ds.Rows[0][9].ToString();
                    district_name = ds.Rows[0][10].ToString();
                    state_name = ds.Rows[0][11].ToString();
                    BASIC_PAY = ds.Rows[0][12].ToString();
                    gender = ds.Rows[0][13].ToString();
                    status = ds.Rows[0][14].ToString();
                    join_dt = ds.Rows[0][15].ToString();

                }
                else
                {
                    emp_code = " ";
                    EMP_NAME = " ";
                    designation = " ";
                    dep_name = " ";
                    perm_add1 = " ";
                    pin_code = " ";
                    post_office = " ";
                    district_name = " ";
                    state_name = " ";
                    BASIC_PAY = " ";
                    father_name = " ";
                    spouse_name = " ";
                    gender = " ";
                    status = " ";
                    join_dt = " ";


                }

                //netpay
                ds = obj.get_data(111, input);
                string total, in_words;
                if (ds.Rows.Count > 0)
                {


                    total = ds.Rows[0][3].ToString();
                    in_words = ds.Rows[0][4].ToString();
                }
                else
                {
                    total = " ";
                    in_words = " ";
                }

                //vda
                ds = obj.get_data(113, input);
                string amount;
                if (ds.Rows.Count > 0)
                {

                    amount = ds.Rows[0][0].ToString();
                }
                else
                {
                    amount = " ";
                }





                //branch_details
                ds = obj.get_data(114, input);
                string branch_name, area_name, state;
                if (ds.Rows.Count > 0)
                {

                    branch_name = ds.Rows[0][0].ToString();
                    area_name = ds.Rows[0][1].ToString();
                    state = ds.Rows[0][2].ToString();
                }
                else
                {
                    branch_name = " ";
                    area_name = " ";
                    state = " ";
                }

                //dept head
                //   ds = obj.select_data("116", input);
                ds = obj.get_data(2, input);
                string emp_name;
                if (ds.Rows.Count > 0)
                {
                    emp_name = ds.Rows[0][0].ToString();
                }
                else
                {
                    emp_name = " ";
                }


                iTextSharp.text.Font customStyle = FontFactory.GetFont(FontFactory.HELVETICA_BOLD, 10);
                customStyle.SetStyle(iTextSharp.text.Font.UNDERLINE);
                iTextSharp.text.Font customStyle11 = FontFactory.GetFont(FontFactory.HELVETICA_BOLD, 10);
                iTextSharp.text.Font customStyle1 = FontFactory.GetFont("Arial", 10, BaseColor.BLACK);
                PdfPTable table = new PdfPTable(1);

                PdfPCell cell = new PdfPCell()
                {
                    BorderWidthBottom = 0,
                    BorderWidthTop = 0,
                    BorderWidthLeft = 0,
                    BorderWidthRight = 0
                };
                Paragraph p = new Paragraph();
                p.Add(new Chunk("\n\n\n\n\n\n                                                                                                                                                      Page: 1", customStyle1));
                p.Add(new Chunk("\n\n\n\n\n                                                                                                                    Date: " + join_dt, customStyle1));
                p.Add(new Chunk("\n\n" + EMP_NAME, customStyle1));
                if (gender == "FEMALE")
                {
                    p.Add(new Chunk("\nD/O " + father_name, customStyle1));

                }
                else
                {
                    p.Add(new Chunk("\nS/O " + father_name, customStyle1));

                }
                p.Add(new Chunk("\n" + perm_add1, customStyle1));
                p.Add(new Chunk("\n" + post_office, customStyle1));
                p.Add(new Chunk("\n" + district_name, customStyle1));
                p.Add(new Chunk("\n" + state_name, customStyle1));
                p.Add(new Chunk("-" + pin_code, customStyle1));
                p.Add(new Chunk("\n\nMr/Ms. " + EMP_NAME + ",", customStyle1));
                p.Add(new Chunk("\n\nSub:", customStyle11));
                p.Add(new Chunk("Offer of appointment as " + designation, customStyle));
                p.Add(new Chunk("\n\n We are pleased to offer you for the post of " + designation, customStyle1));
                p.Add(new Chunk(" in the Company on the following terms and conditions\n", customStyle1));

                p.Add(new Chunk("\n\n1.", customStyle1));
                p.Add(new Chunk("Post offered :  ", customStyle));
                p.Add(new Chunk(designation, customStyle1));
                p.Add(new Chunk("\n\n2.", customStyle1));

                p.Add(new Chunk("Place of posting\n\n", customStyle));
                p.Add(new Chunk("You are presently posted in the  " + branch_name, customStyle1));
                p.Add(new Chunk("  but liable to be transferred to any present or proposed branches of the Company in the same or different capacity.", customStyle1));

                p.Add(new Chunk("\n\n3.", customStyle1));
                p.Add(new Chunk("Date of Joining", customStyle));
                p.Add(new Chunk("\n\nYou are required to report for duty on  " + join_dt, customStyle1));
                p.Add(new Chunk(" at " + branch_name + " , " + area_name + " , " + state, customStyle1));
                p.Add(new Chunk(" .If you require any change in the date of joining, it should be taken up with Human Resource Management Department at the Administrative office well in advance. Your appointment will be effective from the date of your joining duty.", customStyle1));

                p.Add(new Chunk("\n\n4.", customStyle1));
                p.Add(new Chunk("Probation/Confirmation ", customStyle));
                p.Add(new Chunk("\n\nYou will be on probation for a period of six months. Based on your performance your services will be confirmed with the company in writing after six months.  If your performance is not found to be satisfactory or up to the expected level, your probation period will be extended for a further period of 6 months at the discretion of the Management. During probation period, your services are liable to be terminated without assigning any reason.", customStyle1));

                p.Add(new Chunk("\n\n\n\n\n\n\n\n\n\n                                                                                                                                                  Page: 2", customStyle1));

                p.Add(new Chunk("\n\n\n\n\n\n5.", customStyle1));
                p.Add(new Chunk("Background Verification", customStyle));
                p.Add(new Chunk("\n\nThe Company shall conduct a background check of the employee through an authorized agency. If, as a result of this background check, it is found that any false statement has been made in the personal data relating to educational qualifications etc. furnished to the company or have not disclosed a material information resulting in your being offered this position, the Management may take such action as it is deems fit, including termination of your employment with immediate effect.", customStyle1));

                p.Add(new Chunk("\n\n\n\n6.", customStyle1));
                p.Add(new Chunk(" Agreement\n", customStyle));
                p.Add(new Chunk("\n\nAt the time of joining, you are required to execute an Agreement with the Company along with a surety accepting the terms and conditions of the offer letter etc.", customStyle1));

                p.Add(new Chunk("\n\n\n\n7.", customStyle1));
                p.Add(new Chunk("Scale of  pay", customStyle));
                p.Add(new Chunk("\n\nYou are placed in the regular scale of pay of Rs." + BASIC_PAY + "/-", customStyle1));
                p.Add(new Chunk("   Plus Dearness Allowance as per the cost of living index calculated under the rules of Kerala Shops and Establishment Act, 1960.Other benefits like Provident Fund, PF linked with pension scheme, Gratuity, Medi-claim/ESI, Bonus, Leave encashment, etc commence from date of joining duty.", customStyle1));
                p.Add(new Chunk("The total salary would be Rs." + total + "/- ," + in_words + " only", customStyle1));
                p.Add(new Chunk(" (Basic pay Rs." + BASIC_PAY + "/-", customStyle1));
                p.Add(new Chunk(" + V.D.A. Rs. " + amount + "/-", customStyle1));
                p.Add(new Chunk(" as per the prevailing rate of Dearness Allowance) per month. The annual increment in basic pay will be awarded at the discretion of Management after appraisal of the performance of the employee.", customStyle1));

                p.Add(new Chunk("\n\n\n\n8.", customStyle1));
                p.Add(new Chunk(" Eligibility for leave ", customStyle));
                p.Add(new Chunk("\n\nYou will be eligible for leave of one day per month during the first year of service in the Company. Once you complete one year of service in Manappuram Finance Limited, you will be eligible for 12 days Casual Leave, 12 days Sick Leave & 12 days Earned Leave.", customStyle1));

                p.Add(new Chunk("\n\n\n\n\n\n\n\n\n\n\n\n                                                                                                                                             Page: 3", customStyle1));

                p.Add(new Chunk("\n\n\n\n\n9.", customStyle1));
                p.Add(new Chunk("Voluntary retirement/Resignation", customStyle));
                p.Add(new Chunk("\n\nYou are required to give a notice of minimum one month, if you wish to resign from the service of the Company. In the event of failure to do so, you will be liable to compensate the Company with an amount equal to the salary and allowance for the actual days of deficiency in such notice. The security deposit will be refunded after the expiry of 12 months from the date of relieving from the service. Any sum due to the Company from the employee will be deducted from the security deposit. You will not join any of our competitor within 12 months of leaving the organization.", customStyle1));

                p.Add(new Chunk("\n\n\n\n\n\n10.", customStyle1));
                p.Add(new Chunk("Secrecy Clause", customStyle));
                p.Add(new Chunk("\n\nYou may kindly note that confidentiality in your work in relation to any information of the Company is paramount and shall not be divulged to any third party unless with prior permission from the Management. Incase employee neglects to maintain secrecy and loss/damage is suffered to company ,even after termination of employment, you will be held liable for the same and such disputes will be referred to a sole arbitrator appointed by the company whose decision will be binding on both parties.", customStyle1));

                p.Add(new Chunk("\n\n\n\n\n\n11.", customStyle1));
                p.Add(new Chunk(" Loyalty & Ethics", customStyle));
                p.Add(new Chunk("\n\nYou may serve the company diligently and loyally and devote your best efforts, full time and energy to such services. You will not engage in any other employment during employment with company and warrants that employee is not subjected to any agreement with a prior employer or other party, which would restrict the performance of his duty in this company.  All business activities should be conducted in accordance with the directives, policies and instructions of the company, in a professional manner so as to maintain ethics, professional standards, goodwill and reputation of the company.", customStyle1));


                p.Add(new Chunk("\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n                                                                                                                                             Page: 4", customStyle1));

                p.Add(new Chunk("\n\n\n\n12.", customStyle1));
                p.Add(new Chunk("Security Deposit", customStyle));
                p.Add(new Chunk("\n\nYou will have to deposit an amount of Rs.25,000/-(Rupees Twenty Five thousand only) towards security deposit. This will be deposited with Nationalized /Scheduled Commercial Bank.  You will be eligible for interest at the rate applicable to deposits of the Bank and such security deposit will be refunded after expiry of 12 months from the date of relieving from the service.  Any sum due to the Company from you will be deducted from the security deposit.This Security amount can be paid in lump sum or in 25 equal continuous monthly Installment of Rs1000/- (One Thousand Only) from your Salary.In case monthly deduction from your salary towards the security deposit of Rs.25,000/ - is not yet completed,  then you will have to continue to contribute the balance amount or it will be deducted from your salary until the amount reaches Rs.25,000/-.", customStyle1));

                p.Add(new Chunk("\n\n\n\n\n13.", customStyle1));
                p.Add(new Chunk("Restriction from soliciting with company’s clients and business relations", customStyle));
                p.Add(new Chunk("\n\nDuring the course of the employment and thereafter employee shall not engage in any position or activity that would involve in soliciting or knowingly communicating with the company’s clients, business partner or entity that the employee had business relations with, during the course of his employment.", customStyle1));

                p.Add(new Chunk("\n\n\n\n14.", customStyle1));
                p.Add(new Chunk("Gratuity", customStyle));
                p.Add(new Chunk("\n\nGratuity will be paid as per the provisions of the Gratuity Act as and when you become eligible for the same.", customStyle1));

                p.Add(new Chunk("\n\n\n\n15.", customStyle1));
                p.Add(new Chunk(" Safe custody of Company Assets", customStyle));
                p.Add(new Chunk("\n\nYou will be responsible for safekeeping and return in good condition and order of all company property, which may be in your use, custody or charge.", customStyle1));


                p.Add(new Chunk("\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n                                                                                                                                               Page: 5", customStyle1));

                p.Add(new Chunk("\n\n\n\n16.", customStyle1));
                p.Add(new Chunk("Termination ", customStyle));
                p.Add(new Chunk("\n\nIf at any time in our opinion, which is final in this matter you are found to be a non-performer or guilty of fraud, dishonesty, disobedience, disorderly behavior, negligence, indiscipline, absence from duty without permission or any other conduct considered by us deterrent to our interest or of one or more terms of this letter, your services may be terminated without notice and on account of reason of any of the acts or omission the company shall be entitled to recover the damages from you.	In addition to that, the failure to produce or non-submission of any certificate in proof of educational qualification, experience, police verification certificate, etc call for by the company at the time of joining also cause termination of your service without any notice.", customStyle1));

                p.Add(new Chunk("\n\n\n\n\n\n17.", customStyle1));
                p.Add(new Chunk("Acceptance of Commission/Gratification", customStyle));
                p.Add(new Chunk("\n\nYou will not accept any present, commission or any sort of gratification in cash or any kind from any person, party or firm or company having dealing with the company and if you are offered any, you should immediately report the same to the management.", customStyle1));

                p.Add(new Chunk("\n\n\n\n\n\n\n18.", customStyle1));
                p.Add(new Chunk("Appointment in good faith ", customStyle));
                p.Add(new Chunk("\n\nThis offer of appointment as " + designation, customStyle1));
                p.Add(new Chunk(" is being issued to you on the basis of the information relating to your qualification, experience etc, furnished by you in your application including Bio-data at the time of your interview and subsequent discussion. If it transpires that you have made a false statement or have not disclosed a material fact resulting in your being offered this appointment, the management may take such action as it deems fit in its sole discretion, including termination of your employment.		", customStyle1));


                p.Add(new Chunk("\n\n\n\n\n\n\n\n\n\n \n\n\n\n\n\n\n\n\n                                                                                                                                         Page: 6", customStyle1));

                p.Add(new Chunk("\n\n\n\n19.", customStyle1));
                p.Add(new Chunk("Dress code", customStyle));
                p.Add(new Chunk("\n\nYou will comply with the prevailing dress code applicable to employees, while in service with the Company.", customStyle1));

                p.Add(new Chunk("\n\n\n\n\n20.", customStyle1));
                p.Add(new Chunk("Documents to be Produced", customStyle));
                p.Add(new Chunk("\n                   a) Copies of your certificates,testimonials,proof of age,Mark sheets.Qualification, ", customStyle1));
                p.Add(new Chunk("\n                   experience etc duly attested by a Gazetted Officer.", customStyle1));
                p.Add(new Chunk("\n                   b)Four Recent Passport size photographs.", customStyle1));
                p.Add(new Chunk("\n                   c)Physical Fitness Certificate from a Medical Officer not below the rank of an Asst.", customStyle1));
                p.Add(new Chunk("\n                   d)Relieving letter from your present employer, if applicable.", customStyle1));
                p.Add(new Chunk("\n                   e)Stamp paper worth Rs.200/-", customStyle1));
                p.Add(new Chunk("\n                   f)Police Verification Certificate from the nearest police station.", customStyle1));
                p.Add(new Chunk("\n                   g)Copy of Adhar card/ National Population Register (NPR) and Copy of PAN card.", customStyle1));
                p.Add(new Chunk("\n                   h)Bank account details with IFSC code.", customStyle1));
                p.Add(new Chunk("\n\n\nPlease sign and return the duplicate copy of this appointment letter to us as a token of your acceptance of the terms and conditions mentioned therein.", customStyle1));
                p.Add(new Chunk("\n\nWe welcome you to Manappuram family and look forward to a long and mutually beneficial relationship.", customStyle1));
                p.Add(new Chunk("\n\n\nWith best wishes,", customStyle1));
                p.Add(new Chunk("\n\nFor Manappuram Finance Limited.", customStyle1));
                p.Add(new Chunk("\n\n\n\n" + emp_name, customStyle1));
                p.Add("\n\n\n\n");
                cell.AddElement(p);
                table.AddCell(cell);
                doc.Add(table);
            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                doc.Close();
            }


            return "pdfCreated";
        }
    }
}