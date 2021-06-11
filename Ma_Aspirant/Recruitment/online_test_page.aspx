<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="online_test_page.aspx.cs" Inherits="Ma_Aspirant.Recruitment.online_test_page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
         <script src="../App_Themes/Theme/assets/js/online.js" ></script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <form id="Form1" class="form-horizontal row-border" action="#" runat="server">
                <div class="tab-content">
                                       
                        <div class="form-group clonedInput">                          
                             <asp:TextBox ID="txt_session" runat="server" hidden="hidden" ></asp:TextBox>                                                     
                        </div>                 

               </div> 
                    <br /><br /><br /><br />
<%-- 1st --%><div class="form-group"></div>
                   <div class="form-group" id="qu1">
                            <div class="col-md-12">
                                <div class="widget box">                                  
                                    <div class="widget-header clonedInput">
                                        <h4><span class="glyphicon glyphicon-zoom-in"></span> Assesment Questions<span class="required"> *</span></h4>
                                    </div>
                   <div id="q1" class="clonedInput">
                      <div class="widget-content">                  
                       <div class="form-group">
                            <label class="col-md-6 cntr-text">Q1. Founder of Manappuram Group is<span class="required"> *</span></label>
                           </div> 
                        <div class="form-group">
                             <div class="col-md-3">
                                <label class="radio-inline cntr-text">
                                    <input name="radio_work" value="1" type="radio"class="required" id="rd_q11" <%--onclick="rdoq1_conf()"--%>/>
                                  V.C.Padmanabhan 
                                </label>
                               </div>
                        </div>
                        <div class="form-group">
                             <div class="col-md-3">
                                <label class="radio-inline  cntr-text">
                                    <input name="radio_work" value="2" type="radio" class="required" id="rd_q12" <%--onclick="rdoq1_conf()"--%> />
                                    V.P.Nandakumar
                                </label>   
                             </div>
                        </div>
                            <div class="form-group">
                             <div class="col-md-3">
                                <label class="radio-inline  cntr-text">
                                    <input name="radio_work" value="3" type="radio" class="required" id="rd_q13"<%-- onclick="rdoq1_conf()"--%> />
                                   Satya Nadella
                                </label>   
                             </div>
                        </div>
                            <div class="form-group">
                             <div class="col-md-3">
                                <label class="radio-inline  cntr-text">
                                    <input name="radio_work" value="2" type="radio" class="required" id="rd_q14" <%--onclick="rdoq1_conf()"--%> />
                                    Narayanamoorthy
                                </label>   
                             </div>
                        </div>
                            <div class=" form-group align-center">
                                 <input id="btn_doc_approve" type="button" value="NEXT" class="btn btn-info" onclick="q1();" style="border-radius:25px;width:180px"/>
                        </div>
                        </div>                  
                      </div>                         
</div></div></div>
<%--2nd  --%>
                   <div class="form-group" id="qu2" hidden="hidden">
                            <div class="col-md-12">
                                <div class="widget box">                                  
                                    <div class="widget-header clonedInput">
                                        <h4><span class="glyphicon glyphicon-zoom-in"></span> Assesment Questions<span class="required"> *</span></h4>
                                    </div>
                   <div id="Div1" class="clonedInput">
                      <div class="widget-content">                  
                       <div class="form-group">
                            <label class="col-md-6 cntr-text">Q2. Manappuram Group acquired ____________    in the year 2015<span class="required"> *</span></label>
                           </div> 
                        <div class="form-group">
                             <div class="col-md-3">
                                <label class="radio-inline cntr-text">
                                    <input name="radio_work" value="1" type="radio"class="required" id="rdo1q2" <%--onclick="rdoq2_conf()"--%> />
                                  ESAF Bank Ltd 
                                </label>
                               </div>
                        </div>
                        <div class="form-group">
                             <div class="col-md-3">
                                <label class="radio-inline  cntr-text">
                                    <input name="radio_work" value="2" type="radio" class="required" id="rdo2q2" <%--onclick="rdoq2_conf()"--%> />
                                    Asirvad Microfinance Ltd 
                                </label>   
                             </div>
                        </div>
                            <div class="form-group">
                             <div class="col-md-3">
                                <label class="radio-inline  cntr-text">
                                    <input name="radio_work" value="2" type="radio" class="required" id="rdo3q2" <%--onclick="rdoq2_conf()" --%>/>
                                   Annapurna Microfinance Ltd 
                                </label>   
                             </div>
                        </div>
                            <div class="form-group">
                             <div class="col-md-3">
                                <label class="radio-inline  cntr-text">
                                    <input name="radio_work" value="2" type="radio" class="required" id="rdo4q2" <%--onclick="rdoq2_conf()"--%> />
                                    Bandhan Financial Services Ltd
                                </label>   
                             </div>
                        </div>
                            <div class=" form-group align-center">
                                 <input id="Button1" type="button" value="PREV" class="btn btn-info" onclick="prev2();" style="border-radius:25px;width:180px"/>
                           <input id="Button2" type="button" value="NEXT"  class="btn btn-info" onclick="next2();" style="border-radius:25px;width:180px"/>

                        </div>
                        </div>                  
                      </div>  
