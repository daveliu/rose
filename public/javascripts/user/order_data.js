function findLevelTimes(element) {
    if (element.value.blank()) {
        $("upgrade_level_price_id").update("<option value='0'>请选择</option>");
    }
    else {
        new Ajax.Request('/user/order_data/upgrade_level_times?upgrade_level_id=' + element.value, {
            method: 'get',
            evalScript:true
        });
    }
    $("level_price").update("0.0");
}

function updateLevelPrice(element) {
    var factor = 0;
    var selected = parseInt(element.value)
    for (var i = 0; i < level_time_factor.length; i++) {
        if (selected == level_time_factor[i][0]) {
            factor = level_time_factor[i][1];
            break;
        }
    }
    $("level_price").update(factor * level_price);
}

function findPveSuits(element) {
    if (element.value.blank()) {
        $("pve_suit_id").update("<option value='0'>请选择</option>");
    }
    else {
        new Ajax.Request('/user/order_data/pve_suits?pve_category_id=' + element.value, {
            method: 'get',
            evalScript:true
        });
    }
}