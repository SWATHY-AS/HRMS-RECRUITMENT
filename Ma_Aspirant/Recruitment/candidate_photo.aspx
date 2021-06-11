<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="candidate_photo.aspx.cs" Inherits="Ma_Aspirant.Recruitment.candidate_photo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
             <script src="../App_Themes/Theme/assets/js/online.js" ></script>

    <script>  
         $(window).load(function () {

             test_pass();
             // $("#linko").show();

        });
        

        function isNumberKey(evt, element) {

            var charCode = (evt.which) ? evt.which : event.keyCode
            if (charCode > 31 && (charCode < 48 || charCode > 57) && !(charCode == 8))
                return false;
        }
         

        function onlyAlphabets(e, t) {

            try {
                if (window.event) {
                    var charCode = window.event.keyCode;
                }
                else if (e) {
                    var charCode = e.which;
                }
                else { return true; }
                if ((charCode > 64 && charCode < 91) || (charCode > 96 && charCode < 123) || (charCode == 8) || (charCode == 32))
                    return true;
                else
                    return false;
            }
            catch (err) {
                alert(err.Description);
            }
        }
      

        function upload() {
            var empid = $("[id*=txt_session]").val();
            var fileList = document.getElementById("FileUpload11").files;
            //      var fileList = document.getElementById("imgFileType").files;
            var fileReader = new FileReader();
            if (fileReader && fileList && fileList.length) {
                var d = new Date();
                var timeStamp = d.getDate() + "-" + d.getMonth() + "-" + d.getFullYear() + "_" + d.getHours() + ":" + d.getMinutes() + ":" + d.getSeconds();
                var fileName = "RECRT_" + fileList[0].name;
                fileReader.readAsDataURL(fileList[0]);
                fileReader.onload = function () {
                    var imageData = fileReader.result;
                    var d1 = imageData.split(":");

                    var d3 = d1[1].split(";");

                    //     var cc = empid + "~" + '' + "~" + des1 + "~" + d3[0] + "~" + fileName;

                    var cc = empid + "µ" + 1 + "µ" + 0 + "µ" + '' + "µ" + d3[0] + "µ" + fileName;
                   

                    $.ajax({
                        type: "POST",
                        contentType: "application/json; charset=utf-8",
                        url: "candidate_photo.aspx/Documents_upload",
                        data: "{input:'"+ cc +"',upload_file: '" + imageData + "'}",
                        dataType: "json",
                        beforeSend: function () {
                            return confirm("Are you sure you want to confirm?");
                        },
                        success: function (Result) {
                            
                            var res = Result.d;
                             alert(Result.d);
                              
                        },
                        error: function (Result) {
                            alert("Please Reduce size of document and try again");
                            //alert("Uploaded");
                        }
                    });
                };
            }
            else {
                alert("Select Any File");
               // alert("Uploaded");
                return;
            }
        }


        function rdo_marital()//swathy
        {
          
            if ($('input[id=rdo_upload]').is(':checked')) {
                $('#upddiv').show();
                $('#camdiv').hide();                
                // $('#camid').hide();
            }
            if ($('input[id=rdo_camera]').is(':checked')) {
                $('#upddiv').hide();
                $('#camdiv').show();
                //$('#camid').show();
                  
                // window.location.href = "base.html";
                //window.location.href = "photoup.aspx";
            }
        }
          
        function cand_data()
        {
            var empid = $("[id*=txt_session]").val();

            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "candidate_photo.aspx/cam_upload",
                data: "{input:'" + empid + "'}",
                dataType: "json",
                beforeSend: function () {
                    return confirm("Are you sure you want to confirm?");
                },
                success: function (Result) {
                    //   alert(Result.d);
                    var res = Result.d;
                    alert(res);
                    window.open("../Recruitment/candidate_photo.aspx", "_self");
                },
                error: function (Result) {
                    alert("Please Reduce size of document and try again");
                }
            });
        }

        function SaveImage11() {

            var empid = $("[id*=txt_session]").val();
             
            var des1 = '';


             
            if (empid == '' ) {
                if (empid == '') {
                    alert("Select Candidate");
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
                        
                   //     var cc = empid + "~" + '' + "~" + des1 + "~" + d3[0] + "~" + fileName;
                        var cc = empid + "µ" + 1 + "µ" + 0 + "µ" + '' + "µ" + d3[0] + "µ" + fileName;
                       // var cc = empid + "µ" + 1 + "µ" +'' + "µ" + '' + "µ" + des1 + "µ" + d3[0] + "µ" + fileName;
                       
                     
                        //alert(imageData);
                          
                        $.ajax({
                            type: "POST",
                            contentType: "application/json; charset=utf-8",
                            url: "candidate_photo.aspx/Documents_upload",
                            //  data: "{ flag: '" + flag + "',emp: '" + emp + "',docid: '" + doc1 + "',child: '" + doc2 + "',des: '" + des1 + "',enterby: '" + sess + "',upload_file: '" + imageData + "'}",
                            data: "{ input: '" + cc + "',upload_file: '" + imageData + "'}",

                            dataType: "json",
                            beforeSend: function () {
                                return confirm("Are you sure you want to confirm?");
                            },
                            success: function (Result) {

                                window.open("../Recruitment/candidate_photo.aspx", "_self");

                            },
                            error: function (Result) {
                                alert("Please Reduce size of document and try again");
                              //  alert("Uploaded");

                            }
                        });
                    };
                }
                else {
                   alert("Select Any File");
                    //alert("Uploaded");
                    return;
                }
            }
        }




        function numpercent(e) {

            var keyCode = (e.which) ? e.which : e.keyCode;
            if ((keyCode >= 48 && keyCode <= 57) || (keyCode == 8))
                return true;
            else if (keyCode == 46) {
                var curVal = document.activeElement.value;
                if (curVal != null && curVal.trim().indexOf('.') == -1)
                    return true;
                else
                    return false;
            }
            else
                return false;
        }



        function leftTrim(element) {
            if (element)
                element.value = element.value.replace(/^\s+/, "");
        }

  
    

     
        function quali_tab() {
            window.open("../Recruitment/qualification.aspx", "_self");
        }
        function com_nom() {
    //alert("com_nom");
    window.open("../Salary/common_nomination_form.aspx", "_self");
}
        function trainig() {
            var empid = $("[id*=txt_session]").val();

            //$.ajax({
            //    type: "POST",
            //    contentType: "application/json; charset=utf-8",
            //    url: "candidate_photo.aspx/biodata_insert",
            //    data: "{input:'" + empid + "'}",
            //    dataType: "json",
                
            //    success: function (Result) {
            //        var res = Result.d;                   
            //    },
            //    error: function (Result) {
            //        alert("Please check size of the document size  must be  less than 1MB ");
            //    }
            //});
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "candidate_photo.aspx/training_pdf",
                data: "{input:'" + empid + "'}",
                dataType: "json",
                
                success: function (Result) {
                    //   alert(Result.d);
                    var res = Result.d;
                    var res = Result.d.split("~");

                  //  alert(res);
                    // var myUrl = "../Images/" + fileName;
                    if (res[1] == '111' || res[1] == '333') {
                       
                        var myUrl = "../Training/Induction_Manual.pdf";
                        OpenDialog(myUrl, 875, 650, function (termsOfServiceAccepted) {

                            if (termsOfServiceAccepted) {

                                //$.ajax({
                                //    type: "POST",
                                //    contentType: "application/json;charset=utf-8",
                                //    url: "candidate_photo.aspx/deleteDownloadFile",
                                //    data: "{ input: '" + fileName + "' }",
                                //    dataType: "json",
                                //    success: function (Result) {
                                //    },
                                //    error: function (Result) {

                                //    }
                                //});
                            }
                        });
                    }
                    else {
                        alert(res[0]);
                        window.open("../Recruitment/Doc_Scanning.aspx", "_self");

                    }
                   // window.open("../Recruitment/candidate_photo.aspx", "_self");
                },
                error: function (Result) {
                    alert("Please check ");
                }
            });
        }

        function OpenDialog(url, width, height, callback) {
            var win = window.open(url, "Manappuram Document Verification", width, height, "menubar=0,toolbar=0", "_blank");
            var timer = setInterval(function () {
                if (win.closed) {
                    clearInterval(timer);
                    var returnValue = true;
                    callback(returnValue);
                }
            }, 10);
        }
        //17july2020


        function check_tab() {

            var empid = $("[id*=txt_session]").val();
            $.ajax({                ///university
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "Photo_Upload.aspx/get_form",
                data: "{ input : '" + empid + "' }",
                dataType: "json",
                success: function (Result) {
                    Result = Result.d;

                    //  alert(Result);
                    if (Result == "222") {
                        alert("Please Upload documents");
                        window.open("../Recruitment/Doc_Scanning.aspx", "_self");
                    }
                },
                error: function (Result) {

                }
            });
        }



    </script>
       <%--  <script type="text/javascript" src="../App_Themes/Theme/assets/js/personal_det.js"></script>--%>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="panel panel-default col-md-12">
        <div id="Tabs" role="tabpanel">
            <!-- Nav tabs -->
              <ul class="nav nav-pills" role="tablist">
                <li class="geno" ><a href="#personaldet" aria-controls="personaldet" role="tab" data-toggle="pill" onclick="personaldet_tab()" id="tabs2">Personal</a></li>
                 <li   class="gen"><a href="#qualidet" aria-controls="qualidet" role="tab" data-toggle="pill" onclick="quali_tab()" id="tab6">Qualification</a></li>
                                   <li class="gen" ><a href="#family" aria-controls="family" role="tab" data-toggle="pill" onclick="family_tab()" id="tab7">Family</a></li>

                   <li  class="gen"><a href="#experience" aria-controls="experience" role="tab" data-toggle="pill" onclick="ref_tab()" id="tabs4">Reference</a></li>
                                                          <li  class="gen"><a href="#common_nom" aria-controls="common_nom" role="tab" data-toggle="pill" onclick="com_nom()" id="tabs5">Common Nomination Form</a></li>

                                                    <li  class="gen" ><a href="#docupload" aria-controls="empassign" role="tab" data-toggle="pill" onclick="doc_tab()" id="tabs3">Document Upload</a></li>

                   <li  class="active gen"><a href="#photo" aria-controls="exp" role="tab" data-toggle="pill" onclick="photo_tabnew()" id="tabs6">Photo</a></li>
            
                  
                       </ul>
          
            <form id="Form1" class="form-horizontal row-border" action="#" runat="server">
                <div class="tab-content">
                 
                 
                                  
                        <div class="row ">
                            <div class="ma-header">
                                <div class="col-md-12">
                                    <h3 style="color: #091221"><i class="icon-user"></i> Candidate Photo</h3>
                                </div>
                            </div>
                        </div>
              
                         
                        <div class="form-group clonedInput">
                            <asp:TextBox ID="txt_qual" runat="server" hidden="hidden" ></asp:TextBox>
                            <asp:TextBox ID="txt_br" runat="server" hidden="hidden" ></asp:TextBox>
                            <asp:TextBox ID="txt_post" runat="server" hidden="hidden" ></asp:TextBox>
                             <asp:TextBox ID="txt_session" runat="server" hidden="hidden" ></asp:TextBox>
                             
                             <asp:TextBox ID="txtproofID" runat="server" hidden="hidden" ></asp:TextBox>
                             <label class="col-md-2 cntr-text">Select ID</label>
                            
                                                

                            
                           
                           
                        </div>
                          
                             <div class="col-md-6">
                                <label class="radio-inline cntr-text">
                                    <input name="radio_gender" value="Male " type="radio" id="rdo_upload" class="required has-error" onclick="rdo_marital()"/>
                                  Upload Photo
                                </label>
                                <label class="radio-inline  cntr-text">
                                    <input name="radio_gender" value="Female" type="radio" id="rdo_camera" class="has-error" onclick="rdo_marital()"/>
                                    Take Photo
                                </label>
                               
                            </div>
                        
             
                 <div class="design col-md-12" id="upddiv" hidden="hidden">
                 
                
                       <div class="form-group"><div id="abc" hidden="hidden">
                            <div class="col-md-4">
                                <input type="text" name="regular" class="form-control" id="txtflg" maxlength="30"/>
                            </div>   
                           </div>                        
                        </div>
                       <div id="Selfieupload" class="clonedInput">
                                <div class="widget-content">
                         <div class="form-group">   <div class="col-md-2"></div>
                        <label class="col-md-2 cntr-text"> upload  image:</label>
                        <div class="col-md-4">
                            <input type="file" data-style="fileinput" id="FileUpload11"  />
                        </div>
                             </div>