</div></div></div>
<%-- 3rd --%>
                   <div class="form-group" id="qu3" hidden="hidden">
                            <div class="col-md-12">
                                <div class="widget box">                                  
                                    <div class="widget-header clonedInput">
                                        <h4><span class="glyphicon glyphicon-zoom-in"></span> Assesment Questions<span class="required"> *</span></h4>
                                    </div>
                   <div id="Div3" class="clonedInput">
                      <div class="widget-content">                  
                       <div class="form-group">
                            <label class="col-md-6 cntr-text">Q3. Manappuram is the first NBFC in Kerala to receive foreign institutional investment <span class="required"> *</span></label>
                           </div> 
                        <div class="form-group">
                             <div class="col-md-3">
                                <label class="radio-inline cntr-text">
                                    <input name="radio_work" value="1" type="radio"class="required" id="rdo1q3" <%--onclick="rdoq3_conf()" --%>/>
                                  True 
                                </label>
                               </div>
                        </div>
                        <div class="form-group">
                             <div class="col-md-3">
                                <label class="radio-inline  cntr-text">
                                    <input name="radio_work" value="2" type="radio" class="required" id="rdo2q3"<%--onclick="rdoq3_conf()"--%> />
                                   False
                                </label>   
                             </div>
                        </div>
                                <div class=" form-group align-center">
                                 <input id="Button3" type="button" value="PREV" class="btn btn-info" onclick="prev3();" style="border-radius:25px;width:180px"/>
                           <input id="Button4" type="button" value="NEXT"  class="btn btn-info" onclick="next3();" style="border-radius:25px;width:180px"/>

                        </div>
                        </div>                  
                      </div>  
</div></div></div>
<%-- 4th --%>
                   <div class="form-group" id="qu4" hidden="hidden">
                            <div class="col-md-12">
                                <div class="widget box">                                  
                                    <div class="widget-header clonedInput">
                                        <h4><span class="glyphicon glyphicon-zoom-in"></span> Assesment Questions<span class="required"> *</span></h4>
                                    </div>
                   <div id="Div4" class="clonedInput">
                      <div class="widget-content">                  
                       <div class="form-group">
                            <label class="col-md-6 cntr-text">Q4.  The following are the highlights of Manappuram Gold Loan<span class="required"> *</span></label>
                           </div> 
                        <div class="form-group">
                             <div class="col-md-3">
                                <label class="radio-inline cntr-text">
                                    <input name="radio_work" value="1" type="radio"class="required" id="rdo1q4" <%--onclick="rdoq4_conf()"--%> />
                                  Loans disbursed within 5 minutes 
                                </label>
                               </div>
                        </div>
                        <div class="form-group">
                             <div class="col-md-3">
                                <label class="radio-inline  cntr-text">
                                    <input name="radio_work" value="2" type="radio" class="required" id="rdo2q4" <%--onclick="rdoq4_conf()"--%>/>
                                    Pay interest only for the exact period of loan, and for the exact number of days
                                </label>   
                             </div>
                        </div>
                            <div class="form-group">
                             <div class="col-md-3">
                                <label class="radio-inline  cntr-text">
                                    <input name="radio_work" value="2" type="radio" class="required" id="rdo3q4" <%--onclick="rdoq4_conf()"--%> />
                                   Interest can be paid at any branch.
                                </label>   
                             </div>
                        </div>
                            <div class="form-group">
                             <div class="col-md-3">
                                <label class="radio-inline  cntr-text">
                                    <input name="radio_work" value="2" type="radio" class="required" id="rdo4q4" <%--onclick="rdoq4_conf()"--%> />
                                    All of the above
                                </label>   
                             </div>
                        </div>
                            <div class=" form-group align-center">
                                 <input id="Button5" type="button" value="PREV" class="btn btn-info" onclick="prev4();" style="border-radius:25px;width:180px"/>
                           <input id="Button6" type="button" value="NEXT"  class="btn btn-info" onclick="next4();" style="border-radius:25px;width:180px"/>

                        </div>
                        </div>                  
                      </div>  
