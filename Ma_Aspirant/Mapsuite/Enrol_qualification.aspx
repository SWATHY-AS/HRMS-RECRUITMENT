<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Enrol_qualification.aspx.cs" Inherits="Ma_Aspirant.Enrollment.Enrol_qualification" %>
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

           $(window).load(function () {
               
               qualification_add();
           
               $("#btn_quit").hide();
           });

           function isNumberKey(evt, element) {

               var charCode = (evt.which) ? evt.which : event.keyCode
               if (charCode > 31 && (charCode < 48 || charCode > 57) && !(charCode == 8))
                   return false;
           }
           //function isgrd(evt, element) {

           //    var charCode = (evt.which) ? evt.which : event.keyCode
           //    if ((charCode > 0 && charCode < 5 )|| (charCode == 49 || charCode == 43))
           //        return true;
           //    else
           //        return false;
           //}


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


           function qualification_add() {
               var empid = $("[id*=txt_session]").val();
               // $("#ddl_sel_candidate").empty();
               $("#btn_upd").hide();
               $.ajax({
                   type: "POST",
                   contentType: "application/json; charset=utf-8",
                   url: "Enrol_qualification.aspx/empqual_dtl_view",
                   // data:{},
                   data: "{ input: '" + empid + "' }",
                   dataType: "json",
                   success: function (Result) {
                       Result = Result.d;

                       $.each(Result, function (key, value) {
                           $("#ddl_sel_candidate").append($("<option></option>").val
                         (value.qemp_code).html(value.qemp_name));
                           $('#datepicker1').datepicker({
                               maxDate: new Date(), minDate: '-60Y',
                               //    changeMonth: true,
                               changeYear: true, yearRange: '-100:-0',

                               // showButtonPanel: true,
                               //showMonthsShort: true,
                               dateFormat: 'M/yy',
                               onClose: function (dateText, inst) {
                                   var month = $("#ui-datepicker-div .ui-datepicker-month :selected").val();
                                   var year = $("#ui-datepicker-div .ui-datepicker-year :selected").val();
                                   $(this).datepicker('setDate', new Date(year, month, 1));
                               }
                           });
                       });

                       $("#ddl_sel_candidate").change(function () {
                           var dpid = $(this).val();
                           if (!isNaN(dpid)) {
                               $("#txt_count").val('');
                               $('#txt_institute').val('');
                               $('#txt_atmpt').val('');
                               $('#datepicker1').val('');
                               $('#txt_percent').val('');
                               $('#txt_grade').val('');
                               $("#ddl_univsty").val(0);
                               $("#ddl_edutype").val(0);
                               var r = 0;
                               $.ajax({
                                   type: "POST",
                                   contentType: "application/json; charset=utf-8",
                                   url: "Enrol_qualification.aspx/get_qual_dtl",
                                   data: "{ input: '" + dpid + "' }",
                                   dataType: "json",
                                   success: function (Result) {
                                       var res = Result.d;
                                       if (res >= 1) {

                                           $("#btn_quit").show();
                                           $("#btn_upd").show();
                                           $("#btn_add").hide();
                                           $("#btn_update").show();
                                           $("#btn_save").hide();
                                           $("#tbl_q1").show();
                                           $("#tbl_qual1").show();
                                           $("#hgq").hide();
                                           empq_dtl_edit();
                                       }
                                       else {
                                           $("#btn_quit").hide();
                                           $("#hgq").show();
                                           $("#btn_upd").hide();
                                           $("#btn_add").show();
                                           $("#btn_update").hide();
                                           $("#btn_save").show();
                                           $("#tbl_q1").hide();
                                           $("#tbl_qual1").hide();
                                       }
                                   },
                                   error: function (Result) {
                                   }
                               });                             
                           }
                       });
                   }
               });
           }

           function empq_dtl_edit() {
               var emp = $("#ddl_sel_candidate").val();
               $("#tbl_qual1 tbody").empty();
               $("#tbl_q1").show();
               $.ajax({
                   type: "POST",
                   contentType: "application/json; charset=utf-8",
                   url: "Enrol_qualification.aspx/get_qual_dtl2",
                   data: "{ input: '" + emp + "' }",
                   dataType: "json",
                   success: function (Result) {
                       var j = 0;
                       for (var i = 0; i < Result.d.length; i++) {

                           $("#txt_count").val(Result.d[0].rmk2);
                           //var hh = val(Result.d[i].hid);
                           //if(hh==1)
                           //{var hn='yes';}
                           //else { var hn = 'no'; }
                           //alert(hn);
                           var a = Result.d[i].typ_edu;

                           if (a == 1)
                           { var aa = "Regular"; } else if (a == 2)
                           { var aa = "Distance" } else if (a == 3)
                           { var aa = "Private" }
                           $("#tbl_qual1 tbody").append('<tr> <td>' + Result.d[i].category2 + '</td>' +
                                     '<td>' + Result.d[i].qualification2 + '</td>' +
                                     '<td>' + Result.d[i].university2 + '</td>' +
                                     '<td>' + Result.d[i].institution2 + '</td>' +
                                     '<td>' + Result.d[i].YEAR_PASS2 + '</td>' +
                                     '<td>' + Result.d[i].percentage2 + '</td>' +
                                     '<td>' + Result.d[i].grade2 + '</td>' +
                                     '<td>' + Result.d[i].NO_OF_ATTEMPT2 + '</td>' + '<td>' + aa + '</td>' +
                                     '<td hidden="hidden">' + Result.d[i].typ_edu + '</td>' +
                                //    '<td hidden="hidden">' + Result.d[i].q2 + '</td>' +
                                    '<td hidden="hidden">' + Result.d[i].cid + '</td>' +
                                    '<td hidden="hidden">' + Result.d[i].quid + '</td>' +

                                    '<td hidden="hidden">' + Result.d[i].univid + '</td>' +
                                    '<td hidden="hidden">' + Result.d[i].hid + '</td>' +
                                    '<td>' + Result.d[i].high + '</td>' +
                                    '<td><input type="button" id=' + Result.d[i].quid + ' onclick="edit_qual(this)" value="Edit"></td>' +
                                    '<td><input type="button" id=' + Result.d[i].quid + ' onclick="dlt(this)" value="Del"></td></tr>'
               //0Qualification Type,1Qualification,2Universit,3Institution,4passed year,5Percentage of Mark,6Grade,7Passed First Attempt,
               //8Type of Registration 9tp
                //10catid,11quid,12univid,13hid,14highest or not,15Edit,16Delete
                             );
                       }
                   },
                   error: function (Result) {
                   }
               });
           }


       </script>
     <script type="text/javascript" src="../App_Themes/Theme/assets/js/enrol_new.js"></script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 
    <div class="panel panel-default col-md-12">
        <div id="Tabs" role="tabpanel">
            <!-- Nav tabs -->
            <ul class="nav nav-tabs" role="tablist">
                 <li><a href="#personal" aria-controls="personal" role="tab" data-toggle="tab" onclick="personal_tab()">Personal</a></li>
                <li class="active"><a href="#qualification" aria-controls="qualification" role="tab" data-toggle="tab" onclick="qual_tab()">Qualification</a></li>

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
                                <h3><i class="icon-reorder"></i>Add Qualification 
                                </h3>
                            </div></div>
                            <br />
                            <div class="form-group">
                               
                                <label class="col-md-2 cntr-text">Select Candidate</label>
                                <div class="col-md-5">

                                    <select class="form-control" id="ddl_sel_candidate" name="host" onchange="enablequali()">
                                       <%-- <option value="0" selected="selected">--SELECT--</option>--%>
                                    </select>
                                    

                                </div>
                            </div>
                            

                                   <div class="widget box align-center">
                                             
                        <div class="ibox-content"  id="tbl_q1" hidden="hidden">
                            <div class="form-group">
                                <label class="col-md-2 cntr-text">Remark</label>
                                <div class="col-md-8">

                              <input type="text" name="regular" class="form-control" id="txt_count" disabled/>
                                     <%--  <input type="text" name="regular" class="form-control" id="txtq" hidden="hidden"/>--%>
                                    </div>
                                </div>
                            <div class="ibox-table">
                                <div class="table-responsive">
                                    <table class="responsive-table table-striped table-bordered table-hover align-center " id="tbl_qual1" style="width:1000px;">
                                <thead style="color: white; grid-row-align:center;background-color:#686b6b">
                                    <tr style="height:30px;font-size:x-small;" >
                                                <th data-class="expand">Qualification Type</th>
                                        <th>Qualification</th>
                                                <th>University</th>
                                                <th>Institution</th>                                               
                                               <th>passed year</th>
                                                <th>Percentage of Mark</th>
                                                <th>Grade</th>
                                                <th>Passed First Attempt</th>  
                                          <th>Type of Registration</th>   <th hidden="hidden">tp</th>                                                                 
                                      <%--  <th hidden="hidden">quaid</th>--%>
                                         <th hidden="hidden">catid</th>
                                        <th hidden="hidden">quid</th>
                                        <th hidden="hidden">univid</th>
                                          <th hidden="hidden">hid</th>
                                        <th>highest or not</th>
                                         <th>Edit</th>
                                        <th>Delete</th>
                                        

                                            </tr>
                                        </thead>
                                        <tbody>
                                            
                                        </tbody>
                                    </table>
                                </div>
                                  <input id="btn_quit" type="button" value="Quit from Edit" class="btn-prop" onclick="qualquit()" hidden/>
                            </div>
                        </div>
                                             
                                 </div>
                    <div id="qqq" hidden="hidden">          
                           <input type="text" name="regular" class="form-control"  id="tid" />
