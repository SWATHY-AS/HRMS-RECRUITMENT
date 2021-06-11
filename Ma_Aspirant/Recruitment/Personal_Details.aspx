<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Personal_Details.aspx.cs" Inherits="Ma_Aspirant.Recruitment.Personal_Details" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script>
        $(window).load(function () {
           
          //  cand_load();
          //  GetAllProperties();

            $.ajax({                ///State 
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "Personal_Details.aspx/state_dtl",
                data: {},
                dataType: "json",
                success: function (Result) {
                    Result = Result.d;
                    $.each(Result, function (key, value) {

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

                },

                error: function (Result) {
                }
            });


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

            
        
        //function cand_load() {

        //    alert(112);
            var empid = $("[id*=txt_session]").val();
            // $("#ddl_sel_candidate").empty();
            //alert(empid);
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "Personal_Details.aspx/cand_detail",
                //  data: {},
                data: "{input:'" + empid + "'}",
                dataType: "json",
                success: function (Result) {

                    var res = Result.d.split("~");
                    //alert(res[10]);
                    if (res[10] == '1') {
                        $("#p_view").show();
                        $("#view1").hide();
                        $("#btn_saves").hide();
                       
                        emp_dtl(empid);
                    }
                    else {
                        $("#p_view").hide();
                        $("#view1").show();

                    }
                    $("#txt_appID").val(res[0]);

                    $("#txt_appIDname").val(res[9]);

                    $("#txt_hname").val(res[1]);
                    $("#txt_district").val(res[2]);
                    $("#txt_stat").val(res[3]);
                    $("#txt_dob").val(res[4]);
                    $("#txt_gender").val(res[5]);
                    $("#txt_age").val(res[6]);
                    $("#txt_mobile").val(res[7]);
                    $("#txt_email").val(res[8]);
                    $("#txt_name").val(res[9]);

                    //checkpin();


               }

            });
       // }
        });
        function postoffc() {
            var ppin = $("#txt_pinper").val();
            // alert(ppin);
            ddpost = $("#dd_postofc");
            // dd_postofc
            var ppin = $("#txt_pinper").val();
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
        function chkchange() {

            if ($('input[id=chk_ad1]').is(':checked')) {
                $("#present_address").hide();
                $("#txt_housename2").val('');
                $("#txtarea_landmark2").val('');
                $("#txt_state").val('');
                $("#txt_dist").val('');
                $("#txt_pin").val('');
                $("#ddl_post").val(-1);
                $("#ddl_local2").val(0);
                //$("#dd_st2").val('');
                //$("#dd_dist2").val('');
                //$("#dd_post2").val('');
                //$("#txt_pin2").val('');
                //$("#txt_name").prop("disabled", true);
                //$("#txt_housename2").prop("disabled", true);
                //$("#dd_st2").prop("disabled", true);
                //$("#dd_dist2").prop("disabled", true);
                //$("#dd_post2").prop("disabled", true);
                //$("#txt_pin2").prop("disabled", true);             
            }
            else {
                $("#present_address").show();
                //$("#txt_name").prop("disabled", false);
                //$("#txt_housename2").prop("disabled", false);
                //$("#dd_st2").prop("disabled", false);
                //$("#dd_dist2").prop("disabled", false);
                //$("#dd_post2").prop("disabled", false);
                //$("#txt_pin2").prop("disabled", false);
                //$("#ddl_local2").prop("disabled", false);
            }
        }

          function isNumberKey(evt, element) {

               var charCode = (evt.which) ? evt.which : event.keyCode
               if (charCode > 31 && (charCode < 48 || charCode > 57) && !(charCode == 8))
                   return false;
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
                   if ((charCode > 64 && charCode < 91) || (charCode > 96 && charCode < 123) || (charCode == 8) || (charCode == 32))
                       return true;
                   else
                       return false;
               }
               catch (err) {
                   alert(err.Description);
               }
        }
           function next() {
               window.location.href = "qualification.aspx"
            // window.location.href = "Reference_per.aspx"
           }

           function save_cand() {
              
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
               //-------------------
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
               var localbody1 = $("#ddl_local1").val();
               
               var e_chkaddr = 0;
               if ($('input[id=chk_ad1]').is(':checked')) {
                   e_chkaddr = 1;
       
                   var cand_pre_hname = $("#txt_hname").val();
                  // var cand_pre_state = $("#txt_stat").val();//4
                  //var cand_pre_district = $("#txt_district").val();//3
                   var cand_pre_post = $("#dd_postofc").val();//15
                  // var cand_pin_code2 = $("#dd_postofc").val(); //$("#txt_pinper").val();//14
                   var cand_landmark2 = $("#txtarea_landmark1").val();
                  // var cand_pre_post11 = $("#dd_post2").find('option:selected').val();
                 
                   var localbody2 = $("#ddl_local1").val();
               }
               else {
                   e_chkaddr = 0;
                   var cand_pre_hname = $("#txt_housename2").val();
                   //var cand_pre_state = $("#dd_st2").val();
                   //var cand_pre_district = $("#dd_dist2").val();
                   var cand_pre_post = $("#ddl_post").val();
                 //  var cand_pin_code2 = $("#dd_post2").val();//$("#txt_pin2").val();
                   var cand_landmark2 = $("#txtarea_landmark2").val();
                   //var cand_pre_post11 = $("#dd_post2").find('option:selected').val();
                   
                   var localbody2 = $("#ddl_local2").val();
                 //  var cand_pre_state = $("#txt_state").val();
                 //  var cand_pre_district = $("#txt_dist").val();
                 //   var cand_pin_code2 = $("#txt_pin2").val();
               }

                var cand_emrg_name = $("#txt_emer_name").val();
                var cand_emrgrel = $("#txt_emer_relation").val();
                var cand_emrgaddr = $("#txtarea_address_emer").val();
                var cand_emrgno = $("#txt_cntctnumb").val();
                var cand_emrgmail = $("#txt_emer_email").val();


                var marr = 0;
                if ($('input[id=rdo_married]').is(':checked')) {
                    var marr = 2;
                    if (e_spouse == '')
                    { var e_spouse = "NILL"; }
                    var e_spouse = $("#txt_spousename").val();
                    if (e_spouse == '')
                    { var e_spouse = "NILL"; }
                    var e_nofchild = $("#txt_noofchild").val();
                    var e_spno = $("#txt_spouseno").val();
                }
                if ($('input[id=rdo_single]').is(':checked')) {
                    var marr = 1;
                    var e_spouse = "NILL";
                    var e_nofchild = 0;
                    var e_spno = 0;
                }
                if ($('input[id=rdo_divorce]').is(':checked')) {
                    var marr = 3;
                    var e_spouse = "NILL";
                    var e_nofchild = 0;
                    var e_spno = 0;
                }

                var fcnt = $("#txt_fcnt").val();
                var cand_mob2 = $("#txt_mobalter").val();//8


                if (cand_pre_post == 0 || cand_postper == 0 || cand_mob2 == '' || marr == 0 || fst == 22 || wrk == 22 || localbody1 == 0 || localbody2 == 0 || cand_fname == '' || cand_postper == '' || cand_mname == '' || cand_landmark1 == '' || cand_pincode == '' || cand_pre_hname == '' || cand_blood == 0 || cand_religion == 0 || cand_landmark2 == '' || cand_emrg_name == '' || cand_emrgrel == '' || cand_emrgaddr == '' || cand_emrgno == '' || cand_emrgmail == '') {

                    if (cand_postper == 0) { alert("Please Enter Permanent Postal Address"); }
                    if (cand_pre_post == 0) { alert("Please Enter Present Postal Address"); }
      if (cand_postper == '') { alert("Please Enter Permanent Postal Address"); }

      else if (cand_emrg_name == '') { alert("Please enter the emergency contact name"); }
      else if (cand_emrgrel == '') { alert("Please enter the relation"); }
      else if (cand_emrgaddr == '') { alert("Please enter the emergency contact address"); }
      else if (cand_emrgno == '') { alert("Please enter the emergency contact number"); }
      else if (cand_emrgmail == '') { alert("Please enter the emergency contact email address"); }

                   else if (cand_pincode == '') { alert("Please Enter Permanent Pincode"); }
                   else if (cand_fname == '') { alert("Please Enter father's name"); }
                   else if (cand_mname == '') { alert("Please Enter mother's name"); }       
    
                   else if (cand_pre_hname == '') { alert("Please Enter house name"); }
                   else if (cand_blood == 0) { alert("Please Select  blood group"); }
                   else if (cand_religion == 0) { alert("Please select religion"); }
                  // else if (cand_pre_state == 0) { alert("Please select states"); }
                   else if (fst == 22)
                   { alert("Please Select Are you looking for further Studies"); }
                   else if (wrk == 22)
                   { alert("Please Select Are you willing to work any were in India"); }
                   else if (localbody1 == 0)
                   { alert("Please Select Local Body permenant"); }
                   else if (localbody2 == 0)
                   { alert("Please Select Local Body present"); }
                   else if (cand_landmark1 == '') { alert("Please enter the land mark permenant"); }
                   else if (cand_landmark2 == '') { alert("Please enter the land mark  present"); }
     else if (cand_mob2 == '') { alert("Please Enter Alternative Contact Number"); }
                  
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
     // var persn_data = cand_code + "~" + cand_name + "~" + cand_hsname + "~" + cand_postper11 + "~" + cand_district1 + "~" + cand_state1 + "~" + cand_pre_hname + "~" + cand_pre_post11 + "~" + cand_pre_district + "~" + cand_pre_state + "~" + cand_fname + "~" + cand_postper + "~" + cand_pin_code2 + "~" + cand_mob + "~" + cand_dob1 + "~" + cand_gender1 + "~" + cand_mail + "~" + cand_mrg_status + "~" + cand_religion + "~" + cand_cast + "~" + cand_landmark2 + "~" + cand_diff_abled + "~" + cand_rmkhand + "~" + cand_blood + "~" + cand_landmark1 + '~' + e_chkaddr + '~' + localbody1 + '~' + localbody2 + '~' + fst + '~' + wrk;
      //var emerg_data = cand_code + "~" + cand_emrg_name + "~" + cand_emrgrel + "~" + cand_emrgmail + "~" + cand_emrgno + "~" + cand_emrgaddr;
      var qual_data1 = '';
      var qual_data2 = '';
      var qual_data3 = '';
      var qual_data4 = '';
     
      var persn_data = cand_code + "µ" + cand_name + "µ" + cand_hsname + "µ" + cand_pre_hname + "µ" + cand_fname + "µ" + cand_postper + "µ" + cand_pre_post + "µ" + cand_mob + "µ" + cand_dob1 + "µ" + cand_gender1 + "µ" + cand_mail + "µ" + cand_mrg_status + "µ" + cand_religion + "µ" + cand_cast + "µ" + cand_landmark2 + "µ" + cand_diff_abled + "µ" + cand_rmkhand + "µ" + cand_blood + "µ" + cand_landmark1 + 'µ' + e_chkaddr + 'µ' + localbody1 + 'µ' + localbody2 + 'µ' + fst + 'µ' + wrk + "µ" + e_spouse + "µ" + e_nofchild + "µ" + e_spno + 'µ' + fcnt + 'µ' + cand_mob2;

 //     var persn_data = cand_code + "µ" + cand_name + "µ" + cand_hsname + "µ" + cand_postper11 + "µ" + cand_district1 + "µ" + cand_state1 + "µ" + cand_pre_hname + "µ" + cand_pre_post11 + "µ" + cand_pre_district + "µ" + cand_pre_state + "µ" + cand_fname + "µ" + cand_postper + "µ" + cand_pin_code2 + "µ" + cand_mob + "µ" + cand_dob1 + "µ" + cand_gender1 + "µ" + cand_mail + "µ" + cand_mrg_status + "µ" + cand_religion + "µ" + cand_cast + "µ" + cand_landmark2 + "µ" + cand_diff_abled + "µ" + cand_rmkhand + "µ" + cand_blood + "µ" + cand_landmark1 + 'µ' + e_chkaddr + 'µ' + localbody1 + 'µ' + localbody2 + 'µ' + fst + 'µ' + wrk;
      var emerg_data = cand_code + "µ" + cand_emrg_name + "µ" + cand_emrgrel + "µ" + cand_emrgmail + "µ" + cand_emrgno + "µ" + cand_emrgaddr;

     // alert(persn_data);
   
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

              else //if (Result == "000")
              {
                  alert("Unable to Submit! Please Try again");
              }


              window.open("../Recruitment/qualification.aspx", "_self");
          },
          error: function (Result) {
          }
      });

               }
              
               //------------------------------------------------------------------------------           
               // if (fst == 22 || wrk == 22 || localbody1 == 0 || localbody1 == 0 || cand_fname == '' || cand_postper == '' || cand_mname == '' || cand_landmark1 == '' || cand_pincode == '' || cand_pre_hname == '' || cand_blood == 0 || cand_religion == 0 || dd_st2 == 0 || cand_pre_state == 0 || cand_landmark2 == '' || qual_cat == 0 || qual_type == 0 || cand_inst == '' || cand_uni == 0 || cand_pass == '' || cand_percent == '' || cand_grade == '' || cand_no_attempt == '' || cand_edu_typ == 0 || cand_emrg_name == '' || cand_emrgrel == '' || cand_emrgaddr == '' || cand_emrgno == '' || cand_emrgmail == '') {
              
           }
       

    </script>
  
    <script>
      
        function showdiv() {
            if (document.getElementById) {
                document.getElementById('family_dtl1').style.visibility = 'visible';
                document.getElementById('family_dtl1').style.display = 'block';

            }
        }
       
        function showdivcloned() {
            if (document.getElementById) {
                document.getElementById('clonedInput2').style.visibility = 'visible';
                document.getElementById('clonedInput2').style.display = 'block';

            }
        }
        function showdivcloned1() {
if (document.getElementById) {
                document.getElementById('clonedInput3').style.visibility = 'visible';
                document.getElementById('clonedInput3').style.display = 'block';

            }
        }
        function showdivcloned2() {
if (document.getElementById) {
                document.getElementById('clonedInput4').style.visibility = 'visible';
                document.getElementById('clonedInput4').style.display = 'block';

            }
        }
        function remove() {
            if (document.getElementById) {
                document.getElementById('clonedInput2').style.visibility = 'hidden';
                document.getElementById('clonedInput2').style.display = 'block';
                document.getElementById('clonedInput2').style.display = 'none';

            }
        }
        function remove1() {
            if (document.getElementById) {
                document.getElementById('clonedInput3').style.visibility = 'hidden';
                document.getElementById('clonedInput3').style.display = 'block';
                 document.getElementById('clonedInput3').style.display = 'none';
            }
        }
        function remove2() {
            if (document.getElementById) {
                document.getElementById('clonedInput4').style.visibility = 'hidden';
                document.getElementById('clonedInput4').style.display = 'block';
                 document.getElementById('clonedInput4').style.display = 'none';
            }
        }
        function removefam() {
            if (document.getElementById) {
                document.getElementById('family_dtl1').style.visibility = 'hidden';
                document.getElementById('family_dtl1').style.display = 'block';
                 document.getElementById('family_dtl1').stle.display = 'none';
            }
        }
        function showdivfam1() {
            if (document.getElementById) {
                document.getElementById('family_dtl2').style.visibility = 'visible';
                document.getElementById('family_dtl2').style.display = 'block';

            }
        }
        function removefam1() {
            if (document.getElementById) {
                document.getElementById('family_dtl2').style.visibility = 'hidden';
                document.getElementById('family_dtl2').style.display = 'block';
                document.getElementById('family_dtl2').style.display = 'none';


            }
        }
        function showdivprev() {
 if (document.getElementById) {
                document.getElementById('prev_exp_dtl1').style.visibility = 'visible';
                document.getElementById('prev_exp_dtl1').style.display = 'block';

            }
        }
        function removeprev() {
            if (document.getElementById) {
                document.getElementById('prev_exp_dtl1').style.visibility = 'hidden';
                document.getElementById('prev_exp_dtl1').style.display = 'block';
                document.getElementById('prev_exp_dtl1').style.display = 'none';

            }
        }
         function showdivprev1() {
 if (document.getElementById) {
                document.getElementById('prev_exp_dtl2').style.visibility = 'visible';
                document.getElementById('prev_exp_dtl2').style.display = 'block';

            }
        }
        function removeprev1() {
            if (document.getElementById) {
                document.getElementById('prev_exp_dtl2').style.visibility = 'hidden';
                document.getElementById('prev_exp_dtl2').style.display = 'block';
                 document.getElementById('prev_exp_dtl2').style.display = 'none';


            }
        }
        function quali_tab() {
            window.open("../Recruitment/qualification.aspx", "_self");
        }

        //27may
       
   
        function emp_dtl(emp) {

            var emp = $("[id*=txt_session]").val();
            
           

            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "Personal_Details.aspx/get_emp_dtl",
                data: "{ input: '" + emp + "' }",
                dataType: "json",
                success: function (Result) {

                    var res = Result.d.split("~");

                    //c.cand_code,c.cand_name,to_char(t.dob, 'dd/mon/yyyy'),c.religion_id,c.caste,c.sslc_no,c.physically_challenged,
                    //c.physcical_remarks,c.perm_add1,c.perm_pin,c.landmark,c.pres_add1,c.pres_pin,c.present_landmark,c.father_name,
                    //c.father_contact,c.res_phone,
                    //c.cont_phone,c.sex,c.marital_status,c.spouse_name,c.child_number,c.spouse_contact,d.emg_cont_name,d.emg_relation,d.emg_address,
                    //d.emg_cont_no,d.emg_email,c.blood_id,c.id_proof,c.idproof_number,c.cand_email,po.pin_code,
                    //po.post_office,ds.district_id,ds.district_name,s.state_id,s.state_name,c.blood_id,t.pan_no,t.email,
                    //po1.pin_code,po1.post_office,ds1.district_id,ds1.district_name,s1.state_id,s1.state_name,
                    //c.pp,c.local_body_perm,c.local_body_pres,c.further_study, c.willing_towrk

                    //0c.cand_code,1c.cand_name,2to_char(t.dob, 'dd/mon/yyyy'),3c.religion_id,4c.caste,5c.sslc_no,6c.physically_challenged,7c.physcical_remarks,
                    //8c.perm_add1,9c.perm_pin,10c.landmark,11c.pres_add1,12c.pres_pin,13c.present_landmark,14c.father_name,15c.father_contact,
                    //16c.res_phone,17c.cont_phone,18c.sex,19c.marital_status,20c.spouse_name,21c.child_number,22c.spouse_contact,23d.emg_cont_name,
                    //24d.emg_relation,25d.emg_address,26d.emg_cont_no,27d.emg_email,28c.blood_id,29c.id_proof,30c.idproof_number,31c.cand_email,               
                    //32po.pin_code,33po.post_office,34ds.district_id,35ds.district_name,36s.state_id,37s.state_name,
                    //38c.blood_id,39t.pan_no,40t.email,41po1.pin_code,42po1.post_office,43ds1.district_id, 44ds1.district_name, 45s1.state_id, 46 s1.state_name,

                    // var date = res[0].split(' ');
                    // $('#txt_joindt').val(date[0]);
                    var dob = res[2].split(' ');
                    $("#t_dob").val(dob[0]);
                    $("#txt_rel").val(res[3]);

                    var cst = res[4];
                    if (cst == 1) {
                        $("#txt_caste").val('SC');
                        // $("#ch1").prop('checked', true);
                    }
                    else if (cst == 2) {
                        $("#txt_caste").val('ST');
                        // $("#ch2").prop('checked', true);
                    }
                    else if (cst == 3) {
                        $("#txt_caste").val('OBC');
                        // $("#ch3").prop('checked', true);
                    }
                    else if (cst == 4) {
                        $("#txt_caste").val('Others');
                        //$("#ch4").prop('checked', true);
                    }
                    else if (cst == 5) {
                        $("#txt_caste").val('General');
                        // $("#ch5").prop('checked', true);
                    }
                    //0c.cand_code,1c.cand_name,2to_char(t.dob, 'dd/mon/yyyy'),3c.religion_id,4c.caste,5c.sslc_no,6c.physically_challenged,7c.physcical_remarks,

                    //  $('#txt_sslcno').val(res[5]);
                    //  $('#txt_aadharno').val(res[6]);
                    // $('#txt_panno').val(res[7]);
                    // $('#txt_uanno').val(res[8]);
                    var phy = res[6];
                    if (phy == 1) {
                        $("#hidehandi1").show();
                        $("#r_hy").prop('checked', true);
                        $("#txt_rmk").val(res[7]);
                    }
                    else if (phy == 0) {
                        $("#hidehandi1").hide();
                        $("#r_hn").prop('checked', true);
                    }

                    //0c.cand_code,1c.cand_name,2to_char(t.dob, 'dd/mon/yyyy'),3c.religion_id,4c.caste,5c.sslc_no,6c.physically_challenged,7c.physcical_remarks,
                    //8c.perm_add1,9c.perm_pin,10c.landmark,11c.pres_add1,12c.pres_pin,13c.present_landmark,14c.father_name,15c.father_contact,
                    //16c.res_phone,17c.cont_phone,18c.sex,19c.marital_status,20c.spouse_name,21c.child_number,22c.spouse_contact,23d.emg_cont_name,
                    //24d.emg_relation,25d.emg_address,26d.emg_cont_no,27d.emg_email,28c.blood_id,29c.id_proof,30c.idproof_number,31c.cand_email,               
                    //32po.pin_code,33po.post_office,34ds.district_id,35ds.district_name,36s.state_id,37s.state_name,
                    //38c.blood_id,39t.pan_no,40t.email,41po1.pin_code,42po1.post_office,43ds1.district_id, 44ds1.district_name, 45s1.state_id, 46 s1.state_name,

                    $("#txt_state1").val(res[37]);
                    $("#txt_state2").val(res[46]);
                    $("#txt_district1").val(res[35]);
                    $("#txt_district2").val(res[44]);
                    $("#txt_post1").val(res[33]);
                    $("#txt_post2").val(res[42]);
                    $("#txt_housename1").val(res[8]);
                    $("#txt_pin1").val(res[32]);//permenant
                    $("#txt_l1").val(res[10]);
                    $("#txt_h2").val(res[11]);
                    $("#txt_pin2").val(res[41]);
                    $("#txt_l2").val(res[13]);
                    $("#txt_fathername").val(res[14]);
                    $("#txt_fathercntno").val(res[15]);
                    $("#txt_primaryno").val(res[16]);
                    $("#txt_altrnateno").val(res[17]);
                    var gen = res[18];
                    if (gen == 0) {
                        $("#txt_gen").val('Female');
                        // $("#rdo_female").prop('checked', true);
                    }
                    else if (gen == 1) {
                        $("#txt_gen").val('Male');
                        // $("#rdo_male").prop('checked', true);
                    }
                    else if (gen == 2) {
                        $("#txt_gen").val('Other');
                        // $("#rdo_other").prop('checked', true);
                    }
                    // $("#txt_emailid").val(res[22]);

                    //-------  new change  21-dec-2019
                    $("#ddl1").val(res[48]);
                    $("#ddl2").val(res[49]);
                    var fst = res[50];
                    var wrk = res[51];



                    if (fst == 1) {

                        $("#r_sty").prop('checked', true);
                    }
                    else if (fst == 2)
                    { $("#r_stn").prop('checked', true); }
                    if (wrk == 1)
                    { $("#rd_wy").prop('checked', true); }
                    else if (wrk == 2)
                    { $("#rd_wn").prop('checked', true); }

                    //-------------------------       
                    var m = res[19];
                    if (m == 1) {
                        $("#rds").prop('checked', true);
                        $("#hidediv1").hide();
                    }
                    else if (m == 2) {
                        $("#hidediv1").show();
                        $("#rdm").prop('checked', true);
                        $("#txt_sp").val(res[20]);
                        $("#txt_ch").val(res[21]);
                        $("#txt_no").val(res[22]);
                    }
                    else if (m == 3) {
                        $("#rdd").prop('checked', true);
                        $("#hidediv").hide();
                    }

                    $('#txt_1stname').val(res[1]);

                    $("#txt_panno").val(res[39]);
                    $("#txt_emailid").val(res[40]);
                    $("#txt_blood").val(res[28]);


                    $("#tbl_em tbody").empty();
                    $("#tbl_emg").show();
                    $("#tbl_emg tbody").append('<tr> <td>' + res[23] + '</td>' +
           '<td>' + res[24] + '</td>' +
          '<td>' + res[25] + '</td>' +
          '<td>' + res[26] + '</td>' +
          '<td>' + res[27] + '</td></tr>');
                },
                error: function (Result) {

                }
            });

        }

        function rdo_handicapped1()//swathy
        {
            if ($('input[id=r_hy]').is(':checked')) {
                $('#hidehandi1').show();
            }
            if ($('input[id=r_hn]').is(':checked')) {
                $('#hidehandi1').hide();
            }
        }

    </script>
         <script type="text/javascript" src="../App_Themes/Theme/assets/js/personal_det.js"></script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="panel panel-default col-md-12">
        <div id="Tabs" role="tabpanel">
            <!-- Nav tabs -->
              <ul class="nav nav-pills" role="tablist">
                <li class="active gen" ><a href="#personaldet" aria-controls="personaldet" role="tab" data-toggle="pill" onclick="personaldet_tab()" id="tabs2">Personal</a></li>
                 <li   class="gen"><a href="#qualidet" aria-controls="qualidet" role="tab" data-toggle="pill" onclick="quali_tab()" id="tab6">Qualification</a></li>
                                   <li class="gen" ><a href="#family" aria-controls="family" role="tab" data-toggle="pill" onclick="family_tab()" id="tab7">Family</a></li>
                    <li  class="gen"><a href="#experience" aria-controls="experience" role="tab" data-toggle="pill" onclick="ref_tab()" id="tabs4">Reference</a></li>
                                      <li  class="gen"><a href="#common_nom" aria-controls="common_nom" role="tab" data-toggle="pill" onclick="com_nom()" id="tabs5">Common Nomination Form</a></li>

                                  <li  class="gen" ><a href="#docupload" aria-controls="empassign" role="tab" data-toggle="pill" onclick="doc_tab()" id="tabs3">Document Upload</a></li>
                                     
  <li  class="gen"><a href="#photo" aria-controls="exp" role="tab" data-toggle="pill" onclick="photo_tabnew()" id="tabs6">Photo</a></li>
                                 
                  
                       </ul>
            <!-- Tab panes -->
            <form id="Form1" class="form-horizontal row-border" action="#" runat="server">
                <div class="tab-content">


                    <div id="p_view" hidden="hidden">



                                   

                        <div class="form-group">
                            <div class="col-md-12">
                                <div class="widget box">
                                    <%--  <div class="row">--%>

                                    <div class="widget-header clonedInput">
                                    </div>
                                   
                                      <div id="Div1" class="clonedInput">
                                             <div class="widget-content">
                                                 
                                                                                                                                                                                    
                              
                        <div class="form-group">
                         
                        
                            <label class="col-md-2 cntr-text">Gender<span class="required"> *</span></label>
                            <div class="col-md-4">
                   <input type="text" name="regular" class="form-control" id="txt_gen"  required="required" disabled ondrop="false" onkeydown="return false" onpaste="false" onkeyup="leftTrim(this)" autocomplete="off"  />

                               
                            </div>
                            <label class="col-md-2 cntr-text">Caste</label>
                            <div class="col-md-4">
                                  <input type="text" name="regular" class="form-control" id="txt_caste" disabled/>
                    </div>
                            </div>



                    <div class="form-group">
                            <label class="col-md-2 cntr-text">Date Of Birth<span class="required"> *</span></label>
                            <div class="col-md-4">
                                <input type="text" name="regular" class="form-control" id="t_dob"  required="required" disabled ondrop="false" onkeydown="return false" onpaste="false" onkeyup="leftTrim(this)" autocomplete="off"  />
                            </div>
                        <label class="col-md-2 cntr-text">Religion</label>
                            <div class="col-md-4">
                                    <input type="text" name="regular" class="form-control" id="txt_rel" disabled/>
                            </div>
                                        </div>
                    <div class="form-group">
                        <label class="col-md-2 cntr-text">Blood Id</label>
                                            <div class="col-md-4">

                                                   <input type="text" name="regular" class="form-control" id="txt_blood" disabled/>
                                            </div>
                         <label class="col-md-2 cntr-text">PAN Card</label>
                            <div class="col-md-4">
                                <input type="text" name="regular" class="form-control" id="txt_panno" maxLength="10" autocomplete="off" onblur="leftTrim(this)" onchange="pandtl()" disabled onkeyup="this.value=this.value.toUpperCase()" />
                         </div>
                                        </div>
                      
                                                    
                                                 
                                                 
                                                   
                                        
                                
