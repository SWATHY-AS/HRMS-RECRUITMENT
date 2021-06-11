//exit 
function empexit() {
    window.location = "../Index/Index.aspx";
}




////resignation reason on load 
function empresig() {
    var empid = $("[id*=hdn_txt_session]").val();
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "resig_application.aspx/resg_emp_reason",
        data: {},
        dataType: "json",
        success: function (Result) {
            Result = Result.d;
            $.each(Result, function (key, value) {
                $("#ddl_reason").append($("<option></option>").val
    (value.re_code).html(value.re_name));
            });
            //request $ cancellation on load
            var flag = "49";
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "resig_application.aspx/resg_emp_appln",
                data: "{flag:'" + flag + "',input:'" + empid + "'}",
                dataType: "json",
                success: function (Result) {
                    Result = Result.d;
                 
                    var res = Result.split('~');
                    var test = res[0];
                    if (test == "2") {
                        $('#btn_cancel').hide();
                        $('#btn_resing').hide();
                        alert("Request already approved. Please contact HR Department for Resignation Withdrawal");
                        window.location = "../Index/Index.aspx";
                    }
                    $('#txt_empcode').val(res[1]);
                    $('#txt_empname').val(res[2]);
                    $('#txt_post').val(res[3]);
                    $('#txt_department').val(res[4]);
                    $('#txt_branch').val(res[5]);
                    $('#txt_designation').val(res[6]);
                    $("#txt_priority").val(res[7]);
                    $('#txtremarks').val(res[12]);
                    if (test == "0") {
                        $('#btn_cancel').hide();
                        $('#btn_resing').show();
                        $('#ddl_reason').prop('disabled', false);
                        $('#txt_fromdt').prop('disabled', false);
                        $('#txt_releaving').prop('disabled', false);
                    }
                    var objSelect = document.getElementById("ddl_reason");
                    setSelectedValue(objSelect, res[8].toUpperCase());
                    $('#txt_fromdt').val(res[9]);
                    $('#txt_releaving').val(res[10]);
                    $('#txt_resigid').val(res[11]);
                    if (test == "1") {
                        $('#btn_cancel').show();
                        $('#btn_resing').hide();
                        $('#ddl_reason').prop('disabled', true);
                        $('#txt_fromdt').prop('disabled', true);
                        $('#txt_releaving').prop('disabled', true);
                        $('#txtremarks').prop('disabled', false);
                        var r = confirm("Request in progress. Do you want to continue? ");
                        if (r == false) {
                            empexit();
                        }
                    }

                }
            });

            function setSelectedValue(selectObj, valueToSet) {
                for (var i = 0; i < selectObj.options.length; i++) {
                    if (selectObj.options[i].text == valueToSet) {
                        selectObj.options[i].selected = true;
                        return;
                    }
                }
            }

            $('#txt_fromdt').datepicker({
                dateFormat: 'dd/MM/yy',
                onSelect: function (dateText, inst) {
                    $('#txt_releaving').prop('disabled', false);
                    //Get today's date at midnight
                    var today = new Date();
                    var qaz = '';
                    today = Date.parse(today.getMonth() + 1 + '/' + today.getDate() + '/' + today.getFullYear());
                    var actualDate = new Date(dateText);
                    //Get the selected date (also at midnight)
                    var selDate = Date.parse(dateText);
                    var seltoDate = Date.parse(dateText);
                    if (selDate < today) {
                        //If the selected date was before today, continue to show the datepicker
                        alert(" Back Date not allowed. Please select valid date");
                        $('#txt_fromdt').val('');
                        $(inst).datepicker('show');
                        $('#txt_releaving').prop('disabled', true);
                        $('#txt_releaving').val('');
                    }
                    else {
                        lblgrade = $('#txt_priority').val();
                        if (lblgrade == 1 || lblgrade == 2) {
                            var nextMonth = new Date(actualDate.getFullYear(), actualDate.getMonth(), actualDate.getDate()+90);
                            $('#txt_releaving').val($.datepicker.formatDate('dd/MM/yy', nextMonth));
                        }
                        else {
                            var nextMonth = new Date(actualDate.getFullYear(), actualDate.getMonth(), actualDate.getDate()+30);
                            $('#txt_releaving').val($.datepicker.formatDate('dd/MM/yy', nextMonth));
                        }
                        qaz = $('#txt_releaving').val($.datepicker.formatDate('dd/MM/yy', nextMonth));
                        $('#txt_releaving').val($.datepicker.formatDate('dd/MM/yy', nextMonth));
                        var selDate1 = Date.parse(dateText);
                        $('#txt_releaving').datepicker({
                            dateFormat: 'dd/MM/yy',
                            onSelect: function (dateText, inst) {
                                var dt = $("#txt_relvde").val();
                                var relvdt = new Date(dateText);
                                var relvmonth = new Date(relvdt.getFullYear(), relvdt.getMonth(), relvdt.getDate());
                                $('#txt_releaving').val($.datepicker.formatDate('dd/MM/yy', relvmonth));

                                if (relvdt < nextMonth) {
                                    alert("Not complete notice period! please Check");
                                    //alert("Back Date not allowed. Please select valid date");
                                    //$('#txt_releaving').val('');
                                  //  $(inst).datepicker('show');
                                }
                                else {
                                    var r = confirm("You have changed your relieving from " + $('#txt_releaving').val() + "\n\t are  You sure to Confirm \t");
                                    alert($('#txt_releaving').val($.datepicker.formatDate('dd/MM/yy', relvmonth)));

                                    if (r == false) { //cancel 
                                        $('#txt_releaving').val('');
                                        alert("Select the Releaving date!");
                                        //  empexit();
                                    }
                                }
                            }
                        });
                    }
                }
            });
        },
        error: function (Result) {
        }
    });
}







