<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Aadharupload.aspx.cs" Inherits="Ma_Aspirant.Recruitment.Aadharupload" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
   
        <script type="text/javascript" src="../App_Themes/Theme/assets/js/personal.js"></script>
 <script type='text/javascript'>

     function upload() {
           
                var fileList = document.getElementById("FileUpload1").files;
                //      var fileList = document.getElementById("imgFileType").files;
                var fileReader = new FileReader();
                if (fileReader && fileList && fileList.length) {
                    var d = new Date();
                    var timeStamp = d.getDate() + "-" + d.getMonth() + "-" + d.getFullYear() + "_" + d.getHours() + ":" + d.getMinutes() + ":" + d.getSeconds();
                    var fileName = "RECRT_"+ fileList[0].name;
                    fileReader.readAsDataURL(fileList[0]);
                    fileReader.onload = function () {
                        var imageData = fileReader.result;
                          $.ajax({
                            type: "POST",
                            contentType: "application/json; charset=utf-8",
                            url: "Aadharupload.aspx/Documents_upload",
                             data: "{upload_file: '" + imageData + "'}",
                            dataType: "json",
                            beforeSend: function () {
                                return confirm("Are you sure you want to confirm?");
                            },
                            success: function (Result) {
                              //  alert(Result.d);
                            //    window.open("../Recruitment/Personal_Info.aspx", "_self");
                                $("#txt_name").val(res.split('"~"')[1].toString());
                                $("#txt_dist").val(res.split('"~"')[10].toString());
                                $("#txt_state").val(res.split('"~"')[11].toString());
                                $("#txt_housename").val(res.split('"~"')[6].toString());
                                $("#txt_dob").val(res.split('"~"')[3].toString());
                                $("#txt_gender").val(res.split('"~"')[2].toString());
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
        
   
     function rdo_marital()//swathy
     {
         if ($('input[id=rdo_upload]').is(':checked')) {
             $('#upddiv').show();
             $('#camdiv').hide();
         }
         if ($('input[id=rdo_camera]').is(':checked')) {
             $('#upddiv').hide();
             $('#camdiv').show();
             window.location.href = "base.html";
             //window.location.href = "photoup.aspx";
         }
     }
 
       </script>   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <form id="Form2" class="form-horizontal row-border" action="#" runat="server">
                <div class="tab-content">

              <div class="row ">
                            <div class="ma-header">
                                <div class="col-md-12">
                                    <h3 style="color: #091221"><i class="glyphicon glyphicon-camera"></i>  Aadhar</h3>
                                </div>
                            </div>
                        </div>
                      <br />
                      <div class="design col-md-12">
                             <div class="col-md-3">
                                <label class="radio-inline cntr-text">
                                    <input name="radio_gender" value="Male " type="radio" id="rdo_upload" class="required has-error" onclick="rdo_marital()"/>
                                  Upload Aadhar
                                </label>
                                <label class="radio-inline  cntr-text">
                                    <input name="radio_gender" value="Female" type="radio" id="rdo_camera" class="has-error" onclick="rdo_marital()"/>
                                    Camera
                                </label>
                               
                            </div>
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
                        <label class="col-md-2 cntr-text"> upload aadhar image:</label>
                        <div class="col-md-4">
                            <input type="file" data-style="fileinput" id="FileUpload1"  />
                        </div>
                             </div></div></div>                     
                           <div class="form-group"> 
                       <div class="widget box align-center"> <br /><br />
                         <input id="btn_saves" type="button" value="Upload" class="btn btn-info " onclick="upload()" style="border-radius:25px;width:180px" />
       </div></div>                         
                    </div>


                     <div class="design col-md-12" id="camdiv" hidden="hidden">
                    
                         </div>
               
                    </div>
                  
             </form> 
            
</asp:Content>
