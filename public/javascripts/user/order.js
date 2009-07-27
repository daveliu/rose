function findGameAreas(element) {
    var value = element.value;
    if (value.blank()) {
        $("order_game_area_id").update("");
        $("order_game_server_id").update("");
    }
    else {
        new Ajax.Request('/user/order_data/game_areas?game_id=' + value, {
            method: 'get',
            evalScript:true
        });
    }
}

function findGameServers(element) {
    var value = element.value;
    if (value.blank()) {
        $("order_game_server_id").update("");
    }
    else {
        new Ajax.Request('/user/order_data/game_servers?area_id=' + value, {
            method: 'get',
            evalScript:true
        });
    }
}

function onSubmitOrder(form) {
    var inputs = [{
        id: "order_pay_type_id",
        allowBlank: false
    }, {
        id: "order_game_id",
        allowBlank: false
    }, {
        id: "order_game_area_id",
        allowBlank: false
    }, {
        id: "order_game_server_id",
        allowBlank: false
    }, {
        id: "order_game_account",
        allowBlank: false
    }, {
        id: "order_game_password",
        allowBlank: false
    }, {
        id: "order_delay_days",
        pattern: /^\d+$/
    }, {
        id: "order_time_type_id",
        allowBlank: false
    }, {
        id: "order_email",
        pattern: mailPattern
    }];
    if (validate(inputs)) {
        if ($F("order_time_type_id") == "2" && !/^\d{4}\-\d{2}\-\d{2}$/.test($F("order_agreement_date"))) {
            showError("order_agreement_date");
        }
        else if (!cellPattern.test($F("order_cell_phone")) && !phonePattern.test("order_phone")) {
            showError("order_phone");
        }
        else {
            form.submit();
        }
    }
}