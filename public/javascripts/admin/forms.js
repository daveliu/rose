function onSubmitLogin(form) {
    var inputs = [{
        id: "admin_username",
        allowBlank: false
    },

    {
        id: "admin_password",
        allowBlank: false
    }];
    if (validate(inputs)) {
        form.submit();
    }
}