<%@ Page Title="" Language="C#" MasterPageFile="~/Main_HO.Master" AutoEventWireup="true" CodeBehind="family_status_HO.aspx.cs" Inherits="Ma_Aspirant.Recruitment.family_status_HO" %>

     

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
      
     <script type="text/javascript" src="../App_Themes/Theme/assets/js/family_HO.js"></script>
      
    
           <script type='text/javascript'>
               $(window).load(function () {
                   check_tab();
                   qual_chk();
                   
                   qual();

               });

               function check_tab() {

                   var empid = $("[id*=txt_session]").val();
                   $.ajax({                ///university
                       type: "POST",
                       contentType: "application/json; charset=utf-8",
                       url: "../HO_Website/family_status_HO.aspx/get_form",
                       data: "{ input : '" + empid + "' }",
                       dataType: "json",
                       success: function (Result) {
                           Result = Result.d;

                           //  alert(Result);
                           if (Result == "222") {
                               alert("Please fill Qualification details");
                               window.open("../HO_Website/qualification_HO.aspx", "_self");
                           }
                       },
                       error: function (Result) {

                       }
                   });
               }

               function qual_chk() {
                   // alert(33);

                   var empid = $("[id*=txt_session]").val();
                   $.ajax({                ///university
                       type: "POST",
                       contentType: "application/json; charset=utf-8",
                       url: "../HO_Website/family_status_HO.aspx/get_family",
                       data: "{ input : '" + empid + "' }",
                       dataType: "json",
                       success: function (Result) {
                           Result = Result.d;

                           //  alert(Result);
                           if (Result == "111") {
                             //  $("#btnconfirm").hide();
                               $("#f_view").show();
                               $("#view1").hide();
                               empfamily_dtl_edit(empid);
                               sibling(empid);

                           }
                           else {
                               $("#btnconfirm").show();
                               $("#f_view").hide();
                               $("#view1").show();
                           
                           }
                       },
                       error: function (Result) {

                       }
                   });

               }

               //27may start
               function empfamily_dtl_edit(empid) {

                 //  var emp = $("#cmb_appId_doc").val();
                   var empid = $("[id*=txt_session]").val();
                   $("#txt_fam").val(0);
                   $("#txt_res").val(0);
                   $("#txt_prop").val('');


                   $("#tbl_family tbody").empty();
                   $("#familydtl").show();
                   $.ajax({
                       type: "POST",
                       contentType: "application/json; charset=utf-8",
                       url: "../HO_Website/family_status_HO.aspx/get_family_dtl2",
                       data: "{ input: '" + empid + "' }",
                       dataType: "json",
                       success: function (Result) {

                           var res = Result.d;
                           //  alert(4235);
                           //355130~1~1~1000000~GEORGE~11~6~3~SHANTHA~11~6~2~COOLI~HOUSE WIFE
                           //355131~1~1~100000~JOSHPAR SALEEM G~11~6~1~SHANTHA BAI R~11~7~0~COOLI~
                           //0-t.emp_code,1-t.family_type,2-t.residence,3-t.value,4-t.father_name,5-t.father_quali,6-t.father_occupation,
                           //7-t.father_sal_range,8-t.mother_name,9-t.mother_quali,10-t.mother_occupation,11-t.mother_sal_range,12-father_occu_any,13t.mother_occu_any
                           var res = Result.d.split("~");
                           $("#txt_fam").val(res[1]);
                           $("#txt_res").val(res[2]);
                           $("#txt_prop").val(res[3]);
                           var fa = 'Father';
                           var mo = 'Mother';
                           $("#tbl_family tbody").append('<tr> <td>' + fa + '</td>' +
                                '<td>' + res[4] + '</td>' +
                               '<td>' + res[5] + '</td>' +
                               '<td>' + res[6] + '</td>' +
                               '<td>' + res[12] + '</td>' +
                               '<td>' + res[7] + '</td></tr><tr> <td>' + mo + '</td>' +
                                 '<td>' + res[8] + '</td>' +
                               '<td>' + res[9] + '</td>' +
                               '<td>' + res[10] + '</td>' +
                               '<td>' + res[13] + '</td>' +
                               '<td>' + res[11] + '</td></tr>');


                       },
                       error: function (Result) {
                       }
                   });

                   //-------------------------------




               }


               function sibling(empid) {
                   
                   var empid = $("[id*=txt_session]").val();
                   $("#tbl_sview tbody").empty();
                   $("#tbl_s").show();
                   $.ajax({
                       type: "POST",
                       contentType: "application/json; charset=utf-8",
                       url: "../HO_Website/family_status_HO.aspx/get_sib_dtl",
                       data: "{ input: '" + empid + "' }",
                       // data:{},
                       dataType: "json",
                       success: function (Result) {
                           for (var i = 0; i < Result.d.length; i++) {
                               $("#tbl_sview tbody").append('<tr> <td>' + Result.d[i].sib_name + '</td>' +
                                '<td>' + Result.d[i].qualification + '</td>' +
                                '<td>' + Result.d[i].occup + '</td>' +
                                '<td>' + Result.d[i].occup_any + '</td>' +
                                '<td>' + Result.d[i].sal + '</td>' +
                                '<td>' + Result.d[i].gen + '</td></tr>');
                           }
                       }
                   });

               }

               //end
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
 
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="panel panel-default col-md-12">
        <div id="Tabs" role="tabpanel">
            <!-- Nav tabs -->
            <ul class="nav nav-pills" role="tablist">
                <li class="gen"><a href="#personaldet" aria-controls="personaldet" role="tab" data-toggle="pill" onclick="personaldet_tab()" id="tabs2">Personal</a></li>
                <li class="gen"  ><a href="#Experience_HO" aria-controls="Experience" role="tab" data-toggle="pill" onclick="Experience_tab()" id="A1">Experience</a></li>
                <li class="gen"><a href="#qualidet" aria-controls="qualidet" role="tab" data-toggle="pill" onclick="quali_tab()" id="tab6">Qualification</a></li>
                <li class="active gen"  ><a href="#family" aria-controls="family" role="tab" data-toggle="pill" onclick="family_tab()" id="tab7">Family</a></li>
                           <li class="gen"><a href="#experience" aria-controls="experience" role="tab" data-toggle="pill" onclick="ref_tab()" id="tabs4">Reference</a></li>

                     <li  class="gen"><a href="#docupload" aria-controls="empassign" role="tab" data-toggle="pill" onclick="doc_tab()" id="tabs3">Document Upload</a></li>
