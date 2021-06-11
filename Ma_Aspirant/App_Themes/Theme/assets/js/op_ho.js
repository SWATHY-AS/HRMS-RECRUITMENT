


function table_load() {
    //alert("table_load");
    $("#tbl_q1").show();
    
    $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: "Job_Search.aspx/Job_Serch",
            data: "{ input: '" + 1 + "' }",
            dataType: "json",
            success: function (Result) {
                for (var i = 0; i < Result.d.length; i++) {
                    if ($("tbl_emp tr").length == 0) {
                        //$('#tbl_emp').append('<tr style="background-color:darkcyan;color:black"><th class="text-center">S.NO</th><th class="text-center">Position</th><th class="text-center">Designation</th><th class="text-center">Department</th></tr>');
                        $("#tbl_emp").append('<tr>'+
                                 '<td> <a href="../Oppurtunity_HO.aspx?id=' + Result.d[i].vpost + '">' + Result.d[i].vpname + '</a></td>' +
                                 '<td>' + Result.d[i].vgrade + '</td>' +
                                 '<td>' + Result.d[i].vdepart + '</td>' +

       //'<td><input type="checkbox" data-toggle="collapse" data-target="#cheq"  id="chkSelect' + parseInt(i + 1) + '"/></td>' +
                              //'<td><input type="checkbox" data-toggle="collapse" data-target="#cheq" checked="checked" id="chkSelect' + parseInt(i + 1) + '/></td>' +
                                '</tr>'
                         );

                    }
                    else {
                        $("#tbl_emp").append('<tr> <td>' + Result.d[i].vpost + '</td>' +
                                  '<td>' + + Result.d[i].vpname + '</a>'+ '</td>' +
                                  '<td>' + Result.d[i].vgrade + '</td>' +
                                  '<td>' + Result.d[i].vdepart+ '</td>' +

        //'<td><input type="checkbox" data-toggle="collapse" data-target="#cheq"  id="chkSelect' + parseInt(i + 1) + '"/></td>' +
                               //'<td><input type="checkbox" data-toggle="collapse" data-target="#cheq" checked="checked" id="chkSelect' + parseInt(i + 1) + '/></td>' +
                                 '</tr>'
                          );
                    }
                }
            },
            error: function (Result) {
            }
        });
    }

//$(window).on("load", GetAllProperties);
function GetAllProperties() {

    var ide = $("[id*=txt_id]").val();
    //alert("ide"+ide);
    $.ajax({      

        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: 'Oppurtunity_HO.aspx/vcncy_dtl',
        data: "{ input: '" + ide + "' }",
        dataType: "json",
        
        success: function (Result) {
            Result = Result.d;
          //  alert(Result.length);
              //var javc = Result.split('~')[0].toString();
            //var hkcount = Result.split('~')[1].toString();
            //var brname = Result.split('~')[2].toString();

            //alert(javc);
            //alert(hkvc);
            //var 
            //for (var i = 0; i < Result.length; i++) {
            //    alert('test1');
            var pid = Result.split("~");
            
            document.getElementById('L_post_name').innerHTML = pid[1].toString();
            document.getElementById('lbl_location').innerHTML = pid[2].toString();
            document.getElementById('lbl_minqual').innerHTML = pid[4].toString();
            document.getElementById('lbl_dep').innerHTML = pid[5].toString();
            document.getElementById('Lbl_exp').innerHTML = pid[6].toString();
            document.getElementById('lbl_bsalary').innerHTML = pid[7].toString();
            document.getElementById('lbl_vacancy').innerHTML = pid[8].toString();
            document.getElementById('lbl_skils').innerHTML = pid[9].toString();
            document.getElementById('lbl_date').innerHTML = pid[11].toString();
            document.getElementById('lbl_Jobcode').innerHTML = pid[12].toString();
            document.getElementById('lbl_benifit').innerHTML = pid[13].toString();
            document.getElementById('lbl_accomdation').innerHTML = pid[14].toString();
            //}
        
            var qid1 = "-1";
            var br = $("[id*=txt_br]").val();
            var qid = qid1 + ' ~' + br;
            $.ajax({                ///salary HK 
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "Opprtunity.aspx/salary_dtl",
                data: "{qid:'" + qid + "',typ:'H'}",
                dataType: "json",
                success: function (Result) {
                    Result = Result.d;
                    var basic = Result.split('~')[0].toString();
                    var vda = Result.split('~')[1].toString();
                    document.getElementById('lbl_hsalary').innerHTML = "Rs. " + basic + ".00 + VDA : Rs." + vda + ".00 ";

                },
                error: function (Result) {
                }
            });



        },
        error: function (request, error) {
            alert(error);


        }
    });

    

    $("#cmp_typeq").change(function () {

        var qid1 = $(this).val();
        var br = $("[id*=txt_br]").val();
        var qid = qid1 + ' ~' + br;
        $.ajax({                /// JA salary 
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: "Opprtunity.aspx/salary_dtl",
            data: "{qid:'" + qid + "',typ:'J'}",
            dataType: "json",
            success: function (Result) {
                Result = Result.d;
                var basic = Result.split('~')[0].toString();
                var vda = Result.split('~')[1].toString();
                document.getElementById('lbl_bsalary').innerHTML = "Rs. " + basic + ".00 + VDA : Rs." + vda + ".00 ";

            },
            error: function (Result) {
            }
        });

    });

    function getpageJA() {
    var vacncy = document.getElementById('lbl_brcount').innerHTML;
  //  if (vacncy != 0) {
        var q = $("#cmp_typeq").val();

        if (q == 0) {
            alert("Please select qualification");
            return;
        } else {
            $.ajax({
                type: "POST",
                url: 'Opprtunity.aspx/typedetail',
                data: "{tid:1,qual:'" + q + "'}",
                async: false,
                cache: false,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (Result) {

                    window.location.href = "Recruitment/Personal_Info.aspx";

                },
                error: function (request, error) {

                }
            });

        }
  //  }
}

  
    $.ajax({                ///State 
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "Opprtunity.aspx/state_dtl",
        data: {},
        dataType: "json",
        success: function (Result) {
            Result = Result.d;
            $.each(Result, function (key, value) {
                $("#cmp_state").append($("<option></option>").val
                    (value.state_id).html(value.state_name));


            });
            $("#cmp_state").change(function () {


                var statname = $(this).find('option:selected').text();
                var sid = $(this).val();

                var ddis = $("#cmp_dist");
                ddis.empty(); // this line is for clear all 
                ddis.append($("<option></option").val("-1").html("--SELECT DISTRICT--"));

                $.ajax({                ///district 
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    url: "Opprtunity.aspx/dis_dtl",
                    data: "{stid:'" + sid + "'}",
                    dataType: "json",
                    success: function (Result) {
                        Result = Result.d;
                        $.each(Result, function (key, value) {
                            $("#cmp_dist").append($("<option></option>").val
                                (value.dis_id).html(value.dis_name));
                        });


                    },
                    error: function (Result) {
                    }
                });

            });

        },
        error: function (Result) {
        }
    });

}

