using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.IO;
using System.Text;
namespace Ma_Aspirant.Enrollment
{
    public partial class Enrol_qualification : System.Web.UI.Page
     
    {
        static string usr = "",br="";
        protected void Page_Load(object sender, EventArgs e)
        {
          //  string user = "";               
            if (string.IsNullOrEmpty(Session["username"] as string))
            {

                Response.Redirect("Enrol_qualification.aspx");
            }
            else
            {
                usr = Session["username"].ToString();
                br = Session["branch_id"].ToString();
            }           
          this.txt_session.Text = usr.ToString();
          this.txtbr.Text = br.ToString();
            /////////////////////////////

          HRM_Service.ServiceClient obj;
          obj = new HRM_Service.ServiceClient();
          DataTable ds = new DataTable();
          // ds = obj.getdata("81", Session["username"].ToString());
          ds = obj.access_hrm("1", Session["username"].ToString());
          if (ds.Rows.Count > 0)
          {
              if (ds.Rows[0][0].ToString() == "333")
              {
                  StringBuilder cl_script = new StringBuilder();
                  cl_script.Append("   alert(' You have no authorization to view this page ') ;");
                  cl_script.Append("window.open('../Index/Index.aspx','_self');");
                  Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "inv", cl_script.ToString(), true);
              }
            //  else { empqual_dtl_view(); }
          }
            ////////////////////////////////
        }



      
      
        public class qualctg
        {
            public string qc_id { get; set; }
            public string qc_name { get; set; }
        }
        public class qual
        {
            public string qid { get; set; }
            public string q_name { get; set; }
        }
       
        public List<qual> quainfo { get; set; }
        
        public List<qualctg> qctginfo { get; set; }
       

        [WebMethod(EnableSession = true)]
        public static List<qual> qual_dtl(string cid)
        {
            HRM_Service.ServiceClient obj;
            List<qual> quainfo = new List<qual>();
            obj = new HRM_Service.ServiceClient();
            DataTable ds = new DataTable();
        //    ds = obj.getdata("10", cid);
            ds = obj.select_data("23", cid);
            try
            {
                if (ds.Rows.Count > 0)
                {
                    foreach (DataRow dr in ds.Rows)
                    {
                        quainfo.Add(new qual()
                        {
                            qid = dr["qualification_id"].ToString(),
                            q_name = dr["qualification"].ToString()
                        });
                    }
                }
            }
            catch (Exception ex)
            {
            }
            return quainfo;
        }
        [WebMethod(EnableSession = true)]
        public static List<qualctg> qcatg_dtl()
        {
            HRM_Service.ServiceClient obj;
            List<qualctg> qctginfo = new List<qualctg>();
            obj = new HRM_Service.ServiceClient();
            DataTable ds = new DataTable();
          //  ds = obj.getdata("9", "0");
            ds = obj.select_data("22", "0");
            try
            {
                if (ds.Rows.Count > 0)
                {
                    foreach (DataRow dr in ds.Rows)
                    {
                        qctginfo.Add(new qualctg()
                        {
                            qc_id = dr["category_id"].ToString(),
                            qc_name = dr["category"].ToString()
                        });
                    }
                }
            }
            catch (Exception ex)
            {
            }
            return qctginfo;
        }


        public class univ
        {
            public string uid { get; set; }
            public string u_name { get; set; }
        }

        public List<univ> univnfo { get; set; }

    


