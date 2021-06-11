<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="BH_notific.aspx.cs" Inherits="Ma_Aspirant.Recruitment.BH_notific" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <script>
        

         function bhschedul_tab() {
             window.open("../Recruitment/BH_notific.aspx", "_self");
         }
         function verify_tab() {
             window.open("../Recruitment/BH_Verify.aspx", "_self");
         }
         function pic_tab() {
             window.open("../Recruitment/Photo_Upload.aspx", "_self");
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
             window.location.href = "BH_Verify.aspx";
           }

           $(window).load(function () {
       
               GetAllProperties();

           

           });

    

    </script>
  
    <script type="text/javascript" src="../App_Themes/Theme/assets/js/BHtabs.js"></script>
   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="panel panel-default col-md-12">
        <div id="Tabs" role="tabpanel">
            <!-- Nav tabs -->
              <ul class="nav nav-pills" role="tablist">
                     <li  class="active"><a href="#notific" aria-controls="notific" role="tab" data-toggle="pill" onclick="bhschedul_tab()">Schedule Interview</a></li>
                 <li><a href="#verify" aria-controls="verify" role="tab" data-toggle="pill" onclick="verify_tab()">Verify Docs</a></li>
                
                                     <li><a href="#photoupload" aria-controls="photoupload" role="tab" data-toggle="pill" onclick="pic_tab()">Photo Upload</a></li>

            </ul>
            <!-- Tab panes -->
            <form id="Form1" class="form-horizontal row-border" action="#" runat="server">
                <div class="tab-content">
                 
                 
                                  
                        <div class="row ">
                            <div class="ma-header">
                                <div class="col-md-12">
                                    <h3 style="color: #091221"><span class="glyphicon glyphicon-zoom-in"></span> SCHEDULE INTERVIEW</h3>
                                </div>
                            </div>
                        </div>
                         
                     

                   

                        <div class="form-group">
                            <div class="col-md-12">
                                <div class="widget box">
                                    <%--  <div class="row">--%>

                                    <div class="widget-header clonedInput">
                                        <h4><span class="glyphicon glyphicon-check"></span> Candidate Details</h4>
                                    </div>
                                   
                                        <div id="basic_info" class="clonedInput">
                                             <div class="widget-content">
                                                   <div class="form-group">
                                                                                 
                             <label class="col-md-2 cntr-text">Select Application Id</label>
                              <div  hidden="hidden">
                            <input type="text" class="form-control" id="txt_d1" name="distname" maxlength="25"  hidden="hidden" />
                            <input type="text" class="form-control" id="txt_d2" name="distname" maxlength="25"  hidden="hidden" />
                                  </div>
                                   <div class="col-md-4">
                                    <asp:TextBox ID="txt_session" runat="server" hidden="hidden" ></asp:TextBox>
                                    <asp:TextBox ID="txt_br" runat="server" hidden="hidden" ></asp:TextBox>
                              <select class="form-control"  data-placeholder="App_id" id="cmb_appId" name="cmb_appId" required  onchange="emp_load()">
                                     <option value="-1" selected="selected">--SELECT--</option>
                                 </select>                                 </div>   
                                <label class="col-md-2 cntr-text">Branch Name</label>
                              <div class="col-md-4">
                                <input type="text" class="form-control" id="txt_brname" name="distname" maxlength="25" required="required" onblur="leftTrim(this)" autocomplete="off" disabled="disabled" onkeypress="return onlyAlphabets(event,this);" onkeyup="this.value=this.value.toUpperCase()" />
                                 </div>  
                        </div>
                       <div class="form-group">
                            <label class="col-md-2 cntr-text">Name</label>
                            <div class="col-md-4"> 
                                <input type="text" class="form-control" id="txt_name" name="hname" maxlength="25" required="required" onblur="leftTrim(this)" autocomplete="off" disabled="disabled" onkeypress="return onlyAlphabets(event,this);" onkeyup="this.value=this.value.toUpperCase()" />
                            </div>
                                                                                  
                              <label class="col-md-2 cntr-text">House Name</label>
                            <div class="col-md-4"> 
                                <input type="text" class="form-control" id="txt_hname" name="hname" maxlength="25" required="required" onblur="leftTrim(this)" autocomplete="off" disabled="disabled" onkeypress="return onlyAlphabets(event,this);" onkeyup="this.value=this.value.toUpperCase()" />
                            </div>
                        </div>
                        <div class="form-group">
                             <label class="col-md-2 cntr-text">District</label>
                              <div class="col-md-4">
                                <input type="text" class="form-control" id="txt_dist" name="distname" maxlength="25" required="required" onblur="leftTrim(this)" autocomplete="off" disabled="disabled" onkeypress="return onlyAlphabets(event,this);" onkeyup="this.value=this.value.toUpperCase()" />
                              </div>                                                         
                              <label class="col-md-2 cntr-text">State</label>
                            <div class="col-md-4"> 
                                <input type="text" class="form-control" id="txt_stat" name="statname" maxlength="25" required="required" onblur="leftTrim(this)" autocomplete="off" disabled="disabled"  onkeypress="return onlyAlphabets(event,this);" onkeyup="this.value=this.value.toUpperCase()" />
                            </div>
                        </div>
                                         <div class="form-group">
                             <label class="col-md-2 cntr-text">Age</label>
                              <div class="col-md-4">
                                <input type="text" class="form-control" id="txt_age" name="dob" maxlength="25" required="required" onblur="leftTrim(this)" autocomplete="off" disabled="disabled"  onkeypress="return onlyAlphabets(event,this);" onkeyup="this.value=this.value.toUpperCase()" />
                                 </div>                                                         
                              <label class="col-md-2 cntr-text">DOB</label>
                            <div class="col-md-4"> 
                                <input type="text" class="form-control" id="txt_dob" name="gender" maxlength="25" required="required" onblur="leftTrim(this)" autocomplete="off" disabled="disabled" onkeypress="return onlyAlphabets(event,this);" onkeyup="this.value=this.value.toUpperCase()" />
                            </div>
                        </div>
                                                    <div class="form-group">
                             <label class="col-md-2 cntr-text">Email ID</label>
                              <div class="col-md-4">
                                <input type="text" class="form-control" id="txt_mail" name="dob" maxlength="25" required="required" onblur="leftTrim(this)" autocomplete="off" disabled="disabled"  onkeypress="return onlyAlphabets(event,this);" onkeyup="this.value=this.value.toUpperCase()" />
                                 </div>                                                         
                              <label class="col-md-2 cntr-text">Mobile Number</label>
                            <div class="col-md-4"> 
                                <input type="text" class="form-control" id="txt_number" name="gender" maxlength="25" required="required" onblur="leftTrim(this)" autocomplete="off" disabled="disabled" onkeypress="return onlyAlphabets(event,this);" onkeyup="this.value=this.value.toUpperCase()" />
                            </div>
                        </div>
                           <div class="form-group">
                           
                             <label class="col-md-2 cntr-text">POST  </label>
                                   <div class="col-md-4">
                     <input type="text" name="regular" class="form-control" id="txt_post" disabled/>
                                       </div>
                               <label class="col-md-2 cntr-text">Gender  </label>
                               <div class="col-md-4">
                     <input type="text" name="regular" class="form-control" id="txt_gen" disabled/>
                                       </div>

                                  </div>

                                        
                                