</div> 
                                    </div>
                                </div>
                                   
                            </div>
                            
                        </div>


                     
                
                      <div class="form-group">
                            
                            <label class="col-md-2 cntr-text" hidden="hidden">UAN No</label>
                            <div class="col-md-3" hidden="hidden">
                                <input type="text" name="regular" class="form-control" id="txt_uanno"  maxLength="12" onchange="uandtl()" onkeyup="leftTrim(this)" autocomplete="off"   />
                            </div>
                       
                     
                     </div>
                        <div class="form-group">
                              <div class="col-md-12">
                            <label class="col-md-2 cntr-text">Differently abled </label>
                             
                               <div class="col-md-3">
                                <label class="radio-inline cntr-text">
                                    <input name="radio_handi" value="yes" type="radio"class="required" id="r_hy" onclick="rdo_handicapped1()" disabled/>
                                   Yes
                                </label>
                              
                                <label class="radio-inline  cntr-text">
                                    <input name="radio_handi" value="no" type="radio" class="required" id="r_hn" onclick="rdo_handicapped1()" disabled/>
                                    No
                                </label>   </div>
</div>
                       
                        </div>
                             <div class="form-group">
                           <div id="hidehandi1" hidden="hidden">
                                  <label class="col-md-2 cntr-text">Remark</label>
                            <div class="col-md-6">
                                <input type="text" name="regular" class="form-control" id="txt_rmk" maxlength="50" onkeypress=" return IsAlphaNumeric(event);" onkeydown="leftTrim(this)" autocomplete="off"  disabled onkeyup="this.value=this.value.toUpperCase()" />
                            </div>
                          </div>
                    </div>
              
                                     <div class="form-group">
                         <div class="col-md-12">
                            <label class="col-md-2 cntr-text">Are you looking for further Studies?</label>
                             <div class="col-md-3">
                                <label class="radio-inline cntr-text">
                                    <input name="radio_st" value="1" type="radio"class="required" id="r_sty" disabled/>
                                   Yes
                                </label>
                              
                                <label class="radio-inline  cntr-text">
                                    <input name="radio_st" value="2" type="radio" class="required" id="r_stn" disabled />
                                    No
                                </label>   </div>
                            <label class="col-md-2 cntr-text">Are you willing to work any where in India?</label>
                           <div class="col-md-3">
                                <label class="radio-inline cntr-text">
                                    <input name="radio_work" value="1" type="radio"class="required" id="rd_wy" onclick="rdo_work()" disabled/>
                                   Yes
                                </label>
                              
                                <label class="radio-inline  cntr-text">
                                    <input name="radio_work" value="2" type="radio" class="required" id="rd_wn" onclick="rdo_work()" disabled/>
                                    No
                                </label>   </div>
                             </div>
                        </div>

               
                         <br />
                        <div class="form-group">
                            <div class="col-md-6">
                                <div class="widget box">
                                    <div class="widget-header">
                                        <h4><i class="icon-reorder"></i>Permanent Address<span class="required"> *</span></h4>
                                    </div>
                                    <div class="widget-content">
                                        <div class="form-group">
                                            <label class="col-md-4 cntr-text">House Name</label>
                                            <div class="col-md-8">
                                                <input type="text" name="regular" class="form-control" id="txt_housename1" maxlength="25" disabled onkeydown="leftTrim(this)" autocomplete="off"  onkeyup="this.value=this.value.toUpperCase()" onkeypress="return IsAlphaNumeric(event);" />
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-md-4 cntr-text">State</label>
                                            <div class="col-md-8">
                                                   <input type="text" name="regular" class="form-control" id="txt_state1" disabled/>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-md-4 cntr-text">District</label>
                                            <div class="col-md-8">
                                                  <input type="text" name="regular" class="form-control" id="txt_district1" disabled/>
                                            </div>

                                        </div>
                                          <div class="form-group">

                                            <label class="col-md-4 cntr-text">Local Body</label>
                                            <div class="col-md-8">
                                              
                                                <select class="form-control" id="ddl1" name="Dt" disabled>
                                                   <option value="0">----SELECT----</option>
                                        <option value="1">Village / Panchayat</option>
                                        <option value="2">Municipal Council</option>
                                        <option value="3">Corporation</option>
                                         <option value="4">Metro</option>
                                                </select>
                                            </div>

                                        </div>
                                        <div class="form-group">

                                            <label class="col-md-4 cntr-text">Post</label>
                                            <div class="col-md-8">
                                                 <input type="text" name="regular" class="form-control" id="txt_post1" disabled/>
                                            </div>

                                        </div>
                                        <div class="form-group">

                                            <label class="col-md-4 cntr-text">Pincode</label>
                                            <div class="col-md-8">
                                                <input type="text" name="regular" class="form-control" id="txt_pin1" disabled/>
                                            </div>

                                        </div>

                                        <div class="form-group">
                                            <label class="col-md-4 cntr-text">Land Mark</label>
                                            <div class="col-md-8">
                                                <textarea class="form-control" rows="2" id="txt_l1" disabled onkeydown="leftTrim(this)" maxlength="50" autocomplete="off"  onkeypress=" return IsAlphaNumeric(event);" onkeyup="this.value=this.value.toUpperCase()" ></textarea>
                                            </div>

                                        </div>
                                      
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="widget box" style="background-color: #f0d6b9">
                                   
                                    <div class="widget-header">
                                        <h4><i class="icon-reorder"></i>Present Address<span class="required"> *</span></h4>
                                    </div>
                                    <div class="widget-content">
                                        <div class="form-group">

                                            <label class="col-md-4 cntr-text">House Name</label>
                                            <div class="col-md-8">
                                                <input type="text" name="regular" class="form-control" id="txt_h2" maxlength="25" disabled onkeydown="leftTrim(this)" autocomplete="off"  onkeypress=" return IsAlphaNumeric(event);" onkeyup="this.value=this.value.toUpperCase()" />
                                            </div>
                                        </div>
                                        <div class="form-group">

                                            <label class="col-md-4 cntr-text">State</label>
                                            <div class="col-md-8">

                                                   <input type="text" name="regular" class="form-control" id="txt_state2" disabled/>
                                            </div>

                                        </div>

                                        <div class="form-group">

                                            <label class="col-md-4 cntr-text">District</label>
                                            <div class="col-md-8">
                                              
                                                <input type="text" name="regular" class="form-control" id="txt_district2" disabled/>
                                            </div>

                                        </div>
                                          <div class="form-group">

                                            <label class="col-md-4 cntr-text">Local Body</label>
                                            <div class="col-md-8">
                                              
                                                <select class="form-control" id="ddl2" name="Dt" disabled>
                                                   <option value="0">----SELECT----</option>
                                        <option value="1">Village / Panchayat</option>
                                        <option value="2">Municipal Council</option>
                                        <option value="3">Corporation</option>
                                         <option value="4">Metro</option>
                                                </select>
                                            </div>

                                        </div>
                                        <div class="form-group">

                                            <label class="col-md-4 cntr-text">Post</label>
                                            <div class="col-md-8">
                                                 <input type="text" name="regular" class="form-control" id="txt_post2" disabled/>
                                            </div>

                                        </div>
                                        <div class="form-group">

                                            <label class="col-md-4 cntr-text">Pincode</label>
                                            <div class="col-md-8">
                                                <input type="text" name="regular" class="form-control" id="txt_pin2" disabled/>
                                            </div>

                                        </div>

                                        <div class="form-group">
                                            <label class="col-md-4 cntr-text">Land Mark</label>
                                            <div class="col-md-8">
                                                <textarea class="form-control" rows="2" id="txt_l2" disabled maxlength="50" onkeydown="leftTrim(this)" autocomplete="off"  onkeypress=" return IsAlphaNumeric(event);" onkeyup="this.value=this.value.toUpperCase()" ></textarea>
                                            </div>

                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                         
                        <div class="form-group">
                            <label class="col-md-2 cntr-text">Primary Contact No.<span class="required" > *</span></label>
                            <div class="col-md-4">
                                <input type="text" name="prmryno" class="form-control" id="txt_primaryno" minlength="10" disabled maxlength="12" onkeyup="leftTrim(this)" autocomplete="off"  onkeypress="return isNumberKey(event,this)"/>