<div class="col-md-2"></div>
 <label class="col-md-3 cntr-text"> Image size must be less than 1MB<span class="required"> *</span></label>
                                </div>

                       </div>                     
                           <div class="form-group"> 
                       <div class="widget box align-center"> <br /><br />
                         <input id="btn_saves" type="button" value="Upload" class="btn btn-info " onclick="upload()" style="border-radius:25px;width:180px" />
       </div></div>                         
                    </div>
                    <div class="design col-md-12" id="camdiv" hidden="hidden"> 
                         <div class="design col-md-12" >
                        <table align="center" class="auto-style13">
              <tr>
            <td style="text-align: center; border-color: #000000;  background-color: #FFFFFF; font-weight: 700; font-size: large;">
                 PRESS ALLOW AND CLICK IN CAPTURE TO&nbsp; TAKEPHOTO</td>
            
              </tr>
          </table>
    <object width="500" height="300">
          
		<param name="movie" value="../WebcamResources/save_picture.swf"/>

		<embed src="../WebcamResources/save_picture.swf" width="405" height="190"/>

	</object>
                             </div>
                         <div class="design col-md-12" >
                 <input id="btn_photo" type="button" value="Next"  class="btn btn-info" onclick="cand_data()" style="border-radius:25px;width:180px" />
          </div>
                        
                    </div>
                        <br />
                         <br />
                      <br />
                         <br />
                      <br />
                         <br />
                  <div class="design col-md-12" >
                 <input id="btn_trn" type="button" value="Training Induction Module"  class="btn btn-info" onclick="trainig()" style="border-radius:25px;width:180px" />
           <a href="online_test_page.aspx" id="linko" hidden="hidden">Completed induction training ????....Test Now....!</a> 
                  </div> 

               </div> 
           </form>
            
            
            
              
                 </div>
    </div>
</asp:Content>

