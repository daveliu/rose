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
    },

    {
        id: "user_qq",
        pattern: qqPattern
    },

    {
        id: "user_address",
        allowBlank: false
    }]
    if (validate(inputs)) {
      
    }
}