<%--                                 <label for="prmryno" generated="true" class="has-error help-block">This field is required.</label>--%>
                            </div>
                            <label class="col-md-2 cntr-text">Alternate Contact No.</label>
                            <div class="col-md-4">
                                <input type="text" name="altrno" class="form-control" id="txt_altrnateno" minlength="10" disabled maxlength="12" onkeyup="leftTrim(this)" autocomplete="off"   onkeypress="return isNumberKey(event,this)"/>
<%--                                <label for="altrno" generated="true" class="has-error help-block">This field is required.</label>--%>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-2 cntr-text">Email ID<span class="required"> *</span></label>
                            <div class="col-md-4">
                                <input type="text" name="emailid" class="form-control" id="txt_emailid"  onblur="chkemail(this.id);" onkeydown="leftTrim(this)" autocomplete="off"  disabled onkeyup="this.value=this.value.toUpperCase()" />
<%--                                <label for="emailid" class="has-error help-block">Please enter a valid email address.</label>--%>
                            </div>

                           
                        </div>
                    <div class="form-group"> <label class="col-md-2 cntr-text">Marital Status<span class="required"> *</span></label>
                            <div class="col-md-5">
                                <label class="radio-inline cntr-text">
                                     <input type="radio" name="radio_marital" value="married" class="required" id="rdm" disabled onclick="rdo_marital()" />
                                  Married</label>
                                   
                                   <label class="radio-inline cntr-text">
                                    <input type="radio" name="radio_marital" value="single" class="required" id="rds" disabled onclick="rdo_marital()" />
                                    Single</label>
                                     <label class="radio-inline cntr-text">
                                    <input type="radio" name="radio_marital" value="divorce" class="required" id="rdd" disabled onclick="rdo_marital()"/>
                                    Divorce</label>
