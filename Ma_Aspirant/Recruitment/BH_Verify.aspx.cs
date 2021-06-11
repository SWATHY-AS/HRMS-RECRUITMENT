using System;
using System.Collections.Generic;
using System.Web.Services;
using System.Data;
using System.IO;
using System.Web;
using System.Web.UI.WebControls;



namespace Ma_Aspirant.Recruitment
{
    public partial class BH_Verify : System.Web.UI.Page
    {
          static string  ibr = "",usr="";
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
       // static string ibr = "";
        //protected void Page_Load(object sender, EventArgs e)
        //{
        //    if (string.IsNullOrEmpty(HttpContext.Current.Session["ibr_id"] as string))
        //    {
        //        Response.Redirect("~/BHLogin.aspx");
        //    }
        //    else
        //    {

        //        ibr = HttpContext.Current.Session["ibr_id"].ToString();
        //    }
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
            System.Net.ServicePointManager.SecurityProtocol = System.Net.SecurityProtocolType.Tls | System.Net.SecurityProtocolType.Tls11 | System.Net.SecurityProtocolType.Tls12;

            ds = obj.get_data(44, input);
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
          [WebMethod()]
          public static string cand_detail(string cid)
          {
              DataTable ds = new DataTable();
              ServiceReference1.ServiceClient obj = new ServiceReference1.ServiceClient();
              string data = "";
              System.Net.ServicePointManager.SecurityProtocol = System.Net.SecurityProtocolType.Tls | System.Net.SecurityProtocolType.Tls11 | System.Net.SecurityProtocolType.Tls12;

              ds = obj.get_data(46, cid);


              try
              {
                 // data = ds.Rows[0][9].ToString() + "~" + ds.Rows[0][1].ToString() + "~" + ds.Rows[0][2].ToString() + "~" + ds.Rows[0][3].ToString() + "~" + ds.Rows[0][6].ToString() + "~" + ds.Rows[0][7].ToString() + "~" + ds.Rows[0][11].ToString() + "~" + ds.Rows[0][12].ToString() + "~" + ds.Rows[0][13].ToString() + "~" + ds.Rows[0][14].ToString()+ "~" + ds.Rows[0][14].ToString();

                  data = ds.Rows[0][0].ToString() + "~" + ds.Rows[0][1].ToString() + "~" + ds.Rows[0][2].ToString() + "~" + ds.Rows[0][3].ToString() + "~" +
                    ds.Rows[0][4].ToString() + "~" + ds.Rows[0][5].ToString() + "~" + ds.Rows[0][6].ToString() + "~" + ds.Rows[0][7].ToString() + "~" + ds.Rows[0][8].ToString()
                    + "~" + ds.Rows[0][9].ToString() + "~" + ds.Rows[0][10].ToString() + "~" + ds.Rows[0][11].ToString()
                    + "~" + ds.Rows[0][12].ToString() + "~" + ds.Rows[0][13].ToString() + "~" + ds.Rows[0][14].ToString();
                
                  return data;

              }
              catch (Exception ex)
              {
                  return "";
              }

          }

        public class docview
        {

            public string did { get; set; }
            public string cid { get; set; }
            public string des { get; set; }
            public string parent { get; set; }
            public string child { get; set; }
            public string seqid { get; set; }
        }
        public List<docview> emp_doc { get; set; }
        [WebMethod(EnableSession = true)]
        public static List<docview> get_doc_dtl(string input)
        {
            
            List<docview> emp_doc = new List<docview>();
            ServiceReference1.ServiceClient obj = new ServiceReference1.ServiceClient();
            DataTable ds = new DataTable();
            System.Net.ServicePointManager.SecurityProtocol = System.Net.SecurityProtocolType.Tls | System.Net.SecurityProtocolType.Tls11 | System.Net.SecurityProtocolType.Tls12;

            ds = obj.get_data(33, input);
            try
            {
                if (ds.Rows.Count > 0)
                {
                    foreach (DataRow dr in ds.Rows)
                    {
                        emp_doc.Add(new docview()
                        {
                            parent = dr["parent_id"].ToString(),
                            child = dr["child_id"].ToString(),
                            des = dr["description"].ToString(),
                            did = dr["docid"].ToString(),
                            cid = dr["chid"].ToString(),
                            seqid = dr["doc_seq_no"].ToString(),
                            // NO_OF_ATTEMPT1 = dr["NO_OF_ATTEMPT"].ToString(),
                        });
                    }
                }
            }
            catch (Exception ex)
            {
            }
            return emp_doc;


        }

