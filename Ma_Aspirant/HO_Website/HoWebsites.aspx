<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="HoWebsites.aspx.cs" Inherits="Ma_Aspirant.HO_Website.HoWebsites" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
        <%--<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0" />--%>


 <link href="App_Themes/Theme/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />

 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.csss"/>
 <link href="App_Themes/Theme/assets/css/plugins.css" rel="stylesheet" type="text/css" />
  <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        
    <link href="App_Themes/Theme/assets/css/main.css" rel="stylesheet" type="text/css" />
    <link href="App_Themes/Theme/assets/css/plugins.css" rel="stylesheet" type="text/css" />
    <link href="App_Themes/Theme/assets/css/responsive.css" rel="stylesheet" type="text/css" />
    <link href="App_Themes/Theme/assets/css/icons.css" rel="stylesheet" type="text/css" />
    <link href="App_Themes/Theme/assets/css/login.css" rel="stylesheet" type="text/css" />

</asp:Content> 
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   
    <div class="container">
        <div class="ma-header col-md-10">
                  <div class="text-center">
                     <h2>APPLICATION Form</h2>
                       <br/>
          <br/>
     </div>

        <form>
  <div class="form-row">
    <div class="form-group col-md-6">
      <label for="txt_firstname">First Name</label>
      <input type="text" class="form-control" id="txt_firstname" placeholder="First Name" />
    </div>
    <div class="form-group col-md-6">
      <label for="txt_lastname">Last Name</label>
      <input type="text" class="form-control" id="txt_lastname" placeholder="Last Name" />
    </div>
       <div class="form-group col-md-6">
      <label for="inputEmail">Email</label>
      <input type="email" class="form-control" id="inputEmail" placeholder="Email" />
    </div>
  <div class="form-group col-md-6">
      <label for="txt_contact">Contact Number</label>
      <input type="text" class="form-control" id="txt_contact" placeholder="Contact Name" />
    </div>

      <div class="form-group col-md-12">
    <label for="inputAddress">Address</label>
    <textarea class="form-control" id="inputAddress" rows="2" placeholder="Enter Address"></textarea>  
      </div>

      <div class="form-group col-md-4">
      <label for="txt_Qualification">Enter Highest Qualification</label>
      <input type="text" class="form-control" id="txt_Qualification" placeholder="Qualification" />
    </div>

        <div class="form-group col-md-4">
      <label for="txt_city">Pin code</label>
      <input type="text" class="form-control" id="Text1" placeholder="Enter Pin code" />
    </div>

       <div class="form-group col-md-4">
      <label for="txt_post">Post Apply for</label>
      <input type="text" class="form-control" id="txt_post" placeholder="Post Apply for" />
    </div>

        <div class="form-group col-md-4">
      <label for="txt_city">City</label>
      <input type="text" class="form-control" id="txt_city" placeholder="City" />
    </div>

       <div class="form-group col-md-4">
      <label for="txt_district">District</label>
      <input type="text" class="form-control" id="txt_district" placeholder="District" />
    </div>

       <div class="form-group col-md-4">
      <label for="txt_state">State</label>
      <input type="text" class="form-control" id="Text2" placeholder="Sate" />
    </div>

      <div class="form-group">
    <label for="exampleFormControlFile1">Upload Resume</label>
    <input type="file" class="form-control-file" id="exampleFormControlFile1">
  </div>
  </div>
   
 
  
   
  <div class="form-group">
   
  </div>
  <button type="submit" class="btn btn-primary">Submit</button>
</form>    
        
  </div> 

        </div>

</asp:Content>