<%--                                <label for="radio_marital" class="has-error help-block" generated="true" style="display: none;"></label>--%>
                            </div></div>
                        <div class="form-group">
                            <label class="col-md-2 cntr-text">Father</label>
                            <div class="col-md-4">
                                <input type="text" name="regular" class="form-control" id="txt_fathername" maxlength="30" disabled onkeyup="this.value=this.value.toUpperCase()" onkeydown="leftTrim(this)" autocomplete="off"  />
                            </div>
                            <label class="col-md-2 cntr-text">Contact No.</label>
                            <div class="col-md-4">
                                <input type="text" name="regular" class="form-control" id="txt_fathercntno" disabled  maxlength="12" minlength="10" onkeypress="return isNumberKey(event,this)" onkeydown="leftTrim(this)" autocomplete="off" />
                            </div>
                        </div>
                        <div id="hidediv1" hidden="hidden">
                        <div class="form-group">
                            <label class="col-md-2 cntr-text">Spouse</label>
                            <div class="col-md-4">
                                <input type="text" name="regular" class="form-control" id="txt_sp" maxlength="30" onkeydown="leftTrim(this)" onkeypress="return onlyAlphabets(event,this);" autocomplete="off"  disabled onkeyup="this.value=this.value.toUpperCase()"  />
                            </div>

                            <label class="col-md-2 cntr-text">No Of Children</label>
                            <div class="col-md-4">
                                <input type="text" name="regular" class="form-control" id="txt_ch" maxlength="2" onkeyup="leftTrim(this)" autocomplete="off"  disabled onkeypress="return isNumberKey(event,this)"/>
                            </div>
                        </div>
                          <div class="form-group" >
                            
                            <label class="col-md-2 cntr-text">Contact No.</label>
                            <div class="col-md-4">
                                <input type="text" name="regular" class="form-control" id="txt_no" maxlength="12" minlength="10" onkeyup="leftTrim(this)" autocomplete="off"  onkeypress="return isNumberKey(event,this)" disabled/>
                            </div>
                        </div>
                            </div>
                        <br />
     <div class="form-group">
                            <div class="col-md-12">
                                <div class="widget box">                                  
                                    <div class="widget-header clonedInput">
                                        <h4><span class="glyphicon glyphicon-zoom-in"></span> Emergency Contact  Details<span class="required"> *</span></h4>
                                    </div>
                                    <div id="Div5" class="clonedInput">
                                             <div class="widget-content">
                        
                          <div class="ibox-content"  id="tbl_emg" hidden="hidden">
                            <div class="ibox-table">
                                <div class="table-responsive">
                                    <table class="responsive-table table-striped table-bordered table-hover align-center " id="tbl_em" style="width:1000px;">
                                <thead style="color: white; grid-row-align:center;background-color:#686b6b">
                                    <tr style="height:30px;font-size:x-small;" >
                                        <th data-class="expand">Name</th>
                                                <th >Relation</th>
                                        <th>Address</th>
                                                <th>Contact No.</th>
                                                <th>Email Id</th>                                                                                         
                                            </tr>
                                        </thead>
                                        <tbody>
                                            
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>

                             

                                  
                           
               </div></div></div></div></div>
         

        
                    </div>
                 <div id="view1" hidden="hidden">
                 
                                  
                        <div class="row ">
                            <div class="ma-header">
                                <div class="col-md-12">
                                    <h3 style="color: #091221"><i class="glyphicon glyphicon-user"></i> PERSONAL DETAILS</h3>
                                </div>
                            </div>
                        </div>
                         
                     

                   

                        <div class="form-group">
                            <div class="col-md-12">
                                <div class="widget box" style="background-color: #f0d6b9">
                                    <%--  <div class="row">--%>

                                    <div class="widget-header clonedInput">
                                        <h4><i class="glyphicon glyphicon-user"></i>Basic Informations<span class="required"> *</span></h4>
                                    </div>
                                   
                                        <div id="basic_info" class="clonedInput">
                                             <div class="widget-content">
                                                  <div class="form-group">

                             <label class="col-md-2 cntr-text">Application Id</label>
                              <div class="col-md-4">

                                <input type="text" class="form-control" id="txt_appID" name="name" maxlength="8" required="required" onblur="leftTrim(this)" autocomplete="off" disabled="disabled" />
                                 </div>  <asp:TextBox ID="txt_session" runat="server" hidden="hidden" ></asp:TextBox>
                             
                             <asp:TextBox ID="txtbr" runat="server" hidden="hidden" ></asp:TextBox>
                                                      <label class="col-md-2 cntr-text">Name</label>
                              <div class="col-md-4">
                                <input type="text" class="form-control" id="txt_appIDname" name="name" maxlength="8" required="required" onblur="leftTrim(this)" autocomplete="off" disabled="disabled" />
                                 </div>  
                                                      </div>
                              <div class="form-group">
                                                        
                              <label class="col-md-2 cntr-text">House Name</label>
                            <div class="col-md-4"> 
                                <input type="text" class="form-control" id="txt_hname" name="hname" maxlength="25" required="required" onblur="leftTrim(this)" autocomplete="off" disabled="disabled" onkeypress="return onlyAlphabets(event,this);" onkeyup="this.value=this.value.toUpperCase()" />
                            </div>
                                   <label class="col-md-2 cntr-text">State</label>
                            <div class="col-md-4"> 
                                <input type="text" class="form-control" id="txt_stat" name="statname" maxlength="25" required="required" onblur="leftTrim(this)" autocomplete="off" disabled="disabled"  onkeypress="return onlyAlphabets(event,this);" onkeyup="this.value=this.value.toUpperCase()" />
                            </div>
                                  
                        </div>
                                         <div class="form-group">
                                                                                   
                              <label class="col-md-2 cntr-text">District</label>
                              <div class="col-md-4">
                                <input type="text" class="form-control" id="txt_district" name="distname" maxlength="25" required="required" onblur="leftTrim(this)" autocomplete="off" disabled="disabled" onkeypress="return onlyAlphabets(event,this);" onkeyup="this.value=this.value.toUpperCase()" />
                                 </div> 

                                             <label class="col-md-2 cntr-text">Pincode</label>
                              <div class="col-md-4">
                                <input type="text" class="form-control" id="txt_pinper" name="dob"  required="required" onchange="postoffc()" onblur="leftTrim(this)" autocomplete="off" onkeypress="return isNumberKey(event,this)" maxlength="6" />
                                 </div> 
                                           
                             

                                            

                        </div>


                                                   <div class="form-group">
                                            <label class="col-md-2 cntr-text">Land Mark</label>
                                            <div class="col-md-4">
                                                <textarea class="form-control" rows="2" id="txtarea_landmark1" maxlength="50" onblur="leftTrim(this)"  onkeyup="this.value=this.value.toUpperCase()"></textarea>
                                            </div>
                                                           <label class="col-md-2 cntr-text">Mobile Number</label>
                            <div class="col-md-4"> 
                                <input type="text" class="form-control" id="txt_mobile" disabled="disabled" name="mobile" maxlength="10" required="required" onblur="leftTrim(this)" autocomplete="off" onkeypress="return isNumberKey(event,this)" />
                            </div> 

                                        </div>
                                                  <div class="form-group">
                                                                                   
                                  <label class="col-md-2 cntr-text">Post</label>
                              
                                    <div class="col-md-4">
                                        <select class="form-control" id="dd_postofc" name="blid">
                                                        <option value="0" selected="selected">--SELECT--</option>
                                                </select>
                                            
                                                </div>
                                            <label class="col-md-2 cntr-text">Local Body</label>
                                            <div class="col-md-4">
                                              
                                                <select class="form-control" id="ddl_local1" name="Dt">
                                                   <option value="0">----SELECT----</option>
                                        <option value="1">Village / Panchayat</option>
                                        <option value="2">Municipal Council</option>
                                        <option value="3">Corporation</option>
                                         <option value="4">Metro</option>
                                                </select>
                                            </div>

                                    
 </div>
                                        <div class="form-group">
                                              
                                                        <label class="col-md-2 cntr-text">DOB</label>
                              <div class="col-md-4">
                                <input type="text" class="form-control" id="txt_dob" name="dob" maxlength="15" required="required" onblur="leftTrim(this)" autocomplete="off" disabled="disabled"  onkeypress="return onlyAlphabets(event,this);" onkeyup="this.value=this.value.toUpperCase()" />
                                 </div> 
    <label class="col-md-2 cntr-text">Gender</label>
                            <div class="col-md-4"> 
                                <input type="text" class="form-control" id="txt_gender" name="gender" maxlength="10" required="required" onblur="leftTrim(this)" autocomplete="off" disabled="disabled" onkeypress="return onlyAlphabets(event,this);" onkeyup="this.value=this.value.toUpperCase()" />
                            </div>
                        </div>



                                         <div class="form-group" hidden="hidden">
                                                                            
                          
  <label class="col-md-2 cntr-text">Age</label>
                              <div class="col-md-4">
                                <input type="text" class="form-control" id="txt_age" name="age" maxlength="2" required="required" onblur="leftTrim(this)" autocomplete="off" disabled="disabled"  onkeypress="return onlyAlphabets(event,this);" onkeyup="this.value=this.value.toUpperCase()" />
                                 </div>  
                                                                                                      
                          
                        </div>
                                        
                                  <div class="form-group">
                                                                                 
                              <label class="col-md-2 cntr-text">Alternate Number</label>
                            <div class="col-md-4"> 
                                <input type="text" class="form-control" id="txt_mobalter"  name="mobile" maxlength="10" required="required" onblur="leftTrim(this)" autocomplete="off" onkeypress="return isNumberKey(event,this)" />
                            </div>
 <label class="col-md-2 cntr-text">Email ID:</label>
                              <div class="col-md-4">
                                <input type="text" class="form-control" id="txt_email" disabled="disabled"  name="email"  maxlength="25" required="required" onblur="leftTrim(this)" autocomplete="off" onkeyup="this.value=this.value.toUpperCase()" />
                                 </div>
                        </div>

                         <%--         <div class="form-group">
                                        <label class="col-md-2 cntr-text">Post</label>
                                            <div class="col-md-4">
                                                <select class="select2-select-00  full-width-fix" id="dd_postfill" name="Dt" style="width:285px;">
                                                        <option value="-1" selected="selected">--SELECT--</option>
                                                </select>
                                            </div>
                           
                                       <label class="col-md-2 cntr-text">Pincode</label>
                                      <div class="col-md-4">
                                                                          <input type="text" class="form-control" id="txt_pincode" name="email"  maxlength="25" required="required" onblur="leftTrim(this)" autocomplete="off" onkeyup="this.value=this.value.toUpperCase()" />

                                      </div>
                             
                        </div>--%>
                                                      <div class="form-group">

                            <label class="col-md-2 cntr-text">Caste</label>
                            
                          
                            <div class="col-md-1">
                     <input type="checkbox" class="check" value="1" name="chk_cst1" id="ch1" onclick="chk()" />
                                            SC</div>
                         <div class="col-md-1">
                         <input type="checkbox" class="check" value="2" name="chk_cst2" id="ch2" onclick="chk()"/>
                                            ST</div>
                         <div class="col-md-1">
                        <input type="checkbox" class="check" value="3" name="chk_cst3" id="ch3" onclick="chk()"/>
                                            OBC</div>
                         <div class="col-md-1">
                        <input type="checkbox" class="check" value="4" name="chk_cst4" id="ch4" onclick="chk()"/>
                                            Others</div>
                             <div class="col-md-2">
                     <input type="checkbox" class="check" checked="checked" value="5" name="chk_cst5" id="ch5" onclick="chk()" />
                                            General</div>
                        </div>
                                                   <div class="form-group">

                             <label class="col-md-2 cntr-text">Father's Name</label>
                              <div class="col-md-4">
                                <input type="text" class="form-control" id="txt_fathname" name="name" maxlength="25" required="required" onblur="leftTrim(this)" autocomplete="off"  onkeypress="return onlyAlphabets(event,this);" onkeyup="this.value=this.value.toUpperCase()" />
                                 </div>                                                         
                              <label class="col-md-2 cntr-text">Mother's Name</label>
                            <div class="col-md-4"> 
                                <input type="text" class="form-control" id="txt_mothname" name="hname" maxlength="25" required="required" onblur="leftTrim(this)" autocomplete="off"  onkeypress="return onlyAlphabets(event,this);" onkeyup="this.value=this.value.toUpperCase()" />
                            </div>
                        </div>
                                                   <div class="form-group">

                             <label class="col-md-2 cntr-text">Father's Contact No</label>
                              <div class="col-md-4">
                                <input type="text" name="regular" class="form-control" id="txt_fcnt" autocomplete="off" onkeyup="leftTrim(this)" maxlength="10" onkeypress="return isNumberKey(event,this)" minlength="10"/>
                                 </div>       </div>
                                                  <div class="form-group">

                            <label class="col-md-2 cntr-text">Religion</label>
                            <div class="col-md-4">
                               <%-- <select class="select2-select-00 form-select"  data-placeholder="Select Employee" id="rel1">--%>
                                 <select class="form-control"  data-placeholder="Religion" id="cmb_relg" name="relegion"  >
                                     <option value="0" selected="selected">--SELECT--</option>
                                 </select>
                            </div>
                         <label class="col-md-2 cntr-text">Blood Group</label>
                                            <div class="col-md-4">
                                                <select class="form-control" id="cmb_bldg" name="blood_grp">
                                                        <option value="0" selected="selected">--SELECT--</option>
                                                </select>
                                            </div>
                        </div>
                                                <div class="form-group">
                          <label class="col-md-2 cntr-text">Marital Status</label>
                            <div class="col-md-5">
                                <label class="radio-inline cntr-text">
                                     <input type="radio" name="radio_marital" class="required uniform" id="rdo_married" onclick="rdo_marital()"/>
                                  Married</label>
                                   
                                   <label class="radio-inline cntr-text">
                                    <input type="radio" name="radio_marital" class="required uniform" id="rdo_single" onclick="rdo_marital()"/>
                                    Single</label>
                                 <label class="radio-inline cntr-text">
                                    <input type="radio" name="radio_marital" class="required uniform" id="rdo_divorce" onclick="rdo_marital()"/>
                                    Divorce</label>