        [WebMethod(EnableSession = true)]
        public static string Documents_download(string input)
        {
            byte[] s;
            ServiceReference1.ServiceClient obj = new ServiceReference1.ServiceClient();
            DataTable ds = new DataTable();
            System.Net.ServicePointManager.SecurityProtocol = System.Net.SecurityProtocolType.Tls | System.Net.SecurityProtocolType.Tls11 | System.Net.SecurityProtocolType.Tls12;

            ds = obj.get_data(34, input);
            string DocFileName = ds.Rows[0][1].ToString();
            if (ds.Rows.Count > 0)
            {
                if ((ds.Rows[0][0].ToString()) != "")
                {
                    s = (byte[])(ds.Rows[0][0]);
                    string ct = ds.Rows[0][2].ToString();
                    BH_Verify d = new BH_Verify();
                    d.DownloadFile(DocFileName, s, ct);
                }



            }
            return DocFileName;
        }

        public void DownloadFile(string fn, byte[] s, string ct)
        {
            string FileName = fn;
            System.Web.HttpResponse Response = System.Web.HttpContext.Current.Response;
            using (Stream file = File.OpenWrite(Server.MapPath("~/Images/" + fn)))
            {
                file.Write(s, 0, s.Length);
            }
        }
        [WebMethod(EnableSession = true)]
        public static string deleteDownloadFile(string input)
        {
            string fname = input;
            BH_Verify d = new BH_Verify();
            d.fileDelete(fname);
            return "File Deleted Successfully";
        }
        public void fileDelete(string fname)
        {
            System.IO.File.Delete(Server.MapPath("~/Images/" + fname));
        }



        [WebMethod(EnableSession = true)]
        public static string approve(string input)
        {
            string s = "";
            ServiceReference1.ServiceClient obj = new ServiceReference1.ServiceClient();
            DataTable ds = new DataTable();
            System.Net.ServicePointManager.SecurityProtocol = System.Net.SecurityProtocolType.Tls | System.Net.SecurityProtocolType.Tls11 | System.Net.SecurityProtocolType.Tls12;

            // s = obj.insert_data("28", input);
            ds = obj.get_data(42, input);

            if (ds.Rows.Count > 0)
            {
                s = ds.Rows[0][0].ToString();
            }
            return s;
        }


        public class empqudt
        {
            public string category { get; set; }
            public string qualification { get; set; }
            public string university { get; set; }
            public string institution { get; set; }
            public string YEAR_PASS { get; set; }
            public string percentage { get; set; }
            public string grade { get; set; }
            public string NO_OF_ATTEMPT { get; set; }
            public string typ_reg { get; set; }
            public string high { get; set; }

        }
        public List<empqudt> emp_dtquql { get; set; }
        [WebMethod(EnableSession = true)]
        public static List<empqudt> get_qual_dtl(string input)
        {
            ServiceReference1.ServiceClient obj = new ServiceReference1.ServiceClient();
            List<empqudt> emp_dtquql = new List<empqudt>();
           
            DataTable ds = new DataTable();
            System.Net.ServicePointManager.SecurityProtocol = System.Net.SecurityProtocolType.Tls | System.Net.SecurityProtocolType.Tls11 | System.Net.SecurityProtocolType.Tls12;

            ds = obj.get_data(60, input);
            //     ds = obj.getdata("78", input);
            try
            {
                if (ds.Rows.Count > 0)
                {
                    foreach (DataRow dr in ds.Rows)
                    {
                        emp_dtquql.Add(new empqudt()
                        {
                            category = dr["category"].ToString(),
                            qualification = dr["qualification"].ToString(),
                            university = dr["university_name"].ToString(),
                            institution = dr["institution"].ToString(),
                            YEAR_PASS = dr["YEAR_PASS"].ToString(),
                            percentage = dr["percentage"].ToString(),
                            grade = dr["grade"].ToString(),
                            NO_OF_ATTEMPT = dr["NO_OF_ATTEMPT"].ToString(),
                            typ_reg = dr["typ"].ToString(),
                            high = dr["high"].ToString(),
                        });
                    }
                }
            }
            catch (Exception ex)
            {
            }
            return emp_dtquql;


        }


