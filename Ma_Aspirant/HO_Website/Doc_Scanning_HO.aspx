<%@ Page Title="" Language="C#" MasterPageFile="~/Main_HO.Master" AutoEventWireup="true" CodeBehind="Doc_Scanning_HO.aspx.cs" Inherits="Ma_Aspirant.Recruitment.Doc_Scanning_HO" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
  

    
   
   
    <script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>
    <script type='text/javascript'>
     
        function IsAlphaNumeric(e) {
            try {
                if (window.event) {
                    var charCode = window.event.keyCode;
                }
                else if (e) {
                    var charCode = e.which;
                }
                else { return true; }
                if (!((charCode >= 0 && charCode <= 31) || (charCode >= 91 && charCode <= 96) || (charCode >= 123 && charCode <= 127)) || (charCode == 8) || (charCode == 32))
                    return true;
                else
                    return false;
            }
            catch (err) {
                alert(err.Description);
            }
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
        function leftTrim(element) {
            if (element)
                element.value = element.value.replace(/^\s+/, "");
        }
        function emp_upload() {
            var empid = $("[id*=txt_session]").val();
             $("#tbldoc").show();
             $("#tbl_doc tbody").empty();
                                $.ajax({
                                    type: "POST",
                                    contentType: "application/json; charset=utf-8",
                                    url: "Doc_Scanning_HO.aspx/get_doc_dtl",
                                    data: "{input:'" + empid + "'}",
                                    dataType: "json",
                                    success: function (Result) {                                      
                         
                            for (var i = 0; i < Result.d.length; i++) {
                                $("#tbl_doc tbody").append('<tr> <td>' + Result.d[i].doctyp + '</td>' +
                                          '<td>' + Result.d[i].child1  + '</td></tr>');
                            }
                        },
                        error: function (Result) {
                        }
                    });
        }
        $(window).load(function () {
            check_tab();
            document1();

            //27 may change
            //emp_upload();
            empdoc();
        });



        function check_tab() {

            var empid = $("[id*=txt_session]").val();
            $.ajax({                ///university
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "Doc_Scanning_HO.aspx/get_form",
                data: "{ input : '" + empid + "' }",
                dataType: "json",
                success: function (Result) {
                    Result = Result.d;

                    //  alert(Result);
                    if (Result == "222") {
                        alert("Please fill Reference details");
                        window.open("../HO_Website/Reference_per_HO.aspx", "_self");
                    }
                },
                error: function (Result) {

                }
            });
        }

        function document1() {
         
            var empid ;
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "Doc_Scanning_HO.aspx/doc_dtl_view",
                data: {},
                dataType: "json",
                success: function (Result) {
                    Result = Result.d;
                    $.each(Result, function (key, value) {
                        $("#dd_doc1").append($("<option></option>").val
                                  (value.docid).html(value.doc_name));
                    });
                    $("#dd_doc1").change(function () {
                        var sid = $("#dd_doc1").val();
                        $("#dd_doc2").empty();
                        $("#dd").hide();

                        $.ajax({
                            type: "POST",
                            contentType: "application/json; charset=utf-8",
                            url: "Doc_Scanning_HO.aspx/doc_parent", // 
                            data: "{input:'" + sid + "'}",
                            dataType: "json",
                            success: function (Result) {
                                res = Result.d;
                                if (res > 0)
                                {
                                    $("#dd").show();
                                    
                                    $.ajax({
                                        type: "POST",
                                        contentType: "application/json; charset=utf-8",
                                        url: "Doc_Scanning_HO.aspx/doc_dtl_view1", // 
                                        data: "{input:'" + sid + "'}",
                                        dataType: "json",
                                        success: function (Result) {
                                            Result = Result.d;
                                            $.each(Result, function (key, value) {
                                                $("#dd_doc2").append($("<option></option>").val
                                                          (value.docid1).html(value.doc_name1));
                                            });
                                        }
                                    });
                                }
                            }
                        });
                     

                    });
                }
            });
        }

        function getemp_detail()
           
        {
            debugger;
            //alert('Yes');
            var empid = $("[id*=txt_session]").val();
           //    alert(empid);
            debugger;
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "Doc_Scanning_HO.aspx/Get_Emp_detail",
                data: "{input:'" + empid + "'}",
                //url: "../HO_Website/Doc_Scanning_HO.aspx/doc_dtl_view1", // 
                //data: "{input:'" + empid + "'}",
                dataType: "json",
                success: function (Result) {
                    Result = Result.d;
                   
                    number = Result;
                    //alert(number+"SMS");
                    debugger;
                    $.ajax({
                        type: "POST",
                        contentType: "application/json; charset=utf-8",
                        url: "Doc_Scanning_HO.aspx/sendOTPfn_mail", // send sms
                        data: "{input:'" + number + "'}",
                        dataType: "json",
                        success: function (Result) {
                            Result = Result.d;
                            //alert(Result);
                            sendsms(number);
                        }
                    });
                  
                },
                error: function (Result) {

                }
            });
        }

        function sendsms(value) {
            debugger;
            //alert('hi' + value);
            var d3 = value.split("~");
           
            var name = d3[1];
            var mnumber =d3[2]
            
            var empid = $("[id*=txt_session]").val();
            //alert("empid" + empid);
            debugger;

            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "Doc_Scanning_HO.aspx/sendsms_maill",
                data: "{input:'" + name + "',numb:'" + mnumber + "'}",
                dataType: "json",
                success: function (Result) {
                    alert("Sucessfully done,Thanks you");
                    window.open("../Logout_HO.aspx", "_self");
                    Result = Result.d;
                }
            });
        }

        function next() {
            var empid = $("[id*=txt_session]").val();
           // alert(empid);
            debugger;
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "Doc_Scanning_HO.aspx/qual_checking",
                data: "{input:'" + empid + "'}",
                //url: "../HO_Website/Doc_Scanning_HO.aspx/doc_dtl_view1", // 
                //data: "{input:'" + empid + "'}",
                dataType: "json",
                success: function (Result) {
                    Result = Result.d;
                  //  alert(Result);
                    //  alert(Result);
                    if (Result == "222") {
                        alert("Please upload all the mandiatory documents");
                        window.open("../HO_Website/Doc_Scanning_HO.aspx", "_self");
                    }
                    else {
                        alert("Dear Candidate, All the details are successfully updated,we will contact you if you are shortlisted.");
                        // window.open("../Logout_HO.aspx", "_self");
                        getemp_detail();
                    }




                }
            });
           
            }

        function SaveImage() {
            var empid = $("[id*=txt_session]").val();
            var doc1 = $("#dd_doc1").val();          
           
            //var des1 = $("#txt_desc").val();
            
            var des1 = '';
            if ($('#dd').is(':hidden')) {
                var doc2 = 0;
            }
            else {
                var doc2 = $("#dd_doc2").val();
            }
            if (doc1 == 0)
            {
            if (doc1 == 0 ) {
                alert("Select Document Type");               
            }
           
            //else if (des1 =='') {
            //    alert("Enter Description");
            //}
        }
            else
            {
                if ($('#dd').is(':hidden')) {
                    var doc2 = 0;
                }
                else {
                    var doc2 = $("#dd_doc2").val();
                }
                var ab = doc1 + "~" + doc2 + "~" + des1;

          
           
                var fileList = document.getElementById("FileUpload1").files;
                //      var fileList = document.getElementById("imgFileType").files;
                var fileReader = new FileReader();
                if (fileReader && fileList && fileList.length) {
                    var d = new Date();
                    var timeStamp = d.getDate() + "-" + d.getMonth() + "-" + d.getFullYear() + "_" + d.getHours() + ":" + d.getMinutes() + ":" + d.getSeconds();
                    var fileName = "RECRT_"+ fileList[0].name;
                    // Use a regular expression to trim everything before final dot
                    //extension = fileName.replace(/^.*\./, '');

                    // Iff there is no dot anywhere in filename, we would have extension == filename,
                    // so we account for this possibility now
                    //if (extension == fileName) {
                    //    extension = '';
                    //} else {
                    //    extension = extension.toLowerCase();
                    //}
                    //fileReader.readAsArrayBuffer(fileList[0]);
                    fileReader.readAsDataURL(fileList[0]);
                    fileReader.onload = function () {
                        var imageData = fileReader.result;
                        //var flag = $("#txtflg").val();

                        var d1=   imageData.split(":");
                       
                        var d3 = d1[1].split(";");
                     //  var cc = emp + "~" + doc1 + "~" + doc2 + "~" + des1 + "~" + sess + "~" + d3[0] + "~" + fileName;
                        var cc = empid + "µ" + doc1 + "µ" + doc2 + "µ" + des1 + "µ" + d3[0] + "µ" + fileName;
                       // alert(cc);
                        $.ajax({
                            type: "POST",
                            contentType: "application/json; charset=utf-8",
                            url: "../HO_Website/Doc_Scanning_HO.aspx/Documents_upload",
                            data: "{ input: '" + cc + "',upload_file: '" + imageData + "'}",
                          
                            dataType: "json",
                            beforeSend: function () {
                                return confirm("Are you sure you want to confirm?");
                            },
                            success: function (Result) {
                             
                                window.open("../HO_Website/Doc_Scanning_HO.aspx", "_self");
                            },
                            error: function (Result) {
                                alert("Please check size of the document size  must be  less than 1MB ");
                            }
                        });
                    };
                }
                else {
                    alert("Select Any File");
                    return;
                }
            }
        }
        // function next() {
        //     window.location.href = "../HO_Website/Reference_per_HO.aspx";
        //}


         function personaldet_tab() {
             window.open("../HO_Website/Personal_Details_HO.aspx", "_self");
         }
         function Experience_tab() {
             window.open("../HO_Website/Experience_HO.aspx", "_self")
         }
         function quali_tab() {
             window.open("../HO_Website/qualification_HO.aspx", "_self");
         }
         function doc_tab() {
             window.open("../HO_Website/Doc_Scanning_HO.aspx", "_self");
         }
         function family_tab() {
             window.open("../HO_Website/family_status_HO.aspx", "_self");
         }
         function ref_tab() {
             window.open("../HO_Website/Reference_per_HO.aspx", "_self");
         }

        //27 change
         function empdoc()
         {
             
             $("#tbldoc").show();
             var empid = $("[id*=txt_session]").val();
             $.ajax({
                 type: "POST",
                 contentType: "application/json; charset=utf-8",
                 url: "../HO_Website/Doc_Scanning_HO.aspx/get_doc_dtl_view",
                 data: "{ input: '" + empid + "' }",
                 dataType: "json",
                 success: function (Result) {
                     for (var i = 0; i < Result.d.length; i++) {
                         $("#tbl_doc tbody").append("<tr> <td>" + Result.d[i].parent + "</td>" +
                                //  "<td>" + Result.d[i].child + "</td>" + "<td>" + Result.d[i].des + "</td>" + " <td hidden='hidden'>" + Result.d[i].did + "</td>" + " <td hidden='hidden'>" + Result.d[i].cid + "</td><td hidden='hidden'>" + Result.d[i].seqid + "</td>" + "<td><input type='button' id=" + Result.d[i].seqid + " onclick='dwnld(this)' value='Download'  /></td></tr>");
                              "<td>" + Result.d[i].child + "</td>" + "<td>" + Result.d[i].des + "</td>" + " <td hidden='hidden'>" + Result.d[i].did + "</td>" + " <td hidden='hidden'>" + Result.d[i].cid + "</td><td hidden='hidden'>" + Result.d[i].seqid + "</td>" + "<td><input type='button' id=" + Result.d[i].seqid + " onclick='dwnld(this)' value='Download'  /></td></tr>");

                     }
                 },
                 error: function (Result) {
                 }
             });
         }
         function dwnld(row) {
             var i = row.parentNode.parentNode.rowIndex;
             var rows = document.getElementById("tbl_doc").rows;
             var hiddenvalue1 = rows[i].cells[3].innerText;
             var hiddenvalue2 = rows[i].cells[4].innerText;
             var hiddenvalue3 = rows[i].cells[5].innerText;
             var empid = $("[id*=txt_session]").val();
             var inputdata = empid + "~" + hiddenvalue3;
             $.ajax({
                 type: "POST",
                 contentType: "application/json; charset=utf-8",
                 url: "../HO_Website/Doc_Scanning_HO.aspx/Documents_download",
                 //data: "{ empcode: '" + empCode + "',parentid: '" + hiddenvalue1 + "',childid: '" + hiddenvalue2 + "',seqid: '" + hiddenvalue3 + "' }",
                 data: "{ input: '" + inputdata + "' }",
                 dataType: "json",
                 success: function (Result) {
                     //var win = window.open("../Images/" + Result.d, "_blank");
                     var fileName = Result.d;
                   //  alert(fileName);
                     var myUrl = "../Images/" + fileName;
                     OpenDialog(myUrl, 875, 650, function (termsOfServiceAccepted) {
                         if (termsOfServiceAccepted) {
                             $.ajax({
                                 type: "POST",
                                 contentType: "application/json;charset=utf-8",
                                 url: "../HO_Website/Doc_Scanning_HO.aspx/deleteDownloadFile",
                                 data: "{ input: '" + fileName + "' }",
                                 dataType: "json",
                                 success: function (Result) {
                                 },
                                 error: function (Result) {
                                 }
                             });
                         }
                     });
                 },
                 error: function (Result) {
                 }
             });
         }

         function OpenDialog(url, width, height, callback) {
             var win = window.open(url, "Manappuram Document Verification", width, height, "menubar=0,toolbar=0", "_blank");
             var timer = setInterval(function () {
                 if (win.closed) {
                     clearInterval(timer);
                     var returnValue = true;
                     callback(returnValue);
                 }
             }, 10);
         }

        //13 jun

         function Validation() {
            
             var empid = $("[id*=txt_session]").val();
             var doc1 = $("#dd_doc1").val();          
             var des1 = '';
             if ($('#dd').is(':hidden')) {
                 var doc2 = 0;
             }
             else {
                 var doc2 = $("#dd_doc2").val();
             }
             if (doc1 == 0) {
                 if (doc1 == 0) {
                     alert("Select Document Type");
                 }
             }
             else {
                 if ($('#dd').is(':hidden')) {
                     var doc2 = 0;
                 }
                 else {
                     var doc2 = $("#dd_doc2").val();
                 }
                 var ab = doc1 + "~" + doc2 + "~" + des1;

                 //------------------
                 var fileName;
                 var fileContentType = "";
                 var imageData = "";
                 var photoImageData = [];

                 var file1 = document.getElementById("FileUpload1").files.length;
                 var path = document.getElementById("FileUpload1").value;
                 if (path != "") {
                     var validFilesTypes = ["png", "jpg", "jpeg", "pdf", "PNG", "JPG", "JPEG", "PDF", "xls"];
                     var ext = path.substring(path.lastIndexOf(".") + 1, path.length).toLowerCase();
                     var isValidFile = false;
                     for (var i = 0; i < validFilesTypes.length; i++) {
                         if (ext == validFilesTypes[i]) {
                             isValidFile = true;
                             break;
                         }
                     }
                     if (!isValidFile) {
                         alert("Please attach document in jpg/png/pdf/jpeg file format");
                         document.getElementById("FileUpload1").value = "";
                         return false;
                     }
                     else {
                         var fileList = document.getElementById("FileUpload1").files;
                         var fsize = fileList[0].size / 1024 / 1024;
                         alert("File size :" + fsize);
                         if (fsize < 1) {
                             var fileReader = new FileReader();
                             if (fileList.length == 1) {
                                 var d = new Date();
                                 var timeStamp = d.getDate() + "-" + d.getMonth() + "-" + d.getFullYear() + "_" + d.getHours() + ":" + d.getMinutes() + ":" + d.getSeconds();
                                 var fileName = "RECRT_" + fileList[0].name;
                                 fileReader.readAsDataURL(fileList[0]);
                                 fileReader.onload = function () {
                                     var imageData = fileReader.result;
                                     var d1 = imageData.split(":");

                                     var d3 = d1[1].split(";");
                                     photoImageData.push(imageData);
                                     photoImageData.push(d3);
                                     //  var cc = emp + "~" + doc1 + "~" + doc2 + "~" + des1 + "~" + sess + "~" + d3[0] + "~" + fileName;
                                     var cc = empid + "µ" + doc1 + "µ" + doc2 + "µ" + des1 + "µ" + d3[0] + "µ" + fileName;
                                     alert(cc);
                                     alert(imageData);
                                     $.ajax({
                                         type: "POST",
                                         contentType: "application/json; charset=utf-8",
                                         url: "../HO_Website/Doc_Scanning_HO.aspx/Doc_upload",
                                         data: "{input: '" + cc + "',upload_file: '" + imageData + "'}",
                                         
                                         dataType: "json",
                                         beforeSend: function () {
                                             return confirm("Are you sure you want to confirm?");
                                         },
                                         success: function (Result) {

                                             window.open("../HO_Website/Doc_Scanning_HO.aspx", "_self");
                                         },
                                         error: function (Result) {
                                             alert("Please check size of the document size  must be  less than 1MB ");
                                         }
                                     });
                                 };
                             }
                         }
                         else {
                             alert('Attached file size exceeds 1 MB, Please attach less than 1 MB only..');
                             return false;
                         }
                     }
                 }
                 else {
                     alert("please attach a proof of corresponding investment type declared during TDS Submission in jpg/png/pdf/jpeg file format.");
                     return false;
                 }
             }
       }
    </script>   

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   
         <div class="panel panel-default col-md-12">
        <div id="Tabs" role="tabpanel">
            <!-- Nav tabs -->
               <ul class="nav nav-pills" role="tablist">

                     <li  class="gen"><a href="#personaldet" aria-controls="personaldet" role="tab" data-toggle="pill" onclick="personaldet_tab()" id="tabs2">Personal</a></li>
                   <li class="gen"  ><a href="#Experience_HO" aria-controls="Experience" role="tab" data-toggle="pill" onclick="Experience_tab()" id="A1">Experience</a></li>
                   <li class="gen"><a href="#qualidet" aria-controls="qualidet" role="tab" data-toggle="pill" onclick="quali_tab()" id="tab6">Qualification</a></li>
                        <li class="gen"><a href="#family" aria-controls="family" role="tab" data-toggle="pill" onclick="family_tab()" id="tab7">Family</a></li>
                                <li class="gen"><a href="#experience" aria-controls="experience" role="tab" data-toggle="pill" onclick="ref_tab()" id="tabs4">Reference</a></li>

                     <li class="active gen"><a href="#docupload" aria-controls="empassign" role="tab" data-toggle="pill" onclick="doc_tab()" id="tabs3">Document Upload</a></li>