<%--                                <label for="radio_marital" class="has-error help-block" generated="true" style="display: none;"></label>--%>
                            </div>
                    </div>
                                                        <div id="hidediv" hidden="hidden">
                        <div class="form-group">
                            <label class="col-md-2 cntr-text">Spouse</label>
                            <div class="col-md-4">
                                <input type="text" name="regular" class="form-control" id="txt_spousename" maxlength="30" onblur="leftTrim(this)" autocomplete="off" onkeypress="return onlyAlphabets(event,this);" onkeyup="this.value=this.value.toUpperCase()"/>
                            </div>

                            <label class="col-md-2 cntr-text">No Of Children</label>
                            <div class="col-md-4">
                                <input type="text" name="regular" class="form-control" id="txt_noofchild" maxlength="2" onkeyup="leftTrim(this)" autocomplete="off"  onkeypress="return isNumberKey(event,this)"/>
                            </div>
                        </div>
                          <div class="form-group" >
                            
                            <label class="col-md-2 cntr-text">Contact No.</label>
                            <div class="col-md-4">
                                <input type="text" name="regular" class="form-control" id="txt_spouseno" autocomplete="off" onkeyup="leftTrim(this)" maxlength="10" onkeypress="return isNumberKey(event,this)" minlength="10"/>
                            </div>
                        </div>
                            </div>
                                                 <div class="form-group">
                            <label class="col-md-2 cntr-text">Differently abled </label>
                             <div class="col-md-3">
                                <label class="radio-inline cntr-text">
                                    <input name="radio_handi" value="" type="radio"class="required uniform" id="rdo_hyes" onclick="rdo_handicapped()" />
                                   Yes
                                </label>
                              
                                <label class="radio-inline  cntr-text">
                                    <input name="radio_handi" value="" type="radio" class="required uniform" id="rdo_hno" onclick="rdo_handicapped()" />
                                    No
                                </label>   </div>
                                    <div id="hidehandi" hidden="hidden">
                                  <label class="col-md-2 cntr-text">Remark</label>
                            <div class="col-md-4">
                                <input type="text" name="regular" class="form-control" id="txt_rmkhandi" maxlength="50" onkeyup="leftTrim(this)" autocomplete="off" onkeypress=" return IsAlphaNumeric(event);"/>
                            </div>
                                        </div>
                        </div>

                                                        <div class="form-group">
                       
                            <label class="col-md-2 cntr-text">Are you looking for further Studies?</label>
                             <div class="col-md-3">
                                <label class="radio-inline cntr-text">
                                    <input name="radio_st" value="" type="radio"class="required uniform" id="rd_st1" onclick="rdo_study()" />
                                   Yes
                                </label>
                              
                                <label class="radio-inline  cntr-text">
                                    <input name="radio_st" value="" type="radio" class="required uniform" id="rd_st2" onclick="rdo_study()" />
                                    No
                                </label>   </div>
                            <label class="col-md-2 cntr-text">Are you willing to work any where in India?</label>
                           <div class="col-md-3">
                                <label class="radio-inline cntr-text">
                                    <input name="radio_work" value="" type="radio"class="required uniform" id="rd_wrk1" onclick="rdo_work()" />
                                   Yes
                                </label>
                              
                                <label class="radio-inline  cntr-text">
                                    <input name="radio_work" value="" type="radio" class="required uniform" id="rd_wrk2" onclick="rdo_work()" />
                                    No
                                </label>   </div>
                            
                        </div>
              
