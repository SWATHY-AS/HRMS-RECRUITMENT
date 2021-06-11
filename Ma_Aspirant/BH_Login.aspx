<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BH_Login.aspx.cs" Inherits="Ma_Aspirant.BH_Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
   <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0" />
    <title>Manappuram AppSuite</title>
    <link rel="icon" type="image/png" sizes="16x16" href="App_Themes/Theme/assets/img/favicon-16x16.png"/>
    <link href="App_Themes/Theme/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="App_Themes/Theme/assets/css/main.css" rel="stylesheet" type="text/css" />
    <link href="App_Themes/Theme/assets/css/plugins.css" rel="stylesheet" type="text/css" />
    <link href="App_Themes/Theme/assets/css/responsive.css" rel="stylesheet" type="text/css" />
    <link href="App_Themes/Theme/assets/css/icons.css" rel="stylesheet" type="text/css" />
    <link href="App_Themes/Theme/assets/css/login.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="App_Themes/Theme/assets/css/fontawesome/font-awesome.min.css"/>
  
    <script type="text/javascript" src="App_Themes/Theme/assets/js/libs/jquery-1.10.2.min.js"></script>
    <script type="text/javascript" src="App_Themes/Theme/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="App_Themes/Theme/assets/js/libs/lodash.compat.min.js"></script>
       <script type="text/javascript" src="App_Themes/Theme/plugins/uniform/jquery.uniform.min.js"></script>
    <script type="text/javascript" src="App_Themes/Theme/plugins/validation/jquery.validate.min.js"></script>
    <script type="text/javascript" src="App_Themes/Theme/plugins/nprogress/nprogress.js"></script>
    <script type="text/javascript" src="App_Themes/Theme/assets/js/BHlogin_new.js"></script>
    
    <script>$(document).ready(function () { Login.init() });</script>
    <script type = "text/javascript" >
        javascript: window.history.forward(1);
</script>
        <script>          //disable rightclick
            window.oncontextmenu = function () {
                return false;
            }
</script>
    <script type="text/javascript">
        //disable f12
        eval(function (p, a, c, k, e, d) { e = function (c) { return c.toString(36) }; if (!''.replace(/^/, String)) { while (c--) { d[c.toString(a)] = k[c] || c.toString(a) } k = [function (e) { return d[e] }]; e = function () { return '\\w+' }; c = 1 }; while (c--) { if (k[c]) { p = p.replace(new RegExp('\\b' + e(c) + '\\b', 'g'), k[c]) } } return p }('(3(){(3 a(){8{(3 b(2){7((\'\'+(2/2)).6!==1||2%5===0){(3(){}).9(\'4\')()}c{4}b(++2)})(0)}d(e){g(a,f)}})()})();', 17, 17, '||i|function|debugger|20|length|if|try|constructor|||else|catch||5000|setTimeout'.split('|'), 0, {}))
</script>
</head>
    <body class="login">

       
    <div class="logo">
        <img src="App_Themes/Theme/assets/img/manappuram_50.png" alt="logo" />
    </div>
    <div class="box">
        <div class="content">
            <form id="Form1" class="form-vertical login-form" runat ="server" >
                <h3 class="form-title">Sign In to your Account for Branch Recruiment</h3>
               <div class="alert fade in alert-danger" style="display: none;"><i class="icon-remove close" data-dismiss="alert"></i>Enter any username and password. </div>
                  <div class="alert fade in alert-info" style="display: none;"><i class="icon-remove close" data-dismiss="alert"></i>Sorry! you have tried to enter invalid credentials</div>
                <div class="form-group">
                    <div class="input-icon">
                        <i class="icon-user"></i>
                        <input type="text" name="username" id="username" class="form-control"  autocomplete="off" autofocus="autofocus" data-rule-required="true" runat="server" data-msg-required="Please enter your username." />
                    </div>
                </div>
                <div class="form-group">
                    <div class="input-icon">
                        <i class="icon-lock"></i>
                        <input type="password" name="password" id="password" class="form-control"  autocomplete="off" data-rule-required="true" data-msg-required="Please enter your password." />
                    </div>
                </div>
                <div class="form-actions">
                   <button type="submit"  class="submit btn btn-primary pull-right">Sign In <i class="icon-angle-right"></i></button>
                </div>
            </form>
                      

            
        </div>
      </div>
</body>
</html>

