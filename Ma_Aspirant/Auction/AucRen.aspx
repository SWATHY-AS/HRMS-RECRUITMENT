<%@ Page Title="" Language="C#" MasterPageFile="~/Auction/AucMstr.Master" AutoEventWireup="true" CodeBehind="AucRen.aspx.cs" Inherits="Ma_Aspirant.Auction.AucRen" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
       <script type="text/javascript" src="auctionRen.js"></script>
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
                                    <h3 style="color: #091221"><i class="icon-user"></i> AUCTIONEER ONBOARDING</h3>
                                </div>
                            </div>
                        </div>
                  

                        <div class="form-group clonedInput">
                            <div class="col-md-12">
                                <div class="widget box" >
                                    <%--  <div class="row">--%>

                                    <div class="widget-header">
                                        <h4><i class="icon-home"></i>Address Information<span style="color:red"> *</span></h4>
                                    </div>
                                    <div class="widget-content">
                              <div class="form-group">
                             <label class="col-md-2 cntr-text">Enter Auctioneer ID</label>
                              <div class="col-md-4">
                                <input type="text" class="form-control" id="txt_aucid" name="name" maxlength="25" required="required" <%--onblur="leftTrim(this)"--%> autocomplete="off"  <%--onkeypress="return onlyAlphabets(event,this);"--%> onkeyup="this.value=this.value.toUpperCase()" />
                                 
                              </div>                                                         
                             
                            <div class="col-md-4"> 
                                <button type="button" data-dismiss="modal" class="btn btn-primary" id="btn_scrch" onclick="searchAuctioneer()">Search</button>
                     </div>
                        </div>
                                         <div class="form-group">
                                                                                  
                              <label class="col-md-1 cntr-text">Name</label>

                                               <div class="col-md-5">
                                <label class="col-md-5 cntr-text" id="lbl_name">Name</label>
                                 </div>
                           
                                               <label class="col-md-1 cntr-text">Email</label>

                                              <div class="col-md-5">
                                  <label class="col-md-5 cntr-text" id="lbl_hs">Email</label>
                                 </div>
                             
                        </div>
                                         <div class="form-group">
                             <label class="col-md-1 cntr-text">Agreement Start date</label>
                              <div class="col-md-5">
                                  <label class="col-md-5 cntr-text" id="lbl_agsdt">Agreement Start date</label> </div>                                                         
                              <label class="col-md-1 cntr-text">Agreement End Date</label>
                            <div class="col-md-5"> 
                                    <label class="col-md-5 cntr-text" id="lbl_agedt">Agreement End Date</label>
                                        </div>
                        </div>
                                        
                                 
                                        
                                           <div class="form-group" hidden="hidden">
                         <input type="text" class="form-control" id="txt_mchk" name="mobile"   />
                                               <input type="text" class="form-control" id="idmob" name="mobile"   />
                                               <input type="text" class="form-control" id="idmail" name="mobile"   />
<input type="text" class="form-control" id="txt_emchk" name="txt_emchk"/>
                            </div>  
                                    </div>
                                </div>
                            </div>
                        </div>

                   <div class="form-group clonedInput" >
                            <div class="col-md-12">
                                <div class="widget box">                                 
                                    <div class="widget-header">
                                        <h4><i class="icon-book"></i>Attach Documents<span style="color:red"> *</span></h4>
                                    </div>
                                    <div class="widget-content">                                            
                         <div class="form-group">  
                             <div class="col-md-12">
                        <label class="col-md-3 cntr-text">  Attach renewal document:</label>
                        <div class="col-md-5">
                            <input type="file" data-style="fileinput" id="fileRen"  />
                            </div>
                              <div class="col-md-4">
                            <%-- <button type="button" data-dismiss="modal" class="btn btn-primary" id="btn_pan" onclick="upload()">Upload</button>--%>
                        </div>
                             </div>
                             </div>
                                </div></div>      

                                         </div>
                                     </div>

                 <div class=" form-group align-center clonedInput">
                          
                                <input id="btn_final" type="button" value="Confirm"  class="btn btn-info" onclick="upload()" style="border-radius:25px;width:180px" />
                                 
 </div>
      
                                 
                        <br />
</div>
   
               </div>
           </form>
        </div>
    </div>
</asp:Content>