</div> 
                                    </div>
                                </div>
                                   
                            </div>
                            
                        </div>
                                  

                      <div class="form-group">
                            <div class="col-md-12">
                                <div class="widget box" style="background-color: #f0d6b9">
                                 
                                    <div class="widget-header clonedInput">
                                        <h4><i class="glyphicon glyphicon-phone-alt"></i> Present Address<span class="required"> *</span></h4>
                                        &nbsp&nbsp&nbsp <input type="checkbox" value="" name="foo" id="chk_ad1"  onclick="chkchange();" />
                                      
                                           Permanant Address same as Present Address
                                    </div>
                                   
                                        <div id="present_address" class="clonedInput">
                                             <div class="widget-content">

                                                 <div id="Div2" class="clonedInput">
                                             <div class="widget-content">
                              <div class="form-group">

                                                                                      
                              <label class="col-md-1 cntr-text">House Name</label>
                            <div class="col-md-4"> 
                                <input type="text" class="form-control" id="txt_housename2" name="hname" maxlength="25" required="required" onblur="leftTrim(this)" autocomplete="off"  onkeypress="return onlyAlphabets(event,this);" onkeyup="this.value=this.value.toUpperCase()" />
                            </div>
                       
     <label class="col-md-2 cntr-text">Pincode</label>
                                            <div class="col-md-4">
                                                <input type="text" name="regular" class="form-control" id="txt_pin" onchange="post_select()"/>
                                            </div> </div>
                                                  <div class="form-group">
                                            <label class="col-md-1 cntr-text">Post</label>
                                            <div class="col-md-4">
                                                <select class="select2-select-00  full-width-fix" id="ddl_post" name="Dt" style="width:285px;" onchange="addr()">
                                                        <option value="-1" selected="selected">--SELECT--</option>
                                                </select>
                                            </div>                                           
                                        
                             <label class="col-md-2 cntr-text">State</label>
                              <div class="col-md-4">       
                        <input type="text" class="form-control" id="txt_state" name="hname" maxlength="25" required="required" onblur="leftTrim(this)" autocomplete="off"  onkeypress="return onlyAlphabets(event,this);" onkeyup="this.value=this.value.toUpperCase()" />

                              </div>   
                                                      </div>
                                         <div class="form-group">                                                      
                              <label class="col-md-1 cntr-text">District</label>
                            <div class="col-md-4">    
                                    <input type="text" class="form-control" id="txt_dist" name="hname" maxlength="25" required="required" onblur="leftTrim(this)" autocomplete="off"  onkeypress="return onlyAlphabets(event,this);" onkeyup="this.value=this.value.toUpperCase()" />

                            </div>
                        

                                            <label class="col-md-2 cntr-text">Local Body</label>
                                            <div class="col-md-4">
                                              
                                                <select class="form-control" id="ddl_local2" name="Dt">
                                                   <option value="0">----SELECT----</option>
                                        <option value="1">Village / Panchayat</option>
                                        <option value="2">Municipal Council</option>
                                        <option value="3">Corporation</option>
                                         <option value="4">Metro</option>
                                                </select>
                                            </div>

                                        </div>
                                                    

                                        <div class="form-group">
                                            <label class="col-md-1 cntr-text">Land Mark</label>
                                            <div class="col-md-4">
                                                <textarea class="form-control" rows="2" id="txtarea_landmark2" maxlength="50" onblur="leftTrim(this)"  onkeyup="this.value=this.value.toUpperCase()"></textarea>
                                            </div>

                                        </div>
                                     
