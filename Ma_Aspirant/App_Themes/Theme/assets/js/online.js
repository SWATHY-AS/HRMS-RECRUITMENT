//alert("load");
function test_pass() {
   // alert("jhbvjdfbjg");
    debugger;
    //314630--8/8
    var empid = $("[id*=txt_session]").val();

    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "candidate_photo.aspx/test_checking",
        data: "{ input:'" + empid + "'}",
        dataType: "json",
        success: function (Result) {
            Result = Result.d;
            //   alert(Result);
            var res = Result.split("~");
   
           // alert(res[0]);
           // $(/*"#linko").show();*/
            if (res[0] == "0") {
                $("#linko").show();
            }
            else {
                $("#linko").hide();

            }

        }, error: function (Result) {
            alert("error");
        }
    });
        //error: function (Result) {
        //    alert("Please Reduce size of document and try again");
        //    //alert("Uploaded");
        //}
   

        }
function q1() {
   // alert("qwerty");
    var q1 = 0;
    var id = 1;
    if ($('input[id=rd_q11]').is(':checked')) {
        q1 = 1;
    }
    else if ($('input[id=rd_q12]').is(':checked')) {
        q1 = 2;
    }
    else if ($('input[id=rd_q13]').is(':checked')) {
        q1 = 3;
    }
    else if ($('input[id=rd_q14]').is(':checked')) {
        q1 = 4;
    }
    else {
        q1 = 0;
    }
    var data = q1 + "~" + id;
    confirm_test(data);

    debugger;
    $("#qu2").show();
    $("#qu1").hide();

   
    //$("#qu2").show();
   // document.getElementById('qu2').show();
}
function prev2() {
    $("#qu2").hide();
    $("#qu1").show();
    

}
function next2() {
    $("#qu2").hide();
    $("#qu1").hide();
    $("#qu3").show();
    var q2 = 0;
    var id = 2;

    if ($('input[id=rdo1q2]').is(':checked')) {
        q2 = 1;
    }
    else if ($('input[id=rdo2q2]').is(':checked')) {
        q2 = 2;
    }
    else if ($('input[id=rdo3q2]').is(':checked')) {
        q2 = 3;
    }
    else if ($('input[id=rdo4q2]').is(':checked')) {
        q2 = 4;
    }
    else {
        q2 = 0;
    }
    var data = q2 + "~" + id;
    confirm_test(data);

}
function prev3() {
   
   
    $("#qu1").hide();
    $("#qu3").hide();
    $("#qu2").show();

}
function next3() {
    var q3 = 0;
    var id = 3;

    if ($('input[id=rdo1q3]').is(':checked')) {
        q3 = 1;
    }
    else if ($('input[id=rdo2q3]').is(':checked')) {
        q3 = 2;
    }
    var data = q3 + "~" + id;
    confirm_test(data);

    $("#qu1").hide();
    $("#qu3").hide();
    $("#qu4").show();


}
function next4() {
    var q4 = 0;
    var id = 4;

    if ($('input[id=rdo1q4]').is(':checked')) {
        q4 = 1;
    }
    else if ($('input[id=rdo2q4]').is(':checked')) {
        q4 = 2;
    }
    else if ($('input[id=rdo3q4]').is(':checked')) {
        q4 = 3;
    }
    else if ($('input[id=rdo4q4]').is(':checked')) {
        q4 = 4;
    }
    else {
        q4 = 0;
    }
    var data = q4 + "~" + id;
    confirm_test(data);
    $("#qu1").hide();
    $("#qu4").hide();
    $("#qu5").show();
}
function prev4() {
   
    $("#qu1").hide();
    $("#qu4").hide();
    $("#qu3").show();
    
}
function next5() {
    var q5 = 0;
    var id = 5;
    if ($('input[id=rdo1q5]').is(':checked')) {
        q5 = 1;
    }
    else if ($('input[id=rdo2q5]').is(':checked')) {
        q5 = 2;
    }
    var data = q5 + "~" + id;
    confirm_test(data);

    $("#qu5").hide();
    $("#qu1").hide();
    $("#qu6").show();
}
function prev5() {
    $("#qu5").hide();
    $("#qu1").hide();
    $("#qu4").show();
    

}
function next6() {
    var q6 = 0;
    var id = 6;
    if ($('input[id=rdo1q6]').is(':checked')) {
        q6 = 1;
    }
    else if ($('input[id=rdo2q6]').is(':checked')) {
        q6 = 2;
    }
    else if ($('input[id=rdo3q6]').is(':checked')) {
        q6 = 3;
    }
    else if ($('input[id=rdo4q6]').is(':checked')) {
        q6 = 4;
    }
    else {
        q6 = 0;
    }
    var data = q6 + "~" + id;
    confirm_test(data);

    $("#qu6").hide();
    $("#qu1").hide();
    $("#qu7").show();
}
function prev6() {
    $("#qu6").hide();
    $("#qu1").hide();
    $("#qu5").show();
  
}
function next7() {
    var q7 = 0;
    var id = 7;
    if ($('input[id=rdo1q7]').is(':checked')) {
        q7 = 1;
    }
    else if ($('input[id=rdo2q5]').is(':checked')) {
        q7 = 2;
    }
    var data = q7 + "~" + id;
    confirm_test(data);

    $("#qu7").hide();
    $("#qu1").hide();
    $("#qu8").show();
}
function prev7() {
    $("#qu7").hide();
    $("#qu1").hide();
    $("#qu6").show();
  
}
function next8() {
    var q8 = 0;
    var id = 8;
    if ($('input[id=rdo1q8]').is(':checked')) {
        q8 = 1;
    }
    else if ($('input[id=rdo2q8]').is(':checked')) {
        q8 = 2;
    }
    else if ($('input[id=rdo3q8]').is(':checked')) {
        q8 = 3;
    }
    else if ($('input[id=rdo4q8]').is(':checked')) {
        q8 = 4;
    }
    else {
        q8 = 0;
    }
    var data = q8 + "~" + id;
    confirm_test(data);
    $("#qu1").hide();
    $("#qu8").hide();
    $("#qu9").show();
}
function prev8() {
    $("#qu1").hide();
    $("#qu8").hide();
    $("#qu7").show();
  
}
function next9() {
    var q9 = 0;
    var id = 9;

    if ($('input[id=rdo1q9]').is(':checked')) {
        q9 = 1;
    }
    else if ($('input[id=rdo2q9]').is(':checked')) {
        q9 = 2;
    }
    var data = q9 + "~" + id;
    confirm_test(data);
    $("#qu9").hide();
    $("#qu1").hide();
    $("#qu10").show();

}
function prev9() {

    $("#qu9").hide();
    $("#qu1").hide();
    $("#qu8").show();
    

}
function prev10() {

    $("#qu9").show();
    $("#qu1").hide();
    $("#qu10").hide();
   
}
function finish() {
    var empid = $("[id*=txt_session]").val();

    var id = 10;
    if ($('input[id=rdo1q10]').is(':checked')) {
        q10 = 1;
    }
    else if ($('input[id=rdo2q10]').is(':checked')) {
        q10 = 2;
    }
    else if ($('input[id=rdo3q10]').is(':checked')) {
        q10 = 3;
    }
    else if ($('input[id=rdo4q10]').is(':checked')) {
        q10 = 4;
    }
    else {
        q10 = 0;
    }
    var data = q10 + "~" + id;
    confirm_test(data);
    finish_data(empid);
    //alert("Finish..!!");
}
function rdoq1_conf() {
    var q1 = 0;
    var id = 1;
    if ($('input[id=rd_q11]').is(':checked')) {
        q1 = 1;
    }
    else if ($('input[id=rd_q12]').is(':checked')) {
        q1 = 2;
    }
    else if ($('input[id=rd_q13]').is(':checked')) {
        q1 = 3;
    }
    else if ($('input[id=rd_q14]').is(':checked')) {
        q1 = 4;
    }
    else {
        q1 = 0;
    }
    var data = q1 + "~" + id;
    confirm_test(data);
}
function rdoq2_conf() {

    var q2 = 0;
    var id = 2;

    if ($('input[id=rdo1q2]').is(':checked')) {
        q2 = 1;
    }
    else if ($('input[id=rdo2q2]').is(':checked')) {
        q2 = 2;
    }
    else if ($('input[id=rdo3q2]').is(':checked')) {
        q2 = 3;
    }
    else if ($('input[id=rdo4q2]').is(':checked')) {
        q2 = 4;
    }
    else {
        q2 = 0;
    }
    var data = q2 + "~" + id;
    confirm_test(data);


}
function rdoq3_conf() {
    var q3 = 0;
    var id = 3;

    if ($('input[id=rdo1q3]').is(':checked')) {
        q3 = 1;
    }
    else if ($('input[id=rdo2q3]').is(':checked')) {
        q3 = 2;
    }
    var data = q3 + "~" + id;
    confirm_test(data);


}
function rdoq4_conf() {
    var q4 = 0;
    var id = 4;

    if ($('input[id=rdo1q4]').is(':checked')) {
        q4 = 1;
    }
    else if ($('input[id=rdo2q4]').is(':checked')) {
        q4 = 2;
    }
    else if ($('input[id=rdo3q4]').is(':checked')) {
        q4 = 3;
    }
    else if ($('input[id=rdo4q4]').is(':checked')) {
        q4 = 4;
    }
    else {
        q4 = 0;
    }
    var data = q4 + "~" + id;
    confirm_test(data);


}
function rdoq5_conf() {
    var q5 = 0;
    var id = 5;
    if ($('input[id=rdo1q5]').is(':checked')) {
        q5 = 1;
    }
    else if ($('input[id=rdo2q5]').is(':checked')) {
        q5 = 2;
    }
    var data = q5 + "~" + id;
    confirm_test(data);

}
function rdoq6_conf() {
    var q6 = 0;
    var id = 6;
    if ($('input[id=rdo1q6]').is(':checked')) {
        q6 = 1;
    }
    else if ($('input[id=rdo2q6]').is(':checked')) {
        q6 = 2;
    }
    else if ($('input[id=rdo3q6]').is(':checked')) {
        q6 = 3;
    }
    else if ($('input[id=rdo4q6]').is(':checked')) {
        q6 = 4;
    }
    else {
        q6 = 0;
    }
    var data = q6 + "~" + id;
    confirm_test(data);

}
function rdoq7_conf() {
    var q7 = 0;
    var id = 7;
    if ($('input[id=rdo1q7]').is(':checked')) {
        q7 = 1;
    }
    else if ($('input[id=rdo2q5]').is(':checked')) {
        q7 = 2;
    }
    var data = q7 + "~" + id;
    confirm_test(data);


}
function rdoq8_conf() {

    var q8 = 0;
    var id = 8;
    if ($('input[id=rdo1q8]').is(':checked')) {
        q8 = 1;
    }
    else if ($('input[id=rdo2q8]').is(':checked')) {
        q8 = 2;
    }
    else if ($('input[id=rdo3q8]').is(':checked')) {
        q8 = 3;
    }
    else if ($('input[id=rdo4q8]').is(':checked')) {
        q8 = 4;
    }
    else {
        q8 = 0;
    }
    var data = q8 + "~" + id;
    confirm_test(data);


}
function rdoq9_conf() {
    var q9 = 0;
    var id = 9;

    if ($('input[id=rdo1q9]').is(':checked')) {
        q9 = 1;
    }
    else if ($('input[id=rdo2q9]').is(':checked')) {
        q9 = 2;
    }
    var data = q9 + "~" + id;
    confirm_test(data);

}
function rdoq10_conf() {
    //var q10 = 0;
    //var empid = 339610;
    var id = 10;
    if ($('input[id=rdo1q10]').is(':checked')) {
        q10 = 1;
    }
    else if ($('input[id=rdo2q10]').is(':checked')) {
        q10 = 2;
    }
    else if ($('input[id=rdo3q10]').is(':checked')) {
        q10 = 3;
    }
    else if ($('input[id=rdo4q10]').is(':checked')) {
        q10 = 4;
    }
    else {
        q10 = 0;
    }
    var data = q10 + "~" + id;
  //  alert("10");
    confirm_test(data);
   // finish(empid);

}
function confirm_test(data) {
    var empid = $("[id*=txt_session]").val();
    var da = empid + "~" + data;
    debugger;

    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "online_test_page.aspx/insertion_testt",
        data: "{ input:'" + da + "'}",
        dataType: "json",
        success: function (Result) {
            Result = Result.d;
            var res = Result.split("~");
            if (res[0] == "1") {
            }
            else {

            }
           
        }, error: function (Result) {
            alert("error");
        }
    });

}
function finish_data(empid) {
    var empid = $("[id*=txt_session]").val();
   //var empid = 4877;
    
    debugger;

    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "online_test_page.aspx/finish_testt",
        data: "{ input:'" + empid + "'}",
        dataType: "json",
        success: function (Result) {
            Result = Result.d;
            //   alert(Result);
            var res = Result.split("~");
            if (res[0] >= 8) {
                $("#myModal").show();
                $("#test_result").show();
                $("#close").show();
                $("#retest").hide();
                $("#test_result").append("Congratulations...!!!");
                window.open("../Recruitment/candidate_photo.aspx", "_self");

                 //alert("Congratulations.......!!!");
            }
            else  {
                //alert(res[0]);
                $("#test_result").hide();
                $("#test_result_failed").show();
                $("#close").hide();
                $("#retest").show();
                $("#test_result_failed").append("Failed...!!!");
                $("#myModal").show();
                $(document).on("click", "#retest", function (event) {
                    window.open("../Recruitment/online_test_page.aspx", "_self");

                });
            }

        }, error: function (Result) {
            alert("error");
        }
    });

}



