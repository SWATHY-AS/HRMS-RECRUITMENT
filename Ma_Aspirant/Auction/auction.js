function qualification() {
    var qid = $("[id*=txt_qual]").val();
    var pst = $("[id*=txt_post]").val();

    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "AucRec.aspx/qual_dtl",
        data: "{qid:'" + qid + "',tp:'" + pst + "'}",
        dataType: "json",
        success: function (Result) {
            Result = Result.d;

            $.each(Result, function (key, value) {

                $("#cmb_qualin").append($("<option></option>").val
                    (value.qid).html(value.q_name));
            });

            //for (i = 50; i <= 100; i++) {
            //    $("#cmb_percentg").append($('<option></option>').val(i).html(i));
            //}
        }
    });

}

$.ajax({
    type: "POST",
    contentType: "application/json; charset=utf-8",
    url: "AucRec.aspx/uni_dtl",
    data: {},
    dataType: "json",
    success: function (Result) {
        Result = Result.d;
        //$("#cmb_univrstytin").val.empty();
        $.each(Result, function (key, value) {
            $("#cmb_univrstytin").append($("<option></option>").val
                (value.uid).html(value.u_name));
        });
        //$('#txt_passout').datepicker({
        //    changeYear: true,
        //    showButtonPanel: true,
        //    dateFormat: 'yy',
        //    onClose: function (dateText, inst) {
        //        var year = $("#ui-datepicker-div .ui-datepicker-year :selected").val();
        //        $(this).datepicker('setDate', new Date(year, 1));
        //    }
        //                                 });
        //$("#txt_passout").focus(function () {
        //    $(".ui-datepicker-month").hide();
        //});

        //$("#txt_passout").datepicker({
        //    dateFormat: 'yy',
        //    changeMonth: true,
        //    changeYear: true,
        //    //showButtonPanel: true,
        //    maxDate: new Date(),
        //    minDate: new Date('2019/07/01'),
        //    //minDate: new Date(2019, 0 - 1, 25),
        //    onClose: function (dateText, inst) {
        //      //  var month = $("#ui-datepicker-div .ui-datepicker-month :selected").val();
        //        var year = $("#ui-datepicker-div .ui-datepicker-year :selected").val();
        //        $(this).val($.datepicker.formatDate('yy', new Date(year, month, 1)));
        //    }
        //});


        //$("#txt_passout").datepicker({
        //    dateFormat: 'yy',
        //   // changeMonth: true,
        //    changeYear: true,
        //    //showButtonPanel: true,
        //    maxDate: new Date(),
        //   // minDate: new Date('2019/07/01'),
        //    //minDate: new Date(2019, 0 - 1, 25),
        //    onClose: function (dateText, inst) {
        //       // var month = $("#ui-datepicker-div .ui-datepicker-month :selected").val();
        //        var year = $("#ui-datepicker-div .ui-datepicker-year :selected").val();
        //        $(this).val($.datepicker.formatDate('yy', new Date(year, month, 1)));
        //    }
        //});
    }
});




