function qualification() {
    var qid = $("[id*=txt_qual]").val();
    var pst = $("[id*=txt_post]").val();

    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "Personal_Info.aspx/qual_dtl",
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
    url: "Personal_Info.aspx/uni_dtl",
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
            $.ajax({
                type: 'POST',
                url: 'Personal_Info.aspx/GetPandetails',
                //  url:'Login.aspx/loginauth',
                data: "{ ID : '" + v1 + "',source:'" + votenam + "'}",

                async: false,
                cache: false,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (Result) {
                    res = Result.d;
                    // alert(res);
                    $('#ModalBehaviour').modal();
                    $('#msgCntpopup').html('Do you want to proceed  ' + res + '%. matched......!!!');
                    //-------------------04/jan2020
                    //if (res.split('"~"')[1].toString() == "INVALID") {

                    //    alert("Invalid PAN");
                    //    $("#txt_panID").val('');
                    //}
                    //else {//"VALID"~"RAVEENDRAN NAIR"~"06/07/2018"~"RETHEESH"
                    //    //"VALID"~"JITHIN"~"30/07/2017"~null
                    //    //"VALID"~"UNNIKRISHNAN"~"18/12/2018"~"KRISHNAPRIYA"
                    //    // alert("Your name is" + res.split('"~"')[1].toString() + "and Your PAN last updated on" + res.split('"~"')[2].toString());                                      
                    //    var panname = res.split('"~"')[1].toString().toUpperCase();
                    //    var panname1 = res.split('"')[3].toString().toUpperCase();
                    //    var firstpannm = panname.split(' ')[0].toString();  
                    //    var firstpannm1 = panname1.split(' ')[0].toString();
                    //    //   var firstvotenm = votenam.split(' ')[0].toString(); 
                    //    //alert(votenam);
                    //    //alert(firstpannm1);
                    //    if (votenam.indexOf(firstpannm) != -1) {
                    //        alert("Valid Account");
                    //    }
                    //    else if  (votenam.indexOf(firstpannm1) != -1) {
                    //        alert("Valid Account");
                    //    }
                    //    else {
                    //        alert("Your Voters ID name and PAN name doesn't match. Please enter your valid PAN ID!");
                    //        $("#txt_panID").val('');
                    //    }
                    //                   }
                    //-------------------------end


                },
                Error: function (Result) {
                    //failed
                }
            });// End of Ajax


            $.ajax({
                type: 'POST',
                url: 'Personal_Info.aspx/GetPandetails_name',
                //  url:'Login.aspx/loginauth',
                data: "{ ID : '" + v1 + "' }",

                async: false,
                cache: false,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (Result) {
                    res = Result.d;

                    //VALID~UNNIKRISHNAN~18/12/2018~KRISHNAPRIYA
                    var accountname = res.toString().toUpperCase();
                    $("#txt_panname").val(accountname);
                },
                Error: function (Result) {
                    //failed
                }
            });
        }
        else {
            alert("Not a valid Pan card number!");
            $("#txt_panID").val('');
            return false;
        }
        /////////////////////////---------------
    }

});
function acccon() {
    $("#txt_ifsc").val("");
    $("#txt_account").val("");
}
function pancon() {
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
            url: 'Personal_Info.aspx/GetVotedetails',
            //  url:'Login.aspx/loginauth',
            data: "{ ID : '" + v1 + "',post:'" + r_post + "' }",

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

$(document).on('change', '#txt_ifsc', function () {

    var v1 = $("#txt_ifsc").val();

    var v2 = $("#txt_account").val();
    if (v2 == '') { alert("Please Enter account number!"); }
    if (v1 == '') { alert("Please Enter IFSC code! "); }
    else {
        $('#mod_acc').modal();
        var votenam = $("#txt_name").val().toUpperCase();
        var cardno = /[A-Z|a-z]{4}[0][a-zA-Z0-9]{6}$/;
        if (v1.match(cardno)) {
            $.ajax({
                type: 'POST',
                url: 'Personal_Info.aspx/GetBankdetails',
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
                url: 'Personal_Info.aspx/GetBankdetails_name',
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

                    $("#txt_bname").val(accountname);
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

function confirm_basic() {
    var r_idtype = $("#ddl_selID").find('option:selected').val();
    var r_vote_id = $("#txt_voterID").val();
    var r_qual = $("#cmb_qualin").find('option:selected').val();

    //  var r_vote_id = $("#txt_voterID").val();
    var r_br = $("[id*=txt_br]").val();
    var r_post = $("[id*=txt_post]").val();
    var r_name = $("#txt_name").val();
    var r_dist = $("#txt_dist").val();
    var r_state = $("#txt_state").val();
    var r_dob = $("#txt_dob").val();
    var r_gender = $("#txt_gender").val();
    var r_age = $("#txt_age").val();
    var r_mob = $("#txt_mobile").val();

    var r_email = $("#txt_email").val();
    var r_degree = $("#cmb_qualin").find('option:selected').val();
    var r_university = $("#cmb_univrstytin").val();
    var r_mark = $("#cmb_percentg").val();
    var r_pyear = $("#txt_passout").val();
    var r_reg = $("#txt_regnum").val();
    var r_baccount = $("#txt_account").val();
    var r_ifsc = $("#txt_ifsc").val();
    var r_pan = $("#txt_panID").val();

    //var per1 = $("#cmb_percentg").val();
    //var per2 = $("#txt_per").val();
    //r_mark = '';
    //if (per2 == '')
    //{
    //    var r_mark = $("#cmb_percentg").val();

    //}
    //else {
    //    r_mark = per1 + '.' + per2;
    //}

    //if (r_vote_id == '') { alert("Please Enter Voters ID!"); return; } 
    if (r_mob == '') { alert('Please Enter Valid Mobile Number!'); return; }


    if (r_mob != "") {
        var filter = /^\d*(?:\.\d{1,2})?$/;
        if (filter.test(r_mob)) {
            if (r_mob.length != 10) {
                alert('Please enter 10  digit mobile number');

                return;
            }
        }
        else {
            alert('Not a valid mobile number');
            return;
        }
    }


    //var filter = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
    //if (!filter.test(r_email)) {
    //    alert('Please provide a valid Email address');
    //    email.focus;
    //    $("#txt_email").val('');

    //}

    if (r_mark >= 100 || r_name == '' || r_idtype == -1 || (r_vote_id == '' && r_idtype == 2) || r_mob == '' || r_email == '' || r_qual == 0 || r_university == 0 || r_mark == '' || r_pyear == '' || r_baccount == '' || r_ifsc == '' || r_pan == '' || r_reg == '') {
        if (r_idtype == -1) { alert("Please  select ID"); return; }
        else if (r_vote_id == '' && r_idtype == 2) { alert("Please Enter Voter id"); return; }
        if (r_degree == 0) { alert('Please Enter Highest Qualification!'); return; }
        //var checked = $("#ch3").is(':checked');
        ////if (checked == false) { alert('Checkbox is unchecked!'); return; }
        if (r_university == 0) { alert('Please Enter Your University name!'); return; }
        else if (r_reg == '') { alert("Please Reg Number"); return; }

        else if (r_qual == 0) { alert("Please  Select Qualification"); }
        if (r_mark == '' || r_mark >= 100) { alert('Please Enter valid Marks/Percentage obtained!'); return; }
        if (r_pyear == '') { alert('Please Enter valid Passout Year!'); return; }
        if (r_baccount == '') { alert('Please Enter Your Bank Account!'); return; }
        if (r_ifsc == '') { alert('Please Enter IFSC code!'); return; }
        if (r_pan == '') { alert('Please Enter Your PAN ID!'); return; }

    } else {
        // alert(123);
        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: "Personal_Info.aspx/pan_valid",
            data: "{ input: '" + r_pan + "' }",
            dataType: "json",
            success: function (Result) {
                var res = Result.d;

                if (res == 111) {
                    alert("already exist... enter correct pan no...");
                    $("#txt_panno").val('');
                }
                else {


                    alert("Your Mobile Number is " + r_mob);

                    $.ajax({
                        type: 'POST',
                        url: 'Personal_Info.aspx/sendOTPfn',
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

                            }
                            else { alert("Failed to send OTP to your Number!! Please Enter valid number!"); }

                        },
                        Error: function (Result) {
                            res = Result.d;
                            alert(res);

                        }
                    });


                }
            },
            error: function (Result) {

            }
        });


    }


}
function mobile_otp() {
    alert("Your Mobile Number is " + r_mob);

    $.ajax({
        type: 'POST',
        url: 'Personal_Info.aspx/sendOTPfn',
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

            }
            else { alert("Failed to send OTP to your Number!! Please Enter valid number!"); }

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
        url: 'Personal_Info.aspx/loginauth',
        data: "{otp:'" + pp + "'}",
        async: false,
        cache: false,
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (Result) {
            Result = Result.d;

            if (Result == "111") {
                $('#myModal1').modal('hide');
                alert('Valid OTP!');
                var r_br = $("[id*=txt_br]").val();
                var r_post = $("[id*=txt_post]").val();
                var r_idtype = $("#ddl_selID").find('option:selected').val();
                var r_vote_id = $("#txt_voterID").val();
                var r_name = $("#txt_name").val();
                var r_hname = $("#txt_housename").val();
                var r_dist = $("#txt_dist").val();
                var r_state = $("#txt_state").val();
                var r_dob = $("#txt_dob").val();
                var r_gender = $("#txt_gender").val();
                var r_age = $("#txt_age").val();
                var r_mob = $("#txt_mobile").val();

                var r_email = $("#txt_email").val();

                var r_qual = $("#cmb_qualin").find('option:selected').val();

                var r_university = $("#cmb_univrstytin").find('option:selected').val();

                var r_mark = $("#cmb_percentg").val();
                var r_pyear = $("#txt_passout").val();
                var r_baccount = $("#txt_account").val();
                var r_ifsc = $("#txt_ifsc").val();
                var r_pan = $("#txt_panID").val();
                var r_reg = $("#txt_regnum").val();
                var r_name = $("#txt_name").val();


                //var per1 = $("#cmb_percentg").val();
                //var per2 = $("#txt_per").val();
                //r_mark = '';
                //if (per2 == '')
                //{ var r_mark = $("#cmb_percentg").val(); }
                //else {
                //    r_mark = per1 + '.' + per2;

                //}
                var bname = $("#txt_bname").val();
                var panname = $("#txt_panname").val();
                if (bname == '' || r_name == '' || r_idtype == -1 || (r_vote_id == '' && r_idtype == 2) || r_mob == '' || r_email == '' || r_qual == 0 || r_university == 0 || r_mark == '' || r_pyear == '' || r_baccount == '' || r_ifsc == '' || r_pan == '' || r_reg == '') {

                    if (r_idtype == -1) { alert("Please  select ID"); }
                    else if (r_vote_id == '' && r_idtype == 2) { alert("Please Enter Voter id"); }
                    else if (r_mob == '') { alert("Please  Enter Mobile Number"); }
                    else if (r_email == '') { alert("Please  Enter Email ID"); }
                    else if (r_qual == 0) { alert("Please  Select Qualification"); }
                    else if (r_university == 0) { alert("Please  Select University"); }
                    else if (r_mark == '') { alert("Please  Enter Mark"); }
                    else if (r_pyear == '') { alert("Please  Select Year"); }
                    else if (r_baccount == '') { alert("Please  Enter Bank Account "); }
                    else if (r_ifsc == '') { alert("Please  Enter IFSC "); }
                    else if (r_pan == '') { alert("Please Enter Pan Number"); }
                    else if (r_reg == '') { alert("Please Reg Number"); }
                    else if (r_name == '') { alert("Please select Valid ID"); }

                    else if (bname == '') { alert("Please Enter Account Holder name"); }

                }
                else {
                    var data = r_idtype + "~" + r_vote_id + "~" + r_name + "~" + r_hname + "~" + r_dist + "~" + r_state + "~" + r_dob + "~" + r_gender + "~" + r_age + "~" + r_mob + "~" + r_email + "~" + r_qual + "~" + r_university + "~" + r_mark + "~" + r_pyear + "~" + r_baccount + "~" + r_ifsc + "~" + r_pan + "~" + r_reg + "~" + r_br + "~" + r_post + "~" + bname + "~" + panname;
                    // alert(data);
                    $.ajax({
                        type: "POST",
                        url: 'Personal_Info.aspx/shortlist',
                        data: "{age:'" + r_age + "',quali:'" + r_qual + "',per:'" + 60 + "',data:'" + data + "'}",
                        async: false,
                        cache: false,
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        beforeSend: function () {
                            return confirm("Are you sure you want to confirm?");
                        },
                        success: function (Result) {
                            Result = Result.d;
                            // alert(11);
                            var st = Result.split('~');

                            var status = Result.split('~')[1].toString();
                            var code = Result.split('~')[2].toString();
                            //if (code != 0) {
                            //    alert("Application Number" + code);
                            //}

                            //   if (status == "111") {

                            // mailandsms
                            //------------------------------commented sms send
                            if (st[1] == "111") {
                                var code = st[2].toString();
                                $.ajax({
                                    type: "POST",
                                    url: 'Personal_Info.aspx/sendsms_mail',

                                    data: "{name:'" + r_name + "',numb:'" + r_mob + "',code:'" + code + "'}",
                                    async: false,
                                    cache: false,
                                    contentType: "application/json; charset=utf-8",
                                    dataType: "json",
                                    success: function (Result) {
                                        Result = Result.d;
                                        if (Result == "SUCCESS") {
                                            $("#btn_conf").prop("disabled", true);
                                            alert("applied successfully,If you shortlisted we will informed through SMS");

                                        }
                                        else {
                                            alert("Unable to send SMS!!");
                                        }
                                    },
                                    error: function (request, error) {
                                        alert(error);


                                    }
                                });


                                //End Mail and SMS
                            }

                            else {
                                alert(st[0]);

                            }
                        },
                        error: function () {
                            alert('Invalid Entry!');

                        }
                    });



                }

                //send sms and send email about interview and documents.
            }
            else {
                alert('Invalid OTP!');

            }
        },
        error: function () {
            alert('Invalid Entry!');

        }
    });



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