<%--  <li  class="gen"><a href="#photo" aria-controls="exp" role="tab" data-toggle="pill" onclick="photo_tabnew()" id="tabs6">Photo</a></li>--%>

                 </ul>
            <!-- Tab panes -->
            <form id="Form1" class="form-horizontal row-border" action="#" runat="server">
                 <div class="tab-content">
                <div id="f_view" hidden="hidden">
                      <div class="form-group">
                            <div class="col-md-12">
                                <div class="widget box">                                  
                                    <div class="widget-header clonedInput">
                                        <h4><span class="glyphicon glyphicon-zoom-in"></span> Family Details<span class="required"> *</span></h4>
                                    </div>
                                    <div id="Div2" class="clonedInput">
                                             <div class="widget-content">
                   

                       <div class="form-group">
                            <label class="col-md-2 cntr-text">Type of Family<span class="required"> *</span></label>
                            <div class="col-md-3">
                <input type="text" name="gender" class="form-control" id="txt_fam" maxlength="14" autocomplete="off" onblur="leftTrim(this)"disabled />
 
                                
                            </div>
                            <label class="col-md-2 cntr-text">Residence<span class="required"> *</span></label>
                            <div class="col-md-3"> 
  <input type="text" name="gender" class="form-control" id="txt_res" maxlength="14" autocomplete="off" onblur="leftTrim(this)"disabled />

                            </div></div> 

                        <div class="form-group">
                            <label class="col-md-2 cntr-text">Value of Property</label>
                            <div class="col-md-3">
                                <input type="text" name="gender" class="form-control" id="txt_prop" maxlength="14" autocomplete="off" onblur="leftTrim(this)"disabled />
                            </div>
                        </div>
                  
                        
                       
                    
                   
                    


                               <div class="ibox-content"  id="familydtl" hidden="hidden">
                            <div class="ibox-table">
                                <div class="table-responsive">
                                    <table class="responsive-table table-striped table-bordered table-hover align-center " id="tbl_family" style="width:1000px;">
                                <thead style="color: white; grid-row-align:center;background-color:#686b6b">
                                    <tr style="height:30px;font-size:x-small;" >
                                        <th data-class="expand">Father/Mother</th>
                                                <th data-class="expand">Name</th>
                                        <th>Qualification</th>
                                                <th>Occupation</th>
                                                <th>Others, pls specify</th>                                               
                                               <th>Salary</th>                                                                                        
                                     
                                     

                                            </tr>
                                        </thead>
                                        <tbody>
                                            
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>

                     <div class="widget-header">
                                    <h4><i class="icon-reorder"></i>Sibling Details</h4>
                                </div>  
                        <div class="ibox-content"  id="tbl_s" hidden="hidden">
                            <div class="ibox-table">
                                <div class="table-responsive">
                                    <table class="responsive-table table-striped table-bordered table-hover align-center " id="tbl_sview" style="width:1000px;">
                                <thead style="color: white; grid-row-align:center;background-color:#686b6b">
                                    <tr style="height:30px;font-size:x-small;" >
                                                <th data-class="expand">Name</th>
                                        <th>Qualification</th>
                                                <th>Occupation</th>
                                                <th>Others, pls specify</th>                                               
                                               <th>Salary</th>                                                                                        
                                        <th >Gender</th>
                                     

                                            </tr>
                                        </thead>
                                        <tbody>
                                            
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                          