        [WebMethod(EnableSession = true)]
        public static List<univ> univ_dtl()
        {
            HRM_Service.ServiceClient obj;
            List<univ> uninfo = new List<univ>();
            obj = new HRM_Service.ServiceClient();
            DataTable ds = new DataTable();
            //    ds = obj.getdata("10", cid);
            ds = obj.select_data("62","0");
            try
            {
                if (ds.Rows.Count > 0)
                {
                    foreach (DataRow dr in ds.Rows)
                    {
                        uninfo.Add(new univ()
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
            return uninfo;
        }
       
        public class A
        {
            public string ee { get; set; }
            public string rr { get; set; }
        }
        public List<A> bb { get; set; }
  [WebMethod(EnableSession = true)]
        public static List<A> GetData()
        {

            HRM_Service.ServiceClient obj;
            List<A> bb = new List<A>();
            obj = new HRM_Service.ServiceClient();
            DataTable ds = new DataTable();
          //  ds = obj.getdata("9", "0");
            ds = obj.select_data("22", "0");
            try
            {
                if (ds.Rows.Count > 0)
                {
                    foreach (DataRow dr in ds.Rows)
                    {
                        bb.Add(new A()
                        {
                            ee = dr["category_id"].ToString(),
                            rr = dr["category"].ToString()
                        });
                    }
                }
            }
            catch (Exception ex)
            {
            }
            return bb;
        }
       



         public class quemp
         {
             public string qemp_code { get; set; }
             public string qemp_name { get; set; }
         }
         public List<quemp> quempdtl { get; set; }
         [WebMethod(EnableSession = true)]
         public static List<quemp> empqual_dtl_view(string input)
         {
             HRM_Service.ServiceClient obj;
             List<quemp> quempdtl = new List<quemp>();
             obj = new HRM_Service.ServiceClient();
             DataTable ds = new DataTable();
           //  ds = obj.getdata("113", "0");
             ds = obj.access_hrm("2", input);
             try
             {
                 if (ds.Rows.Count > 0)
                 {
                     foreach (DataRow dr in ds.Rows)
                     {
                         quempdtl.Add(new quemp()
                         {
                             qemp_code = dr["EMP_CODE"].ToString(),
                             qemp_name = dr["EMP_NAME"].ToString()
                         });
                     }
                 }

              
             }
             catch (Exception ex)
             {
             }
             return quempdtl;
         }
       
         [WebMethod(EnableSession = true)]
         public static string highqual(string input)
         {
             string s = "";
             HRM_Service.ServiceClient obj;
             obj = new HRM_Service.ServiceClient();
             DataTable ds = new DataTable();
          //   ds = obj.getdata("114", input);
             ds = obj.select_data("45", input);

             if (ds.Rows.Count > 0)
             {

                 s = ds.Rows[0][0].ToString();
             }

             return s;
         }

      
        
         [WebMethod(EnableSession = true)]
         public static string qualinsert_dtl(string input)
         {
             string s = "";
             HRM_Service.ServiceClient obj;
             obj = new HRM_Service.ServiceClient();
             DataTable ds = new DataTable();
             s = obj.insert_data("2", input);
             if (ds.Rows.Count > 0)
             {
                 s = ds.Rows[0][0].ToString();
             }
             return s;
         }

    

        
         

       
      


         [WebMethod(EnableSession = true)]
         public static string get_emp_dtl(string input)
         {
             string s = "";
             HRM_Service.ServiceClient obj;
             obj = new HRM_Service.ServiceClient();
             DataTable ds = new DataTable();
             ds = obj.select_data("9", input);


             if (ds.Rows.Count > 0)
             {
                 
                 s = ds.Rows[0][0].ToString() + "~" + ds.Rows[0][1].ToString() + "~" + ds.Rows[0][2].ToString() + "~" +
                 ds.Rows[0][3].ToString() + "~" + ds.Rows[0][4].ToString()
                 + "~" + ds.Rows[0][5].ToString() + "~" +
                  ds.Rows[0][6].ToString() + "," + ds.Rows[0][7].ToString() + "," +
                 ds.Rows[0][8].ToString() + "," + ds.Rows[0][9].ToString()
                 + "," + ds.Rows[0][10].ToString();
             }

             return s;
         }


         //emp assignment view exp and qualifcation




         
         public class empqudt1
         {
             public string category1 { get; set; }
             public string qualification1 { get; set; }
             public string university1 { get; set; }
             public string institution1 { get; set; }
             public string YEAR_PASS1 { get; set; }
             public string percentage1 { get; set; }
             public string grade1 { get; set; }
             public string NO_OF_ATTEMPT1 { get; set; }


         }
         public List<empqudt1> emp_dtquql1 { get; set; }
         [WebMethod(EnableSession = true)]
         public static List<empqudt1> get_qual_dtl1(string input)
         {
             HRM_Service.ServiceClient obj;
             List<empqudt1> emp_dtquql1 = new List<empqudt1>();
             obj = new HRM_Service.ServiceClient();
             DataTable ds = new DataTable();
             ds = obj.select_data("6", input);
             try
             {
                 if (ds.Rows.Count > 0)
                 {
                     foreach (DataRow dr in ds.Rows)
                     {
                         emp_dtquql1.Add(new empqudt1()
                         {
                             category1 = dr["category"].ToString(),
                             qualification1 = dr["qualification"].ToString(),
                             university1 = dr["university"].ToString(),
                             institution1 = dr["institution"].ToString(),
                             YEAR_PASS1 = dr["YEAR_PASS"].ToString(),
                             percentage1 = dr["percentage"].ToString(),
                             grade1 = dr["grade"].ToString(),
                             NO_OF_ATTEMPT1 = dr["NO_OF_ATTEMPT"].ToString(),
                         });
                     }
                 }
             }
             catch (Exception ex)
             {
             }
             return emp_dtquql1;


         }


         //emp detailsssssssss

         [WebMethod(EnableSession = true)]
         public static string get_qual_dtl(string input)
         {
             string s = "";
             HRM_Service.ServiceClient obj;
             obj = new HRM_Service.ServiceClient();
             DataTable ds = new DataTable();
             ds = obj.select_data("11", input);


             if (ds.Rows.Count > 0)
             {

                 s = ds.Rows[0][0].ToString();
             }

             return s;
         }

//for edit
         public class empqudt2
         {
             public string category2 { get; set; }
             public string qualification2 { get; set; }
             public string university2 { get; set; }
             public string institution2 { get; set; }
             public string YEAR_PASS2 { get; set; }
             public string percentage2 { get; set; }
             public string grade2 { get; set; }
             public string NO_OF_ATTEMPT2 { get; set; }
             public string rmk2 { get; set; }
          //   public string q2 { get; set; }
             public string quid { get; set; }
             public string cid { get; set; }
             public string hid { get; set; }
             public string univid { get; set; }
             public string high { get; set; }
             public string typ_edu { get; set; }
         }
         public List<empqudt2> emp_dtquql2 { get; set; }
         [WebMethod(EnableSession = true)]
         public static List<empqudt2> get_qual_dtl2(string input)
         {
             HRM_Service.ServiceClient obj;
             List<empqudt2> emp_dtquql2 = new List<empqudt2>();
             obj = new HRM_Service.ServiceClient();
             DataTable ds = new DataTable();
             ds = obj.select_data("12", input);
             try
             {
                 if (ds.Rows.Count > 0)
                 {
                     foreach (DataRow dr in ds.Rows)
                     {
                         emp_dtquql2.Add(new empqudt2()
                         {
                             category2 = dr["category"].ToString(),
                             qualification2 = dr["qualification"].ToString(),
                             university2 = dr["university_name"].ToString(),
                             institution2 = dr["institution"].ToString(),
                             YEAR_PASS2 = dr["YEAR_PASS"].ToString(),
                             percentage2 = dr["percentage"].ToString(),
                             grade2 = dr["grade"].ToString(),
                             NO_OF_ATTEMPT2 = dr["NO_OF_ATTEMPT"].ToString(),
                             rmk2 = dr["remarks"].ToString(),
                             //q2 = dr["qid"].ToString(),
                             quid = dr["qualid"].ToString(),
                             cid = dr["category_id"].ToString(),
                             univid = dr["university"].ToString(),
                            hid = dr["highest_qual"].ToString(),
                             high = dr["high"].ToString(),
                             typ_edu = dr["type_reg"].ToString(),
                         });
                     }
                 }
             }
             catch (Exception ex)
             {
             }
             return emp_dtquql2;


         }

         [WebMethod(EnableSession = true)]
         public static string qual_del(string input)
         {
             string s = "";
             HRM_Service.ServiceClient obj;
             obj = new HRM_Service.ServiceClient();
             DataTable ds = new DataTable();
             s = obj.insert_data("19", input);
             if (ds.Rows.Count > 0)
             {
                 s = ds.Rows[0][0].ToString();
             }
             return s;
         }

         public class qual1
         {
             public string qid1 { get; set; }
             public string q_name1 { get; set; }
         }
       
         public List<qual1> quainfo1 { get; set; }

         [WebMethod(EnableSession = true)]
         public static List<qual1> qual_dtl1(string cid)
         {
             HRM_Service.ServiceClient obj;
             List<qual1> quainfo1 = new List<qual1>();
             obj = new HRM_Service.ServiceClient();
             DataTable ds = new DataTable();
             ds = obj.select_data("13", cid);
             try
             {
                 if (ds.Rows.Count > 0)
                 {
                     foreach (DataRow dr in ds.Rows)
                     {
                         quainfo1.Add(new qual1()
                         {
                             qid1 = dr["qualification_id"].ToString(),
                             q_name1 = dr["qualification"].ToString()
                         });
                     }
                 }
             }
             catch (Exception ex)
             {
             }
             return quainfo1;
         }
    }
}