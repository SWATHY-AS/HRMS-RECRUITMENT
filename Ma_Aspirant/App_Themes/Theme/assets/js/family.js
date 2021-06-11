function add_familystatus() {//enroll_family_dtl
       var emp = $("[id*=txt_session]").val();
    var family = $("#ddl_family").val();
    var resi = $("#ddl_resi").val();
    var value = $("#txt_value").val();

    var e_father = $("#txt_father").val();
    var e_fqual = $("#ddl_fquali").val();
    var e_forg = $("#ddl_forgtyp").val();
    // var e_forgother = $("#txt_forgtyp").val();
    if (e_forg == 6)
    { var e_forgother = $("#txt_forgtyp").val(); }
    else { var e_forgother = ''; }

    var f_sal = 22;
    if ($('input[id=f_ch1]').is(':checked'))
    { var f_sal = 1; }
    if ($('input[id=f_ch2]').is(':checked'))
    { var f_sal = 2; }
    if ($('input[id=f_ch3]').is(':checked'))
    { var f_sal = 3; }
    if ($('input[id=f_ch4]').is(':checked'))
    { var f_sal = 4; }
    if ($('input[id=f_ch5]').is(':checked'))
    { var f_sal = 5; }

    var e_mother = $("#txt_mother").val();
    var e_mqual = $("#ddl_mquali").val();
    var e_morg = $("#ddl_morgtyp").val();
    //  var e_morgother = $("#txt_morgtyp").val();
    if (e_morg == 6)
    { var e_morgother = $("#txt_morgtyp").val(); }
    else { var e_morgother = ''; }
    var m_sal = 22;
    if ($('input[id=m_ch1]').is(':checked'))
    { var m_sal = 1; }
    if ($('input[id=m_ch2]').is(':checked'))
    { var m_sal = 2; }
    if ($('input[id=m_ch3]').is(':checked'))
    { var m_sal = 3; }
    if ($('input[id=m_ch4]').is(':checked'))
    { var m_sal = 4; }
    if ($('input[id=m_ch5]').is(':checked'))
    { var m_sal = 5; }
    if (e_morg == 7)
    { var m_sal = 0; }
    ///new sibling details13/feb/2020
    //sib yes or no
    var sib = 22;
    if ($('input[id=rdo_sib1]').is(':checked'))
    { var sib = 1; }
    if ($('input[id=rdo_sib2]').is(':checked'))
    { var sib = 2; }
    if (sib == 1) {
        //sibdetails
        var row = "";
        var row2 = "";
        var table = document.getElementById('tbl_sibling');
        for (var r = 1, n = table.rows.length; r < n; r++) {
            // for (var c = 0, m = table.rows[r].cells.length; c < m - 1; c++) {
            var r1 = table.rows[r].cells[0].innerHTML;//name
            var r2 = table.rows[r].cells[5].innerHTML;//quali
            var r3 = table.rows[r].cells[6].innerHTML;//occup
            var r4 = table.rows[r].cells[7].innerHTML;//sal
            if (r3 == 6) {
                r5 = table.rows[r].cells[3].innerHTML;//other

            }
            else { r5 = ''; }
            if (r4 == 0) {
                r4 = '';
            }
            var r6 = table.rows[r].cells[8].innerHTML;//sal
            var row = r1 + "¬" + r2 + "¬" + r3 + "¬" + r4 + "¬" + r5 + "¬" + r6 + "¬";
            var row2 = row2 + "¿" + row;
        }
        //var row2 = row2 + row + "¿";
        // row = "";
        //  alert(row2);
        //var row2 = row;
    }


    if (sib == 1 && $('div[id=tbl_sib]').is(':hidden')) {
        alert("Please enter siblings details");
        return;
    }

    // if (emp == 0 || c1 == 0 || family == 0 || resi == 0 || value == '' || e_father == '' || e_fqual == 0 || e_forg == 0 ||(e_forg == 6 && e_forgother == '') || f_sal == 22 || e_mother == '' || e_mqual == 0 || e_morg == 0 || (e_morg == 6 && e_morgother == '') || m_sal == 22) {
    if (emp == '' || family == 0 || resi == 0 || value == '' || e_father == '' || e_fqual == 0 || e_forg == 0 || (e_forg == 6 && e_forgother == '') || f_sal == 22 || e_mother == '' || e_mqual == 0 || e_morg == 0 || (e_morg == 6 && e_morgother == '') || m_sal == 22 || sib == 22 || (sib == 1 && $('div[id=tbl_sib]').is(':hidden'))) {

        //  alert("Please Enter all feilds");
        if (emp == '')
        { alert("Please select  employee"); }
        else if (family == 0)
        { alert("Please select employee family type"); }
        else if (resi == 0)
        { alert("Please select Residence"); }
        else if (value == '')
        { alert("Please Enter Value of Property"); }
        else if (e_father == '')
        { alert("Please Enter Father name"); }
        else if (e_fqual == 0)
        { alert("Please select Father qualification"); }
        else if (e_forg == 0)
        { alert("Please select father Occupation"); }
        else if (e_forg == 6 && e_forgother == '')
        { alert("Please Enter father Occupation"); }
        else if (f_sal == 22)
        { alert("Please Select father Salary Range per annum"); }
        else if (e_mother == '')
        { alert("Please Enter mother name"); }
        else if (e_mqual == 0)
        { alert("Please select mother qualification"); }
        else if (e_morg == 0)
        { alert("Please select mother Occupation"); }
        else if (e_morg == 6 && e_morgother == '')
        { alert("Please Enter mother Occupation"); }
        else if (m_sal == 22)
        { alert("Please Select mother Salary Range per annum"); }
        else if (sib == 22)
        { alert("Please enter sibling details"); }
        else if (sib == 1 && $('div[id=tbl_sib]').is(':hidden')) {
            alert("Please enter siblings details");
            return;
        }

    }
    else {
        //emp_code,family_type,residence,value,father_name,father_quali,father_occupation,
        //father_occu_any,father_sal_range,mother_name,mother_quali,mother_occupation,mother_occu_any,mother_sal_range,remarks,
        //        if ( e_forgother == '' || f_sal == 22 || e_mother == '' || e_mqual == 0 || e_morg == 0 || e_morgother == '' || m_sal == 22) {



        var enroldata = emp + "µ" + family + "µ" + resi + "µ" + value + "µ" + e_father + "µ" + e_fqual + "µ" +
        e_forg + "µ" + e_forgother + "µ" + f_sal + "µ" + e_mother + "µ" + e_mqual + "µ" + e_morg + "µ" + e_morgother +
        "µ" + m_sal + "µ" + sib + "µ" + row2;
        //alert(enroldata);
        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: "family_status.aspx/enroll_family_dtl",
            data: "{ input: '" + enroldata + "' }",
            dataType: "json", beforeSend: function () {
                return confirm("Are you sure you want to confirm?");
            },
            success: function (Result) {
                var res = Result.d
                if (res == '111')
                { alert('confirmed'); }
                else {
                    alert('Please Try Again');
                }
            
                window.open("../Recruitment/family_status.aspx", "_self");
            },
            error: function (Result) {
            }
        });

    }


}
function qual() {
    $.ajax({                ///qualification category
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "family_status.aspx/qcatg_dtl",
        data: {},
        dataType: "json",
        success: function (Result) {
            Result = Result.d;
            $.each(Result, function (key, value) {
                $("#ddl_mquali").append($("<option></option>").val
              (value.qc_id).html(value.qc_name));
                $("#ddl_fquali").append($("<option></option>").val
             (value.qc_id).html(value.qc_name));
                $("#ddl_squali").append($("<option></option>").val//13/feb/2020  sibiling
          (value.qc_id).html(value.qc_name));
            });

        },
        error: function (Result) {
        }
    });
}