//// Resignation Cancel By user 
function resg_appln_cancel(flag) {
   
   // var e_code = $("[id*=hdn_txt_id]").val();
    var e_code = $("[id *= txt_session]").val();
    
    var frmdt = $("#txt_fromdt").val();
    var relv_dt = $("#txt_releaving").val();
    var reason = $("#ddl_reason option:selected").val();
    var app_remark = $("#txtremarks").val();
    var resg_id = $("#txt_resigid").val();
  //  var br = $("[id*=hdn_txt_br]").val();
    var br = $("[id*=txt_br]").val();
    var resg_cancel = e_code + "~" + frmdt + "~" + relv_dt + "~" + reason + "~" + app_remark + "~" + resg_id + "~" + br;

    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "resig_application.aspx/cancel_resign_dtls",
        data: "{ flag: '" + flag + "', input: '" + resg_cancel + "' }",
        dataType: "json",
        success: function (Result) {
            var res = Result.d;           
            window.location = "../Index/Index.aspx";

        },

        error: function (Result) {
            alert(Result);
        }
    });
}



//clear function
function clear() {

    $("#txt_empcode").val('');
    $("#txt_empname").val('');
    $("#txt_fromdt").val('');
    $("#txt_releaving").val('');
    $("#ddl_reason").val('');
    $("#ddl_reason_pf").val('');
    $("#ddl_reason_efile").val('');
    $("#ddl_reason_ecr").val('');
    $("#txt_relvde").val('');
    $("#txt_Reason").val('');
    $("#txt_app_remark").val('');
    $("#resig_id").val('');
}





