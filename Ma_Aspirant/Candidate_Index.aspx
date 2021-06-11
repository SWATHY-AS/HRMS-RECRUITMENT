<%@ Page Title="" Language="C#" MasterPageFile="~/Candidate.Master" AutoEventWireup="true" CodeBehind="Candidate_Index.aspx.cs" Inherits="Ma_Aspirant.Candidate_Index" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
  
        <script src="App_Themes/Theme/assets/js/candidateindex.js"></script>
       
  
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
                            <div class="ma-header">
                                <div class="col-md-12">
                                    <h2 style="color: #091221"> CURRENT OPENINGS</h2>
                                </div>
                               
                            </div>
          <br/>
          <br/>

        <span class="col-md-4"></span>
   <div class="col-md-4 align-center panelo1" style="border-radius:25px" >

    <%--  <p class="vacancy">Jr.Assistant  <span class="badge vacancy1"  id="span_vcncyja" >1450</span> vacancies </p> 
       <p class="vacancy">House Keeping Staff  <span class="badge vacancy1" id="span_vcncy_hk">1200</span> vacancies</p> 
    --%>   </div>
     
             <br/>
          <br/>
          <br/>
          <br/>
 <div class="col-md-12 panelo" style="border-radius:25px">
     <br/>
     <span class="col-md-2"></span>
     <div class=" col-md-2"> 
 <select class="select2-select-00  full-width-fix" id="cmb_state" name="state" style="border-radius:5px;height:42px;border-color:black; width:100%;;color:black;">
     <option value="-1" selected="selected">--SELECT STATE--</option>
                                                </select> </div>
      
       <div class=" col-md-2"> 
 <select class="select2-select-00  full-width-fix" id="cmb_region" name="region" style="border-radius:5px;height:42px;width:100%;border-color:black;color:black;">
     <option value="-1" selected="selected">--SELECT DISTRICT--</option>
                                                </select> </div>
      
     <div class=" col-md-2"> 
 <select class="select2-select-00  full-width-fix" id="cmb_branch" name="region" style="border-radius:5px;height:42px;width:100%;border-color:black;color:black;">
     <option value="-1" selected="selected">--SELECT LOCATION--</option>
                                                </select> </div>                            
       <div class=" col-md-2">           

    <button class="btn btn-default center-block" style="border-radius:15px;border-color:black;width:180px;" type="button"  onclick="getpage1()" >
        <b style="font-family:OpenSans;font-weight:bolder;font-size:18px;">Search</b> 
        </button>
 </div>
     
    

     

        </div>
                       
  

  </div>  



              
          
  

</asp:Content>
