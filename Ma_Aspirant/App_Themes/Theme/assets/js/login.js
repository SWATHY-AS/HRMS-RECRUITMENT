
var Login = function () {
    var g = function () {
        $(document).on('change', '#usernumber', function (h) {
           
            var mobileNumber = $("#usernumber").val();

            if (mobileNumber != "") {
               
                $.ajax({                   
                    type: 'POST',
                    url: 'Login.aspx/sendOTPfn',
                  //  url:'Login.aspx/loginauth',
                    data: "{ number : '" + mobileNumber + "' }",

                    async: false,
                    cache: false,
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (Result) {
                        res = Result.d;
                        if (res == "SUCCESS") {
                            alert("Please Enter the received OTP!");
                            $("#password").prop('disabled', false);
                        }
                        else {
                            alert("Please Enter Correct Mobile Number");
                            $("#usernumber").val('');
                        }
                        //successfully send
                    },
                    Error: function (Result) {
                        //failed
                    }
                });// End of Ajax

                           }
            else {
                $(".login-form .alert-danger").show();
            }



        });


    };

    var e = function () {
        if ($.validator) {
            $.extend($.validator.defaults, {
                errorClass: "has-error",
                validClass: "has-success",
                highlight: function (k, i, j) {
                    if (k.type === "radio") {
                        this.findByName(k.name).addClass(i).removeClass(j)
                    } else {
                        $(k).addClass(i).removeClass(j)
                    }
                    $(k).closest(".form-group").addClass(i).removeClass(j)
                },
                unhighlight: function (k, i, j) {
                    if (k.type === "radio") {
                        this.findByName(k.name).removeClass(i).addClass(j)
                    } else {
                        $(k).removeClass(i).addClass(j)
                    }
                    $(k).closest(".form-group").removeClass(i).addClass(j);
                    $(k).closest(".form-group").find('label[generated="true"]').html("")
                }
            });
            var h = $.validator.prototype.resetForm;
            $.extend($.validator.prototype, {
                resetForm: function () {
                    h.call(this);
                    this.elements().closest(".form-group").removeClass(this.settings.errorClass + " " + this.settings.validClass)
                },
                showLabel: function (j, k) {
                    var i = this.errorsFor(j);
                    if (i.length) {
                        i.removeClass(this.settings.validClass).addClass(this.settings.errorClass);
                        if (i.attr("generated")) {
                            i.html(k)
                        }
                    } else {
                        i = $("<" + this.settings.errorElement + "/>").attr({
                            "for": this.idOrName(j),
                            generated: true
                        }).addClass(this.settings.errorClass).addClass("help-block").html(k || "");
                        if (this.settings.wrapper) {
                            i = i.hide().show().wrap("<" + this.settings.wrapper + "/>").parent()
                        }
                        if (!this.labelContainer.append(i).length) {
                            if (this.settings.errorPlacement) {
                                this.settings.errorPlacement(i, $(j))
                            } else {
                                i.insertAfter(j)
                            }
                        }
                    }
                    if (!k && this.settings.success) {
                        i.text("");
                        if (typeof this.settings.success === "string") {
                            i.addClass(this.settings.success)
                        } else {
                            this.settings.success(i, j)
                        }
                    }
                    this.toShow = this.toShow.add(i)
                }
            })
        }
    };
    var d = function () {
        if ($.validator) {
            $(".login-form").validate({
                invalidHandler: function (i, h) {
                    NProgress.start();
                    $(".login-form .alert-danger").show();
                    NProgress.done()
                },
                submitHandler: function (h) {


                    var userId = $("#usernumber").val();
                    var password = $("#password").val();
                    var AppId = $("#txt_candcode").val();
                    $.ajax({
                        type: "POST",
                        url: 'Login.aspx/loginauth',
                        data: "{number:'" + userId + "',otp:'" + password + "',candcod:'" + AppId + "'}",
                        async: false,
                        cache: false,
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (Result)
                        {
                            Result = Result.d;
                           
                            if (Result == "Valid")
                            {
                               
                                window.location.href = "Recruitment/Personal_Details.aspx"
                            }
                            else
                            {
                                alert('Invalid OTP!');

                            }
                        },
                        error: function ()
                        {
                            alert('Invalid Entry!');

                        }
                    });




                }
            })
        }
    };



    return {
        init: function () {
            g();
            e();
            d();

        },
    }
}();