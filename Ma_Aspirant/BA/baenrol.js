




$(window).on("load", GetAllProperties);


function GetAllProperties() {    

    $("#txt_dob").datepicker({
        dateFormat: 'dd/MM/yy',
        changeMonth: true,
        changeYear: true,     
        maxDate: new Date(),
        minDate: '-115Y',      
        onClose: function (dateText, inst) {         
        }
        //----     
    });
 
    $("#txt_wa").datepicker({
        dateFormat: 'dd/MM/yy',
        changeMonth: true,
        changeYear: true,
        maxDate: new Date(),
        minDate: '-225Y',
        onClose: function (dateText, inst) {
        }
        //----     
    });
    $("#txt_wa").datepicker("setDate", new Date());
    getfilldata("1");
    getfilldata("6");
    getfilldata("7");
    getfilldata("8");

}

function getfilldata(flag) {
   

    var indta = "";
    if (flag == "2") {
        indta = "2~" + $("#ddl_state").find('option:selected').val();
    }
    else if (flag == "22" ) {
        indta = "2~" + $("#ddl_bstate").find('option:selected').val();
    }
    else if (flag == "3" || flag == "4" ) {
        indta = flag+"~" + $("#ddl_district").find('option:selected').val();
    }
    else if (flag == "9") {
        indta = flag + "~" + $("#ddl_bdistrict").find('option:selected').val();
    }
    else if (flag == "5") {
        indta = "5~" + $("#ddl_post").find('option:selected').val();
    }
    else if (flag == "10") {
        indta = "10~" + $("#ddl_bank").find('option:selected').val();
    }


    
    else {
        indta = flag;
    }
    $.ajax({
        type: "post",
        contentType: "application/json; charset=utf-8",
        url: "BAEnroll.aspx/GetDropList",
        data: "{indata: '" + indta + "'}",
        async: false,
        dataType: "json",
        success: function (Result) {
            Result = Result.d;

            if (flag == "1") {                

                $.each(Result, function (key, value) {
                    $('#ddl_state').append($("<option></option>").val(value.did).html(value.dname));
                });
                $.each(Result, function (key, value) {
                    $('#ddl_bstate').append($("<option></option>").val(value.did).html(value.dname));
                });
            }
            else if (flag == "2") {
                $('#ddl_district').html("");
                $('#ddl_district').append($("<option></option>").val("-1").html("---Select----"));
                $.each(Result, function (key, value) {
                    $('#ddl_district').append($("<option></option>").val(value.did).html(value.dname));
                });
            }
            else if (flag == "22") {
                $('#ddl_bdistrict').html("");
                $('#ddl_bdistrict').append($("<option></option>").val("-1").html("---Select----"));
                $.each(Result, function (key, value) {
                    $('#ddl_bdistrict').append($("<option></option>").val(value.did).html(value.dname));
                });
            }
            else if (flag == "3") {
                $('#ddl_branch').html("");
                $('#ddl_branch').append($("<option></option>").val("-1").html("---Select----"));
                $.each(Result, function (key, value) {
                    $('#ddl_branch').append($("<option></option>").val(value.did).html(value.dname));
                });
            }
            else if (flag == "4") {
                $('#ddl_post').html("");
                $('#ddl_post').append($("<option></option>").val("-1").html("---Select----"));
                $.each(Result, function (key, value) {
                    $('#ddl_post').append($("<option></option>").val(value.did).html(value.dname));
                });
            }
            else if (flag == "5") {
                $.each(Result, function (key, value) {
                    $('#txt_pincode').val(value.did);
                });
            }
            else if (flag == "6") {               
                $.each(Result, function (key, value) {
                    $('#ddl_qln').append($("<option></option>").val(value.did).html(value.dname));
                });
            }
            else if (flag == "7") {
                $.each(Result, function (key, value) {
                    $('#ddl_occpn').append($("<option></option>").val(value.did).html(value.dname));
                });
            }
            else if (flag == "8") {
                $.each(Result, function (key, value) {
                    $('#ddl_accnt').append($("<option></option>").val(value.did).html(value.dname));
                });
            }
            else if (flag == "9") {
                $('#ddl_bank').html("");
                $('#ddl_bank').append($("<option></option>").val("-1").html("---Select----"));
                $.each(Result, function (key, value) {
                    $('#ddl_bank').append($("<option></option>").val(value.did).html(value.dname));
                });
            }

            else if (flag == "10") {
                $('#ddl_bbranch').html("");
                $('#ddl_bbranch').append($("<option></option>").val("-1").html("---Select----"));
                $.each(Result, function (key, value) {
                    $('#ddl_bbranch').append($("<option></option>").val(value.did).html(value.dname));
                });
            }
        

    

        },
        error: function (Result) {

            alert("Error");
        }
    });

}

