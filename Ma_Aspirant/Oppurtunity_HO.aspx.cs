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
    public partial class Oppurtunity_HO : System.Web.UI.Page
    {
        string ide = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
               string idee = Request["id"];
               this.txt_id.Text = idee.ToString();

                //ServiceReference1.ServiceClient obj = new ServiceReference1.ServiceClient();
                //DataTable ds = new DataTable();
                //ds = obj.proc_hrm_common_select("42", "2", idee);


            }
        }


       
        [WebMethod(EnableSession = true)]
        public static string vcncy_dtl(string input)
        {
            ServiceReference1.ServiceClient obj = new ServiceReference1.ServiceClient();
         
             string s = "";
            DataTable ds = new DataTable();
            // ds = obj.getdata("133", "0");
            System.Net.ServicePointManager.SecurityProtocol = System.Net.SecurityProtocolType.Tls | System.Net.SecurityProtocolType.Tls11 | System.Net.SecurityProtocolType.Tls12;

            ds = obj.proc_hrm_common_select("42","2",input);


            try
            {
                if (ds.Rows.Count > 0)
                {

                    s = ds.Rows[0][0].ToString() + "~" + ds.Rows[0][1].ToString() + "~" + ds.Rows[0][2].ToString() + "~" + ds.Rows[0][3].ToString() + "~" +
                                        ds.Rows[0][4].ToString() + "~" + ds.Rows[0][5].ToString() + "~" + ds.Rows[0][6].ToString() + "~" + ds.Rows[0][7].ToString() + "~" +
                                        ds.Rows[0][8].ToString() + "~" + ds.Rows[0][9].ToString() + "~" + ds.Rows[0][10].ToString() + "~" +
                                        ds.Rows[0][11].ToString() + "~" + ds.Rows[0][12].ToString() + "~" + ds.Rows[0][13].ToString() + "~" + ds.Rows[0][14].ToString();
                  
                }
            }
            catch (Exception ex)
            {
            }
            return s;
        }

      
    }
}