function family_clear() {
    $("#ddl_family").val(0);
    $("#ddl_resi").val(0);
    $("#txt_value").val('');
    $("#txt_father").val('')
    $("#ddl_fquali").val(0);
    $("#ddl_forgtyp").val(0);
    $("#txt_forgtyp").val('');
    $("#txt_mother").val('')
    $("#ddl_mquali").val(0);
    $("#ddl_morgtyp").val(0);
    $("#txt_morgtyp").val('');
    $("#f_ch1").prop('checked', false);
    $("#f_ch2").prop('checked', false);
    $("#f_ch3").prop('checked', false);
    $("#f_ch4").prop('checked', false);
    $("#f_ch5").prop('checked', false);
    $("#m_ch1").prop('checked', false);
    $("#m_ch2").prop('checked', false);
    $("#m_ch3").prop('checked', false);
    $("#m_ch4").prop('checked', false);
    $("#m_ch5").prop('checked', false);
}



function fam_orgtype1()//swathy  Organization Type
{
    var a = $("#ddl_forgtyp").val();

    if (a == 6) {
        $('#fdiv').show();
        $('#txt_forgtyp').show();
    }
    else {
        $('#txt_forgtyp').hide();
        $('#fdiv').hide();
    }
}
function fam_orgtype2()//swathy  Organization Type
{
    var a = $("#ddl_morgtyp").val();

    if (a == 6) {
        $('#saldiv').show();
        $('#mdiv').show();
        $('#txt_morgtyp').show();
    }
    else if (a == 7) {

        $('#saldiv').hide();
        $('#txt_morgtyp').hide();
        $('#mdiv').hide();
    }
    else {
        $('#saldiv').show();
        $('#txt_morgtyp').hide();
        $('#mdiv').hide();
    }

}

