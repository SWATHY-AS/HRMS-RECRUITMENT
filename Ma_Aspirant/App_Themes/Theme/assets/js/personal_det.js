
function post_select() {
    var ppin = $("#txt_pin").val();
    // alert(ppin);
    ddpost = $("#ddl_post");
    // dd_postofc
   
    if (ppin != '') {
        ddpost.empty(); // this line is for clear all 
        ddpost.append($("<option></option>").val("0").html("--SELECT--"));
        $.ajax({
            type: "POST",
            url: 'Personal_Details.aspx/postofc_dtl',
            data: "{did:'" + ppin + "'}",
            async: false,
            cache: false,
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (Result) {
                Result = Result.d;
                $.each(Result, function (key, value) {
                    ddpost.append($("<option></option>").val
                        (value.post_id1).html(value.post_name1));
                });
                //textbox  change
             
            },
            error: function (Result) {
            }
        });
    }


}

function addr()
{
  
        var dpid = $("#ddl_post").val();
        if (dpid != -1) {


            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "Personal_Details.aspx/get_address",
                data: "{input:'" + dpid + "'}",
                async: false,
                cache: false,
                dataType: "json",
                success: function (Result) {
                    var res = Result.d;

                    var res = Result.d.split("µ");
                    $("#txt_state").val(res[0]);
                    $("#txt_dist").val(res[1]);

                },
                error: function (Result) {
                }
            });
        }
   
}
$.ajax({                ///university
    type: "POST",
    contentType: "application/json; charset=utf-8",
    url: "Personal_Details.aspx/univ_dtl",
    data: {},
    dataType: "json",
    success: function (Result) {
        Result = Result.d;
        $.each(Result, function (key, value) {
            $("#cmb_univrstytin").append($("<option></option>").val(value.uid).html(value.u_name));
            $("#cmb_univrstytin1").append($("<option></option>").val(value.uid).html(value.u_name));
            $("#cmb_univrstytin2").append($("<option></option>").val(value.uid).html(value.u_name));
            $("#cmb_univrstytin3").append($("<option></option>").val (value.uid).html(value.u_name));
        });
    },
    error: function (Result) {

    }
});
function chk()/// for caste checkbox
{
    $(".check").change(function () {
        var checked = $(this).is(':checked');
        $(".check").prop('checked', false);
        if (checked) {
            $(this).prop('checked', true);
        }
    });
    if ($('input[id=ch1]').is(':checked'))
    { var sc = 1; }
    if ($('input[id=ch2]').is(':checked'))
    { var sc = 2; }
    if ($('input[id=ch3]').is(':checked'))
    { var sc = 3; }
    if ($('input[id=ch4]').is(':checked'))
    { var sc = 4; }
    if ($('input[id=ch5]').is(':checked'))
    { var sc = 5; }
    //alert(sc);
}
function rdo_marital()//swathy
{
    if ($('input[id=rdo_married]').is(':checked')) {
        $('#hidediv').show();
    }
    if ($('input[id=rdo_single]').is(':checked')) {
        $('#hidediv').hide();
    }
    if ($('input[id=rdo_divorce]').is(':checked')) {
        $('#hidediv').hide();
    }

}
function rdo_handicapped()//swathy
{
    if ($('input[id=rdo_hyes]').is(':checked')) {
        $('#hidehandi').show();
    }
    if ($('input[id=rdo_hno]').is(':checked')) {
        $('#hidehandi').hide();
    }
}
//$(window).on("load", GetAllProperties);


$.ajax({                ///State 
    type: "POST",
    contentType: "application/json; charset=utf-8",
    url: "Candidate_Index.aspx/state_dtl",
    data: {},
    dataType: "json",
    success: function (Result) {

        Result = Result.d;

        $.each(Result, function (key, value) {

            $("#cmb_state").append($("<option></option>").val
                (value.state_id).html(value.state_name));
        });

    },
    error: function (Result) {
    }
});

