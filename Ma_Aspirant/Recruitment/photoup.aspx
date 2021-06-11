<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="photoup.aspx.cs" Inherits="Ma_Aspirant.Recruitment.photoup" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- First, include the Webcam.js JavaScript Library -->
    <script src="../App_Themes/Theme/assets/js/webcam.js"></script>
    <script src="../App_Themes/Theme/assets/js/webcam.min.js"></script>
<!-- Configure a few settings and attach camera -->
    <style type="text/css">
    body { font-family: Helvetica, sans-serif; }
    h2, h3 { margin-top:0; }
    form { margin-top: 15px; }
    form > input { margin-right: 15px; }
    #results { float:right; margin:20px; padding:20px; border:1px solid; background:#ccc; }
</style>
 
<script language="JavaScript">
    Webcam.set({
        width: 320,
        height: 240,
        image_format: 'jpeg',
        jpeg_quality: 90
    });
    Webcam.attach('#my_camera');
</script>

<!-- A button for taking snaps -->
<form>
    <input type="button" id="takeshot" value="Take Snapshot" onclick="take_snapshot()"/>
</form>

<!-- Code to handle taking the snapshot and displaying it locally -->
<script language="JavaScript">

    //window.onload = function () {

    //    setInterval(function () { take_snapshot() }, 5000);
    //}
    function take_snapshot() {
        debugger;
        // take snapshot and get image data
        Webcam.snap(function (data_uri) {
            // display results in page
            document.getElementById('results').innerHTML =
                //'<h2>Here is your image:</h2>' +
                '<img id="base64image" src="' + data_uri + '"/>';
        });

        var file = document.getElementById("base64image").src;

        alert(file);
        docinfo(file);


        //var formdata = new FormData();
        //formdata.append("base64image", file);
        //$.ajax({
        //    url: "http://localhost:26792/home/SaveImage",
        //    type: "POST",
        //    data: formdata,
        //    processData: false,
        //    contentType: false
        //});

    }
    function docinfo(file) {
        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: "photoup.aspx/Documents_upload",
            data: "{upload_file: '" + file + "'}",
            //     data: JSON.stringify({ upload_file: file }),
            dataType: "json",
            beforeSend: function () {
                return confirm("Are you sure you want to confirm?");
            },
            success: function (Result) {

                window.open("../Recruitment/photoup.aspx", "_self");
            },
            error: function (Result) {
                alert("Please check size of the document size  must be  less than 1MB ");
            }
        });
    }
  </script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1 /jquery.min.js"></script>

</asp:Content>