function chk2()/// for caste checkbox
{
    $(".check").change(function () {
        var checked = $(this).is(':checked');
        $(".check").prop('checked', false);
        if (checked) {
            $(this).prop('checked', true);
        }
    });
    if ($('input[id=m_ch1]').is(':checked'))
    { var sc = 1; }
    if ($('input[id=m_ch2]').is(':checked'))
    { var sc = 2; }
    if ($('input[id=m_ch3]').is(':checked'))
    { var sc = 3; }
    if ($('input[id=m_ch4]').is(':checked'))
    { var sc = 4; }
    if ($('input[id=m_ch5]').is(':checked'))
    { var sc = 5; }
    //alert(sc);
}

//sibiling   12 feb  2020
function rdo_sibl() //swathy
{
    if ($('input[id=rdo_sib1]').is(':checked')) {
        $('#div_sib').show();
        var q1 = $("#txt_sname").val('');
        var q2 = $("#ddl_squali").val(0);
        var q3 = $("#ddl_sorgtyp").val(0);
        var q4 = $("#txt_sorgtyp").val('');
        $('#div_sorg').hide();
        $('#tbl_sib').hide();
        $('#tbl_sibling tbody').empty();
    }
    if ($('input[id=rdo_sib2]').is(':checked')) {
        $('#div_sib').hide();
        $('#div_sorg').hide();
        $('#tbl_sib').hide();
        $('#tbl_sibling tbody').empty();

    }
}


