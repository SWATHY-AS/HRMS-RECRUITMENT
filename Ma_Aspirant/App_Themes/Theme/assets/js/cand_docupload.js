function cand_upload() {
    
   
            $("#ddl_emp_doc_scanning").change(function () {
               
                var sid = $("#ddl_emp_doc_scanning").val();
                //alert(sid);
                $("#dd_doc1").val(0);

                $('#dd').hide();
                $("#txt_desc").val('');
                $("#tbl_doc tbody").empty();
                $("#tbldoc").show();
                // alert(emp);
                $.ajax({
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    url: "Doc_Scanning.aspx/get_doc_dtl",
                    data: "{ input: '" + sid + "' }",
                    dataType: "json",
                    success: function (Result) {

                        for (var i = 0; i < Result.d.length; i++) {
                            $("#tbl_doc tbody").append('<tr> <td>' + Result.d[i].doctyp + '</td>' +
                                '<td>' + Result.d[i].child1 + '</td></tr>');
                        }
                    },
                    error: function (Result) {
                    }
                });


            });
           
   
}
