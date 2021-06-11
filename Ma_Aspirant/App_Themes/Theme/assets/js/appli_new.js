
//$(document).ready(function () {

$(window).on("load", GetAllProperties);

function GetAllProperties() {



    $.ajax({                ///State 
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "Application.aspx/state_dtl",
        data: {},
        dataType: "json",
        success: function (Result) {
            Result = Result.d;
            $.each(Result, function (key, value) {
                $("#cmb_state").append($("<option></option>").val
                    (value.state_id).html(value.state_name));


            });
            $("#cmb_state").change(function () {

                var statname = $(this).find('option:selected').text();
                var sid = $(this).val();
                var ddrgn = $("#cmb_region");
                ddrgn.empty(); // this line is for clear all 
                ddrgn.append($("<option></option").val("-1").html("--SELECT REGION--"));

                $.ajax({                ///region 
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    url: "Application.aspx/reg_dtl",
                    data: "{stid:'" + sid + "'}",
                    dataType: "json",
                    success: function (Result) {
                        Result = Result.d;
                        $.each(Result, function (key, value) {
                            $("#cmb_region").append($("<option></option>").val
                                (value.reg_id).html(value.reg_name));
                        });

                        $("#cmb_region").change(function () {
                            var rgnname = $(this).find('option:selected').text();
                            var rid = $(this).val();
                            var ddbrnch = $("#cmb_branch");
                            ddbrnch.empty(); // this line is for clear all 
                            ddbrnch.append($("<option></option").val("-1").html("--SELECT BRANCH--"));

                            $.ajax({                ///Branch 
                                type: "POST",
                                contentType: "application/json; charset=utf-8",
                                url: "Application.aspx/branch_dtl",
                                data: "{rid:'" + rid + "'}",
                                dataType: "json",
                                success: function (Result) {
                                    Result = Result.d;
                                    $.each(Result, function (key, value) {
                                        $("#cmb_branch").append($("<option></option>").val
                                            (value.branch_id).html(value.branch_name));
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

            });

        },
        error: function (Result) {
        }
    });



    $.ajax({
        type: "POST",
        url: 'Application.aspx/vcncy_dtl',
        data: {},
        async: false,
        cache: false,
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (Result) {
            Result = Result.d;
            var javc = Result.split('~')[0].toString();
            var hkvc = Result.split('~')[1].toString();
            //alert(javc);
            //alert(hkvc);

            document.getElementById('span_vcncyja').innerHTML = javc;
            document.getElementById('span_vcncy_hk').innerHTML = hkvc;
            blinktext();


        },
        error: function (request, error) {
            alert(error);


        }
    });



    //function blinktext(){
    //    var f = document.getElementById('span_vcncyja').innerHTML;
    //    alert(f);

    //setInterval(function () {
    //    f.style.visibility = (f.style.visibility == 'hidden' ? ' ' : 'hidden');
    //    //},200);
    //}
}


function getpage() {
    window.location.href = "Recruitment/Personal_Info.aspx"
}
function getpage1() {
    var r_branch = $("#cmb_branch").find('option:selected').val();
    if (r_branch == -1) { alert('Please Select preferred Branch!'); return; }

    $.ajax({
        type: "POST",
        url: 'Application.aspx/brnch_id',
        data: "{brid:'" + r_branch + "'}",
        async: false,
        cache: false,
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (Result) {

            window.location.href = "Opprtunity.aspx";

        },
        error: function (request, error) {

        }
    });



}






