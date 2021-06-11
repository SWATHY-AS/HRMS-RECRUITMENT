<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="qualification.aspx.cs" Inherits="Ma_Aspirant.Recruitment.qualification" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

        <script>
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

            $(window).load(function () {
                check_tab();
                qual();
                var empid = $("[id*=txt_session]").val();
            //    GetAllProperties();
                $("#txt_appID").val(empid);

                $.ajax({                ///university
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    url: "qualification.aspx/univ_dtl_rec",
                    data: {},
                    dataType: "json",
                    success: function (Result) {
                        Result = Result.d;
                        $.each(Result, function (key, value) {
                            $("#cmb_univrstytin").append($("<option></option>").val(value.uid).html(value.u_name));
                        });
                    },
                    error: function (Result) {

                    }
                });


                $.ajax({                ///Religion
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    url: "qualification.aspx/high_qual",
                    data: "{ input: '" + empid + "' }",
                    dataType: "json",
                    success: function (Result) {
                        Result = Result.d;
                        //alert(Result);
                        var s = Result.split('~');
                        $("#txt_highq").val(s[0]);
                        $("#txt_catq").val(s[1]);
                        $("#txt_Quali").val(s[2]);//Deep
                        
                    },
                    error: function (Result) {
                    }
                });
            });


            function check_tab() {
                
                var empid = $("[id*=txt_session]").val();
                $.ajax({                ///university
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    url: "qualification.aspx/get_form",
                    data: "{ input : '" + empid + "' }",
                    dataType: "json",
                    success: function (Result) {
                        Result = Result.d;

                        //  alert(Result);
                        if (Result == "222") {
                            alert("Please fill Personal details");
                            window.open("../Recruitment/Personal_Details.aspx", "_self");
                        }
                    },
                    error: function (Result) {

                    }
                });
            }


     function  qual()
     {
        // alert(33);

         var empid = $("[id*=txt_session]").val();
         $.ajax({                ///university
             type: "POST",
             contentType: "application/json; charset=utf-8",
             url: "qualification.aspx/get_qual_dtl",
             data: "{ input : '" + empid + "' }",
             dataType: "json",
             success: function (Result) {
                 Result = Result.d;

             //  alert(Result);
                 if (Result == "111")
                 {
                     //$("#btn_insert").hide();
                     $("#q_view").show();
                     $("#view1").hide();
                     empq_dtl_view(empid);
                 }
                 else {
                     $("#q_view").hide();
                     $("#view1").show();
                     $("#btn_insert").show();
                     qualicateg();
                 }
             },
             error: function (Result) {

             }
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
            function next() {
                window.location.href = "Doc_Scanning.aspx"
            }


           
            function qualicateg() {
                
                var empid = $("[id*=txt_session]").val();
                $.ajax({                ///qualification category
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    url: "qualification.aspx/qcatg_dtl",
                    data: "{empid:'"+empid+"'}",
                    dataType: "json",
                    success: function (Result) {
                        Result = Result.d;
                        $.each(Result, function (key, value) {
                            $("#qc").append($("<option></option>").val
                          (value.qc_id).html(value.qc_name));
                        });
                        $("#qc").change(function () {
                            var str = $(this).find('option:selected').text();
                            var sid = $(this).val();

                            var dddist = $("#cmb_qual");

                            dddist.empty(); // this line is for clear all 
                            dddist.append($("<option></option").val(0).html("--SELECT--"));
                            $.ajax({                ///qualification
                                type: "POST",
                                contentType: "application/json; charset=utf-8",
                                url: "qualification.aspx/qual_dtl_rec",
                                data: "{input:'" + sid + "'}",
                                dataType: "json",
                                success: function (Result) {
                                    Result = Result.d;

                                    $.each(Result, function (key, value) {
                                        $("#cmb_qual").append($("<option></option>").val

                                            (value.qualification_id).html(value.qualification));
                                    });
                                    chkshow();
                                    $('#yr_pass').datepicker({
                                        changeYear: true,
                                        showButtonPanel: true,
                                        dateFormat: 'yy',
                                        onClose: function (dateText, inst) {
                                            var year = $("#ui-datepicker-div .ui-datepicker-year :selected").val();
                                            $(this).datepicker('setDate', new Date(year, 1));
                                        }
                                    });
                                    $("#yr_pass").focus(function () {
                                        $(".ui-datepicker-month").hide();
                                    });


                                },
                                error: function (Result) {
                                }
                            });

                        });
                    },
                    error: function (Result) {
                    }
                });
            }
            //27may

            function empq_dtl_view(empid) {
                var empid = $("[id*=txt_session]").val();
                //  var emp = $("#ddl_q_emp").val();
                $("#tbl_qual_v tbody").empty();
                $("#tbl_q_v").show();
                // alert(emp);
                $.ajax({
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    url: "qualification.aspx/get_qual_dtl_view",
                    data: "{ input: '" + empid + "' }",
                    dataType: "json",
                    success: function (Result) {
                        // alert(Result.d);
                        // var res = Result.d.split("~");                  
                        //      category qualification university institution  YEAR_PASS  percentage grade  NO_OF_ATTEMPT
                        for (var i = 0; i < Result.d.length; i++) {
                            $("#tbl_qual_v tbody").append('<tr> <td>' + Result.d[i].category + '</td>' +
                                      '<td>' + Result.d[i].qualification + '</td>' +
                                      '<td>' + Result.d[i].university + '</td>' +
                                      '<td>' + Result.d[i].institution + '</td>' +
                                      '<td>' + Result.d[i].YEAR_PASS + '</td>' +
                                      '<td>' + Result.d[i].percentage + '</td>' +
                                      '<td>' + Result.d[i].grade + '</td>' +
                                      '<td>' + Result.d[i].NO_OF_ATTEMPT + '<td>' + Result.d[i].typ_reg + '</td>' + '<td>' + Result.d[i].high + '</td></tr>');
                        }
                    },
                    error: function (Result) {
                    }
                });
            }


    </script>
      <script type="text/javascript" src="../App_Themes/Theme/assets/js/personal_det.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="panel panel-default col-md-12">
        <div id="Tabs" role="tabpanel">
            <!-- Nav tabs -->
              <ul class="nav nav-pills" role="tablist">
                <li ><a href="#personaldet" aria-controls="personaldet" role="tab" data-toggle="pill" onclick="personaldet_tab()" id="tabs2">Personal</a></li>
                 <li class="active gen"  ><a href="#qualidet" aria-controls="qualidet" role="tab" data-toggle="pill" onclick="quali_tab()" id="tab6">Qualification</a></li>
                 <li ><a href="#family" aria-controls="family" role="tab" data-toggle="pill" onclick="family_tab()" id="tab7">Family</a></li>

                   <li  class="gen"><a href="#experience" aria-controls="exper" role="tab" data-toggle="pill" onclick="ref_tab()" id="tabs4">Reference</a></li>
                                                                           <li  class="gen"><a href="#common_nom" aria-controls="common_nom" role="tab" data-toggle="pill" onclick="com_nom()" id="tabs5">Common Nomination Form</a></li>

                                   <li  class="gen" ><a href="#docupload" aria-controls="empassign" role="tab" data-toggle="pill" onclick="doc_tab()" id="tabs3">Document Upload</a></li>

                   <li  class="gen"><a href="#photo" aria-controls="exp" role="tab" data-toggle="pill" onclick="photo_tabnew()" id="tabs6">Photo</a></li>

                  
                                              </ul>
            <!-- Tab panes -->
             <form id="Form1" class="form-horizontal row-border" action="#" runat="server">
                  <div class="tab-content">
                 <div id="q_view" hidden="hidden">
                     <div class="form-group">
                            <div class="col-md-12">
                                <div class="widget box">                                  
                                    <div class="widget-header clonedInput">
                                        <h4><span class="glyphicon glyphicon-zoom-in"></span> Qualification Details<span class="required"> *</span></h4>
                                    </div>
                                    <div id="Div1" class="clonedInput">
                                             <div class="widget-content">
                                          
                        <div class="ibox-content"  id="tbl_q_v" hidden="hidden">
                            <div class="ibox-table">
                                <div class="table-responsive">
                                    <table class="responsive-table table-striped table-bordered table-hover align-center " id="tbl_qual_v" style="width:1000px;">
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
                                       <th>Type Registration</th>
                                        <th>Highest Qualification</th>
                                        <th hidden="hidden">quaid</th>
                                        

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
                 <div id="view1" hidden="hidden">
               
                 
                 
                                  
                        <div class="row ">
                            <div class="ma-header">
                                <div class="col-md-12">
                                    <h3 style="color: #091221"><i class="glyphicon glyphicon-user"></i> Qualification DETAILS</h3>
                                </div>
                            </div>
                        </div>
                      <div class="form-group">
                         <label class="col-md-2 cntr-text">Application Id</label>
                              <div class="col-md-4">

                                <input type="text" class="form-control" id="txt_appID" name="name" maxlength="8" required="required" onblur="leftTrim(this)" autocomplete="off" disabled="disabled" />
                                 </div>  
              </div>
                            <div class="form-group">
                                 <asp:TextBox ID="txt_session" runat="server" hidden="hidden" ></asp:TextBox>
                             
                             <asp:TextBox ID="txtbr" runat="server" hidden="hidden" ></asp:TextBox>
                                <label class="col-md-2 cntr-text">Select Qualification Type</label>
                                <div class="col-md-3">
                                    <select class="form-control" id="qc" name="host1" >
                                           <option value="0" selected="selected">--SELECT--</option>
                                    </select>
                                </div>
                                
                                <label class="col-md-2 cntr-text">Select Qualification</label>
                                <div class="col-md-3">
                                    <select class="form-control" id="cmb_qual" name="host" >
                                            <option value="0" selected="selected">--SELECT--</option>
                                    </select>

                                </div>
                                      <div class="col-md-1" id="hgq">
                     <input type="checkbox" class="check" value="1" name="chk_cst1" id="chkq" onclick="chkqual()"   />
                                            selected as highest qualification</div>
                               
                                </div>
                            <div class="form-group">
                                <label class="col-md-2 cntr-text">Enter Institution</label>
                                <div class="col-md-3">
                                    <input type="text" name="regular" class="form-control" id="txt_institute1" onblur="leftTrim(this)" maxlength="50" autocomplete="off"  onkeypress="return onlyAlphabets(event,this);" onkeyup="this.value=this.value.toUpperCase()"/>
                                </div>
                            
                                <label class="col-md-2 cntr-text">Enter University</label>
                                <div class="col-md-3">
                                    <select class="form-control" id="cmb_univrstytin" name="h1">
                                           <option value="0" selected="selected">--SELECT--</option>
                                    </select>
<%--                                    <input type="text" name="regular" class="form-control" id="txt_unvsty"  required onkeypress=" return IsAlphaNumeric(event);" onkeyup="this.value=this.value.toUpperCase()"/>--%>
                                </div>
                                </div>
                        <div class="form-group" hidden="hidden">
               
                
                    <input type="text" name="regular" class="form-control" readonly="true" id="txt_highq"/>
                       <input type="text" name="regular" class="form-control" readonly="true" id="txt_catq"/>
                              <input type="text" name="regular" class="form-control" readonly="true" id="txt_Quali"/>
                   
                </div>
              
                            <div class="form-group">
                                <label class="col-md-2 cntr-text">No.of Attempt</label>
                                <div class="col-md-3">
                                    <input type="text" name="regular" class="form-control" onblur="leftTrim(this)"  maxlength="2" autocomplete="off" onkeypress="return isNumberKey(event,this)" id="txt_atmpt1" onkeyup="this.value=this.value.replace(/[^0-9]/g,'');"/>
                                </div>
                          
                             <label class="col-md-2 cntr-text">Type Of Education</label>
                                <div class="col-md-3">
                                    <select class="form-control" id="ddl_edutype1">
                                        <option value="0" selected="selected">--SELECT--</option>
                                        <option value="1">Regular</option>
                                        <option value="2">Distance</option>
                                        <option value="3">Private</option>                                      
                                    </select>
                                </div>
                                </div>
                            <div class="form-group">
                                    
                               
                                <label class="col-md-2 cntr-text">Percentage of Mark(eg:99.99)</label>
                                <div class="col-md-3">
                                    <input type="text" name="regular" class="form-control"  id="txt_percent1" onkeyup="leftTrim(this)" autocomplete="off" maxlength="5"   onchange="percent()" />
                                </div>
                           
                        
                                <label class="col-md-2 cntr-text">Grade</label>
                                <div class="col-md-3">
                                    <input type="text" name="regular" class="form-control" id="txt_grade1" autocomplete="off"   maxlength="2" onblur="leftTrim(this)" onchange="grade()"  onkeyup="this.value=this.value.toUpperCase()"/>
                                </div>
                            </div>
                     <div class="form-group">
                             <label class="col-md-2 cntr-text">Passed MM/YY</label>
                                <div class="col-md-3">
                                    <input type="text" name="regular" class="form-control" id="yr_pass" autocomplete="off"  required="required" ondrop="false" onkeydown="return false" onpaste="false"/>
                                </div>
                     </div>
                             <%--<div class="form-group">
        <label class="col-md-5 cntr-text">Add More   <span class="glyphicon glyphicon-plus" onclick="showdivcloned()">  </span> </label>
                                    </div>--%>
                            <div class="widget box align-center">
                                <div class="form-group">
                                   
                                    <input id="btn_add" type="button" value="ADD" onclick="qualificationadd()" class="btn-prop" />
                       
                                    </div>
                               
                      
                        <br />
                  

                                                         </div>


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
                       
           
                  <div class="form-group">
                                <label class="col-md-6 cntr-text">Please Add All Qualification Details Matriculation,PlusTwo,Degree,P.G</label>
                               
                                </div>
                           
                  <div class="widget box align-center">
                                <div class="form-group">
                                   
                                   <input id="btn_insert" type="button" value="ADD Qualification" class="btn-prop" onclick="qualtableinsert()" /> 
                       
                                    </div>
                               
                      
                        <br />
                  

                                                         </div>
                 </div> </div>
                 </form>
  
        </div></div>
</asp:Content>