$(document).on('change', '#txt_panID', function () {

    var cardno = /[a-zA-Z]{5}[0-9]{4}[a-zA-Z]{1}/;


    var v1 = $("#txt_pan").val();
    if (v1 == '') { alert("Please Enter PAN ID! ") }
    else {
       
        if (v1.match(cardno)) {
          
        }
        else {
            alert("Not a valid Pan card number!");
            $("#txt_pan").val('');
            return false;
        }
        /////////////////////////---------------
    }

});

$(document).on('change', '#ddl_state', function () {
    getfilldata("2");
});
$(document).on('change', '#ddl_bstate', function () {
    getfilldata("22");
});


$(document).on('change', '#ddl_district', function () {
    getfilldata("3");
    getfilldata("4");   
});
$(document).on('change', '#ddl_bdistrict', function () {
   
    getfilldata("9");
});

$(document).on('change', '#ddl_post', function () {
    getfilldata("5");
});

$(document).on('change', '#ddl_bank', function () {
    getfilldata("10");
});

$(document).on('change', '#ddl_bbranch', function () {
    $('#txt_ifsc').val($("#ddl_bbranch").find('option:selected').val());

    
}); 
$(document).on('change', '#txt_name', function () {
    $('#txt_bname').val($('#txt_name').val());
}); 




function getAge(dateString) {
         
    var today = new Date();
    var birthDate = new Date(dateString);
    //var birthDate = dateString;
    var age = today.getFullYear() - birthDate.getFullYear();
    var m = today.getMonth() - birthDate.getMonth();
    if (m < 0 || (m === 0 && today.getDate() < birthDate.getDate())) {
        age--;
    }
    if (age < 18) {
        alert("Age must be above 17");
        $('#txt_age').val("");
        return false;
    }
    $('#txt_age').val(age);
    // return age;
}
function NumberOnly() {
    var AsciiValue = event.keyCode
    if ((AsciiValue >= 48 && AsciiValue <= 57) || (AsciiValue == 8 || AsciiValue == 127))
        event.returnValue = true;
    else
        event.returnValue = false;
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
        if ((charCode > 64 && charCode < 91) || (charCode > 96 && charCode < 123) || charCode == 32)
            return true;
        else
            return false;
    }
    catch (err) {
        alert(err.Description);
    }
}
function isNumberKey(evt, element) {

    var charCode = (evt.which) ? evt.which : event.keyCode
    if (charCode > 31 && (charCode < 48 || charCode > 57) && !(charCode == 8))
        return false;
}


var imageData1;
var imageData2;
var imageData3;
var imageData4;
var uploadval;

function upload(type) {
   
        if (type == 1) {
            var fileList = document.getElementById("filePAN").files;
        }
        else if (type == 2) {
            var fileList = document.getElementById("fileID").files;
        }
        else if (type == 3) {
            var fileList = document.getElementById("filePass").files;
        }
        else if (type == 4) {
            var fileList = document.getElementById("filephoto").files;
        }
       
        var fileReader = new FileReader();
        if (fileReader && fileList && fileList.length) {

            fileReader.readAsDataURL(fileList[0]);
            fileReader.onload = function () {

                if (type == 1) {
                     imageData1 = fileReader.result;
                }
                else if (type == 2) {
                     imageData2 = fileReader.result;
                }
                else if (type == 3) {
                     imageData3 = fileReader.result;
                }
                else if (type == 4) {
                     imageData4 = fileReader.result;
                }
              
                var file1 = fileList[0];
                var ftype = file1.type;
                var fsize = fileList[0].size / 1024 / 1024;

                var validImageTypes = ["image/gif", "image/jpeg", "image/png"];
                if ($.inArray(ftype, validImageTypes) < 0) {
                    alert("File type should be gif,jpeg,png.");
                    return false;
                }
                else if (fsize > 0.73) {
                    alert("File size should be less than 700KB.");
                    return false;
                }
                else {
                    if (type == 1) {
                        $("#btn_pan").html("Uploaded");                      
                    }
                    else if (type == 2) {
                        $("#btn_id").html("Uploaded");                    

                    }
                    else if (type == 3) {
                        $("#btn_chk").html("Uploaded");                       
                    }
                    else if (type == 4) {

                        $("#btn_ba").html("Uploaded");                       
                    }
                    if ($("#btn_ba").html() == "Uploaded" && $("#btn_chk").html() == "Uploaded" && $("#btn_pan").html() == "Uploaded" && $("#btn_id").html() == "Uploaded")
                    {
                        uploadval = 1;
                    }
                   
                }

            };
        }
        else {
            alert("Select Any File");
            return;
        }
    
}


