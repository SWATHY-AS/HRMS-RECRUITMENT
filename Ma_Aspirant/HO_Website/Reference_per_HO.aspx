<%@ Page Title="" Language="C#" MasterPageFile="~/Main_HO.Master" AutoEventWireup="true" CodeBehind="Reference_per_HO.aspx.cs" Inherits="Ma_Aspirant.Recruitment.Reference_per_HO" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
   
    <script>
        $(window).load(function () {
            check_tab();
            GetAllProperties11();
            refcheck();
        });


        function check_tab() {

            var empid = $("[id*=txt_session]").val();
            $.ajax({                ///university
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "../HO_Website/Reference_per_HO.aspx/get_form",
                data: "{ input : '" + empid + "' }",
                dataType: "json",
                success: function (Result) {
                    Result = Result.d;

                    //  alert(Result);
                    if (Result == "222") {
                        alert("Please fill Family details");
                        window.open("../HO_Website/family_status_HO.aspx", "_self");
                    }
                },
                error: function (Result) {

                }
            });
        }

        function refcheck() {
            // alert(33);

            var empid = $("[id*=txt_session]").val();
            $.ajax({                ///university
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "../HO_Website/Reference_per_HO.aspx/get_ref_dtl",
                data: "{ input : '" + empid + "' }",
                dataType: "json",
                success: function (Result) {
                    Result = Result.d;

                    //  alert(Result);
                    if (Result == "111") {
                        $("#btn_saves").hide();
                        $("#r_view").show();
                        $("#view1").hide();
                        empref_dtl(empid);

                    }
                    else {
                        $("#r_view").hide();
                        $("#view1").show();
                        $("#btn_saves").show();
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
            window.location.href = "../HO_Website/Agreement_Info_HO.aspx"
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

     

        function post_select_ref1() {
            var ppin = $("#txt_pin1").val();
            // alert(ppin);
            ddpost = $("#dd_post1");
            // dd_postofc
            $("#txt_st2").val('');
            $("#txt_dis2").val('');
            if (ppin != '') {
                ddpost.empty(); // this line is for clear all 
                ddpost.append($("<option></option>").val("0").html("--SELECT--"));
                $.ajax({
                    type: "POST",
                    url: '../HO_Website/Reference_per_HO.aspx/postofc_dtl',
                    data: "{did:'" + ppin + "'}",
                    async: false,
                    cache: false,
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (Result) {
                        Result = Result.d;
                        $.each(Result, function (key, value) {
                            ddpost.append($("<option></option>").val
                                (value.post_id1).html(value.post_name1));
                        });
                        //textbox  change

                    },
                    error: function (Result) {
                    }
                });
            }


        }
        function addr_ref1() {

            var dpid = $("#dd_post1").val();
            if (dpid != -1) {


                $.ajax({
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    url: "../HO_Website/Reference_per_HO.aspx/get_address",
                    data: "{input:'" + dpid + "'}",
                    async: false,
                    cache: false,
                    dataType: "json",
                    success: function (Result) {
                        var res = Result.d;

                        var res = Result.d.split("µ");
                        $("#txt_st1").val(res[0]);
                        $("#txt_dis1").val(res[1]);

                    },
                    error: function (Result) {
                    }
                });
            }

        }
        function post_select_ref2() {
            var ppin = $("#txt_pin2").val();
            // alert(ppin);
            ddpost = $("#dd_post2");
            // dd_postofc
            $("#txt_st2").val('');
            $("#txt_dis2").val('');
            if (ppin != '') {
                ddpost.empty(); // this line is for clear all 
                ddpost.append($("<option></option>").val("0").html("--SELECT--"));
                $.ajax({
                    type: "POST",
                    url: '../HO_Website/Reference_per_HO.aspx/postofc_dtl',
                    data: "{did:'" + ppin + "'}",
                    async: false,
                    cache: false,
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (Result) {
                        Result = Result.d;
                        $.each(Result, function (key, value) {
                            ddpost.append($("<option></option>").val
                                (value.post_id1).html(value.post_name1));
                        });
                        //textbox  change

                    },
                    error: function (Result) {
                    }
                });
            }


        }
        function addr_ref2() {

            var dpid = $("#dd_post2").val();
            if (dpid != -1) {


                $.ajax({
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    url: "../HO_Website/Reference_per_HO.aspx/get_address",
                    data: "{input:'" + dpid + "'}",
                    async: false,
                    cache: false,
                    dataType: "json",
                    success: function (Result) {
                        var res = Result.d;

                        var res = Result.d.split("µ");
                        $("#txt_st2").val(res[0]);
                        $("#txt_dis2").val(res[1]);

                    },
                    error: function (Result) {
                    }
                });
            }

        }

        
        
        
        //27change
        function empref_dtl(empid) {
            var empid = $("[id*=txt_session]").val();

            //  var emp = $("#ddl_q_emp").val();
            $("#tbl_ref tbody").empty();
            $("#div_ref").show();
            // alert(emp);
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "../HO_Website/Reference_per_HO.aspx/get_ref_dtl_view",
                data: "{ input: '" + empid + "' }",
                dataType: "json",
                success: function (Result) {
                    // alert(Result.d);
                    // var res = Result.d.split("~");                  
                    //      category qualification university institution  YEAR_PASS  percentage grade  NO_OF_ATTEMPT
                    for (var i = 0; i < Result.d.length; i++) {

                        //ep.name,ep.position,ep.mob_no,ep.mail,pm.pin_code,pm.post_office,dm.district_name,s.state_name

                        $("#tbl_ref tbody").append('<tr> <td>' + Result.d[i].name + '</td>' +
                                  '<td>' + Result.d[i].post + '</td>' +
                                  '<td>' + Result.d[i].mob + '</td>' +
                                  '<td>' + Result.d[i].mail + '</td>' +
                                  '<td>' + Result.d[i].addr + '</td></tr>');
                    }
                },
                error: function (Result) {
                }
            });
        }


        
        </script>
      <script  type="text/javascript" src="../App_Themes/Theme/assets/js/personal_HO.js"></script>
    <script  type="text/javascript" src="../App_Themes/Theme/assets/js/reference_HO.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="panel panel-default col-md-12">
        <div id="Tabs" role="tabpanel">
            <!-- Nav tabs -->
               <ul class="nav nav-pills" role="tablist">
                <li class="gen"><a href="#personaldet" aria-controls="personaldet" role="tab" data-toggle="pill" onclick="personaldet_tab()" id="tabs2">Personal</a></li>
                   <li class="gen"  ><a href="#Experience_HO" aria-controls="Experience" role="tab" data-toggle="pill" onclick="Experience_tab()" id="A1">Experience</a></li>
                <li class="gen"><a href="#qualidet" aria-controls="qualidet" role="tab" data-toggle="pill" onclick="quali_tab()" id="tabs6">Qualification</a></li>
                <li class="gen"><a href="#family" aria-controls="family" role="tab" data-toggle="pill" onclick="family_tab()" id="tabs7">Family</a></li>
                <li class="active gen"><a href="#experience" aria-controls="experience" role="tab" data-toggle="pill" onclick="ref_tab()" id="tabs4">Reference</a></li>
                <li class="gen"><a href="#docupload" aria-controls="empassign" role="tab" data-toggle="pill" onclick="doc_tab()" id="tabs3">Document Upload</a></li>

<%--  <li  class="gen"><a href="#photo" aria-controls="exp" role="tab" data-toggle="pill" onclick="photo_tabnew()" id="tab6">Photo</a></li>--%>
 
                                  </ul>
            <!-- Tab panes -->
             <form id="Form1" class="form-horizontal row-border" action="#" runat="server">
                <div class="tab-content">
                 <div id="r_view" hidden="hidden">
                       


   <div class="form-group">
                            <div class="col-md-12">
                                <div class="widget box">                                  
                                    <div class="widget-header clonedInput">
                                        <h4><span class="glyphicon glyphicon-zoom-in"></span> Refference   Details<span class="required"> *</span></h4>
                                    </div>
                                    <div id="Div8" class="clonedInput">
                                             <div class="widget-content">
                        
                          <div class="ibox-content"  id="div_ref" hidden="hidden">
                            <div class="ibox-table">
                                <div class="table-responsive">
                                    <table class="responsive-table table-striped table-bordered table-hover align-center " id="tbl_ref" style="width:1000px;">
                                <thead style="color: white; grid-row-align:center;background-color:#686b6b">
                                    <tr style="height:30px;font-size:x-small;" >
                                        <th data-class="expand">Name</th>
                                                <th >Post</th>
                                        <th>Address</th>
                                                <th>Contact No.</th>
                                                <th>Email Id</th>                                                                                         
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
                                    <h3 style="color: #091221"> PERSONAL REFERENCE DETAILS</h3>
                                </div>
                            </div>
                        </div>
                         
                        
              <label class="col-md-10 cntr-text">Details of <span style="font-weight:bold;color:red">Two</span> important persons for personal reference (other than relatives / family members with ph. Number):</label>
                      
                        <div class="clonedInput">
                            <div class="col-md-6 ">
                                <div class="widget box" >
                                                                 
                                    <div class="widget-content">
                                      <br />
                                             <div class="form-group">
                                            <label class="col-md-4 cntr-text">Name</label>
                                            <div class="col-md-8">
                                                <input type="text" name="regular" class="form-control" id="txt_name1" maxlength="25" required="required" onblur="leftTrim(this)" autocomplete="off"  onkeypress="return onlyAlphabets(event,this);" onkeyup="this.value=this.value.toUpperCase()" />
                                            </div></div> 
                                         <br />
                                         <asp:TextBox ID="txt_session" runat="server" hidden="hidden" ></asp:TextBox>
                                            <div class="form-group">
                                            <label class="col-md-4 cntr-text">Position</label>
                                            <div class="col-md-8">
                                                <input type="text" name="regular" class="form-control" id="txt_position1" maxlength="25" required="required" onblur="leftTrim(this)" autocomplete="off"  onkeypress="return onlyAlphabets(event,this);" onkeyup="this.value=this.value.toUpperCase()" />
                                            </div></div> 
                                         <br />
                                                
                                            <div class="form-group">
                                             <label class="col-md-4 cntr-text">Land Phone</label>
                                            <div class="col-md-8">
                                            <input type="text" name="regular" class="form-control" id="txt_landno1" maxlength="10" required="required" onblur="leftTrim(this)" autocomplete="off"  onkeypress="return isNumberKey(event,this)" />

                                            </div></div> 
                                         <br />

                                            <div class="form-group">
                                            <label class="col-md-4 cntr-text">Mobile Phone</label>
                                            <div class="col-md-8">
                                                <input type="text" name="regular" class="form-control" id="txt_mobno1" maxlength="10" required="required" onblur="leftTrim(this)" autocomplete="off"  onkeypress="return isNumberKey(event,this)" />
                                            </div></div>
                                         <br />

                                             <div class="form-group">
                                            <label class="col-md-4 cntr-text">Mailing Address</label>
                                            <div class="col-md-8">
                                                <input type="text" name="regular" class="form-control" id="txt_mail1" maxlength="30" required="required" onblur="chkemail(this.id);" onkeypress="leftTrim(this)" autocomplete="off"  onkeyup="this.value=this.value.toUpperCase()" />
                                            </div> </div>
                                         <br />
                                        
                                             <div class="form-group">
                                            <label class="col-md-4 cntr-text">PinCode</label>
                                            <div class="col-md-8">     
                                           <input type="text" name="regular" class="form-control" id="txt_pin1" onblur="leftTrim(this)" autocomplete="off" maxlength="25"  onchange="post_select_ref1()"/>

                                            </div>  </div> <br />
                                         <div class="form-group">
                                            <label class="col-md-4 cntr-text">Post Office</label>
                                            <div class="col-md-8">
                                                <select class="form-control" id="dd_post1" name="st"  onchange="addr_ref1()">
                                                        <option value="0" selected="selected">--SELECT--</option>
                                                </select>
                                            </div> </div> <br />
                                            <div class="form-group">
                                            <label class="col-md-4 cntr-text">State</label>
                                            <div class="col-md-8">
                <input type="text" name="regular" class="form-control" id="txt_st1" onblur="leftTrim(this)" autocomplete="off" maxlength="25"  onkeyup="this.value=this.value.toUpperCase()" disabled/>

<%--                                            <select class="form-control" id="dd_st1" name="st">
                                                        <option value="0" selected="selected">--SELECT--</option>
                                                </select>    --%>                                        </div></div> <br />


                                            <div class="form-group">
                                            <label class="col-md-4 cntr-text">District</label>
                                            <div class="col-md-8">
               <input type="text" name="regular" class="form-control" id="txt_dis1" onblur="leftTrim(this)" autocomplete="off" maxlength="25"  onkeyup="this.value=this.value.toUpperCase()" disabled/>

                                               <%-- <select class="form-control" id="dd_dist1" name="Dt"> 
                                                     <option value="0" selected="selected">--SELECT--</option>
                                                </select>            --%>                         

                                            </div></div> <br />

                                           


                                       
                                       
                                    </div>
                                </div>
                                   
                            </div>
                            <div class="col-md-6 ">
                                <div class="widget box">
                            
                                   <div class="widget-content">
                                       
                                            <br />
                                             <div class="form-group">
                                            <label class="col-md-4 cntr-text">Name</label>
                                            <div class="col-md-8">
                                                <input type="text" name="regular" class="form-control" id="txt_name2" maxlength="25" required="required" onblur="leftTrim(this)" autocomplete="off"  onkeypress="return onlyAlphabets(event,this);" onkeyup="this.value=this.value.toUpperCase()" />
                                            </div></div> 
                                       <br />
                                      
                                            <div class="form-group">
                                            <label class="col-md-4 cntr-text">Position</label>
                                            <div class="col-md-8">
                                                <input type="text" name="regular" class="form-control" id="txt_position2" maxlength="25" required="required" onblur="leftTrim(this)" autocomplete="off"  onkeypress="return onlyAlphabets(event,this);" onkeyup="this.value=this.value.toUpperCase()" />
                                            </div></div>  <br />
                                                
                                            <div class="form-group">
                                             <label class="col-md-4 cntr-text">Land Phone</label>
                                            <div class="col-md-8">
                                            <input type="text" name="regular" class="form-control" id="txt_landno2"  maxlength="10" required="required" onblur="leftTrim(this)" autocomplete="off"  onkeypress="return isNumberKey(event,this)" />
                                            </div></div>  <br />

                                            <div class="form-group">
                                            <label class="col-md-4 cntr-text">Mobile Phone</label>
                                            <div class="col-md-8">
                                                <input type="text" name="regular" class="form-control" id="txt_mobno2" maxlength="10" required="required" onblur="leftTrim(this)" autocomplete="off"  onkeypress="return isNumberKey(event,this)" />
                                            </div></div>  <br />

                                             <div class="form-group">
                                            <label class="col-md-4 cntr-text">Mailing Address</label>
                                            <div class="col-md-8">
                                                <input type="text" name="regular" class="form-control" id="txt_mail2" maxlength="30" required="required" onblur="chkemail1(this.id);" onkeypress="leftTrim(this)" autocomplete="off"  onkeyup="this.value=this.value.toUpperCase()" />
                                            </div> </div> <br />
                                       
                                        <div class="form-group">
                                            <label class="col-md-4 cntr-text">PinCode</label>
                                            <div class="col-md-8">     
                                           <input type="text" name="regular" class="form-control" id="txt_pin2" onblur="leftTrim(this)" autocomplete="off" maxlength="25"  onchange="post_select_ref2()"/>

                                            </div>  </div> <br />
                                       
                                            <div class="form-group">
                                            <label class="col-md-4 cntr-text">Post Office</label>
                                            <div class="col-md-8">
                                                <select class="form-control" id="dd_post2" name="st"   onchange="addr_ref2()">
                                                        <option value="0" selected="selected">--SELECT--</option>
                                                </select>
                                            </div> </div> <br />

                                            
                                            <div class="form-group">
                                            <label class="col-md-4 cntr-text">State</label>
                                            <div class="col-md-8">
                       <input type="text" name="regular" class="form-control" id="txt_st2" onblur="leftTrim(this)" autocomplete="off" maxlength="25"  onkeyup="this.value=this.value.toUpperCase()" disabled/>

<%--                                            <select class="form-control" id="dd_st2" name="st">
                                                        <option value="0" selected="selected">--SELECT--</option>
                                                </select>    --%>                         

                                            </div></div> <br />


                                            <div class="form-group">
                                            <label class="col-md-4 cntr-text">District</label>
                                            <div class="col-md-8">
                              <input type="text" name="regular" class="form-control" id="txt_dis2" onblur="leftTrim(this)" autocomplete="off" maxlength="25"  onkeyup="this.value=this.value.toUpperCase()" disabled/>

                                           <%--     <select class="form-control" id="dd_dist2" name="Dt"> 
                                                     <option value="0" selected="selected">--SELECT--</option>
                                                </select>  --%>                                  

                                            </div></div> <br />


                                      
                                       
                                    </div>
                                </div>
                            </div>
                  
                                            <label class="col-md-12 cntr-text">Declaration</label>
                                            

                            
                                            <label class="col-md-12 cntr-text">I Hereby declare that the information furnished above is true and correct to the best of my knowledge and no part thereof  has been intentionally distorted.  </label>

                            <div class="form-group ">
                                <div class="col-md-1">
                     <input type="checkbox" class="check" value="1" name="chk_cst1" id="ch1" onclick="chk()" />
                                            I Agree</div>
                                             </div>
                            <br />

                              <div class="form-group col-md-12 ">
                            <label class="col-md-1 cntr-text">Name</label>
                            <div class="col-md-3">
                                <input type="text" name="regular" class="form-control" id="txt_name3" autocomplete="off" required="required" ondrop="false" onkeydown="return false" disabled="disabled" />
                            </div>
                         <label class="col-md-2 cntr-text">Date</label>
                         <div class="col-md-2">
                                <input type="text" name="regular" class="form-control" id="txt_dt" autocomplete="off" required="required" ondrop="false" onkeydown="return false" disabled="disabled" />
                            </div>
                       <%-- <label class="col-md-2 cntr-text">Venue</label>
                         <div class="col-md-2">
                                <input type="text" name="regular" class="form-control" id="txt_venue"  maxlength="25" required="required" onblur="leftTrim(this)" autocomplete="off"  onkeypress="return onlyAlphabets(event,this);" onkeyup="this.value=this.value.toUpperCase()" />
                            </div>
                         </div>--%>

                       
                   
                      <br /> 
                        
                    
        <div class=" form-group align-center ">
                               
              <input id="btn_saves" type="button" value="Save" class="btn btn-info " onclick="save_ref()" style="border-radius:25px;width:180px" />
<%--                                <input id="btn_next" type="button" value="Next"  class="btn btn-info" onclick="next()" style="border-radius:25px;width:180px" />--%>

                        </div>
                        <br />
                            </div>
                    </div>
               
                           
                <div></div>
                </form>      
                   
                   

           </div> 
       
         
        </div>
    
</asp:Content>