//// resg Approval on load with access
function approval_access_onload() {
   $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "Approve.aspx/resg_emp_dtl",
        data: {},
        dataType: "json",
        success: function (Result) {
            Result = Result.d;
            var fRole;
            $.each(Result, function (key, value) {
                $("#ddl_regemp").append($("<option></option>").val
              (value.emp_code).html(value.emp_name));
                fRole = value.role;
            });
           
            if(fRole == 1) {
                //dept head 
                $('#form_hide').show();
                $('#recmd').show();
                $('#recmd1').show();
                $("#btn_approve").prop("disabled", false);
                $("#btn_recmnd").prop("disabled", true);
            }
             if(fRole == 2) {
                 //dept major
                 $('#form_hide').show();

                $("#btn_approve").prop("disabled", true);
                $("#btn_recmnd").prop("disabled", false);
            }
             if (fRole == 3) {
             alert(' You have no authorization to view this page  ');
                window.open('../Index/Index.aspx', '_self');
            }

            $("#ddl_regemp").change(function () {
                var str = $(this).find('option:selected').text();
                var empcode = $(this).val();
                if (!isNaN(empcode)) {
                    $.ajax({
                        type: "POST",
                        contentType: "application/json; charset=utf-8",
                        url: 'Approve.aspx/get_details',
                        data: "{empid: '" + empcode + "' }",
                        dataType: "json",
                        success: function (Result) {
                            var res = Result.d

                            var res = Result.d.split("~");
                            var test = $("[id *= txt_session]").val();// $("[id*=hdn_txt_id]").val();
                            $("#txt_empcode").val(res[0]);
                            $("#txt_empname").val(res[1]);
                            $("#txt_branch").val(res[2]);
                            $("#txt_post").val(res[3]);
                            $("#txt_department").val(res[4]);
                            $("#txt_fromdt").val(res[5]);
                            $("#txt_relvde").val(res[6]);
                            $("#txt_Reason").val(res[7]);
                            $("[id*=resig_id]").val(res[8]);

                            $("#txt_recomndby").val(res[9]);
                            $("#txt_recomndon").val(res[10]);
                            $("#txt_recmd_reason").val(res[11]);

                        },
                        error: function (Result) {
                        }
                    });
                }
            });
            clear();
        },
        error: function (Result) {
        }
    });
}

//Approve resignation  application ( Commen function Approve & Recommend )
function resg_appln_recmd(flag)
{
    var e_code = $("#txt_empcode").val();//employees is
    var frmdt = $("#txt_fromdt").val();
    var relv_dt = $("#txt_relvde").val();
    var app_remark = $("#txt_app_remark").val();
    var resg_id = $("#resig_id").val();
    var usr = $("[id *= txt_id]").val();// $("[id*=hdn_txt_id]").val();
    var usr_br = $("[id *= txt_br]").val(); //$("[id*=hdn_txt_br]").val();
    if (app_remark == '')
    { alert("please fill remarks...."); }
    else
    {
        var resg_appln = e_code + "~" + frmdt + "~" + relv_dt + "~" + app_remark + "~" + resg_id + "~" + usr + "~" + usr_br;
        //alert(resg_appln);
        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: "approve.aspx/approve_resign_dtls",
            data: "{ flag: '" + flag + "', input: '" + resg_appln + "' }",
            dataType: "json",
          success: function (Result){
                var res = Result.d;
                if (Result.d == "APPROVED") 
                {
                    alert('Resignation Approved Successfully');
                    window.open("approve.aspx", "_self");
                }    
                else
                {
                    alert('Resignation Recommended Successfully');
                    window.open("approve.aspx", "_self");
                }
            },
            error: function (Result) {
            }
        });
       
        $("#ddl_regemp").val(0);
        $("#txt_empcode").val('');
        $("#txt_fromdt").val('');
        $("#txt_relvde").val('');
        $("#txt_Reason").val('');
        $("#txt_app_remark").val('');
        $("#resig_id").val('');
        $("#txt_branch").val('');
        $("#txt_post").val('');
        $("#txt_post").val('');
    }
}