$.ajax({                ///qualification
    type: "POST",
    contentType: "application/json; charset=utf-8",
    url: "Personal_Details.aspx/qual_dtl",
    data: {},
    dataType: "json",
    success: function (Result) {
        Result = Result.d;
        $("#cmb_qual").append($("<option></option>").val("18").html("MATRICULATION"));
        $("#cmb_qual1").append($("<option></option>").val("24").html("PLUS TWO"));
        $.each(Result, function (key, value) {
            $("#cmb_qual2").append($("<option></option>").val

                (value.qualification_id).html(value.qualification));
        });
        $('#yr_pass').datepicker({
            changeYear: true,
            showButtonPanel: true,
            dateFormat: 'yy',
            onClose: function (dateText, inst) {
                var year = $("#ui-datepicker-div .ui-datepicker-year :selected").val();
                $(this).datepicker('setDate', new Date(year, 1));
            }
        });
        $("#yr_pass").focus(function () {
            $(".ui-datepicker-month").hide();
        });
        $('#yr_pass2').datepicker({
            changeYear: true,
            showButtonPanel: true,
            dateFormat: 'yy',
            onClose: function (dateText, inst) {
                var year = $("#ui-datepicker-div .ui-datepicker-year :selected").val();
                $(this).datepicker('setDate', new Date(year, 1));
            }
        });
        $("#yr_pass2").focus(function () {
            $(".ui-datepicker-month").hide();
        });

    },
    error: function (Result) {
    }
});
$.ajax({                ///qualification
    type: "POST",
    contentType: "application/json; charset=utf-8",
    url: "Personal_Details.aspx/qual_dtl",
    data: {},
    dataType: "json",
    success: function (Result) {
        Result = Result.d;

        $.each(Result, function (key, value) {
            $("#cmb_qual3").append($("<option></option>").val

                (value.qualification_id).html(value.qualification));
        });
        $('#yr_pass3').datepicker({
            changeYear: true,
            showButtonPanel: true,
            dateFormat: 'yy',
            onClose: function (dateText, inst) {
                var year = $("#ui-datepicker-div .ui-datepicker-year :selected").val();
                $(this).datepicker('setDate', new Date(year, 1));
            }
        });
        $("#yr_pass3").focus(function () {
            $(".ui-datepicker-month").hide();
        });
        $('#yr_pass4').datepicker({
            changeYear: true,
            showButtonPanel: true,
            dateFormat: 'yy',
            onClose: function (dateText, inst) {
                var year = $("#ui-datepicker-div .ui-datepicker-year :selected").val();
                $(this).datepicker('setDate', new Date(year, 1));
            }
        });
        $("#yr_pass4").focus(function () {
            $(".ui-datepicker-month").hide();
        });


    },
    error: function (Result) {
    }
});


 
   
    


