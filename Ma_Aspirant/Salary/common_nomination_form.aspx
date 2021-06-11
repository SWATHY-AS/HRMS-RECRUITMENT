<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="common_nomination_form.aspx.cs" Inherits="Ma_Aspirant.Salary.common_nomination_form" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
       <script>

            debugger;
            function SaveImage() {
              
                var fileList = document.getElementById("fup_load").files;
                var fileReader = new FileReader();
                if (fileReader && fileList && fileList.length) {
                    var fileName = fileList[0].name;
                    fileReader.readAsDataURL(fileList[0]);
                    fileReader.onload = function () {
                        var imageData = fileReader.result;
                        var d1 = imageData.split(":");

                        var d3 = d1[1].split(";");
                        $.ajax({
                            type: "POST",
                            contentType: "application/json; charset=utf-8",
                            url: "commonNominationForm.aspx/Documents_upload",
                            data: "{ upload_file: '" + imageData + "'}",
                            dataType: "json",
                            //beforeSend: function () {
                            //    return confirm("Are you sure you want to confirm?");
                        })
                    }
                }
            }



           $(window).load(function () {
               check_tab();
               data_load();
            $("#txt_dob_nomi_name_1").datepicker({
                dateFormat: 'dd/MM/yy',
                maxDate: new Date(),
                changeMonth: true,
                changeYear: true,
                stepMonths: true,
                todayHighlight: true,
               yearRange: "-150:+0",
                onSelect: function (dateText, inst) {
                   // check_date();
                }
            });
            $("#txt_dob_nomi_name_2").datepicker({
                dateFormat: 'dd/MM/yy',
                 maxDate: new Date(),
                changeMonth: true,
                changeYear: true,
                stepMonths: true,
                todayHighlight: true,
                yearRange: "-150:+0",
                onSelect: function (dateText, inst) {
                  //  check_date();
                }
            });

            $("#txt_dob_nomi_name_3").datepicker({
                dateFormat: 'dd/MM/yy',
                 maxDate: new Date(),
                changeMonth: true,
                changeYear: true,
                stepMonths: true,
                todayHighlight: true,
                yearRange: "-150:+0",
                onSelect: function (dateText, inst) {
                  //  check_date();
                }
            });

            $("#txt_dob_nomi_name_4").datepicker({
                dateFormat: 'dd/MM/yy',
                 maxDate: new Date(),
                changeMonth: true,
                changeYear: true,
                stepMonths: true,
                todayHighlight: true,
                yearRange: "-150:+0",
                onSelect: function (dateText, inst) {
                  //  check_date();
                }
            });

            $("#txt_dob_nomi_name_5").datepicker({
                dateFormat: 'dd/MM/yy',
                 maxDate: new Date(),
                changeMonth: true,
                changeYear: true,
                stepMonths: true,
                todayHighlight: true,
                yearRange: "-150:+0",
                onSelect: function (dateText, inst) {
                  //  check_date();
                }
            });
            var sess = $("[id*=txt_session]").val();

            $.ajax({
                type: 'POST',
                url: 'common_nomination_form.aspx/emp_details',
                contentType: 'application/json; charset=utf-8',
                data: "{ input: '" + sess + "' }",
            //    data: "",
                dataType: 'json',
                success: function (Result) {
                    var res = Result.d;
                    //alert(res);
                    $("#txt_index").empty();
                    $("#txt_index").append(res);
                }
            });
        });
        function same()
        {
           
            if ($('input[id=chk1]').is(':checked')) {
                var sc = 1;
                var n1 = $("#txt_grat_nomi_name_1").val();
                $("#txt_grat_nomi_name_2").val(n1);
                var n2 = $("#txt_dob_nomi_name_1").val();
                $("#txt_dob_nomi_name_2").val(n2);
                var n3 = $("#txt_relat_nomi_name_1").val();
                $("#txt_relat_nomi_name_2").val(n3);
                var n4 = $("#txt_addr_nomi_name_1").val();
                $("#txt_addr_nomi_name_2").val(n4);
                var n5 = $("#txt_cont_nomi_name_1").val();
                $("#txt_cont_nomi_name_2").val(n5);
            }
            else
            {
                $("#txt_relat_nomi_name_2").val('');
                $("#txt_dob_nomi_name_2").val('');
                $("#txt_relat_nomi_name_2").val('');
                $("#txt_addr_nomi_name_2").val('');
                $("#txt_cont_nomi_name_2").val('');
                $("#txt_grat_nomi_name_2").val('');
            }
        }

        function same1() {

            if ($('input[id=chk2]').is(':checked')) {
                var sc = 1;
                var n1 = $("#txt_grat_nomi_name_2").val();
                $("#txt_grat_nomi_name_3").val(n1);
                var n2 = $("#txt_dob_nomi_name_2").val();
                $("#txt_dob_nomi_name_3").val(n2);
                var n3 = $("#txt_relat_nomi_name_2").val();
                $("#txt_relat_nomi_name_3").val(n3);
                var n4 = $("#txt_addr_nomi_name_2").val();
                $("#txt_addr_nomi_name_3").val(n4);
                var n5 = $("#txt_cont_nomi_name_2").val();
                $("#txt_cont_nomi_name_3").val(n5);
            }
            else {
                $("#txt_relat_nomi_name_3").val('');
                $("#txt_dob_nomi_name_3").val('');
                $("#txt_relat_nomi_name_3").val('');
                $("#txt_addr_nomi_name_3").val('');
                $("#txt_cont_nomi_name_3").val('');
                $("#txt_grat_nomi_name_3").val('');
            }
        }
           
        function same2() {

            if ($('input[id=chk3]').is(':checked')) {
                var sc = 1;
                var n1 = $("#txt_grat_nomi_name_3").val();
                $("#txt_grat_nomi_name_4").val(n1);
                var n2 = $("#txt_dob_nomi_name_3").val();
                $("#txt_dob_nomi_name_4").val(n2);
                var n3 = $("#txt_relat_nomi_name_3").val();
                $("#txt_relat_nomi_name_4").val(n3);
                var n4 = $("#txt_addr_nomi_name_3").val();
                $("#txt_addr_nomi_name_4").val(n4);
                var n5 = $("#txt_cont_nomi_name_3").val();
                $("#txt_cont_nomi_name_4").val(n5);
            }
            else {
                $("#txt_relat_nomi_name_4").val('');
                $("#txt_dob_nomi_name_4").val('');
                $("#txt_relat_nomi_name_4").val('');
                $("#txt_addr_nomi_name_4").val('');
                $("#txt_cont_nomi_name_4").val('');
                $("#txt_grat_nomi_name_4").val('');
            }
        }

        function same3() {

            if ($('input[id=chk4]').is(':checked')) {
                var sc = 1;
                var n1 = $("#txt_grat_nomi_name_4").val();
                $("#txt_grat_nomi_name_5").val(n1);
                var n2 = $("#txt_dob_nomi_name_4").val();
                $("#txt_dob_nomi_name_5").val(n2);
                var n3 = $("#txt_relat_nomi_name_4").val();
                $("#txt_relat_nomi_name_5").val(n3);
                var n4 = $("#txt_addr_nomi_name_4").val();
                $("#txt_addr_nomi_name_5").val(n4);
                var n5 = $("#txt_cont_nomi_name_4").val();
                $("#txt_cont_nomi_name_5").val(n5);
            }
            else {
                $("#txt_relat_nomi_name_5").val('');
                $("#txt_dob_nomi_name_5").val('');
                $("#txt_relat_nomi_name_5").val('');
                $("#txt_addr_nomi_name_5").val('');
                $("#txt_cont_nomi_name_5").val('');
                $("#txt_grat_nomi_name_5").val('');
            }
           }
          
            function check_tab() {

            var empid = $("[id*=txt_session]").val();
            $.ajax({                ///university
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "common_nomination_form.aspx/get_form1",
                data: "{ input : '" + empid + "' }",
                dataType: "json",
                success: function (Result) {
                    Result = Result.d;

                    //  alert(Result);
                    if (Result == "222") {
                        alert("Please fill Reference details");
                        window.open("../Recruitment/Reference_per.aspx", "_self");
                    }
                },
                error: function (Result) {

                }
            });
           }
           function data_load() {
                 var empid = $("[id*=txt_session]").val();
            $.ajax({                ///university
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "common_nomination_form.aspx/data_check",
                data: "{ input : '" + empid + "' }",
                dataType: "json",
                success: function (Result) {
                    Result = Result.d;

                    //  alert(Result);
                    if (Result == "1") {
                        $("#common1").show();
                        $("#common2").hide();

                        //alert("ok done");
                       table_load(empid);

                    } else {
                        $("#common2").show();
                        $("#common1").hide();
                    }
                },
                error: function (Result) {

                }
            });
           }
           function table_load(input) {
              

                var empid = $("[id*=txt_session]").val();
                //  var emp = $("#ddl_q_emp").val();
                $("#tbl_qual_v tbody").empty();
                $("#tbl_q_v").show();
                // alert(emp);
                $.ajax({
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    url: "common_nomination_form.aspx/get_nomin_dtl_view",
                    data: "{ input: '" + empid + "' }",
                    dataType: "json",
                    success: function (Result) {
                        // alert(Result.d);
                        // var res = Result.d.split("~");                  
                        //      category qualification university institution  YEAR_PASS  percentage grade  NO_OF_ATTEMPT
                        for (var i = 0; i < Result.d.length; i++) {
                            $("#tbl_qual_v tbody").append('<tr> <td>' + Result.d[i].particulars + '</td>' +
                                      '<td>' + Result.d[i].nomin_name + '</td>' +
                                      '<td>' + Result.d[i].dob + '</td>' +
                                      '<td>' + Result.d[i].relation + '</td>' +
                                      '<td>' + Result.d[i].address + '</td>' +
                                      '<td>' + Result.d[i].cont_dtls + '</td> </tr>');
                        }
                    },
                    error: function (Result) {
                    }
                });


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


    </script>
        <style type="text/css">
            .auto-style1 {
                width: 34px;
            }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div class="panel panel-default col-md-12">
        <div id="Tabs" role="tabpanel">
            <!-- Nav tabs -->
               <ul class="nav nav-pills" role="tablist">

                     <li  class="gen"><a href="#personaldet" aria-controls="personaldet" role="tab" data-toggle="pill" onclick="personaldet_tab()" id="tabs2">Personal</a></li>
                   <li class="gen"><a href="#qualidet" aria-controls="qualidet" role="tab" data-toggle="pill" onclick="quali_tab()" id="tab6">Qualification</a></li>
                        <li class="gen"><a href="#family" aria-controls="family" role="tab" data-toggle="pill" onclick="family_tab()" id="tab7">Family</a></li>
                                <li class="gen"><a href="#experience" aria-controls="experience" role="tab" data-toggle="pill" onclick="ref_tab()" id="tabs4">Reference</a></li>
                                                         <li  class="active gen"><a href="#common_nom" aria-controls="common_nom" role="tab" data-toggle="pill" onclick="com_nom()" id="tabs5">Common Nomination Form</a></li>

                <li class="gen"><a href="#docupload" aria-controls="empassign" role="tab" data-toggle="pill" onclick="doc_tab()" id="tabs3">Document Upload</a></li>
  <li  class="gen"><a href="#photo" aria-controls="exp" role="tab" data-toggle="pill" onclick="photo_tabnew()" id="tabs6">Photo</a></li>

                                                      </ul>


        <div data-ng-controller="MyCtrl">
        <div class="col-md-12">
            <form id="Form1" runat="server">
            <div class="form-group align-center">
                        <div>
                            <b style="font-size: 15px;">MANAPPURAM FINANCE LIMITED</b><br />
                            <b style="font-size: 15px;">Common Nomination Form for Gratuity, Full & Final Settlement</b><br />
                            <b style="font-size: 15px;">Employees, Group Insurance Scheme & EDLI</b>
                        </div>
                    </div>
            <br />
<div class="row">
                            <div class="ma-header">
                                <div class="col-md-12 left">
                                    <h3 style="color: #091221"><i class="icon-user"></i> Common Nomination Form</h3>
                                </div>
                            </div>
                        </div>

<div id="common1" hidden="hidden">
                     <div class="form-group">
                            <div class="col-md-12">
                                <div class="widget box">                                  
                                    <div class="widget-header clonedInput">
                                        <h4><span class="glyphicon glyphicon-zoom-in"></span> Common Nomination Details<span class="required"> *</span></h4>
                                    </div>
                                    <div id="Div1" class="clonedInput">
                                             <div class="widget-content">
                                          
                        <div class="ibox-content"  id="tbl_q_v" hidden="hidden">
                            <div class="ibox-table">
                                <div class="table-responsive">
                                    <table class="responsive-table table-striped table-bordered table-hover align-center " id="tbl_qual_v" style="width:1000px;">
                                <thead style="color: white; grid-row-align:center;background-color:#686b6b">
                                    <tr style="height:30px;font-size:x-small;" >
                                                <th data-class="expand">PARTICULARS</th>
                                        <th>NOMINEE NAME</th>
                                                <th>DOB</th>
                                                <th>RELATIONSHIP</th>                                               
                                               <th>ADDRESS</th>
                                                <th>CONTACT DETAILS</th>
                                               
                                        

                                            </tr>
                                        </thead>
                                        <tbody>
                                            
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                                 </div>
                                        </div>
                        </div>
                                 </div></div>
   
                 </div>


<div id="common2" hidden="hidden">

            <div class="form-group align-center">
                    <p>
                             <asp:TextBox ID="txt_session" runat="server" hidden="hidden" ></asp:TextBox>
                        <b id="txt_index"></b>
                        <asp:HiddenField ID="hfield_emp_code" Value="" runat="server" />
                    </p>
             </div>
         
                 
               
                <div id="Div1" class="clonedInput">
                <div class="widget-content">
         <div class='col-md-12 align-center' style='width:100%; text-align:center!important;'>
                    <div class='ibox-table'>
                    <strong style='color: #091221;padding-left:1.5%;display:block;font-size:14px;' id='strong8'></strong>
                    <table class='form-group align-center table table-bordered table-hover table-checkable table-responsive datatable' style='border:#060606 !important;' id='tbl_nomination_dtl'>
                    <thead style = 'color: white;background-color:#686b6b'>
                    <tr style='height:30px;font-size:12px;readonly="true"'>
                        <th data-class='expand' style='text-align: center;!important' class="auto-style1">Sl No.</th>
                        <th data-class='expand' style='text-align: center;!important'  >Particulars</th>
                        <th data-class='expand' style='text-align: center;!important'>Name of Nominee</th>
                        <th data-class='expand' style='text-align: center;!important'disable:"disable">Date of Birth (DD/MM/YYYY)</th>
                        <th data-class='expand' style='text-align: center;!important;padding-right: 52px;'>Relation with the employee</th>
                        <th data-class='expand' style='text-align: center;!important'>Address of nominee</th>
                        <th data-class='expand' style='text-align: center;!important'>Contact Number/Email-Id</th>
                    </tr>
                        
                    </thead>
                    <tbody>
                        <tr>
                            <td class="auto-style1">1 </td> <td>Gratuity Settlement</td> <td><input type="text" id="txt_grat_nomi_name_1" maxlength="100" onkeypress="return onlyAlphabets(event,this);"/></td> <td><input type="text" id="txt_dob_nomi_name_1" readonly="true"/></td> 
                            <td><select name="relation" id="txt_relat_nomi_name_1" class="form-control required">
	                            <option value="-1">---Select---</option>
	                            <option value="father">Father</option>
	                            <option value="mother">Mother</option>
                                <option value="husband">Husband</option>
                                <option value="wife">Wife</option>
	                            <option value="son">Son</option>
                                <option value="daughter">Daughter</option>
	                            <option value="other">Other</option>
                            </select></td>
                        <td><input type="text" id="txt_addr_nomi_name_1" maxlength="100" /></td> <td><input type="text" id="txt_cont_nomi_name_1" maxlength="100" /></td>
                        </tr>
                        <tr>
                            <td class="auto-style1">2 Same as above<input type="checkbox"   name="Same as above" id="chk1" onclick="same()"/> </td> <td>Full & Final Settlement Amount (If Any)</td> <td><input type="text" id="txt_grat_nomi_name_2" maxlength="100" onkeypress="return onlyAlphabets(event,this);" /></td> <td><input type="text" id="txt_dob_nomi_name_2" readonly="true" /></td> 
                           
                            <td><select name="relation" id="txt_relat_nomi_name_2" class="form-control required">
	                            <option value="-1">---Select---</option>
	                            <option value="father">Father</option>
	                            <option value="mother">Mother</option>
                                <option value="husband">Husband</option>
                                <option value="wife">Wife</option>
	                            <option value="son">Son</option>
                                <option value="daughter">Daughter</option>
	                            <option value="other">Other</option>
                            </select></td>
                            <td><input type="text" id="txt_addr_nomi_name_2" maxlength="100" /></td> <td><input type="text" id="txt_cont_nomi_name_2" maxlength="100" /></td>
                        </tr>
                        <tr>
                            <td class="auto-style1">3 Same as above<input type="checkbox"   name="Same as above" id="chk2" onclick="same1()"/> </td> <td>EDLI (EMployee Deposit Linked Insurance) Settlement</td> <td><input type="text" id="txt_grat_nomi_name_3" maxlength="100" onkeypress="return onlyAlphabets(event,this);"/></td> <td><input type="text" id="txt_dob_nomi_name_3" /></td> 
                            <td><select name="relation" id="txt_relat_nomi_name_3" class="form-control required">
	                            <option value="-1">---Select---</option>
	                            <option value="father">Father</option>
	                            <option value="mother">Mother</option>
                                <option value="husband">Husband</option>
                                <option value="wife">Wife</option>
	                            <option value="son">Son</option>
                                <option value="daughter">Daughter</option>
	                            <option value="other">Other</option>
                            </select></td>
                            <td><input type="text" id="txt_addr_nomi_name_3" maxlength="100"  /></td> <td><input type="text" id="txt_cont_nomi_name_3" maxlength="100" /></td>
                        </tr>
                        <tr> 
                            <td class="auto-style1">4 Same as above <input type="checkbox"   name="Same as above" id="chk3" onclick="same2()"/></td> <td>Unpaid Salary (If Any)</td> <td><input type="text" id="txt_grat_nomi_name_4" maxlength="100" onkeypress="return onlyAlphabets(event,this);"/></td> <td><input type="text" id="txt_dob_nomi_name_4" readonly="true"/></td> 
                            <td><select name="relation" id="txt_relat_nomi_name_4" class="form-control required">
	                            <option value="-1">---Select---</option>
	                            <option value="father">Father</option>
	                            <option value="mother">Mother</option>
                                <option value="husband">Husband</option>
                                <option value="wife">Wife</option>
	                            <option value="son">Son</option>
                                <option value="daughter">Daughter</option>
	                            <option value="other">Other</option>
                            </select></td>
                            <td><input type="text" id="txt_addr_nomi_name_4" maxlength="100" /></td> <td><input type="text" id="txt_cont_nomi_name_4" maxlength="100" /></td>
                        </tr>
                        <tr> 
                            <td class="auto-style1">5 Same as above<input type="checkbox"   name="Same as above" id="chk4" onclick="same3()"/>    </td> <td>Claim amount from Group Accident Insurance Policy based on my entitlement/coverage.</td> <td><input type="text" id="txt_grat_nomi_name_5" maxlength="100" onkeypress="return onlyAlphabets(event,this);" /></td> <td><input type="text" id="txt_dob_nomi_name_5" readonly="true" /></td> 
                            <td><select name="relation" id="txt_relat_nomi_name_5" class="form-control required">
	                            <option value="-1">---Select---</option>
	                            <option value="father">Father</option>
	                            <option value="mother">Mother</option>
                                <option value="husband">Husband</option>
                                <option value="wife">Wife</option>
	                            <option value="son">Son</option>
                                <option value="daughter">Daughter</option>
	                            <option value="other">Other</option>
                            </select></td>
                            <td><input type="text" id="txt_addr_nomi_name_5" maxlength="100" /></td> <td><input type="text" id="txt_cont_nomi_name_5" maxlength="100" /></td>
                        </tr>
                    </tbody>
                    </table>
                    </div>
             <br />
                </div>
                                             
            <br />
            
                 
            <br /><br />

                                 <div class="form-group align-center">
                     <asp:Label ID="Label1" runat="server" Text="To Confirm the above details.Click here:" hidden="hidden"></asp:Label> 
                  <input type="button" id="btn_confirm" value="CONFIRM" onclick="return validation();"style="text-align:center"  />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                          <asp:Label ID="lbl_2" runat="server" Text="Take a print out of the form.Click here" hidden="hidden"></asp:Label>
                           &nbsp;<asp:Button ID="btn_Download"  runat="server" Text="Preview" BackColor="Black" BorderColor="#FFCC00" ForeColor="White" OnClick="btn_Download_Click" Height="30px" Width="121px" hidden="hidden"/>
<%--                                     <input type="button" id="btn_exit" value="EXIT" onclick="empexit()" class="btn btn-prop" hidden="hidden"/>--%>
                                     <br />

                                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                </div>    
            
            <div class="form-group" hidden="hidden">       
              <asp:Label ID="lbl_3" runat="server" Text="Please affix your signature in the form and upload the scan copy" style="text-align: left"></asp:Label>  
              &nbsp;&nbsp;&nbsp;  
              <asp:FileUpload ID="fpld_doc" runat="server" Width="138px" Height="29px"></asp:FileUpload>
                  <asp:Button ID="btn_Upld" runat="server"   Text="Upload"  OnClientClick="UpldVal" OnClick="btn_upld_Click" />
         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
               
         </div>
             
                       <%--<div class="widget box align-center">
                           :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                           &nbsp; 
                          
                           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />
                           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                           </div>--%>
                          


  
 <div class="widget box align-center">
                </div>

    </div>
                    </div>
            </div>
            </form>
            </div></div>
    </div>
    </div>
    <script>






        function empexit() {
            window.location = "../Index/Index.aspx";
        }
      
        function validation() {

            var a1 = $("#txt_grat_nomi_name_1").val();
            if (a1 == "") {
                alert("Please enter the Nominee Name");
                $("#txt_grat_nomi_name_1").focus();
                return false;
            }

            // DOB Validation
            var a2 = $("#txt_dob_nomi_name_1").val();
            //if (a2 == "") {
            //    alert("Please select the Nominee Date of Birth");
            //    $("#txt_dob_nomi_name_1").focus();
            //    return false;
            //}


            var a3 = $("#txt_relat_nomi_name_1").val();
            if (a3 == "-1") {
                alert("Please select the nominee relation");
                $("#txt_relat_nomi_name_1").focus();
                return false;
            }

            var a4 = $("#txt_addr_nomi_name_1").val();
            if (a4 == "") {
                alert("Please enter the nominee address details");
                $("#txt_addr_nomi_name_1").focus();
                return false;
            }

            // Contact Number & Email Id 

            var a5 = $("#txt_cont_nomi_name_1").val();
            //if (a5 == "") {
            //    alert("Please enter the nominee contact no or email-id");
            //    $("#txt_cont_nomi_name_1").focus();
            //    return false;
            //}

            var b1 = $("#txt_grat_nomi_name_2").val();
            if (b1 == "") {
                alert("Please enter the Nominee Name");
                $("#txt_grat_nomi_name_2").focus();
                return false;
            }

            // DOB Validation
            var b2 = $("#txt_dob_nomi_name_2").val();
            //if (b2 == "") {
            //    alert("Please select the Nominee Date of Birth");
            //    $("#txt_dob_nomi_name_2").focus();
            //    return false;
            //}


            var b3 = $("#txt_relat_nomi_name_2").val();
            if (b3 == "-1") {
                alert("Please select the nominee relation");
                $("#txt_relat_nomi_name_2").focus();
                return false;
            }

            var b4 = $("#txt_addr_nomi_name_2").val();
            if (b4 == "") {
                alert("Please enter the nominee address details");
                $("#txt_addr_nomi_name_2").focus();
                return false;
            }

            // Contact Number & Email Id 

            var b5 = $("#txt_cont_nomi_name_2").val();
            //if (b5 == "") {
            //    alert("Please enter the nominee contact no or email-id");
            //    $("#txt_cont_nomi_name_2").focus();
            //    return false;
            //}


            var c1 = $("#txt_grat_nomi_name_3").val();
            if (c1 == "") {
                alert("Please enter the Nominee Name");
                $("#txt_grat_nomi_name_3").focus();
                return false;
            }

            // DOB Validation
            var c2 = $("#txt_dob_nomi_name_3").val();
            //if (c2 == "") {
            //    alert("Please select the Nominee Date of Birth");
            //    $("#txt_dob_nomi_name_3").focus();
            //    return false;
            //}


            var c3 = $("#txt_relat_nomi_name_3").val();
            if (c3 == "-1") {
                alert("Please select the nominee relation");
                $("#txt_relat_nomi_name_3").focus();
                return false;
            }

            var c4 = $("#txt_addr_nomi_name_3").val();
            if (c4 == "") {
                alert("Please enter the nominee address details");
                $("#txt_addr_nomi_name_3").focus();
                return false;
            }

            // Contact Number & Email Id 

            var c5 = $("#txt_cont_nomi_name_3").val();
            //if (c5 == "") {
            //    alert("Please enter the nominee contact no or email-id");
            //    $("#txt_cont_nomi_name_3").focus();
            //    return false;
            //}

            var d1 = $("#txt_grat_nomi_name_4").val();
            if (d1 == "") {
                alert("Please enter the Nominee Name");
                $("#txt_grat_nomi_name_4").focus();
                return false;
            }

            // DOB Validation
            var d2 = $("#txt_dob_nomi_name_4").val();
            //if (d2 == "") {
            //    alert("Please select the Nominee Date of Birth");
            //    $("#txt_dob_nomi_name_4").focus();
            //    return false;
            //}


            var d3 = $("#txt_relat_nomi_name_4").val();
            if (d3 == "-1") {
                alert("Please select the nominee relation");
                $("#txt_relat_nomi_name_4").focus();
                return false;
            }

            var d4 = $("#txt_addr_nomi_name_4").val();
            if (d4 == "") {
                alert("Please enter the nominee address details");
                $("#txt_addr_nomi_name_4").focus();
                return false;
            }

            // Contact Number & Email Id 

            var d5 = $("#txt_cont_nomi_name_4").val();
            //if (d5 == "") {
            //    alert("Please enter the nominee contact no or email-id");
            //    $("#txt_cont_nomi_name_4").focus();
            //    return false;
            //}

            var e1 = $("#txt_grat_nomi_name_5").val();
            if (e1 == "") {
                alert("Please enter the Nominee Name");
                $("#txt_grat_nomi_name_5").focus();
                return false;
            }

             // DOB Validation
            var e2 = $("#txt_dob_nomi_name_5").val();
            //if (e2 == "") {
            //    alert("Please select the Nominee Date of Birth");
            //    $("#txt_dob_nomi_name_5").focus();
            //    return false;
            //}


            var e3 = $("#txt_relat_nomi_name_5").val();
            if (e3 == "-1") {
                alert("Please select the nominee relation");
                $("#txt_relat_nomi_name_5").focus();
                return false;
            }

            var e4 = $("#txt_addr_nomi_name_5").val();
            if (e4 == "") {
                alert("Please enter the nominee address details");
                $("#txt_addr_nomi_name_5").focus();
                return false;
            }

            var e5 = $("#txt_cont_nomi_name_1").val();
            if (e5 == "") {
                alert("Please Update EmailID/ContactNumber");
                $("#txt_cont_nomi_name_1").focus();
                return false;
            }
            var e6 = $("#txt_cont_nomi_name_2").val();
            if (e6 == "") {
                alert("Please Update EmailID/ContactNumber");
                $("#txt_cont_nomi_name_2").focus();
                return false;
            }
            var e7 = $("#txt_cont_nomi_name_3").val();
            if (e7 == "") {
                alert("Please Update EmailID/ContactNumber");
                $("#txt_cont_nomi_name_3").focus();
                return false;
            }
            var e8 = $("#txt_cont_nomi_name_4").val();
            if (e8 == "") {
                alert("Please Update EmailID/ContactNumber");
                $("#txt_cont_nomi_name_4").focus();
                return false;
            }
            var e9 = $("#txt_cont_nomi_name_5").val();
            if (e9 == "") {
                alert("Please Update EmailID/ContactNumber");
                $("#txt_cont_nomi_name_5").focus();
                return false;
            }


            var e10 = $("#txt_dob_nomi_name_1").val();
            if (e10 == "") {
                alert("Please Select Date Of Birth");
                $("#txt_dob_nomi_name_1").focus();
                return false;
            }
            var e11 = $("#txt_dob_nomi_name_2").val();
            if (e11 == "") {
                alert("Please Select Date Of Birth");
                $("#txt_dob_nomi_name_2").focus();
                return false;
            }
            var e12 = $("#txt_dob_nomi_name_3").val();
            if (e12 == "") {
                alert("Please Select Date Of Birth");
                $("#txt_dob_nomi_name_3").focus();
                return false;
            }
            var e13 = $("#txt_dob_nomi_name_4").val();
            if (e13 == "") {
                alert("Please Select Date Of Birth");
                $("#txt_dob_nomi_name_4").focus();
                return false;
            }
            var e14 = $("#txt_dob_nomi_name_5").val();
            if (e14 == "") {
                alert("Please Select Date Of Birth");
                $("#txt_dob_nomi_name_5").focus();
                return false;
            }







            // Contact Number & Email Id 

            var e5 = $("#txt_cont_nomi_name_5").val();
            //if (e5 == "") {
            //    alert("Please enter the nominee contact no or email-id");
            //    $("#txt_cont_nomi_name_5").focus();
            //    return false;
            //}
            
            

            

            if (a1 != "" && a3 != "-1" && a4 != "" && b1 != "" && b3 != "-1" && b4 != "" && c1 != "" && c3 != "-1" && c4 != "" && d1 != "" && d3 != "-1" && d4 != "" && e1 != "" && e3 != "-1" && e4 != "") {

                //var empCode = $("#hfield_emp_code").val();
                var empCode =$("#<%=hfield_emp_code.ClientID%>").val();
               // alert(empCode);
                var inputValue1 = empCode + "*" + "1"+ "*" + a1 + "*" + a2 + "*" + a3 + "*" + a4 + "*" + a5 + "~";
                var inputValue2 = empCode + "*" + "2"+ "*" + b1 + "*" + b2 + "*" + b3 + "*" + b4 + "*" + b5 + "~";
                var inputValue3 = empCode + "*" + "3"+ "*" + c1 + "*" + c2 + "*" + c3 + "*" + c4 + "*" + c5 + "~";
                var inputValue4 = empCode + "*" + "4"+ "*" + d1 + "*" + d2 + "*" + d3 + "*" + d4 + "*" + d5 + "~";
                var inputValue5 = empCode + "*" + "5"+ "*" + e1 + "*" + e2 + "*" + e3 + "*" + e4 + "*" + e5 + "~";
              
                var inputValue = inputValue1 + inputValue2 + inputValue3 + inputValue4 + inputValue5;

                //alert(inputValue);
                var sess = $("[id*=txt_session]").val();
                $.ajax({
                    type: 'POST',
                    url: 'common_nomination_form.aspx/dataInsertion',
                    contentType: 'application/json; charset=utf-8',
                    data: "{ input: '" + inputValue + "'}",
                    dataType: 'json',
                    success: function (Result) {
                        var res = Result.d;
                      //  alert(res);
                      window.open("../Salary/common_nomination_form.aspx", "_self");

                       
                    }
                });
            }
            else {
                alert("Please fill all the details");
                return false;
            }
        }
    </script>
</asp:Content>
