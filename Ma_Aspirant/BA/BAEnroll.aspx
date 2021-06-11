<%@ Page Title="" Language="C#" MasterPageFile="~/Auction/AucMstr.Master" AutoEventWireup="true" CodeBehind="BAEnroll.aspx.cs" Inherits="Ma_Aspirant.BA.BAEnroll" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
 
     <script type="text/javascript" src="baenrol.js"></script>
    
    <script>
       
      
      

       
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
   
     <script type="text/javascript" src="auction.js"></script>
       
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="panel panel-default col-md-12">
        <div id="Tabs" role="tabpanel">
           
            <form id="Form1" class="form-horizontal row-border" action="#" runat="server">
                <div class="tab-content">
                 
            <div id="parent">  
                                  
                        <div class="row ">
                            <div class="ma-header">
                                <div class="col-md-12">
                                    <h3 style="color: #091221"><i class="icon-user"></i> BA ENROLLMENT</h3>
                                </div>
                            </div>
                        </div>
                  
                         
                       <div class="form-group clonedInput">
                          
                            <%-- //Renew--%>
                           
                            <%-- <label class="col-md-12 cntr-textAuc">Already registered? Please <a href="AucRen.aspx" id="a_renew">click here</a> for renewal.</label>
                            --%>
                                     

                                 
                           
                           
                        </div>
                        


                   

                        <div class="form-group clonedInput">
                            <div class="col-md-12">
                                <div class="widget box" >
                                    <%--  <div class="row">--%>

                                    <div class="widget-header">
                                        <h4><i class="icon-home"></i>Personal Information<span style="color:red"> *</span></h4>
                                    </div>
                                    <div class="widget-content">
                              <div class="form-group">
                             <label class="col-md-2 cntr-text">Name</label>
                              <div class="col-md-4">
                                <input type="text" class="form-control" id="txt_name" name="name" maxlength="25" required="required" onblur="leftTrim(this)" autocomplete="off"  onkeypress="return onlyAlphabets(event,this);" onkeyup="this.value=this.value.toUpperCase()" />
                                 </div>                                                         
                              <label class="col-md-2 cntr-text">House Name</label>
                            <div class="col-md-4"> 
                                <input type="text" class="form-control" id="txt_housename" name="hname" maxlength="25" required="required" onblur="leftTrim(this)" autocomplete="off"  onkeypress="return onlyAlphabets(event,this);" onkeyup="this.value=this.value.toUpperCase()" />
                            </div>
                        </div>
                                         <div class="form-group">
                                                                                  
                              <label class="col-md-2 cntr-text">State</label>

                                               <div class="col-md-4">
                                 <select class="form-control" id="ddl_state" name="blid">
                                                        <option value="-1" selected="selected" >--Select--</option>
                                                    
                                                    
                                                </select>
                                 </div>
                           
                                               <label class="col-md-2 cntr-text">District</label>

                                              <div class="col-md-4">
                                 <select class="form-control" id="ddl_district" name="blid">
                                                        <option value="-1" selected="selected" >--Select--</option>
                                                    
                                                    
                                                </select>
                                 </div>
                             
                        </div>

                                            <div class="form-group">
                                                                                  
                              <label class="col-md-2 cntr-text">Post Office</label>

                                               <div class="col-md-4">
                                 <select class="form-control" id="ddl_post" name="blid">
                                                        <option value="-1" selected="selected" >--Select--</option>
                                                    
                                                    
                                                </select>
                                 </div>
                           
                                               <label class="col-md-2 cntr-text">Pincode</label>

                                              <div class="col-md-4">
                               <input type="text" class="form-control" id="txt_pincode" name="hname" maxlength="25" required="required" onblur="leftTrim(this)" autocomplete="off"  onkeypress="return onlyAlphabets(event,this);" onkeyup="this.value=this.value.toUpperCase()" />
                                 </div>
                             
                        </div>
                                           <div class="form-group">
                                                                                  
                              <label class="col-md-2 cntr-text">Qualification</label>

                                               <div class="col-md-4">
                                 <select class="form-control" id="ddl_qln" name="blid">
                                                        <option value="-1" selected="selected" >--Select--</option>
                                                    
                                                    
                                                </select>
                                 </div>
                           
                                               <label class="col-md-2 cntr-text">Occupation</label>

                                              <div class="col-md-4">
                                 <select class="form-control" id="ddl_occpn" name="blid">
                                                        <option value="-1" selected="selected" >--Select--</option>
                                                    
                                                    
                                                </select>
                                 </div>
                             
                        </div>

                                         <div class="form-group">
                             <label class="col-md-2 cntr-text">DOB</label>
                              <div class="col-md-4">
                                <input type="text" class="form-control" id="txt_dob" name="dob" maxlength="25" required="required" onblur="leftTrim(this)" autocomplete="off"    onchange="getAge(this.value);"  onkeyup="this.value=this.value.toUpperCase()" />
                                 </div>                                                         
                              <label class="col-md-2 cntr-text">Gender</label>
                            <div class="col-md-4"> 
                                  <select class="form-control" id="ddl_gender" name="blid">
                                                        <option value="-1" selected="selected">--Select--</option>
                                                    <option value="1">Male</option>
                                                    <option value="2" >Female</option>
                                                    
                                                </select>
                                <%--<input type="text" class="form-control" id="txt_gender" name="gender" maxlength="25" required="required" onblur="leftTrim(this)" autocomplete="off"  onkeypress="return onlyAlphabets(event,this);" onkeyup="this.value=this.value.toUpperCase()" />--%>
                            </div>
                        </div>
                                        
                                  <div class="form-group" >
                             <label class="col-md-2 cntr-text" >Age</label>
                              <div class="col-md-4">
                                <input type="text" class="form-control" id="txt_age" name="age" maxlength="25" required="required" onblur="leftTrim(this)" autocomplete="off"   onkeypress="return onlyAlphabets(event,this);" onkeyup="this.value=this.value.toUpperCase()" />
                                 </div>  

                                         <label class="col-md-2 cntr-text">Wedding Anniversary</label>
                              <div class="col-md-4">
                                <input type="text" class="form-control" id="txt_wa" name="dob" maxlength="25" required="required" onblur="leftTrim(this)" autocomplete="off"   onkeypress="return onlyAlphabets(event,this);" onkeyup="this.value=this.value.toUpperCase()" />
                                 </div>    

                                  </div>  
                                            <div class="form-group">                                                
                              <label class="col-md-2 cntr-text">Mobile Number <span style="color:red"> *</span></label>
                            <div class="col-md-4"> 
                                <input type="text" class="form-control" id="txt_mobile" name="mobile"  minlength="10"  maxlength="10" required="required" onblur="leftTrim(this)" autocomplete="off" onkeypress="return isNumberKey(event,this)" />
                            </div>
                                                 <div class="col-md-4"> 
                      <input id="btn_mob" type="button" value="Verify Mobile number"  class="btn btn-info" onclick="mobile_otp()" style="border-radius:25px;width:180px" data-backdrop="static" />
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
                                        <h4><i class="icon-book"></i>Bank Information<span style="color:red"> *</span></h4>
                                    </div>
                                    <div class="widget-content">
                       
                                            <div class="form-group">
                                                                                  
                              <label class="col-md-2 cntr-text">State</label>

                                               <div class="col-md-4">
                                 <select class="form-control" id="ddl_bstate" name="blid">
                                                        <option value="-1" selected="selected" >--Select--</option>
                                                    
                                                    
                                                </select>
                                 </div>
                           
                                               <label class="col-md-2 cntr-text">District</label>

                                              <div class="col-md-4">
                                 <select class="form-control" id="ddl_bdistrict" name="blid">
                                                        <option value="-1" selected="selected" >--Select--</option>
                                                    
                                                    
                                                </select>
                                 </div>
                             
                        </div>
                                            <div class="form-group">
                                                                                  
                              <label class="col-md-2 cntr-text">Bank</label>

                                               <div class="col-md-4">
                                 <select class="form-control" id="ddl_bank" name="blid">
                                                        <option value="-1" selected="selected" >--Select--</option>
                                                    
                                                    
                                                </select>
                                 </div>
                           
                                               <label class="col-md-2 cntr-text">Branch</label>

                                              <div class="col-md-4">
                                 <select class="form-control" id="ddl_bbranch" name="blid">
                                                        <option value="-1" selected="selected" >--Select--</option>
                                                    
                                                    
                                                </select>
                                 </div>
                             
                        </div>
                                    
                                                <div class="form-group">
   <label class="col-md-2 cntr-text">IFSC Code<span style="color:red"> *</span></label>
                            <div class="col-md-4"> 
                                  <input type="text" name="regular" class="form-control" id="txt_ifsc" autocomplete="off" ondrop="false" onkeypress="return isNumberKey(event,this)" />
                            </div>
                                               <label class="col-md-2 cntr-text">Account No. <span style="color:red"> *</span></label>
                            <div class="col-md-4"> 
                                <input type="text" class="form-control" id="txt_accno" name="accno"  maxlength="20" onkeypress="return NumberOnly()" onblur="leftTrim(this)" autocomplete="off"  />
                            </div>
                       </div> 

                                              <div class="form-group">
                             <label class="col-md-2 cntr-text">PAN Number <span style="color:red"> *</span></label>
                              <div class="col-md-4">
                                <input type="text" class="form-control" id="txt_panID"  name="txt_pan" maxlength="10" onblur="leftTrim(this)" autocomplete="off"   onkeyup="this.value=this.value.toUpperCase()" />
                                 </div>     
                                                  

                           <label class="col-md-2 cntr-text">Select Nearest Branch <span style="color:red"> *</span></label>
                             <div class="col-md-4">
                                 <select class="form-control" id="ddl_branch" name="blid">
                                                        <option value="-1" selected="selected" >--Select--</option>
                                                    
                                                    
                                                </select>
                                 </div>
                        </div>



                                            <div class="form-group">
                                                                                  
                              <label class="col-md-2 cntr-text">Select Account</label>

                                               <div class="col-md-4">
                                 <select class="form-control" id="ddl_accnt" name="blid">
                                                        <option value="-1" selected="selected" >--Select--</option>
                                                    
                                                    
                                                </select>
                                 </div>
                                               <label class="col-md-2 cntr-text">Enter Your Name(as in Bank Passbook)</label>

                                              <div class="col-md-4">
                                  <input type="text" class="form-control" id="txt_bname"  name="txt_pan" maxlength="10" onblur="leftTrim(this)" autocomplete="off"   onkeyup="this.value=this.value.toUpperCase()" />
                                  </div>                             
                        </div>                                        
                                        
                                    </div>
                                </div>
                                   
                            </div>
                            
                        </div>
          <%--                  
              <div class=" form-group align-center clonedInput">
                          
                                <input id="btn_conf" type="button" value="Continue"  class="btn btn-info" onclick="confirm_basic()" style="border-radius:25px;width:180px" />
                                 
 </div>--%>


                   <div class="form-group clonedInput" >
                            <div class="col-md-12">
                                <div class="widget box">                                   

                                    <div class="widget-header">
                                        <h4><i class="icon-book"></i>Attach Documents<span style="color:red"> *</span></h4>
                                    </div>
                                    <div class="widget-content">
                                            
                         <div class="form-group">  
                             <div class="col-md-6">
                        <label class="col-md-3 cntr-text">  PAN:</label>
                        <div class="col-md-3">
                            <input type="file" data-style="fileinput" id="filePAN"  />
                             <button type="button" data-dismiss="modal" class="btn btn-primary" id="btn_pan" onclick="upload(1)">Upload</button>
                        </div>
                             </div>
                             
                             <div class="col-md-6">
                        <label class="col-md-3 cntr-text">  ID Proof:</label>
                        <div class="col-md-3">
                            <input type="file" data-style="fileinput" id="fileID"  />
                             <button type="button" data-dismiss="modal" class="btn btn-primary" id="btn_id" onclick="upload(2)">Upload</button>
                        </div>
                                 </div>
                             </div>
                                      <div class="form-group">  
                             <div class="col-md-6">
                        <label class="col-md-3 cntr-text">  Pass Book Copy or Cancelled Cheque Leaf:</label>
                        <div class="col-md-3">
                            <input type="file" data-style="fileinput" id="filePass"  />
                             <button type="button" data-dismiss="modal" class="btn btn-primary" id="btn_chk"  onclick="upload(3)">Upload</button>
                        </div>
                            
                            </div>
                                             <div class="col-md-6">
                        <label class="col-md-3 cntr-text">  BA Photo:</label>
                        <div class="col-md-3">
                            <input type="file" data-style="fileinput" id="filephoto"  />
                             <button type="button" data-dismiss="modal" class="btn btn-primary" id="btn_ba" onclick="upload(4)">Upload</button>
                        </div>
                                                   </div>
                             </div>
                                     
                                </div></div>      

                                         </div>
                                     </div>
                               

                  <div class=" form-group align-center clonedInput">
                          
                                <input id="btn_final" type="button" value="Confirm"  class="btn btn-info" onclick="confirm_basic()" style="border-radius:25px;width:180px" />
                                 
 </div>
            <%--   <div class="form-group clonedInput">
                            <div class="col-md-12">
                                <div class="widget box">
                                    <%--  <div class="row">--%>

                                 <%--   <div class="widget-header">
                                        <h4><i class="icon-check"></i>Other Informations<span style="color:red"> *</span></h4>
                                    </div>--%>
                                   <%-- <div class="widget-content">--%>
                           <%--   <div class="form-group">
                             <label class="col-md-2 cntr-text">Bank Account No <span style="color:red"> *</span></label>
                              <div class="col-md-4">
                                <input type="text" class="form-control" id="txt_account"  name="account" maxlength="25" onblur="leftTrim(this)" autocomplete="off"  onkeypress="return isNumberKey(event,this)" />
                                 </div>                                                         
                              <label class="col-md-2 cntr-text">IFSC Code <span style="color:red"> *</span></label>
                            <div class="col-md-4"> 
                                <input type="text" class="form-control" id="txt_ifsc"  name="ifsc" maxlength="25" onblur="leftTrim(this)" autocomplete="off"   onkeyup="this.value=this.value.toUpperCase()" />
                            </div>
                        </div>
                                         <div class="form-group">
                                        <label class="col-md-2 cntr-text">Name as per Bank <span style="color:red"> *</span></label>
                              <div class="col-md-4">
                                <input type="text" class="form-control" id="txt_bname"  name="txt_pan"   disabled />
                                 </div> </div>--%>
                                 <%--        <div class="form-group">
                             <label class="col-md-2 cntr-text">PAN Number <span style="color:red"> *</span></label>
                              <div class="col-md-4">
                                <input type="text" class="form-control" id="txt_panID"  name="txt_pan" maxlength="10" onblur="leftTrim(this)" autocomplete="off"   onkeyup="this.value=this.value.toUpperCase()" />
                                 </div>                                                         
                               <label class="col-md-2 cntr-text">PAN Holder Name <span style="color:red"> *</span></label>
                              <div class="col-md-4">
                                <input type="text" class="form-control" id="txt_panname"  name="txt_pan"   disabled />
                                 </div> 
                        </div>--%>
                                
                                   <%-- </div>
                                </div>
                                   
                            </div>
                            
                        </div>  --%>
                                 
                        <br />
                 
              

                           
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

                    <input id="btn_proceed" type="button" style="border-radius:25px;width:180px" value="Validate"  class="btn btn-info" onclick="validateOTP()" />
                    <input id="btn_close" type="button" value="Close"  data-dismiss="modal"   class="btn btn-info" style="border-radius:25px;width:180px" />
                         <%-- <input id="btn_next" type="button" value="Next"  class="btn btn-info" onclick="next_personal()" style="border-radius:25px;width:180px" />--%>
                <input id="btn_resend" type="button" value="Next"  class="btn btn-info" onclick="mobile_otp()" style="border-radius:25px;width:180px" />

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

                    <input id="Button1" type="button" style="border-radius:25px;width:180px" value="Validate"  class="btn btn-info" onclick="validatemailOTP()" />
                    <input id="Button2" type="button" value="Close"  data-dismiss="modal"   class="btn btn-info" style="border-radius:25px;width:180px" />
                         <%-- <input id="btn_next" type="button" value="Next"  class="btn btn-info" onclick="next_personal()" style="border-radius:25px;width:180px" />--%>
                <input id="Button3" type="button" value="Next"  class="btn btn-info" onclick="mail_otp()" style="border-radius:25px;width:180px" />

                     </div>
      </div>
  <%--    <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>--%>

        
<input type="hidden" name="hdn_auc_id" id="hdn_auc_id"/>
    </div>
  </div>
</div>
                   
                   

          
               </div>
           </form>
        </div>
    </div>
</asp:Content>
