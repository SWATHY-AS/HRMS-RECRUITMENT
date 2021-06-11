<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Photo_Upload.aspx.cs" Inherits="Ma_Aspirant.Recruitment.Photo_Upload" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">     
    <script>
        function bhschedul_tab() {
            window.open("../Recruitment/BH_notific.aspx", "_self");
        }
        function verify_tab() {
            window.open("../Recruitment/BH_Verify.aspx", "_self");
        }
        function pic_tab() {
            window.open("../Recruitment/Photo_Upload.aspx", "_self");
        }

           function exit() {
            window.location.href = "../BH_Login.aspx"
           }
           $(window).load(function () {
               empload();

           });
           function empload()
           {
               var empid = $("[id*=txt_session]").val();
               var br = $("[id*=txt_br]").val();
               var row = br + '~' + empid;
           $.ajax({
               type: "POST",
               contentType: "application/json; charset=utf-8",
               url: "Photo_Upload.aspx/cand_codedtl",
               data: "{ input: '" + row + "' }",
               //data: {},
               dataType: "json",
               success: function (Result) {
                   Result = Result.d;
                    
                   $.each(Result, function (key, value) {
                       $("#dd_cand").append($("<option></option>").val
                           (value.cand_id).html(value.cand_name));
                   });
               }
           });
           }

           function SaveImage() {
             
               var empid = $("[id*=txt_session]").val();
               var cid = $("#dd_cand").val();
               var des1 = $("#txt_rmk").val();



               if (cid == 0 || des1 == '') {
                   if (cid == '') {
                       alert("Select Candidate");
                   }
                   else if (des1 == '') {
                       alert("Enter Description");
                   }
               }
               else {
                  


                   var fileList = document.getElementById("FileUpload1").files;
                   //      var fileList = document.getElementById("imgFileType").files;
                   var fileReader = new FileReader();
                   if (fileReader && fileList && fileList.length) {
                       var d = new Date();
                       var timeStamp = d.getDate() + "-" + d.getMonth() + "-" + d.getFullYear() + "_" + d.getHours() + ":" + d.getMinutes() + ":" + d.getSeconds();
                       var fileName = "RECRT_" + fileList[0].name;
                       // Use a regular expression to trim everything before final dot
                       //extension = fileName.replace(/^.*\./, '');

                       // Iff there is no dot anywhere in filename, we would have extension == filename,
                       // so we account for this possibility now
                       //if (extension == fileName) {
                       //    extension = '';
                       //} else {
                       //    extension = extension.toLowerCase();
                       //}
                       //fileReader.readAsArrayBuffer(fileList[0]);
                       fileReader.readAsDataURL(fileList[0]);
                       fileReader.onload = function () {
                           var imageData = fileReader.result;
                           //var flag = $("#txtflg").val();

                           var d1 = imageData.split(":");

                           var d3 = d1[1].split(";");
                           //  var cc = emp + "~" + doc1 + "~" + doc2 + "~" + des1 + "~" + sess + "~" + d3[0] + "~" + fileName;
                         //  var cc = empid + "~" + doc1 + "~" + doc2 + "~" + des1 + "~" + d3[0] + "~" + fileName;
                           // alert(cc);
                           var cc = empid + "µ" + cid + "µ" + des1 + "µ" + d3[0] + "µ" + fileName;

                           $.ajax({
                               type: "POST",
                               contentType: "application/json; charset=utf-8",
                               url: "Photo_Upload.aspx/Documents_upload",
                               //  data: "{ flag: '" + flag + "',emp: '" + emp + "',docid: '" + doc1 + "',child: '" + doc2 + "',des: '" + des1 + "',enterby: '" + sess + "',upload_file: '" + imageData + "'}",
                               data: "{ input: '" + cc + "',upload_file: '" + imageData + "'}",

                               dataType: "json",
                               beforeSend: function () {
                                   return confirm("Are you sure you want to confirm?");
                               },
                               success: function (Result) {
                                   var res = Result.d;
                                   alert(res);
                                   window.open("../Recruitment/Photo_Upload.aspx", "_self");
                               },
                               error: function (Result) {
                                   alert("Please check size of the document size  must be  less than 1MB ");
                               }
                           });
                       };
                   }
                   else {
                       alert("Select Any File");
                       return;
                   }
               }
           }
           function SaveImage11() {

               var empid = $("[id*=txt_session]").val();
               var cid = $("#dd_cand").val();
               var des1 = $("#txt_rmk").val();


             
               if (cid == 0 || des1 == '') {
                   if (cid == '') {
                       alert("Select Candidate");
                   }
                   else if (des1 == '') {
                       alert("Enter Description");
                   }
               }
               else {

                   var fileList = document.getElementById("FileUpload1").files;
                   //      var fileList = document.getElementById("imgFileType").files;
                   var fileReader = new FileReader();
                   if (fileReader && fileList && fileList.length) {
                       var d = new Date();
                       var timeStamp = d.getDate() + "-" + d.getMonth() + "-" + d.getFullYear() + "_" + d.getHours() + ":" + d.getMinutes() + ":" + d.getSeconds();
                       var fileName = "RECRT_" + fileList[0].name;
                       // Use a regular expression to trim everything before final dot
                       //extension = fileName.replace(/^.*\./, '');

                       // Iff there is no dot anywhere in filename, we would have extension == filename,
                       // so we account for this possibility now
                       //if (extension == fileName) {
                       //    extension = '';
                       //} else {
                       //    extension = extension.toLowerCase();
                       //}
                       //fileReader.readAsArrayBuffer(fileList[0]);
                       fileReader.readAsDataURL(fileList[0]);
                       fileReader.onload = function () {
                           var imageData = fileReader.result;
                           //var flag = $("#txtflg").val();

                           var d1 = imageData.split(":");

                           var d3 = d1[1].split(";");
                           //  var cc = emp + "~" + doc1 + "~" + doc2 + "~" + des1 + "~" + sess + "~" + d3[0] + "~" + fileName;
                           var cc = empid + "µ" + cid + "µ" + des1 + "µ" + d3[0] + "µ" + fileName;
                            //alert(cc);
                            //alert(imageData);
                          
                           $.ajax({
                               type: "POST",
                               contentType: "application/json; charset=utf-8",
                               url: "Photo_Upload.aspx/Documents_upload",
                               //  data: "{ flag: '" + flag + "',emp: '" + emp + "',docid: '" + doc1 + "',child: '" + doc2 + "',des: '" + des1 + "',enterby: '" + sess + "',upload_file: '" + imageData + "'}",
                               data: "{ input: '" + cc + "',upload_file: '" + imageData + "'}",

                               dataType: "json",
                               beforeSend: function () {
                                   return confirm("Are you sure you want to confirm?");
                               },
                               success: function (Result) {

                                   window.open("../Recruitment/Photo_Upload.aspx", "_self");
                               },
                               error: function (Result) {
                                   alert("Please check size of the document size  must be  less than 1MB ");
                               }
                           });
                       };
                   }
                   else {
                       alert("Select Any File");
                       return;
                   }
               }
           }

           function leftTrim(element) {
               if (element)
                   element.value = element.value.replace(/^\s+/, "");
           }
    </script>
 </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <div class="panel panel-default col-md-12">
        <div id="Tabs" role="tabpanel">
            <!-- Nav tabs -->
           <ul class="nav nav-pills" role="tablist">
                 <li ><a href="#notific" aria-controls="notific" role="tab" data-toggle="pill" onclick="bhschedul_tab()">Schedule Interview</a></li>
                
                 <li><a href="#verify" aria-controls="verify" role="tab" data-toggle="pill" onclick="verify_tab()">Verify Docs</a></li>
                                     <li class="active" ><a href="#photoupload" aria-controls="photoupload" role="tab" data-toggle="pill" onclick="pic_tab()">Photo Upload</a></li>
                    </ul>
            <!-- Tab panes -->
             <form id="Form2" class="form-horizontal row-border" action="#" runat="server">
                <div class="tab-content">

              <div class="row ">
                            <div class="ma-header">
                                <div class="col-md-12">
                                    <h3 style="color: #091221"><i class="glyphicon glyphicon-camera"></i>  PHOTO UPLOAD</h3>
                                </div>
                            </div>
                        </div>
                      <br />
                 <div class="design col-md-12">
                 
                
                       <div class="form-group"><div id="abc" hidden="hidden">
                            <div class="col-md-4">
                                <input type="text" name="regular" class="form-control" id="txtflg" maxlength="30"/>
                            </div>   
                           </div>                        
                        </div>
                     <div class="form-group">   <div class="col-md-2"></div>
                             <asp:TextBox ID="txt_session" runat="server" hidden="hidden" ></asp:TextBox>
                                    <asp:TextBox ID="txt_br" runat="server" hidden="hidden" ></asp:TextBox>
                        <label class="col-md-2 cntr-text">Select Candidate: </label>
                        <div class="col-md-4">
                            <select class="form-control" id="dd_cand">
                              <option value="-1" selected="selected">--SELECT--</option> 
                            </select>
                        </div>
                        </div>
                       <div id="Selfieupload" class="clonedInput">
                                <div class="widget-content">
                         <div class="form-group">   <div class="col-md-2"></div>
                        <label class="col-md-2 cntr-text">Choose Photo to upload:</label>
                        <div class="col-md-4">
                            <input type="file" data-style="fileinput" id="FileUpload1"  />
                        </div>
                             </div></div></div>
                     
                             <div class="form-group"><div class="col-md-2"></div>
                            <label class="col-md-2 cntr-text">Remark</label>
                            <div class="col-md-4">
                                                <textarea class="form-control" rows="2" id="txt_rmk" maxlength="200" onblur="leftTrim(this)"  onkeyup="this.value=this.value.toUpperCase()"></textarea>
                            </div>                           
                        </div>
                       

                    </div>
                    <br /><br />
                      <br /><br />
                     <div class="form-group"> 
                       <div class="widget box align-center"> <br /><br />
                         <input id="btn_saves" type="button" value="Upload" class="btn btn-info " onclick="SaveImage11()" style="border-radius:25px;width:180px" />
                                <input id="btn_next" type="button" value="Exit"  class="btn btn-info" onclick="exit()" style="border-radius:25px;width:180px" />

       </div></div> 
                      <br /><br />
                      <br /><br />
                    </div>
                  
             </form> 
            </div>
             </div>
</asp:Content>
