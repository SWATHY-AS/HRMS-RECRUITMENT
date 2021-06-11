<%@ Page Title="" Language="C#" MasterPageFile="~/Candidate.Master" AutoEventWireup="true" CodeBehind="logout_HO.aspx.cs" Inherits="Ma_Aspirant.logout_HO" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script>

        function loginagn() {

            window.location.href = "../HO_Website/Login_HO.aspx";
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="widget box" >
                                                                 
                                    <div class="widget-content">
                                      <br />
                                             <div class="form-group align-center">
                                                 <input id="btn_login" type="button" style="border-radius:25px;width:250px;"  value="Login"  class="btn btn-danger" onclick="loginagn()" />

    <p style="font-family:'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif;font-display:block;font-size:120px;color:black;text-align:center">Thank You</p>

             </div>
                                        </div>
         </div>



</asp:Content>