</div>
                         
                            <div class="form-group">
                                 <asp:TextBox ID="txt_session" runat="server" hidden="hidden" ></asp:TextBox>
                             
                             <asp:TextBox ID="txtbr" runat="server" hidden="hidden" ></asp:TextBox>
                                <label class="col-md-2 cntr-text">Select Qualification Type</label>
                                <div class="col-md-3">
                                    <select class="form-control" id="qc" name="host1" disabled>
                                           <option value="0" selected="selected">--SELECT--</option>
                                    </select>
                                </div>
                                
                                <label class="col-md-2 cntr-text">Select Qualification</label>
                                <div class="col-md-3">
                                    <select class="form-control" id="qual" name="host" disabled>
                                           <%-- <option value="0" selected="selected">--SELECT--</option>--%>
                                    </select>

                                </div>
                                      <div class="col-md-1" id="hgq">
                     <input type="checkbox" class="check" value="1" name="chk_cst1" id="chkq" onclick="chkqual()"   />
                                            selected as highest qualification</div>
                               
                                </div>
                            <div class="form-group">
                                <label class="col-md-2 cntr-text">Enter Institution</label>
                                <div class="col-md-3">
                                    <input type="text" name="regular" class="form-control" id="txt_institute" onblur="leftTrim(this)" maxlength="50" autocomplete="off"  onkeypress="return onlyAlphabets(event,this);" onkeyup="this.value=this.value.toUpperCase()"/>
                                </div>
                            
                                <label class="col-md-2 cntr-text">Enter University</label>
                                <div class="col-md-3">
                                    <select class="form-control" id="ddl_univsty" name="h1">
                                           <option value="0" selected="selected">--SELECT--</option>
                                    </select>
