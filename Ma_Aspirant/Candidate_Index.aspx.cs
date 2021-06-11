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
    public partial class Candidate_Index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        public class cand_state
        {
            public string state_id { get; set; }
            public string state_name { get; set; }
        }
        public class cand_region
        {
            public string reg_id { get; set; }
            public string reg_name { get; set; }
        }

        public class cand_branch
        {
            public string branch_id { get; set; }
            public string branch_name { get; set; }
        }
      

        public List<cand_state> cand_st { get; set; }
        public List<cand_region> cand_rg { get; set; }
        public List<cand_branch> cand_br { get; set; }

        [WebMethod(EnableSession = true)]
        public static List<cand_state> state_dtl()
        {
          ServiceReference1.ServiceClient obj = new ServiceReference1.ServiceClient();
           // ServiceReference2.ServiceClient obj = new ServiceReference2.ServiceClient();
            List<cand_state> cand_st = new List<cand_state>();

            DataTable ds = new DataTable();
            // ds = obj.getdata("133", "0");
            System.Net.ServicePointManager.SecurityProtocol = System.Net.SecurityProtocolType.Tls | System.Net.SecurityProtocolType.Tls11 | System.Net.SecurityProtocolType.Tls12;
   //ServicePointManager.SecurityProtocol = SecurityProtocolType.Ssl3 || SecurityProtocolType.Tls || SecurityProtocolType.Tls11 || SecurityProtocolType.Tls12;
           // ds = obj.get_data(1, "0"); vacancy based

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
        public static List<cand_region> reg_dtl(string stid)
        {
           ServiceReference1.ServiceClient obj = new ServiceReference1.ServiceClient();
            //ServiceReference2.ServiceClient obj = new ServiceReference2.ServiceClient();
            List<cand_region> cand_rg = new List<cand_region>();
            DataTable ds = new DataTable();
            // ds = obj.getdata("133", "0");
            System.Net.ServicePointManager.SecurityProtocol = System.Net.SecurityProtocolType.Tls | System.Net.SecurityProtocolType.Tls11 | System.Net.SecurityProtocolType.Tls12;
           // ds = obj.get_data(8, stid); vacancy based
            ds = obj.get_data(12, stid);

            try
            {
                if (ds.Rows.Count > 0)
                {
                    foreach (DataRow dr in ds.Rows)
                    {
                        cand_rg.Add(new cand_region()
                        {
                            reg_id = dr["district_id"].ToString(),
                            reg_name = dr["district_name"].ToString()
                        });
                    }
                }
            }
            catch (Exception ex)
            {
            }
            return cand_rg;


        }
        [WebMethod(EnableSession = true)]
        public static List<cand_branch> branch_dtl(string rid)
        {
            //ServiceReference2.ServiceClient obj = new ServiceReference2.ServiceClient();
            ServiceReference1.ServiceClient obj = new ServiceReference1.ServiceClient();
            List<cand_branch> cand_br = new List<cand_branch>();
            DataTable ds = new DataTable();
            // ds = obj.getdata("133", "0");
           System.Net.ServicePointManager.SecurityProtocol = System.Net.SecurityProtocolType.Tls | System.Net.SecurityProtocolType.Tls11 | System.Net.SecurityProtocolType.Tls12;

            ds = obj.get_data(35, rid);
            try
            {
                if (ds.Rows.Count > 0)
                {
                    foreach (DataRow dr in ds.Rows)
                    {
                        cand_br.Add(new cand_branch()
                        {
                            branch_id = dr["branch_id"].ToString(),
                            branch_name = dr["branch_name"].ToString()
                        });
                    }
                }
            }
            catch (Exception ex)
            {
            }
            return cand_br;


        }

        [WebMethod(EnableSession = true)]
        public static string vcncy_dtl()
        {
          //  ServiceReference2.ServiceClient obj = new ServiceReference2.ServiceClient();
            ServiceReference1.ServiceClient obj = new ServiceReference1.ServiceClient();
            string javacncy_cnt, hkvacncy_cnt;

            DataTable ds = new DataTable();
            System.Net.ServicePointManager.SecurityProtocol = System.Net.SecurityProtocolType.Tls | System.Net.SecurityProtocolType.Tls11 | System.Net.SecurityProtocolType.Tls12;

            ds = obj.get_data(9, "0");


            try
            {
                javacncy_cnt = ds.Rows[0][0].ToString();
                hkvacncy_cnt = ds.Rows[0][1].ToString();

                return javacncy_cnt + "~" + hkvacncy_cnt;

            }
            catch (Exception ex)
            {
                return "";
            }
            

        }

        [WebMethod(EnableSession = true)]
        public static string brnch_id(string brid)
        {
            HttpContext.Current.Session["branch_id"] = brid;
            return "SUCCESS";           

        }
    }

}