$(document).on('change', '#txt_panID', function () {
   
    var cardno = /[a-zA-Z]{5}[0-9]{4}[a-zA-Z]{1}/;

   
    var v1 = $("#txt_panID").val();
    if (v1 == '') { alert("Please Enter PAN ID! ") }
    else {
        var votenam = $("#txt_name").val().toUpperCase();
        if (v1.match(cardno)) {
            //$.ajax({
            //    type: 'POST',
            //    url: 'AucRec.aspx/GetPandetails',
            //    //  url:'Login.aspx/loginauth',
            //    data: "{ ID : '" + v1 + "',source:'" + votenam + "'}",

            //    async: false,
            //    cache: false,
            //    contentType: "application/json; charset=utf-8",
            //    dataType: "json",
            //    success: function (Result) {
            //        res = Result.d;
            //        // alert(res);
            //        $('#ModalBehaviour').modal();
            //        $('#msgCntpopup').html('Do you want to proceed  ' + res + '%. matched......!!!');
            //        //-------------------04/jan2020
            //        //if (res.split('"~"')[1].toString() == "INVALID") {

            //        //    alert("Invalid PAN");
            //        //    $("#txt_panID").val('');
            //        //}
            //        //else {//"VALID"~"RAVEENDRAN NAIR"~"06/07/2018"~"RETHEESH"
            //        //    //"VALID"~"JITHIN"~"30/07/2017"~null
            //        //    //"VALID"~"UNNIKRISHNAN"~"18/12/2018"~"KRISHNAPRIYA"
            //        //    // alert("Your name is" + res.split('"~"')[1].toString() + "and Your PAN last updated on" + res.split('"~"')[2].toString());                                      
            //        //    var panname = res.split('"~"')[1].toString().toUpperCase();
            //        //    var panname1 = res.split('"')[3].toString().toUpperCase();
            //        //    var firstpannm = panname.split(' ')[0].toString();  
            //        //    var firstpannm1 = panname1.split(' ')[0].toString();
            //        //    //   var firstvotenm = votenam.split(' ')[0].toString(); 
            //        //    //alert(votenam);
            //        //    //alert(firstpannm1);
            //        //    if (votenam.indexOf(firstpannm) != -1) {
            //        //        alert("Valid Account");
            //        //    }
            //        //    else if  (votenam.indexOf(firstpannm1) != -1) {
            //        //        alert("Valid Account");
            //        //    }
            //        //    else {
            //        //        alert("Your Voters ID name and PAN name doesn't match. Please enter your valid PAN ID!");
            //        //        $("#txt_panID").val('');
            //        //    }
            //        //                   }
            //        //-------------------------end


            //    },
            //    Error: function (Result) {
            //        //failed
            //    }
            //});// End of Ajax


            //$.ajax({
            //    type: 'POST',
            //    url: 'AucRec.aspx/GetPandetails_name',
            //    //  url:'Login.aspx/loginauth',
            //    data: "{ ID : '" + v1+ "' }",

            //    async: false,
            //    cache: false,
            //    contentType: "application/json; charset=utf-8",
            //    dataType: "json",
            //    success: function (Result) {
            //        res = Result.d;
               
            //        //VALID~UNNIKRISHNAN~18/12/2018~KRISHNAPRIYA
            //        var accountname = res.toString().toUpperCase();
            //      //  $("#txt_panname").val(accountname);

            //        if (accountname == "INVALID") {
            //            $("#txt_panname").prop("disabled", false);
            //            $("#txt_panname").val('');
            //        }
            //        else {
            //            $("#txt_panname").val(accountname);
            //            $("#txt_panname").prop("disabled", true);
            //        }
            //    },
            //    Error: function (Result) {
            //        //failed
            //    }
            //});
        }
        else {
            alert("Not a valid Pan card number!");
            $("#txt_panID").val('');
            return false;
        }
        /////////////////////////---------------
    }

});
function acccon(){
    $("#txt_ifsc").val("");
   $("#txt_account").val("");
}
function pancon(){
    $("#txt_panID").val("");
  //  $("#txt_account").val("");
}
$(document).on('change', '#txt_voterID', function () {
    var r_post = $("[id*=txt_post]").val();
    var v1 = $("#txt_voterID").val();
    if (v1 == '') { alert("Please Enter Voters ID! ") }
    else {
        debugger;
        $.ajax({
            type: 'POST',
            url: 'AucRec.aspx/GetVotedetails',
            //  url:'Login.aspx/loginauth',
            data: "{ ID : '" + v1 + "',post:'"+r_post+"' }",

            async: false,
            cache: false,
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (Result) {
                res = Result.d;
               // alert("Your Information loaded");
                //alert(res);
                if (res == "FAILED") {
                    alert("INVALID ID");
                    $("#txt_voterID").val('');
                }
                else {
                    // SUCCESS~COMPLETED~SUCCESS~Krishnapriya~THRISSUR~Kerala~1 / 181 Pallath~21 - 05 - 1996~F~23
                    var res1 = res.split("µ");
                    if (res1[0] == "111") {
                        var res11 = res1[1].split("~");

                        $("#txt_name").val(res11[3].toString());
                        $("#txt_dist").val(res11[4].toString());
                        $("#txt_state").val(res11[5].toString());
                        $("#txt_housename").val(res11[6].toString());
                        $("#txt_dob").val(res11[7].toString());
                        $("#txt_gender").val(res11[8].toString());
                        $("#txt_age").val(res11[9].toString());
                    }

                    else {
                        alert(res);
                        $("#txt_voterID").val('');
                    }


                    //$("#txt_name").val(res.split('~')[3].toString());
                    //$("#txt_dist").val(res.split('~')[4].toString());
                    //$("#txt_state").val(res.split('~')[5].toString());
                    //$("#txt_housename").val(res.split('~')[6].toString());
                    //$("#txt_dob").val(res.split('~')[7].toString());
                    //$("#txt_gender").val(res.split('~')[8].toString());
                    //$("#txt_age").val(res.split('~')[9].toString());

                 
                    
                    $("#txt_account").prop("disabled", false);

                }



            },
            Error: function (Result) {
                //failed
            }
        });// End of Ajax
    }

});

