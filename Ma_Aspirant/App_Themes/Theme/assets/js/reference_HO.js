
function chk()/// for caste checkbox
{
    $(".check").change(function () {
        var checked = $(this).is(':checked');
        $(".check").prop('checked', false);
        if (checked) {
            $(this).prop('checked', true);
        }
    });
    if ($('input[id=ch1]').is(':checked')) { var agree = 1; }
    else { agree = 0; }
    //alert(agree);
}
function save_ref() {
    var empid = $("[id*=txt_session]").val();
    var ref_name1 = $("#txt_name1").val();
    var ref_position1 = $("#txt_position1").val();
    var ref_landno1 = $("#txt_landno1").val();
    var ref_mobno1 = $("#txt_mobno1").val();
    var ref_mail1 = $("#txt_mail1").val();
    var ref_post_office1 = $("#dd_post1").val(); 
    //var ref_pin1 = $("#txt_pin1").val();
   // var ref_state1 = $("#dd_st1").find('option:selected').val(); 
    //var ref_district1 = $("#dd_dist1").find('option:selected').val();

    var ref_name2 = $("#txt_name2").val();
    
    var ref_position2 = $("#txt_position2").val();
    var ref_landno2 = $("#txt_landno2").val();
    var ref_mobno2 = $("#txt_mobno2").val();
    var ref_mail2 = $("#txt_mail2").val();
    var ref_post_office2 = $("#dd_post2").val();
//    var ref_pin2 = $("#txt_pin2").val();
//    var ref_state2 = $("#dd_st2").find('option:selected').val();
 //   var ref_district2 = $("#dd_dist2").find('option:selected').val();

    var ref_date = $("#txt_dt").val();
    var ref_venue = $("#txt_venue").val();
    var agree = 0;
    if ($('input[id=ch1]').is(':checked')) {  agree = 1; }
    else { agree = 0; }
    if (ref_landno2 == '') {

        ref_landno2 = 0;

    }
    if (ref_landno1 == '') {

        ref_landno1 = 0;
    }

    if (agree==0 ||ref_name1 == '' || ref_name2 == '' || ref_position1 == '' || ref_position2 == '' ||  ref_mobno1 == '' || ref_mobno2 == '' || ref_mail1 == '' || ref_mail2 == '' || ref_post_office1 == 0 || ref_post_office2 == 0) {
        if (ref_name1 == '') { alert("Please Enter the name1"); }
        else if (ref_name2 == '') { alert("Please Enter the name2"); }
        else if (ref_position1 == '') { alert("Please Enter position1"); }
        else if (ref_position2 == '') { alert("Please Enter position2"); }
       // else if (ref_landno1 == '') { alert("Please Enter Land phone number1"); }
        //else if (ref_landno2 == '') { alert("Please Enter land phone number2"); }
        else if (ref_mobno1 == '') { alert("Please Enter mobile number1"); }
        else if (ref_mobno2 == '') { alert("Please Enter mobile number2"); }
        else if (ref_mail1 == '') { alert("Please Enter Mail1"); }
        else if (ref_mail2 == '') { alert("Please Enter Mail2"); }
        //else if (ref_state1 == 0) { alert("Please Select State"); }
        //else if (ref_state2 == 0) { alert("Please select state"); }
        //else if (ref_district1 == '') { alert("Please select district"); }
        //else if (ref_district2 == '') { alert("Please select district"); }
        else if (ref_post_office1 == 0) { alert("Please select post office"); }
        else if (ref_post_office2 == 0) { alert("Please select post office"); }
        else if (agree == '') { alert("Please Click I Agree"); }


    }
    else {

        //var filter = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
        //if (!filter.test(txt_mail1)) {
        //    alert('Please provide a valid Email addressreFF1');
        //    email.focus;
        //    $("#txt_mail1").val('');

        //}
        //if (!filter.test(txt_mail2)) {
        //    alert('Please provide a valid Email addressrEFF2');
        //    email.focus;
        //    $("#txt_mail2").val('');

        //}

      
        //var data1 = ref_name1 + "~" + ref_position1 + "~" + ref_landno1 + "~" + ref_mobno1 + "~" + ref_mail1 + "~" + ref_post_office1 + "~" + ref_pin1 + "~" + ref_state1 + "~" + ref_district1 + "~" + ref_date + "~" + ref_venue + "~" + empid;
       
        //var data2 = ref_name2 + "~" + ref_position2 + "~" + ref_landno2 + "~" + ref_mobno2 + "~" + ref_mail2 + "~" + ref_post_office2 + "~" + ref_pin2 + "~" + ref_state2 + "~" + ref_district2 + "~" + ref_date + "~" + ref_venue + "~" + empid;
           

        var data1 = ref_name1 + "~" + ref_position1 + "~" + ref_landno1 + "~" + ref_mobno1 + "~" + ref_mail1 + "~" + ref_post_office1 + "~" +''+ "~" + '' + "~" + '' + "~" + ref_date + "~" + ref_venue + "~" + empid;

        var data2 = ref_name2 + "~" + ref_position2 + "~" + ref_landno2 + "~" + ref_mobno2 + "~" + ref_mail2 + "~" + ref_post_office2 + "~" + '' + "~" +'' + "~" + '' + "~" + ref_date + "~" + ref_venue + "~" + empid;


      
        //alert("yup");
        //var data3 = ref_date + "~" + ref_venue + "~" + agree;
        //alert(data3);
        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: "../HO_Website/Reference_per_HO.aspx/insert_ref",
            data: "{input: '" + data1 + "' }",
            dataType: "json", beforeSend: function () {
                return confirm("Are you sure you want to confirm?");
            },
            success: function (Result) {
                Result = Result.d;
               
            //    var status = Result.split('~')[0].toString();
                //var code = Result.split('~')[1].toString();
               
                //alert(code);
                //if (status == "111") {
                //    alert("Confirmed");
                //}
                //else {
                //    alert("Confirmed");
                //}

                //  qualification_add();
                //window.open("../Recruitment/Doc_Scanning.aspx", "_self");
            },
            error: function (Result) {
            }
        });
        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: "../HO_Website/Reference_per_HO.aspx/insert_ref1",
            data: "{input2: '" + data2 + "' }",
            dataType: "json", beforeSend: function () {
                return confirm("Are you sure you want to confirm?");
            },
            success: function (Result) {
                Result = Result.d;
                
               // var status = Result.split('~')[0].toString();
                //var code = Result.split('~')[1].toString();
               
                //alert(code);
                if (Result == "111") {
                    alert("Confirmed");
                }
                else {
                    alert("Confirmed");
                }

                
            },
            error: function (Result) {
            }
        });
        clear_refdata();
        window.open("../HO_Website/Doc_Scanning_HO.aspx", "_self");
    }
}

