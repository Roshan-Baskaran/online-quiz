$('#form').on('submit', function(e) {
    e.preventDefault();
    checkInputs();
});

function checkInputs() {
    const firstNameValue = $('#firstname').val().trim();
    const lastNameValue = $('#lastname').val().trim();
    const emailValue = $('#email').val().trim();
    const passwordValue = $('#password').val().trim();
    const password2Value = $('#password2').val().trim();

    if(firstNameValue === '') {
        setErrorFor($('#firstname'), 'First name cannot be blank');
    } else {
        setSuccessFor($('#firstname'));
    }

    if(lastNameValue === '') {
        setErrorFor($('#lastname'), 'Last name cannot be blank');
    } else {
        setSuccessFor($('#lastname'));
    }

    if(emailValue === '') {
        setErrorFor($('#email'), 'Email cannot be blank');
    } else if (!isEmail(emailValue)) {
        setErrorFor($('#email'), 'Not a valid email');
    } else {
        setSuccessFor($('#email'));
    }

    if(passwordValue === '') {
        setErrorFor($('#password'), 'Password cannot be blank');
    } else {
        setSuccessFor($('#password'));
    }

    if(password2Value === '') {
        setErrorFor($('#password2'), 'Confirm password cannot be blank');
    } else if(passwordValue !== password2Value) {
        setErrorFor($('#password2'), 'Passwords do not match');
    } else{
        setSuccessFor($('#password2'));
    }
}

function setErrorFor(input, message) {
    const formControl = input.parent();
    const small = formControl.find('small');
    formControl.removeClass('success').addClass('error');
    small.text(message);
}

function setSuccessFor(input) {
    const formControl = input.parent();
    formControl.removeClass('error').addClass('success');
}

function isEmail(email) {
    return /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/.test(email);
}
