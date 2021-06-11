<%@ Page Title="" Language="C#" MasterPageFile="~/Main_HO.Master" AutoEventWireup="true" CodeBehind="Job_Search.aspx.cs" Inherits="Ma_Aspirant.HO_Website.Job_Search" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="../App_Themes/Theme/assets/js/op_ho.js"></script>
    <script>
   $(window).load(function () {
     //alert("load");
    table_load();
   });
        </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="row ">
        <div class="ma-header">
              <div class="col-md-12">
         <h3 style="color: #091221"><span class="glyphicon glyphicon-zoom-in"></span> CURRENT OPENING</h3>
                  </div>
           </div>
     </div>
    <br />
     <br />
     <br />

 <%--  <table class="table table-bordered">
  <thead class="theme-dark" >
    <tr class="alert-success">
      <th scope="col" >S.No</th>
      <th scope="col">Position</th>
      <th scope="col">Department</th>
      <th scope="col">Apply</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th scope="row">1</th>
      <td>Mark</td>
      <td>Otto</td>
      <td>@mdo</td>
    </tr>
  </tbody>
</table>--%>
    <div class="ibox-content"  id="tbl_q1">
                         
                            <div class="ibox-table">
                                <div class="table-responsive">
                                    <table class="responsive-table table-striped table-bordered table-hover align-center table table-striped" id="tbl_emp" style="width:1000px;">
                                <thead style="color: white; grid-row-align:center;background-color:#686b6b" class="thead-light">
                                    <tr style="height:30px;font-size:x-small;text-align:center" >
                                                <th data-class="expand" class="text-center"  scope="col">POSITION</th>
                                        <th class="text-center" scope="col">GRADE</th>                                               
                                        <th class="text-center" scope="col">DEPARTMENT</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            
                                        </tbody>
                                    </table>
                                </div>
                                  
                            </div>
                        </div>

</asp:Content>