</div></div></div>
<%-- 5th --%>
                   <div class="form-group" id="qu5" hidden="hidden">
                            <div class="col-md-12">
                                <div class="widget box">                                  
                                    <div class="widget-header clonedInput">
                                        <h4><span class="glyphicon glyphicon-zoom-in"></span> Assesment Questions<span class="required"> *</span></h4>
                                    </div>
                   <div id="Div5" class="clonedInput">
                      <div class="widget-content">                  
                       <div class="form-group">
                            <label class="col-md-6 cntr-text">Q5. Manappuram branches provide Money transfer facility<span class="required"> *</span></label>
                           </div> 
                        <div class="form-group">
                             <div class="col-md-3">
                                <label class="radio-inline cntr-text">
                                    <input name="radio_work" value="1" type="radio"class="required" id="rdo1q5" <%--onclick="rdoq5_conf()"--%> />
                                  True
                                </label>
                               </div>
                        </div>
                        <div class="form-group">
                             <div class="col-md-3">
                                <label class="radio-inline  cntr-text">
                                    <input name="radio_work" value="2" type="radio" class="required" id="rdo2q5"<%--onclick="rdoq5_conf()"--%> />
                                   False
                                </label>   
                             </div>
                        </div>
                             <div class=" form-group align-center">
                                 <input id="Button7" type="button" value="PREV" class="btn btn-info" onclick="prev5();" style="border-radius:25px;width:180px"/>
                           <input id="Button8" type="button" value="NEXT"  class="btn btn-info" onclick="next5();" style="border-radius:25px;width:180px"/>

                        </div>
                        </div>                  
                      </div>  
</div></div></div>
<%-- 6th --%>
                   <div class="form-group" id="qu6" hidden="hidden">
                            <div class="col-md-12">
                                <div class="widget box">                                  
                                    <div class="widget-header clonedInput">
                                        <h4><span class="glyphicon glyphicon-zoom-in"></span> Assesment Questions<span class="required"> *</span></h4>
                                    </div>
                   <div id="Div6" class="clonedInput">
                      <div class="widget-content">                  
                       <div class="form-group">
                            <label class="col-md-6 cntr-text">Q6. The following are some of the benefits provided to employees of Manappuram<span class="required"> *</span></label>
                           </div> 
                        <div class="form-group">
                             <div class="col-md-3">
                                <label class="radio-inline cntr-text">
                                    <input name="radio_work" value="1" type="radio"class="required" id="rdo1q6" <%--onclick="rdoq6_conf()"--%> />
                                  Provident Fund
                                </label>
                               </div>
                        </div>
                        <div class="form-group">
                             <div class="col-md-3">
                                <label class="radio-inline  cntr-text">
                                    <input name="radio_work" value="2" type="radio" class="required" id="rdo2q6" <%--onclick="rdoq6_conf()"--%> />
                                    ESIC
                                </label>   
                             </div>
                        </div>
                            <div class="form-group">
                             <div class="col-md-3">
                                <label class="radio-inline  cntr-text">
                                    <input name="radio_work" value="2" type="radio" class="required" id="rdo3q6" <%--onclick="rdoq6_conf()"--%> />
                                   Employee Stock Options
                                </label>   
                             </div>
                        </div>
                            <div class="form-group">
                             <div class="col-md-3">
                                <label class="radio-inline  cntr-text">
                                    <input name="radio_work" value="2" type="radio" class="required" id="rdo4q6" <%--onclick="rdoq6_conf()"--%> />
                                    All of the above
                                </label>   
                             </div>
                        </div>
                            <div class=" form-group align-center">
                                 <input id="Button9" type="button" value="PREV" class="btn btn-info" onclick="prev6();" style="border-radius:25px;width:180px"/>
                           <input id="Button10" type="button" value="NEXT"  class="btn btn-info" onclick="next6();" style="border-radius:25px;width:180px"/>

                        </div>
                        </div>                  
                      </div>  
