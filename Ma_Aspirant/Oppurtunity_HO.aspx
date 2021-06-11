<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Oppurtunity_HO.aspx.cs" Inherits="Ma_Aspirant.Oppurtunity_HO" %>

<!DOCTYPE html>

   <html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
     <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0" />
    <title data-ng-bind="pageTitle()">Manappuram Aspirant</title>

    <script src="App_Themes/Theme/assets/js/libs/jquery-latest.js"></script>
    <script src="App_Themes/Theme/assets/js/libs/angular.min.js"></script>
    <link rel="icon" type="image/png" sizes="16x16" href="App_Themes/Theme/assets/img/favicon-16x16.png" />
    <link href="App_Themes/Theme/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <!--[if lt IE 9]><link rel="stylesheet" type="text/css" href="plugins/jquery-ui/jquery.ui.1.10.2.ie.css"/><![endif]-->
    <link href="App_Themes/Theme/assets/css/main.css" rel="stylesheet" type="text/css" />
    <link href="App_Themes/Theme/assets/css/mana.css" rel="stylesheet" type="text/css" />
    <link href="App_Themes/Theme/assets/css/plugins.css" rel="stylesheet" type="text/css" />
    <link href="App_Themes/Theme/assets/css/responsive.css" rel="stylesheet" type="text/css" />
    <link href="App_Themes/Theme/assets/css/icons.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="App_Themes/Theme/assets/css/fontawesome/font-awesome.min.css" />
    <!--[if IE 7]><link rel="stylesheet" href="assets/css/fontawesome/font-awesome-ie7.min.css"><![endif]-->
    <!--[if IE 8]><link href="assets/css/ie8.css" rel="stylesheet" type="text/css"/><![endif]-->
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,600,700' rel='stylesheet' type='text/css' />
    <!--Commented-->

    <!-- jQuery -->
    <script type="text/javascript" src="App_Themes/Theme/assets/js/libs/jquery-1.10.2.min.js"></script>

    <script type="text/javascript" src="App_Themes/Theme/plugins/jquery-ui/jquery-ui-1.10.2.custom.min.js"></script>
    <script type="text/javascript" src="App_Themes/Theme/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="App_Themes/Theme/assets/js/libs/lodash.compat.min.js"></script>
    <!--[if lt IE 9]><script src="assets/js/libs/html5shiv.js"></script><![endif]-->
    <script type="text/javascript" src="App_Themes/Theme/plugins/touchpunch/jquery.ui.touch-punch.min.js"></script>
    <script type="text/javascript" src="App_Themes/Theme/plugins/event.swipe/jquery.event.move.js"></script>
    <script type="text/javascript" src="App_Themes/Theme/plugins/event.swipe/jquery.event.swipe.js"></script>
    <script type="text/javascript" src="App_Themes/Theme/assets/js/libs/breakpoints.js"></script>
    <script type="text/javascript" src="App_Themes/Theme/plugins/respond/respond.min.js"></script>
    <script type="text/javascript" src="App_Themes/Theme/plugins/cookie/jquery.cookie.min.js"></script>
    <script type="text/javascript" src="App_Themes/Theme/plugins/slimscroll/jquery.slimscroll.min.js"></script>
    <script type="text/javascript" src="App_Themes/Theme/plugins/slimscroll/jquery.slimscroll.horizontal.min.js"></script>
    <!--[if lt IE 9]><script type="text/javascript" src="plugins/flot/excanvas.min.js"></script><![endif]-->
    <script type="text/javascript" src="App_Themes/Theme/plugins/sparkline/jquery.sparkline.min.js"></script>
    <script type="text/javascript" src="App_Themes/Theme/plugins/flot/jquery.flot.min.js"></script>
    <script type="text/javascript" src="App_Themes/Theme/plugins/flot/jquery.flot.tooltip.min.js"></script>
    <script type="text/javascript" src="App_Themes/Theme/plugins/flot/jquery.flot.resize.min.js"></script>
    <script type="text/javascript" src="App_Themes/Theme/plugins/flot/jquery.flot.time.min.js"></script>
    <script type="text/javascript" src="App_Themes/Theme/plugins/flot/jquery.flot.growraf.min.js"></script>
    <script type="text/javascript" src="App_Themes/Theme/plugins/easy-pie-chart/jquery.easy-pie-chart.min.js"></script>
    <script type="text/javascript" src="App_Themes/Theme/plugins/daterangepicker/moment.min.js"></script>
    <script type="text/javascript" src="App_Themes/Theme/plugins/daterangepicker/daterangepicker.js"></script>
    <script type="text/javascript" src="App_Themes/Theme/plugins/blockui/jquery.blockUI.min.js"></script>
    <script type="text/javascript" src="App_Themes/Theme/plugins/fullcalendar/fullcalendar.min.js"></script>
    <script type="text/javascript" src="App_Themes/Theme/plugins/noty/jquery.noty.js"></script>
    <script type="text/javascript" src="App_Themes/Theme/plugins/noty/layouts/top.js"></script>
    <script type="text/javascript" src="App_Themes/Theme/plugins/noty/themes/default.js"></script>
    <script type="text/javascript" src="App_Themes/Theme/plugins/uniform/jquery.uniform.min.js"></script>
    <script type="text/javascript" src="App_Themes/Theme/plugins/select2/select2.min.js"></script>
    <script type="text/javascript" src="App_Themes/Theme/assets/js/demo/form_components.js"></script>
    <script type="text/javascript" src="App_Themes/Theme/plugins/validation/jquery.validate.min.js"></script>

    <script type="text/javascript" src="App_Themes/Theme/plugins/validation/additional-methods.min.js"></script>
    <script type="text/javascript" src="App_Themes/Theme/plugins/pickadate/picker.js"></script>
    <script type="text/javascript" src="App_Themes/Theme/plugins/pickadate/picker.date.js"></script>
    <script type="text/javascript" src="App_Themes/Theme/plugins/pickadate/picker.time.js"></script>
    <script type="text/javascript" src="App_Themes/Theme/plugins/bootstrap-colorpicker/bootstrap-colorpicker.min.js"></script>
    <script type="text/javascript" src="App_Themes/Theme/plugins/tagsinput/jquery.tagsinput.min.js"></script>
    <script type="text/javascript" src="App_Themes/Theme/plugins/fileinput/fileinput.js"></script>
    <script type="text/javascript" src="App_Themes/Theme/plugins/duallistbox/jquery.duallistbox.min.js"></script>
    <script type="text/javascript" src="App_Themes/Theme/plugins/bootstrap-inputmask/jquery.inputmask.min.js"></script>
    <script type="text/javascript" src="App_Themes/Theme/plugins/bootstrap-wysihtml5/wysihtml5.min.js"></script>
    <script type="text/javascript" src="App_Themes/Theme/plugins/bootstrap-wysihtml5/bootstrap-wysihtml5.min.js"></script>
    <script type="text/javascript" src="App_Themes/Theme/plugins/bootstrap-multiselect/bootstrap-multiselect.min.js"></script>
    <script type="text/javascript" src="App_Themes/Theme/plugins/bootstrap-switch/bootstrap-switch.min.js"></script>
    <script type="text/javascript" src="App_Themes/Theme/plugins/globalize/globalize.js"></script>
    <script type="text/javascript" src="App_Themes/Theme/plugins/globalize/cultures/globalize.culture.de-DE.js"></script>
    <script type="text/javascript" src="App_Themes/Theme/plugins/globalize/cultures/globalize.culture.ja-JP.js"></script>
    <script type="text/javascript" src="App_Themes/Theme/plugins/typeahead/typeahead.min.js"></script>
    <script type="text/javascript" src="App_Themes/Theme/plugins/autosize/jquery.autosize.min.js"></script>
    <script type="text/javascript" src="App_Themes/Theme/plugins/inputlimiter/jquery.inputlimiter.min.js"></script>
    <script type="text/javascript" src="App_Themes/Theme/plugins/nprogress/nprogress.js"></script>  
    <script type="text/javascript" src="App_Themes/Theme/assets/js/app.js"></script>
    <script type="text/javascript" src="App_Themes/Theme/assets/js/plugins.js"></script>
    <script type="text/javascript" src="App_Themes/Theme/assets/js/plugins.form-components.js"></script>
    <script>$(document).ready(function () { App.init(); Plugins.init(); FormComponents.init() });</script>
    <script type="text/javascript" src="App_Themes/Theme/assets/js/custom.js"></script>
    <script type="text/javascript" src="App_Themes/Theme/assets/js/demo/pages_calendar.js"></script>
    <script type="text/javascript" src="App_Themes/Theme/assets/js/demo/form_validation.js"></script>
    <script type="text/javascript" src="../App_Themes/Theme/assets/js/demo/ui_general.js"></script>
    <script type="text/javascript" src="App_Themes/Theme/assets/js/demo/charts/chart_filled_blue.js"></script>
    <script type="text/javascript" src="App_Themes/Theme/assets/js/demo/charts/chart_simple.js"></script>
    <script src="App_Themes/Theme/assets/js/op_ho.js"></script>
    <script>
    $(window).load(function () {
    // alert("load");
    GetAllProperties();
});
        </script>
    
  <%-- <script>
   history.pushState(null, null, 'no-back-button');