$(document).on('change', '#txt_account', function () {

    $("#txt_ifsc").prop("disabled", false);

   
});


//$(document).on('change', '#ddl_state', function () {
//    alert("dfgdfh");
//    getfilldata("2");
//}


$(document).on('change', '#ddl_state', function () {
    getfilldata("2");
});


$(document).on('change', '#ddl_district', function () {
    getfilldata("3");
});

$(document).on('change', '#txt_ifsc', function () {

    var v1 = $("#txt_ifsc").val();

    var v2 = $("#txt_account").val();
    if (v2 == '') { alert("Please Enter account number!"); }
    if (v1 == '') { alert("Please Enter IFSC code! ");  }
    else {
        $('#mod_acc').modal();
        var votenam = $("#txt_name").val().toUpperCase();
        var cardno = /[A-Z|a-z]{4}[0][a-zA-Z0-9]{6}$/;
        if (v1.match(cardno)) {
            $.ajax({
                type: 'POST',
                url: 'AucRec.aspx/GetBankdetails',
                //  url:'Login.aspx/loginauth',
                data: "{ no : '" + v2 + "', ifsc : '" + v1 + "',source:'" + votenam + "' }",

                async: false,
                cache: false,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (Result) {
                    res = Result.d;
                    //    alert(res);


                    $('#msgacc').html('Do you want to proceed  ' + res + '%.matched.....!!!');

                    //-----------04/jan/2020
                    //if (res == "INVALID") {
                    //    alert("Not a Valid Account!");
                    //    $("#txt_ifsc").val('');
                    //}
                    //else {                                     
                    //    var accountname = res.split('"~"')[0].toString().toUpperCase();
                    //    var firstvotenm = votenam.split(' ')[0].toString();                      
                    //    alert("Your Account holder name is" + res.split('"~"')[0].toString());                   
                    //    if (accountname.indexOf(firstvotenm) != -1) {                      
                    //        $("#txt_panID").prop("disabled", false);
                    //        alert("Valid Account");
                    //    }
                    //    else {
                    //        alert("Your Voters ID name and account holder name doesn't match. Please enter your own account!");
                    //        $("#txt_account").val('');
                    //    $("#txt_ifsc").val('');
                    //    $("#txt_ifsc").prop("disabled", true);


                    //   // alert("Your Status is" + res.split('"~"')[1].toString());

                    //    }
                    //}

                    //-----------------------------end

                },
                Error: function (Result) {
                    //failed
                }
            });// End of Ajax
            //-----------------GetBankdetails


            $.ajax({
                type: 'POST',
                url: 'AucRec.aspx/GetBankdetails_name',
                //  url:'Login.aspx/loginauth',
                data: "{ no : '" + v2 + "', ifsc : '" + v1 + "' }",

                async: false,
                cache: false,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (Result) {
                    //res = Result.d;                    
                    //var arr = res.split(/["~]/);
                    //alert(arr);
                    //var accountname = res.split('"~"')[0].toString().toUpperCase();
                    //$("#txt_bname").val(accountname);
                    res = Result.d;
                    var accountname = res.toString().toUpperCase();
                    if (accountname == "INVALID")
                    {
                        $("#txt_bname").prop("disabled", false);
                        $("#txt_bname").val('');
                    }
                    else
                    {
                        $("#txt_bname").val(accountname);
                        $("#txt_bname").prop("disabled", true);
                    }
                },
                Error: function (Result) {
                    //failed
                }
            });


        }
        else {
            alert("Not a valid IFSC Code!");
            $("#txt_ifsc").val('');
            return false;
        }
        //--------------------------------
    }

});   

