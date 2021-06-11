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
    public partial class Enrol_personal : System.Web.UI.Page
    {
        static string usr = "",br="";
        
        protected void Page_Load(object sender, EventArgs e)
        {
          //  string user = "";               
            if (string.IsNullOrEmpty(Session["username"] as string))
            {
                Response.Redirect("~/Login.aspx");
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
           
          }
            ////////////////////////////////
        }



      
        public class stateinfo
        {
            public string st_id { get; set; }
            public string st_name { get; set; }
        }
        public class dist
        {
            public string dist_id { get; set; }
            public string dist_name { get; set; }
        }
        public class postdt
        {
            public string post_id { get; set; }
            public string post_name { get; set; }
        }
       
        public class religion
        {
            public string rid { get; set; }
            public string r_name { get; set; }
        }
        public List<stateinfo> stinfo { get; set; }
        public List<dist> distinfo { get; set; }
        public List<postdt> postinfo { get; set; }
       
        public List<religion> reli { get; set; }
       
        [WebMethod(EnableSession = true)]
        public static List<religion> religion_dtl()
        {
            HRM_Service.ServiceClient obj;
            List<religion> reli = new List<religion>();
            obj = new HRM_Service.ServiceClient();
            DataTable ds = new DataTable();
       //     ds = obj.getdata("14", "0");
            ds = obj.select_data("27", "0");
            try
            {
                if (ds.Rows.Count > 0)
                {
                    foreach (DataRow dr in ds.Rows)
                    {
                        reli.Add(new religion()
                        {
                            rid = dr["religion_id"].ToString(),
                            r_name = dr["religion"].ToString()
                        });
                    }
                }
            }
            catch (Exception ex)
            {
            }
            return reli;
        }
        [WebMethod(EnableSession = true)]
        public static List<stateinfo> state_dtl()
        {
            HRM_Service.ServiceClient obj;
            List<stateinfo> stinfo = new List<stateinfo>();
            obj = new HRM_Service.ServiceClient();
            DataTable ds = new DataTable();
           // ds = obj.getdata("11", "0");
            ds = obj.select_data("24", "0");
            try
            {
                if (ds.Rows.Count > 0)
                {
                    foreach (DataRow dr in ds.Rows)
                    {
                        stinfo.Add(new stateinfo()
                        {
                            st_id = dr["state_id"].ToString(),
                            st_name = dr["state_name"].ToString()
                        });
                    }
                }
            }
            catch (Exception ex)
            {
            }
            return stinfo;
        }

        [WebMethod(EnableSession = true)]
        public static List<dist> dist_dtl(string stid)
        {
            HRM_Service.ServiceClient obj;
            List<dist> distinfo = new List<dist>();
            obj = new HRM_Service.ServiceClient();
            DataTable ds = new DataTable();
            string indata = stid;

          //  ds = obj.getdata("12", indata);
            ds = obj.select_data("25", indata);
            try
            {
                if (ds.Rows.Count > 0)
                {
                    foreach (DataRow dr in ds.Rows)
                    {
                        distinfo.Add(new dist()
                        {
                            dist_id = dr["district_id"].ToString(),
                            dist_name = dr["district_name"].ToString()
                        });
                    }
                }
            }
            catch (Exception ex)
            {
            }
            return distinfo;
        }

        [WebMethod(EnableSession = true)]
        public static List<postdt> post_dtl(string did)
        {
            HRM_Service.ServiceClient obj;
            List<postdt> postinfo = new List<postdt>();
            obj = new HRM_Service.ServiceClient();
            DataTable ds = new DataTable();
            string indata = did;
          //  ds = obj.getdata("13", indata);
            ds = obj.select_data("26", indata);
            try
            {
                if (ds.Rows.Count > 0)
                {
                    foreach (DataRow dr in ds.Rows)
                    {
                        postinfo.Add(new postdt()
                        {
                            post_id = dr["sr_number"].ToString(),
                            post_name = dr["post_office"].ToString()
                        });
                    }
                }
            }
            catch (Exception ex)
            {
            }
            return postinfo;
        }

        [WebMethod(EnableSession = true)]
        public static string get_pin(string pid)
        {
            //String s;
            HRM_Service.ServiceClient obj = new HRM_Service.ServiceClient();
            
            DataTable dt = new DataTable();
           // dt = obj.getdata("18", pid);
            dt = obj.select_data("38", pid);
            string result = "";
            try
            {
                if (dt.Rows.Count > 0)
                {
                    result = dt.Rows[0][1].ToString();
                }
            }
            catch (Exception ex)
            {

            }

            return result;
        }


        [WebMethod(EnableSession = true)]
        public static string sslc_valid(string input)
        {
            //String s;
            HRM_Service.ServiceClient obj = new HRM_Service.ServiceClient();
            DataTable dt = new DataTable();
         //  dt = obj.getdata("131", input);
            dt = obj.select_data("41", input);
            string result = "";
            try
            {
                if (dt.Rows.Count > 0)
                {
                    result = dt.Rows[0][0].ToString();
                }
            }
            catch (Exception ex)
            {

            }

            return result;
        }

        [WebMethod(EnableSession = true)]
        public static string ref_valid(string input)
        {
            //String s;
            HRM_Service.ServiceClient obj = new HRM_Service.ServiceClient();
            DataTable dt = new DataTable();
         //   dt = obj.getdata("130", input);
           dt = obj.select_data("40", input);
            string result = "";
            try
            {
                if (dt.Rows.Count > 0)
                {
                    result = dt.Rows[0][0].ToString();
                }
            }
            catch (Exception ex)
            {

            }

            return result;
        }
        [WebMethod(EnableSession = true)]
        public static string ack_valid(string input)
        {
            //String s;
            HRM_Service.ServiceClient obj = new HRM_Service.ServiceClient();
            DataTable dt = new DataTable();
            //dt = obj.getdata("129", input);
            dt = obj.select_data("39", input);
            string result = "";
            try
            {
                if (dt.Rows.Count > 0)
                {
                    result = dt.Rows[0][0].ToString();
                }
            }
            catch (Exception ex)
            {

            }

            return result;
        }

       

             [WebMethod(EnableSession = true)]
        public static string uan_valid(string input)
        {
            //String s;
            HRM_Service.ServiceClient obj = new HRM_Service.ServiceClient();
            DataTable dt = new DataTable();
            //dt = obj.getdata("119", input);
           dt = obj.select_data("42", input);
            string result = "";
            try
            {
                if (dt.Rows.Count > 0)
                {
                    result = dt.Rows[0][0].ToString();
                }
            }
            catch (Exception ex)
            {

            }

            return result;
        }
             [WebMethod(EnableSession = true)]
             public static string aadhar_valid(string input)
             {
                 //String s;
                 HRM_Service.ServiceClient obj = new HRM_Service.ServiceClient();
                 DataTable dt = new DataTable();
               //  dt = obj.getdata("120", input);
                 dt = obj.select_data("43", input);
                 string result = "";
                 try
                 {
                     if (dt.Rows.Count > 0)
                     {
                         result = dt.Rows[0][0].ToString();
                     }
                 }
                 catch (Exception ex)
                 {

                 }

                 return result;
             }
             [WebMethod(EnableSession = true)]
             public static string pan_valid(string input)
             {
                 //String s;
                 HRM_Service.ServiceClient obj = new HRM_Service.ServiceClient();
                 DataTable dt = new DataTable();
               // dt = obj.getdata("121", input);
              dt = obj.select_data("44", input);
                 string result = "";
                 try
                 {
                     if (dt.Rows.Count > 0)
                     {
                         result = dt.Rows[0][0].ToString();
                     }
                 }
                 catch (Exception ex)
                 {

                 }

                 return result;
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
  
         [WebMethod(EnableSession = true)]
         public static string empjoindt(string input)
         {
             string s = "";
             HRM_Service.ServiceClient obj;
             obj = new HRM_Service.ServiceClient();
             DataTable ds = new DataTable();
         //    ds = obj.getdata("115", input);

             ds = obj.select_data("20", input);
             if (ds.Rows.Count > 0)
             {

                 s = ds.Rows[0][0].ToString();
             }

             return s;
         }
         [WebMethod(EnableSession = true)]
         public static string highqual(string input)
         {
             string s = "";
             HRM_Service.ServiceClient obj;
             obj = new HRM_Service.ServiceClient();
             DataTable ds = new DataTable();
           //  ds = obj.getdata("114", input);
             ds = obj.select_data("45", input);

             if (ds.Rows.Count > 0)
             {

                 s = ds.Rows[0][0].ToString();
             }

             return s;
         }

        
/*ghhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh*/

         public class emp_blood
         {
             public string bl_id { get; set; }
             public string bl_name { get; set; }
         }
         public List<emp_blood> emp_bl { get; set; }
         [WebMethod(EnableSession = true)]
         public static List<emp_blood> blood_dtl()
         {
             HRM_Service.ServiceClient obj;
             List<emp_blood> emp_bl = new List<emp_blood>();
             obj = new HRM_Service.ServiceClient();
             DataTable ds = new DataTable();
            // ds = obj.getdata("133", "0");
             ds = obj.select_data("37", "0");
           
             try
             {
                 if (ds.Rows.Count > 0)
                 {
                     foreach (DataRow dr in ds.Rows)
                     {
                         emp_bl.Add(new emp_blood()
                         {
                             bl_id = dr["blood_id"].ToString(),
                             bl_name = dr["b_name"].ToString()
                         });
                     }
                 }
             }
             catch (Exception ex)
             {
             }
             return emp_bl;
         }
       
         [WebMethod(EnableSession = true)]
         public static string enroll_dtl(string input)
         {
             string s = "";
             HRM_Service.ServiceClient obj;
             obj = new HRM_Service.ServiceClient();
             DataTable ds = new DataTable();
             s=obj.insert_data("1", input);
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


     

    }
}