</div></div></div>
<%-- 7th --%>
                   <div class="form-group" id="qu7" hidden="hidden">
                            <div class="col-md-12">
                                <div class="widget box">                                  
                                    <div class="widget-header clonedInput">
                                        <h4><span class="glyphicon glyphicon-zoom-in"></span> Assesment Questions<span class="required"> *</span></h4>
                                    </div>
                   <div id="Div7" class="clonedInput">
                      <div class="widget-content">                  
                       <div class="form-group">
                            <label class="col-md-6 cntr-text">Q7. In addition to salary, employees are paid bonus twice in a year<span class="required"> *</span></label>
                           </div> 
                        <div class="form-group">
                             <div class="col-md-3">
                                <label class="radio-inline cntr-text">
                                    <input name="radio_work" value="1" type="radio"class="required" id="rdo1q7" <%--onclick="rdoq7_conf()"--%> />
                                  True
                                </label>
                               </div>
                        </div>
                        <div class="form-group">
                             <div class="col-md-3">
                                <label class="radio-inline  cntr-text">
                                    <input name="radio_work" value="2" type="radio" class="required" id="rdo2q7" <%--onclick="rdoq7_conf()"--%> />
                                    False
                                </label>   
                             </div>
                        </div>
                             <div class=" form-group align-center">
                                 <input id="Button11" type="button" value="PREV" class="btn btn-info" onclick="prev7();" style="border-radius:25px;width:180px"/>
                           <input id="Button12" type="button" value="NEXT"  class="btn btn-info" onclick="next7();" style="border-radius:25px;width:180px"/>

                        </div>
                        </div>                  
                      </div>  
</div></div></div>
<%-- 8th --%>
                   <div class="form-group" id="qu8" hidden="hidden">
                            <div class="col-md-12">
                                <div class="widget box">                                  
                                    <div class="widget-header clonedInput">
                                        <h4><span class="glyphicon glyphicon-zoom-in"></span> Assesment Questions<span class="required"> *</span></h4>
                                    </div>
                   <div id="Div8" class="clonedInput">
                      <div class="widget-content">                  
                       <div class="form-group">
                            <label class="col-md-6 cntr-text">Q8. Minimum service required in an organisation for eligibility of Gratuity is <span class="required"> *</span></label>
                           </div> 
                        <div class="form-group">
                             <div class="col-md-3">
                                <label class="radio-inline cntr-text">
                                    <input name="radio_work" value="1" type="radio"class="required" id="rdo1q8" <%--onclick="rdoq8_conf()"--%> />
                                  10 years 
                                </label>
                               </div>
                        </div>
                        <div class="form-group">
                             <div class="col-md-3">
                                <label class="radio-inline  cntr-text">
                                    <input name="radio_work" value="2" type="radio" class="required" id="rdo2q8" <%--onclick="rdoq8_conf()"--%> />
                                3 Years
                                </label>   
                             </div>
                        </div>
                            <div class="form-group">
                             <div class="col-md-3">
                                <label class="radio-inline  cntr-text">
                                    <input name="radio_work" value="2" type="radio" class="required" id="rdo3q8" <%--onclick="rdoq8_conf()"--%> />
                                   5 years
                                </label>   
                             </div>
                        </div>
                            <div class="form-group">
                             <div class="col-md-3">
                                <label class="radio-inline  cntr-text">
                                    <input name="radio_work" value="2" type="radio" class="required" id="rdo4q8" <%--onclick="rdoq8_conf()"--%> />
                                    None of the above
                                </label>   
                             </div>
                        </div>
                            <div class=" form-group align-center">
                                 <input id="Button13" type="button" value="PREV" class="btn btn-info" onclick="prev8();" style="border-radius:25px;width:180px"/>
                           <input id="Button14" type="button" value="NEXT"  class="btn btn-info" onclick="next8();" style="border-radius:25px;width:180px"/>

                        </div>
                        </div>                  
                      </div>  