<%--                                    <input type="text" name="regular" class="form-control" id="txt_unvsty"  required onkeypress=" return IsAlphaNumeric(event);" onkeyup="this.value=this.value.toUpperCase()"/>--%>
                                </div>
                                </div>

                            <div class="form-group">
                                <label class="col-md-2 cntr-text">No.of Attempt</label>
                                <div class="col-md-3">
                                    <input type="text" name="regular" class="form-control" onblur="leftTrim(this)"  maxlength="2" autocomplete="off" onkeypress="return isNumberKey(event,this)" id="txt_atmpt" onkeyup="this.value=this.value.replace(/[^0-9]/g,'');"/>
                                </div>
                          
                                <label class="col-md-2 cntr-text">Passed MM/YY</label>
                                <div class="col-md-3">
                                    <input type="text" name="regular" class="form-control" id="datepicker1" autocomplete="off"  required="required" ondrop="false" onkeydown="return false" onpaste="false"/>
                                </div>
                                </div>
                            <div class="form-group">
                                    
                                <label class="col-md-2 cntr-text">Type Of Education</label>
                                <div class="col-md-3">
                                    <select class="form-control" id="ddl_edutype">
                                        <option value="0" selected="selected">--SELECT--</option>
                                        <option value="1">Regular</option>
                                        <option value="2">Distance</option>
                                        <option value="3">Private</option>                                      
                                    </select>
                                </div>
                                <label class="col-md-2 cntr-text">Percentage of Mark(eg:99.99)</label>
                                <div class="col-md-1">
                                    <input type="text" name="regular" class="form-control" data-mask="99.99" id="txt_percent" onkeyup="leftTrim(this)" autocomplete="off" maxlength="5"  onkeypress="return numpercent(this);"/>
                                </div>
                        
                                <label class="col-md-1 cntr-text">Grade</label>
                                <div class="col-md-1">
                                    <input type="text" name="regular" class="form-control" id="txt_grade" autocomplete="off"   maxlength="2" onblur="leftTrim(this)" onchange="grade()"  onkeyup="this.value=this.value.toUpperCase()"/>
                                </div>
                            </div>
                             
                            <div class="widget box align-center">
                                <div class="form-group">
                                    <input id="btn_add" type="button" value="ADD" onclick="qualificationadd()" class="btn-prop" />
                                <input id="btn_upd" type="button" value="ADD Qualification" class="btn-prop" onclick="qualif_updt()" />
                       
                                    
                                </div>
                           
                      
                        <br />
                  

                        <div class="ibox-content"  id="tbl_q" hidden="hidden">
                            <div class="ibox-table">
                                <div class="table-responsive">
                                    <table class="responsive-table table-striped table-bordered table-hover align-center " id="tbl_qual" style="width:1000px;">
                                <thead style="color: white; grid-row-align:center;background-color:#686b6b">
                                    <tr style="height:30px;font-size:x-small;" >
                                                <th data-class="expand">Qualification Type</th>
                                        <th>Qualification</th>
                                                <th>University</th>
                                                <th>Institution</th>                                               
                                               <th>passed year</th>
                                                <th>Percentage of Mark</th>
                                                <th>Grade</th>
                                                <th>Passed First Attempt</th>
                                       <th>Type of Registration</th>
                                        <th hidden="hidden">typ_reg</th> 
                                        <th hidden="hidden">quaid</th> 
                                         <th hidden="hidden">univid</th>
                                        <th hidden="hidden">highest</th>
                                        <th>highest or not</th>
                                        <th> Delete </th>

                                            </tr>
                                        </thead>
                                        <tbody>
                                            
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                                 </div>




                 
                         <%--<div class=" form-group align-center">
                                <div class="col-md-2"></div>
                        <label class="col-md-6 cntr-text" style="color: red">Upload file size must be 150kb and File extension should be .jpeg, .jpg or .png</label>
                        </div>--%>
                        <div class="form-group align-center">
                               <input id="btn_update" type="button" value="UPDATE" class="btn-prop" onclick="qualupdate()"/>
                            <%--  <input id="btn_upload" type="button" value="UPLOAD DOCUMENT" class="btn-prop" />--%>
                             <input id="btn_save" type="button" value="SAVE" class="btn-prop" onclick="qualtableinsert()"/>
                              <input id="btn_exit2" type="button" value="EXIT" class="btn-prop" onclick="empexit()" />
                            
                            <br />
                            <br />
                        </div>

                    <div class="form-group"> 
                         <label class="col-md-8 cntr-text"><b>*Add All qualification, Minimum qualification Degree and 50% marks required for all post(not for HKA post).</b></label>
                         </div>
               
                </div>
           </form>
        </div>
    </div>
</asp:Content>