
//function upload() {


//    var fileList = document.getElementById("fileRen").files;
//    var fileReader = new FileReader();
//    if (fileReader && fileList && fileList.length) {

//        fileReader.readAsDataURL(fileList[0]);
//        fileReader.onload = function () {
//            var imageData = fileReader.result;
//            if ($("#txt_aucid").val() == "") {
//                alert("Enter Auctioneer ID");
//            }
//            else {

//                var indata = $("#txt_aucid").val() + "µ" + $("#lbl_agsdt").text();

//                $.ajax({
//                    type: "POST",
//                    contentType: "application/json; charset=utf-8",
//                    url: "BARenew.aspx/doc_upload",
//                    data: "{input: '" + indata + "',image:'" + imageData + "'}",
//                    dataType: "json",
//                    beforeSend: function () {
//                        return confirm("Are you sure you want to confirm?");
//                    },
//                    success: function (Result) {

//                        alert("Successfully Uploaded");
//                        $("#txt_aucid").val("")
//                        $("#fileRen").val('');


//                    },
//                    error: function (Result) {
//                        alert("Please reduce file size and try again.");
//                    }

//                });
//            }
//        };
//    }
//    else {
//        alert("Select Any File");
//        return;
//    }

//}
function visible() {
    if ($("#rb_yes").prop("checked") == true) {

        $("#term_cndtns").show();
    }
    else if ($("#rb_no").prop("checked") == true) {

        $("#term_cndtns").hide();


    }



}

function hide() {
    $('#over').hide();

    $('#modal').hide();
}

function confirm_final() {

    $.ajax({
        type: "POST",
        url: 'BARenew.aspx/checkDetails',
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

function searchAuctioneer() {

    var r_name = $("#txt_aucid").val();


    $.ajax({
        type: "POST",
        url: 'BARenew.aspx/searchBA',
        data: "{data:'" + r_name + "'}",
        async: false,
        cache: false,
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        beforeSend: function () {

        },
        success: function (Result) {
            Result1 = Result.d;
            if (Result.d.toString() != "666") {
                if (Result.d.toString() != "333") {
                    $("#lbl_name").text(Result1.split('~')[0].toString())
                    $("#lbl_agsdt").text(Result1.split('~')[1].toString())
                    $("#lbl_brnch").text(Result1.split('~')[2].toString())
                    $("#lbl_brnchcntct_no").text(Result1.split('~')[3].toString())
                    $("#lbl_baphn").text(Result1.split('~')[4].toString())


                }
                else {
                    alert('You already renewed');
                }
            }
            else {
                alert('Invalid BA code');
                window.location = "../Ba/BARenew.aspx";
            }
        },
        error: function () {
            alert('Invalid Entry!');

        }
    });

   




}
function confirm_sendotp() {
    
    var flag = "";
    var r_name = $("#txt_aucid").val();
    var otp = $("#txt_otp").text();
    var indata = r_name + "µ" + otp;
    if (($("#rb_yes").prop("checked") == true)) {
       
        if (($("#chk_agre").prop("checked") == false)) {

            alert("Please accept the terms and conditions!!");
            return false;
        }
    }
    else if (($("#rb_no").prop("checked") == true)) {

        flag = 1;
    }
    else {
        alert("Please enter all fields!!!te")
        return false;
    }
    
        if (r_name == "" || (($("#rb_yes").prop("checked") == false) && ($("#rb_no").prop("checked") == false))) {
            alert("Please enter all fields!!!");
            return false;
        }
        else {
            
            $.ajax({
                type: "post",
                contentType: "application/json; charset=utf-8",
                url: "BARenew.aspx/sendotp",
                data: "{data:'" + indata + "'}",
                dataType: "json",
                success: function (Result) {

                    //alert("OTP sended to registered mobile number");
                    //alert(Result.d.toString());


                    $('#over').show();
                    $('#modal').css({
                        "width": "60%",
                        "height": "60%",
                        "opacity": "1.0"
                    });
                    $('#modal').show();


                },
                error: function (Result) {
                    alert("error");
                    alert(Result.d.toString());
                }


            });
        }
   
   

}

function verify_otp() {
    var flag = "";
   
   
    var otp = $("#txt_otp").val();
    var exp_dt = $("#lbl_agsdt").text();
    var r_name = $("#txt_aucid").val();
    if (($("#rb_yes").prop("checked") == true)) {
        flag = 0;
        
    }
    else if (($("#rb_no").prop("checked") == true)) {

        flag = 1;
    }
    var indata = otp + "µ" + r_name + "µ" + exp_dt + "µ" + flag; 

    $.ajax({
        type: "post",
        contentType: "application/json; charset=utf-8",
        url: "BARenew.aspx/verifyotp",
        data: "{data:'" + indata + "'}",
        dataType: "json",
        success: function (Result) {

           
            alert(Result.d.toString());
            $('#over').hide();

            $('#modal').hide();
           
            
            window.location = "../Ba/BARenew.aspx";

        },
        error: function (Result) {
           
            alert(Result.d.toString());
        }


    });


}

function onlyNos(e, t) {


    try {
        if (window.event) {
            //To disable other button clicks
            if (window.event.keyCode == 13) {
                e.preventDefault();
                //  if (!($('#txt_PartAmount').prop(disable, true))) {

            }
            var charCode = window.event.keyCode;
        }
        else if (e) {
            var charCode = e.which;
        }
        else { return true; }
        if (charCode > 31 && (charCode < 48 || charCode > 57)) {
            return false;
        }
        return true;
    }
    catch (err) {
        alert(err.Description);
    }
}


















