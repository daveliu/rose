function findLevelTimes(element) {
    if (element.value.blank() || element.value == "0") {
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
    if (element.value.blank() || element.value == "0") {
        $("pve_suit_id").update("<option value='0'>请选择</option>");
    }
    else {
        new Ajax.Request('/user/order_data/pve_suits?pve_category_id=' + element.value, {
            method: 'get',
            evalScript:true
        });
    }
}

function selectPveSuit(element, suit_id) {
    var suits = $F("pve_pve_suits").split(";").without("");
    if (element.checked) {
        suits.push(suit_id);
    }
    else {
        suits = suits.without(suit_id.toString);
    }    
    $("pve_pve_suits").value = suits.join(";");
    $("pve_price").update("0");
    calculateTotalPrice(suit_id, pve_prices, element.checked);
    getPveTimePrice();
}

function calculateTotalPrice(id, data, isAdd) {
    id = parseInt(id);
    for (var i = 0; i < data.length; i++) {
        if (id == data[i][0]) {
            if (isAdd) {
                totalPvePrice += parseFloat(data[i][1]);
            }
            else {
                totalPvePrice -= parseFloat(data[i][1])
            }
            break;
        }
    }
    $("pve_eq_price").update(totalPvePrice);
}

function getPveTimePrice() {
    new Ajax.Request('/user/order_data/pve_time_price?total_price=' + totalPvePrice, {
        method: 'get',
        evalScript:true
    });
}

function selectPveTime(element) {
    var factor = 0;
    var selected = parseInt(element.value)
    for (var i = 0; i < pve_time_price.length; i++) {
        if (selected == pve_time_price[i][0]) {
            factor = pve_time_price[i][1];
            break;
        }
    }
    $("pve_price").update(accMul(factor, totalPvePrice));
}

function accMul(arg1,arg2) {
    var m = 0,s1 = arg1.toString(), s2 = arg2.toString();
    try {
        m += s1.split(".")[1].length
    }
    catch(e){}
    try{
        m += s2.split(".")[1].length
    }
    catch(e){}
    return Number(s1.replace(".",""))*Number(s2.replace(".","")) / Math.pow(10,m)
}