function fam_orgtype3()//swathy  Organization Type
{
    var a = $("#ddl_sorgtyp").val();

    if (a == 6) {
        $('#sib_saldiv').show();
        $('#div_sorg').show();
        $('#txt_sorgtyp').show();
    }
    else if (a == 8 || a == 9) {

        $('#sib_saldiv').hide();
        $('#txt_sorgtyp').hide();
        $('#div_sorg').hide();
    }
    else {
        $('#sib_saldiv').show();
        $('#txt_sorgtyp').hide();
        $('#div_sorg').hide();
    }

}
function clearsib() {
    $("#txt_sname").val('');
    $("#ddl_squali").val(0);
    $("#ddl_sorgtyp").val(0);
    $("#txt_sorgtyp").val('');
    $('#div_sorg').hide();
    $('#rdo_female').prop('checked', false);
    $('#rdo_male').prop('checked', false);
    $('#rdo_other').prop('checked', false);
    $('#rdo_s1').prop('checked', false);
    $('#rdo_s2').prop('checked', false);
    $('#rdo_s3').prop('checked', false);
    $('#rdo_s4').prop('checked', false);
    $('#rdo_s5').prop('checked', false);

}
function add_sibling()//swathy  
{
    var empid = $("[id*=txt_session]").val();
    //var c1 = $("#ddl_sel_candidate").val();
    var q1 = $("#txt_sname").val();
    var q2 = $("#ddl_squali").val();
    var q22 = $("#ddl_squali").find("option:selected").text();
    var q3 = $("#ddl_sorgtyp").val();
    var q33 = $("#ddl_sorgtyp").find("option:selected").text();
    var q4 = $("#txt_sorgtyp").val();
    var gen = 11;
    if ($('input[id=rdo_female]').is(':checked')) {
        var gen = 0;
        var q6 = 'Female';
    }
    if ($('input[id=rdo_male]').is(':checked')) {
        var gen = 1;
        var q6 = 'Male';
    }
    if ($('input[id=rdo_other]').is(':checked')) {
        var gen = 2;
        var q6 = 'Others';
    }
    var sc = 22;
    if ($('input[id=rdo_s1]').is(':checked')) {
        var sc = 1;
        var q5 = 'Below 1 Lakh';
    }
    if ($('input[id=rdo_s2]').is(':checked')) {
        var sc = 2;
        var q5 = ' between 1 Lakh and 2 Lakh';
    }
    if ($('input[id=rdo_s3]').is(':checked')) {
        var sc = 3;
        var q5 = 'between 2 Lakh and 4 Lakh';
    }
    if ($('input[id=rdo_s4]').is(':checked')) {
        var sc = 4;
        var q5 = 'between 4 Lakh and 6 Lakh';
    }
    if ($('input[id=rdo_s5]').is(':checked')) {
        var sc = 5;
        var q5 = 'Above 6 Lakh';
    }
    if (q3 == 8 || q3 == 9) {
        sc = 0;
        var q5 = 'NILL';
    }

    //    Name,Qualification,Occupation,Others, pls specify,Salary,quaid,Occupationid,salid

    if (q1 == '' || q2 == 0 || q3 == 0 || (q3 == 6 && q4 == '') || sc == 22 || gen == 11) {
        //alert("please fill all fields")
        if (q1 == '')
        { alert("Enter Name"); }
        else if (q2 == 0)
        { alert(" Select Qualification Category"); }
        else if (q3 == 0)
        { alert(" Select Occupation"); }
        else if (q3 == 6 && q4 == '')
        { alert("Specify Organization Type"); }
        else if (sc == 22)
        { alert(" Select Salary Range per annum"); }
        else if (gen == 11)
        { alert(" Select Gender"); }
    }
    else {



        //    Name,Qualification,Occupation,Others, pls specify,Salary,quaid,Occupationid,salid

        var a = 1;
        if ($('div[id=tbl_sib]').is(':hidden')) {
            var table = document.getElementById('tbl_sibling');
            $('#tbl_sib').show();
            $('#tbl_sibling tbody').empty();
            var markup = "<tr><td>" + q1 + "</td><td>" + q22 + "</td><td>" + q33 + "</td><td>" + q4 + "</td><td>" + q5 + "</td><td hidden='hidden'>" + q2 + "</td><td hidden='hidden'>" + q3 + "</td><td hidden='hidden'>" + sc + "</td><td hidden='hidden'>" + gen + "</td><td>" + q6 + "</td><td><input type='button' id='" + q1 + "' onclick='dlt_sib(this)' value='Delete'></td></tr>";
            // alert(markup);
            $("#tbl_sibling tbody").append(markup);
            clearsib();


        }
        else {

            //$("#ddl_emp").prop("disabled", true);
            var table = document.getElementById('tbl_sibling');
            for (var r = 1, n = table.rows.length ; r < n; r++) {
                //    for (var c = 0, m = table.rows[r].cells.length; c < m - 1; c++) {
                var r1 = table.rows[r].cells[0].innerHTML;


                if (r1 == q1) {
                    a = 1;
                    break;
                }
                else { a = 0; }
                //  }
            }
            if (a == 0) {

                var markup = "<tr><td>" + q1 + "</td><td>" + q22 + "</td><td>" + q33 + "</td><td>" + q4 + "</td><td>" + q5 + "</td><td hidden='hidden'>" + q2 + "</td><td hidden='hidden'>" + q3 + "</td><td hidden='hidden'>" + sc + "</td><td hidden='hidden'>" + gen + "</td><td>" + q6 + "</td><td><input type='button' id='" + q1 + "' onclick='dlt_sib(this)' value='Delete'></td></tr>";

                $("#tbl_sibling tbody").append(markup);

                clearsib();
            }
            else { alert("This Sibling details  Already Added  Please Check ....."); }
        }
    }
}
function dlt_sib(row) {//////////////////used for delete qual row

    var i = row.parentNode.parentNode.rowIndex;
    var rows = document.getElementById("tbl_sibling").rows;
    var a = rows[i].cells[0].innerText



    document.getElementById("tbl_sibling").deleteRow(i);
    var table = document.getElementById('tbl_sibling');
    var n = table.rows.length;

    if (n > 1) {

        // $("#btn_ddel").show();
        $("#tbl_sib").show();
    }
    else {

        $("#tbl_sib").hide();
    }

}

function personaldet_tab() {
    window.open("../Recruitment/Personal_Details.aspx", "_self");
}
function quali_tab() {
    window.open("../Recruitment/qualification.aspx", "_self");
}
function doc_tab() {
    window.open("../Recruitment/Doc_Scanning.aspx", "_self");
}
function family_tab() {
    window.open("../Recruitment/family_status.aspx", "_self");
}
function ref_tab() {
    window.open("../Recruitment/Reference_per.aspx", "_self");
}
function com_nom() {
    //alert("com_nom");
    window.open("../Salary/common_nomination_form.aspx", "_self");
}