</div> 
                                    </div>


                    </div>
 </div>
 </div>
 </div>
 </div>


            <%--          <div class="form-group">
                            <div class="col-md-12">
                                <div class="widget box" style="background-color: #f0d6b9">
                                 
                                    <div class="widget-header clonedInput">
                                        <h4><i class="glyphicon glyphicon-phone-alt"></i> Present Address<span class="required"> *</span></h4>
                                        &nbsp&nbsp&nbsp <input type="checkbox" value="" name="foo" id="chk_ad1"  onclick="chkchange();" />
                                      
                                           Permanant Address same as Present Address
                                    </div>
                                   
                                        <div id="present_address" class="clonedInput">
                                             <div class="widget-content">
                              <div class="form-group">

                             <label class="col-md-1 cntr-text">Name</label>
                              <div class="col-md-4">
                                <input type="text" class="form-control" id="txt_name" name="name" maxlength="25" required="required" onblur="leftTrim(this)" autocomplete="off"  onkeypress="return onlyAlphabets(event,this);" onkeyup="this.value=this.value.toUpperCase()" />
                                 </div>                                                         
                              <label class="col-md-2 cntr-text">House Name</label>
                            <div class="col-md-4"> 
                                <input type="text" class="form-control" id="txt_housename2" name="hname" maxlength="25" required="required" onblur="leftTrim(this)" autocomplete="off"  onkeypress="return onlyAlphabets(event,this);" onkeyup="this.value=this.value.toUpperCase()" />
                            </div>
                        </div>
                                         <div class="form-group">
                             <label class="col-md-1 cntr-text">State</label>
                              <div class="col-md-4">