<%--  <li  class="gen"><a href="#photo" aria-controls="exp" role="tab" data-toggle="pill" onclick="photo_tabnew()" id="tabs6">Photo</a></li>--%>

                                                      </ul>
            <!-- Tab panes -->
             <form id="Form2" class="form-horizontal row-border" action="#" runat="server">
                <div class="tab-content">

              <div class="row ">
                            <div class="ma-header">
                                <div class="col-md-12">
                                    <h3 style="color: #091221"><i class="glyphicon glyphicon-upload"></i> BASIC DOCUMENTS UPLOAD</h3>
                                </div>
                            </div>
                        </div>
                      <br />
                 <div class="design col-md-12 clonedInput">
                       <div class="widget-content">

                    <div class="form-group">
                        <div class="col-md-2">   <asp:TextBox ID="txt_session" runat="server" hidden="hidden" ></asp:TextBox>
                               <asp:TextBox ID="txtbr" runat="server" hidden="hidden" ></asp:TextBox>
                        </div>
                       
                    </div>

                    <div class="form-group">   <div class="col-md-2"></div>
                        <label class="col-md-2 cntr-text">Select Document Type: </label>
                        <div class="col-md-4">
                            <select class="form-control" id="dd_doc1">
                               
                            </select>
                        </div>
                        </div>
                     <div class="form-group"  id="dd" hidden="hidden"> <div class="col-md-2"></div>

                         <label class="col-md-2 cntr-text">Select Document</label>
                                            <div class="col-md-4">
                                                <select class="form-control" id="dd_doc2" >
                                                </select>
                                            </div></div>

                   <%--  <div class="form-group"><div class="col-md-2"></div>
                            <label class="col-md-2 cntr-text">Description</label>
                            <div class="col-md-4">
                                                <textarea class="form-control" rows="2" id="txt_desc" maxlength="50" onblur="leftTrim(this)"  onkeyup="this.value=this.value.toUpperCase()"></textarea>
                            </div>                           
                        </div>--%>
                       <div class="form-group"><div id="abc" hidden="hidden">
                            <div class="col-md-4">
                                <input type="text" name="regular" class="form-control" id="txtflg" maxlength="30"/>
                            </div>   
                           </div>                        
                        </div>

                         <div class="form-group">   <div class="col-md-2"></div>
                        <label class="col-md-2 cntr-text">Choose file to upload:</label>
                        <div class="col-md-4">
                            <input type="file" data-style="fileinput" id="FileUpload1"  />
                        </div>

                             </div>
                              <div class="form-group"> 
                           <div class="col-md-2"></div>
 <label class="col-md-3 cntr-text"> Image size must be less than 1MB<span class="required"> *</span></label>

                          </div> <div class="form-group align-center">
                                                          <input id="btn_upload" class="btn btn-info " onclick="SaveImage()" style="border-radius: 25px; width: 180px" type="button" value="Upload" />

                           </div>
                    </div></div>
                    <br /><br />

                    <div class="widget-header">
                                    <h4><i class="icon-file"></i>Uploaded Documents</h4></div>
                              
