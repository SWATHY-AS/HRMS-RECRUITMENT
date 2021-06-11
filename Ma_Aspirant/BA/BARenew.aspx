<%@ Page Title="" Language="C#" MasterPageFile="~/Auction/AucMstr.Master" AutoEventWireup="true" CodeBehind="BARenew.aspx.cs" Inherits="Ma_Aspirant.BA.BARenew" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
       <script type="text/javascript" src="baren.js">
           
       </script>
     <style type="text/css">
   .modal {
            /* some styles to position the modal at the center of the page */
            position: fixed;
            top: 35%;
            left: 30%;
            width: 50px;
            height: 50px;
            margin-left: -150px;
            margin-top: -100px;
            background-color: white;
            text-align: center;
            opacity: 1.0;
            /* needed styles for the overlay */
            z-index: 100; /* keep on top of other elements on the page */
            outline: 9999px solid rgba(0,0,0,0.5);
            border: solid 1px black;
        }
    /* overlay styles, all needed */
        .overlay {
            background: transparent url(../Images/overlay.png) repeat top left;
            position: fixed;
            top: 0px;
            bottom: 0px;
            left: 0px;
            right: 0px;
            z-index: 100;
         }
        </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="panel panel-default col-md-12">
        <div id="Tabs" role="tabpanel">

            <!-- Tab panes -->
            <form id="Form1" class="form-horizontal row-border" action="#" runat="server">
                <div class="tab-content">

                    <div id="parent">

                        <div class="row ">
                            <div class="ma-header">
                                <div class="col-md-12">
                                    <h3 style="color: #091221"><i class="icon-user"></i>BA AGREEMENT RENEWAL</h3>
                                </div>
                            </div>
                        </div>


                        <div class="form-group clonedInput">
                            <div class="col-md-12">
                                <div class="widget box">
                                    <%--  <div class="row">--%>

                                    <div class="widget-header">
                                        <h4><i class="icon-home"></i>Address Information<span style="color: red"> *</span></h4>
                                    </div>
                                    <div class="widget-content">
                                        <div class="form-group">
                                            <label class="col-md-2 cntr-text">Enter BA Code</label>
                                            <div class="col-md-4">
                                                <input type="text" class="form-control" id="txt_aucid" name="name" maxlength="25" required="required" <%--onblur="leftTrim(this)"--%> autocomplete="off" <%--onkeypress="return onlyAlphabets(event,this);"--%> onkeyup="this.value=this.value.toUpperCase()" onkeypress="return onlyNos(event,this);"/>

                                            </div>

                                            <div class="col-md-4">
                                                <button type="button" data-dismiss="modal" class="btn btn-primary" id="btn_scrch" onclick="searchAuctioneer()">Search</button>
                                            </div>
                                        </div>
                                        <div class="form-group">

                                            <label class="col-md-2 cntr-text">Name</label>

                                            <div class="col-md-10">
                                                <label class="col-md-5 cntr-text" id="lbl_name">Name</label>
                                            </div>


                                        </div>
                                        <div class="form-group">

                                            <label class="col-md-2 cntr-text">Contact Number</label>

                                            <div class="col-md-10">
                                                <label class="col-md-5 cntr-text" id="lbl_baphn">Contact Number</label>
                                            </div>


                                        </div>
                                        <div class="form-group">
                                            <label class="col-md-2 cntr-text">Agreement Expired date</label>
                                            <div class="col-md-10">
                                                <label class="col-md-5 cntr-text" id="lbl_agsdt">Agreement Start date</label>
                                            </div>

                                        </div>
                                         <div class="form-group">
                                            <label class="col-md-2 cntr-text">Branch Name</label>
                                            <div class="col-md-10">
                                                <label class="col-md-5 cntr-text" id="lbl_brnch">Branch Name</label>
                                            </div>

                                        </div>
                                        <div class="form-group">
                                            <label class="col-md-2 cntr-text">Branch Contact number</label>
                                            <div class="col-md-10">
                                                <label class="col-md-5 cntr-text" id="lbl_brnchcntct_no">Branch number</label>
                                            </div>

                                        </div>



                                        <div class="form-group" hidden="hidden">
                                            <input type="text" class="form-control" id="txt_mchk" name="mobile" />
                                            <input type="text" class="form-control" id="idmob" name="mobile" />
                                            <input type="text" class="form-control" id="idmail" name="mobile" />
                                            <input type="text" class="form-control" id="txt_emchk" name="txt_emchk" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="form-group clonedInput">
                            <div class="col-md-12">
                                <div class="widget box">
                                    <div class="widget-header">
                                        <h4>Are you Interested to continue as a Business Associate with Manappuram Finance Ltd?<span style="color: red"> *</span></h4>
                                    </div>
                                    <div class="widget-content">
                                        <div class="form-group">
                                            <div class="col-md-12">
                                                <label class="radio-inline col-md-2 align-left" style="color:black">
                                                <input type="radio" name="dlradio" id="rb_yes" data-toggle="collapse" data-target="#cheq1" onclick="visible()"/>YES
                                            </label>
                                            <label class="radio-inline col-md-2 align-left">
                                                <input type="radio" name="dlradio" id="rb_no" data-toggle="collapse" data-target="#cheq1" onclick="visible()"/>NO
                                            </label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                 <div class="form-group" id="term_cndtns" style="display:none">
                                            <div class="col-md-12">
                                                 <%--<label class="cntr-text" id="term_lbl">Accept </label>--%> 
                                                <input type="checkbox" checked="checked" name="chk_agr" id="chk_agre" onclick="termsconditions()" /><label class="cntr-text" id="lbl_accpt" style="color: green">Accept</label>&nbsp;&nbsp;<a href="termsandconditions.aspx" target="_blank">terms and conditions</a>
                                            
                                            
                                            </div>
                                        </div>
                            </div>
                        </div>

                        <div class=" form-group align-center clonedInput">

                            <input id="btn_final" type="button" value="Confirm" class="btn btn-info" onclick="confirm_sendotp();" style="border-radius: 25px; width: 180px" />

                        </div>


                        <br />
                    </div>

                </div>
            </form>
        </div>
    </div>
     <div id="over" class="overlay" style="display: none; margin-left: 20px; margin-right: 20px;">
    </div>
    <div id="modal" class="modal" style="display: none;width:50px;">
        <div style="background-color:skyblue; height: 40px;"><div style="width:50%;float:left;margin-right: 9px; margin-top: 8px; height: 24px;color:White;"><b style="float:left; margin-left:10px;">VERIFY OTP</b></div><img src="../App_Themes/Theme/assets/img/close.jfif" style="cursor: pointer; cursor: hand; float: right;
            margin-right: 9px; margin-top: 8px; height: 24px;" id='btn_stmtexit' alt="close" onclick="hide()" /></div>
        
         <br />
        <br />
        <br />
        <br />
        <br />
        <div class="align-center">
            <div class="col-md-3">

            </div>
             <label class="col-md-3 cntr-text">Enter OTP</label>
             <div class="col-md-3">
                 <input type ="text" class="form-control col-md-5 cntr-text" id="txt_otp" style="width:200px"/>
             </div>
            <div class="col-md-3">

            </div>
         </div>
        <br />
         <br />
        <br />
         <div >

             <input id="btn_vrfyotp" type="button" value="VerifyOTP" class="btn btn-info" onclick="verify_otp();" style="border-radius: 25px; width: 180px" />

         </div>
    </div>
     <%--<div id="over1" class="overlay" style="display: none; margin-left: 20px; margin-right: 20px;">
    </div>
    <div id="modal1" class="modal1" style="display: none;width:50px;">
       <div style="background-color: skyblue; height: 40px;">
             <div style="width: 50%; float: left; margin-right: 9px; margin-top: 8px; height: 24px; color: White;"><b style="float: left; margin-left: 10px;">VERIFY OTP</b></div>
             <img src="../App_Themes/Theme/assets/img/close.jfif" style="cursor: pointer; cursor: hand; float: right; margin-right: 9px; margin-top: 8px; height: 24px;"
                 id='btn_stmtexit1' alt="close" onclick="hide()" />
         </div>
        
         <br />
        <br />
        <br />
        <br />
        <br />
    </div>--%>
</asp:Content>