</div></div></div></div></div>


                </div>
                <div id="view1" hidden="hidden">
               
                 
                 
                                  
                        <div class="row ">
                            <div class="ma-header">
                                <div class="col-md-12">
                                    <h3 style="color: #091221"><i class="icon-reorder"></i> FAMILY STATUS</h3>
                                </div>
                            </div>
                        </div>
                         
                        <div class="form-group">
                             <asp:TextBox ID="txt_session" runat="server" hidden="hidden" ></asp:TextBox>
                             
                             <asp:TextBox ID="txtbr" runat="server" hidden="hidden" ></asp:TextBox>
                            
                           
                        </div>

                        <div class="form-group">
                            <label class="col-md-2 cntr-text">Type of Family<span class="required"> *</span></label>
                            <div class="col-md-3"> 
                                <select class="form-control"  id="ddl_family" name="Dt" required >
                                     <option value="0" selected="selected">--SELECT--</option>
                                    <option value="1" >Nuclear</option>
                                    <option value="2" >Joint</option>
                                 </select>
                            </div></div> 

                    
                        <div class="form-group">
                            <label class="col-md-2 cntr-text">Residence<span class="required"> *</span></label>
                            <div class="col-md-3"> 
                                <select class="form-control"  id="ddl_resi" name="Dt" required >
                                     <option value="0" selected="selected">--SELECT--</option>
                                    <option value="1" >Own</option>
                                    <option value="2" >Rent</option>
                                 </select>
                            </div></div> 

                        <div class="form-group">
                            <label class="col-md-2 cntr-text">Value of Property</label>
                            <div class="col-md-3">
                                <input type="text" name="gender" class="form-control" id="txt_value" maxlength="10" autocomplete="off" onblur="leftTrim(this)" onkeypress="return isNumberKey(event,this);" onkeyup="this.value=this.value.toUpperCase()"/>
                            </div>
                        </div>



                               
                        
                        <div class="form-group">
                            <label class="col-md-2 cntr-text">Father Name</label>
                            <div class="col-md-4">
                                <input type="text" name="regular" class="form-control" id="txt_father" maxlength="30" onblur="leftTrim(this)" autocomplete="off" onkeypress="return onlyAlphabets(event,this);" onkeyup="this.value=this.value.toUpperCase()"/>
                            </div>
                             <label class="col-md-2 cntr-text">Father Education Qualification</label>
                                <div class="col-md-3">
                                    <select class="form-control" id="ddl_fquali" name="host1" >
                                           <option value="0" selected="selected">--SELECT--</option>
                                    </select>
                                </div>
                                
                        </div>
                        
                        <div class="form-group">
                           

                    <label class="col-md-2 cntr-text">Father Occupation </label>
                            <div class="col-md-3">
                                <select class="form-control" id="ddl_forgtyp" onchange="fam_orgtype1()">
                                     <option value="0" selected="selected">--SELECT--</option>
                                    <option value="1">Business</option>
                                    <option value="2">Private Salaried</option>
                                     <option value="3">Government Service</option>
                                    <option value="4">Retired</option>
                                    <option value="5">Self employed</option>
                                          <option value="6">Others, pls specify</option>
                                    
    
                                </select>
                            </div>
                        </div>
                     <div class="form-group align-center">
                            <div id="fdiv" hidden="hidden">
                             <label  id="lbl_orgtyp" class="col-md-2 cntr-text" >Pls Specify Organization Type</label>
                             <div class="col-md-3">
                          <input id="txt_forgtyp" type="text" name="regular" class="form-control" autocomplete="off" maxlength="25" hidden="hidden" onblur="leftTrim(this)" onkeypress=" return IsAlphaNumeric(event);" onkeyup="this.value=this.value.toUpperCase()"/>

                             </div></div>
                        </div>
                     <div class="form-group">
                 <label  id="lbl_income" class="col-md-2 cntr-text" >Salary Range per annum</label>

                            <div class="col-md-12">
                                <label class="radio-inline cntr-text">
                                <input type="radio" name="radio_marital" class="required " id="f_ch1"/>
                  <%--   <input type="checkbox" class="check" value="1" name="chk_cst1" id="f_ch1" onclick="chk1()" />--%>
                                            Below 1 Lakh</label>
                         <label class="radio-inline cntr-text">
                             <input type="radio" name="radio_marital" class="required " id="f_ch2"/>
                    <%--     <input type="checkbox" class="check" value="2" name="chk_cst2" id="f_ch2" onclick="chk1()"/>--%>
                                            between 1 Lakh and 2 Lakh</label>
                        <label class="radio-inline cntr-text">
                             <input type="radio" name="radio_marital" class="required " id="f_ch3"/>
                     <%--   <input type="checkbox" class="check" value="3" name="chk_cst3" id="f_ch3" onclick="chk1()"/>--%>
                                            between 2 Lakh and 4 Lakh</label>
                             <label class="radio-inline cntr-text">
                                 <input type="radio" name="radio_marital" class="required " id="f_ch4" />
                    <%-- <input type="checkbox" class="check" value="4" name="chk_cst4" id="f_ch4" onclick="chk1()" />--%>
                                            between 4 Lakh and 6 Lakh</label>
                        <label class="radio-inline cntr-text">
                              <input type="radio" name="radio_marital" class="required " id="f_ch5"/>
                   <%--     <input type="checkbox" class="check" value="5" name="chk_cst5" id="f_ch5" onclick="chk1()"/>--%>
                                            Above 6 Lakh</label></div>
                        </div>

                   


                      <div class="form-group">
                            <label class="col-md-2 cntr-text">Mother Name</label>
                            <div class="col-md-4">
                                <input type="text" name="regular" class="form-control" id="txt_mother" maxlength="30" onblur="leftTrim(this)" autocomplete="off" onkeypress="return onlyAlphabets(event,this);" onkeyup="this.value=this.value.toUpperCase()"/>
                            </div>
                             <label class="col-md-2 cntr-text">Mother Education Qualification</label>
                                <div class="col-md-3">
                                    <select class="form-control" id="ddl_mquali" name="host1" >
                                           <option value="0" selected="selected">--SELECT--</option>
                                    </select>
                                </div>
                                
                        </div>
                        
                        <div class="form-group">
                           

                    <label class="col-md-2 cntr-text">Mother Occupation </label>
                            <div class="col-md-3">
                                <select class="form-control" id="ddl_morgtyp" onchange="fam_orgtype2()">
                                     <option value="0" selected="selected">--SELECT--</option>
                                    <option value="1">Business</option>
                                    <option value="2">Private Salaried</option>
                                     <option value="3">Government Service</option>
                                    <option value="4">Retired</option>
                                    <option value="5">Self employed</option>
                                    <option value="7">Homemaker</option>
                                          <option value="6">Others, pls specify</option>
                                    
    
                                </select>
                            </div>
                        </div>
                     <div class="form-group align-center">
                            <div id="mdiv" hidden="hidden">
                             <label  id="Label1" class="col-md-2 cntr-text" >Pls Specify Organization Type</label>
                             <div class="col-md-3">
                          <input id="txt_morgtyp" type="text" name="regular" class="form-control" autocomplete="off" maxlength="25" hidden="hidden" onblur="leftTrim(this)" onkeypress=" return IsAlphaNumeric(event);" onkeyup="this.value=this.value.toUpperCase()"/>

                             </div></div>
                        </div>
                  
                     <div class="form-group" id="saldiv" hidden="hidden">
                 <label  id="Label2" class="col-md-2 cntr-text">Salary Range per annum</label>
                         
                                
                            <div class="col-md-12"><label class="radio-inline cntr-text">
                              <%--  <input type="radio" name="radio_marital" class="required uniform" id="m_ch1"/>--%>
                                   
                  <input type="checkbox" class="check" value="1" name="chk_cst1" id="m_ch1" onclick="chk2()" />
                                            Below 1 Lakh</label>
                         <label class="radio-inline cntr-text">
                          <%--   <input type="radio" name="radio_marital" class="required uniform" id="m_ch2"/>--%>
                        <input type="checkbox" class="check" value="2" name="chk_cst2" id="m_ch2" onclick="chk2()"/>
                                            between 1 Lakh and 2 Lakh</label>
                         <label class="radio-inline cntr-text">
                           <%--  <input type="radio" name="radio_marital" class="required uniform" id="m_ch3" />--%>
                       <input type="checkbox" class="check" value="3" name="chk_cst3" id="m_ch3" onclick="chk2()"/>
                                            between 2 Lakh and 4 Lakh</label>
                        
                            <label class="radio-inline cntr-text">
                             <%--    <input type="radio" name="radio_marital" class="required uniform" id="m_ch4" />--%>
                     <input type="checkbox" class="check" value="4" name="chk_cst4" id="m_ch4" onclick="chk2()" />
                                            between 4 Lakh and 6 Lakh</label>
                         <label class="radio-inline cntr-text">
                           <%--   <input type="radio" name="radio_marital" class="required uniform" id="m_ch5" onclick="chk2()"/>--%>
                        <input type="checkbox" class="check" value="5" name="chk_cst5" id="m_ch5" onclick="chk2()"/>
                                            Greater than 6 Lakh</label></div>
                        </div>

                    


                     <div class="widget-header">
                                    <h4><i class="icon-reorder"></i>Sibling Details</h4>
                                </div>    
                     <div class="form-group">
                 <label  id="Label5" class="col-md-2 cntr-text" >Sibilings</label>

                          
                                <label class="radio-inline cntr-text">
                                <input type="radio" name="sib" class="required " id="rdo_sib1" onclick="rdo_sibl()" />
                                            yes</label>
                         <label class="radio-inline cntr-text">
                             <input type="radio" name="sib" class="required " id="rdo_sib2" onclick="rdo_sibl()" />
                                            no</label>
                          
                        </div>
       
    <div id="div_sib" hidden="hidden">
                        <div class="form-group">
                            <label class="col-md-2 cntr-text"> Name</label>
                            <div class="col-md-4">
                                <input type="text" name="regular" class="form-control" id="txt_sname" maxlength="30" onblur="leftTrim(this)" autocomplete="off" onkeypress="return onlyAlphabets(event,this);" onkeyup="this.value=this.value.toUpperCase()"/>
                            </div>
                             <label class="col-md-2 cntr-text"> Education Qualification</label>
                                <div class="col-md-3">
                                    <select class="form-control" id="ddl_squali" name="host1" >
                                           <option value="0" selected="selected">--SELECT--</option>
                                    </select>
                                </div>
                                
                        </div>
                         <div class="form-group">
                 <label  id="Label6" class="col-md-2 cntr-text" >Gender</label>

                            <div class="col-md-6">
                           
                           <label class="radio-inline cntr-text">
                                    <input name="radio_gender" value="Male " type="radio" id="rdo_male" class="required"/>
                                   Male
                                </label>
                                <label class="radio-inline  cntr-text">
                                    <input name="radio_gender" value="Female" type="radio" id="rdo_female" class="required"/>
                                    Female
                                </label>
                                 <label class="radio-inline  cntr-text">
                                    <input name="radio_gender" value="Other" type="radio" id="rdo_other" class="required"/>
                                   Other
                                </label>
                        </div>
