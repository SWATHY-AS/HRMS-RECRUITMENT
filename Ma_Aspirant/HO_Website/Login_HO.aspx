<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login_HO.aspx.cs" Inherits="Ma_Aspirant.Login_HO" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
   <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0" />
    <title>Manappuram AppSuite</title>
    <link rel="icon" type="image/png" sizes="16x16" href="../App_Themes/Theme/assets/img/favicon-16x16.png"/>
    <link href="../App_Themes/Theme/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="../App_Themes/Theme/assets/css/main.css" rel="stylesheet" type="text/css" />
    <link href="../App_Themes/Theme/assets/css/plugins.css" rel="stylesheet" type="text/css" />
    <link href="../App_Themes/Theme/assets/css/responsive.css" rel="stylesheet" type="text/css" />
    <link href="../App_Themes/Theme/assets/css/icons.css" rel="stylesheet" type="text/css" />
    <link href="../App_Themes/Theme/assets/css/login.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="../App_Themes/Theme/assets/css/fontawesome/font-awesome.min.css"/>
    <!--[if IE 7]><link rel="stylesheet" href="assets/css/fontawesome/font-awesome-ie7.min.css"><![endif]-->
    <!--[if IE 8]><link href="assets/css/ie8.css" rel="stylesheet" type="text/css"/><![endif]-->
   
    <script type="text/javascript" src="../App_Themes/Theme/assets/js/libs/jquery-1.10.2.min.js"></script>
    <script type="text/javascript" src="../App_Themes/Theme/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="../App_Themes/Theme/assets/js/libs/lodash.compat.min.js"></script>
    <!--[if lt IE 9]><script src="assets/js/libs/html5shiv.js"></script><![endif]-->
    <script type="text/javascript" src="../App_Themes/Theme/plugins/uniform/jquery.uniform.min.js"></script>
    <script type="text/javascript" src="../App_Themes/Theme/plugins/validation/jquery.validate.min.js"></script>
    <script type="text/javascript" src="../App_Themes/Theme/plugins/nprogress/nprogress.js"></script>
    <script type="text/javascript" src="../App_Themes/Theme/assets/js/loginHO.js"></script>
    
    <script>$(document).ready(function () { Login.init() });</script>
    <script type = "text/javascript" >
        javascript: window.history.forward(1);
</script>
        <script>          //disable rightclick
            window.oncontextmenu = function () {
                return false;
            }
</script>
 
</head>
<body class="login">

       
    <div class="logo">
        <img src="../App_Themes/Theme/assets/img/manappuram_50.png" alt="logo" />
    </div>
    <div class="box">
        <div class="content">
            <form id="Form1" class="form-vertical login-form" runat ="server" >
                <h3 class="form-title">Sign In to your Account</h3>
                <div class="alert fade in alert-danger" style="display: none;"><i class="icon-remove close" data-dismiss="alert"></i>Fields can not be blank! </div>
                <div class="form-group">
                    <div class="input-icon">
                        <i class="icon-phone"></i>
                        <input type="text" name="usernumber" id="usernumber" style="border-radius:8px" class="form-control" placeholder="Mobile Number" autofocus="autofocus" data-rule-required="true" runat="server" data-msg-required="Please enter your registered mobile number." />
                        <br />
                              <div class="input-icon">
                        <i class="icon-user"></i>
                        <input type="text" name="candcode" id="txt_candcode" style="border-radius:8px" class="form-control" placeholder="Application ID" autofocus="autofocus" data-rule-required="true" runat="server" data-msg-required="Please enter your Application ID." />
                         <%--<button type="button" id="btn_createotp"  class="btn btn-danger pull-left" style="border-radius:8px" width="3px">  <span class="glyphicon glyphicon-phone"> CREATE <b>OTP</b></span>    </button>--%>
                    </div>
                          <asp:TextBox ID="txt_session" runat="server" hidden="hidden" ></asp:TextBox>

                         </div>
                </div>
            
                
                <div class="form-group">
                    <div class="input-icon">
                        <i class="icon-lock"></i>
                        <input type="password" disabled="disabled" style="border-radius:8px" name="password" id="password" class="form-control" placeholder="OTP" data-rule-required="true" data-msg-required="Please enter valid OTP." onchange="genOTP();" />
                    </div>
                </div>
                <div class="form-actions">                  
                    <asp:Button ID="btn_login"   class="ma-btn" Cssclass="submit btn-lg btn-info pull-right"  runat="server" Text="Proceed"  Font-Bold="True" />
                   <%-- <button type="submit" runat="server" class="submit btn btn-primary pull-right">Sign In <i class="icon-angle-right"></i></button>--%>
                </div>
            </form>
            



        </div>
        
    </div>
</body>
</html>