</div> 
                                    </div>
                     
                                       
                 <div class="form-group clonedInput" >
                            <div class="col-md-12">
                                <div class="widget box">
                                    <%--  <div class="row">--%>

                                    <div class="widget-header">
                                        <h4><i class="icon-book"></i>Qualification</h4>
                                    </div>
                                    <div class="widget-content">
                              <div class="form-group">
                           
                             <label class="col-md-2 cntr-text">Highest Qualification </label>
                                   <div class="col-md-4">
                     <input type="text" name="regular" class="form-control" id="txt_quali" disabled/>
                                       </div>
                                 
                              <label class="col-md-2 cntr-text">University </label>
                                                
                            <div class="col-md-4"> 
                     <input type="text" name="regular" class="form-control" id="txt_uni" disabled/>
                                

                                             
                                </div>
                       </div> 
                                          <div class="form-group">
                              <label class="col-md-2 cntr-text">Percentage Obtained </label>
                            <div class="col-md-2"> 
                           <input type="text" name="regular" class="form-control" id="txt_per" disabled/>

                            </div>
   <label class="col-md-2 cntr-text">Year Of Passout </label>
                            <div class="col-md-2"> 
                                  <input type="text" name="regular" class="form-control" id="txt_passout" disabled/>
                            </div>
                                               <label class="col-md-2 cntr-text">Reg. No. </label>
                            <div class="col-md-2"> 
                                <input type="text" class="form-control" id="txt_regnum" name="pyear" maxlength="25"  disabled  />
                            </div>
                       </div> 
                                        
                                    </div>
                                </div>
                                   
                            </div>
                            
                        </div>
                            
               
                                    
                                    
                                    
                                    
                                               </div>
                                   
                            </div>
                            
                        </div>                         
                    <div class="form-group">
                            <div class="col-md-12">
                                <span class="col-md-3"> </span>
                              <div class="alert alert-success col-md-6 " role="alert">

  <h4 class="alert-heading">  Alert! </h4>
  <p>Call the candidate and inform the scheduled Interview Date and Time.  
    </p>
 <button type="button" class="close col-md-3" data-dismiss="alert" aria-label="Close">  <span aria-hidden="true">&times;</span>
  </button>