///////////
function getNextPage() {
    var br = $("[id*=txt_id]").val();
   // alert(br);
    //window.location.href = "HO_Website/Personal_Info_HO.aspx? id="+br;
    window.open("HO_Website/Personal_Info_HO.aspx?id=" + br, "_blank");

   // alert(br);
    $.ajax({
        type: "POST",
        url: 'Personal_Info_HO.aspx/typedetail',
        data: "{ tid: '" + br + "' }",
        async: false,
        cache: false,
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (Result) {
            alert(result);
            window.location.href = "HO_Website/Personal_Info_HO.aspx";

        },
        error: function (request, error) {

        }
    });
}
///////
$(document).on('change', '#txt_panID', function () {

    var cardno = /[a-zA-Z]{5}[0-9]{4}[a-zA-Z]{1}/;


    var v1 = $("#txt_panID").val();
    if (v1 == '') { alert("Please Enter PAN ID! ") }
    else {
        var votenam = $("#txt_name").val().toUpperCase();
        if (v1.match(cardno)) {
            $.ajax({
                type: 'POST',
                url: 'Personal_Info_HO.aspx/GetPandetails',
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
                url: 'Personal_Info_HO.aspx/GetPandetails_name',
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
                    //  $("#txt_panname").val(accountname);

                    if (accountname == "INVALID") {
                        $("#txt_panname").prop("disabled", false);
                        $("#txt_panname").val('');
                    }
                    else {
                        $("#txt_panname").val(accountname);
                        $("#txt_panname").prop("disabled", true);
                    }
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
        //PModalBehaviour

        $.ajax({
            type: 'POST',
            url: 'Personal_Info_HO.aspx/GetVotedetails',
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


                        if (res11[7] == null || res11[7] == '') {
                            //   alert('asdasd');
                            $("#txt_dob").attr("disabled", false);

                        }
                        if (res11[6] == null || res11[6] == '' || res11[6] == '.') {
                            //   alert('asdasd');
                            $("#txt_housename").attr("disabled", false);

                        }
                        //if (res11[7] == '') {

                        //    $("#txt_dob").prop('disabled', false);

                        //}
                        //else { $("#txt_dob").prop('disabled', true); }
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
                url: 'Personal_Info_HO.aspx/GetBankdetails',
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
                url: 'Personal_Info_HO.aspx/GetBankdetails_name',
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
                    if (accountname == "INVALID") {
                        $("#txt_bname").prop("disabled", false);
                        $("#txt_bname").val('');
                    }
                    else {
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


        $('#aadhar').show();
        $('#vote').hide();
        $('#upld').hide();
        $('#upddiv').hide();
        $('#camdiv').hide();

        $("#txt_name").attr("disabled", false);
        $("#txt_housename").attr("disabled", false);
        $("#txt_dist").attr("disabled", false);
        $("#txt_state").attr("disabled", false);
        $("#txt_dob").attr("disabled", false);
        $("#txt_gender").attr("disabled", false);
        $("#txt_account").attr("disabled", false);
        $("#txt_ifsc").attr("disabled", false);
        //QRCode_Reader  
        //  window.location.href = "123.html";
        //window.location.href = "../Recruitment/Aadharupload.aspx";

    }
    else {
        $('#aadhar').hide();
        $('#upld').hide();
        $('#vote').show();
        $('#upddiv').hide();
        $('#camdiv').hide();

    }
});

function validateO() {
    //alert("hello");
   
    var r_mob = $("#txt_mobile").val();
    var otp = $("#otp").val();
    var pp = r_mob + '~' + otp;
   // alert(pp);
    
    $.ajax({
        type: "POST",
        url: 'Personal_Info_HO.aspx/loginauth',
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

function DOBNull() {


    $("#txt_dob").datepicker({
        dateFormat: 'dd/mm/yy',

        changeMonth: true,
        changeYear: true,
        //stepMonths: true,
        todayHighlight: true,
        //onSelect: function (dateText, inst) {

        //    var pst = $("[id*=txt_post]").val();
        //    //var pst = HttpContext.Current.Session["type_id"];
        //    //alert(pst);
        //    $.ajax({


        //        type: 'POST',
        //        url: 'Personal_Info_HO.aspx/AgeDetails',
        //        //  url:'Login.aspx/loginauth',
        //        data: "{ date : '" + dateText + "',post:'" + pst + "' }",
        //        async: false,
        //        cache: false,
        //        contentType: "application/json; charset=utf-8",
        //        dataType: "json",
        //        success: function (Result) {
        //            res = Result.d;
        //            // alert("Your Information loaded");



        //            // SUCCESS~COMPLETED~SUCCESS~Krishnapriya~THRISSUR~Kerala~1 / 181 Pallath~21 - 05 - 1996~F~23
        //            var res1 = res.split("µ");
        //            if (res1[0] == "111") {
        //            }


        //            else {

        //                alert(res1[0]);
        //                $("#txt_dob").val('');

        //            }




        //        },
        //        Error: function (Result) {

        //            alert(res1[0]);

        //            $("#txt_dob").val('');
        //            //failed
        //        }
        //    });// End of Ajax


        //}
    });
}


function mail_otp() {
    var r_mob = $("#txt_email").val();
    $('#mailmodal').modal('hide');
    $.ajax({
        type: 'POST',
        url: 'Personal_Info_HO.aspx/sendOTPfn_mail',
        data: "{ number : '" + r_mob + "' }",

        async: false,
        cache: false,
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (Result) {
            res = Result.d;
            //alert(Result);
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
            //alert(res);

        }
    });
}


function validatemailOTPP() {
    alert('validate');
    var r_mob = $("#txt_email").val();
    var otp = $("#txt_mailotp").val();
    var pp = r_mob + '~' + otp;
    //FValert(pp);
    $.ajax({
        type: "POST",
        url: 'Personal_Info_HO.aspx/loginauth_mail',
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
function qualification() {
   // alert("I AM HERE");
    var qid = $("[id*=txt_qual]").val();
    var pst = $("[id*=txt_post]").val();

    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "Personal_Info_HO.aspx/qual_dtl",
        data: "{qid:'" + qid + "',tp:'" + pst + "'}",
        dataType: "json",
        success: function (Result) {
            Result = Result.d;

            $.each(Result, function (key, value) {

                $("#cmb_quali").append($("<option></option>").val
                    (value.qid).html(value.q_name));
            });

            //for (i = 50; i <= 100; i++) {
            //    $("#cmb_percentg").append($('<option></option>').val(i).html(i));
            //}
        }
    });

}

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
function confirm_basic_info() {
    alert("coing");
    
    var r_post = $("[id*=txt_id]").val();
    //alert(r_post);
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

    var r_qual = $("#cmb_quali").find('option:selected').val();

    var r_university = $("#cmb_univrstytin").find('option:selected').val();

    var r_mark = $("#cmb_percentg").val();
    var r_pyear = $("#txt_passout").val();
    var r_baccount = $("#txt_account").val();
    var r_ifsc = $("#txt_ifsc").val();
    var r_pan = $("#txt_panID").val();
    var r_reg = $("#txt_regnum").val();
    var r_name = $("#txt_name").val();



    var bname = $("#txt_bname").val();
    var panname = $("#txt_panname").val();
    var mobver = $("#txt_mchk").val();
    var mailver = $("#txt_emchk").val();

    var mob = $("#idmob").val();
    var mail = $("#idmail").val();
    if (mob == r_mob)
    { var mm = 1; }
    else { mm = 0; }
    if (mail == r_email)
    { var em = 1; }
    else { em = 0; }

    if (r_hname == '' || r_hname == '.' || r_dob == '' || mm == 0 || em == 0 || mobver == '' || mailver == '' || bname == '' || r_name == '' || r_idtype == -1 || (r_vote_id == '' && r_idtype == 2) || r_mob == '' || r_email == '' || r_qual == 0 || r_university == 0 || r_mark == '' || r_pyear == '' || r_baccount == '' || r_ifsc == '' || r_pan == '' || r_reg == '') {

        if (r_idtype == -1) { alert("Please  select ID"); }
        else if (r_vote_id == '' && r_idtype == 2) { alert("Please Enter Voter id"); }
        else if (r_dob == '') { alert("Please  Enter Dateof Birth"); }
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

        else if (mobver == '') { alert("Please Verify Mobile number"); }
        else if (mailver == '') { alert("Please Verify Mailid"); }

        else if (mm == '') { alert("Please Verify Mobile number"); }
        else if (em == '') { alert("Please Verify Mailid"); }
        else if (r_hname == '' || r_hname == '.') { alert("Please Enter House name"); }
    }
    else {
        var data = r_idtype + "~" + r_vote_id + "~" + r_name + "~" + r_hname + "~" + r_dist + "~" + r_state + "~" + r_dob + "~" + r_gender + "~" + r_age + "~" + r_mob + "~" + r_email + "~" + r_qual + "~" + r_university + "~" + r_mark + "~" + r_pyear + "~" + r_baccount + "~" + r_ifsc + "~" + r_pan + "~" + r_reg + "~" + r_post + "~" + bname + "~" + panname;
           alert(data);
          
        $('#PModalBehaviour').modal();
        $.ajax({
            type: "POST",
            url: 'Personal_Info_HO.aspx/shortlist',
            data: "{age:'" + r_age + "',quali:'" + r_qual + "',per:'" + 60 + "',data:'" + data + "'}",
            async: false,
            cache: false,
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            beforeSend: function () {
                return confirm("Are you sure you want to confirm?");
            },
               success: function (Result) {






            //type: "POST",
            //url: 'Personal_Info_HO.aspx/shortlist',
            //data: "{age:'" + r_age + "',quali:'" + r_qual + "',per:'" + r_mark + "',data:'" + data + "'}",
            ////async: false,
            ////cache: false,
            //contentType: "application/json; charset=utf-8",
            //dataType: "json",
            
            //success: function (Result) {
                alert("success");
                Result1 = Result.d;
                alert(Result1);
                var st = Result1.split('~');

                var status = Result1.split('~')[1].toString();
                var code = Result1.split('~')[2].toString();
                //if (code != 0) {
                //    alert("Application Number" + code);
                //}

                //   if (status == "111") {

                // mailandsms
                //------------------------------commented sms send
                if (status == "111") {
                  
                    var code = st[2].toString();
                    $.ajax({
                        type: "POST",
                        url: 'Personal_Info_HO.aspx/sendsms_mail',

                        data: "{name:'" + r_name + "',numb:'" + r_mob + "',code:'" + code + "',email:'" + r_email + "'}",
                        async: false,
                        cache: false,
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (Result) {
                            Result = Result.d;
                            alert('11' + Result);
                            if (Result == "SUCCESS") {
                                $("#btn_conf").prop("disabled", true);

                                $('#PModalBehaviour').modal('hide');
                                alert("Data inserted successfully");
                                // window.open("../Recruitment/Personal_Info.aspx", "_self");//26may2020

                                window.open("../HO_Website/Login_HO.aspx", "_self");


                            }
                            else {

                                $('#PModalBehaviour').modal('hide');
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

                    $('#PModalBehaviour').modal('hide');
                    alert(st[0]);

                }
            },
            error: function () {

                $('#PModalBehaviour').modal('hide');
                alert('Invalid Entry!');

            }
        });



    }



}
function university() {
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "Personal_Info_HO.aspx/uni_dtl",
        data: {},
        dataType: "json",
        success: function (Result) {
            Result = Result.d;
            //$("#cmb_univrstytin").val.empty();
            $.each(Result, function (key, value) {
                $("#cmb_univrstytin").append($("<option></option>").val
                    (value.uid).html(value.u_name));
            });
        },
        error: function () {

            $('#PModalBehaviour').modal('hide');
            alert('Invalid Entry!');

        }
    });
}