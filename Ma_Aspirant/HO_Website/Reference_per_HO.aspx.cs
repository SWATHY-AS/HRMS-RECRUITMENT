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
    public partial class Reference_per_HO : System.Web.UI.Page
    {
        static string candcode = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(HttpContext.Current.Session["candcode"] as string))
            {
                Response.Redirect("~/HO_Website/Login_HO.aspx");
            }
            else
            {

                candcode = HttpContext.Current.Session["candcode"].ToString();
            }
            this.txt_session.Text = candcode.ToString();
        }
        public class cand_state
        {
            public string state_id { get; set; }
            public string state_name { get; set; }
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
        public List<cand_state> cand_st { get; set; }
        public List<dist> distinfo { get; set; }
        public List<postdt> postinfo { get; set; }

        [WebMethod(EnableSession = true)]

        public static List<cand_state> state_dtl()
        {
            ServiceReference1.ServiceClient obj = new ServiceReference1.ServiceClient();
            List<cand_state> cand_st = new List<cand_state>();

            DataTable ds = new DataTable();
            // ds = obj.getdata("133", "0");
           System.Net.ServicePointManager.SecurityProtocol = System.Net.SecurityProtocolType.Tls | System.Net.SecurityProtocolType.Tls11 | System.Net.SecurityProtocolType.Tls12;

            ds = obj.proc_hrm_common_select("44","2", "0");


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
        public static List<dist> dist_dtl(string stid)
        {
            ServiceReference1.ServiceClient obj = new ServiceReference1.ServiceClient();
            List<dist> distinfo = new List<dist>();

            DataTable ds = new DataTable();
            string indata = stid;

            //  ds = obj.getdata("12", indata);
            System.Net.ServicePointManager.SecurityProtocol = System.Net.SecurityProtocolType.Tls | System.Net.SecurityProtocolType.Tls11 | System.Net.SecurityProtocolType.Tls12;

            ds = obj.proc_hrm_common_select("44","12", indata);
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
            ServiceReference1.ServiceClient obj = new ServiceReference1.ServiceClient();
            List<postdt> postinfo = new List<postdt>();
            DataTable ds = new DataTable();
            string indata = did;
            //  ds = obj.getdata("13", indata);
            System.Net.ServicePointManager.SecurityProtocol = System.Net.SecurityProtocolType.Tls | System.Net.SecurityProtocolType.Tls11 | System.Net.SecurityProtocolType.Tls12;

            ds = obj.proc_hrm_common_select("44","13", indata);
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
        public static string get_pin(String pid)
        {
            //String s;
            ServiceReference1.ServiceClient obj = new ServiceReference1.ServiceClient();
            DataTable dt = new DataTable();
            // dt = obj.getdata("18", pid);
            System.Net.ServicePointManager.SecurityProtocol = System.Net.SecurityProtocolType.Tls | System.Net.SecurityProtocolType.Tls11 | System.Net.SecurityProtocolType.Tls12;

            dt = obj.proc_hrm_common_select("44","14", pid);
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
        public static string cand_detail()       {
           
            string s = "";
            ServiceReference1.ServiceClient obj = new ServiceReference1.ServiceClient();
            DataTable ds = new DataTable();
            // ds = obj.getdata("133", "0");
            System.Net.ServicePointManager.SecurityProtocol = System.Net.SecurityProtocolType.Tls | System.Net.SecurityProtocolType.Tls11 | System.Net.SecurityProtocolType.Tls12;

            ds = obj.proc_hrm_common_select("44","87", candcode);


            if (ds.Rows.Count > 0)

            {
                //27may change name
                s = ds.Rows[0][0].ToString() + "~" + ds.Rows[0][1].ToString();
            }
            return s;


        }
        [WebMethod(EnableSession = true)]
        public static string insert_ref(string input)
        {
            DataTable ds = new DataTable();
            
            ServiceReference1.ServiceClient obj = new ServiceReference1.ServiceClient();
           System.Net.ServicePointManager.SecurityProtocol = System.Net.SecurityProtocolType.Tls | System.Net.SecurityProtocolType.Tls11 | System.Net.SecurityProtocolType.Tls12;

            
                        ds = obj.proc_hrm_common_select("44","24", input);
                      

            string res1 = ds.Rows[0][0].ToString();
           
                        //string res2 = ds.Rows[0][1].ToString();
            //if (res1 == "111")
            //{ return "111"; }
            //else { return "000"; }


            return res1;




        }
        [WebMethod(EnableSession = true)]
        public static string insert_ref1(string input2)
        {
           
            DataTable ds = new DataTable();
            ServiceReference1.ServiceClient obj = new ServiceReference1.ServiceClient();

            System.Net.ServicePointManager.SecurityProtocol = System.Net.SecurityProtocolType.Tls | System.Net.SecurityProtocolType.Tls11 | System.Net.SecurityProtocolType.Tls12;

            ds = obj.proc_hrm_common_select("44","26", input2);

           
            string res1 = ds.Rows[0][0].ToString();
            return res1;
            
            //if (res1 == "111")
            //{ return "111"; }
            //else { return "000"; }



        }

        [WebMethod(EnableSession = true)]
        public static string get_ref_dtl(string input)
        {
            string s = "";
            ServiceReference1.ServiceClient obj = new ServiceReference1.ServiceClient();

            DataTable ds = new DataTable();
            System.Net.ServicePointManager.SecurityProtocol = System.Net.SecurityProtocolType.Tls | System.Net.SecurityProtocolType.Tls11 | System.Net.SecurityProtocolType.Tls12;


            ds = obj.proc_hrm_common_select("44","57", input);
            if (ds.Rows.Count > 0)
            {


                s = ds.Rows[0][0].ToString();
            }

            return s;
        }







        //---------------new

        public class postofcdt
        {
            public string post_id1 { get; set; }
            public string post_name1 { get; set; }
        }
        public List<postofcdt> postofcinfo { get; set; }

        [WebMethod(EnableSession = true)]
        public static List<postofcdt> postofc_dtl(string did)
        {
            ServiceReference1.ServiceClient obj = new ServiceReference1.ServiceClient();
            List<postofcdt> postofcinfo = new List<postofcdt>();
            DataTable ds = new DataTable();
            string indata = did;
            //  ds = obj.getdata("13", indata);
            System.Net.ServicePointManager.SecurityProtocol = System.Net.SecurityProtocolType.Tls | System.Net.SecurityProtocolType.Tls11 | System.Net.SecurityProtocolType.Tls12;

            ds = obj.proc_hrm_common_select("44","45", indata);
            try
            {
                if (ds.Rows.Count > 0)
                {
                    foreach (DataRow dr in ds.Rows)
                    {
                        postofcinfo.Add(new postofcdt()
                        {
                            post_id1 = dr["sr_number"].ToString(),
                            post_name1 = dr["post_office"].ToString()
                        });
                    }
                }
            }
            catch (Exception ex)
            {
            }
            return postofcinfo;
        }


        [WebMethod(EnableSession = true)]
        public static string get_address(string input)
        {
            string s = "";
            ServiceReference1.ServiceClient obj;
            obj = new ServiceReference1.ServiceClient();
            DataTable ds = new DataTable();
            System.Net.ServicePointManager.SecurityProtocol = System.Net.SecurityProtocolType.Tls | System.Net.SecurityProtocolType.Tls11 | System.Net.SecurityProtocolType.Tls12;

            ds = obj.proc_hrm_common_select("44","62", input);

            if (ds.Rows.Count > 0)
            {

                s = ds.Rows[0][0].ToString() + "µ" + ds.Rows[0][1].ToString();
            }

            return s;
        }


        ///new reference view
        ///

        public class ref1
        {
            public string name { get; set; }
            public string post { get; set; }
            public string mob { get; set; }
            public string mail { get; set; }
            public string addr { get; set; }

        }
        public List<ref1> emp_dtref { get; set; }
        [WebMethod(EnableSession = true)]
        public static List<ref1> get_ref_dtl_view(string input)
        {
            ServiceReference1.ServiceClient obj = new ServiceReference1.ServiceClient();



            List<ref1> emp_dtref = new List<ref1>();

            DataTable ds = new DataTable();
            System.Net.ServicePointManager.SecurityProtocol = System.Net.SecurityProtocolType.Tls | System.Net.SecurityProtocolType.Tls11 | System.Net.SecurityProtocolType.Tls12;

            ds = obj.proc_hrm_common_select("15", "27", input);
            //ds = obj.access_hrm("27", input);
            //     ds = obj.getdata("78", input);
            try
            {
                if (ds.Rows.Count > 0)
                {
                    foreach (DataRow dr in ds.Rows)
                    {
                        emp_dtref.Add(new ref1()
                        {
                            //  ep.name,ep.position,ep.mob_no,ep.mail,pm.pin_code,pm.post_office,dm.district_name,s.state_name

                            name = dr["name"].ToString(),
                            post = dr["position"].ToString(),
                            mob = dr["mob_no"].ToString(),
                            mail = dr["mail"].ToString(),
                            addr = dr["addr"].ToString(),

                        });
                    }
                }
            }
            catch (Exception ex)
            {
            }
            return emp_dtref;


        }


        //31may
        [WebMethod(EnableSession = true)]
        public static string get_form(string input)
        {
            string s = "";
            ServiceReference1.ServiceClient obj = new ServiceReference1.ServiceClient();

            DataTable ds = new DataTable();

            System.Net.ServicePointManager.SecurityProtocol = System.Net.SecurityProtocolType.Tls | System.Net.SecurityProtocolType.Tls11 | System.Net.SecurityProtocolType.Tls12;

            ds = obj.proc_hrm_common_select("44","75", input);
            if (ds.Rows.Count > 0)
            {


                s = ds.Rows[0][0].ToString();
            }

            return s;
        }


    }
}