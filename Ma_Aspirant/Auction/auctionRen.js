
function upload() {

   
        var fileList = document.getElementById("fileRen").files;    
        var fileReader = new FileReader();
        if (fileReader && fileList && fileList.length) {

            fileReader.readAsDataURL(fileList[0]);
            fileReader.onload = function () {
                var imageData = fileReader.result;
                if ($("#txt_aucid").val() == "") {
                    alert("Enter Auctioneer ID");
                }
                else {

                    $.ajax({
                        type: "POST",
                        contentType: "application/json; charset=utf-8",
                        url: "AucRen.aspx/doc_upload",
                        data: "{input: '" + $("#txt_aucid").val() + "',image:'" + imageData + "'}",
                        dataType: "json",
                        beforeSend: function () {
                            return confirm("Are you sure you want to confirm?");
                        },
                        success: function (Result) {

                            alert("Successfully Uploaded");                           
                            $("#txt_aucid").val("")
                            $("#fileRen").val('');


                        },
                        error: function (Result) {
                            alert("Please reduce file size and try again.");
                        }
                    
                    });
                }
            };
        }
        else {
            alert("Select Any File");
            return;
        }
    
}

function confirm_final() {

    $.ajax({
        type: "POST",
        url: 'AucRec.aspx/checkDetails',
        data: "{aucid:'" + $("[id*=hdn_auc_id]").val() + "'}",
        async: false,
        cache: false,
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        beforeSend: function () {
            return confirm("Are you sure you want to confirm?");
        },
        success: function (Result) {
            Result1 = Result.d;
            if (Result.d.toString() == "111") {

                alert("Confirmed Successfully");
                location.reload();
                $("#btn_pan").prop('disabled', false);
                $("#btn_id").prop('disabled', false);
                $("#btn_degree").prop('disabled', false);
                $("#btn_llb").prop('disabled', false);
                $("#btn_sslc").prop('disabled', false);
                $("#btn_bank").prop('disabled', false);
            }
            else {
                alert('Please provide all the required documents.');
            }
        },
        error: function () {
            alert('Invalid Entry!');

        }
    });



}

  function searchAuctioneer() {
   
      var r_name = $("#txt_aucid").val();   
      
      
                    $.ajax({
                        type: "POST",
                        url: 'AucRen.aspx/searchAuc',
                        data: "{data:'" + r_name + "'}",
                        async: false,
                        cache: false,
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        beforeSend: function () {
                           
                        },
                        success: function (Result) {
                            Result1 = Result.d;
                       
                            if (Result.d.toString() != "333") {
                                $("#lbl_name").text(Result1.split('~')[0].toString())
                                $("#lbl_hs").text(Result1.split('~')[1].toString())
                                $("#lbl_agsdt").text(Result1.split('~')[2].toString())
                                $("#lbl_agedt").text(Result1.split('~')[3].toString())
                                

                                   }
                            else {
                                alert('You already renewed');
                            }
                        },
                        error: function () {
                            alert('Invalid Entry!');

                        }
                    });



                
               
      
  
}




















