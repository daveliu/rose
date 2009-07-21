function validate(inputs) {
    var i;
    var error = false;
    for (i = 0; i < inputs.length; i++) {
        var temp = inputs[i];
        if (temp.allowBlank == false && $F(temp.id).blank()) {
            error = true;
            break;
        }
        if (temp.maxLength && $F(temp.id).length > temp.maxLength) {
            error = true;
            break;
        }
        if (temp.minLength && $F(temp.id).length < temp.minLength) {
            error = true;
            break;
        }
        if (temp.pattern && !temp.pattern.test($F(temp.id))) {
            error = true;
            break;
        }
    }
    if (error) {
        showError(temp.id);
        return false
    }
    else {
        return true;
    }
}

function showError(id) {
    $$(".error").each(function (i) {
        i.hide();
    });
    if ($(id + "_error")) {
        $(id + "_error").show();
        $(id).focus();
    }
}