window.addEventListener('popstate', function(event) {
  history.pushState(null, null, 'no-back-button');
});</script>--%>
        <script>
            function __doPostBack(eventTarget, eventArgument) {
                document.Form1.__EVENTTARGET.value = eventTarget;
                document.Form1.__EVENTARGUMENT.value = eventArgument;
                document.Form1.submit();
            }
            
            </script>

            <script>
                window.oncontextmenu = function () {
                    return false;
                }
                //67 c,86 v,85 u,117 f6
                document.onkeydown = function (e) {
                    if (e.ctrlKey &&
                        //(e.keyCode === 67 ||    
                        // e.keyCode === 86 ||
                        // e.keyCode === 85 || e.keyCode === 117
                        //))
                        (e.keyCode === 85)) {
                        return false;
                    } else {
                        return true;
                    }
                };



</script>

</head>
<body>
      <header class="header navbar navbar-fixed-top" role="banner">
            <div style="background-color: #ffd802;" class="container">
               
              
                <div class="navbar-brand">
                    <img src="App_Themes/Theme/assets/img/thumbnail_image001.png" alt="logo" style="width: 76%; height: 100%;padding-left:20px" />

                </div>
           
            </div>
   
        </header>

        <div id="container" style="background-color:#d8d8d8; background-position: center; opacity: 0.8;" >        
            
          <form id="Form1" class="form-horizontal row-border" action="#" runat="server">                        
        <div class="row" >
           <div class="widget-content">
                                <div class="panel-group" id="accordion">
                                    <div class="panel panel-default">
                                        <div class="panel-heading">
                                            <h2 class="ma-title"><a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" id="L_post_name"></a></h2>
                                        </div>
                                  
                                        <div id="collapseOne" class="panel-collapse collapse in">
                                            <div class="panel-body">                                           
                           <div class="col-md-8">
                                <div class="form-group col-md-12">
                                                                 <asp:TextBox ID="txt_id" runat="server" hidden="hidden" ></asp:TextBox>
                                        <asp:TextBox ID="txt_br" runat="server" hidden="hidden" ></asp:TextBox>
                             <label class="col-md-2 cntr-text-op">Job Opening Date:</label>
                              <div class="col-md-6">
                                    <label class="cntr-text-op1" id="lbl_date"></label>
                                 </div>                                                             
                              <label class="col-md-2 cntr-text-op">Job Code:</label>
                            <div class="col-md-2"> 
                                  <%--<label class="cntr-text-op1" id="lbl_brcount">TD-101</label>--%>
                                <label class="cntr-text-op1" id="lbl_Jobcode"></label>
                                    </div>
                                    </div> 

                                <div class="form-group col-md-12">
                                        <asp:TextBox ID="TextBox1" runat="server" hidden="hidden" ></asp:TextBox>
                             <label class="col-md-2 cntr-text-op">Experience:</label>
                              <div class="col-md-6">
                                    <label class="cntr-text-op1" id="Lbl_exp"></label>
                                 </div>                                                         
                              <label class="col-md-2 cntr-text-op">Department:</label>
                            <div class="col-md-2"> 
                                  <label class="cntr-text-op1" id="lbl_dep"></label>
                                    </div>
                                    </div> 
                              <div class="form-group col-md-12">
                                  <label class="col-md-2 cntr-text-op">Location:</label>
                              <div class="col-md-6 cntr-text-op" id="lbl_location" style="color:black";>
                                </div>                                                         
                              <label class="col-md-2 cntr-text-op">Minimum Qualification:</label>
                            <div class="col-md-2"> 
                                <label class="cntr-text-op" style="color:black" id="lbl_minqual"></label>
                            </div>
                                  </div>    
                               <div class="form-group col-md-12">
                                        <asp:TextBox ID="TextBox2" runat="server" hidden="hidden" ></asp:TextBox>
                             <label class="col-md-2 cntr-text-op">No Of Vacancies :</label>
                              <div class="col-md-6">
                                    <label class="cntr-text-op1" id="lbl_vacancy"></label>
                                 </div>                                                         
                              <label class="col-md-2 cntr-text-op">Skills :</label>
                            <div class="col-md-2"> 
                                  <label class="cntr-text-op1" id="lbl_skils"></label>
                                    </div>
                                    </div> 
                              <%-- --------------------------------------%>
                                 <%--<div class="form-group col-md-12">
                                 <label class="col-md-2 cntr-text-op">Qualification Type:</label>
                              <div class="col-md-6" >
                                    <select class="form-group" id="cmp_typeq" >
                              <option value="0" selected="selected">--SELECT QUALIFICATION TYPE--</option>
                                          <option value="2">POST GRADUATE</option>
                                          <option value="3" >GRADUATE</option>

                                                </select>
                                 </div> 

                              
                                     </div>--%>


                                 </div>
                                                                  <div class="form-group col-md-12">
                                     <span class="col-md-3"></span> 
                                        <label class="col-md-9 cntr-text-op"><h4>Entitlements</h4> </label>
                                   <span class="col-md-2"></span>   
                           
                                 <div class="form-group col-md-10" >
                                      <label class="col-md-2" style="color:darkred;" >CTC Range: </label>
                                  <label class="col-md-10" style="color:black;text-align:left" id="lbl_bsalary"></label>
                                   <label class="col-md-2" style="color:darkred;" >Other Benefits: </label>
                                  <label class="col-md-10" id="lbl_benifit" style="color:black;text-align:left" ></label>
                                      <label class="col-md-2" style="color:darkred;" >Accommodation: </label>
                                  <label class="col-md-10" id="lbl_accomdation" style="color:black;text-align:left" > </label>
                                    </div>

                                 </div>
                                                
                                <button class="btn btn-danger button3 col-md-1" style="border-radius:25px;width:160px;" type="button" onclick="getNextPage()">
        <b style="font-family:OpenSans;font-weight:bolder;font-size:14px;">Apply Now <span class="glyphicon glyphicon-hand-right"></span></b> 
       </button>

                               <%--  Entitlements------------------------%>
                                  <div class="col-md-12">
                                      <%-- <div class="ma-header align-center">
                                
                                    <h4 style="color: darkblue"><i class="icon-money"></i> ENTITLEMENT</h4>
                                
                            </div>--%>
                             <%-- <div class="form-group col-md-12">
                             <label class="col-md-2 cntr-text-op1">QUALIFICATION TYPE:</label>
                              <div class="col-md-2" >
                                    <select class="form-group" id="cmp_typeq" >
                              <option value="-1" selected="selected">--SELECT QUALIFICATION TYPE--</option>
                                          <option value="2">POST GRADUATE</option>
                                          <option value="3" >GRADUATE</option>

                                                </select>--%>
                                 </div>    
                               <%--   <label class="col-md-2 cntr-text-op1 align-right">STATE</label>
                              <div class="col-md-2">
                                    <select class="select2-select-00  full-width-fix align-left" id="cmp_state" >
                              <option value="-1" selected="selected">--SELECT STATE--</option>                                         

                                                </select>
                                 </div> 
                                     <label class="col-md-2 cntr-text-op1">DISTRICT</label>
                              <div class="col-md-2">
                                    <select class="select2-select-00  full-width-fix align-left" id="cmp_dist" >
                              <option value="-1" selected="selected">--SELECT DISTRICT--</option>                                         

                                                </select>
                                 </div> --%>

                                 <%-- <label class="col-md-2 cntr-text-op1">Basic Salary:</label>
                            <div class="col-md-2"> 
                                  <label class="cntr-text-op1" id="lbl_bsalary">0</label>
                                    </div>
                            --%>
                                    </div> 
                              
                                     <%--<button class="btn btn-danger button3 col-md-1" style="border-radius:25px;width:160px;" type="button" onclick="getpage()">
        <b style="font-family:OpenSans;font-weight:bolder;font-size:14px;">Apply Now <span class="glyphicon glyphicon-hand-right"></span></b> 
       </button>     --%>
                           </div>

                                <%--  -----------------------------------------------------------------------------------------------%>
            
                                      <%--      </div>
                                        </div>
                                    </div>--%>
      
                                 <%--   <div class="panel panel-default">
                                        <div class="panel-heading">
                                            <h2 class="ma-title"><a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo">Angular Developer </a></h2>
                                        </div>
                                        <div id="collapseTwo" class="panel-collapse collapse">
                                            <div class="panel-body">
                                   <div class="col-md-8">
                                <div class="form-group col-md-12">
                             <label class="col-md-2 cntr-text-op" >Branch:</label>
                              <div class="col-md-6">
                                    <label class="cntr-text-op1" id="lbl_brname1"></label>
                                 </div>                                                         
                              <label class="col-md-2 cntr-text-op">Vaccancy:</label>
                            <div class="col-md-2"> 
                                  <label class="cntr-text-op1" id="lbl_hkcount">0</label>
                                    </div>
                                    </div> 
                              <div class="form-group col-md-12">
                             <label class="col-md-2 cntr-text-op">Age Limit:</label>
                              <div class="col-md-6 cntr-text-op" style="color:black;"> 18 - 30
                                </div>                                                         
                              <label class="col-md-2 cntr-text-op">Minimum Qualification:</label>
                            <div class="col-md-2"> 
                                <label class="cntr-text-op1">Matriculation</label>
                            </div>
                                   </div>
                                      
                                          
                                         
                          
                                        </div>
                                                  
                                    <%--  <div class="row">--%>
                                        <%--        <div class="form-group col-md-12">
                                     <span class="col-md-3"></span> 
                                        <label class="col-md-9 cntr-text-op"><h4>Entitlements</h4> </label>
                                   <span class="col-md-2"></span>   
                           
                                 <div class="form-group col-md-10" >
                                      <label class="col-md-2" style="color:darkred;" >Basic: </label>
                                  <label class="col-md-10" style="color:black;text-align:left" id="lbl_hsalary">0</label>
                                   <label class="col-md-2" style="color:darkred;" >Other Benefits: </label>
                                  <label class="col-md-10" style="color:black;text-align:left" >PF,ESI,Gratuity,Insurance,EDLI,(City,Metro,Outstation etc.) Allowances etc.</label>
                                      <label class="col-md-2" style="color:darkred;" >Accommodation: </label>
                                  <label class="col-md-10" style="color:black;text-align:left" >Free for bachelors from far places. </label>
                                    </div>
                                                    
                                      
                                   

                                 </div>
                                  
                                                   
                                            
                                  
                                                </br >
    <button class="btn btn-danger button3 col-md-1" style="border-radius:25px;width:160px;" type="button" onclick="getpage2()">
        <b style="font-family:OpenSans;font-weight:bolder;font-size:14px;">Apply Now <span class="glyphicon glyphicon-hand-right"></span></b> 
       </button> --%>

                                    </div>
                                  
                                </div>
                            </div>

         
       </div>
                       
           </form>     
                      
        </div>
</body>
</html>
