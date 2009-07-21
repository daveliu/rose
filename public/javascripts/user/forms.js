function onSubmitRegister(form) {
    var inputs = [{
        id: "user_username",
        allowBlank: false,
        maxLength: 15,
        minLength: 6
    },

    {
        id: "user_password",
        allowBlank: false,
        maxLength: 15,
        minLength: 6
    },

    {
        id: "user_email",
        pattern: mailPattern
    }];
    if (validate(inputs)) {
        if ($F("user_password") != $F("user_confirm_password")) {
            showError("user_confirm_password");
        }
        else if ($F("user_cell_phone").blank() && $F("user_phone").blank()) {
            showError("user_phone");
        }
        else {
            form.submit();
        }
    }
}

function onLoginSubmit(form) {
    $$(".error").each(function (i) {
        i.hide();
    });
    var inputs = [{
        id: "user_username",
        allowBlank: false
    },

    {
        id: "user_password",
        allowBlank: false
    }];
    if (validate(inputs)) {
        form.submit();
    }
}