<%--   <div id="doc_info1" class="clonedInput">
                                             <div class="widget-content">
                                                 <div id="tbldoc" hidden="hidden">
                        <div class="ibox-content align-center">
                            <div class="ibox-table">
                                <div class="table-responsive">
                                    <table class="responsive-table table-striped table-bordered table-hover align-center " id="tbl_doc" style="width:1000px;">
                                <thead style="color: white; grid-row-align:center;background-color:#686b6b">
                                    <tr style="height:30px;font-size:x-small;" >
                                                <th data-class="expand">Document</th>
                                               <th>Sub Document</th>
                                                                                  
                                            </tr>
                                        </thead>
                                        <tbody>
                                        
                                        </tbody>
                                    </table>
                                </div>

                            </div>
                        </div>
                        </div>
                   
                      
                     
                     
                             
                      
              

                  
                       </div> 
                    </div>--%>
       <div id="doc_info1" class="clonedInput">
                                             <div class="widget-content">
                                                 <div id="tbldoc" hidden="hidden">
                        <div class="ibox-content align-center">
                            <div class="ibox-table">
                                <div class="table-responsive">
                                    <table class="responsive-table table-striped table-bordered table-hover align-center " id="tbl_doc" style="width:1000px;">
                                <thead style="color: white; grid-row-align:center;background-color:#686b6b">
                                    <tr style="height:30px;font-size:x-small;" >
                                                <th data-class="expand">Document</th>
                                               <th>Sub Document</th>
                                        <th>Description</th>
                                        <th hidden="hidden">parent id</th>
                                        <th hidden="hidden">Child id</th>   <th>Download</th>                                          
                                            </tr>
                                        </thead>
                                        <tbody>
                                        
                                        </tbody>
                                    </table>
                                </div>

                            </div>
                        </div>
                        </div>
                                               
                   
                      
                     
                     
                             
                      
              

                  
                       </div> 
                    </div>
                                   
                     
                     <div class="form-group"> 
                         <label class="col-md-4 cntr-text">Mandatory Documents</label>
                         </div>
                        <div class="form-group"> 
                         <label class="col-md-4 cntr-text">• Employee Profile Or Resume</label>
                             <label class="col-md-4 cntr-text">• ID Proof</label>
                            <label class="col-md-4 cntr-text">• Pan Card </label>
                             </div>
                         <div class="form-group"> 
                         <label class="col-md-4 cntr-text">• Address Proof</label>
                             <label class="col-md-4 cntr-text">• Qualification Documents(sslc,Plustwo,Degree,PG etc..)</label>
                    
                         </div>
                  
                    
                   
                               <div class="widget box align-center"> <br /><br />
                     
                                <input id="btn_exit" type="button" value="Submit"  class="btn btn-info" onclick="next()" style="border-radius:25px;width:180px" />
       </div>
             </div>     
             </form> 
            </div>
             </div>
                      
           
             
              
</asp:Content>