function GetAllProperties() {

    //$.ajax({                ///State 
    //    type: "POST",
    //    contentType: "application/json; charset=utf-8",
    //    url: "Personal_Details.aspx/state_dtl",
    //    data: {},
    //    dataType: "json",
    //    success: function (Result) {
    //        Result = Result.d;
    //        $.each(Result, function (key, value) {

    //            $("#dd_st2").append($("<option></option>").val
    //                (value.state_id).html(value.state_name));
    //        });
    //        $("#dd_st2").change(function () {
    //            var str = $(this).find('option:selected').text();
    //            var sid = $(this).val();
    //            if (!isNaN(sid)) {
    //                var dddist = $("#dd_dist2");
    //                dddist.empty(); // this line is for clear all 
    //                dddist.append($("<option></option>").val("0").html("--SELECT--"));
    //                $.ajax({
    //                    type: "POST",
    //                    url: 'Personal_Details.aspx/dist_dtl',
    //                    data: "{stid:'" + sid + "'}",
    //                    async: false,
    //                    cache: false,
    //                    contentType: "application/json; charset=utf-8",
    //                    dataType: "json",
    //                    success: function (Result) {
    //                        Result = Result.d;
    //                        $.each(Result, function (key, value) {
    //                            dddist.append($("<option></option>").val
    //                                (value.dist_id).html(value.dist_name));
    //                        });//post
    //                        $("#dd_dist2").change(function () {
    //                            var str = $(this).find('option:selected').text();
    //                            var dsid = $(this).val();
    //                            if (!isNaN(dsid)) {
    //                                var ddpost = $("#dd_post2");
    //                                ddpost.empty(); // this line is for clear all 
    //                                ddpost.append($("<option></option>").val("0").html("--SELECT--"));
    //                                $.ajax({
    //                                    type: "POST",
    //                                    url: 'Personal_Details.aspx/post_dtl',
    //                                    data: "{did:'" + dsid + "'}",
    //                                    async: false,
    //                                    cache: false,
    //                                    contentType: "application/json; charset=utf-8",
    //                                    dataType: "json",
    //                                    success: function (Result) {
    //                                        Result = Result.d;
    //                                        $.each(Result, function (key, value) {
    //                                            ddpost.append($("<option></option>").val
    //                                                (value.post_id).html(value.post_name));
    //                                        });
    //                                        //textbox  change
    //                                        $("#dd_post2").change(function () {
                                              
    //                                            var str = $(this).find('option:selected').text();
    //                                            var dpid = $(this).val();
                                               

    //                                            if (!isNaN(dpid)) {
                                                   

    //                                                $.ajax({
    //                                                    type: "POST",
    //                                                    contentType: "application/json; charset=utf-8",
    //                                                    url: "Personal_Details.aspx/get_pin",
    //                                                    data: "{pid:'" + dpid + "'}",
    //                                                    async: false,
    //                                                    cache: false,
    //                                                    dataType: "json",
    //                                                    success: function (Result) {
    //                                                        var res = Result.d;
                                                           

    //                                                        $("#txt_pin2").val(res);
    //                                                    },
    //                                                    error: function (Result) {
    //                                                    }
    //                                                });
    //                                            }
    //                                        });

    //                                    },
    //                                    error: function (Result) {
    //                                    }
    //                                });
    //                            }
    //                        });

    //                    },
    //                    error: function (Result1) {
    //                    }
    //                });
    //            }
    //        });//end

    //    },

    //    error: function (Result) {
    //    }
    //});


    $.ajax({                ///blood group
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "Personal_Details.aspx/blood_dtl",
        data: {},
        dataType: "json",
        success: function (Result) {
            Result = Result.d;
            $.each(Result, function (key, value) {
                $("#cmb_bldg").append($("<option></option>").val
                    (value.blood_id).html(value.blood_type));
            });

        },
        error: function (Result) {
        }
    });
    $.ajax({                ///Religion
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "Personal_Details.aspx/religion_dtl",
        data: {},
        dataType: "json",
        success: function (Result) {
            Result = Result.d;
            $.each(Result, function (key, value) {
                $("#cmb_relg").append($("<option></option>").val
                    (value.religion_id).html(value.religion));
            });

        },
        error: function (Result) {
        }
    });
   
    $.ajax({
        ///State
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "Personal_Details.aspx/state_dtl",
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
                        url: 'Personal_Details.aspx/dist_dtl',
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
                                        url: 'Personal_Details.aspx/post_dtl',
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
                                              //  alert("post change");
                                                var str = $(this).find('option:selected').text();
                                                var dpid = $(this).val();                                              

                                                if (!isNaN(dpid)) {                                                   

                                                    $.ajax({
                                                        type: "POST",
                                                        contentType: "application/json; charset=utf-8",
                                                        url: "Personal_Details.aspx/get_pin",
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
                        url: 'Personal_Details.aspx/dist_dtl',
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
                                        url: 'Personal_Details.aspx/post_dtl',
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
                                                //alert("post change");
                                                var str = $(this).find('option:selected').text();
                                                var dpid = $(this).val();                                              

                                                if (!isNaN(dpid)) {                                                   

                                                    $.ajax({
                                                        type: "POST",
                                                        contentType: "application/json; charset=utf-8",
                                                        url: "Personal_Details.aspx/get_pin",
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
            //$('#datepicker1').datepicker({
            //    maxDate: new Date(), minDate: '-60Y',
            //    //    changeMonth: true,
            //    changeYear: true, yearRange: '-100:-0',

            //    // showButtonPanel: true,
            //    //showMonthsShort: true,
            //    dateFormat: 'M/yy',
            //    onClose: function (dateText, inst) {
            //        var month = $("#ui-datepicker-div .ui-datepicker-month :selected").val();
            //        var year = $("#ui-datepicker-div .ui-datepicker-year :selected").val();
            //        $(this).datepicker('setDate', new Date(year, month, 1));
            //    }
            //});

        },
        error: function (Result) {
        }
    });
  }
   
   // cand_load();
   





    function save_cand_dtl() {
    
        var cand_code = $("#txt_appID").val();//0
        var cand_name = $("#txt_appIDname").val();  //1  
        var cand_hsname = $("#txt_hname").val(); //2
        var cand_district1 = $("#txt_district").val();//3
        var cand_state1 = $("#txt_stat").val();//4
        var cand_dob1 = $("#txt_dob").val();//5
        var cand_gender = $("#txt_gender").val();//6
        var cand_gender2 = cand_gender.toUpperCase();
        var cand_gender1 = 11;
        if (cand_gender2 == "F" || cand_gender2 == "FEMALE") {
            cand_gender1 = 0;
        }
        else if (cand_gender2 == "M" || cand_gender2 == "MALE") {
            cand_gender1 = 1;
        }
        else {
            cand_gender1 = 2;
        }


        //----------------------------------new change   new change  21-dec-2019
        var localbody1 = $("#ddl_local1").val();
        var localbody2 = $("#ddl_local2").val();
        var fst = 22;
        if ($('input[id=rd_st1]').is(':checked')) {
            var fst = 1;
        }
        if ($('input[id=rd_st2]').is(':checked')) {
            var fst = 2;
        }
        var wrk = 22;
        if ($('input[id=rd_wrk1]').is(':checked')) {
            var wrk = 1;
        }
        if ($('input[id=rd_wrk2]').is(':checked')) {
            var wrk = 2;
        }
        var cand_mob2 = $("#txt_mobalter").val();//8
        //-------------------txt_mobalter
        var cand_agee = $("#txt_age").val();//7
        var cand_mob = $("#txt_mobile").val();//8
        var cand_mail = $("#txt_email").val();//9
        var cand_fname = $("#txt_fathname").val();//10
        var cand_mname = $("#txt_mothname").val();//11
        var cand_blood = $("#cmb_bldg").find('option:selected').val();//12
        var cand_religion = $("#cmb_relg").find('option:selected').val();//13    
        var cand_pincode = $("#txt_pinper").val();//14
        var cand_postper = $("#dd_postofc").val();//15
        var cand_landmark1 = $("#txtarea_landmark1").val();
        var cand_cast; //16
        cand_postper11 = $("#dd_postofc").find('option:selected').val();//15
        if ($('input[id=ch1]').is(':checked')) { var cand_cast = 1; }
        if ($('input[id=ch2]').is(':checked')) { var cand_cast = 2; }
        if ($('input[id=ch3]').is(':checked')) { var cand_cast = 3; }
        if ($('input[id=ch4]').is(':checked')) { var cand_cast = 4; }
        if ($('input[id=ch5]').is(':checked')) { var cand_cast = 5; }

        var cand_mrg_status; //17
        if ($('input[id=rdo_married]').is(':checked')) { var cand_mrg_status = 2; }
        if ($('input[id=rdo_single]').is(':checked')) { var cand_mrg_status = 1; }
        if ($('input[id=rdo_divorce]').is(':checked')) { var cand_mrg_status = 3; }

        var cand_diff_abled; //18
        if ($('input[id=rdo_hyes]').is(':checked')) { var cand_diff_abled = 1; var cand_rmkhand = $("#txt_rmkhandi").val(); }
        if ($('input[id=rdo_hno]').is(':checked')) { var cand_diff_abled = 0; var cand_rmkhand = 'NILL';}
  

        //var basic_data = cand_code+"~"+cand_name + "~" + cand_hsname + "~" + cand_district1 + "~" + cand_state1 + "~" + cand_dob1 + "~" + cand_gender1 + "~" + cand_agee + "~" + cand_mob + "~" + cand_mail + "~" + cand_fname + "~" + cand_mname + "~" + cand_blood + "~" + cand_religion + "~" + cand_pincode + "~"+ cand_postper + "~" + cand_cast + "~" + cand_mrg_status + "~" + cand_diff_abled + "~" + cand_rmkhand;
        //alert(basic_data);
        var e_chkaddr = 0;
        if ($('input[id=chk_ad1]').is(':checked')) {
            e_chkaddr = 1;
       
            var cand_pre_hname = $("#txt_hname").val();
            var cand_pre_state = $("#txt_stat").val();//4
            var cand_pre_district = $("#txt_district").val();//3
            var cand_pre_post = $("#dd_postofc").val();//15
            var cand_pin_code2 = $("#dd_postofc").val(); //$("#txt_pinper").val();//14
            var cand_landmark2 = $("#txtarea_landmark1").val();
            var cand_pre_post11 = $("#dd_post2").find('option:selected').val();
        }
        else {
            e_chkaddr = 0;
            var cand_pre_hname = $("#txt_housename2").val();
            var cand_pre_state = $("#dd_st2").val();
            var cand_pre_district = $("#dd_dist2").val();
            var cand_pre_post = $("#dd_post2").val();
            var cand_pin_code2 = $("#dd_post2").val();//$("#txt_pin2").val();
            var cand_landmark2 = $("#txtarea_landmark2").val();
            var cand_pre_post11 = $("#dd_post2").find('option:selected').val();
        }
 
        var fcnt = $("#txt_fcnt").val();
       

        //------------------------------------------------------------------------------           
        // if (fst == 22 || wrk == 22 || localbody1 == 0 || localbody1 == 0 || cand_fname == '' || cand_postper == '' || cand_mname == '' || cand_landmark1 == '' || cand_pincode == '' || cand_pre_hname == '' || cand_blood == 0 || cand_religion == 0 || dd_st2 == 0 || cand_pre_state == 0 || cand_landmark2 == '' || qual_cat == 0 || qual_type == 0 || cand_inst == '' || cand_uni == 0 || cand_pass == '' || cand_percent == '' || cand_grade == '' || cand_no_attempt == '' || cand_edu_typ == 0 || cand_emrg_name == '' || cand_emrgrel == '' || cand_emrgaddr == '' || cand_emrgno == '' || cand_emrgmail == '') {
        if (cand_mob2 == '' ||fst == 22 || wrk == 22 || localbody1 == 0 || localbody1 == 0 || cand_fname == '' || cand_postper == '' || cand_mname == '' || cand_landmark1 == '' || cand_pincode == '' || cand_pre_hname == '' || cand_blood == 0 || cand_religion == 0 || dd_st2 == 0 || cand_pre_state == 0 || cand_landmark2 == '' || cand_emrg_name == '' || cand_emrgrel == '' || cand_emrgaddr == '' || cand_emrgno == '' || cand_emrgmail == '') {
         if (cand_mob2 == '') { alert("Please Enter Alternative Contact Number"); }

            else if (cand_postper == '') { alert("Please Enter Permanent Postal Address"); }
            else if (cand_pincode == '') { alert("Please Enter Permanent Pincode"); }
            else if (cand_fname == '') { alert("Please Enter father's name"); }
            else if (cand_mname == '') { alert("Please Enter mother's name"); }       
    
            else if (cand_pre_hname == '') { alert("Please Enter house name"); }
            else if (cand_blood == 0) { alert("Please Select  blood group"); }
            else if (cand_religion == 0) { alert("Please select religion"); }
            else if (cand_pre_state == 0) { alert("Please select states"); }
            else if (fst == 22)
            { alert("Please Select Are you looking for further Studies"); }
            else if (wrk == 22)
            { alert("Please Select Are you willing to work any were in India"); }
            else if (localbody1 == 0)
            { alert("Please Select Local Body"); }
            else if (localbody2 == 0)
            { alert("Please Select Local Body"); }
            else if (cand_landmark1 == '') { alert("Please enter the land mark"); }
            else if (cand_landmark2 == '') { alert("Please enter the land mark"); }
                
            else if (cand_emrg_name == '') { alert("Please enter the emergency contact name"); }
            else if (cand_emrgrel == '') { alert("Please enter the relation"); }
            else if (cand_emrgaddr == '') { alert("Please enter the emergency contact address"); }
            else if (cand_emrgno == '') { alert("Please enter the emergency contact number"); }
            else if (cand_emrgmail == '') { alert("Please enter the emergency contact email address"); }
        
        }
        else {
            //1cand_code,2cand_name,3perm_add1,4pres_add1,5father_name,
            //6perm_pin,7pres_pin,8res_phone,9cont_phone,10birth_date,11sex,12cand_email,13marital_status,14religion_id,15caste,16landmark,
            //17physically_challenged,18physcical_remarks,19present_landmark,20BLOOD_ID,21id_proof,22idproof_number,23status,24enter_dt,25pp
            //v_spliter_a(1), v_spliter_a(2),v_spliter_a(3) || ' ' || v_spliter_a(4) || ' ' || v_spliter_a(5) || ' ' ||v_spliter_a(6),
            //v_spliter_a(7) || ' ' || v_spliter_a(8) || ' ' || v_spliter_a(9) || ' ' ||v_spliter_a(10),v_spliter_a(11),
            //v_spliter_a(12),v_spliter_a(13),v_spliter_a(14),v_spliter_a(15),v_dobdt,v_spliter_a(16),v_spliter_a(17),v_spliter_a(18),v_spliter_a(19),
            //v_spliter_a(20),v_spliter_a(21),v_spliter_a(22),v_spliter_a(23),v_spliter_a(25),v_spliter_a(24),'11','NILL',0,sysdate,v_spliter_a(26)

            //1197~Krishnapriya~1/181 Pallath~4176~THRISSUR~Kerala~1/181 Pallath~undefined~THRISSUR~Kerala~RG~4176~4176~9497626765~5/10/96 12:00:00 AM~0~FGD@WETF.UYUJ~1~1~5~OK~0~NILL~2~OK~1
            var persn_data = cand_code + "µ" + cand_name + "µ" + cand_hsname + "µ" + cand_postper11 + "µ" + cand_district1 + "µ" + cand_state1 + "µ" + cand_pre_hname + "µ" + cand_pre_post11 + "µ" + cand_pre_district + "µ" + cand_pre_state + "µ" + cand_fname + "µ" + cand_postper + "µ" + cand_pin_code2 + "µ" + cand_mob + "µ" + cand_dob1 + "µ" + cand_gender1 + "µ" + cand_mail + "µ" + cand_mrg_status + "µ" + cand_religion + "µ" + cand_cast + "µ" + cand_landmark2 + "µ" + cand_diff_abled + "µ" + cand_rmkhand + "µ" + cand_blood + "µ" + cand_landmark1 + 'µ' + e_chkaddr + 'µ' + localbody1 + 'µ' + localbody2 + 'µ' + fst + 'µ' + wrk + 'µ' + fcnt + 'µ' + cand_mob2;
            //  var qual_data1 = cand_code + "~" +qual_cat + "~" + qual_type + "~" + cand_inst + "~" + cand_uni + "~" + cand_pass + "~" + cand_percent + "~" + cand_grade + "~" + cand_no_attempt + "~" + cand_edu_typ + "~" + high_rank;
            //var qual_data2 = cand_code + "~" +qual_cat2 + "~" + qual_type2 + "~" + cand_inst2 + "~" + cand_uni2 + "~" + cand_pass2 + "~" + cand_percent2 + "~" + cand_grade2 + "~" + cand_no_attempt2 + "~" + cand_edu_typ2 + "~" + high_rank;
            // var qual_data3 = cand_code + "~" + qual_cat3 + "~" + qual_type3 + "~" + cand_inst3 + "~" + cand_uni3 + "~" + cand_pass3 + "~" + cand_percent3 + "~" + cand_grade3 + "~" + cand_no_attempt3 + "~" + cand_edu_typ3 + "~" + high_rank;
            //  var qual_data4 = cand_code + "~" + qual_cat4 + "~" + qual_type4 + "~" + cand_inst4 + "~" + cand_uni4 + "~" + cand_pass4 + "~" + cand_percent4 + "~" + cand_grade4 + "~" + cand_no_attempt4 + "~" + cand_edu_typ4 + "~" + high_rank;
            var emerg_data = cand_code + "µ" +cand_emrg_name + "µ" + cand_emrgrel + "µ" + cand_emrgmail + "µ" + cand_emrgno + "µ" + cand_emrgaddr ;
            var qual_data1 = '';
            var qual_data2 = '';
            var qual_data3 = '';
            var qual_data4 = '';
           
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "Personal_Details.aspx/insert_personal",
                data: "{ data : '" + persn_data + "',qualdata : '" + qual_data1 + "' ,qual_data2 : '" + qual_data2 + "',qual_data3 : '" + qual_data3 + "',qual_data4 : '" + qual_data4 + "',emerg_data: '" + emerg_data + "'}",
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
                               
                    else if (Result == "000"){
                        alert("Unable to Submit! Please Try again");
                    }

           
                    window.open("../Recruitment/qualification.aspx", "_self");
                },
                error: function (Result) {
                }
            });

        }
    }
       




//quali


function enablequali() {
    var s = $("#ddl_sel_candidate").val()
    if (s > 0) {
        $("#qc").prop("disabled", false);
        $("#qual").prop("disabled", false);
        $("#qc").val(0);
        $('#qual').empty();
    }
    else {
        $("#qc").prop("disabled", true);
        $("#qual").prop("disabled", true);
    }
}
/// Sandeep 10-Mar-2021
function chkshow() {
    var car = $("#txt_catq").val();
    var higcal = $("#qc").val();
    
    if (car == higcal) {
        $("#hgq").show();
        $("#chkq").prop("disabled", false);
        $("#chkq").prop("checked", false);
        chkqual();
    }
    else {
        $("#hgq").hide();
        $('input[id=chkq]').prop("checked", false);
    }
}

function chkqual() {
   
    if ($('input[id=chkq]').is(':checked')) {
        var hg = 1;
        // $("#chkq").prop("disabled", true);
    }
}
function qualificationadd()//swathy  qualificatio
{
    var empid = $("[id*=txt_session]").val();
    var c1 = $("#txt_appID").val();
    var q1 = $("#qc").find("option:selected").text();
    var q2 = $("#cmb_qual").find("option:selected").text();
   // var q3 = $("#txt_unvsty").val();
    var q4 = $("#txt_institute1").val();
    
    var q33 = $("#cmb_univrstytin").val();
    var q3 = $("#cmb_univrstytin option:selected").text();

    //var q5 = $("#txt_passdt").val();

    var q5 = $('#yr_pass').val();

    var q6 = $("#txt_percent1").val();
    var q7 = $("#txt_grade1").val();
    var q8 = $("#txt_atmpt1").val();
    var q11 = $("#qc").val();
    var q22 = $("#cmb_qual").val();
    ///-----------new
    //var per1 = $("#cmb_percentg").val();
    //var per2 = $("#txt_per").val();
    //q6 = '';
    //if (per2 == '')
    //{ var q6 = $("#cmb_percentg").val(); }
    //else {
    //   var  q6 = per1 + '.' + per2;

    //}
    ///----end
    var highq = $("#txt_highq").val();
    var Qualif = $("#txt_Quali").val();
    //alert(Qualif+ "Deep");
    if (q7 == '')
    { q7 = 'NIL'; }
    //alert(c1);
    var hg = 0;
    var h = "no";
    if ($('input[id=chkq]').is(':checked')) {
        var hg = 1;
        // $("#hgq").hide();
        var h = "yes";

        ///here

        if (q22 != highq) {
            //Deep changes--05-mar-2021
            var al = confirm("The highest qualification you entered previously is not matching here. Previously you have entered it as " + " " + Qualif + "." + "Are you sure you want to confirm");
            if (al == false) {
                return;
            }
            // end
        }
        ///here
    }
    var typ = $("#ddl_edutype1").val();
    var typ1 = $("#ddl_edutype1").find("option:selected").text();

    var cc1 = 0;
    
    //if (q11 == 3 && q6 < 40) 
    //{
    //    alert("minimum qualification graduate and 40% ");
    //    return;
    //}
 

    if (q7 == 'NIL' || q7 == 'A' || q7 == 'A+' || q7 == 'A1' || q7 == 'B' || q7 == 'B+' || q7 == 'B1' || q7 == 'C' || q7 == 'C+' || q7 == 'C1' || q7 == 'D' || q7 == 'D+' || q7 == 'D1')
    { cc1 = 1; }

        
    //      alert(q11);
    //  alert(q22);          $('#qc').val(0);
    // $('#qual').empty();
    if (c1 == 0 || q33 == 0 || q4 == '' || q5 == '' || q6 == '' || q8 == '' || q11 == 0 || q22 == 0||typ==0||cc1==0) {
        //alert("please fill all fields")
        if (c1 == '')
        { alert("Please Select Candidate"); }
        else if (q11 == 0)
        { alert("Please Select Qualification Category"); }
        else if (q22 == 0)
        { alert("Please Select Qualification"); }
        else if (q33 == 0)
        { alert("Please Select University"); }
        else if (q4 == '')
        { alert("Please Select Institute"); }
        else if (q5 == '')
        { alert("Please select Passing Year"); }
        else if (q6 == '')
        { alert("Please Enter Percentage"); }
        else if (q8 == 0)
        { alert("Please Enter No.of Attempt"); }
        else if (typ == '')
        { alert("Please select Education Type"); }
        else if (cc1 == 0)
        { alert("Please Enter valid Grade"); }
       
    }

      else if (q11 == 3 && q6 < 40) 
        {
          alert("Minimum qualification should required graduate for jr assistant post with 40% above");
            return;
        }
    else {

        
        $("#txt_appID").prop("disabled", true);
       
          
            var a = 1;
            if ($('div[id=tbl_q]').is(':hidden')) {
                var table = document.getElementById('tbl_qual');
                $('#tbl_q').show();
                var markup = "<tr><td>" + q1 + "</td><td>" + q2 + "</td><td>" + q3 + "</td><td>" + q4 + "</td><td>" + q5 + "</td><td>" + q6 + "</td><td>" + q7 + "</td><td>" + q8 + "</td><td>" + typ1 + "</td><td hidden='hidden'>" + typ + "</td><td hidden='hidden'>" + q22 + "</td><td hidden='hidden'>" + q33 + "</td><td hidden='hidden'>" + hg + "</td><td>" + h + "</td><td><input type='button' id='" + q22 + "' onclick='dlt1(this)' value='Delete'></td></tr>";
                $("#tbl_qual tbody").append(markup);
                cleardata();
                //   $('#btn_ddel').show();
                if ($('input[id=chkq]').is(':checked')) {
                    $("#hgq").hide();
                    $('input[id=chkq]').prop("checked", false);
                }
            }
            else {
                $("#txt_appID").prop("disabled", true);
                var table = document.getElementById('tbl_qual');
                for (var r = 1, n = table.rows.length ; r < n; r++) {
                    for (var c = 10, m = table.rows[r].cells.length; c < m - 1; c++) {
                        var r1 = table.rows[r].cells[c].innerHTML;
                        if (r1 == q22) {
                            a = 1;
                            break;
                        }
                        else { a = 0; }
                    }
                }
                if (a == 0) {
                    var markup = "<tr><td>" + q1 + "</td><td>" + q2 + "</td><td>" + q3 + "</td><td>" + q4 + "</td><td>" + q5 + "</td><td>" + q6 + "</td><td>" + q7 + "</td><td>" + q8 + "</td><td>" + typ1 + "</td><td hidden='hidden'>" + typ + "</td><td hidden='hidden'>" + q22 + "</td><td hidden='hidden'>" + q33 + "</td><td hidden='hidden'>" + hg + "</td><td>" + h + "</td><td><input type='button' id='" + q22 + "' onclick='dlt1(this)' value='Delete'></td></tr>";
                    //    var markup = "<tr><td>" + q1 + "</td><td>" + q2 + "</td><td>" + q3 + "</td><td>" + q4 + "</td><td>" + q5 + "</td><td>" + q6 + "</td><td>" + q7 + "</td><td>" + q8 + "</td><td hidden='hidden'>" + q22 + "</td><td hidden='hidden'>" + q33 + "</td><td hidden='hidden'>" + hg + "</td><td>" + h + "</td><td><input type='checkbox' name='remove'></td></tr>";

                    $("#tbl_qual tbody").append(markup);
                    if ($('input[id=chkq]').is(':checked')) {
                        $("#hgq").hide();
                        $('input[id=chkq]').prop("checked", false);
                    }
                    cleardata();
                }
                else { alert("This Qualification Already Added  Please Check ....."); }
            }
        
    }
}
function dlt1(row) {//////////////////used for delete qual row
   
    var i = row.parentNode.parentNode.rowIndex;
    var rows = document.getElementById("tbl_qual").rows;
    var a = rows[i].cells[12].innerText
   
   // alert(a);
    if (a == 1) {
        $("#hgq").show();
        $("#chkq").prop("disabled", false);
        $("#chkq").prop("checked", false);

    }
    document.getElementById("tbl_qual").deleteRow(i);
    var table = document.getElementById('tbl_qual');
    var n = table.rows.length;

    if (n > 1) {

       // $("#btn_ddel").show();
        $("#tbl_q").show();
    }
    else {
        $("#txt_appID").prop("disabled", false);
     //   $("#btn_ddel").hide();
        $("#tbl_q").hide();
    }
    
}
function delrowquali() {//not use
    $("#tbl_qual tbody").find('input[name="remove"]').each(function () {
        if ($(this).is(":checked")) {
            var Row = document.getElementById("tbl_qual");
            var Cells = Row.getElementsByTagName("td");

            var i = row.parentNode.parentNode.rowIndex;
            var rows = document.getElementById("tbl_qual").rows;
            var a = rows[i].cells[12].innerText

           // var a = Cells[10].innerText;
           
            if (a == 1) {
                $("#hgq").show();
                $("#chkq").prop("disabled", false);
                $("#chkq").prop("checked", false);

            }

            $(this).parents("tr").remove();

        }
    });
    var table = document.getElementById('tbl_qual');
    var n = table.rows.length;

    if (n > 1) {

       // $("#btn_ddel").show();
        $("#tbl_q").show();
    }
    else {
        $("#txt_appID").prop("disabled", false);
     //   $("#btn_ddel").hide();
        $("#tbl_q").hide();
    }
}
function qualtableinsert()//swathy  qualification
{
  //  var empid = $("[id*=txt_session]").val();
    //  alert(empid);
    var c1 = $("#txt_appID").val();
    var table = document.getElementById('tbl_qual');
    var n = table.rows.length;
    if (c1 == 0) {
        alert("Please select employee");
    }
    else {

        var v1 = 0;
        for (var r = 1; r < n; r++) {
            for (var c = 12, m = table.rows[r].cells.length; c < m - 2; c++) {
                var r1 = table.rows[r].cells[c].innerHTML;
                if (r1 == 1)
                { v1 = 1; break; }
            }

           
        }
        if (v1 == 0)
        { alert("Please select highest qualification........."); }
        else {
            var row2 = c1 + "µ" ;
            var row3 = "";
            var row = "";
            //     var table = document.getElementById('tbl_qual');
            for (var r = 1; r < n; r++) {
                for (var c = 3, m = table.rows[r].cells.length; c < m - 2; c++) {
                    var r1 = table.rows[r].cells[c].innerHTML;
                    var row = row + r1 + "¬";
                }
                var row3 = row3 + row + "¿";
                row = "";
              
            }
            var row2 = row2 + row3;
            if (row3 == '') {
                alert("Please  select qualification details");
            }
            else {
               // alert(row2);
                qualdata = "0";
              
                


                $.ajax({
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    url: "qualification.aspx/check_data",
                    data: "{input:'" + row2 + "'}",
                    dataType: "json", beforeSend: function () {
                        return confirm("Are you sure you want to confirm?");
                    },
                    success: function (Result) {
                        var res = Result.d
                        if (res == '111') {

                            $.ajax({
                                type: "POST",
                                contentType: "application/json; charset=utf-8",
                                url: "qualification.aspx/insert_quali",
                                //     data: "{ input: '" + row2 + "' }",
                                //     data: "{age:'" + r_age + "',quali:'" + r_qual + "',per:'" + 60 + "',data:'" + data + "'}",

                                data: "{data:'" + row2 + "',qualdata:'" + qualdata + "',qual_data2:'" + qualdata + "',qual_data3:'" + qualdata + "',qual_data4:'" + qualdata + "',emerg_data:'" + qualdata + "'}",

                                dataType: "json", beforeSend: function () {
                                    return confirm("Are you sure you want to confirm?");
                                },
                                success: function (Result) {
                                    var res = Result.d
                                    alert(res);
                                    window.open("../Recruitment/qualification.aspx", "_self");
                                    //   $("#ddl_sel_candidate").val(0);
                                },
                                error: function (Result) {

                                }
                            });
                        }
                        else { alert("Must add Qualification");}
                    },
                    error: function (Result) {

                    }
                });

          

                // $("#ddl_sel_candidate").empty();
                // $("#ddl_sel_candidate").val(0);
                // qualification_add();


                ///////////
                //   var table = document.getElementById('tbl_qual');
                //   var n = table.rows.length;
                //   $("#tbl_qual tbody").find('input[name="remove"]').each(function () {
                //        for (var r = n; r > 0; r--) {
                //            $(this).parents("tr").remove();
                //         }
                //     });
                //     $("#tbl_q").hide();
                //////////////
            }

        }
        //}
    }
}
//function percent() {
//    // var vv = / ^[1-9]\d{0,2}(\.\d{3})*(,\d+)?$/;
//    // alert(0);
//    var v1 = $("#txt_percent").val();
//    //  var cardno = '^\d{0,1}(\.\d{1,2})?$';
//    var cardno = '^((\d{0,1}[0-9](\.\d{0,1}[0-9])?)|(100))$';
//    //   var cardno = /^(\d{0-1})\.\d{2}$/;

//    if (v1.match(cardno)) {
//        return true;
//    }
//    else {
//        alert("Not a valid !");
//        $("#txt_percent1").val('');
//        return false;
//    }
//}
function cleardata()//qualification
{
  
      $("#txt_institute1").val('');
    $("#cmb_univrstytin").val(0);   
     $('#yr_pass').val('');

    $("#txt_percent1").val('');
     $("#txt_grade1").val('');
     $("#txt_atmpt1").val('');
    $("#qc").val(0);
   $("#cmb_qual").empty();
  
     $("#ddl_edutype1").val(0);
  
}
function cleardataqual()//qualification
{
   
    $('#qc').val(0);
    $('#cmb_qual').empty();
    $('#txt_institute1').val('');
    $('#cmb_univrstytin').val(0);
    $('#txt_atmpt').val('');
    $('#yr_pass').val('');
    $('#txt_percent1').val('');
    $('#txt_grade1').val('');
    
    $("#ddl_edutype1").val(0);
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


function photo_tab11() {
    //window.open("../Recruitment/Reference_per.aspx", "_self");
    window.open("../Recruitment/candidate_photo.aspx", "_self");
}


//$(document).on('change', '#txt_percent1', function () {

//    var v1 = $("#txt_percent1").val();
//    if (v1 == '') { alert("Please Enter percentage of mark! ") }
//    else {
//        if (v1 > 100) {
         
//            alert("Please enter valid percentage");
//            $("#txt_percent1").val('');
//        }
//        var v2 = $("#txt_per").val();
//        if (v1 == 100 && v2 > 0) {
          
//            alert("Please enter valid percentage");
//            $("#txt_per").val('');
//        }

//    }

//});
//$(document).on('change', '#txt_per', function () {

//    var v1 = $("#txt_percent1").val();

//    var v2 = $("#txt_per").val();
//    if (v1 == 100 && v2 > 0) {
      
//        alert("Please enter valid percentage");
//        $("#txt_per").val('');
//    }

//    if (v1 == '' && v2 > 0) {
       
//        alert("Please enter valid percentage");
//        $("#txt_per").val('');
//    }

//});


function percent() {
    // var vv = / ^[1-9]\d{0,2}(\.\d{3})*(,\d+)?$/;
    // alert(0);
    var v1 = $("#txt_percent1").val();

    var x = parseFloat(v1);
    if (isNaN(x) || x <= 0 || x > 100) {
        alert("value is out of range");
        $("#txt_percent1").val('');
    }
    else {
        var decimalSeparator = ".";
        var val = "" + x;
        if (val.indexOf(decimalSeparator) < val.length - 3) {
            alert("too much decimal");
            $("#txt_percent1").val('');
        }
    }
}


