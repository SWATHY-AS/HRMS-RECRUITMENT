<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Agreement_Info.aspx.cs" Inherits="Ma_Aspirant.Recruitment.Agreement_Info" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <script  type="text/javascript" src="../App_Themes/Theme/assets/js/reference.js"></script>

    <script>
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
        function validate() {
            var filter = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
            if (!filter.test(txt_mail1)) {
                alert('Please provide a valid Email address');
                email.focus;
                $("#txt_email").val('');
            }
        }
        function exit() {
            window.location.href = "../Login.aspx"
        }
        function agree_load() {
   
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "Agreement_info.aspx/agree_detail",
        data: {},
        async: false,
        cache: false,
        dataType: "json",
        success: function (Result) {
            var res = Result.d.split("~");
           
            //alert(res[10]);


            $("#txt_agree_name").val(res[1]);
           
        },
        error: function (Result) {
        }
    });
}

        function save_agree() {    
   
    var agree_acres = $("#txt_acres").val();
    var agree_surveyno = $("#txt_surveyno").val();
    var agree_village = $("#txt_village").val();
    var agree_docno = $("#txt_docno").val();
    var agree_srono = $("#txt_srono").val();
    var agree_amount = $("#txt_amnt").val();
   var  add = 22;
    if ($('input[id=chk1]').is(':checked'))
    { add = 1; }
            
    var agree_acres1 = $("#txt_acre").val();
    var agree_surveyno1 = $("#txt_sur").val();
    var agree_village1 = $("#txt_vill").val();
    var agree_docno1 = $("#txt_doc").val();
    var agree_srono1 = $("#txt_sr").val();
    var agree_amount1 = $("#txt_amt").val();
    if (agree_acres == '' || agree_surveyno == '' || agree_village == '' || agree_docno == '' || agree_srono == '' || agree_amount == '' || (add==1 && agree_acres1 == '') || (add==1 && agree_surveyno1 == '') || (add==1 && agree_village1 == '') || (add==1 && agree_docno1 == '') || (add==1 && agree_srono1 == '') || (add==1 && agree_amount1 == '')) {
        if (agree_acres == '') { alert("Please Enter the acres"); }
        else if (agree_surveyno == '') { alert("Please Enter the survey number"); }
        else if (agree_village == '') { alert("Please Enter the village"); }
        else if (agree_docno == '') { alert("Please Enter the doc_number"); }
        else if (agree_srono == '') { alert("Please Enter the SRO number"); }
        else if (agree_amount == '') { alert("Please Enter the Amount to be paid"); }
        if (add == 1 &&  agree_acres1 == '') { alert("Please Enter the acres"); }
        else if (add == 1 &&  agree_surveyno1 == '') { alert("Please Enter the survey number"); }
        else if (add == 1 &&  agree_village1 == '') { alert("Please Enter the village"); }
        else if (add == 1 &&  agree_docno1 == '') { alert("Please Enter the doc_number"); }
        else if (add == 1 &&  agree_srono1 == '') { alert("Please Enter the SRO number"); }
        else if (add == 1 &&  agree_amount1 == '') { alert("Please Enter the Amount to be paid"); }
    }
    else {
        if (add == 1) {
            var data = agree_acres + "~" + agree_surveyno + "~" + agree_village + "~" + agree_docno + "~" + agree_srono + "~" + agree_amount + "~" + add + "~" + agree_acres1 + "~" + agree_surveyno1 + "~" + agree_village1 + "~" + agree_docno1 + "~" + agree_srono1 + "~" + agree_amount1;

        }
        else {
            var data = agree_acres + "~" + agree_surveyno + "~" + agree_village + "~" + agree_docno + "~" + agree_srono + "~" + agree_amount+ "~" +add;
        }
       
        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: "Agreement_info.aspx/insert_agree",
            data: "{input: '" + data + "' }",
            dataType: "json", beforeSend: function () {
                return confirm("Are you sure you want to confirm?");
            },
            success: function (Result) {
                Result = Result.d;
               
              //  var status = Result.split('~')[0].toString();
                //var code = Result.split('~')[1].toString();
               
                //alert(code);
                if (Result == "111") {
                    alert("Confirmed");
                }
                else {
                    alert("Error");
                }

                //  qualification_add();
                //window.open("../Recruitment/Doc_Scanning.aspx", "_self");
            },
            error: function (Result) {
            }
        });
        cleardata_agree();

    }
}
        function cleardata_agree() {
    $("#txt_acres").val('');
    $("#txt_surveyno").val('');
    $("#txt_docno").val('');
    $("#txt_srono").val('');
    $("#txt_amnt").val('');
    $("#txt_village").val('');

}
        // $(window).on("load", GetAllProperties);
        //function GetAllProperties() {   
        $(window).load(function () {
            agree_load();
        });

        function chk()
        {
            if ($('input[id=chk1]').is(':checked')) {
                $("#adiv").show();
                
            }
            else { $("#adiv").hide(); }
        }
        </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="panel panel-default col-md-12">
        <div id="Tabs" role="tabpanel">
            <!-- Nav tabs -->
                <ul class="nav nav-pills" role="tablist">
               <%--  <li ><a href="#personalapp" aria-controls="personaldet" role="tab" data-toggle="pill" onclick="personal_tab()" id="tabs1">Application</a></li>--%>
                     <li  ><a href="#personaldet" aria-controls="personaldet" role="tab" data-toggle="pill" onclick="personaldet_tab()" id="tabs2">Personal</a></li>
                                        <li  ><a href="#qualidet" aria-controls="qualidet" role="tab" data-toggle="pill" onclick="quali_tab()" id="tab6">Qualification</a></li>

             
                     <li ><a href="#docupload" aria-controls="empassign" role="tab" data-toggle="pill" onclick="doc_tab()" id="tabs3">Document Upload</a></li>
                   <li><a href="#experience" aria-controls="experience" role="tab" data-toggle="pill" onclick="ref_tab()" id="tabs4">Reference</a></li>
