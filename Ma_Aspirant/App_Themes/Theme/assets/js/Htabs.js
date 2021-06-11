
//$(document).ready(function () {

//$(window).on("load", GetAllProperties);

function GetAllProperties() {

  //  populate('#from_time');
    var empid = $("[id*=txt_session]").val();
    var br = $("[id*=txt_br]").val();
    var row = br + '~' + empid;
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "H_notific.aspx/branch_detail",
        data: "{ input: '" + row + "' }",
        //dataType: "json",
        success: function (Result) {
            var res = Result.d;
           
            $("#txt_brname").val(res);           
        }
    });
    
    var row = br + '~' + empid;
    
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "H_notific.aspx/cand_codedtl",
        data: "{ input: '" + row + "' }",
       // data: {},
        dataType: "json",
        success: function (Result) {
            Result = Result.d;
            $.each(Result, function (key, value) {
                $("#cmb_appId").append($("<option></option>").val
                    (value.cand_id).html(value.cand_name));


            });
        }
    });   


   
    function populate(selector) {
        var select = $(selector);
        var hours, minutes, ampm;
        for (var i = 0; i <= 1380; i += 60) {
            hours = Math.floor(i / 60);
            minutes = i % 60;
            if (minutes < 10) {
                minutes = '0' + minutes; // adding leading zero to minutes portion
            }
            //add the value to dropdownlist
            select.append($('<option></option>')
                .attr('value', hours)
                .text(hours + ':' + minutes));
        }
    }
}


function emp_load() {
    //   $("#cmb_appId").change(function () {
    var cid = $("#cmb_appId").val();
    //alert(cid);

    $('#datepicker2').datepicker('destroy');
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "H_notific.aspx/cand_detail",
        data: "{cid:'" + cid + "'}",
        dataType: "json",
        success: function (Result) {
            var res = Result.d.split("~");

            //  t.cand_code,t.name,t.house,t.district,t.state,t.dob,t.gender,t.age,t.mobile,t.email,
            $("#txt_name").val(res[1]);
            $("#txt_hname").val(res[2]);
            $("#txt_dist").val(res[3]);
            $("#txt_stat").val(res[4]);
            $("#txt_age").val(res[7]);
            $("#txt_number").val(res[8]);
            $("#txt_mail").val(res[9]);
            $("#txt_dob").val(res[5]);
            $("#txt_gen").val(res[6]);
            document.getElementById('fromdat').innerHTML = res[11];
            document.getElementById('todat').innerHTML = res[12];

            var sdate = Date.parse(res[13]);
            var edate = Date.parse(res[14]);

            $("#txt_d1").val(res[13]);
            $("#txt_d2").val(res[14]);

            $("#txt_quali").val(res[15]);
            $("#txt_uni").val(res[16]);
            $("#txt_per").val(res[17]);
            $("#txt_passout").val(res[18]);
            $("#txt_regnum").val(res[19]);

            $("#txt_post").val(res[20]);
            //alert(res[13]);
            //alert(res[14]);

            var dd1 = Date.parse($("#txt_d1").val());
          //  var dd2 = Date.parse($("#txt_d2").val());

            $('#datepicker2').datepicker({
                dateFormat: 'dd/M/yy',
                //  minDate: new Date(), maxDate: "+2d",
                // minDate: new Date(Date.parse(res[13])), maxDate: new Date(Date.parse(res[14])),
                minDate: new Date(dd1), //maxDate: new Date(dd2),
                onSelect: function (dateText, inst) {
                    var today = new Date();
                    today = Date.parse(today.getMonth() + 1 + '/' + today.getDate() + '/' + today.getFullYear());
                    var selDate = Date.parse(dateText);
                    if (selDate < today) {
                        //If the selected date was before today, continue to show the datepicker
                        $('#datepicker2').val('');
                        $(inst).datepicker('hide');
                    }
                    //if(selDate>Date.parse(res[14]))
                    //{ $('#datepicker2').val('');
                    //    $(inst).datepicker('hide');}
                }
            });




        },
        error: function (Result) {
        }
    });

    // });
}


function schedule_interview() {
    //debugger;
    //insert schedule time to database and send sms 
    var dt = $("#datepicker2").val();
    var tm = $("#from_time").find('option:selected').text();
    var cd = $("#cmb_appId").val();
    var num = $("#txt_number").val(); 
    var name = $("#txt_name").val();
    var brname = $("#txt_brname").val();

    //16july2020
    var empid = $("[id*=txt_session]").val();
    id = cd + '~' + empid;
    var time = $("#from_time").val();
    if (dt == '' || time == 0 || cd == -1) {

        if (dt == '')
        { alert("please select interview date"); return false; }
        else if (time == 0)
        { alert("please select interview time"); return false; }
        else if (cd == -1)
        { alert("please select candidate"); return false; }
    }
    else {
        $('#PModalBehaviour').modal();
        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: "H_notific.aspx/insert_detail",
            data: "{date:'" + dt + "',time:'" + tm + "',code:'" + id + "',number:'" + num + "',name:'" + name + "',brname:'" + brname + "'}",
            dataType: "json",
            success: function (Result) {
                var res = Result.d;
                $("#btn_next").prop("disabled", false);
                $("#btn_saves").prop("disabled", true);
                $('#PModalBehaviour').modal('hide');
                alert(res);
                sendsms();
                window.open("../HO_Admin/H_notific.aspx", "_self");
            }
        });

    }

}

function sendsms() {
    //alert("sendinf sms");

}
    function bhschedul_tab() {
        window.open("../HO_Admin/H_notific.aspx", "_self");
    }
    function verify_tab() {
        window.open("../HO_Admin/H_Verify.aspx", "_self");
    }
       


    