$(document).on('change', '#ddl_selID', function () {

    var r_idtype = $("#ddl_selID").val();
    if (r_idtype == 1) {

        $('#vote').hide();
        $('#upld').show();
        $('#upddiv').hide();
        $('#camdiv').hide();
        //QRCode_Reader  
        //  window.location.href = "123.html";
        //window.location.href = "../Recruitment/Aadharupload.aspx";

    }
    else {
        $('#upld').hide();
        $('#vote').show();
        $('#upddiv').hide();
        $('#camdiv').hide();
        
    }
});

function getfilldata(flag) {
    
    var indta = "";
    if (flag == "1") {
        indta = "1"
    }
    else if (flag == "2") {
        indta = "2~" + $("#ddl_state").find('option:selected').val();
    }
    else if (flag == "3") {
        indta = "3~" + $("#ddl_district").find('option:selected').val();
    }
    $.ajax({
        type: "post",
        contentType: "application/json; charset=utf-8",
        url: "AucRec.aspx/GetBranches",
        data: "{indata: '" + indta + "'}",
        async: false,
        dataType: "json",
        success: function (Result) {
            Result = Result.d;

            if (flag == "1") {

                $.each(Result, function (key, value) {
                    $('#ddl_state').append($("<option></option>").val(value.bid).html(value.bname));
                });
            }
            else if (flag == "2") {
                $.each(Result, function (key, value) {
                    $('#ddl_district').append($("<option></option>").val(value.bid).html(value.bname));
                });
            }
            else if (flag == "3") {
                $.each(Result, function (key, value) {
                    $('#ddl_branch').append($("<option></option>").val(value.bid).html(value.bname));
                });
            }
        },
        error: function (Result) {

            alert("Error");
        }
    });

}

function mobile_otp()
{
    var r_mob = $("#txt_mobile").val();
    if (r_mob == '') { alert('Please Enter Valid Mobile Number!'); return; }


    if (r_mob != "") {
        var filter = /^\d*(?:\.\d{1,2})?$/;
        if (filter.test(r_mob)) {
            if (r_mob.length != 10) {
              
                alert('Please enter 10  digit mobile number');
                $("#txt_mobile").val('');
                return;
            }
        }
        else {
            alert('Not a valid mobile number');
            return;
        }
    }

   // alert("Your Mobile Number is " + r_mob);
    $('#myModal1').modal('hide');
    $.ajax({
        type: 'POST',
        url: 'AucRec.aspx/sendOTPfn',
        data: "{ number : '" + r_mob + "' }",

        async: false,
        cache: false,
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (Result) {
            res = Result.d;
            if (res == "SUCCESS") {
                $('#otp').val('');
                $('#myModal1').modal('show');
                 // var bcgDiv = document.getElementById("#parent");
                $("#txt_mchk").val('1');
                  ("#parent").style.display = "block";
            }
            else {
               
                alert("Failed to send OTP to your Number!! Please Enter valid number!");
            }

        },
        Error: function (Result) {
            res = Result.d;
            alert(res);

        }
    });
}


