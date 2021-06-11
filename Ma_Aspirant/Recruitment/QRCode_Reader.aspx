<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="QRCode_Reader.aspx.cs" Inherits="Ma_Aspirant.Recruitment.QRCode_Reader" %>

<!DOCTYPE html>
 <script type="text/javascript" src="../App_Themes/Theme/assets/js/webcam.js"></script>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Aadhar QR Code Reader</title>
  <%--  <script src="App_Themes/Theme/assets/js/scanner.js"></script>--%>
</head>
<body>
    <h1>Aadhar QR Code Reader</h1>
   
     
         <%--<p class="lead" style="text-align: center">
             <input id="File1" class="btn btn-success btn-sm" type="file" accept="image/*" runat="server" capture="camera" /></p>--%>

   <!-- CSS -->
<style>
#my_camera{
 width: 320px;
 height: 240px;
 border: 1px solid black;
}
</style>

<div id="my_camera"></div>
<input type="button" value="Take Snapshot" onclick="take_snapshot()"/>
 
<div id="results" ></div>
 
<!-- Webcam.min.js -->
<script type="text/javascript" src="../App_Themes/Theme/assets/js/webcam.js"></script>
<script type="text/javascript" src="../App_Themes/Theme/assets/js/webcam.min.js"></script>

<!-- Configure a few settings and attach camera -->
<script type="text/javascript">
    Webcam.set({
        width: 320,
        height: 240,
        image_format: 'jpeg',
        jpeg_quality: 90
    });
    Webcam.attach( '#my_camera' );

  //  <!-- Code to handle taking the snapshot and displaying it locally -->
    function take_snapshot() {
 
        // take snapshot and get image data
        Webcam.snap( function(data_uri) {
            // display results in page
            document.getElementById('results').innerHTML = 
            '<img src="'+data_uri+'"/>';
        } );
    }
</script>

  <script type="text/javascript">
     

   
        //function readQR(){
        //    return function(req, res, next){

        //        var base64Image = req.body.image;   // Load base64 image 
        //        var decodedImg = decodeBase64Image(base64Image);
        //        var imageBuffer = new Buffer(decodedImg.data, 'base64');

        //        fs.writeFileSync(path.join(__dirname, '../', '/temp/image.jpg'), imageBuffer, {encoding: 'base64'}, function(err){
        //            if(err) console.log(err);
        //        });
        //        var buffer = fs.readFileSync(path.join(__dirname, '../', '/temp/image.jpg'));

        //        Jimp.read(buffer, function(error, image){
        //            if(error) console.log(error);
        //            qr.callback = function(err, value){
        //                if(err) console.log(err);
        //                console.log(value);
        //                if(/^(\w{16,16})$/.test(value.result)) res.json({dmac: value.result});
        //                else res.json({
        //                    error: 'Invalid dmac address'
        //                })
        //            };
        //            qr.decode(image.bitmap);
        //        })
        //    }
        //}
        //function startScanner() {
        //    $('#preview').show();
        //    let Scanner = new Instascan.Scanner({
        //        video: document.getElementById('preview'),
        //        continuous: true,
        //        mirror: false,
        //        captureImage: false,
        //        backgroundScan: true,
        //        refractoryPeriod: 1000,
        //        scanPeriod: 1
        //    });
        //    scanner.addListener('scan', function (content) {
        //        return content;
        //    });

          
        //    Instascan.Camera.getCameras().then(function (cameras) {
        //        if (cameras.length > 0) {
        //            scanner.start(cameras[0]);
        //        } else {
        //            console.error('No cameras found.');
        //        }
        //    }).catch(function (e) {
        //        console.error(e);
        //    });
        //    function splitcommon(sting) {

        //        var res = sting.split('="');
        //        alert("1");           
        //        return res[1];
        //    }
        //}
    </script>

   
</body>
</html>