function confirm_basic() {

    var brid = $("#ddl_branch").find('option:selected').val();
    var rname = $("#txt_name").val();
    var hname = $("#txt_housename").val();
    var rstate = $("#ddl_state").find('option:selected').val();
    var r_dist = $("#ddl_district").find('option:selected').val();
    var ifsc = $("#txt_ifsc").val();
    var bbrid = $("#ddl_bbranch").find('option:selected').text();
    var accno = $("#txt_accno").val();
    var acctype = $("#ddl_accnt").find('option:selected').val();
    var mobno = $("#txt_mobile").val();
    var userid = "111";
    var bankid = $("#ddl_bank").find('option:selected').val().split('~')[1].toString();
    var neftname = $("#txt_bname").val();
    var p_state = $("#ddl_bstate").find('option:selected').val();
    var p_dist = $("#ddl_bdistrict").find('option:selected').val();
    var p_pin = $("#txt_pincode").val();
    var ocpn = $("#ddl_occpn").find('option:selected').val();
    var age = $("#txt_age").val();
    var pan = $("#txt_panID").val();
    var qual = $("#ddl_qln").find('option:selected').val();
    var gen = $("#ddl_gender").find('option:selected').val();
    var otp = "OTP Verified";
    var dob = $("#txt_dob").val();
    var wed = $("#txt_wa").val();

    var email = $("#txt_email").val();

    var mobotp = $("#txt_mchk").val();   
    var mailotp = $("#txt_emchk").val();
  
   // var data1 = brid + "~" + rname + "~" + hname + "~" + rstate + "~" + r_dist + "~" + ifsc + "~" + bbrid + "~" + accno + "~" + acctype + "~" + mobno + "~" + userid + "~" + bankid + "~" + neftname + "~" + p_state + "~" + p_dist + "~" + p_pin + "~" + ocpn + "~" + age + "~" + pan + "~" + qual + "~" + gen + "~" + otp + "~" + dob + "~" + wed + "~" +  email; 
   
    if (brid == '-1' || rname == '' || hname == '' || rstate == '-1' || r_dist == '-1' || ifsc == '' || bbrid == '-1' || accno == '' || acctype == '-1' || mobno == '' || userid == '' || bankid == '-1' || neftname == '' || p_state == '-1' || p_dist == '-1' || p_pin == '' || ocpn == '-1' || age == '' || pan == '' || qual == '-1' || gen == '' || otp == '' || dob == '' ||  email == '' || mobotp != '1' || mailotp != '1')
    {
        if (mobotp != '1' || mailotp != '1') {
            alert("Please validate Mobile Number & Mail ID.")
        }
        else {
            alert("Please fill all the fields.");
        }


    }
    else {
   
    upload(1);
    upload(2);
    upload(3);
    upload(4);  
   
  
    if (document.getElementById("fileID").files.length > 0 && document.getElementById("filePAN").files.length > 0 && document.getElementById("filePass").files.length > 0 && document.getElementById("filephoto").files.length > 0 && uploadval==1) {

           
      
            var data = brid + "~" + rname + "~" + hname + "~" + rstate + "~" + r_dist + "~" + ifsc + "~" + bbrid + "~" + accno + "~" + acctype + "~" + mobno + "~" + userid + "~" + bankid + "~" + neftname + "~" + p_state + "~" + p_dist + "~" + p_pin + "~" + ocpn + "~" + age + "~" + pan + "~" + qual + "~" + gen + "~" + otp + "~" + dob + "~" + wed + "~" + email;
      //  var data = "3038~DFGDFG~DFGDSFG~18~390~AUBL0002151~SURENDRANAGARCITY CENTER~345634636346786~10~8129252311~111~216~DFGDFG~27~826~680306~56~20~ASDFG1234R~34~1~OTP Verified~14/June/2000~23/June/2020~SABIBABU86@GMAIL.COM";
           
            debugger;
            $.ajax({
                type: "POST",
                url: 'BAEnroll.aspx/BAEnrollment',
                data: "{input:'" + data + "',image1:'" + imageData1 + "',image2:'" + imageData2 + "',image3:'" + imageData3 + "',image4:'" + imageData4 + "'}",
                async: false,
                cache: false,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                beforeSend: function () {
                    return confirm("Are you sure you want to confirm?");
                },
                success: function (Result) {
                    Result1 = Result.d;
                    if (Result.d.toString() != "222") {
                                               
                        alert(Result.d.toString());
                        if (Result.d.toString().split('.')[0] == "BA Successfully created") {
                            window.open('BAEnroll.aspx', '_self');
                        }
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
        else {
           alert("Please attach the files");
        }
    }



}

function numpercent(e) {

    var keyCode = (e.which) ? e.which : e.keyCode;
    if ((keyCode >= 48 && keyCode <= 57) || (keyCode == 8))
        return true;
    else if (keyCode == 46) {
        var curVal = document.activeElement.value;
        if (curVal != null && curVal.trim().indexOf('.') == -1)
            return true;
        else
            return false;
    }
    else
        return false;
}



function leftTrim(element) {
    if (element)
        element.value = element.value.replace(/^\s+/, "");
}




function mobile_otp() {
   
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
        url: 'BAEnroll.aspx/sendOTPfn',
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
        url: 'BAEnroll.aspx/loginauth',
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
        url: 'BAEnroll.aspx/sendOTPfn_mail',
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
        url: 'BAEnroll.aspx/loginauth_mail',
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