        [WebMethod(EnableSession = true)]
        public static string get_emp_dtl(string input)
        {
            string s = "";
            ServiceReference1.ServiceClient obj = new ServiceReference1.ServiceClient();
            DataTable ds = new DataTable();
            System.Net.ServicePointManager.SecurityProtocol = System.Net.SecurityProtocolType.Tls | System.Net.SecurityProtocolType.Tls11 | System.Net.SecurityProtocolType.Tls12;

            ds = obj.get_data(61, input);
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






        [WebMethod(EnableSession = true)]
        public static string get_family_dtl2(string input)
        {
            string s = "";
            ServiceReference1.ServiceClient obj = new ServiceReference1.ServiceClient();
            DataTable ds = new DataTable();
            System.Net.ServicePointManager.SecurityProtocol = System.Net.SecurityProtocolType.Tls | System.Net.SecurityProtocolType.Tls11 | System.Net.SecurityProtocolType.Tls12;

            ds = obj.get_data(63, input);
          //  ds = obj.access_hrm("23", input);
            if (ds.Rows.Count > 0)
            {
                s = ds.Rows[0][0].ToString() + "~" + ds.Rows[0][1].ToString() + "~" + ds.Rows[0][2].ToString() + "~" + ds.Rows[0][3].ToString() + "~" +
                    ds.Rows[0][4].ToString() + "~" + ds.Rows[0][5].ToString() + "~" + ds.Rows[0][6].ToString() + "~" + ds.Rows[0][7].ToString() + "~" +
                    ds.Rows[0][8].ToString() + "~" + ds.Rows[0][9].ToString() + "~" + ds.Rows[0][10].ToString() + "~" +
                    ds.Rows[0][11].ToString() + "~" + ds.Rows[0][12].ToString() + "~" + ds.Rows[0][13].ToString() + "~" + ds.Rows[0][14].ToString();


            }
            return s;
        }

        public class empsib
        {
            public string sib_name { get; set; }
            public string qualification { get; set; }
            public string occup { get; set; }
            public string occup_any { get; set; }
            public string sal { get; set; }
            public string gen { get; set; }

        }
        public List<empsib> emp_dtsib { get; set; }
        [WebMethod(EnableSession = true)]
        public static List<empsib> get_sib_dtl(string input)
        {
            ServiceReference1.ServiceClient obj = new ServiceReference1.ServiceClient();
           
           
            
            List<empsib> emp_dtsib = new List<empsib>();
          
            DataTable ds = new DataTable();
            System.Net.ServicePointManager.SecurityProtocol = System.Net.SecurityProtocolType.Tls | System.Net.SecurityProtocolType.Tls11 | System.Net.SecurityProtocolType.Tls12;

            ds = obj.get_data(64, input);
            //ds = obj.access_hrm("27", input);
            //     ds = obj.getdata("78", input);
            try
            {
                if (ds.Rows.Count > 0)
                {
                    foreach (DataRow dr in ds.Rows)
                    {
                        emp_dtsib.Add(new empsib()
                        {
                            sib_name = dr["sib_name"].ToString(),
                            qualification = dr["sib_qual"].ToString(),
                            occup = dr["sib_occup"].ToString(),
                            occup_any = dr["sib_occu_any"].ToString(),
                            sal = dr["sib_sal"].ToString(),
                            gen = dr["gender"].ToString(),

                        });
                    }
                }
            }
            catch (Exception ex)
            {
            }
            return emp_dtsib;


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
        public static List<ref1> get_ref_dtl(string input)
        {
            ServiceReference1.ServiceClient obj = new ServiceReference1.ServiceClient();



            List<ref1> emp_dtref = new List<ref1>();

            DataTable ds = new DataTable();
            System.Net.ServicePointManager.SecurityProtocol = System.Net.SecurityProtocolType.Tls | System.Net.SecurityProtocolType.Tls11 | System.Net.SecurityProtocolType.Tls12;

            ds =  obj.proc_hrm_common_select("15", "27", input); 
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

    }
}