function validateOTP() {
    
    var r_mob = $("#txt_mobile").val();
    var otp = $("#otp").val();
    var pp = r_mob + '~' + otp;
    $.ajax({
        type: "POST",
        url: 'AucRec.aspx/loginauth',
        data: "{otp:'" + pp + "'}",
        async: false,
        cache: false,
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (Result) {
            Result = Result.d;

            if (Result == "111") {
                $('#myModal1').modal('hide');
                $("#txt_mobile").prop("disabled", true);
                alert('Valid OTP!');
                $("#btn_mob").hide();
                $("#txt_mchk").val('1');
                $("#idmob").val(r_mob);
            }
            else {
                $("#txt_mchk").val('');
                alert('Invalid OTP!');

            }
        },
        error: function () {
            alert('Invalid Entry!');
            $("#txt_mchk").val('');

        }
    });
}




function mail_otp() {
    var r_mob = $("#txt_email").val();
    //  alert("Your Mobile Number is " + r_mob);
    $('#mailmodal').modal('hide');
    $.ajax({
        type: 'POST',
        url: 'AucRec.aspx/sendOTPfn_mail',
        data: "{ number : '" + r_mob + "' }",

        async: false,
        cache: false,
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (Result) {
            res = Result.d;
            if (res == "Mail Send") {
                $('#txt_mailotp').val('');
                $('#mailmodal').modal('show');
                $("#txt_emchk").val('');

            }
            else {
                alert("Failed to send OTP to your Mailid!! Please Enter valid Mailid!");
                $("#txt_emchk").val('');
            }
        

        },
        Error: function (Result) {
            res = Result.d;
            alert(res);

        }
    });
}


function validatemailOTP() {

    var r_mob = $("#txt_email").val();
    var otp = $("#txt_mailotp").val();
    var pp = r_mob + '~' + otp;
    $.ajax({
        type: "POST",
        url: 'AucRec.aspx/loginauth_mail',
        data: "{otp:'" + pp + "'}",
        async: false,
        cache: false,
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (Result) {
            Result = Result.d;

            if (Result == "111") {
                $('#mailmodal').modal('hide');
                $("#txt_email").prop("disabled", true);
                alert('Valid OTP!');
                $('#btn_mail').hide();
                $("#txt_emchk").val('1');
                $("#idmail").val(r_mob);
            }
            else {
                alert('Invalid OTP!');
                $("#txt_emchk").val('');

            }
        },
        error: function () {
            alert('Invalid Entry!');
            $("#txt_emchk").val('');

        }
    });
}

