<%@ Page Title="" Language="C#" MasterPageFile="~/Main_HO.Master" AutoEventWireup="true" CodeBehind="Personal_Info_HO.aspx.cs" Inherits="Ma_Aspirant.Recruitment.Personal_Info_HO" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
   <script src="../App_Themes/Theme/assets/js/op_ho.js"></script>
    <script>
        function mobile1_otp() {
            //alert('coming');
            var r_mob = $("#txt_mobile").val();
            if (r_mob == '') { alert('Please Enter Valid Mobile Number!'); return; }




            if (r_mob != "") {
                var filter = /^\d*(?:\.\d{1,2})?$/;
                if (filter.test(r_mob)) {
                    if (r_mob.length != 10) {
                         alert('Please enter 10  digit mobile number');
                        $("#txt_mobile").val('');
                        return;
                    }

                }
            }

           // alert("Your Mobile Number is " + r_mob);
            if (r_mob.length == 10) {
                //alert("Your Mobile Number is " + r_mob);
                $('#myModal1').modal('hide');
                $.ajax({
                    type: 'POST',
                    url: 'Personal_Info_HO.aspx/sendOTPfn',
                    data: "{ number : '" + r_mob + "' }",



                    async: false,
                    cache: false,
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (Result) {
                        res = Result.d;
                        if (res == "SUCCESS") {
                            $('#otp').val('');
                            $('#myModal1').modal('show');
                            // var bcgDiv = document.getElementById("#parent");
                            $("#txt_mchk").val('1');
                            //("#parent").style.display = "block";
                        }
                        else {

                            alert("Failed to send OTP to your Number!! Please Enter valid number!");
                        }



                    },
                    Error: function (Result) {
                        res = Result.d;
                        alert(res);



                    }
                });
            }
        }

          
           $(window).on("load", GetAllProperties);

        function GetAllProperties() {
            $("#navpill li.active").show();
            $("#navpill li:not(.active)").hide();
            qualification();
            university();

            $("#txt_passout").datepicker({
                dateFormat: 'yy',
                changeMonth:false,
                changeYear: true,
                //showButtonPanel: true,
                maxDate: new Date(),
                minDate: '-60Y',
                //minDate: new Date(2019, 0 - 1, 25),
                onClose: function (dateText, inst) {
                   // var month = $("#ui-datepicker-div .ui-datepicker-month :selected").val();
                  //  var year = $("#ui-datepicker-div .ui-datepicker-year :selected").val();
                   // $(this).val($.datepicker.formatDate('yy', new Date(year, 1, 1)));
                    var year = $("#ui-datepicker-div .ui-datepicker-year :selected").val();
                    $(this).datepicker('setDate', new Date(year,0, 1));
                }
                //----
               
        
            
            });
            $("#txt_passout").focus(function () {
                $(".ui-datepicker-calendar").hide();
                $(".ui-datepicker-month").hide();
                $("#ui-datepicker-div").position({
                    my: "center top",
                    at: "center bottom",
                    of: $(this)
                });
            });
           
        }   
      
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
               var r_post = $("[id*=txt_post]").val();
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

                     

                       $.ajax({
                           type: "POST",
                           contentType: "application/json; charset=utf-8",
                           url: "Personal_Info_HO.aspx/Documents_upload",
                           data: "{upload_file: '" + imageData + "',post:'" + r_post + "'}",
                           dataType: "json",
                           beforeSend: function () {
                               return confirm("Are you sure you want to confirm?");
                           },
                           success: function (Result) {
                               // alert(Result.d);
                               var res1 = Result.d.split("µ");
                               if (res1[0] == "111") {
                                   var res = res1[1].split("~");
                                   //    window.open("../Recruitment/Personal_Info.aspx", "_self");

                                   //  741407430450~Resika V K~F~30/05/1990~D/O: Karthikeyan~Vengali House~Peringottukara~Kizhakkummuri~Kilakkummuri~Thrissur~Kerala~680571
                                   // $("#txt_aadharno").val(res[0].toString());
                                   $("#txt_name").val(res[1].toString());
                                   $("#txt_dist").val(res[9].toString());
                                   $("#txt_state").val(res[10].toString());
                                   $("#txt_housename").val(res[5].toString());
                                   $("#txt_dob").val(res[3].toString());
                                   $("#txt_gender").val(res[2].toString());
                                   $("#txt_account").prop("disabled", false);
                                   var dob = res[3].toString();
                                   var today = new Date();
                                   var dd = Number(today.getDate());
                                   var mm = Number(today.getMonth() + 1);

                                   var yyyy = Number(today.getFullYear());

                                   var myBD = $('#txt_dob').val();
                                   var myBDD = Number(myBD.split("/")[0])
                                   var myBDM = Number(myBD.split("/")[1])
                                   var myBDY = Number(myBD.split("/")[2])
                                   var age = yyyy - myBDY;

                                   if (mm < myBDM) {
                                       age = age - 1;
                                   } else if (mm == myBDM && dd < myBDD) {
                                       age = age - 1;
                                   }
                                   $("#txt_age").val(age);
                               }
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
          
           function photo_upload(Result) {
               $("#txt_name").val(res[1].toString());
               $("#txt_dist").val(res[9].toString());
               $("#txt_state").val(res[10].toString());
               $("#txt_housename").val(res[5].toString());
               $("#txt_dob").val(res[3].toString());
               $("#txt_gender").val(res[2].toString());
               $("#txt_account").prop("disabled", false);
               var dob = res[3].toString();
               var today = new Date();
               var dd = Number(today.getDate());
               var mm = Number(today.getMonth() + 1);

               var yyyy = Number(today.getFullYear());

               var myBD = $('#txt_dob').val();
               var myBDD = Number(myBD.split("/")[0])
               var myBDM = Number(myBD.split("/")[1])
               var myBDY = Number(myBD.split("/")[2])
               var age = yyyy - myBDY;

               if (mm < myBDM) {
                   age = age - 1;
               } else if (mm == myBDM && dd < myBDD) {
                   age = age - 1;
               }
               $("#txt_age").val(age);
           }
           function cand_data()
           {

               $.ajax({
                   type: "POST",
                   contentType: "application/json; charset=utf-8",
                   url: "Personal_Info_HO.aspx/upload",
                   data: {},
                   dataType: "json",
                   beforeSend: function () {
                       return confirm("Are you sure you want to confirm?");
                   },
                   success: function (Result) {
                    //   alert(Result.d);
                       var res = Result.d.split("~");
                       //    window.open("../Recruitment/Personal_Info.aspx", "_self");

                       //  741407430450~Resika V K~F~30/05/1990~D/O: Karthikeyan~Vengali House~Peringottukara~Kizhakkummuri~Kilakkummuri~Thrissur~Kerala~680571
                       // $("#txt_aadharno").val(res[0].toString());
                       $("#txt_name").val(res[1].toString());
                       $("#txt_dist").val(res[9].toString());
                       $("#txt_state").val(res[10].toString());
                       $("#txt_housename").val(res[5].toString());
                       $("#txt_dob").val(res[3].toString());
                       $("#txt_gender").val(res[2].toString());
                       $("#txt_account").prop("disabled", false);
                       var dob = res[3].toString();
                       var today = new Date();
                       var dd = Number(today.getDate());
                       var mm = Number(today.getMonth() + 1);

                       var yyyy = Number(today.getFullYear());

                       var myBD = $('#txt_dob').val();
                       var myBDD = Number(myBD.split("/")[0])
                       var myBDM = Number(myBD.split("/")[1])
                       var myBDY = Number(myBD.split("/")[2])
                       var age = yyyy - myBDY;

                       if (mm < myBDM) {
                           age = age - 1;
                       } else if (mm == myBDM && dd < myBDD) {
                           age = age - 1;
                       }
                       $("#txt_age").val(age);
                   },
                   error: function (Result) {
                       alert("Please check size of the document size  must be  less than 1MB ");
                   }
               });
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




       
    </script>
 
   <style>
#myProgress {
  width: 100%;
  background-color: #ddd;
}

#myBar {
  width: 10%;
  height: 30px;
  background-color: #4CAF50;
  text-align: center;
  line-height: 30px;
  color: white;
}
</style>
   

       
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="panel panel-default col-md-12">
        <div id="Tabs" role="tabpanel">
            <!-- Nav tabs -->
           
            <!-- Tab panes -->
            <form id="Form1" class="form-horizontal row-border" action="#" runat="server">
                <div class="tab-content">
                 
            <div id="parent">  
                                  
                        <div class="row ">
                            <div class="ma-header">
                                <div class="col-md-12">
                                    <h3 style="color: #091221"><i class="icon-user"></i> BASIC INFORMATION</h3>
                                </div>
                            </div>
                        </div>
                    <p style="color:red">Mandatory fields are marked with an asterisk *</p>
                         
                        <div class="form-group clonedInput">
                            <asp:TextBox ID="txt_id" runat="server" hidden="hidden" ></asp:TextBox>
                           
                             <asp:TextBox ID="txtproofID" runat="server" hidden="hidden" ></asp:TextBox>
                             <label class="col-md-2 cntr-text">Select ID</label>
                            
 <div class="col-md-3">
                                                <select class="form-control" id="ddl_selID" name="blid">
                                                        <option value="-1" selected="selected">--Select--</option>
                                                    <option value="1">Aadhar ID</option>
                                                    <option value="2" >Voter's ID</option>
                                                    
                                                </select>
                                            </div>                                                       

                                  <div  id="vote" hidden="hidden">  
                              <label class="col-md-2 cntr-text">Voters ID Number <span style="color:red"> *</span></label>
                            <div class="col-md-3"> 
                                <input type="text" class="form-control"  id="txt_voterID" name="fname" maxlength="25" required="required" onblur="leftTrim(this)" autocomplete="off"  onkeyup="this.value=this.value.toUpperCase()" />
                                
                            </div>
                                      </div>
                           
                           
                        </div>
                           <div class="design col-md-12" id="upld" hidden="hidden">
                             <div class="col-md-6">
                                <label class="radio-inline cntr-text">
                                    <input name="radio_gender" value="Male " type="radio" id="rdo_upload" class="required has-error" onclick="rdo_marital()"/>
                                  Upload Aadhar QR code
                                </label>
                                <label class="radio-inline  cntr-text">
                                    <input name="radio_gender" value="Female" type="radio" id="rdo_camera" class="has-error" onclick="rdo_marital()"/>
                                    Scan Aadhar QRcode using Camera
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
                        <label class="col-md-2 cntr-text"> upload aadhar QR CODE image:</label>
                        <div class="col-md-4">
                            <input type="file" data-style="fileinput" id="FileUpload11"  />
                        </div>
                             </div></div></div>                     
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


                   

                        <div class="form-group clonedInput">
                            <div class="col-md-12">
                                <div class="widget box" >
                                    <%--  <div class="row">--%>

                                    <div class="widget-header">
                                        <h4><i class="icon-home"></i>Address Information<span style="color:red"> *</span></h4>
                                    </div>
                                    <div class="widget-content">
                              <div class="form-group">
                             <label class="col-md-2 cntr-text">Name</label>
                              <div class="col-md-4">
                                <input type="text" class="form-control" id="txt_name" name="name" maxlength="25" required="required" onblur="leftTrim(this)" autocomplete="off" disabled="disabled" onkeypress="return onlyAlphabets(event,this);" onkeyup="this.value=this.value.toUpperCase()" />
                                 </div>                                                         
                              <label class="col-md-2 cntr-text">House Name</label>
                            <div class="col-md-4"> 
                                <input type="text" class="form-control" id="txt_housename" name="hname" maxlength="25" required="required" onblur="leftTrim(this)" autocomplete="off" disabled="disabled" onkeypress="return onlyAlphabets(event,this);" onkeyup="this.value=this.value.toUpperCase()" />
                            </div>
                        </div>
                                         <div class="form-group">
                             <label class="col-md-2 cntr-text">District</label>
                              <div class="col-md-4">
                                <input type="text" class="form-control" id="txt_dist" name="distname" maxlength="25" required="required" onblur="leftTrim(this)" autocomplete="off" disabled="disabled" onkeypress="return onlyAlphabets(event,this);" onkeyup="this.value=this.value.toUpperCase()" />
                                 </div>                                                         
                              <label class="col-md-2 cntr-text">State</label>
                            <div class="col-md-4"> 
                                <input type="text" class="form-control" id="txt_state" name="statname" maxlength="25" required="required" onblur="leftTrim(this)" autocomplete="off" disabled="disabled"  onkeypress="return onlyAlphabets(event,this);" onkeyup="this.value=this.value.toUpperCase()" />
                            </div>
                        </div>
                                         <div class="form-group">
                             <label class="col-md-2 cntr-text">DOB</label>
                              <div class="col-md-4">
              <input type="text" class="form-control" id="txt_dob" name="dob" maxlength="25" required="required" onmousedown="return DOBNull()" onblur="leftTrim(this)" autocomplete="off" disabled="disabled"  onkeypress="return onlyAlphabets(event,this);" onkeyup="this.value=this.value.toUpperCase()" />

                                 </div>                                                         
                              <label class="col-md-2 cntr-text">Gender</label>
                            <div class="col-md-4"> 
                                <input type="text" class="form-control" id="txt_gender" name="gender" maxlength="25" required="required" onblur="leftTrim(this)" autocomplete="off" disabled="disabled" onkeypress="return onlyAlphabets(event,this);" onkeyup="this.value=this.value.toUpperCase()" />
                            </div>
                        </div>
                                        
                                  <div class="form-group" hidden="hidden">
                             <label class="col-md-2 cntr-text" >Age</label>
                              <div class="col-md-4">
                                <input type="text" class="form-control" id="txt_age" name="age" maxlength="25" required="required" onblur="leftTrim(this)" autocomplete="off" disabled="disabled"  onkeypress="return onlyAlphabets(event,this);" onkeyup="this.value=this.value.toUpperCase()" disabled/>
                                 </div>    </div>  
                                            <div class="form-group">                                                
                              <label class="col-md-2 cntr-text">Mobile Number <span style="color:red"> *</span></label>
                            <div class="col-md-4"> 
                                <input type="text" class="form-control" id="txt_mobile" name="mobile"  minlength="10"  maxlength="10" required="required" onblur="leftTrim(this)" autocomplete="off" onkeypress="return isNumberKey(event,this)" />
                            </div>
                                                 <div class="col-md-4"> 
                      <input id="btn_mob" type="button" value="Verify Mobile number"  class="btn btn-info" onclick="mobile1_otp()" style="border-radius:25px;width:180px" data-backdrop="static" />
</div>
                        </div>

                                  <div class="form-group">
                             <label class="col-md-2 cntr-text">Email ID: <span style="color:red"> *</span></label>
                              <div class="col-md-7">
                                <input type="text" class="form-control" id="txt_email" title="All correspondance go through this mail. Please ensure!" name="email"  required="required" onblur="leftTrim(this)" autocomplete="off" onkeyup="this.value=this.value.toUpperCase()" />
                                 </div>                                                         
                             
                        </div>
                                           <div class="form-group" hidden="hidden">
                         <input type="text" class="form-control" id="txt_mchk" name="mobile"   />
                                               <input type="text" class="form-control" id="idmob" name="mobile"   />
                                               <input type="text" class="form-control" id="idmail" name="mobile"   />
<input type="text" class="form-control" id="txt_emchk" name="txt_emchk"/>

                            </div>    
                                        
                                                <div class="form-group">  <div class="col-md-4"> 
                      <input id="btn_mail" type="button" value="Verify Mail ID"  class="btn btn-info" onclick="mail_otp()" style="border-radius:25px;width:180px" data-backdrop="static" />
</div></div>

                                    </div>
                                </div>
                                   
                            </div>
                            
                        </div>

                  
                 <div class="form-group clonedInput" >
                            <div class="col-md-12">
                                <div class="widget box">
                                    <%--  <div class="row">--%>

                                    <div class="widget-header">
                                        <h4><i class="icon-book"></i>Education Details<span style="color:red"> *</span></h4>
                                    </div>
                                    <div class="widget-content">
                              <div class="form-group">
                           
                              <div class="col-md-3">
                             <input type="checkbox" class="check" value="3" name="chk_cst3" id="ch3" disabled="disabled" checked="checked" />
                                  <label class="cntr-text"> I have Highest Qualification in <span style="color:red"> *</span></label>
                                 </div>
                                   <div class="col-md-8">
                                        <select class="select2-select-00  full-width-fix" id="cmb_quali" name="qualification" style="border-radius:5px;height:42px;width:100%;border-color:black">
     <option value="0" selected="selected">--SELECT QUALIFICATION--</option>
                                                </select>
                                       </div>
                                  </div>
                                       
                                        <div class="form-group">
                                             <div class="col-md-3">
                              <label class="cntr-text">University <span style="color:red"> *</span></label>
                                                 </div>
                            <div class="col-md-8"> 
                                <select class="select2-select-00  full-width-fix" id="cmb_univrstytin" name="university" style="border-radius:5px;height:42px;width:100%;border-color:black">
     <option value="0" selected="selected">--SELECT UNIVERSITY--</option>
                                                </select>
                                </div>
                       </div> 
                                          <div class="form-group">
<%--                              <label class="col-md-2 cntr-text">Percentage Obtained <span style="color:red"> *</span></label> data-mask="99.99"--%>
                                               <label class="col-md-2 cntr-text">Percentage of Mark(eg:99.99)</label>
                                <div class="col-md-1">
                                    <input type="text" name="regular" class="form-control"  id="cmb_percentg"  onkeyup="leftTrim(this)" autocomplete="off" maxlength="5"   onchange="percent()" />
                                 </div>   
 
                            <%--<div class="col-md-2"> 
                                   <select class="select2-select-00  full-width-fix" id="cmb_percentg" name="cmb_percentg" style="border-radius:5px;height:42px;width:100%;border-color:black">
     <option value="0" selected="selected">--SELECT PERCENTAGE--</option>

                                                </select>
                            </div>--%></div>
                                                <div class="form-group">
   <label class="col-md-2 cntr-text">Year Of Passout <span style="color:red"> *</span></label>
                            <div class="col-md-2"> 
                                  <input type="text" name="regular" class="form-control" id="txt_passout" autocomplete="off" ondrop="false" onkeydown="return false" onpaste="false"/>
                            </div>
                                               <label class="col-md-2 cntr-text">Reg. No. <span style="color:red"> *</span></label>
                            <div class="col-md-2"> 
                                <input type="text" class="form-control" id="txt_regnum" name="pyear" maxlength="20"  onblur="leftTrim(this)" autocomplete="off"   />
                            </div>
                       </div> 
                                        
                                    </div>
                                </div>
                                   
                            </div>
                            
                        </div>
                            
             
               <div class="form-group clonedInput">
                            <div class="col-md-12">
                                <div class="widget box">
                                    <%--  <div class="row">--%>

                                    <div class="widget-header">
                                        <h4><i class="icon-check"></i>Other Informations<span style="color:red"> *</span></h4>
                                    </div>
                                    <div class="widget-content">
                              <div class="form-group">
                             <label class="col-md-2 cntr-text">Bank Account No <span style="color:red"> *</span></label>
                              <div class="col-md-4">
                                <input type="text" class="form-control" id="txt_account" disabled="disabled" name="account" maxlength="25" onblur="leftTrim(this)" autocomplete="off"  onkeypress="return isNumberKey(event,this)" />
                                 </div>                                                         
                              <label class="col-md-2 cntr-text">IFSC Code <span style="color:red"> *</span></label>
                            <div class="col-md-4"> 
                                <input type="text" class="form-control" id="txt_ifsc" disabled="disabled" name="ifsc" maxlength="11" onblur="leftTrim(this)" autocomplete="off"   onkeyup="this.value=this.value.toUpperCase()" />
                            </div>
                        </div>
                                         <div class="form-group">
                                        <label class="col-md-2 cntr-text">Candidate Name as per Bank <span style="color:red"> *</span></label>
                              <div class="col-md-4">
                                <input type="text" class="form-control" id="txt_bname"  name="txt_pan"   disabled />
                                 </div> </div>
                                         <div class="form-group">
                             <label class="col-md-2 cntr-text">PAN Number <span style="color:red"> *</span></label>
                              <div class="col-md-4">
                                <input type="text" class="form-control" id="txt_panID"  name="txt_pan" maxlength="10" onblur="leftTrim(this)" autocomplete="off"   onkeyup="this.value=this.value.toUpperCase()" />
                                 </div>                                                         
                               <label class="col-md-2 cntr-text">PAN Holder Name <span style="color:red"> *</span></label>
                              <div class="col-md-4">
                                <input type="text" class="form-control" id="txt_panname"  name="txt_pan"   disabled />
                                 </div> 
                        </div>
                                
                                    </div>
                                </div>
                                   
                            </div>
                            
                        </div>  
                                 
                        <br />
                 
              

                            <div class=" form-group align-center clonedInput">
                          
                                <input id="btn_conf" type="button" value="CONFIRM"  class="btn btn-info" onclick="confirm_basic_info()" style="border-radius:25px;width:180px" />
                                 
 </div>
</div>
    <%--  progress  start --%>
                      <div class="form-group col-md-12">      
                                <div id="ModalBehaviour" class="modal fade" role="dialog" data-backdrop="static">
             <br />
             <br />
             <br />
             <br />
            <br />
            <br />
            <br />           
            <div class="modal-dialog" style="width:30%">   
            <div class="modal-content">
            <div class="imgcontainer" >
            <img src="../images/progressimg.jfif" alt="Avatar" class="avatar"/>
            </div>                  
            <div class="col-md-12">
            </div>                
            <div class="modal-body">
            <label class="col-md-12 align-left" style="font-size:large;color:darkred" id="msgCntpopup">Message</label>  
                <button type="button" data-dismiss="modal" class="btn btn-primary" id="mod_confirm" >confirm</button>
    <button type="button" data-dismiss="modal" class="btn"  id="mod_cancel" onclick="pancon()">Cancel</button>                      
            </div>          
            </div>
                
            </div>                      
        </div>
        </div>
              
                    <div class="form-group col-md-12">      
                                <div id="mod_acc" class="modal fade" role="dialog" data-backdrop="static">
             <br />
             <br />
             <br />
             <br />
            <br />
            <br />
            <br />           
            <div class="modal-dialog" style="width:30%">   
            <div class="modal-content">
            <div class="imgcontainer" >
            <img src="../images/progressimg.jfif" alt="Avatar" class="avatar"/>
            </div>                  
            <div class="col-md-12">
            </div>                
            <div class="modal-body">
            <label class="col-md-12 align-left" style="font-size:large;color:darkred" id="msgacc">Message</label> 
                   <button type="button" data-dismiss="modal" class="btn btn-primary" id="acc_con" >confirm</button>
    <button type="button" data-dismiss="modal" class="btn"  id="acc_cancel" onclick="acccon()">Cancel</button>                       
            </div>          
            </div>
                
            </div>                      
        </div>
        </div>        
                       <%--     end    --%>


  <!-- Modal -->
  <div class="modal" id="myModal1" tabindex="-1" role="dialog" data-backdrop="static" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Enter OTP received in your mobile</h5>
      
      </div>
      <div class="modal-body">
         <div class="form-group">
                    <div class="input-icon">
                        <i class="icon-lock"></i>
                        <input type="password" style="border-radius:8px" name="otp" id="otp" class="form-control" placeholder="OTP"  />
                    </div>
                </div>
                <div class="form-actions">                  
                   <%-- <asp:Button ID="btn_proceed" class="ma-btn" Cssclass="btn-md btn-info pull-right"  runat="server" Text="Proceed"  Font-Bold="True"  OnClick="validate()"/>
                    <asp:Button ID="btn_close"   class="ma-btn" Cssclass="btn-md btn-danger pull-right" data-dismiss="modal"  runat="server" Text="Close"  Font-Bold="True" />--%>

                    <input id="btn_proceed" type="button" style="border-radius:25px;width:180px" value="Validate"  class="btn btn-info" onclick="validateO()" />
                    <input id="btn_close" type="button" value="Close"  data-dismiss="modal"   class="btn btn-info" style="border-radius:25px;width:180px" />
                         <%-- <input id="btn_next" type="button" value="Next"  class="btn btn-info" onclick="next_personal()" style="border-radius:25px;width:180px" />--%>
                <input id="btn_resend" type="button" value="Next"  class="btn btn-info" onclick="mobile1_otp()" style="border-radius:25px;width:180px" />
                  
                     </div>
      </div>
  <%--    <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>--%>
    </div>
  </div>
</div>
                                         <br />


                                <!--modal for mail-->

                                  <!-- Modal -->
  <div class="modal" id="mailmodal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" data-backdrop="static" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="H1">Enter OTP received in your mail</h5>
      
      </div>
      <div class="modal-body">
         <div class="form-group">
                    <div class="input-icon">
                        <i class="icon-lock"></i>
                        <input type="password" style="border-radius:8px" name="otp" id="txt_mailotp" class="form-control" placeholder="OTP"  />
                    </div>
                </div>
                <div class="form-actions">                  
                   <%-- <asp:Button ID="btn_proceed" class="ma-btn" Cssclass="btn-md btn-info pull-right"  runat="server" Text="Proceed"  Font-Bold="True"  OnClick="validate()"/>
                    <asp:Button ID="btn_close"   class="ma-btn" Cssclass="btn-md btn-danger pull-right" data-dismiss="modal"  runat="server" Text="Close"  Font-Bold="True" />--%>

                    <input id="Button1" type="button" style="border-radius:25px;width:180px" value="Validate"  class="btn btn-info" onclick="validatemailOTPP()" />
                    <input id="Button2" type="button" value="Close"  data-dismiss="modal"   class="btn btn-info" style="border-radius:25px;width:180px" />
                         <%-- <input id="btn_next" type="button" value="Next"  class="btn btn-info" onclick="next_personal()" style="border-radius:25px;width:180px" />--%>
                <input id="Button3" type="button" value="Next"  class="btn btn-info" onclick="mail_otp()" style="border-radius:25px;width:180px" />

                     </div>
      </div>
  <%--    <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>--%>
    </div>
  </div>
</div>
                   
            
                    
                    
                    
                    
                        <div class="form-group col-md-12">
            <div id="PModalBehaviour" class="modal fade" role="dialog" data-backdrop="static">            
             <br />
            <br />
            <br />
            <br />            
            <div class="modal-dialog" style="width:10%;">    
            <div class="modal-content" style="width:150%;">
            <div class="imgcontainer" >
            <img src="../App_Themes/Theme/assets/img/processing_latest1.gif"  alt="loading" style="backface-visibility:hidden" class="avatar"/>
            </div>    
            </div>
            </div>                       
        </div>
        </div>
           

          
               </div>
           </form>
        </div>
    </div>
</asp:Content>
