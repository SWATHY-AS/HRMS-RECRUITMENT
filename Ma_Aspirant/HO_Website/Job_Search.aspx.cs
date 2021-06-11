using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Services;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Ma_Aspirant.HO_Website
{
    public partial class Job_Search : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        public class cand_state
        {
            public string vpost { get; set; }
            public string vpname { get; set; }
            public string vlocname { get; set; }
            public string vgrade { get; set; }
            public string vqualification { get; set; }
            public string vdepart { get; set; }
            public string vexpericne { get; set; }
            public string vctc { get; set; }
            public string vnofvcancy { get; set; }
            public string vskills { get; set; }
            public string vdevpost { get; set; }
            public string vposteddate { get; set; }
            public string vjobcde { get; set; }
            public string votherbenifit { get; set; }
            public string vaccomdation { get; set; }
        }
        public List<cand_state> cand_st { get; set; }


        [WebMethod(EnableSession = true)]
        public static List<cand_state> Job_Serch(string input)
        {
            ServiceReference1.ServiceClient obj = new ServiceReference1.ServiceClient();
            List<cand_state> cand_st = new List<cand_state>();

            DataTable ds = new DataTable();
            // ds = obj.getdata("133", "0");
            System.Net.ServicePointManager.SecurityProtocol = System.Net.SecurityProtocolType.Tls | System.Net.SecurityProtocolType.Tls11 | System.Net.SecurityProtocolType.Tls12;

            ds = obj.proc_hrm_common_select("42", "1", "0");


            try
            {
                if (ds.Rows.Count > 0)
                {

                    foreach (DataRow dr in ds.Rows)
                    {
                        cand_st.Add(new cand_state()
                        {  
                            vpost = dr["post_id"].ToString(),
                            vpname = dr["post_name"].ToString(),
                            vlocname = dr["location_name"].ToString(),
                            vgrade = dr["grade"].ToString(),
                            vqualification = dr["qualification"].ToString(),
                            vdepart = dr["department"].ToString(),
                            vexpericne = dr["experience"].ToString(),
                            vctc = dr["ctc_range"].ToString(),
                            vnofvcancy = dr["no_of_vacancies"].ToString(),
                            vskills = dr["skills"].ToString(),
                            vdevpost = dr["developer_post"].ToString(),
                            vposteddate = dr["posted_date"].ToString(),
                            vjobcde = dr["job_code"].ToString(),
                            votherbenifit = dr["other_benifts"].ToString(),
                            vaccomdation = dr["accommodation"].ToString()

                        });
                    }
                }
            }
            catch (Exception ex)
            {
            
            }
            return cand_st;
        }

    }
}