</div>
                                 <%--<span class="col-md-3"> </span>--%>
                                    

                                    <div class="widget-header clonedInput">
                                        <h4><span class="glyphicon glyphicon-zoom-in"></span><span class="required" style="color:red"> *Schedule Interview between    <label id="fromdat" class="cntr-text">00/00/0000</label> and   <label id="todat" class="cntr-text">00/00/0000</label></span></h4>
                                    </div>
                                  
                                   
                                        <div id="doc_info" class="clonedInput">
                                             <div class="widget-content">
                          <div class="form-group">
                            <label class="col-md-2 cntr-text">Interview Date</label>
                            <div class="col-md-4"> 
                                     <input type="text" name="regular" class="form-control" id="datepicker2" required="required" autocomplete="off" ondrop="false" onkeydown="return false" onpaste="false"/>
                            
                                  </div>
                                                                                  
                              <label class="col-md-2 cntr-text">Interview Time (HH:MM)</label>
                            <div class="col-md-4">
                                <select class="form-control" id="from_time" >
                        <option value="0"  selected="selected">0:00</option>
                                    <option value="1" >9:00AM</option>
                                     <option value="2" >10:00AM</option>
                                     <option value="3" >11:00AM</option>
                                     <option value="4" >12:00PM</option>
                                     <option value="5" >1:00PM</option>
                                     <option value="6" >2:00PM</option>
                                     <option value="7" >3:00PM</option>
                                     <option value="8" >4:00PM</option>
                    </select>
                                 </div>
                        </div>
</div> 
                                    </div>
                                </div>
                                   
                            </div>
                            
                        </div>
             
                    
                        <br />
                        
              
                            <div class=" form-group align-center">

                                <input id="btn_saves" type="button" value="Send SMS" class="btn btn-info " onclick="schedule_interview()" style="border-radius:25px;width:180px" />
                                 <input id="btn_next" type="button" value="Next"  class="btn btn-info" onclick="next()" style="border-radius:25px;width:180px" disabled="disabled" />


                        </div>
                        <br />
                   
                   

                                <div class="form-group col-md-12">
            <div id="PModalBehaviour" class="modal fade" role="dialog" data-backdrop="static">            
             <br />
            <br />
            <br />
            <br />            
            <div class="modal-dialog" style="width:10%;">    
            <div class="modal-content" style="width:150%;">
            <div class="imgcontainer" >
            <img  src="../App_Themes/Theme/assets/img/processing_latest1.gif" alt="loading" style="backface-visibility:hidden" class="avatar"/>
            </div>    
            </div>
            </div>                       
        </div>
        </div>
           


       <%--    </div>--%>
                
           </form>
        </div>
    </div>

</asp:Content>
