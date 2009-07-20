function validate(inputs) {
    var i;
    var error = false;
    for (i = 0; i < inputs.length; i++) {
      if (i.allowBlank == false && $F(i.id).blank()) {
          error = true;
          break;
      }
      if (i.maxLength && $F(i.id).length > i.maxLength) {
          error = true;
          break;
      }
      if (i.minLength && $F(i.id).length < i.minLength) {
          error = true;
          break;
      }
      if (i.pattern && !pattern.test($F(id))) {
          error = true;
          break;
      }
    }
    if (error) {
        if ($(i.id + "_error")) {
            $(i.id + "_error").show();
            $(i.id).focus();
        }
        return false;
    }
    else {
        return true;
    }
}