</div></div></div>
<%-- 9th --%>
                   <div class="form-group" id="qu9" hidden="hidden">
                            <div class="col-md-12">
                                <div class="widget box">                                  
                                    <div class="widget-header clonedInput">
                                        <h4><span class="glyphicon glyphicon-zoom-in"></span> Assesment Questions<span class="required"> *</span></h4>
                                    </div>
                   <div id="Div9" class="clonedInput">
                      <div class="widget-content">                  
                       <div class="form-group">
                            <label class="col-md-6 cntr-text">Q9. The gratuity amount payable is depended upon the last drawn monthly salary (Basic + VDA)<span class="required"> *</span></label>
                           </div> 
                        <div class="form-group">
                             <div class="col-md-3">
                                <label class="radio-inline cntr-text">
                                    <input name="radio_work" value="1" type="radio"class="required" id="rdo1q9" <%--onclick="rdoq9_conf()"--%> />
                                  True
                                </label>
                               </div>
                        </div>
                        <div class="form-group">
                             <div class="col-md-3">
                                <label class="radio-inline  cntr-text">
                                    <input name="radio_work" value="2" type="radio" class="required" id="rdo2q9" <%--onclick="rdoq9_conf()"--%> />
                                    False
                                </label>   
                             </div>
                        </div>
                            <div class=" form-group align-center">
                                 <input id="Button15" type="button" value="PREV" class="btn btn-info" onclick="prev9();" style="border-radius:25px;width:180px"/>
                           <input id="Button16" type="button" value="NEXT"  class="btn btn-info" onclick="next9();" style="border-radius:25px;width:180px"/>

                        </div>
                        </div>                  
                      </div>  
</div></div></div>
<%-- 10th --%>
                   <div class="form-group" id="qu10" hidden="hidden">
                            <div class="col-md-12">
                                <div class="widget box">                                  
                                    <div class="widget-header clonedInput">
                                        <h4><span class="glyphicon glyphicon-zoom-in"></span> Assesment Questions<span class="required"> *</span></h4>
                                    </div>
                   <div id="Div10" class="clonedInput">
                      <div class="widget-content">                  
                       <div class="form-group">
                            <label class="col-md-6 cntr-text">Q10. CSR stands for<span class="required"> *</span></label>
                           </div> 
                        <div class="form-group">
                             <div class="col-md-3">
                                <label class="radio-inline cntr-text">
                                    <input name="radio_work" value="1" type="radio"class="required" id="rdo1q10" <%--onclick="rdoq10_conf()"--%> />
                                 Corporate Security Reasons 
                                </label>
                               </div>
                        </div>
                        <div class="form-group">
                             <div class="col-md-3">
                                <label class="radio-inline  cntr-text">
                                    <input name="radio_work" value="2" type="radio" class="required" id="rdo2q10" <%--onclick="rdoq10_conf()"--%> />
                                     Company Social Responsibility
                                </label>   
                             </div>
                        </div>
                            <div class="form-group">
                             <div class="col-md-3">
                                <label class="radio-inline  cntr-text">
                                    <input name="radio_work" value="2" type="radio" class="required" id="rdo3q10" <%--onclick="rdoq10_conf()"--%>/>
                                   Corporate Social Responsibility
                                </label>   
                             </div>
                        </div>
                            <div class="form-group">
                             <div class="col-md-3">
                                <label class="radio-inline  cntr-text">
                                    <input name="radio_work" value="2" type="radio" class="required" id="rdo4q10" <%--onclick="rdoq10_conf()"--%> />
                                   None of the above
                                </label>   
                             </div>
                        </div>
                            <div class=" form-group align-center">
                                 <input id="Button17" type="button" value="PREV" class="btn btn-info" onclick="prev10();" style="border-radius:25px;width:180px"/>
                           <input id="Button18" type="button" value="FINISH"  class="btn btn-info" onclick="finish();" style="border-radius:25px;width:180px" data-toggle="modal" data-target="#myModal"/>

                        </div>
                        </div>                  
                      </div>  
</div></div></div>

      <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog" hidden="hidden">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
        <div class="modal-header">
<%--          <button type="button" class="close" data-dismiss="modal">&times;</button>--%>
          <h4 class="modal-title">Results..</h4>
        </div>
        <div class="modal-body">
          <b><p id="test_result" style="font-size:large" hidden="hidden"></p></b>
                      <b><p id="test_result_failed" style="font-size:large" hidden="hidden"></p></b>

        </div>
        <div class="modal-footer">
          <button type="button" id="close" class="btn btn-info" data-dismiss="modal" hidden="hidden">Close</button>
             <button type="button" id="retest" class="btn btn-info"  hidden="hidden" onclick="retestoo();">Retest Now</button>

        </div>
      </div>
    </div>
  </div>
           
           
           
           
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
              
           
                 </form>
</asp:Content>
