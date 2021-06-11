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
    public partial class Personal_Details : System.Web.UI.Page
    {

        static string candcode = "";
        ServiceReference1.ServiceClient obj = new ServiceReference1.ServiceClient();



        protected void Page_Load(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(HttpContext.Current.Session["candcode"] as string))
            {
                Response.Redirect("~/Login.aspx");
            }
            else
            {

               // candcode = HttpContext.Current.Session["candcode"].ToString();
                candcode = Session["candcode"].ToString();


                this.txt_session.Text = candcode.ToString();
            }

        }
     public class cand_blood
        {
            public string blood_id { get; set; }
            public string blood_type { get; set; }
        }
        public class cand_religion
        {
            public string religion_id { get; set; }
            public string religion { get; set; }

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

        public class cand_qualtyp
        {
            public string qualification_id { get; set; }
            public string qualification { get; set; }
        }
        public class univ
        {
            public string uid { get; set; }
            public string u_name { get; set; }
        }
        public class cand_details
        {
            public string cand_code { get; set; }
            public string cand_house { get; set; }
            public string cand_district { get; set; }
            public string cand_state { get; set; }
            public string cand_dob { get; set; }
            public string cand_gender { get; set; }
            public string cand_age { get; set; }
            public string cand_mob { get; set; }

            public string cand_email { get; set; }
        }
        public List<cand_details> cand_dtl { get; set; }
        public List<cand_blood> cand_bl { get; set; }
        public List<univ> univnfo { get; set; }
        public List<cand_religion> cand_relg { get; set; }
        public List<cand_state> cand_st { get; set; }
        public List<dist> distinfo { get; set; }
        public List<postdt> postinfo { get; set; }
        public List<cand_qualtyp> qual { get; set; }

        [WebMethod(EnableSession = true)]
        public static List<cand_blood> blood_dtl()
        {
            ServiceReference1.ServiceClient obj = new ServiceReference1.ServiceClient();
            List<cand_blood> cand_bl = new List<cand_blood>();

            DataTable ds = new DataTable();
            // ds = obj.getdata("133", "0");
            System.Net.ServicePointManager.SecurityProtocol = System.Net.SecurityProtocolType.Tls | System.Net.SecurityProtocolType.Tls11 | System.Net.SecurityProtocolType.Tls12;

            ds = obj.get_data(5, "0");


            try
            {
                if (ds.Rows.Count > 0)
                {
                    foreach (DataRow dr in ds.Rows)
                    {
                        cand_bl.Add(new cand_blood()
                        {
                            blood_id = dr["blood_id"].ToString(),
                            blood_type = dr["blood_type"].ToString()
                        });
                    }
                }
            }
            catch (Exception ex)
            {
            }
            return cand_bl;
        }
        [WebMethod(EnableSession = true)]
        public static List<cand_religion> religion_dtl()
        {
            ServiceReference1.ServiceClient obj = new ServiceReference1.ServiceClient();
            List<cand_religion> cand_relg = new List<cand_religion>();

            DataTable ds = new DataTable();
            System.Net.ServicePointManager.SecurityProtocol = System.Net.SecurityProtocolType.Tls | System.Net.SecurityProtocolType.Tls11 | System.Net.SecurityProtocolType.Tls12;

            ds = obj.get_data(6, "0");            
            try
            {
                if (ds.Rows.Count > 0)
                {
                    foreach (DataRow dr in ds.Rows)
                    {
                        cand_relg.Add(new cand_religion()
                        {
                            religion_id = dr["religion_id"].ToString(),
                            religion = dr["religion"].ToString()
                        });
                    }
                }
            }
            catch (Exception ex)
            {
            }
            return cand_relg;
        }
        [WebMethod(EnableSession = true)]

        public static List<cand_state> state_dtl()
        {
            ServiceReference1.ServiceClient obj = new ServiceReference1.ServiceClient();
            List<cand_state> cand_st = new List<cand_state>();

            DataTable ds = new DataTable();
            System.Net.ServicePointManager.SecurityProtocol = System.Net.SecurityProtocolType.Tls | System.Net.SecurityProtocolType.Tls11 | System.Net.SecurityProtocolType.Tls12;

            // ds = obj.getdata("133", "0");
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
        public static List<dist> dist_dtl(string stid)
        {
            ServiceReference1.ServiceClient obj = new ServiceReference1.ServiceClient();
            List<dist> distinfo = new List<dist>();
            
            DataTable ds = new DataTable();
            string indata = stid;
            System.Net.ServicePointManager.SecurityProtocol = System.Net.SecurityProtocolType.Tls | System.Net.SecurityProtocolType.Tls11 | System.Net.SecurityProtocolType.Tls12;

            //  ds = obj.getdata("12", indata);
            ds = obj.get_data(12,indata);
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

            ds = obj.get_data(13, indata);
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
        public static List<postdt> post_dtlcommn()
        {
            ServiceReference1.ServiceClient obj = new ServiceReference1.ServiceClient();
            List<postdt> postinfo = new List<postdt>();
            DataTable ds = new DataTable();
            System.Net.ServicePointManager.SecurityProtocol = System.Net.SecurityProtocolType.Tls | System.Net.SecurityProtocolType.Tls11 | System.Net.SecurityProtocolType.Tls12;

            ds = obj.get_data(37,"test");
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

            dt = obj.get_data(14, pid);
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
            System.Net.ServicePointManager.SecurityProtocol = System.Net.SecurityProtocolType.Tls | System.Net.SecurityProtocolType.Tls11 | System.Net.SecurityProtocolType.Tls12;

            //  ds = obj.getdata("13", indata);
            ds = obj.get_data(45, indata);
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

        public static List<cand_qualtyp>qual_dtl()
        {
            ServiceReference1.ServiceClient obj = new ServiceReference1.ServiceClient();
            List<cand_qualtyp> qual = new List<cand_qualtyp>();
            DataTable ds = new DataTable();
            System.Net.ServicePointManager.SecurityProtocol = System.Net.SecurityProtocolType.Tls | System.Net.SecurityProtocolType.Tls11 | System.Net.SecurityProtocolType.Tls12;

            //  ds = obj.getdata("13", indata);
            ds = obj.get_data(15,"0");
            try
            {
                if (ds.Rows.Count > 0)
                {
                    foreach (DataRow dr in ds.Rows)
                    {
                        qual.Add(new cand_qualtyp()
                        {
                            qualification_id = dr["q_id"].ToString(),
                            qualification = dr["q_name"].ToString()
                        });
                    }
                }
            }
            catch (Exception ex)
            {
            }
            return qual;
        }
        [WebMethod(EnableSession = true)]
        public static List<univ> univ_dtl()
        {
            ServiceReference1.ServiceClient obj = new ServiceReference1.ServiceClient();
            List<univ> uninfo = new List<univ>();
            DataTable ds = new DataTable();
            System.Net.ServicePointManager.SecurityProtocol = System.Net.SecurityProtocolType.Tls | System.Net.SecurityProtocolType.Tls11 | System.Net.SecurityProtocolType.Tls12;

            ds = obj.get_data(16, "0");
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
        [WebMethod(EnableSession = true)]
        public static string cand_detail(string input)
        {
            
            string s = "";
            ServiceReference1.ServiceClient obj = new ServiceReference1.ServiceClient();           
            DataTable ds = new DataTable();
            // ds = obj.getdata("133", "0");
           // ds = obj.get_data(21,candcode);
            System.Net.ServicePointManager.SecurityProtocol = System.Net.SecurityProtocolType.Tls | System.Net.SecurityProtocolType.Tls11 | System.Net.SecurityProtocolType.Tls12;

            ds = obj.get_data(46, input);
               if (ds.Rows.Count > 0)

                {
                   
                    s = ds.Rows[0][0].ToString() + "~" + ds.Rows[0][1].ToString() + "~" + ds.Rows[0][2].ToString() + "~" + ds.Rows[0][3].ToString() + "~" +
                    ds.Rows[0][4].ToString() + "~" + ds.Rows[0][5].ToString() + "~" + ds.Rows[0][6].ToString() + "~" + ds.Rows[0][7].ToString() + "~" + ds.Rows[0][8].ToString() + "~" + ds.Rows[0][9].ToString() + "~" + ds.Rows[0][10].ToString();
                }
                return s;
            
            
        }
        [WebMethod(EnableSession = true)]
        public static string insert_personal(string data,string qualdata,string qual_data2,string qual_data3, string qual_data4,string emerg_data)
        {
            //DataTable dsbasic, dsqual1, dsqual2, dsqual3, dsqual4, dsemrgn = new DataTable();
            string s = "",e="";
            DataTable dsbasic,dsemrgn = new DataTable();
            ServiceReference1.ServiceClient obj = new ServiceReference1.ServiceClient();
           // dsbasic = obj.get_data(38, data);
           // string resbasic = dsbasic.Rows[0][0].ToString();
           

           // dsemrgn= obj.get_data(40, emerg_data);
            //string resemerg = dsemrgn.Rows[0][0].ToString();

            //if (resbasic == "111")
            //{ return "111"; }
            //else if (resbasic== "Already Inserted!") { return resbasic; }
            //else return "000";
            //System.Net.ServicePointManager.SecurityProtocol = System.Net.SecurityProtocolType.Tls | System.Net.SecurityProtocolType.Tls11 | System.Net.SecurityProtocolType.Tls12;
            dsbasic = obj.proc_hrm_common_select("16", "31", data);

            if (dsbasic.Rows.Count > 0)
            {
                s = dsbasic.Rows[0][0].ToString();
            }
            if (s == "111")
            {
                System.Net.ServicePointManager.SecurityProtocol = System.Net.SecurityProtocolType.Tls | System.Net.SecurityProtocolType.Tls11 | System.Net.SecurityProtocolType.Tls12;

                dsemrgn = obj.proc_hrm_common_select("16", "33", emerg_data); 
                if (dsemrgn.Rows.Count > 0)
                {
                    e = dsemrgn.Rows[0][0].ToString();
                }
                return e;
            }
            else
            {
                return s;
            }

        }
        [WebMethod(EnableSession = true)]
        public static string distID_dtl(String dname)
        {
            //String s;
            ServiceReference1.ServiceClient obj = new ServiceReference1.ServiceClient();
            DataTable dt = new DataTable();
            // dt = obj.getdata("18", pid);
            System.Net.ServicePointManager.SecurityProtocol = System.Net.SecurityProtocolType.Tls | System.Net.SecurityProtocolType.Tls11 | System.Net.SecurityProtocolType.Tls12;

            dt = obj.get_data(36, dname);
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
        public static string get_address(string input)
        {
            string s = "";
            ServiceReference1.ServiceClient obj;
            obj = new ServiceReference1.ServiceClient();
            DataTable ds = new DataTable();
            System.Net.ServicePointManager.SecurityProtocol = System.Net.SecurityProtocolType.Tls | System.Net.SecurityProtocolType.Tls11 | System.Net.SecurityProtocolType.Tls12;

            ds = obj.get_data(62, input);

            if (ds.Rows.Count > 0)
            {

                s = ds.Rows[0][0].ToString() + "µ" + ds.Rows[0][1].ToString();
            }

            return s;
        }





        //27may
        [WebMethod(EnableSession = true)]
        public static string get_emp_dtl(string input)
        {
            string s = "";
            ServiceReference1.ServiceClient obj = new ServiceReference1.ServiceClient();
            DataTable ds = new DataTable();
            System.Net.ServicePointManager.SecurityProtocol = System.Net.SecurityProtocolType.Tls | System.Net.SecurityProtocolType.Tls11 | System.Net.SecurityProtocolType.Tls12;

            ds = obj.get_data(73, input);
            // ds = obj.proc_hrm_common_select("15", "3", input);

            if (ds.Rows.Count > 0)
            {
                //0c.cand_code,1c.cand_name,2to_char(t.dob, 'dd/mon/yyyy'),3c.religion_id,4c.caste,5c.sslc_no,6c.physically_challenged,7c.physcical_remarks,
                //8c.perm_add1,9c.perm_pin,10c.landmark,11c.pres_add1,12c.pres_pin,13c.present_landmark,14c.father_name,15c.father_contact,
                //16c.res_phone,17c.cont_phone,18c.sex,19c.marital_status,20c.spouse_name,21c.child_number,22c.spouse_contact,23d.emg_cont_name,
                //24d.emg_relation,25d.emg_address,26d.emg_cont_no,27d.emg_email,28c.blood_id,29c.id_proof,30c.idproof_number,31c.cand_email,               
                //32po.pin_code,33po.post_office,34ds.district_id,35ds.district_name,36s.state_id,37s.state_name,
                //38c.blood_id,39t.pan_no,40t.email,41po1.pin_code,42po1.post_office,43ds1.district_id, 44ds1.district_name, 45s1.state_id, 46 s1.state_name,


                //47,c.pp,48c.local_body_perm,49c.local_body_pres,50c.further_study,51c.willing_towrk

                s = ds.Rows[0][0].ToString() + "~" + ds.Rows[0][1].ToString() + "~" + ds.Rows[0][2].ToString() + "~" + ds.Rows[0][3].ToString() + "~" +
                   ds.Rows[0][4].ToString() + "~" + ds.Rows[0][5].ToString() + "~" + ds.Rows[0][6].ToString() + "~" + ds.Rows[0][7].ToString() + "~" +
                       ds.Rows[0][8].ToString() + "~" + ds.Rows[0][9].ToString()
                       + "~" + ds.Rows[0][10].ToString() + "~" + ds.Rows[0][11].ToString() + "~" + ds.Rows[0][12].ToString() + "~" +
                       ds.Rows[0][13].ToString() + "~" + ds.Rows[0][14].ToString()
                       + "~" + ds.Rows[0][15].ToString() + "~" + ds.Rows[0][16].ToString() + "~" + ds.Rows[0][17].ToString() + "~" +
                       ds.Rows[0][18].ToString() + "~" + ds.Rows[0][19].ToString()
                       + "~" + ds.Rows[0][20].ToString() + "~" + ds.Rows[0][21].ToString() + "~" + ds.Rows[0][22].ToString() + "~" +
                       ds.Rows[0][23].ToString() + "~" + ds.Rows[0][24].ToString() + "~" + ds.Rows[0][25].ToString() + "~" + ds.Rows[0][26].ToString() + "~" + ds.Rows[0][27].ToString() + "~" +
                       ds.Rows[0][28].ToString() + "~" + ds.Rows[0][29].ToString() + "~" + ds.Rows[0][30].ToString() + "~" + ds.Rows[0][31].ToString() + "~" + ds.Rows[0][32].ToString()
                       + "~" + ds.Rows[0][33].ToString() + "~" + ds.Rows[0][34].ToString()
                       + "~" + ds.Rows[0][35].ToString() + "~" + ds.Rows[0][36].ToString()
                + "~" + ds.Rows[0][37].ToString() + "~" + ds.Rows[0][38].ToString()
                + "~" + ds.Rows[0][39].ToString() + "~" + ds.Rows[0][40].ToString() + "~" + ds.Rows[0][41].ToString() + "~" + ds.Rows[0][42].ToString()
                + "~" + ds.Rows[0][43].ToString() + "~" + ds.Rows[0][44].ToString() + "~" + ds.Rows[0][45].ToString()
                + "~" + ds.Rows[0][46].ToString()
                  + "~" + ds.Rows[0][47].ToString() + "~" + ds.Rows[0][48].ToString() + "~" + ds.Rows[0][49].ToString()
                + "~" + ds.Rows[0][50].ToString() + "~" + ds.Rows[0][51].ToString();

            }
            return s;
        }
        [WebMethod(EnableSession = true)]
        public static string get_empaddr_dtl(string input)
        {
            string s = "";
            ServiceReference1.ServiceClient obj = new ServiceReference1.ServiceClient();
            DataTable ds = new DataTable();
            System.Net.ServicePointManager.SecurityProtocol = System.Net.SecurityProtocolType.Tls | System.Net.SecurityProtocolType.Tls11 | System.Net.SecurityProtocolType.Tls12;

            ds = obj.get_data(60, input);
            //  ds = obj.select_data("50", input);
            if (ds.Rows.Count > 0)
            {


                s = ds.Rows[0][0].ToString() + "~" + ds.Rows[0][1].ToString() + "~" + ds.Rows[0][2].ToString() + "~" + ds.Rows[0][3].ToString() + "~" +
                ds.Rows[0][4].ToString() + "~" + ds.Rows[0][5].ToString() + "~" + ds.Rows[0][6].ToString();
                //  po.pin_code,   po.post_office,ds.district_id,ds.district_name,s.state_id,s.state_name
            }

            return s;
        }


       
    }

}