function chkemail(a) {
    //alert(a);
    var email = document.getElementById(a);
    //alert(email);
    var filter = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
    if (!filter.test(email.value)) {
        alert('Please provide a valid email address');
        email.focus;
        $("#txt_mail1").val('');
        return false;
    }
}
function chkemail1(a) {
    //alert(a);
    var email = document.getElementById(a);
    //alert(email);
    var filter = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
    if (!filter.test(email.value)) {
        alert('Please provide a valid email address');
        email.focus;
        $("#txt_mail2").val('');
        return false;
    }
}


  //  $(window).on("load", GetAllProperties);
    function GetAllProperties11() {
       
        cand_load();
        
        $.ajax({
            ///State
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: "../HO_Website/Reference_per_HO.aspx/state_dtl",
            data: {},
            dataType: "json",
            success: function (Result) {

                Result = Result.d;

                $.each(Result, function (key, value) {

                    $("#dd_st1").append($("<option></option>").val
                        (value.state_id).html(value.state_name));
                    $("#dd_st2").append($("<option></option>").val
                        (value.state_id).html(value.state_name));

                });
                $("#dd_st2").change(function () {
                    var str = $(this).find('option:selected').text();
                    var sid = $(this).val();
                    if (!isNaN(sid)) {
                        var dddist = $("#dd_dist2");
                        dddist.empty(); // this line is for clear all 
                        dddist.append($("<option></option>").val("0").html("--SELECT--"));
                        $.ajax({
                            type: "POST",
                            url: '../HO_Website/Reference_per_HO.aspx/dist_dtl',
                            data: "{stid:'" + sid + "'}",
                            async: false,
                            cache: false,
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            success: function (Result) {
                                Result = Result.d;
                                $.each(Result, function (key, value) {
                                    dddist.append($("<option></option>").val
                                        (value.dist_id).html(value.dist_name));
                                });//post
                                $("#dd_dist2").change(function () {
                                    var str = $(this).find('option:selected').text();
                                    var dsid = $(this).val();
                                    if (!isNaN(dsid)) {
                                        var ddpost = $("#dd_post2");
                                        ddpost.empty(); // this line is for clear all 
                                        ddpost.append($("<option></option>").val("0").html("--SELECT--"));
                                        $.ajax({
                                            type: "POST",
                                            url: '../HO_Website/Reference_per_HO.aspx/post_dtl',
                                            data: "{did:'" + dsid + "'}",
                                            async: false,
                                            cache: false,
                                            contentType: "application/json; charset=utf-8",
                                            dataType: "json",
                                            success: function (Result) {
                                                Result = Result.d;
                                                $.each(Result, function (key, value) {
                                                    ddpost.append($("<option></option>").val
                                                        (value.post_id).html(value.post_name));
                                                });
                                                //textbox  change
                                                $("#dd_post2").change(function () {
                                                  
                                                    var str = $(this).find('option:selected').text();
                                                    var dpid = $(this).val();

                                                    if (!isNaN(dpid)) {


                                                        $.ajax({
                                                            type: "POST",
                                                            contentType: "application/json; charset=utf-8",
                                                            url: "../HO_Website/Reference_per_HO.aspx/get_pin",
                                                            data: "{pid:'" + dpid + "'}",
                                                            async: false,
                                                            cache: false,
                                                            dataType: "json",
                                                            success: function (Result) {
                                                                var res = Result.d;


                                                                $("#txt_pin2").val(res);
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
                                });

                            },
                            error: function (Result1) {
                            }
                        });
                    }
                });//end
                $("#dd_st1").change(function () {
                    var str = $(this).find('option:selected').text();
                    var sid = $(this).val();
                    if (!isNaN(sid)) {
                        var dddist = $("#dd_dist1");
                        dddist.empty(); // this line is for clear all 
                        dddist.append($("<option></option>").val("0").html("--SELECT--"));
                        $.ajax({
                            type: "POST",
                            url: '../HO_Website/Reference_per_HO.aspx/dist_dtl',
                            data: "{stid:'" + sid + "'}",
                            async: false,
                            cache: false,
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            success: function (Result) {
                                Result = Result.d;
                                $.each(Result, function (key, value) {
                                    dddist.append($("<option></option>").val
                                        (value.dist_id).html(value.dist_name));
                                });//post
                                $("#dd_dist1").change(function () {
                                    var str = $(this).find('option:selected').text();
                                    var dsid = $(this).val();
                                    if (!isNaN(dsid)) {
                                        var ddpost = $("#dd_post1");
                                        ddpost.empty(); // this line is for clear all 
                                        ddpost.append($("<option></option>").val("0").html("--SELECT--"));
                                        $.ajax({
                                            type: "POST",
                                            url: '../HO_Website/Reference_per_HO.aspx/post_dtl',
                                            data: "{did:'" + dsid + "'}",
                                            async: false,
                                            cache: false,
                                            contentType: "application/json; charset=utf-8",
                                            dataType: "json",
                                            success: function (Result) {
                                                Result = Result.d;
                                                $.each(Result, function (key, value) {
                                                    ddpost.append($("<option></option>").val
                                                        (value.post_id).html(value.post_name));
                                                });
                                                //textbox  change
                                                $("#dd_post1").change(function () {
                                                 
                                                    var str = $(this).find('option:selected').text();
                                                    var dpid = $(this).val();


                                                    if (!isNaN(dpid)) {


                                                        $.ajax({
                                                            type: "POST",
                                                            contentType: "application/json; charset=utf-8",
                                                            url: "../HO_Website/Reference_per_HO.aspx/get_pin",
                                                            data: "{pid:'" + dpid + "'}",
                                                            async: false,
                                                            cache: false,
                                                            dataType: "json",
                                                            success: function (Result) {
                                                                var res = Result.d;


                                                                $("#txt_pin1").val(res);
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
                                });

                            },
                            error: function (Result1) {
                            }
                        });
                    }
                });//end



            },
            error: function (Result) {
            }
        });
    }


function cand_load() {
   
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "Reference_per_HO.aspx/cand_detail",
        data: {},
        async: false,
        cache: false,
        dataType: "json",
        success: function (Result) {
            var res = Result.d.split("~");  
            $("#txt_name3").val(res[0]);
            $("#txt_dt").val(res[1]);
        },
        error: function (Result) {
        }
    });
}

function clear_refdata() {
    $("#txt_name1").val('');
    $("#txt_position1").val('');
    $("#txt_landno1").val('');
    $("#txt_mobno1").val('');
    $("#txt_mail1").val('');
    $("#txt_pin1").val('');


    $("#txt_name2").val('');
    $("#txt_position2").val('');
    $("#txt_landno2").val('');
    $("#txt_mobno2").val('');
    $("#txt_mail2").val('');
    $("#txt_pin2").val('');


}
