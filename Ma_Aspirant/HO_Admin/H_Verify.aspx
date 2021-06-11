<%@ Page Title="" Language="C#" MasterPageFile="~/HO_Admin.Master" AutoEventWireup="true" CodeBehind="H_Verify.aspx.cs" Inherits="Ma_Aspirant.Recruitment.H_Verify" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <script type="text/javascript">
        
         function bhschedul_tab() {
             window.open("../HO_Admi/H_notific.aspx", "_self");
         }
         function verify_tab() {
             window.open("../HO_Admin/H_Verify.aspx", "_self");
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
             window.location.href = "../logout_Admin.aspx";
        }
  
        
        $(window).load(function () {
            emp_download();

        });



        function emp_download() {
            var empid = $("[id*=txt_br]").val();
            // $("#ddl_sel_candidate").empty();
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "H_Verify.aspx/cand_codedtl",
                data: "{input:'" + empid + "'}",
                dataType: "json",
                success: function (Result) {
                    Result = Result.d;
                    
                    $.each(Result, function (key, value) {
                        $("#cmb_appId_doc").append($("<option></option>").val
                            (value.cand_id).html(value.cand_name));
                    });
                    $("#cmb_appId_doc").change(function () {
                        var sid = $("#cmb_appId_doc").val();
                        $("#tbl_doc tbody").empty();
                        $("#tbldoc").show();


                        $.ajax({
                            
                            type: "POST",
                            contentType: "application/json; charset=utf-8",
                            url: "H_Verify.aspx/cand_detail",
                            data: "{cid:'" + sid + "'}",
                            dataType: "json",
                            success: function (Result) {
                       
                               // alert(Result);
                                var res = Result.d.split("~");
                                //$("#txt_name").val(res[0]);
                                //$("#txt_hname").val(res[1]);
                                //$("#txt_dist").val(res[2]);
                                //$("#txt_stat").val(res[3]);
                                //$("#txt_age").val(res[4]);
                                //$("#txt_number").val(res[5]);
                                //$("#txt_brname").val(res[11]);
                                $("#txt_name").val(res[9]);
                                $("#txt_hname").val(res[1]);
                                $("#txt_dist").val(res[2]);
                                $("#txt_stat").val(res[3]);
                                $("#txt_age").val(res[6]);
                                $("#txt_number").val(res[7]);
                                $("#txt_brname").val(res[11]);
                                $("#txt_mail").val(res[9]);
                                $("#txt_dob").val(res[4]);
                                $("#txt_gen").val(res[5]);

                                $("#txt_indt").val(res[12]);
                                $("#txt_intm").val(res[13]);
                                $("#txt_post").val(res[14]);
                               
                                //alert(sid);
                                emp_dtl(sid);
                                empq_dtl(sid);
                                empfamily_dtl_edit(sid);
                                sibling(sid);
                                empref_dtl(sid);
                                emp_experience(sid);
                            },
                            error: function (Result) {
                            }
                        });
                        // alert(emp);
                        $.ajax({
                            type: "POST",
                            contentType: "application/json; charset=utf-8",
                            url: "H_Verify.aspx/get_doc_dtl",
                            data: "{ input: '" + sid + "' }",
                            dataType: "json",
                            success: function (Result) {
                                for (var i = 0; i < Result.d.length; i++) {
                                    $("#tbl_doc tbody").append("<tr> <td>" + Result.d[i].parent + "</td>" +
                                           //  "<td>" + Result.d[i].child + "</td>" + "<td>" + Result.d[i].des + "</td>" + " <td hidden='hidden'>" + Result.d[i].did + "</td>" + " <td hidden='hidden'>" + Result.d[i].cid + "</td><td hidden='hidden'>" + Result.d[i].seqid + "</td>" + "<td><input type='button' id=" + Result.d[i].seqid + " onclick='dwnld(this)' value='Download'  /></td></tr>");
                                         "<td>" + Result.d[i].child + "</td>" + "<td>" + Result.d[i].des + "</td>" + " <td hidden='hidden'>" + Result.d[i].did + "</td>" + " <td hidden='hidden'>" + Result.d[i].cid + "</td><td hidden='hidden'>" + Result.d[i].seqid + "</td>" + "<td><input type='button' id=" + Result.d[i].seqid + " onclick='dwnld(this)' value='Download'  /></td>"+"<td><select class='input-small' id='select_" + i + "' onChange='update(this)'><option value='0' >--SELECT--</option><option value='1'>OK</option><option value='2'>Incorrect/incomplete Document</option></select></td></tr>");

                                }
                            },
                            error: function (Result) {
                            }
                        });


                    });
                }
            });
        }

        function empq_dtl(sid) {
          //  var emp = $("#ddl_q_emp").val();
            $("#tbl_qual tbody").empty();
            $("#tbl_q").show();
            // alert(emp);
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "H_Verify.aspx/get_qual_dtl",
                data: "{ input: '" + sid + "' }",
                dataType: "json",
                success: function (Result) {
                    // alert(Result.d);
                    // var res = Result.d.split("~");                  
                    //      category qualification university institution  YEAR_PASS  percentage grade  NO_OF_ATTEMPT
                    for (var i = 0; i < Result.d.length; i++) {
                        $("#tbl_qual tbody").append('<tr> <td>' + Result.d[i].category + '</td>' +
                                  '<td>' + Result.d[i].qualification + '</td>' +
                                  '<td>' + Result.d[i].university + '</td>' +
                                  '<td>' + Result.d[i].institution + '</td>' +
                                  '<td>' + Result.d[i].YEAR_PASS + '</td>' +
                                  '<td>' + Result.d[i].percentage + '</td>' +
                                  '<td>' + Result.d[i].grade + '</td>' +
                                  '<td>' + Result.d[i].NO_OF_ATTEMPT + '<td>' + Result.d[i].typ_reg + '</td>' + '<td>' + Result.d[i].high + '</td></tr>');
                    }
                },
                error: function (Result) {
                }
            });
        }

         //-----------------------------------------
        function emp_dtl(sid) {

            var emp = $("#cmb_appId_doc").val();
            $('#txt_dob').prop("disabled", true);
            $('#txt_primaryno').prop("disabled", true);
            $('#txt_emailid').prop("disabled", true);
            $("#ch1").prop('checked', false);
            $("#ch2").prop('checked', false);
            $("#ch3").prop('checked', false);
            $("#ch4").prop('checked', false);
            $("#ch5").prop('checked', false);


            $("#rdo_female").prop('checked', false);
            $("#rdo_male").prop('checked', false);
            $("#rdo_hyes").prop('checked', false);
            $("#rdo_hno").prop('checked', false);
            $("#rdo_married").prop('checked', false);
            $("#rdo_single").prop('checked', false);
            $("#rdo_divorce").prop('checked', false);

            $("#txt_1stname").prop("disabled", true);


            $("#txt_rel").prop("disabled", true);
            $("#rdo_female").prop("disabled", true);

            $("#rdo_male").prop("disabled", true);

            $("#rdo_other").prop("disabled", true);
            $("#ch1").prop("disabled", true);
            $("#ch2").prop("disabled", true);
            $("#ch3").prop("disabled", true);
            $("#ch4").prop("disabled", true);
            $("#ch5").prop("disabled", true);        

            $("#rdo_hyes").prop("disabled", true);
            $("#rdo_hno").prop("disabled", true);
            $("#rdo_married").prop("disabled", true);
            $("#rdo_single").prop("disabled", true);
            $("#rdo_divorce").prop("disabled", true);
            $("#txt_panno").prop("disabled", true);
            
            //address permenent/present
            $("#txt_housename1").prop("disabled", true);
            $("#txt_district2").prop("disabled", true);
            $("#txt_district1").prop("disabled", true);
            $("#txt_post2").prop("disabled", true);
            // alert(e_post1);

            $("#txtarea_landmark1").prop("disabled", true);
            //     var e_chkaddr = $("#chk_ad1").val();
            $("#txt_housename2").prop("disabled", true);
            $("#txt_state2").prop("disabled", true);
            $("#txt_state1").prop("disabled", true);

            $("#txt_post1").prop("disabled", true);
            //    alert(e_post2 + "post2");


            $("#txtarea_landmark2").prop("disabled", true);
            $("#txt_primaryno").prop("disabled", true);
            $("#txt_altrnateno").prop("disabled", true);
            //  var e_rsn = $("#rdo_single").val();
            $("#txt_fathername").prop("disabled", true);
            $("#txt_fathercntno").prop("disabled", true);

            $("#txt_spousename").prop("disabled", true);
            $("#txt_noofchild").prop("disabled", true);
            $("#txt_spouseno").prop("disabled", true);
            $("#txt_blood").prop("disabled", true);
            //emergency dtl
            $("#txt_emergname").prop("disabled", true);
            $("#txt_emerg_relation").prop("disabled", true);
            $("#txt_emergaddr").prop("disabled", true);
            $("#txt_emerg_cnctno").prop("disabled", true);
            $("#txt_emerg_email").prop("disabled", true);
            //bank dtl     
            //////////////////
            $('#txt_dob').val('');
            $('#txt_primaryno').val('');
            $('#txt_emailid').val('');
            $("#txt_1stname").val('');
                     $("#txt_rel").val('');
            $("#txt_panno").val('');
            $("#txt_rmkhandi").val('');
            //address permenent/present
            $("#txt_housename1").val('');
            $("#txtarea_landmark1").val('');
            $("#txt_housename2").val('');

            $("#txtarea_landmark2").val('');
            $("#txt_primaryno").val('');
            $("#txt_altrnateno").val('');
            $("#txt_emailid").val('');
            // var e_rmr = $("#rdo_married").val();
            //  var e_rsn = $("#rdo_single").val();
            $("#txt_fathername").val('');
            $("#txt_fathercntno").val('');

            $("#txt_spousename").val('');
            $("#txt_noofchild").val('');
            $("#txt_spouseno").val('');
            $("#txt_blood").val('');
            //emergency dtl
            $("#txt_emergname").val('');
            $("#txt_emerg_relation").val('');
            $("#txt_emergaddr").val('');
            $("#txt_emerg_cnctno").val('');
            $("#txt_emerg_email").val('');
            var empid = $("[id*=txt_session]").val();

            var ee = empid + '~' + emp;

            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "H_Verify.aspx/get_emp_dtl",
                data: "{ input: '" + ee + "' }",
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
                    $("#txt_dob").val(dob[0]);
                    $("#txt_rel").val(res[3]);

                    var cst = res[4];
                    if (cst == 1)
                    {
                        $("#txt_caste").val('SC');
                       // $("#ch1").prop('checked', true);
                    }
                    else if (cst == 2)
                    {
                        $("#txt_caste").val('ST');
                       // $("#ch2").prop('checked', true);
                    }
                    else if (cst == 3)
                    {
                        $("#txt_caste").val('OBC');
                       // $("#ch3").prop('checked', true);
                    }
                    else if (cst == 4)
                    {
                        $("#txt_caste").val('Others');
                        //$("#ch4").prop('checked', true);
                    }
                    else if (cst == 5)
                    {
                        $("#txt_caste").val('General');
                       // $("#ch5").prop('checked', true);
                    }
                    //0c.cand_code,1c.cand_name,2to_char(t.dob, 'dd/mon/yyyy'),3c.religion_id,4c.caste,5c.sslc_no,6c.physically_challenged,7c.physcical_remarks,

                  //  $('#txt_sslcno').val(res[5]);
                    // $('#txt_panno').val(res[7]);
                    // $('#txt_uanno').val(res[8]);
                    var phy = res[6];
                    if (phy == 1) {
                        $("#hidehandi").show();
                        $("#rdo_hyes").prop('checked', true);
                        $("#txt_rmkhandi").val(res[7]);
                    }
                    else if (phy == 0) {
                        $("#hidehandi").hide();
                        $("#rdo_hno").prop('checked', true);
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
                    $("#txtarea_landmark1").val(res[10]);
                    $("#txt_housename2").val(res[11]);
                      $("#txt_pin2").val(res[41]);
                    $("#txtarea_landmark2").val(res[13]);
                    $("#txt_fathername").val(res[14]);
                    $("#txt_fathercntno").val(res[15]);
                    $("#txt_primaryno").val(res[16]);
                    $("#txt_altrnateno").val(res[17]);
                    var gen = res[18];
                    if (gen == 0)
                    {
                        $("#txt_gen").val('Female');
                       // $("#rdo_female").prop('checked', true);
                    }
                    else if (gen == 1)
                    {
                        $("#txt_gen").val('Male');
                       // $("#rdo_male").prop('checked', true);
                    }
                    else if (gen == 2)
                    {
                        $("#txt_gen").val('Other');
                       // $("#rdo_other").prop('checked', true);
                    }
                    // $("#txt_emailid").val(res[22]);

                    //-------  new change  21-dec-2019
                    $("#ddl_local1").val(res[48]);
                    $("#ddl_local2").val(res[49]);
                    var fst = res[50];
                    var wrk = res[51];



                    if (fst == 1) {

                        $("#rd_st1").prop('checked', true);
                    }
                    else if (fst == 2)
                    { $("#rd_st2").prop('checked', true); }
                    if (wrk == 1)
                    { $("#rd_wrk1").prop('checked', true); }
                    else if (wrk == 2)
                    { $("#rd_wrk2").prop('checked', true); }

                    //-------------------------       
                    var m = res[19];
                    if (m == 1) {
                        $("#rdo_single").prop('checked', true);
                        $("#hidediv").hide();
                    }
                    else if (m == 2) {
                        $("#hidediv").show();
                        $("#rdo_married").prop('checked', true);
                        $("#txt_spousename").val(res[20]);
                        $("#txt_noofchild").val(res[21]);
                        $("#txt_spouseno").val(res[22]);
                    }
                    else if (m == 3) {
                        $("#rdo_divorce").prop('checked', true);
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








        function empfamily_dtl_edit(sid) {
           
            var emp = $("#cmb_appId_doc").val();
            var c = $("[id*=txt_session]").val();

            $("#txt_fam").val(0);
            $("#txt_res").val(0);
            $("#txt_value").val('');
           

            $("#tbl_family tbody").empty();
            $("#familydtl").show();
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "H_Verify.aspx/get_family_dtl2",
                data: "{ input: '" + emp + "' }",
                dataType: "json",
                success: function (Result) {

                    var res = Result.d;
                    //  alert(4235);
                    //355130~1~1~1000000~GEORGE~11~6~3~SHANTHA~11~6~2~COOLI~HOUSE WIFE
                    //355131~1~1~100000~JOSHPAR SALEEM G~11~6~1~SHANTHA BAI R~11~7~0~COOLI~
                    //0-t.emp_code,1-t.family_type,2-t.residence,3-t.value,4-t.father_name,5-t.father_quali,6-t.father_occupation,
                    //7-t.father_sal_range,8-t.mother_name,9-t.mother_quali,10-t.mother_occupation,11-t.mother_sal_range,12-father_occu_any,13t.mother_occu_any
                    var res = Result.d.split("~");
                    $("#txt_fam").val(res[1]);
                    $("#txt_res").val(res[2]);
                    $("#txt_value").val(res[3]);
                    var fa = 'Father';
                    var mo = 'Mother';
                    $("#tbl_family tbody").append('<tr> <td>' + fa + '</td>' +
                         '<td>' + res[4] + '</td>' +
                        '<td>' + res[5] + '</td>' +
                        '<td>' + res[6] + '</td>' +
                        '<td>' + res[12] + '</td>' +
                        '<td>' + res[7] + '</td></tr><tr> <td>' + mo + '</td>' +
                          '<td>' + res[8] + '</td>' +
                        '<td>' + res[9] + '</td>' +
                        '<td>' + res[10] + '</td>' +
                        '<td>' + res[13] + '</td>' +
                        '<td>' + res[11] + '</td></tr>');
                 
        
                },
                error: function (Result) {
                }
            });

            //-------------------------------
         



        }


        function sibling(sid) {
            var emp = $("#cmb_appId_doc").val();
            $("#tbl_sibling tbody").empty();
            $("#tbl_sib").show();
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "H_Verify.aspx/get_sib_dtl",
                data: "{ input: '" + emp + "' }",
                // data:{},
                dataType: "json",
                success: function (Result) {
                    for (var i = 0; i < Result.d.length; i++) {
                        $("#tbl_sibling tbody").append('<tr> <td>' + Result.d[i].sib_name + '</td>' +
                         '<td>' + Result.d[i].qualification + '</td>' +
                         '<td>' + Result.d[i].occup + '</td>' +
                         '<td>' + Result.d[i].occup_any + '</td>' +
                         '<td>' + Result.d[i].sal + '</td>' +
                         '<td>' + Result.d[i].gen + '</td></tr>');
                    }
                }
            });

        }



        function empref_dtl(sid) {
            //  var emp = $("#ddl_q_emp").val();
            $("#tbl_ref tbody").empty();
            $("#div_ref").show();
            // alert(emp);
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "H_Verify.aspx/get_ref_dtl",
                data: "{ input: '" + sid + "' }",
                dataType: "json",
                success: function (Result) {
                    // alert(Result.d);
                    // var res = Result.d.split("~");                  
                    //      category qualification university institution  YEAR_PASS  percentage grade  NO_OF_ATTEMPT
                    for (var i = 0; i < Result.d.length; i++) {

                        //ep.name,ep.position,ep.mob_no,ep.mail,pm.pin_code,pm.post_office,dm.district_name,s.state_name

                        $("#tbl_ref tbody").append('<tr> <td>' + Result.d[i].name + '</td>' +
                                  '<td>' + Result.d[i].post + '</td>' +
                                  '<td>' + Result.d[i].mob + '</td>' +
                                  '<td>' + Result.d[i].mail + '</td>' +
                                  '<td>' + Result.d[i].addr +  '</td></tr>');
                    }
                },
                error: function (Result) {
                }
            });
        }

        function emp_experience(sid) {
            //  var emp = $("#ddl_q_emp").val();
            $("#tbl_experince tbody").empty();
            $("#tbl_experince").show();
            $("#experienec").show();
            //alert(sid+"Experience");
            debugger;
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "H_Verify.aspx/get_Experience",
                data: "{ sid : '" + sid + "' }",
                dataType: "json",
                success: function (Result) {
                   // alert(Result.d);
                    // var res = Result.d.split("~");                  
                    //      category qualification university institution  YEAR_PASS  percentage grade  NO_OF_ATTEMPT
                    for (var i = 0; i < Result.d.length; i++) {

                        //ep.name,ep.position,ep.mob_no,ep.mail,pm.pin_code,pm.post_office,dm.district_name,s.state_name

                        $("#tbl_experince tbody").append('<tr> <td>' + Result.d[i].orgname + '</td>' +
                                  '<td>' + Result.d[i].orgdesi + '</td>' +
                                  '<td>' + Result.d[i].orggrade + '</td>' +
                                  '<td>' + Result.d[i].orgaddr + '</td>' +
                                  '<td>' + Result.d[i].orgtype + '</td>' +
                                  '<td>' + Result.d[i].country + '</td>' +
                                  '<td>' + Result.d[i].pfromdate + '</td>' +
                                  '<td>' + Result.d[i].ptodate + '</td>' +
                                  '<td>' + Result.d[i].Rmarks + '</td></tr>');  
                    }
                },
                error: function (Result) {
                }
            });
        }

         //---------------------------------------------------------
        function dwnld(row) {
            var i = row.parentNode.parentNode.rowIndex;
            var rows = document.getElementById("tbl_doc").rows;
            var hiddenvalue1 = rows[i].cells[3].innerText;
            var hiddenvalue2 = rows[i].cells[4].innerText;
            var hiddenvalue3 = rows[i].cells[5].innerText;
            var empCode = $("#cmb_appId_doc").find('option:selected').val();
            var inputdata = empCode + "~" + hiddenvalue3;
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "H_Verify.aspx/Documents_download",
                //data: "{ empcode: '" + empCode + "',parentid: '" + hiddenvalue1 + "',childid: '" + hiddenvalue2 + "',seqid: '" + hiddenvalue3 + "' }",
                data: "{ input: '" + inputdata + "' }",
                dataType: "json",
                success: function (Result) {
                    //var win = window.open("../Images/" + Result.d, "_blank");
                    var fileName = Result.d;
                   // alert(fileName);
                    var myUrl = "../Images/" + fileName;
                    OpenDialog(myUrl, 875, 650, function (termsOfServiceAccepted)
                    {
                        if (termsOfServiceAccepted)
                        {
                            $.ajax({
                                type: "POST",
                                contentType: "application/json;charset=utf-8",
                                url: "H_Verify.aspx/deleteDownloadFile",
                                data: "{ input: '" + fileName + "' }",
                                dataType: "json",
                                success: function (Result) {
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

        function OpenDialog(url, width, height, callback)
        {
            var win = window.open(url, "Manappuram Document Verification", width, height, "menubar=0,toolbar=0","_blank");
            var timer = setInterval(function ()
            {
                if (win.closed)
                {
                    clearInterval(timer);
                    var returnValue = true;
                    callback(returnValue);
                }
            }, 10);
        }

        function testing(row) {
            var i = row.parentNode.parentNode.rowIndex;
            var rows = document.getElementById("tbl_doc").rows;
            var hiddenvalue1 = rows[i].cells[3].innerText;
            var hiddenvalue2 = rows[i].cells[4].innerText;
            var hiddenvalue3 = rows[i].cells[5].innerText;
            var empCode = $("#ddl_emp_doc_scanning").find('option:selected').val();
            var inputdata = empCode + "~" + hiddenvalue3;

            var url = "View_Emp_document.aspx/DownloadF";
            var data = {inputdata: inputdata};
            url += '?' + decodeURIComponent($.param(data));

            // if url is an excel file, the browser will handle it (should show a download dialog)
            window.location = url;
        }

        function confirm_basic()
        {
            var ch1 = 0;
            var ch2 = 0;
            var ch3 = 0;
            var ch4 = 0;
            var ch5 = 0;

            var ch6 = 0;

            var ch7 = 0;

            var ch8 = 0;



            //insert schedule time to database and send sms 
            if ($('input[id=ch1]').is(':checked')) {
                var ch1 = 1;
            }
            if ($('input[id=ch2]').is(':checked')) {
                var ch2 = 1;
            }
            if ($('input[id=ch3]').is(':checked')) {
                var ch3 = 1;
            }
            if ($('input[id=ch4]').is(':checked')) {
                var ch4 = 1;
            }
            if ($('input[id=ch5]').is(':checked')) {
                var ch5 = 1;
            }
            if ($('input[id=ch6]').is(':checked')) {
                var ch6 = 1;
            }
            if ($('input[id=ch7]').is(':checked')) {
                var ch7 = 1;
            }
            if ($('input[id=ch8]').is(':checked')) {
                var ch8 = 1;
            }

            var ch = ch1 + "µ" + ch2 + "µ" + ch3 + "µ" + ch4 + "µ" + ch5 + "µ" + ch6 + "µ" + ch7 + "µ" + ch8;

            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "H_Verify.aspx/insert_detail",
                data: "{input:'" + dt + "'}",
                dataType: "json",
                success: function (Result) {
                    var res = Result.d;
                    $("#btn_next").prop("disabled", false);
                    $("#btn_saves").prop("disabled", true);
                    alert(res);

                }
            });
        }
    
        function emp_doc_apprv() {
            var c = $("#cmb_appId_doc").val();

         
            var cmt =  $("#txt_salrmk").val();

            var table = document.getElementById('tbl_doc');

            var row = "";
            for (var r = 1, n = table.rows.length ; r < n; r++) {
                // for (var c = 7, m = table.rows[r].cells.length; c = m ; c++) {
                var val = Number(r) - 1;
                var r1 = table.rows[r].cells[5].innerHTML;
                var dyID = "#select_" + val + " :selected";
                // alert(dyID);
                var id = $(dyID).val();
                //alert("mm -- "+id);
                var row = row + r1 + '~' + id + "¬";
                if (id == 2 || id == 0) {

                    a = 1;
                    break;
                }
                else { a = 0; }
                //}
            }
            var empid = $("[id*=txt_session]").val();
           // var cmt = "";
            if (c == 0 || a == 1 || cmt == '') {
                if (c == 0)
                { alert("select Candidate"); }
                else if (a == 1)
                { alert("Please check Document"); }
                

            } else {
                var app = 1;
                var row2 = c + "µ" + empid + "µ" + cmt + "µ" + app + "µ" + row;

                $.ajax({
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    url: "H_Verify.aspx/approve",
                    data: "{ input: '" + row2 + "' }",
                    dataType: "json",
                    beforeSend: function () {
                        return confirm("Are you sure you want to confirm?");
                    },
                    success: function (Result) {
                        var res1 = Result.d
                        alert(res1);
                        window.open("H_Verify.aspx", "_self");
                    },
                    error: function (Result) {
                    }
                });
            }

        }
        function emp_doc_reject() {
            
            var c = $("#cmb_appId_doc").val();
            var empid = $("[id*=txt_session]").val();
         

            var table = document.getElementById('tbl_doc');
            var a = 0;
            var b = 0;
            var row = "";

            for (var r = 1, n = table.rows.length ; r < n; r++) {
                // for (var c = 7, m = table.rows[r].cells.length; c = m ; c++) {
                var val = Number(r) - 1;
                var r1 = table.rows[r].cells[5].innerHTML;
                var dyID = "#select_" + val + " :selected";
                // alert(dyID);
                var id = $(dyID).val();
                //alert("mm -- "+id);
                var row = row + r1 + '~' + id + "¬";

                if (id == 0) {
                    a = a + 1;
                }

                if (id == 1) {
                    b = b + 1;
                }

            }
            cmt = $("#txt_salrmk").val();
            if (c == 0 ||  a != 0 || b == (n - 1)) {
                if (c == 0)
                { alert("select candidate"); }
                else if (a != 0 || b == (n - 1))
                { alert("Please check Document"); }
               
            } else {
                var app = 2;
                var row2 = c + "µ" + empid + "µ" + cmt + "µ" + app + "µ" + row;
                alert(row2);
                $.ajax({
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    url: "H_Verify.aspx/approve",
                    data: "{ input: '" + row2 + "' }",
                    dataType: "json", beforeSend: function () {
                        return confirm("Are you sure you want to confirm?");
                    },
                    success: function (Result) {
                        var res = Result.d
                      
                        alert(res);
                        window.open("H_Verify.aspx", "_self");
                    },
                    error: function (Result) {
                    }
                });
            }

        }
        
         
         </script>
      <script type="text/javascript" src="../App_Themes/Theme/assets/js/Htabs.js"></script>
 
   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="panel panel-default col-md-12">
        <div id="Tabs" role="tabpanel">
            <!-- Nav tabs -->
              <ul class="nav nav-pills" role="tablist">
                   <li ><a href="#notific" aria-controls="notific" role="tab" data-toggle="pill" onclick="bhschedul_tab()">Schedule Interview</a></li>
                
                 <li  class="active"><a href="#verify" aria-controls="verify" role="tab" data-toggle="pill" onclick="verify_tab()">Verify Docs</a></li>
                
                                     <%--<li><a href="#photoupload" aria-controls="photoupload" role="tab" data-toggle="pill" onclick="pic_tab()">Photo Upload</a></li>--%>

            </ul>
            <!-- Tab panes -->
            <form id="Form1" class="form-horizontal row-border" action="#" runat="server">
                <div class="tab-content">
                 
                 
                                  
                        <div class="row ">
                            <div class="ma-header">
                                <div class="col-md-12">
                                    <h3 style="color: #091221"><span class="glyphicon glyphicon-check"></span> VERIFICATION</h3>
                                </div>
                            </div>
                        </div>
                         
                     

                   

                        <div class="form-group">
                            <div class="col-md-12">
                                <div class="widget box">
                                    <%--  <div class="row">--%>

                                    <div class="widget-header clonedInput">
                                        <h4><span class="glyphicon glyphicon-zoom-in"></span> BH Verification<span class="required"> *</span></h4>
                                    </div>
                                   
                                      <div id="basic_info" class="clonedInput">
                                             <div class="widget-content">
                                                   <div class="form-group">
                                                                                 
                             <label class="col-md-2 cntr-text">Select Application Id</label>
                              <div class="col-md-4">
                                    <asp:TextBox ID="txt_session" runat="server" hidden="hidden" ></asp:TextBox>
                                    <asp:TextBox ID="txt_br" runat="server" hidden="hidden" ></asp:TextBox>
                              <select class="form-control"  data-placeholder="App_id" id="cmb_appId_doc" name="cmb_appId_doc" required >
                                     <option value="-1" selected="selected">--SELECT--</option>
                                 </select>                                 </div>   
                                <label class="col-md-2 cntr-text">Branch Name</label>
                              <div class="col-md-4">
                                <input type="text" class="form-control" id="txt_brname" name="distname" maxlength="25" required="required" onblur="leftTrim(this)" autocomplete="off" disabled="disabled" onkeypress="return onlyAlphabets(event,this);" onkeyup="this.value=this.value.toUpperCase()" />
                                 </div>  
                        </div>

                                                  <div class="form-group">
                             <label class="col-md-2 cntr-text">Age</label>
                              <div class="col-md-4">
                                <input type="text" class="form-control" id="txt_age" name="dob" maxlength="25" required="required" onblur="leftTrim(this)" autocomplete="off" disabled="disabled"  onkeypress="return onlyAlphabets(event,this);" onkeyup="this.value=this.value.toUpperCase()" />
                                 </div>                                                         
                            
                           
                             <label class="col-md-2 cntr-text">POST  </label>
                                   <div class="col-md-4">
                     <input type="text" name="regular" class="form-control" id="txt_post" disabled/>
                                       </div>
                               
                                  </div>

                                    <div class="form-group">
                             <label class="col-md-2 cntr-text">Interview Date</label>
                              <div class="col-md-4">
                                <input type="text" class="form-control" id="txt_indt" name="dob" maxlength="25" required="required" onblur="leftTrim(this)" autocomplete="off" disabled="disabled"  onkeypress="return onlyAlphabets(event,this);" onkeyup="this.value=this.value.toUpperCase()" />
                                 </div>                                                         
                              <label class="col-md-2 cntr-text">Interview Time</label>
                            <div class="col-md-4"> 
                                <input type="text" class="form-control" id="txt_intm" name="gender" maxlength="25" required="required" onblur="leftTrim(this)" autocomplete="off" disabled="disabled" onkeypress="return onlyAlphabets(event,this);" onkeyup="this.value=this.value.toUpperCase()" />
                            </div>
                        </div>  
                                                 
                                                 
                              
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
                                <input type="text" name="regular" class="form-control" id="txt_dob"  required="required" disabled ondrop="false" onkeydown="return false" onpaste="false" onkeyup="leftTrim(this)" autocomplete="off"  />
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
                                    <input name="radio_handi" value="yes" type="radio"class="required" id="rdo_hyes" onclick="rdo_handicapped()" disabled/>
                                   Yes
                                </label>
                              
                                <label class="radio-inline  cntr-text">
                                    <input name="radio_handi" value="no" type="radio" class="required" id="rdo_hno" onclick="rdo_handicapped()" disabled/>
                                    No
                                </label>   </div>
</div>
                       
                        </div>
                                     <div class="form-group">
                         <div class="col-md-12">
                            <label class="col-md-2 cntr-text">Are you looking for further Studies?</label>
                             <div class="col-md-3">
                                <label class="radio-inline cntr-text">
                                    <input name="radio_st" value="1" type="radio"class="required" id="rd_st1" disabled/>
                                   Yes
                                </label>
                              
                                <label class="radio-inline  cntr-text">
                                    <input name="radio_st" value="2" type="radio" class="required" id="rd_st2" disabled />
                                    No
                                </label>   </div>
                            <label class="col-md-2 cntr-text">Are you willing to work any where in India?</label>
                           <div class="col-md-3">
                                <label class="radio-inline cntr-text">
                                    <input name="radio_work" value="1" type="radio"class="required" id="rd_wrk1" onclick="rdo_work()" disabled/>
                                   Yes
                                </label>
                              
                                <label class="radio-inline  cntr-text">
                                    <input name="radio_work" value="2" type="radio" class="required" id="rd_wrk2" onclick="rdo_work()" disabled/>
                                    No
                                </label>   </div>
                             </div>
                        </div>

               
                    <div class="form-group">
                           <div id="hidehandi" hidden="hidden">
                                  <label class="col-md-2 cntr-text">Remark</label>
                            <div class="col-md-6">
                                <input type="text" name="regular" class="form-control" id="txt_rmkhandi" maxlength="50" onkeypress=" return IsAlphaNumeric(event);" onkeydown="leftTrim(this)" autocomplete="off"  disabled onkeyup="this.value=this.value.toUpperCase()" />
                            </div>
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
                                              
                                                <select class="form-control" id="ddl_local1" name="Dt" disabled>
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
                                                <textarea class="form-control" rows="2" id="txtarea_landmark1" disabled onkeydown="leftTrim(this)" maxlength="50" autocomplete="off"  onkeypress=" return IsAlphaNumeric(event);" onkeyup="this.value=this.value.toUpperCase()" ></textarea>
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
                                                <input type="text" name="regular" class="form-control" id="txt_housename2" maxlength="25" disabled onkeydown="leftTrim(this)" autocomplete="off"  onkeypress=" return IsAlphaNumeric(event);" onkeyup="this.value=this.value.toUpperCase()" />
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
                                              
                                                <select class="form-control" id="ddl_local2" name="Dt" disabled>
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
                                                <textarea class="form-control" rows="2" id="txtarea_landmark2" disabled maxlength="50" onkeydown="leftTrim(this)" autocomplete="off"  onkeypress=" return IsAlphaNumeric(event);" onkeyup="this.value=this.value.toUpperCase()" ></textarea>
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
                                     <input type="radio" name="radio_marital" value="married" class="required" id="rdo_married" disabled onclick="rdo_marital()" />
                                  Married</label>
                                   
                                   <label class="radio-inline cntr-text">
                                    <input type="radio" name="radio_marital" value="single" class="required" id="rdo_single" disabled onclick="rdo_marital()" />
                                    Single</label>
                                     <label class="radio-inline cntr-text">
                                    <input type="radio" name="radio_marital" value="divorce" class="required" id="rdo_divorce" disabled onclick="rdo_marital()"/>
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
                        <div id="hidediv" hidden="hidden">
                        <div class="form-group">
                            <label class="col-md-2 cntr-text">Spouse</label>
                            <div class="col-md-4">
                                <input type="text" name="regular" class="form-control" id="txt_spousename" maxlength="30" onkeydown="leftTrim(this)" onkeypress="return onlyAlphabets(event,this);" autocomplete="off"  disabled onkeyup="this.value=this.value.toUpperCase()"  />
                            </div>

                            <label class="col-md-2 cntr-text">No Of Children</label>
                            <div class="col-md-4">
                                <input type="text" name="regular" class="form-control" id="txt_noofchild" maxlength="2" onkeyup="leftTrim(this)" autocomplete="off"  disabled onkeypress="return isNumberKey(event,this)"/>
                            </div>
                        </div>
                          <div class="form-group" >
                            
                            <label class="col-md-2 cntr-text">Contact No.</label>
                            <div class="col-md-4">
                                <input type="text" name="regular" class="form-control" id="txt_spouseno" maxlength="12" minlength="10" onkeyup="leftTrim(this)" autocomplete="off"  onkeypress="return isNumberKey(event,this)" disabled/>
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
                                    <div id="Div3" class="clonedInput">
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
                       <div class="form-group">
                            <div class="col-md-12">
                                <div class="widget box">                                  
                                    <div class="widget-header clonedInput">
                                        <h4><span class="glyphicon glyphicon-zoom-in"></span> Family Details<span class="required"> *</span></h4>
                                    </div>
                                    <div id="Div2" class="clonedInput">
                                             <div class="widget-content">
                   

                       <div class="form-group">
                            <label class="col-md-2 cntr-text">Type of Family<span class="required"> *</span></label>
                            <div class="col-md-3">
                <input type="text" name="gender" class="form-control" id="txt_fam" maxlength="14" autocomplete="off" onblur="leftTrim(this)"disabled />
 
                                
                            </div>
                            <label class="col-md-2 cntr-text">Residence<span class="required"> *</span></label>
                            <div class="col-md-3"> 
  <input type="text" name="gender" class="form-control" id="txt_res" maxlength="14" autocomplete="off" onblur="leftTrim(this)"disabled />

                            </div></div> 

                        <div class="form-group">
                            <label class="col-md-2 cntr-text">Value of Property</label>
                            <div class="col-md-3">
                                <input type="text" name="gender" class="form-control" id="txt_value" maxlength="14" autocomplete="off" onblur="leftTrim(this)"disabled />
                            </div>
                        </div>
                  
                        
                       
                    
                   
                    


                               <div class="ibox-content"  id="familydtl" hidden="hidden">
                            <div class="ibox-table">
                                <div class="table-responsive">
                                    <table class="responsive-table table-striped table-bordered table-hover align-center " id="tbl_family" style="width:1000px;">
                                <thead style="color: white; grid-row-align:center;background-color:#686b6b">
                                    <tr style="height:30px;font-size:x-small;" >
                                        <th data-class="expand">Father/Mother</th>
                                                <th data-class="expand">Name</th>
                                        <th>Qualification</th>
                                                <th>Occupation</th>
                                                <th>Others, pls specify</th>                                               
                                               <th>Salary</th>                                                                                        
                                     
                                     

                                            </tr>
                                        </thead>
                                        <tbody>
                                            
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>

                     <div class="widget-header">
                                    <h4><i class="icon-reorder"></i>Sibling Details</h4>
                                </div>  
                        <div class="ibox-content"  id="tbl_sib" hidden="hidden">
                            <div class="ibox-table">
                                <div class="table-responsive">
                                    <table class="responsive-table table-striped table-bordered table-hover align-center " id="tbl_sibling" style="width:1000px;">
                                <thead style="color: white; grid-row-align:center;background-color:#686b6b">
                                    <tr style="height:30px;font-size:x-small;" >
                                                <th data-class="expand">Name</th>
                                        <th>Qualification</th>
                                                <th>Occupation</th>
                                                <th>Others, pls specify</th>                                               
                                               <th>Salary</th>                                                                                        
                                        <th >Gender</th>
                                     

                                            </tr>
                                        </thead>
                                        <tbody>
                                            
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                          

</div></div></div></div></div>


     


   <div class="form-group">
                            <div class="col-md-12">
                                <div class="widget box">                                  
                                    <div class="widget-header clonedInput">
                                        <h4><span class="glyphicon glyphicon-zoom-in"></span> Qualification Details<span class="required"> *</span></h4>
                                    </div>
                                    <div id="Div1" class="clonedInput">
                                             <div class="widget-content">
                                          
                        <div class="ibox-content"  id="tbl_q" hidden="hidden">
                            <div class="ibox-table">
                                <div class="table-responsive">
                                    <table class="responsive-table table-striped table-bordered table-hover align-center " id="tbl_qual" style="width:1000px;">
                                <thead style="color: white; grid-row-align:center;background-color:#686b6b">
                                    <tr style="height:30px;font-size:x-small;" >
                                                <th data-class="expand">Qualification Type</th>
                                        <th>Qualification</th>
                                                <th>University</th>
                                                <th>Institution</th>                                               
                                               <th>passed year</th>
                                                <th>Percentage of Mark</th>
                                                <th>Grade</th>
                                                <th>Passed First Attempt</th>
                                       <th>Type Registration</th>
                                        <th>Highest Qualification</th>
                                        <th hidden="hidden">quaid</th>
                                        

                                            </tr>
                                        </thead>
                                        <tbody>
                                            
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                                 </div>
                                        </div>
                        </div>
                                 </div></div>
                   <%-- ////////Sandeep--%>
                    <div class="form-group">
                            <div class="col-md-12">
                                <div class="widget box">                                  
                                    <div class="widget-header clonedInput">
                                        <h4><span class="glyphicon glyphicon-zoom-in"></span> Experience Details<span class="required"> *</span></h4>
                                    </div>
                                    <div id="Div5" class="clonedInput">
                                             <div class="widget-content">
                                          
                        <div class="ibox-content"  id="experienec" hidden="hidden">
                            <div class="ibox-table">
                                <div class="table-responsive">
                                    <table class="responsive-table table-striped table-bordered table-hover align-center " id="tbl_experince" style="width:1000px;">
                                <thead style="color: white; grid-row-align:center;background-color:#686b6b">
                                    <tr style="height:30px;font-size:x-small;" >
                                                <th data-class="expand">Organization name</th>
                                        <th>Designation</th>
                                                <th>Grade</th>
                                                <th>Address</th>                                               
                                               <th>Country</th>
                                                <th>Organization type</th>
                                                <th>From date</th>
                                                <th>To date</th>
                                       <th>Remarks</th>
                                        <th hidden="hidden">quaid</th>
                                        

                                            </tr>
                                        </thead>
                                        <tbody>
                                            
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                                 </div>
                                        </div>
                        </div>
                                 </div></div>
<%--                    ///////////Sandeep end--%>

   <div class="form-group">
                            <div class="col-md-12">
                                <div class="widget box">                                  
                                    <div class="widget-header clonedInput">
                                        <h4><span class="glyphicon glyphicon-zoom-in"></span> Refference   Details<span class="required"> *</span></h4>
                                    </div>
                                    <div id="Div4" class="clonedInput">
                                             <div class="widget-content">
                        
                          <div class="ibox-content"  id="div_ref" hidden="hidden">
                            <div class="ibox-table">
                                <div class="table-responsive">
                                    <table class="responsive-table table-striped table-bordered table-hover align-center " id="tbl_ref" style="width:1000px;">
                                <thead style="color: white; grid-row-align:center;background-color:#686b6b">
                                    <tr style="height:30px;font-size:x-small;" >
                                        <th data-class="expand">Name</th>
                                                <th >Post</th>
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
                   
                         <div class="form-group">
                            <div class="col-md-12">
                                <div class="widget box">                                  
                                    <div class="widget-header clonedInput">
                                        <h4><span class="glyphicon glyphicon-zoom-in"></span>  Document Verification<span class="required"> *</span></h4>
                                    </div>
                                    <div id="doc_info1" class="clonedInput">
                                             <div class="widget-content">
                                                 <div id="tbldoc" hidden="hidden">
                        <div class="ibox-content align-center">
                            <div class="ibox-table">
                                <div class="table-responsive">
                                    <table class="responsive-table table-striped table-bordered table-hover align-center " id="tbl_doc" style="width:1000px;">
                                <thead style="color: white; grid-row-align:center;background-color:#686b6b">
                                    <tr style="height:30px;font-size:x-small;" >
                                                <th data-class="expand">Document</th>
                                               <th>Sub Document</th>
                                        <th>Description</th>
                                        <th hidden="hidden">parent id</th>
                                        <th hidden="hidden">Child id</th>   <th>Download</th>                                          
                                            </tr>
                                        </thead>
                                        <tbody>
                                        
                                        </tbody>
                                    </table>
                                </div>

                            </div>
                        </div>
                        </div>
                                                          <div class="form-group" id="new_rmk">
                                        <label class="col-md-2 cntr-text">Enter Remarks </label>
                                        <div class="col-md-6">
                                            <input type="text" name="regular" class="form-control" id="txt_salrmk" maxlength="500" autocomplete="off"/>

                                        </div>
                                       
                                    </div>  
  
                   
                      
                     
                     
                             
                      
              

                  
                       </div> 
                    </div>
                                   
                        <br />
                                    
                                </div>
                                   
                            </div>
                            
                        </div>
                    
             
                    
                    
                        
              
                            <div class=" form-group align-center">
                                 <input id="btn_doc_approve" type="button" value="Approve" class="btn btn-info" onclick="emp_doc_apprv();" style="border-radius:25px;width:180px"/>
                           <input id="btn_doc_reject" type="button" value="Reject"  class="btn btn-info" onclick="emp_doc_reject();" style="border-radius:25px;width:180px"/>
<%--                                <input id="btn_confirm" type="button" value="Verify" class="btn btn-info "  onclick="confirm_basic()" style="border-radius:25px;width:180px" />--%>
                                 <input id="btn_next" type="button" value="Exit"  class="btn btn-info" onclick="next()" style="border-radius:25px;width:180px" disabled="disabled" />


                        </div>
                        <br />
                   
                   
</div>
         
                
           </form>
        </div>
    </div>

</asp:Content>