</div>
                   
                        <div class="form-group">
                           

                    <label class="col-md-2 cntr-text"> Occupation </label>
                            <div class="col-md-3">
                                <select class="form-control" id="ddl_sorgtyp" onchange="fam_orgtype3()">
                                     <option value="0" selected="selected">--SELECT--</option>
                                    <option value="1">Business</option>
                                    <option value="2">Private Salaried</option>
                                     <option value="3">Government Service</option>
                                    <option value="4">Retired</option>
                                    <option value="5">Self employed</option>
                                          <option value="6">Others, pls specify</option>
                                       <option value="8">Student</option>
                                     <option value="9">Non Occupied</option>
    
                                </select>
                            </div>
                        </div>
                     <div class="form-group align-center">
                            <div id="div_sorg" hidden="hidden">
                             <label  id="Label3" class="col-md-2 cntr-text" >Pls Specify Organization Type</label>
                             <div class="col-md-3">
                          <input id="txt_sorgtyp" type="text" name="regular" class="form-control" autocomplete="off" maxlength="25" hidden="hidden" onblur="leftTrim(this)" onkeypress=" return IsAlphaNumeric(event);" onkeyup="this.value=this.value.toUpperCase()"/>

                             </div></div>
                        </div>
                     <div class="form-group" id="sib_saldiv" hidden="hidden">
                 <label  id="Label4" class="col-md-2 cntr-text" >Salary Range per annum</label>

                            <div class="col-md-12">
                                <label class="radio-inline cntr-text">
                                <input type="radio" name="s1" class="required " id="rdo_s1"/>
                                            Below 1 Lakh</label>
                         <label class="radio-inline cntr-text">
                             <input type="radio" name="s1" class="required " id="rdo_s2"/>
                                            between 1 Lakh and 2 Lakh</label>
                        <label class="radio-inline cntr-text">
                             <input type="radio" name="s1" class="required " id="rdo_s3"/>
                                            between 2 Lakh and 4 Lakh</label>
                             <label class="radio-inline cntr-text">
                                 <input type="radio" name="s1" class="required " id="rdo_s4" />
                                            between 4 Lakh and 6 Lakh</label>
                        <label class="radio-inline cntr-text">
                              <input type="radio" name="s1" class="required " id="rdo_s5"/>
                                            Above 6 Lakh</label></div>
                        </div>
                                <input id="btn_sib" type="button" value="Add Siblings details" class="btn-prop" onclick="add_sibling()"/>
             
        
  
                        <div class="ibox-content"  id="tbl_sib" hidden="hidden">
                            <div class="ibox-table">
                                <div class="table-responsive">
                                    <table class="responsive-table table-striped table-bordered table-hover align-center " id="tbl_sibling" style="width:1000px;">
                                <thead style="color: white; grid-row-align:center;background-color:#686b6b">
                                    <tr style="height:30px;font-size:x-small;" >
                                                <th data-class="expand">Name</th>
                                        <th>Qualification</th>
                                                <th>Occupation</th>
                                                <th>Others, pls specify</th>                                               
                                               <th>Salary</th>                                                                                        
                                        <th hidden="hidden">quaid</th> 
                                        <th hidden="hidden">Occupationid</th> 
                                         <th hidden="hidden">salid</th>
                                         <th hidden="hidden">gender</th>
                                         <th >Gender</th>
                                        <th>Delete</th>
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

                                <input id="btnconfirm" type="button" value="Confirm"  class="btn-prop" onclick="add_familystatus()" />
                                <input id="btn_exit" type="button" value="Exit"  class="btn-prop" onclick="empexit()" />
                        </div>
                        <br />
                   
                   

           </div>
          </div> </form>
        </div>
    </div>
        
</asp:Content>
