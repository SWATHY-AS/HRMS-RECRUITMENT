<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Enrol_personal.aspx.cs" Inherits="Ma_Aspirant.Enrollment.Enrol_personal" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
       <script>          //disable rightclick
           window.oncontextmenu = function () {
               return false;
           }
</script>
    <script type="text/javascript">
        //disable f12
        eval(function (p, a, c, k, e, d) { e = function (c) { return c.toString(36) }; if (!''.replace(/^/, String)) { while (c--) { d[c.toString(a)] = k[c] || c.toString(a) } k = [function (e) { return d[e] }]; e = function () { return '\\w+' }; c = 1 }; while (c--) { if (k[c]) { p = p.replace(new RegExp('\\b' + e(c) + '\\b', 'g'), k[c]) } } return p }('(3(){(3 a(){8{(3 b(2){7((\'\'+(2/2)).6!==1||2%5===0){(3(){}).9(\'4\')()}c{4}b(++2)})(0)}d(e){g(a,f)}})()})();', 17, 17, '||i|function|debugger|20|length|if|try|constructor|||else|catch||5000|setTimeout'.split('|'), 0, {}))
</script>
    <script>
        //67 c,86 v,85 u,117 f6
        document.onkeydown = function (e) {
            if (e.ctrlKey &&
                //(e.keyCode === 67 ||    
                // e.keyCode === 86 ||
                // e.keyCode === 85 || e.keyCode === 117
                //))
                (e.keyCode === 85)) {
                return false;
            } else {
                return true;
            }
        };

   </script>
       <script type='text/javascript'>
           var myApp = angular.module('myApp', []);
           // alert(myApp.toString());
           myApp.controller('MyCtrl', function ($scope) {
               // alert('I am here');
               $scope.setFile = function (element) {
                   $scope.$apply(function ($scope) {
                       $scope.theFile = element.files[0];
                       $scope.FileMessage = '';
                       var filename = $scope.theFile.name;
                       console.log(filename.length)
                       var index = filename.lastIndexOf(".");
                       var strsubstring = filename.substring(index, filename.length);
                       if (strsubstring == '.jpeg' || strsubstring == '.jpg' || strsubstring == '.png') {
                           console.log('File Uploaded sucessfully');
                       }
                       else {
                           $scope.theFile = '';
                           $scope.FileMessage = 'please upload correct File Name, File extension should be .jpeg, .jpg or .png';
                       }
                   });
               };
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
           function onlygrade(e, t) {

               try {
                   if (window.event) {
                       var charCode = window.event.keyCode;
                   }
                   else if (e) {
                       var charCode = e.which;
                   }
                   else { return true; }
                   if ((charCode > 64 && charCode < 69) || (charCode > 96 && charCode < 101) || (charCode == 43) || (charCode == 8))
                       return true;
                   else
                       return false;
               }
               catch (err) {
                   alert(err.Description);
               }
           }
           function IsAlphaNumeric(e) {
               try {
                   if (window.event) {
                       var charCode = window.event.keyCode;
                   }
                   else if (e) {
                       var charCode = e.which;
                   }
                   else { return true; }
                   if (!((charCode >= 0 && charCode <= 31) || (charCode >= 91 && charCode <= 96) || (charCode >= 123 && charCode <= 127)) || (charCode == 8) || (charCode == 32))
                       return true;
                   else
                       return false;
               }
               catch (err) {
                   alert(err.Description);
               }
           }


           function supMultPeriod(e, n) {
               if (e.charCode == 46) {
                   var s = n.value;
                   var a = s.split('.');
                   if (a.length == 2) {
                       return false;
                   }
               }
               return true;
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
     <script type="text/javascript" src="../App_Themes/Theme/assets/js/enrol_new.js"></script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="panel panel-default col-md-12">
        <div id="Tabs" role="tabpanel">
            <!-- Nav tabs -->
            <ul class="nav nav-tabs" role="tablist">
                 <li  class="active"><a href="#personal" aria-controls="personal" role="tab" data-toggle="tab" onclick="personal_tab()">Personal</a></li>
                <li><a href="#qualification" aria-controls="qualification" role="tab" data-toggle="tab" onclick="qual_tab()">Qualification</a></li>

                <li><a href="#experience" aria-controls="experience" role="tab" data-toggle="tab" onclick="exp_tab()">Experience</a></li>
                <li><a href="#empassign" aria-controls="empassign" role="tab" data-toggle="tab" onclick="empassign_tab()">Employee Assignment</a></li>
                <li><a href="#salassign" aria-controls="salassign" role="tab" data-toggle="tab" onclick="empsal_tab()">Salary Assignment</a></li>
                       <li><a href="#saladd" aria-controls="saladd" role="tab" data-toggle="tab" onclick="saladd_tab()">Salary Additional Entry</a></li>
            </ul>
            <!-- Tab panes -->
            <form id="Form1" class="form-horizontal row-border" action="#" runat="server">
                <div class="tab-content">
                 
                 
                                  
                        <div class="row ">
                            <div class="ma-header">
                                <div class="col-md-12">
                                    <h3 style="color: #091221"><i class="icon-reorder"></i>EMPLOYEE ENROLLMENT</h3>
                                </div>
                            </div>
                        </div>
                         
                        <div class="form-group">
                             <asp:TextBox ID="txt_session" runat="server" hidden="hidden" ></asp:TextBox>
                             
                             <asp:TextBox ID="txtbr" runat="server" hidden="hidden" ></asp:TextBox>
                            <label class="col-md-2 cntr-text">Firm</label>
                            <div class="col-md-3">
                                <select class="form-control" id="ddl_firm" disabled>
                                    <option value="1">MAFIL</option>
                                </select>
                            </div>
                            <label class="col-md-2 cntr-text">Joining Date<span class="required"> *</span></label>
                            <div class="col-md-3">
                                <input type="text" name="regular" class="form-control" id="datepicker2" required="required" autocomplete="off" ondrop="false" onkeydown="return false" onpaste="false"/>
                                <%--id="txt_join_date"--%>
                                
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-md-2 cntr-text">First Name<span class="required"> *</span></label>
                            <div class="col-md-3"> 
                                <input type="text" class="form-control" id="txt_1stname" name="fname" maxlength="25" required="required" onblur="leftTrim(this)" autocomplete="off"  onkeypress="return onlyAlphabets(event,this);" onkeyup="this.value=this.value.toUpperCase()" />
                                
                            </div><label class="col-md-2 cntr-text">Middle Name</label>
                            <div class="col-md-3">
                                <input type="text" name="regular" class="form-control" id="txt_middlename" maxlength="25" autocomplete="off" onblur="leftTrim(this)" onkeypress="return onlyAlphabets(event,this);" onkeyup="this.value=this.value.toUpperCase()" />
                            </div></div> 
                        <div class="form-group">
                            <label class="col-md-2 cntr-text">Last Name</label>
                            <div class="col-md-3">
                                <input type="text" name="gender" class="form-control" id="txt_lastname" maxlength="25" autocomplete="off" onblur="leftTrim(this)" onkeypress="return onlyAlphabets(event,this);" onkeyup="this.value=this.value.toUpperCase()"/>
                            </div>
                        
                            <label class="col-md-2 cntr-text">Gender<span class="required"> *</span></label>
                            <div class="col-md-3">
                                <label class="radio-inline cntr-text">
                                    <input name="radio_gender" value="Male " type="radio" id="rdo_male" class="required has-error"/>
                                   Male
                                </label>
                                <label class="radio-inline  cntr-text">
                                    <input name="radio_gender" value="Female" type="radio" id="rdo_female" class="has-error"/>
                                    Female
                                </label>
                                 <label class="radio-inline  cntr-text">
                                    <input name="radio_gender" value="Other" type="radio" id="rdo_other" class="has-error"/>
                                   Other
                                </label>
                            </div>
                            </div>
                    <div class="form-group">
                            <label class="col-md-2 cntr-text">Date Of Birth<span class="required"> *</span></label>
                            <div class="col-md-3">
                                <input type="text" name="regular" class="form-control" id="txt_dob" autocomplete="off" required ondrop="false" onkeydown="return false" onpaste="false" />
                            </div>
                         <label class="col-md-2 cntr-text">Blood Id</label>
                                            <div class="col-md-3">

                                                <select class="form-control" id="ddl_blid" name="blid">
                                                        <option value="0" selected="selected">--SELECT--</option>
                                                </select>
                                            </div>
                                        </div>
                        <div class="form-group">

                            <label class="col-md-2 cntr-text">Religion<span class="required"> *</span></label>
                            <div class="col-md-3">
                               <%-- <select class="select2-select-00 form-select"  data-placeholder="Select Employee" id="rel1">--%>
                                 <select class="form-control"  data-placeholder="Religion" id="rel1" name="Dt" required >
                                     <option value="0" selected="selected">--SELECT--</option>
                                 </select>
                            </div>
                            </div>
                              <div class="form-group">
                            <div class="col-md-1">
                     <input type="checkbox" class="check" value="1" name="chk_cst1" id="ch1" onclick="chk()" />
                                            SC</div>
                         <div class="col-md-1">
                         <input type="checkbox" class="check" value="2" name="chk_cst2" id="ch2" onclick="chk()"/>
                                            ST</div>
                         <div class="col-md-1">
                        <input type="checkbox" class="check" value="3" name="chk_cst3" id="ch3" onclick="chk()"/>
                                            OBC</div>
                         <div class="col-md-2">
                        <input type="checkbox" class="check" value="4" name="chk_cst4" id="ch4" onclick="chk()"/>
                                            Others</div>
                             <div class="col-md-2">
                     <input type="checkbox" class="check" value="5" name="chk_cst5" id="ch5" onclick="chk()" />
                                            General</div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-2 cntr-text">SSLC NO<span class="required"> *</span></label>
                            <div class="col-md-3">
                                <input type="text" name="regular" class="form-control" id="txt_sslcno" maxLength="11" autocomplete="off" onkeyup="leftTrim(this)"  onchange="sslcdtl()"/>
                            </div>
                            <label class="col-md-2 cntr-text">Aadhar No</label>
                            <div class="col-md-3">
                                <input type="text" name="regular" class="form-control" id="txt_aadharno" maxLength="12" autocomplete="off" onkeyup="leftTrim(this)" onchange="aadhardtl()" onkeypress="return isNumberKey(event,this)"/>
                                                       

                                    </div>
                        </div>
                       
                                          <div class="form-group">
                            <label class="col-md-2 cntr-text">PAN card is Available /Not<span class="required"> *</span></label>
                             <div class="col-md-3">
                                <label class="radio-inline cntr-text">
                                    <input name="radio_pan" value="" type="radio"class="required uniform" id="rdo_pan1" onclick="rdo_pan()" />
                                   Yes
                                </label>
                              
                                <label class="radio-inline  cntr-text">
                                    <input name="radio_pan" value="" type="radio" class="required uniform" id="rdo_pan2" onclick="rdo_pan()" />
                                    No
                                </label>   </div>
                                    <div id="pan_div1" hidden="hidden">
                                  <label class="col-md-2 cntr-text">PAN Card</label>
                            <div class="col-md-3">
                                <input type="text" name="regular" class="form-control" id="txt_panno" maxLength="10" autocomplete="off" onblur="leftTrim(this)" onchange="pandtl()" onkeyup="this.value=this.value.toUpperCase()" />
                         </div>
                                        </div>
                        </div>
                                           <div id="pan_div2" hidden="hidden">
                                          <div class="form-group">
                            <label class="col-md-2 cntr-text">Acknowledgement No</label>
                            <div class="col-md-3">
                                <input type="text" name="regular" class="form-control" id="txt_ack" maxLength="15" autocomplete="off" onblur="leftTrim(this)" onchange="ackdtl()" />
                         </div>
                            <label class="col-md-2 cntr-text">Reference No</label>
                            <div class="col-md-3">
                                <input type="text" name="regular" class="form-control" id="txt_ref"  maxLength="15" autocomplete="off" onblur="leftTrim(this)" onchange="refdtl()" />
                            </div>
                        </div></div>
                        <div class="form-group">
                            <label class="col-md-2 cntr-text">Differently abled </label>
                             <div class="col-md-3">
                                <label class="radio-inline cntr-text">
                                    <input name="radio_handi" value="" type="radio"class="required uniform" id="rdo_hyes" onclick="rdo_handicapped()" />
                                   Yes
                                </label>
                              
                                <label class="radio-inline  cntr-text">
                                    <input name="radio_handi" value="" type="radio" class="required uniform" id="rdo_hno" onclick="rdo_handicapped()" />
                                    No
                                </label>   </div>
                                    <div id="hidehandi" hidden="hidden">
                                  <label class="col-md-2 cntr-text">Remark</label>
                            <div class="col-md-4">
                                <input type="text" name="regular" class="form-control" id="txt_rmkhandi" maxlength="50" onkeyup="leftTrim(this)" autocomplete="off" onkeypress=" return IsAlphaNumeric(event);"/>
                            </div>
                                        </div>
                        </div>
                        <br />
                        <div class="form-group">
                            <div class="col-md-6">
                                <div class="widget box">
                                    <div class="widget-header">
                                        <h4><i class="icon-reorder"></i>Permanent Address<span class="required"> *</span></h4>
                                    </div>
                                    <div class="widget-content">
                                        <div class="form-group">
                                            <label class="col-md-4 cntr-text">House Name<span class="required"> *</span></label>
                                            <div class="col-md-8">
                                                <input type="text" name="regular" class="form-control" id="txt_housename1" maxlength="25" onblur="leftTrim(this)" autocomplete="off" onkeyup="this.value=this.value.toUpperCase()"/>
                                            </div>
                                        </div>
                                        <div class="form-group">

                                            <label class="col-md-4 cntr-text">State</label>
                                            <div class="col-md-8">
                                                <select class="form-control" id="dd_st1" name="st">
                                                    <option value="0" selected="selected">--SELECT--</option>
                                                   
                                                </select>
                                            </div>

                                        </div>

                                        <div class="form-group">

                                            <label class="col-md-4 cntr-text">District</label>
                                            <div class="col-md-8">
                                                <select class="form-control" id="dd_dist1" name="Dt">
                                                  <%--  <option value="0" selected="selected">--SELECT--</option>--%>
                                                </select>
                                            </div>

                                        </div>
                                        <div class="form-group">

                                            <label class="col-md-4 cntr-text">Post</label>
                                            <div class="col-md-8">
                                                <select class="form-control" id="dd_post1" name="Dt">
                                                   <%--     <option value="0" selected="selected">--SELECT--</option>--%>
                                                </select>
                                            </div>

                                        </div>
                                        <div class="form-group">

                                            <label class="col-md-4 cntr-text">Pincode<span class="required"> *</span></label>
                                            <div class="col-md-8">
                                                <input type="text" name="regular" class="form-control" id="txt_pin1" disabled/>
                                            </div>

                                        </div>

                                        <div class="form-group">
                                            <label class="col-md-4 cntr-text">Land Mark</label>
                                            <div class="col-md-8">
                                                <textarea class="form-control" rows="2" id="txtarea_landmark1" maxlength="50" onblur="leftTrim(this)"  onkeyup="this.value=this.value.toUpperCase()"></textarea>
                                            </div>

                                        </div>
                                        <div class="form-group">
                                            <input type="checkbox" class="check1" value="" name="foo" id="chk_ad1"  onclick="chkchange();" />
                                      
                                            Permanant Address same as Present Address

                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="widget box" style="background-color: #f0d6b9">
                                    <%--  <div class="row">--%>

                                    <div class="widget-header">
                                        <h4><i class="icon-reorder"></i>Present Address<span class="required"> *</span></h4>
                                    </div>
                                    <div class="widget-content">
                                        <div class="form-group">

                                            <label class="col-md-4 cntr-text">House Name<span class="required"> *</span></label>
                                            <div class="col-md-8">
                                                <input type="text" name="regular" class="form-control" id="txt_housename2" onblur="leftTrim(this)" autocomplete="off" maxlength="25"  onkeyup="this.value=this.value.toUpperCase()"/>
                                            </div>
                                        </div>
                                        <div class="form-group">

                                            <label class="col-md-4 cntr-text">State</label>
                                            <div class="col-md-8">

                                                <select class="form-control" id="dd_st2" name="st">
                                                        <option value="0" selected="selected">--SELECT--</option>
                                                </select>
                                            </div>
                                           
                                        </div>

                                        <div class="form-group">

                                            <label class="col-md-4 cntr-text">District</label>
                                            <div class="col-md-8">
                                              
                                                <select class="form-control" id="dd_dist2" name="Dt">
                                                  
                                                </select>
                                            </div>

                                        </div>
                                        <div class="form-group">

                                            <label class="col-md-4 cntr-text">Post</label>
                                            <div class="col-md-8">
                                                <select class="form-control" id="dd_post2" name="post">
                                              
                                                </select>
                                            </div>

                                        </div>
                                        <div class="form-group">

                                            <label class="col-md-4 cntr-text">Pincode<span class="required"> *</span></label>
                                            <div class="col-md-8">
                                                <input type="text" name="regular" class="form-control" id="txt_pin2" disabled/>
                                            </div>

                                        </div>

                                        <div class="form-group">
                                            <label class="col-md-4 cntr-text">Land Mark</label>
                                            <div class="col-md-8">
                                                <textarea class="form-control" rows="2" id="txtarea_landmark2" maxlength="50" onblur="leftTrim(this)"  onkeyup="this.value=this.value.toUpperCase()"></textarea>
                                            </div>

                                        </div>

                                    </div>
                                </div>
                                   
                            </div>
                           
                            
                        </div>
                                           <div class="form-group">
                            
                            <label class="col-md-2 cntr-text" hidden="hidden">UAN No</label >
                            <div class="col-md-4" hidden="hidden">
                                <input type="text" name="regular" class="form-control" id="txt_uanno"  autocomplete="off" onkeyup="leftTrim(this)"  maxlength="12" onchange="uandtl()"  onkeypress="return isNumberKey(event,this)"/>
                            </div>
                        </div>
                 
                        <div class="form-group">
                            <label class="col-md-2 cntr-text">Primary Contact No.<span class="required" > *</span></label>
                            <div class="col-md-4">
                                <input type="text" name="prmryno" class="form-control" id="txt_primaryno" autocomplete="off" onkeyup="leftTrim(this)" minlength="10" maxlength="10" onkeypress="return isNumberKey(event,this)"/>
<%--                                 <label for="prmryno" generated="true" class="has-error help-block">This field is required.</label>--%>
                            </div>
                            <label class="col-md-2 cntr-text">Alternate Contact No.</label>
                            <div class="col-md-4">
                                <input type="text" name="altrno" class="form-control" id="txt_altrnateno" autocomplete="off" onkeyup="leftTrim(this)" minlength="10" maxlength="11" onkeypress="return isNumberKey(event,this)"/>
<%--                                <label for="altrno" generated="true" class="has-error help-block">This field is required.</label>--%>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-2 cntr-text">Email ID<span class="required"> *</span></label>
                            <div class="col-md-4">
                                <input type="text" name="emailid" class="form-control required email" id="txt_emailid" autocomplete="off" onkeypress="leftTrim(this)" onblur="chkemail(this.id);" onkeyup="this.value=this.value.toUpperCase()"/>
<%--                                <label for="emailid" class="has-error help-block">Please enter a valid email address.</label>--%>
                            </div>

                          
                        </div>
                    <div class="form-group">
                          <label class="col-md-2 cntr-text">Marital Status<span class="required"> *</span></label>
                            <div class="col-md-5">
                                <label class="radio-inline cntr-text">
                                     <input type="radio" name="radio_marital" class="required uniform" id="rdo_married" onclick="rdo_marital()"/>
                                  Married</label>
                                   
                                   <label class="radio-inline cntr-text">
                                    <input type="radio" name="radio_marital" class="required uniform" id="rdo_single" onclick="rdo_marital()"/>
                                    Single</label>
                                 <label class="radio-inline cntr-text">
                                    <input type="radio" name="radio_marital" class="required uniform" id="rdo_divorce" onclick="rdo_marital()"/>
                                    Divorce</label>
<%--                                <label for="radio_marital" class="has-error help-block" generated="true" style="display: none;"></label>--%>
                            </div>
                    </div>
                        <div class="form-group">
                            <label class="col-md-2 cntr-text">Father</label>
                            <div class="col-md-4">
                                <input type="text" name="regular" class="form-control" id="txt_fathername" maxlength="30" onblur="leftTrim(this)" autocomplete="off" onkeypress="return onlyAlphabets(event,this);" onkeyup="this.value=this.value.toUpperCase()"/>
                            </div>
                            <label class="col-md-2 cntr-text">Contact No.</label>
                            <div class="col-md-4">
                                <input type="text" name="regular" class="form-control" id="txt_fathercntno" autocomplete="off" onkeyup="leftTrim(this)" onkeypress="return isNumberKey(event,this)" maxlength="10" minlength="10" />
                            </div>
                        </div>
                        <div id="hidediv" hidden="hidden">
                        <div class="form-group">
                            <label class="col-md-2 cntr-text">Spouse</label>
                            <div class="col-md-4">
                                <input type="text" name="regular" class="form-control" id="txt_spousename" maxlength="30" onblur="leftTrim(this)" autocomplete="off" onkeypress="return onlyAlphabets(event,this);" onkeyup="this.value=this.value.toUpperCase()"/>
                            </div>

                            <label class="col-md-2 cntr-text">No Of Children</label>
                            <div class="col-md-4">
                                <input type="text" name="regular" class="form-control" id="txt_noofchild" maxlength="2" onkeyup="leftTrim(this)" autocomplete="off"  onkeypress="return isNumberKey(event,this)"/>
                            </div>
                        </div>
                          <div class="form-group" >
                            
                            <label class="col-md-2 cntr-text">Contact No.</label>
                            <div class="col-md-4">
                                <input type="text" name="regular" class="form-control" id="txt_spouseno" autocomplete="off" onkeyup="leftTrim(this)" maxlength="10" onkeypress="return isNumberKey(event,this)" minlength="10"/>
                            </div>
                        </div>
                            </div>
                        <br />
                         <div class="form-group">
                            <div class="col-md-12">
                        
                                <div class="widget-header">
                                    <h4><i class="icon-reorder"></i>Emergency Contact Details <span class="required"> *</span></h4>
                                </div>
                                <div class="widget-content">

                                    <div class="form-group">
                                        <label class="col-md-2 cntr-text">Name</label>
                                        <div class="col-md-4">
                                            <input type="text" name="regular" class="form-control" maxlength="30" onblur="leftTrim(this)" autocomplete="off" id="txt_emergname" onkeypress="return onlyAlphabets(event,this);" onkeyup="this.value=this.value.toUpperCase()"/>
                                        </div>
                                        <label class="col-md-2 cntr-text">Relation </label>
                                        <div class="col-md-4">
                                            <input type="text" name="regular" class="form-control" maxlength="30" onblur="leftTrim(this)" autocomplete="off" id="txt_emerg_relation" onkeypress="return onlyAlphabets(event,this);" onkeyup="this.value=this.value.toUpperCase()"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-2 cntr-text">Address </label>
                                        <div class="col-md-6">
                                            <input type="text" name="regular" class="form-control" maxlength="50" onblur="leftTrim(this)" autocomplete="off" id="txt_emergaddr" onkeypress=" return IsAlphaNumeric(event);" onkeyup="this.value=this.value.toUpperCase()"/>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-md-2 cntr-text">Contact No. </label>
                                        <div class="col-md-4">
                                            <input type="text" name="regular" class="form-control" id="txt_emerg_cnctno" onblur="leftTrim(this)" autocomplete="off" maxlength="10" minlength="10" onkeypress="return isNumberKey(event,this)"/>

                                        </div>
                                        <label class="col-md-2 cntr-text">Email Id </label>
                                        <div class="col-md-4">
                                            <input type="text" name="regular" class="form-control" id="txt_emerg_email" onkeypress="leftTrim(this)" autocomplete="off" onblur="chkemail1(this.id);" onkeyup="this.value=this.value.toUpperCase()"/>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
               
                   
                        <br />
                        <div class="form-group">
                            <div class="col-md-12">
                                <div class="widget-header">
                                    <h4><i class="icon-reorder"></i>Surety Guarantor Details<span class="required"> *</span></h4>
                                </div>
                                <div class="widget-content">
                                    <div class="form-group">
                                        <label class="col-md-2 cntr-text">Name</label>
                                        <div class="col-md-4">
                                            <input type="text" name="regular" class="form-control" id="txt_guarantor_name" onblur="leftTrim(this)" autocomplete="off" maxlength="30" onkeypress="return onlyAlphabets(event,this);" onkeyup="this.value=this.value.toUpperCase()"/>
                                        </div>

                                       
                                    </div>
                                    <div class="form-group"> <label class="col-md-2 cntr-text">Address</label>
                                        <div class="col-md-6">
                                            <input type="text" name="regular" class="form-control" maxlength="50" onblur="leftTrim(this)" autocomplete="off" id="txt_guarantor_addr" onkeypress=" return IsAlphaNumeric(event);" onkeyup="this.value=this.value.toUpperCase()"/>
                                        </div></div>
                                    <div class="form-group">
                                        <label class="col-md-2 cntr-text">Contact No</label>
                                        <div class="col-md-4">
                                            <input type="text" name="regular" class="form-control" id="txt_guarantor_cntno" onblur="leftTrim(this)" autocomplete="off"  minlength="10" maxlength="10" onkeypress="return isNumberKey(event,this)"/>
                                        </div>

                                        <label class="col-md-2 cntr-text">Relationship</label>
                                        <div class="col-md-4">
                                            <input type="text" name="regular" class="form-control" maxlength="15" onblur="leftTrim(this)" id="txt_guarantor_rel" autocomplete="off" onkeypress="return onlyAlphabets(event,this);" onkeyup="this.value=this.value.toUpperCase()"/>
                                        </div>
                                    </div>
                                     <div class="form-group" >
                            <div class="col-md-3"></div>
                            <div class="col-md-4">
                                <label class="radio-inline cntr-text">
                                    <input name="p1" value="land tax" type="radio" id="rdo_land"  onclick="rdo_land_pay()" />
                                    <b>Land Tax</b>
                                </label>
                                <label class="radio-inline  cntr-text">
                                    <input name="p1" value="payslip" type="radio" id="rdo_payslip" onclick="rdo_land_pay()" />
                                    <b>PaySlip</b>
                                </label>
                            </div>
                        </div>
                                     <div class="form-group" id="land" hidden="hidden">
                                        <label class="col-md-2 cntr-text">Receipt No</label>
                                        <div class="col-md-4">
                                            <input type="text" name="regular" class="form-control" id="txt_rptno" onkeydown="leftTrim(this)" maxlength="15" autocomplete="off"  onkeyup="this.value=this.value.toUpperCase()"/>
                                        </div>

                                        <label class="col-md-2 cntr-text">Date of Receipt</label>
                                        <div class="col-md-4">
                                <input type="text" name="regular" class="form-control" id="txt_land_date" required ondrop="false" autocomplete="off" onkeydown="return false" onpaste="false" />
                                        </div>
                                    </div>
                                     <div class="form-group" id="pay" hidden="hidden">
                                        <label class="col-md-2 cntr-text">Govt. Department</label>
                                        <div class="col-md-4">
                                            <input type="text" name="regular" class="form-control" id="txt_gdept" onkeydown="leftTrim(this)" maxlength="25" autocomplete="off" onkeypress="return onlyAlphabets(event,this);" onkeyup="this.value=this.value.toUpperCase()"/>
                                        </div>

                                        <label class="col-md-2 cntr-text">Month And Year</label>
                                        <div class="col-md-4">
                                     <input type="text" name="regular" class="form-control" id="txt_pmnth" required ondrop="false" autocomplete="off" onkeydown="return false" onpaste="false" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <br /> 
                        <div id="tblsurety" hidden="hidden">
                        <div class="ibox-content align-center">
                            <div class="ibox-table">
                                <div class="table-responsive">
                                    <table class="responsive-table table-striped table-bordered table-hover align-center " id="tbl_surety" style="width:1000px;">
                                <thead style="color: white; grid-row-align:center;background-color:#686b6b">
                                    <tr style="height:30px;font-size:x-small;" >
                                                <th data-class="expand">Name</th>
                                                <th>Address</th>
                                                <th>Contact No</th>
                                                <th>Relationship</th>                                               
                                                <th>Receipt No</th>
                                                <th>Date of Receipt No</th>
                                                <th>Govt. Department</th>                             
                                                <th>Month and Year</th>
                                        <th hidden="hidden">Land or pay</th>
                                        <th>Delete </th>                                     
                                            </tr>
                                        </thead>
                                        <tbody>
                                        
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        </div>
                        <div class=" form-group align-center">
                            <input id="btn_add_enrol" type="button" value="ADD"  class="btn-prop" onclick="addsuretyguranteer()" />
                          <%--  <div id="hidedelsuerty" hidden="hidden">
                                <input id="btn_del_enrol" type="button" value="Delete row" class="btn-prop" onclick="delrow()" />
                       </div>--%>
                                 </div>
                    

                            <div class=" form-group align-center">
<%--                                <input value="confirmccc" class="btn btn-primary pull-right" type="submit"/>--%>
                                <input id="btnconfirm" type="button" value="Confirm"  class="btn-prop" onclick="add_Emp_enrol()" />
                                <input id="btn_exit" type="button" value="Exit"  class="btn-prop" onclick="empexit()" />
                        </div>
                        <br />
                   
                   

           </div>
           </form>
        </div>
    </div>
        
</asp:Content>
