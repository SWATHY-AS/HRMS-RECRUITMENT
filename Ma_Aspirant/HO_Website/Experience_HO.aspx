<%@ Page Title="" Language="C#" MasterPageFile="~/Main_HO.Master" AutoEventWireup="true" CodeBehind="Experience_HO.aspx.cs" Inherits="Ma_Aspirant.HO_Website.Experience_HO" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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


         $(window).load(function () {
             var user = $("[id*=hdUserId]").val();
             //alert(user);
             $('#ddl_emp').val(user);
             check_tab();
             experience_add();
             exp_dtl_edit();
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
         function rdo_fresherorexp()//swathy

         {
             if ($('input[id=rdo_exp]').is(':checked')) {
                 //alert("checked");
                 debugger;
                 $("#btn_clearexp").show();
                 $("#Btn_addEXP").show();
                 //$("#tbl_experience tbody").empty();
                 //$("#tbl_exp").empty();               
                 $('#exp1').show();
                 $('#txt_org').val('');
                 $('#txt_desig').val('');
                 $('#txt_address').val('');
                 $('#ddl_country').val(0);
                 $("#txt_grde").val('');
                 $('#ddl_orgtyp').val(0);
                 $('#txt_fromexp').val('');
                 $('#txt_toexp').val('');
                 $('#txt_remarks').val('');
                 $('#lbl_orgtyp').hide();
                 $('#orgtyphide').hide();
                 $('#txt_orgtyp').val('');
                 experience_add1();
             }
             if ($('input[id=rdo_fresher]').is(':checked')) {
                 $("#btn_clearexp").hide();
                 $("#Btn_addEXP").hide();
                 $('#exp1').hide();
                 $("#btn_expquit").hide();
                 $("#tbl_exp1").hide();
                 $("#tbl_experience1").hide();
             }



             $('#txt_fromexp').datepicker({
                 minDate: '-60Y',
                 dateFormat: 'dd/M/yy',
                 maxDate: new Date(), yearRange: '-100:-0',

                 onSelect: function (dateText, inst) {
                     var today = new Date();
                     today = Date.parse(today.getMonth() + 1 + '/' + today.getDate() + '/' + today.getFullYear());
                     var expto = $('#txt_toexp').val();
                     var eto = Date.parse(expto);
                     var selDate = Date.parse(dateText);
                     if ((selDate > eto)) {
                         $('#txt_fromexp').val('');
                         $(inst).datepicker('show');
                     }
                 }
             });
             $('#txt_toexp').datepicker({
                 minDate: '-60Y',
                 maxDate: new Date(),
                 dateFormat: 'dd/M/yy', yearRange: '-100:-0',

                 onSelect: function (dateText, inst) {
                     var expfrom = $('#txt_fromexp').val();
                     var efrom = Date.parse(expfrom);
                     var selDate = Date.parse(dateText);
                     if ((selDate < efrom)) {
                         $('#txt_toexp').val('');
                         $(inst).datepicker('show');
                     }
                 }
             });
         }

         function experience_add() {
             var empid = $("[id*=txt_session]").val();
             alert("h");
             $.ajax({
                 type: "POST",
                 contentType: "application/json; charset=utf-8",
                 url: "Experience_HO.aspx/prev_exp_dtl",
                 data: "{ input: '" + empid + "' }",
                 dataType: "json",
                 success: function (Result) {
                     Result = Result.d;
                     $.each(Result, function (key, value) {
                         $("#ddl_emp").append($("<option></option>").val
                       (value.emp_code).html(value.emp_name));
                         //exp date in enrolll
                         $('#txt_fromexp').datepicker({
                             minDate: '-60Y',
                             dateFormat: 'dd/M/yy',
                             maxDate: new Date(), yearRange: '-100:-0',

                             onSelect: function (dateText, inst) {
                                 var today = new Date();
                                 today = Date.parse(today.getMonth() + 1 + '/' + today.getDate() + '/' + today.getFullYear());
                                 var expto = $('#txt_toexp').val();
                                 var eto = Date.parse(expto);
                                 var selDate = Date.parse(dateText);
                                 if ((selDate > eto)) {
                                     $('#txt_fromexp').val('');
                                     $(inst).datepicker('show');
                                 }
                             }
                         });
                         $('#txt_toexp').datepicker({
                             minDate: '-60Y',
                             maxDate: new Date(),
                             dateFormat: 'dd/M/yy', yearRange: '-100:-0',

                             onSelect: function (dateText, inst) {
                                 var expfrom = $('#txt_fromexp').val();
                                 var efrom = Date.parse(expfrom);
                                 var selDate = Date.parse(dateText);
                                 if ((selDate < efrom)) {
                                     $('#txt_toexp').val('');
                                     $(inst).datepicker('show');
                                 }
                             }
                         });
                     });
                     //new change
                     $("#ddl_emp").change(function () {
                         var dpid = $(this).val();
                         if (!isNaN(dpid)) {
                             $("#txt_exprmk").val('');
                             $("#txt_expid").val('');
                             var r = 0;
                             $.ajax({
                                 type: "POST",
                                 contentType: "application/json; charset=utf-8",
                                 url: "Experience_HO.aspx/get_exp_dtl",
                                 data: "{ input: '" + dpid + "' }",
                                 dataType: "json",
                                 success: function (Result) {
                                     var res = Result.d;

                                     if (res >= 1) {


                                         $("#btn_expupd").show();
                                         $("#btn_addEXP").hide();
                                         $("#btn_expupdate").show();
                                         $("#btn_submit_exp").hide();
                                         //  $("#frsh_exp").hide();
                                         //$("#tbl_exp1").hide();
                                         $("#tbl_experience1").hide();
                                         $("#txt_exp").hide();
                                         $("#txt_exprmk").val('');
                                         getexp();
                                         exp_dtl_edit();
                                     }
                                     else {
                                         $("#rmkid").hide();
                                         $("#txt_exp").hide();
                                         $("#btn_expquit").hide();
                                         //    $("#frsh_exp").show();
                                         $("#btn_expupd").hide();
                                         $("#btn_addEXP").show();
                                         $("#btn_expupdate").hide();
                                         $("#btn_submit_exp").show();
                                         $("#tbl_exp1").hide();
                                         $("#tbl_experience1").hide();
                                         $("#exp1").hide();
                                         $("#rdo_fresher").prop("checked", true);
                                         $("#rdo_exp").prop("checked", false);
                                         $('#txt_org').val('');
                                         $('#txt_desig').val('');
                                         $('#txt_address').val('');
                                         $('#ddl_country').val(0);
                                         $("#txt_grde").val('');
                                         $('#ddl_orgtyp').val(0);
                                         $('#txt_fromexp').val('');
                                         $('#txt_toexp').val('');
                                         $('#txt_remarks').val('');
                                         $('#lbl_orgtyp').hide();
                                         $('#orgtyphide').hide();
                                         $('#txt_orgtyp').val('');
                                         $("#txt_exprmk").val('');
                                     }
                                 },
                                 error: function (Result) {
                                 }
                             });
                         }
                     });

                     //end new change
                 }
             });
         }
             function experience_add1() {
                 //alert("experience_add");
                 debugger;
                 $.ajax({

                     type: "POST",
                     contentType: "application/json; charset=utf-8",
                     url: "Experience_HO.aspx/emp_exp_country",
                     data: {},
                     dataType: "json",
                     success: function (Result) {
                         Result = Result.d;
                         $.each(Result, function (key, value) {
                             $("#ddl_country").append($("<option></option>").val
                           (value.cn_id).html(value.cn_name));
                         });
                     }

                 });
             }
         

         function clear_Experience() {

             $('#txt_org').val('');
             $('#txt_desig').val('');
             $('#txt_address').val('');
             $('#ddl_country').val(0);
             $("#txt_grde").val('');
             $('#ddl_orgtyp').val(0);
             $('#txt_fromexp').val('');
             $('#txt_toexp').val('');
             $('#txt_remarks').val('');
             $('#lbl_orgtyp').hide();
             $('#orgtyphide').hide();
             $('#txt_orgtyp').val('');
             $("#ddl_emp").prop("disabled", false);
             $('#exp1').hide();
             $('#rdo_fresher').prop('checked', true);
             $('#rdo_exp').prop('checked', false);

         }

         function add_Experience() {
             var e1 = $("#ddl_emp").val();
             var Exp_type = $("#ddl_orgtyp").val();
             var e_typ = $("#txt_orgtyp").val();
             if (Exp_type == 7) {
                 if (e_typ == '') {
                     alert("please enter remarks");
                 }
             }
             if (e1 == 0)
             { alert("please select employee"); }
             else
             {
                 $("#ddl_emp").prop("disabled", true);
                 var cn = $("#ddl_country").find("option:selected").text();
                 var Exp_type = $("#ddl_orgtyp").val();
                 if (Exp_type == 7)
                 { var org = $("#txt_orgtyp").val(); }
                 else
                 {
                     var org = $("#ddl_orgtyp").find("option:selected").text();
                 }
                 var Exp_org = $("#txt_org").val();
                 var Exp_desig = $("#txt_desig").val();
                 var exp_gr = $("#txt_grde").val();
                 var Exp_address = $("#txt_address").val();
                 var Exp_country = $("#ddl_country").val();
                 // var Exp_subtyp = $("#ddl_subtype").val();
                 var Exp_from = $("#txt_fromexp").val();
                 var Exp_to = $("#txt_toexp").val();
                 var Exp_remarks = $("#txt_remarks").val();
                 if ((Exp_type == 7 && e_typ == '') || Exp_org == '' || Exp_desig == '' || exp_gr == '' || Exp_address == '' || Exp_country == 0 || Exp_type == 0 || Exp_from == '' || Exp_to == '' || Exp_remarks == '') {
                     //alert("Please Enter all feilds");
                     if (Exp_org == '')
                     { alert("Please Enter Organization "); }
                     else if (Exp_desig == '')
                     { alert("Please Enter Designation"); }
                     else if (Exp_address == '')
                     { alert("Please Enter Address of Organization"); }
                     else if (exp_gr == '')
                     { alert("Please Enter Grade"); }
                     else if (Exp_country == 0)
                     { alert("Please Select Country"); }
                     else if (Exp_type == 7 && e_typ == '')
                     { alert("Please Enter Organiztion type"); }
                     else if (Exp_type == 0)
                     { alert("Please select Organization Type"); }
                     else if (Exp_from == '')
                     { alert("Please Enter Experience From"); }
                     else if (Exp_to == '')
                     { alert("Please Enter Experience To"); }
                     else if (Exp_remarks == '')
                     { alert("Please Enter Remarks"); }

                 }
                 else {
                     $("#tbl_exp").show();
                     var markup = "<tr><td>" + Exp_org + "</td><td>" + Exp_desig + "</td><td>" + exp_gr + "</td><td>" + Exp_address + "</td><td>" + org + "</td><td>" + cn + "</td><td>" + Exp_from + "</td><td>" + Exp_to + "</td><td>" + Exp_remarks + "</td><td hidden='hidden'>" + Exp_country + "</td><td> <input type='checkbox' name='record'> </td></tr>";
                     $("#tbl_experience tbody").append(markup);
                     $("#btn_delete").show();
                     $('#txt_org').val('');
                     $('#txt_desig').val('');
                     $('#txt_address').val('');
                     $('#ddl_country').val(0);
                     $("#txt_grde").val('');
                     $('#ddl_orgtyp').val(0);
                     $('#txt_fromexp').val('');
                     $('#txt_toexp').val('');
                     $('#txt_remarks').val('');
                     $('#lbl_orgtyp').hide();
                     $('#orgtyphide').hide();
                     $('#txt_orgtyp').val('');
                 }
             }
         }

         function deleterow()//delete exp row from table
         {
             $("#tbl_experience tbody").find('input[name="record"]').each(function () {
                 if ($(this).is(":checked")) {
                     $(this).parents("tr").remove();
                 }
                 if ($(this).not(':checked')) {
                     $("#btn_delete").show();
                 }
             });
             var table = document.getElementById('tbl_experience');
             var n = table.rows.length; //alert(n);
             if (n > 1) {
                 $("#btn_delete").show();
                 $("#tbl_exp").show();
             }
             else {
                 $("#btn_delete").hide();
                 $("#tbl_exp").hide();
                 ("#tbl_experience").empty();
                 $("#ddl_emp").prop("disabled", false);
             }
         }

         function experience_add() {
             var empid = $("[id*=txt_session]").val();
             $.ajax({
                 type: "POST",
                 contentType: "application/json; charset=utf-8",
                 url: "Experience_HO.aspx/prev_exp_dtl",
                 data: "{ input: '" + empid + "' }",
                 dataType: "json",
                 success: function (Result) {
                     Result = Result.d;
                     $.each(Result, function (key, value) {
                         $("#ddl_emp").append($("<option></option>").val
                       (value.emp_code).html(value.emp_name));
                         //exp date in enrolll
                         $('#txt_fromexp').datepicker({
                             minDate: '-60Y',
                             dateFormat: 'dd/M/yy',
                             maxDate: new Date(), yearRange: '-100:-0',

                             onSelect: function (dateText, inst) {
                                 var today = new Date();
                                 today = Date.parse(today.getMonth() + 1 + '/' + today.getDate() + '/' + today.getFullYear());
                                 var expto = $('#txt_toexp').val();
                                 var eto = Date.parse(expto);
                                 var selDate = Date.parse(dateText);
                                 if ((selDate > eto)) {
                                     $('#txt_fromexp').val('');
                                     $(inst).datepicker('show');
                                 }
                             }
                         });
                         $('#txt_toexp').datepicker({
                             minDate: '-60Y',
                             maxDate: new Date(),
                             dateFormat: 'dd/M/yy', yearRange: '-100:-0',

                             onSelect: function (dateText, inst) {
                                 var expfrom = $('#txt_fromexp').val();
                                 var efrom = Date.parse(expfrom);
                                 var selDate = Date.parse(dateText);
                                 if ((selDate < efrom)) {
                                     $('#txt_toexp').val('');
                                     $(inst).datepicker('show');
                                 }
                             }
                         });
                     });
                     //new change
                     $("#ddl_emp").change(function () {
                         var dpid = $(this).val();
                         if (!isNaN(dpid)) {
                             $("#txt_exprmk").val('');
                             $("#txt_expid").val('');
                             var r = 0;
                             $.ajax({
                                 type: "POST",
                                 contentType: "application/json; charset=utf-8",
                                 url: "Experience_HO.aspx/get_exp_dtl",
                                 data: "{ input: '" + dpid + "' }",
                                 dataType: "json",
                                 success: function (Result) {
                                     var res = Result.d;

                                     if (res >= 1) {


                                         $("#btn_expupd").show();
                                         $("#btn_addEXP").hide();
                                         $("#btn_expupdate").show();
                                         $("#btn_submit_exp").hide();
                                         //  $("#frsh_exp").hide();
                                         //$("#tbl_exp1").hide();
                                         $("#tbl_experience1").hide();
                                         $("#txt_exp").hide();
                                         $("#txt_exprmk").val('');
                                         getexp();
                                         exp_dtl_edit();
                                     }
                                     else {
                                         $("#rmkid").hide();
                                         $("#txt_exp").hide();
                                         $("#btn_expquit").hide();
                                         //    $("#frsh_exp").show();
                                         $("#btn_expupd").hide();
                                         $("#btn_addEXP").show();
                                         $("#btn_expupdate").hide();
                                         $("#btn_submit_exp").show();
                                         $("#tbl_exp1").hide();
                                         $("#tbl_experience1").hide();
                                         $("#exp1").hide();
                                         $("#rdo_fresher").prop("checked", true);
                                         $("#rdo_exp").prop("checked", false);
                                         $('#txt_org').val('');
                                         $('#txt_desig').val('');
                                         $('#txt_address').val('');
                                         $('#ddl_country').val(0);
                                         $("#txt_grde").val('');
                                         $('#ddl_orgtyp').val(0);
                                         $('#txt_fromexp').val('');
                                         $('#txt_toexp').val('');
                                         $('#txt_remarks').val('');
                                         $('#lbl_orgtyp').hide();
                                         $('#orgtyphide').hide();
                                         $('#txt_orgtyp').val('');
                                         $("#txt_exprmk").val('');
                                     }
                                 },
                                 error: function (Result) {
                                 }
                             });
                         }
                     });

                     //end new change
                 }
             });
         }

         function exptableinsert()//swathy  experience insert
         {
             $("#expid").hide();
             $("#tbl_exp1").hide();
             $("#exp_entry").show();
             //alert("HELLO");
             debugger;
             var c = $("[id*=txt_session]").val();
             var e1 = $("#ddl_emp").val();
             if ($('input[id=rdo_fresher]').is(':checked'))
             { var e2 = 2; }
             if ($('input[id=rdo_exp]').is(':checked'))
             { var e2 = 1; }
             var row2 = c + "µ" + e1 + "µ" + e2 + "µ";
             var row = "";
             var table = document.getElementById('tbl_experience');
             var n = table.rows.length;
             if (e1 == 0) {
                 alert("Please select employee");
             }
             else {
                 if (e2 == 2) {
                     $.ajax({
                         type: "POST",
                         contentType: "application/json; charset=utf-8",
                         url: "Experience_HO.aspx/expinsert_dtl",
                         data: "{ input: '" + row2 + "' }",
                         dataType: "json", beforeSend: function () {
                             return confirm("Are you sure you want to confirm?");
                             return row2;
                         },
                         success: function (Result) {
                             var res = Result.d
                             alert("Updated successfully");
                             $("#tbl_exp").hide();
                             $("#exp_entry").hide();
                             //$("#ddl_emp").val(0);
                                window.open("../HO_Website/qualification_HO.aspx", "_self");
                         },
                         error: function (Result) {
                             alert("Error");
                         }
                     });
                 }
                 if (e2 == 1) {
                     if (n == 1) {
                         alert("Please enter fields.......");
                     }
                     else {
                         for (var r = 1; r < n; r++) {
                             for (var c = 0, m = table.rows[r].cells.length; c < m - 1; c++) {
                                 var r1 = table.rows[r].cells[c].innerHTML;
                                 var row = row + r1 + "¬";
                             }
                             var row2 = row2 + row + "¿";
                             row = "";
                             //321136µ339288µhfgh*ghgfh*2*undefined*undefined*undefined*fghfgh*+
                         }
                         $.ajax({
                             type: "POST",
                             contentType: "application/json; charset=utf-8",
                             url: "Experience_HO.aspx/expinsert_dtl",
                             data: "{ input: '" + row2 + "' }",
                             dataType: "json", beforeSend: function () {
                                 return confirm("Are you sure you want to confirm?");
                             },
                             success: function (Result) {
                                 var res = Result.d
                                 alert('Updated successfully');
                                 window.open("../HO_Website/Experience_HO.aspx", "_self");
                                 // $("#ddl_emp").val(0);
                                 //     $("#ddl_emp").prop("disabled", false);
                                 
                             },
                             error: function (Result) {
                             }
                         });
                     }
                 }
             }
         }

         function exp_dtl_edit() {
             
             var emp = $("#ddl_emp").val();
             //alert(emp);
             
              $("#tbl_experience1 tbody").empty();
             
              $("#expid").show();
              $("#tbl_exp1").show();
              $("#exp_entry").show();
             
             debugger;
             $.ajax({
                 
                 type: "POST",
                 contentType: "application/json; charset=utf-8",
                 url: "Experience_HO.aspx/get_exp_dtl2",
                 data: "{ input: '" + emp + "' }",
                 dataType: "json",
                 success: function (Result) {
                    // alert('ok');
                     var j = 0;
                     for (var i = 0; i < Result.d.length; i++) {
                        
                         $("#tbl_experience1 tbody").append('<tr> <td>' + Result.d[i].orgname + '</td>' +
                                               '<td>' + Result.d[i].orgdesi + '</td>' +
                                               '<td>' + Result.d[i].orggrade + '</td>' +
                                               '<td>' + Result.d[i].orgAddr + '</td>' +

                                               '<td>' + Result.d[i].orgAddr + '</td>' + '<td>' + Result.d[i].country + '</td>' +
                                               '<td>' + Result.d[i].period_frm + '</td>' +
                                               '<td>' + Result.d[i].period_to + '</td>' +
                                                 '<td>' + Result.d[i].Remarks + '</td></tr>'
                                  );

                     }
                 },
                 error: function (Result) {
                 }
             });
         }
         function expquit() {
             //alert("exp")
             $('#txt_org').val('');
             $('#txt_desig').val('');
             $('#txt_address').val('');
             $('#ddl_country').val(0);
             $("#txt_grde").val('');
             $('#ddl_orgtyp').val(0);
             $('#txt_fromexp').val('');
             $('#txt_toexp').val('');
             $('#txt_remarks').val('');
             $('#lbl_orgtyp').hide();
             $('#orgtyphide').hide();
             $('#txt_orgtyp').val('');

             $(':input', '#tbl_experience1').not('#button').removeAttr('disabled').removeAttr('false');


         }

         function check_tab() {

             var empid = $("[id*=txt_session]").val();
            // alert(empid);
             $.ajax({                ///university
                 type: "POST",
                 contentType: "application/json; charset=utf-8",
                 url: "../HO_Website/Experience_HO.aspx/get_form",
                 data: "{ input : '" + empid + "' }",
                 dataType: "json",
                 success: function (Result) {
                     Result = Result.d;

                     //  alert(Result);
                     if (Result == "222") {
                         alert("Please fill Personal details");
                         window.open("../HO_Website/Personal_Details_HO.aspx", "_self");
                     }
                 },
                 error: function (Result) {

                 }
             });
         }

         function personaldet_tab() {
             window.open("../HO_Website/Personal_Details_HO.aspx", "_self");
         }

         function Experience_tab() {
             window.open("../HO_Website/Experience_HO.aspx", "_self")
         }

         function quali_tab() {
             window.open("../HO_Website/qualification_HO.aspx", "_self");
         }
         function doc_tab() {
             window.open("../HO_Website/Doc_Scanning_HO.aspx", "_self");
         }
         function family_tab() {
             window.open("../HO_Website/family_status_HO.aspx", "_self");
         }
         function ref_tab() {
             window.open("../HO_Website/Reference_per_HO.aspx", "_self");
         }
         function Experience_tab() {
             window.open("../HO_Website/Experience_HO.aspx", "_self")
         }
       </script>

  <%--<script type="text/javascript" src="../App_Themes/Theme/assets/js/enrol_new.js"></script>--%>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 <div class="panel panel-default col-md-12">
        <div id="Tabs" role="tabpanel">
            <!-- Nav tabs -->
            <ul class="nav nav-pills" role="tablist">
                <li class="gen"><a href="#personaldet" aria-controls="personaldet" role="tab" data-toggle="pill" onclick="personaldet_tab()" id="tabs2">Personal</a></li>
                 <li class="active gen"  ><a href="#Experience_HO" aria-controls="Experience" role="tab" data-toggle="pill" onclick="Experience_tab()" id="A1">Experience</a></li>
                <li class="gen"><a href="#qualidet" aria-controls="qualidet" role="tab" data-toggle="pill" onclick="quali_tab()" id="tab6">Qualification</a></li>
                <li class="gen"  ><a href="#family" aria-controls="family" role="tab" data-toggle="pill" onclick="family_tab()" id="tab7">Family</a></li>
                           <li class="gen"><a href="#experience" aria-controls="experience" role="tab" data-toggle="pill" onclick="ref_tab()" id="tabs4">Reference</a></li>

                     <li  class="gen"><a href="#docupload" aria-controls="empassign" role="tab" data-toggle="pill" onclick="doc_tab()" id="tabs3">Document Upload</a></li>
<%--  <li  class="gen"><a href="#photo" aria-controls="exp" role="tab" data-toggle="pill" onclick="photo_tabnew()" id="tabs6">Photo</a></li>--%>

                 </ul>
            <!-- Tab panes -->
            <form id="Form1" class="form-horizontal row-border" action="#" runat="server">
                <div class="tab-content">
  
                   

                     <div class="ma-header">
                            <h3><i class="icon-reorder"></i>Add Previous Experience 
                            </h3>
                         <%--<h4><span class="glyphicon glyphicon-zoom-in"></span> Add Previous Experience <span class="required"> *</span></h4>--%>
                        </div>
                        <br />
                        <div class="form-group align-center">
                          
                            <asp:TextBox ID="txt_session" runat="server" hidden="hidden" ></asp:TextBox>
                             
                             <asp:TextBox ID="txtbr" runat="server" hidden="hidden" ></asp:TextBox>

                            <label class="col-md-2 cntr-text">Application ID</label>
                            <div class="col-md-5">
                                <input class="form-control"  type="text" id="ddl_emp" name="Dt" disabled="disabled"/>
                              <%--   <option value="0" selected="selected">-- fgfgfgfgSELECT--</option>--%>
                               
                            </div>
                        </div>

                     <div class="form-group">
                            <div class="col-md-3"></div>
                            <div class="col-md-4" id="txt_exp" hidden="hidden">
                                  
                                      <input type="text" name="regular" id="txt_t" placeholder="Fresher" class="form-control" disabled/>

                            </div>
                        </div>


                 
                               <div class="ibox-content" id="tbl_exp1" hidden="hidden">
                                      <div class="form-group">
                               
                                    <%--<div id="expid" hidden="hidden">
                                     <input type="text" name="regular" class="form-control" id="txt_expid" disabled/></div>--%>
                                     <%--  <input type="text" name="regular" class="form-control" id="txtq" hidden="hidden"/>--%>
                                    </div>
                                <div class="ibox-table">
                                    <div class="table-responsive">
                                        <table   class="responsive-table table-striped table-bordered table-hover" id="tbl_experience1" style="width: 1000px; ">
                                            <thead style="color: white; grid-row-align: center;  background-color: #686b6b" >
                                                <tr style="height: 30px; font-size: x-small">
                                                    <th>Organization</th>
                                                    <th>Designation</th>
                                                    <th>Grade</th>
                                                    <th>Address</th>
                                                     <th>Organization Type</th>
                                                    <th>country</th>
                                                    <th>Period From </th>
                                                    <th>Period To  </th>                                                                                                   
                                                    <th>Description</th>                                                 
                                                    <th hidden="hidden">cnid</th>
                                                     <th hidden="hidden">expid</th>
                                                    
                                                  
                                                </tr>
                                            </thead>
                                            <tbody>

                                            </tbody>
                                        </table>
                                    </div>


                                </div>
                            </div>
                     
                    
                    <div id="exp_entry" hidden="hidden">        
                        <div class="form-group" id="frsh_exp">
                            <div class="col-md-3"></div>
                            <div class="col-md-4">
                                <label class="radio-inline cntr-text">
                                    <input name="r1" value="fresher" type="radio" id="rdo_fresher" checked="checked" onclick="rdo_fresherorexp()" />
                                    <b>Fresher</b>
                                </label>
                                <label class="radio-inline  cntr-text">
                                    <input name="r1" value="experienced" type="radio" id="rdo_exp" onclick="rdo_fresherorexp()" />
                                    <b>Experienced</b>
                                </label>
                            </div>
                        </div>
                        <div id="exp1" hidden="hidden">
                        <div class="form-group align-center">
                            <label class="col-md-2 cntr-text">Name of Organization </label>
                            <div class="col-md-3">
                                <input type="text" id="txt_org" name="regular" class="form-control" autocomplete="off" onblur="leftTrim(this)" maxlength="40" onkeypress=" return IsAlphaNumeric(event);" onkeyup="this.value=this.value.toUpperCase()"/>
                            </div>
                            <label class="col-md-2 cntr-text">Employee Designation </label>
                            <div class="col-md-3">
                                <input type="text" id="txt_desig" name="regular" class="form-control" autocomplete="off" onblur="leftTrim(this)" maxlength="25" onkeypress=" return IsAlphaNumeric(event);" onkeyup="this.value=this.value.toUpperCase()"/>
                            </div>
                        </div>
                        <div class="form-group align-center">

                            <label class="col-md-2 cntr-text">Organization Address </label>
                            <div class="col-md-3">
                                <input type="text" id="txt_address" name="regular" class="form-control" autocomplete="off" maxlength="40" onblur="leftTrim(this)" onkeypress=" return IsAlphaNumeric(event);" onkeyup="this.value=this.value.toUpperCase()"/>
                            </div>
                            <label class="col-md-2 cntr-text">Country </label>
                            <div class="col-md-3">
                                <select class="form-control" id="ddl_country" name="ct">
                                    <option value="0" selected="selected">--SELECT--</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group align-center">
                            <label class="col-md-2 cntr-text">Grade </label>
                            <div class="col-md-3">
                                <input type="text" id="txt_grde" name="regular" class="form-control" maxlength="20" autocomplete="off" onblur="leftTrim(this)" onkeypress=" return IsAlphaNumeric(event);" onkeyup="this.value=this.value.toUpperCase()"/>
                            </div>
                            <label class="col-md-2 cntr-text">Organization Type </label>
                            <div class="col-md-3">
                                <select class="form-control" id="ddl_orgtyp" onchange="orgtype()">
                                     <option value="0" selected="selected">--SELECT--</option>
                                    <option value="1">Public sector</option>
                                    <option value="2">Private Sector</option>
                                    <option value="3">Non Governmental Organisations</option>
                                     <option value="4">Government Service - State</option>
                                    <option value="5">Government Service -Central</option>
                                    <option value="6">Self employed</option>
                                          <option value="7">Others, pls specify</option>
                                    
    
                                </select>
                            </div>
                            </div>
                            <div class="form-group align-center">
                            <div id="orgtyphide" hidden="hidden">
                             <label  id="lbl_orgtyp" class="col-md-2 cntr-text" hidden="hidden">Pls Specify Organization Type</label>
                             <div class="col-md-3">
                          <input id="txt_orgtyp" type="text" name="regular" class="form-control" autocomplete="off" maxlength="25" hidden="hidden" onblur="leftTrim(this)" onkeypress=" return IsAlphaNumeric(event);" onkeyup="this.value=this.value.toUpperCase()"/>

                             </div></div>
                            <%--label class="col-md-2 cntr-text">Sub Type </label>
                            <div class="col-md-3">
                                <input type="text" name="regular" id="ddl_subtype" class="form-control" />
                            </div>--%>
                        </div>
                        <div class="form-group  align-center ">
                            <label class="col-md-2 cntr-text">Period From Date</label>
                            <div class="col-md-3">
                                <input type="text" name="regular" id="txt_fromexp"  class="form-control" autocomplete="off"  required="required" ondrop="false" onkeydown="return false" onpaste="false"/>
                            </div>
                            
                            <label class="col-md-2 cntr-text">Period To Date </label>
                            <div class="col-md-3">
                                <input type="text" name="regular" id="txt_toexp" class="form-control" autocomplete="off"  required="required" ondrop="false" onkeydown="return false" onpaste="false"/>
                            </div>
                        </div>
                  
                        <div class="form-group align-center">

                            <label class="col-md-2 cntr-text">Description (About Experience)</label>
                            <div class="col-md-6">
                                <input id="txt_remarks" type="text" name="regular" class="form-control" autocomplete="off" onblur="leftTrim(this)" maxlength="50" onkeypress=" return IsAlphaNumeric(event);" onkeyup="this.value=this.value.toUpperCase()"/>
                            </div>
                        </div>
                        <br />
                        <br />
                        <div class="widget box align-center">
                            <div class="form-group">
                                  <%--<input id="btn_expupd" type="button" value="updaterow" class="btn-prop" onclick="exp_updt()" />--%>
                         
                                <input id="Btn_addEXP" type="button" value="Add"  hidden="hidden" class="btn btn-info" onclick="add_Experience()" style="border-radius:20px;width:130px"/>
                                <input id="btn_clearexp" type="button" value="Clear"  hidden="hidden" class="btn btn-info" onclick="clear_Experience()" style="border-radius:20px;width:130px" />
                                <input id="btn_delete" type="button" value="Delete rows" hidden="hidden" class="btn btn-info" onclick="deleterow()" style="border-radius:20px;width:130px"/>
                            </div>
                            <br />
                            <br />
                      
                            
                            <div class="ibox-content" id="tbl_exp" hidden="hidden">
                                <div class="ibox-table">
                                    <div class="table-responsive">
                                        <table   class="responsive-table table-striped table-bordered table-hover" id="tbl_experience" style="width: 1000px; ">
                                            <thead style="color: white; grid-row-align: center;  background-color: #686b6b" >
                                                <tr style="height: 30px; font-size: x-small">
                                                    <th>Organization</th>
                                                    <th>Designation</th>
                                                    <th>Grade</th>
                                                    <th>Address</th>
                                                     <th>Organization Type</th>
                                                    <th>country</th>
                                                    <th>Period From </th>
                                                    <th>Period To  </th>
                                                                                                   
                                                    <th>Description</th>
                                                   <th> Select Check box for Delete </th>
                                                    <th hidden="hidden">cnid</th>
                                                         <th hidden="hidden">high</th>
                                                  
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
                            <div class="widget box align-center">
                                <div class="form-group">
                                               <%--<input id="btn_expupdate" type="button" value="UPDATE" class="btn-prop" onclick="expupdate()"/>--%>
                            <input id="btn_submit_exp" type="button" value="Submit" class="btn btn-info"  onclick="exptableinsert()" style="border-radius:25px;width:180px"/>
                        
                        
                    </div>
                                </div>
                  
</div>     
           </div>
                <input id="hdUserId" type="hidden" runat="server"/>
        </form>
        </div>
    </div>
</asp:Content>
