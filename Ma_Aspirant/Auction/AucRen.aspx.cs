using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Ma_Aspirant.Auction
{
    public partial class AucRen : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [WebMethod()]
        public static string searchAuc(string data)
        {
            DataTable ds = new DataTable();
            ServiceReference1.ServiceClient obj = new ServiceReference1.ServiceClient();
            string res1 = "";
            System.Net.ServicePointManager.SecurityProtocol = System.Net.SecurityProtocolType.Tls | System.Net.SecurityProtocolType.Tls11 | System.Net.SecurityProtocolType.Tls12;
            try
            {
                ds = obj.get_data(79, data);//Get auctioneer data

                if (ds.Rows.Count > 0)
                {
                    if (ds.Rows[0][0].ToString()=="333")
                    {
                        res1= "333";
                    }
                    else { 
                     res1 = ds.Rows[0][0].ToString() + "~" + ds.Rows[0][1].ToString() + "~" + ds.Rows[0][2].ToString() + "~" + ds.Rows[0][3].ToString();
                    }
                    return res1;
                }
                else
                {
                    return "333";
                }
            }
            catch(Exception ex)
            {
                return ex.Message;
            }


        }

        [WebMethod(EnableSession = true)]
        //string input, string image
        public static string doc_upload(string input, string image)
        {
            string result = "";
            DataTable ds = new DataTable();
            // input = "10006µ"+ input.Split('µ')[1].ToString();
            ServiceReference1.ServiceClient obj = new ServiceReference1.ServiceClient();
            try
            {
                
                        string imageName1 = DateTime.Now.ToString("dd-MM-yy hh-mm-ss");
                        string emp = input + imageName1;
                        string InputString = image.Split(',')[1];

                        byte[] imgByte = Convert.FromBase64String(InputString);
                        System.Net.ServicePointManager.SecurityProtocol = System.Net.SecurityProtocolType.Tls | System.Net.SecurityProtocolType.Tls11 | System.Net.SecurityProtocolType.Tls12;

                        result = obj.EnrolDocumentUpload("4", input, imgByte);
                   
                  
             
                return result;
            }
            catch (Exception ex)
            {
                return "222";
            }
        }

    }
}