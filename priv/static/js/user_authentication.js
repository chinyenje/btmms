
function change_user_password(){
    // document.getElementById('reset_form_id').submit();
    console.log($('#message').html());
    if ($("#reset_current_password").val() !== "" && $("#password").val() !== "" && $("#confirm_password").val() !== ""){
        const swalWithBootstrapButtons = Swal.mixin({
            customClass: {
                confirmButton: 'btn btn-success',
                cancelButton: 'btn btn-danger'
            },
            buttonsStyling: true
        });

        if($('#message').html() == "Not Matching"){
            // swalWithBootstrapButtons.fire(
            //     'Error',
            //     'Passwords Do Not Match',
            //     'error'
            // )
        }else{
            var passw=  /(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}/;
            if($("#password").val().match(passw))
            {
                $.ajax(
                    {
                    method: 'post',
                    url: '/api/v1/btms/H5TWgFg8ovMeZFZqKEdqXfetZ7LsytqO5Oilh8vHuiRnyqd1uWE6hICo',
                    dataType: 'json',
                    contentType: 'application/json',
                    success: function (response) {

                        if (response.status === 0) {
                            swalWithBootstrapButtons.fire(
                                'Success',
                                response.message,
                                'success'
                            )
                        }else{
                            swalWithBootstrapButtons.fire(
                                'Error',
                                response.message,
                                'error'
                            )
                        }


                    },
                    data: JSON.stringify({username: $("#model_pwd_username").val(), password: $("#reset_current_password").val(), new_password: $("#confirm_password").val()})
                })
            }
            else
            {
                alert('Wrong...!')

            }


        }


    }
}

$('#password, #confirm_password').on('keyup', function () {
    if ($('#password').val() == $('#confirm_password').val()) {
        $('#message').html('Matching').css('color', 'green');
    } else
        $('#message').html('Not Matching').css('color', 'red');
});

function password_reset(){
    const swalWithBootstrapButtons = Swal.mixin({
        customClass: {
            confirmButton: 'btn btn-success',
            cancelButton: 'btn btn-danger'
        },
        buttonsStyling: true
    })

    let username = $("#reset_username").val()
    console.log(username)
    if (username.toString() === "") {
        swal({title: "Invalid Username", text: "Please enter a valid username before proceeding", type: "error"}
        );
    }else{
        swalWithBootstrapButtons.fire('Resetting your password,   Please wait...')
        swalWithBootstrapButtons.showLoading();

        let json_request = JSON.stringify({
            username: username
        });

        $.ajax({
            method: 'post',
            url: '/api/v1/btms/secured/password/reset',
            dataType: 'json',
            contentType: 'application/json',
            data: json_request,
            timeout: 3000, // sets timeout to 3 seconds
            success: function (response) {
                if (response.status === 200){
                    swalWithBootstrapButtons.close();
                    swal({title: "Password Reset Successful", text: "Your Password has been reset and sms sent", type: "success"},
                        function(){
                            back_to_login();
                        }
                    );
                }else{
                    swalWithBootstrapButtons.close();
                    swal({title: "Password Reset Failed", text: response.message, type: "error"},
                        function(){
                            // back_to_login();
                        }
                    );
                }
            },
            error: function(){
                swalWithBootstrapButtons.close();
                swal({title: "Error", text: "An Error Occurred and could not reset password", type: "error"},
                    function(){

                    }
                );
            }
        });

    }
}

function back_to_login() {
    window.location.href = "/"
}