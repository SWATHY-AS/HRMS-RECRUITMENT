using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Ma_Aspirant.Recruitment
{
    public partial class baseimg : System.Web.UI.Page
    {
      protected void Page_Load(object sender, EventArgs e)

{

        //called page form json for creating imgBase64 in image

        StreamReader reader = new StreamReader(Request.InputStream);

        String Data = Server.UrlDecode(reader.ReadToEnd());

        reader.Close();

 

        DateTime nm = DateTime.Now;

        string date = nm.ToString("yyyymmddMMss");

        //used date for creating Unique image name

        Session["capturedImageURL"] = Server.MapPath("~/Userimages/") + date + ".jpeg"; 

        Session["Imagename"] = date + ".jpeg";

   // We can use name of image where ever we required that why we are storing in Session

        drawimg(Data.Replace("imgBase64=data:image/png;base64,", String.Empty), Session["capturedImageURL"].ToString());

        // it is method

        // passing base64 string and string filename to Draw Image.

        insertImagePath(Session["Imagename"].ToString(), "~/Userimages/" + Session["Imagename"].ToString());

        // it is method

        //inserting image in to database         

}

//Drawing Method

public void drawimg(string base64, string filename)  // Drawing image from Base64 string.

{

    using (FileStream fs = new FileStream(filename, FileMode.OpenOrCreate, FileAccess.Write))

    {

        using (BinaryWriter bw = new BinaryWriter(fs))

        {

            byte[] data = Convert.FromBase64String(base64);

            bw.Write(data);

            bw.Close();

        }

    }

}
    }
}