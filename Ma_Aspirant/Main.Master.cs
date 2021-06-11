using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Ma_Aspirant
{
    public partial class Main : System.Web.UI.MasterPage
    {
        static string candcode = "", ibr="";
        protected void Page_Load(object sender, EventArgs e)
        {         

                //candcode = HttpContext.Current.Session["candcode"].ToString();        
                //ibr = HttpContext.Current.Session["ibr_id"].ToString();          

        }
        protected void rpt_submenu_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {

        }
        protected void rpt_mainmenu_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
        }
    }

}