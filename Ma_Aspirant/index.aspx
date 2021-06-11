<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="Ma_Aspirant.index" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>JQuery HTML5 QR Code Scanner using Instascan JS Example - Manappuram</title>
<%--<script type="text/javascript" src="../App_Themes/Theme/Scanner/jquery.min.js"></script>
	<script type="text/javascript" src="../App_Themes/Theme/Scanner/scanner.js"></script>--%>
    <script type="text/javascript" src="../App_Themes/Theme/assets/js/scanner.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <h1>JQuery HTML5 QR Code Scanner using Instascan JS Example - Manappuram.com</h1>
    
    <video id="preview"></video>
    <script type="text/javascript">
        let scanner = new Instascan.Scanner({
            video: document.getElementById('preview') });
      scanner.addListener('scan', function (content) {
        alert(content);
      });
      Instascan.Camera.getCameras().then(function (cameras) {
        if (cameras.length > 0) {
          scanner.start(cameras[0]);
        } else {
          console.error('No cameras found.');
        }
      }).catch(function (e) {
        console.error(e);
      });
    </script>
</asp:Content>