function confirm_final() {

    $.ajax({
        type: "POST",
        url: 'AucRec.aspx/checkDetails',
        data: "{aucid:'" + $("[id*=hdn_auc_id]").val() + "'}",
        async: false,
        cache: false,
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        beforeSend: function () {
            return confirm("Are you sure you want to confirm?");
        },
        success: function (Result) {
            Result1 = Result.d;
            if (Result.d.toString() == "111") {

                alert("Confirmed Successfully");
                location.reload();
                $("#btn_pan").prop('disabled', false);
                $("#btn_id").prop('disabled', false);
                $("#btn_degree").prop('disabled', false);
                $("#btn_llb").prop('disabled', false);
                $("#btn_sslc").prop('disabled', false);
                $("#btn_bank").prop('disabled', false);
            }
            else {
                alert('Please provide all the required documents.');
            }
        },
        error: function () {
            alert('Invalid Entry!');

        }
    });



}

  function confirm_basic() {
     
      var r_br = $("[id*=txt_br]").val();
   
                var r_name = $("#txt_name").val();               
                var r_hname = $("#txt_housename").val();                
               var r_dist = $("#ddl_district").find('option:selected').text();              
             var r_state = $("#ddl_state").find('option:selected').text();          
                var r_dob = $("#txt_dob").val();               
                 var r_gender = $("#ddl_gender").find('option:selected').val();//$("#txt_gender").val();               
                var r_age = $("#txt_age").val();                
                var r_mob = $("#txt_mobile").val();              
                var r_br = $("#ddl_branch").find('option:selected').val();
                var r_email = $("#txt_email").val();
  
                var r_pyear = $("#txt_exp").val();               
                     
                var r_pan = $("#txt_panID").val(); 
                var r_reg = $("#txt_regnum").val();
             
     
      var data1 = r_name + "~" + r_hname + "~" + r_dist + "~" + r_state + "~" + r_dob + "~" + r_gender + "~" + r_mob + "~" + r_email + "~" + r_pyear + "~" + r_pan + "~" + r_reg + "~" + r_br;

    
      if (r_name == '' || r_hname == '' || r_dist == '' || r_state == '' || r_dob == '' || r_gender == '' || r_mob == '' || r_email == '' || r_pyear == '' || r_pan == '' || r_reg == '' || r_br == '' )
             {
        
                     if (r_mob == '') { alert("Please  Enter Mobile Number"); }
                     else if (r_email == '') { alert("Please  Enter Email ID"); }
                     else if (r_pan == '') { alert("Please Enter Pan Number"); }
                     else if (r_reg == '') { alert("Please Enter Reg Number"); }
                     else if (r_name == '') { alert("Please Enter Name"); }
                     else if (r_hname == '') { alert("Please Enter Housename"); }
                     else if (r_dist == '') { alert("Please Enter District"); }
                     else if (r_state == '') { alert("Please Enter State"); }
                     else if (r_dob == '') { alert("Please Enter DOB"); }
                     else if (r_gender == '-1') { alert("Please Select Gender"); }
                     else if (r_pyear == '') { alert("Please Enter Experience"); }
                     else if (r_pan == '') { alert("Please Enter PAN number"); }
                     else if (r_br == '-1') { alert("Please Select branch"); }


                  
                }
      else {
      
                  
          var data = r_name + "~" + r_hname + "~" + r_dist + "~" + r_state + "~" + r_dob + "~" + r_gender + "~" + r_mob + "~" + r_email + "~" + r_pan + "~" + r_br + "~" + r_reg + "~" + r_pyear ;
       
                    debugger;
                    $.ajax({
                        type: "POST",
                        url: 'AucRec.aspx/shortlist',
                        data: "{data:'" + data + "'}",
                        async: false,
                        cache: false,
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        beforeSend: function () {
                            return confirm("Are you sure you want to confirm?");
                        },
                        success: function (Result) {
                            Result1 = Result.d;
                            if (Result.d.toString() != "333") {

                                $("[id*=hdn_auc_id]").val(Result.d);                              
                                alert("Details Added Successfully. Please attach all the documents for Confirmation.");
                            }
                            else {
                                alert('Error Occured!');
                            }
                        },
                        error: function () {
                            alert('Invalid Entry!');

                        }
                    });



                }
               
      
  
}