// seperation Entry on load
function seperation_onload() {
    $("#table1").show();
    $("#table1 tbody").empty();
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "resg_seperation_entry.aspx/sep_employee_dtl",
        //   data: "{dt1:'" + fdt + "',dt2:'" + tdt + "'}",
        data: {},
        dataType: "json",
        success: function (Result) {
            Result = Result.d;
            $("#ddl_emp_code").html('');
            $.each(Result, function (key, value) {
                $("#ddl_emp_code").append($("<option></option>").val
                (value.emp_code).html(value.emp_code + '-' + value.emp_name));
            });



            $("#ddl_emp_code").change(function () {
                var str = $("#ddl_emp_code").find('option:selected').val();
                // var dd = $("#<%=hdnvalue.ClientID %>").val(str);
                if (str != 0) {
                    $("#table1 tbody").empty();
                    $.ajax({
                        type: "POST",
                        contentType: "application/json; charset=utf-8",
                        url: "resg_seperation_entry.aspx/sep_get_dtl",
                        data: "{ input: '" + str + "' }",
                        dataType: "json",
                        success: function (Result) {
                            //  alert("Result");
                            for (var i = 0; i < Result.d.length; i++) {

                                $('#hdn_empcode').val(Result.d[i].empcode) +

                                $("#table1").append('<tr> <td>' + Result.d[i].empcode + '</td>' +
                                           '<td>' + Result.d[i].empname + '</td>' +
                                           '<td>' + Result.d[i].post + '</td>' +
                                           '<td>' + Result.d[i].desig + '</td>' +
                                           '<td>' + Result.d[i].dept + '</td>' +
                                           '<td>' + Result.d[i].region + '</td>' +
                                           '<td>' + Result.d[i].area + '</td>' +
                                           '<td>' + Result.d[i].branch + '</td>' +
                                             $('#join_dt').val(Result.d[i].join_dt) +
                                             '</td></tr>');
                            }

                        },
                        error: function (Result) {
                        }
                    });
                }
            });
        }
    });
}

//insert seperation entry
function seperate_entry(flag) {
    var e_code = $("#hdn_empcode").val();
    var effective_date = $("#txt_efffet_reldt").val();
    var reason = $("#Select1").val();
    var remarks = $("#txt_remarks").val();
    if (effective_date == '' || reason == '')
    { alert("please fill remarks") }
    else
    {
        var sepentry = e_code + "~" + effective_date + "~" + reason + "~" + remarks;

        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: "resg_seperation_entry.aspx/seperate_entry",
            data: "{ flag: '" + flag + "', input: '" + sepentry + "' }",
            dataType: "json",
            success: function (Result) {
                var res = Result.d;
                window.open("resg_seperation_entry.aspx", "_self");
            },
            error: function (Result) {
            }
        });
        ////////// date efective 


        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: "resg_seperation_entry.aspx/seperate_entry",
            data: "{ flag: '" + flag + "', input: '" + sepentry + "' }",
            dataType: "json",
            success: function (Result) {
                var res = Result.d;
                window.open("resg_seperation_entry.aspx", "_self");
            },
            error: function (Result) {
            }
        });
        
        //$.each(Result, function (key, value) {
        //    $("#ddl_reason").append($("<option></option>").val
        //    (value.re_code).html(value.re_name));
        //});
                   

        $("#ddl_regemp").val(0);
        $("#hdn_empcode").val('');
        $("#txt_fromdt").val('');
        $("#txt_sep_reason").val('');

    }

}
//function Resignation_appln_access() {
//    var c = $("[id*=hdn_txt_id]").val();
//    $.ajax({
//        type: "POST",
//        contentType: "application/json; charset=utf-8",
//        url: "resig_application.aspx/resg_app_access",
//        data: "{ input: '" + c + "' }",
//        dataType: "json",
//        success: function (Result) {
//            Result = Result.d;
//            if (Result == 111) {

//                //All employees
//            }

//            else if (Result == 333) { // not live employee
//                alert('You are not  authorized to view this page ');
//                window.location = "../Index/Index.aspx";
//            }
//        }
//    });

//}