<%--                     <li class="active"><a href="#agreement" aria-controls="experience" role="tab" data-toggle="pill" onclick="agree_tab()" id="tabs5">Agreement Info</a></li>--%>
                                     </ul>
            <!-- Tab panes -->
            <form id="Form1" class="form-horizontal row-border" action="#" runat="server">
                <div class="tab-content">
                 
                 
                                  
                        <div class="row ">
                            <div class="ma-header">
                                <div class="col-md-12">
                                    <h3 style="color: #091221"> AGREEMENT DATA FORM</h3>
                                </div>
                            </div>
                        </div>
                         <div>
                        <div class="form-group clonedInput">
                             <asp:TextBox ID="txt_session" runat="server" hidden="hidden" ></asp:TextBox>
                             
                             <asp:TextBox ID="txtbr" runat="server" hidden="hidden" ></asp:TextBox>
                             <label class="col-md-2 cntr-text">Name</label>
                            <div class="col-md-3">
                                <input type="text" name="regular" class="form-control" id="txt_agree_name" maxlength="25" required="required" onblur="leftTrim(this)" autocomplete="off"  onkeypress="return onlyAlphabets(event,this);" onkeyup="this.value=this.value.toUpperCase()" />
                                                       

                                    </div>
                              <label class="col-md-2 cntr-text">Acres</label>
                            <div class="col-md-3"> 
                                <input type="text" class="form-control" id="txt_acres" name="fname" maxlength="25" required="required" onblur="leftTrim(this)" autocomplete="off"  onkeypress="return isNumberKey(event,this)" />
                                
                            </div>

                           
                        </div >
                            

                        <div class="form-group clonedInput">
                           <label class="col-md-2 cntr-text">Survey No:</label>
                            <div class="col-md-3">
                                <input type="text" name="regular" class="form-control" id="txt_surveyno" maxlength="25" required="required" onblur="leftTrim(this)" autocomplete="off"  onkeypress="return isNumberKey(event,this)" />
                            </div>
                             <label class="col-md-2 cntr-text">Village/Municipality</label>
                            <div class="col-md-3">
                                <input type="text" name="gender" class="form-control" id="txt_village" maxlength="25" required="required" onblur="leftTrim(this)" autocomplete="off"  onkeypress="return onlyAlphabets(event,this);" onkeyup="this.value=this.value.toUpperCase()" />
                            </div>  

                        </div> 
                      <div class="form-group clonedInput">
                           <label class="col-md-2 cntr-text">Document No:</label>
                            <div class="col-md-3">
                                <input type="text" name="regular" class="form-control" id="txt_docno" maxlength="25" required="required" onblur="leftTrim(this)" autocomplete="off"  onkeypress="return isNumberKey(event,this)" />
                            </div>
                             <label class="col-md-2 cntr-text">SRO No:</label>
                            <div class="col-md-3">
                                <input type="text" name="gender" class="form-control" id="txt_srono" maxlength="25" required="required" onblur="leftTrim(this)" autocomplete="off"  onkeypress="return isNumberKey(event,this)" />
                            </div>  

                        </div> 
                    <div class="form-group clonedInput">
                           <label class="col-md-2 cntr-text">The Amount To be Paid By the Company:</label>
                            <div class="col-md-3">
                                <input type="text" name="regular" class="form-control" id="txt_amnt" maxlength="25" required="required" onblur="leftTrim(this)" autocomplete="off"  onkeypress="return isNumberKey(event,this)" />
                            </div>
                               

                        </div> 

                </div>
                    <div class="col-md-3">
                             <input type="checkbox" class="check"  name="chk_cst3" id="chk1" onclick="chk()" />
                                  <label class="cntr-text"> Add more  <span style="color:red"> *</span></label>
                                 </div>
                    <div id="adiv" hidden="hidden">  
                         <div class="form-group clonedInput">
                             
                             
                              <label class="col-md-2 cntr-text">Acres</label>
                            <div class="col-md-3"> 
                                <input type="text" class="form-control" id="txt_acre" name="fname" maxlength="25" required="required" onblur="leftTrim(this)" autocomplete="off"  onkeypress="return isNumberKey(event,this)" />
                                
                            </div>

                           
                        </div>

                        <div class="form-group clonedInput">
                           <label class="col-md-2 cntr-text">Survey No:</label>
                            <div class="col-md-3">
                                <input type="text" name="regular" class="form-control" id="txt_sur" maxlength="25" required="required" onblur="leftTrim(this)" autocomplete="off"  onkeypress="return isNumberKey(event,this)" />
                            </div>
                             <label class="col-md-2 cntr-text">Village/Municipality</label>
                            <div class="col-md-3">
                                <input type="text" name="gender" class="form-control" id="txt_vill" maxlength="25" required="required" onblur="leftTrim(this)" autocomplete="off"  onkeypress="return onlyAlphabets(event,this);" onkeyup="this.value=this.value.toUpperCase()" />
                            </div>  

                        </div> 
                      <div class="form-group clonedInput">
                           <label class="col-md-2 cntr-text">Document No:</label>
                            <div class="col-md-3">
                                <input type="text" name="regular" class="form-control" id="txt_doc" maxlength="25" required="required" onblur="leftTrim(this)" autocomplete="off"  onkeypress="return isNumberKey(event,this)" />
                            </div>
                             <label class="col-md-2 cntr-text">SRO No:</label>
                            <div class="col-md-3">
                                <input type="text" name="gender" class="form-control" id="txt_sr" maxlength="25" required="required" onblur="leftTrim(this)" autocomplete="off"  onkeypress="return isNumberKey(event,this)" />
                            </div>  

                        </div> 
                    <div class="form-group clonedInput">
                           <label class="col-md-2 cntr-text">The Amount To be Paid By the Company:</label>
                            <div class="col-md-3">
                                <input type="text" name="regular" class="form-control" id="txt_amt" maxlength="25" required="required" onblur="leftTrim(this)" autocomplete="off"  onkeypress="return isNumberKey(event,this)" />
                            </div>
                               

                        </div> </div>
                    
                    
          
                        
                       
                                           
                        
                        <br />
                    
                 
                        
                        
                        <br />
                         
               
                   
                        <br />
                        
                        <br /> 
                        
                    
                    

                            <div class=" form-group align-center">
<%--                                <input value="confirmccc" class="btn btn-primary pull-right" type="submit"/>--%>
                                 <input id="btn_saves" type="button" value="Save" class="btn btn-info " onclick="save_agree()" style="border-radius:25px;width:180px" />
                                <input id="btn_next" type="button" value="Exit"  class="btn btn-info" onclick="exit()" style="border-radius:25px;width:180px" />

                        </div>
                        <br />
                   
                   

           </div>
                
           </form>
        </div>
    </div>
</asp:Content>

