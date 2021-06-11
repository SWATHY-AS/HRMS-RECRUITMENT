function load() {
    $.ajax({
        type: "POST",
        url: 'Opprtunity.aspx/favcncy_dtl',
        data: {},
        async: false,
        cache: false,
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (Result) {
            Result = Result.d;
            var javc = Result.split('~')[0].toString();
            var hkcount = Result.split('~')[1].toString();
            var brname = Result.split('~')[2].toString();

            //alert(javc);
            //alert(hkvc);

            document.getElementById('lbl_brcount1').innerHTML = javc;
            document.getElementById('lbl_brname2').innerHTML = brname;
            //document.getElementById('lbl_hkcount').innerHTML = hkcount;
            //document.getElementById('lbl_brname1').innerHTML = brname;
            var qid1 = "-1";
            var br = $("[id*=txt_branch]").val();
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

    $("#cmp_typeq1").change(function () {

        var qid1 = $(this).val();
        var br = $("[id*=txt_branch]").val();
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
                document.getElementById('lbl_bsalary1').innerHTML = "Rs. " + basic + ".00 + VDA : Rs." + vda + ".00 ";

            },
            error: function (Result) {
            }
        });

    });

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
function getpageFA() {
    var vacncy = document.getElementById('lbl_brcount1').innerHTML;
    //  if (vacncy != 0) {
    var q = $("#cmp_typeq1").val();

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