function aadhardtl() {
    var v1 = $("#txt_aadharno").val();
    // var cardno = /^(?:4[0-9]{12}(?:[0-9]{3})?)$/;
    var cardno = /[0-9]{12}/;
    if (v1.match(cardno)) {
        if (v1 == 000000000000) {
            alert("Not a valid Aadhar number!");
            $("#txt_aadharno").val('');
            return false;
        }
        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: "Enrol_personal.aspx/aadhar_valid",
            data: "{ input: '" + v1 + "' }",
            dataType: "json",
            success: function (Result) {
                var res = Result.d;
                if (res == 111) {
                    alert("already exist... enter correct Aadhar no...");
                    $("#txt_aadharno").val('');
                }

            },
            error: function (Result) {

            }
        });
    }
    else {
        //('#error1_show').show;
        alert("Not a valid Aadhar card number!");
        $("#txt_aadharno").val('');
        return false;
    }
}
function pandtl() {
    // $scope.phoneNumbr = /[789][0-9]{9}/;
    //  $scope.email1 = /[^@]+@[^@]+\.[a-zA-Z]{2,6}/;
    //  $scope.aadhar1 = /[0-9]{12}/;
    //   $scope.uname1 = /[A-Z][a-zA-Z]{6}[0-9]{5}/;
    //  $scope.pan1 = /[a-zA-Z]{5}[0-9]{4}[a-zA-Z]{1}/;
    var v1 = $("#txt_panno").val();
    var cardno = /[a-zA-Z]{5}[0-9]{4}[a-zA-Z]{1}/;

    if (v1.match(cardno)) {
        //   return true;

        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: "Enrol_personal.aspx/pan_valid",
            data: "{ input: '" + v1 + "' }",
            dataType: "json",
            success: function (Result) {
                var res = Result.d;

                if (res == 111) {
                    alert("already exist... enter correct pan no...");
                    $("#txt_panno").val('');
                }

            },
            error: function (Result) {

            }
        });
    }
    else {
        alert("Not a valid Pan card number!");
        $("#txt_panno").val('');
        return false;
    }
}




//Babu sir change on th spot validation
//$(document).on('change', '#txt_voterID', function () {

//    var r_vote_id = $("#txt_voterID").val();   

//    if (!r_vote_id) {

//        $("#txt_voterID").addClass("makeRed");
//        alert("Please Enter Voters ID!"); return;
//    }
//    else {
//        $("#txt_voterID").removeClass("makeRed");
//    }
//});

//$(document).on('change', '#txt_mobile', function () {

//    var r_vote_id = $("#txt_mobile").val();

//    if (!r_vote_id) {

//        $("#txt_mobile").addClass("makeRed");
//        alert("Please Enter Voters ID!"); return;
//    }
//    else {
//        $("#txt_mobile").removeClass("makeRed");
//    }
//});





//$(document).on('change', '#cmb_percentg', function () {

//    var v1 = $("#cmb_percentg").val();
//    if (v1 == '') { alert("Please Enter percentage of mark! ") }
//    else {
//        if (v1 > 100) {
   
//            alert("Please enter valid percentage");
//            $("#cmb_percentg").val('');
//        }
//        var v2 = $("#txt_per").val();
//        if (v1 == 100 && v2 > 0)
//        {
          
//            alert("Please enter valid percentage");
//            $("#txt_per").val('');
//        }
        
//    }

//});
//$(document).on('change', '#txt_per', function () {

//    var v1 = $("#cmb_percentg").val();
   
//        var v2 = $("#txt_per").val();
//        if (v1 == 100 && v2 > 0) {
            
//            alert("Please enter valid percentage");
//            $("#txt_per").val('');
//        }
    
//        if (v1 == '' && v2 > 0) {
          
//            alert("Please enter valid percentage");
//            $("#txt_per").val('');
//        }

//});


function percent() {
    // var vv = / ^[1-9]\d{0,2}(\.\d{3})*(,\d+)?$/;
  //   alert(0);
    var v1 = $("#cmb_percentg").val();
   
    var x = parseFloat(v1);
    if (isNaN(x) || x <= 0 || x > 100) {
        alert("value is out of range");
        $("#cmb_percentg").val('');
    }
    else {
        var decimalSeparator = ".";
        var val = "" + x;
        if (val.indexOf(decimalSeparator) < val.length - 3) {
            alert("too much decimal");
            $("#cmb_percentg").val('');
        }
    }
}











