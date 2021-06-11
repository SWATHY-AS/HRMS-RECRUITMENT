
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Services;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Ma_Aspirant
{
    public partial class Opprtunity : System.Web.UI.Page
    {
        static string  br = "";
        static string brid = "";


        protected void Page_Load(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(HttpContext.Current.Session["branch_id"] as string))
            {
                Response.Redirect("~/Candidate_Index.aspx");
            }
            else
            {              
                br = HttpContext.Current.Session["branch_id"].ToString();
                brid = HttpContext.Current.Session["branch_id"].ToString();

                this.txt_br.Text = br.ToString();
                this.txt_brid.Text = brid.ToString();
            }
          
        }
        public class cand_state
        {
            public string state_id { get; set; }
            public string state_name { get; set; }
        }
        public class cand_dis
        {
            public string dis_id { get; set; }
            public string dis_name { get; set; }
        }
        public List<cand_state> cand_st { get; set; }
        public List<cand_dis> cand_dist { get; set; }

        [WebMethod(EnableSession = true)]
        public static string bvcncy_dtl()
        {
            ServiceReference1.ServiceClient obj = new ServiceReference1.ServiceClient();
          
            
            string javacncy_cnt, hkvacncy_cnt, br_name;

            DataTable ds = new DataTable();
            System.Net.ServicePointManager.SecurityProtocol = System.Net.SecurityProtocolType.Tls | System.Net.SecurityProtocolType.Tls11 | System.Net.SecurityProtocolType.Tls12;

            ds = obj.get_data(10, br);

            if (ds.Rows.Count > 0)
            {
                try
                {
                    javacncy_cnt = ds.Rows[0][0].ToString();
                    hkvacncy_cnt = ds.Rows[0][1].ToString();
                    br_name = ds.Rows[0][2].ToString();


                    return javacncy_cnt + "~" + hkvacncy_cnt + "~" + br_name;

                }
                catch (Exception ex)
                {
                    return "";
                }
            }
            else
            {
                return "";
            }


         

        }
        [WebMethod(EnableSession = true)]
        public static string favcncy_dtl()
        {
            ServiceReference1.ServiceClient obj = new ServiceReference1.ServiceClient();


            string favacncy_cnt, hkvacncy_cnt, br_name;

            DataTable ds = new DataTable();
            System.Net.ServicePointManager.SecurityProtocol = System.Net.SecurityProtocolType.Tls | System.Net.SecurityProtocolType.Tls11 | System.Net.SecurityProtocolType.Tls12;

            ds = obj.get_data(10, br);

            if (ds.Rows.Count > 0)
            {
                try
                {
                    favacncy_cnt = ds.Rows[0][0].ToString();
                    hkvacncy_cnt = ds.Rows[0][1].ToString();
                    br_name = ds.Rows[0][2].ToString();


                    return favacncy_cnt + "~" + hkvacncy_cnt + "~" + br_name;

                }
                catch (Exception ex)
                {
                    return "";
                }
            }
            else
            {
                return "";
            }




        }

        [WebMethod(EnableSession = true)]
        public static List<cand_state> state_dtl()
        {
            ServiceReference1.ServiceClient obj = new ServiceReference1.ServiceClient();
            List<cand_state> cand_st = new List<cand_state>();

            DataTable ds = new DataTable();
            // ds = obj.getdata("133", "0");
            System.Net.ServicePointManager.SecurityProtocol = System.Net.SecurityProtocolType.Tls | System.Net.SecurityProtocolType.Tls11 | System.Net.SecurityProtocolType.Tls12;

            ds = obj.get_data(2, "0");


            try
            {
                if (ds.Rows.Count > 0)
                {
                    foreach (DataRow dr in ds.Rows)
                    {
                        cand_st.Add(new cand_state()
                        {
                            state_id = dr["state_id"].ToString(),
                            state_name = dr["state_name"].ToString()
                        });
                    }
                }
            }
            catch (Exception ex)
            {
            }
            return cand_st;
        }

        [WebMethod(EnableSession = true)]
        public static List<cand_dis> dis_dtl(string stid)
        {
            ServiceReference1.ServiceClient obj = new ServiceReference1.ServiceClient();
            List<cand_dis> cand_dis = new List<cand_dis>();

            DataTable ds = new DataTable();
            // ds = obj.getdata("133", "0");
            System.Net.ServicePointManager.SecurityProtocol = System.Net.SecurityProtocolType.Tls | System.Net.SecurityProtocolType.Tls11 | System.Net.SecurityProtocolType.Tls12;

            ds = obj.get_data(12, stid);


            try
            {
                if (ds.Rows.Count > 0)
                {
                    foreach (DataRow dr in ds.Rows)
                    {
                        cand_dis.Add(new cand_dis()
                        {
                            dis_id = dr["district_id"].ToString(),
                            dis_name = dr["district_name"].ToString()
                        });
                    }
                }
            }
            catch (Exception ex)
            {
            }
            return cand_dis;
        }

        [WebMethod(EnableSession = true)]
        public static string salary_dtl(string qid,string typ)
        {
            ServiceReference1.ServiceClient obj = new ServiceReference1.ServiceClient();
            string basic,vda;

            DataTable ds = new DataTable();
            if (typ == "J")
            {
                System.Net.ServicePointManager.SecurityProtocol = System.Net.SecurityProtocolType.Tls | System.Net.SecurityProtocolType.Tls11 | System.Net.SecurityProtocolType.Tls12;

                ds = obj.get_data(17, "7~"+qid);
            }
            else if (typ == "H") { ds = obj.get_data(17, "1"); }
            


            try
            {
                basic = ds.Rows[0][0].ToString();
                vda = ds.Rows[0][1].ToString();



                return basic+"~"+vda;

            }
            catch (Exception ex)
            {
                return "";
            }


        }


        [WebMethod(EnableSession = true)]
        public static string typedetail(string tid,string qual)
        {
            HttpContext.Current.Session["type_id"] = tid;
            HttpContext.Current.Session["qual"] = qual;
            return "SUCCESS";

        }
        [WebMethod(EnableSession = true)]
        public static string ovbranch_check(string input, string typ)
        {
            ServiceReference1.ServiceClient obj = new ServiceReference1.ServiceClient();
            string result = "";
            DataTable ds = new DataTable();
            if (typ == "H")
            {
              //  System.Net.ServicePointManager.SecurityProtocol = System.Net.SecurityProtocolType.Tls | System.Net.SecurityProtocolType.Tls11 | System.Net.SecurityProtocolType.Tls12;

                ds = obj.get_data(89, input);
                result = ds.Rows[0][0].ToString();
            }

            return result;

          


        }
    }
}