<select class="form-control" id="dd_st2" name="Dt" style="width:285px;">
                                  <option value="-1" selected="selected">--SELECT--</option>
                       
                                                </select>                                 </div>                                                         
                              <label class="col-md-2 cntr-text">District</label>
                            <div class="col-md-4"> 
 <select class="select2-select-00  full-width-fix" id="dd_dist2" name="st" style="width:285px;">
                                                        <option value="-1" selected="selected">--SELECT--</option>
                                                </select>                            </div>
                        </div>
<div class="form-group">

                                            <label class="col-md-2 cntr-text">Local Body</label>
                                            <div class="col-md-4">
                                              
                                                <select class="form-control" id="ddl_local2" name="Dt">
                                                   <option value="0">----SELECT----</option>
                                        <option value="1">Village / Panchayat</option>
                                        <option value="2">Municipal Council</option>
                                        <option value="3">Corporation</option>
                                         <option value="4">Metro</option>
                                                </select>
                                            </div>

                                        </div>
                                                      <div class="form-group">

                                            <label class="col-md-1 cntr-text">Post</label>
                                            <div class="col-md-4">
                                                <select class="select2-select-00  full-width-fix" id="dd_post2" name="Dt" style="width:285px;">
                                                        <option value="-1" selected="selected">--SELECT--</option>
                                                </select>
                                            </div>

                                      

                                            <label class="col-md-2 cntr-text">Pincode</label>
                                            <div class="col-md-4">
                                                <input type="text" name="regular" class="form-control" id="txt_pin2"/>
                                            </div>

                                        </div>

                                        <div class="form-group">
                                            <label class="col-md-1 cntr-text">Land Mark</label>
                                            <div class="col-md-4">
                                                <textarea class="form-control" rows="2" id="txtarea_landmark2" maxlength="50" onblur="leftTrim(this)"  onkeyup="this.value=this.value.toUpperCase()"></textarea>
                                            </div>

                                        </div>
                                     
</div> 
                                    </div>
                                </div>
                                   
                            </div>
                            
                        </div>
    --%>
              <div class="form-group">
                            <div class="col-md-12">
                                <div class="widget box" style="background-color: #f0d6b9">
                                    <%--  <div class="row">--%>

                                    <div class="widget-header clonedInput">
                                        <h4><i class="glyphicon glyphicon-phone-alt"></i> Emergency Contact Details<span class="required"> *</span></h4>
                                    </div>
                                   
                                        <div id="emer_cntct_detail" class="clonedInput">
                                             <div class="widget-content">
                              <div class="form-group">
                                <label class="col-md-2 cntr-text">Name</label>
                                <div class="col-md-4">
                                    <input type="text" name="regular" class="form-control" id="txt_emer_name" onblur="leftTrim(this)" maxlength="15" autocomplete="off"  onkeypress="return onlyAlphabets(event,this);" onkeyup="this.value=this.value.toUpperCase()"/>
                                </div>
                            
                                <label class="col-md-2 cntr-text">Relation</label>
                                <div class="col-md-3">
                                                                       <input type="text" name="regular" class="form-control" id="txt_emer_relation" onblur="leftTrim(this)" maxlength="10" autocomplete="off"  onkeypress="return onlyAlphabets(event,this);" onkeyup="this.value=this.value.toUpperCase()"/>

<%--                                    <input type="text" name="regular" class="form-control" id="txt_unvsty"  required onkeypress=" return IsAlphaNumeric(event);" onkeyup="this.value=this.value.toUpperCase()"/>--%>
                                </div>
                                </div>

                            <div class="form-group">
                                <label class="col-md-2 cntr-text">Email Id</label>
                                <div class="col-md-4">
                                    <input type="text" name="regular" class="form-control" onblur="leftTrim(this)"  maxlength="50"  id="txt_emer_email" ;"/>
                                </div>
                          
                                <label class="col-md-2 cntr-text">Contact No.</label>
                                <div class="col-md-3">
                                    <input type="text" name="regular" class="form-control" id="txt_cntctnumb" maxlength="10" autocomplete="off" onkeypress="return isNumberKey(event,this)"  required="required" />
                                </div>
                                </div>
                                   
                                          <div class="form-group">
                                        <label class="col-md-2 cntr-text">Address </label>
                                        <div class="col-md-4">
                                                <textarea class="form-control" rows="2" id="txtarea_address_emer" maxlength="50" onblur="leftTrim(this)"  onkeyup="this.value=this.value.toUpperCase()"></textarea>
                                        </div>
                                    </div>
                                        
</div> 
                                    </div>
                                </div>
                                   
                            </div>
                            
                        </div>
             
                    
                     
                        
              
                            <div class=" form-group align-center">

                                <input id="btn_saves" type="button" value="Continue" class="btn btn-info " onclick="save_cand()" style="border-radius:25px;width:180px" />
                                <input id="btn_next" type="button" value="Next"  class="btn btn-info" onclick="next()" style="border-radius:25px;width:180px" />


                        </div>
                        <br />
                   
                   
</div>
           </div>
                
           </form>
        </div>
    </div>
</asp:Content>

