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
        $("pve_category_id").update("<option value='0'>请选择</option>");
        $("pve_suits_div").update("");
    }
    else {
        new Ajax.Request('/user/order_data/pve_suits?pve_category_id=' + element.value, {
            method: 'get',
            evalScript:true
        });
    }
}

function selectPveSuit(checked, suit_id) {
    var params = new Hash({
        type: (checked ? "add" : "remove"),
        pve_suit_id: suit_id
    });
    connectPveTimePrice(params)
}

function selectPveEquipment(checked, eq_id, type) {
    var params;
    if (type == 1) {
        params = new Hash({
            type: (checked ? "add" : "remove"),
            pve_equipment_id: eq_id
        });
    }
    else if (type == 2) {
        params = new Hash({
            type: (checked ? "add" : "remove"),
            pve_equipment_id: eq_id
        });
    }
    else {
        params = new Hash();
    }
    connectPveTimePrice(params)
}

function connectPveTimePrice(params) {
    var url = "/user/order_data/pve_time_price?" + params.toQueryString();
    new Ajax.Request(url, {
        method: 'get',
        evalScript:true
    });
}

function removeSuit(id) {
    var element = $("pve_suit_select_" + id);
    if (element) {
        element.checked = false;
    }
    selectPveSuit(false, id);
}

function removeEquipment(id, type) {
    var element = $("pve_equipment_select_" + id);
    if (element) {
        element.checked = false;
    }
    selectPveEquipment(false, id, type);
}

function selectPveTime(element) {
    var factor = 0;
    var selected = parseInt(element.value);
    for (var i = 0; i < pveTimePrice.length; i++) {
        if (selected == pveTimePrice[i][0]) {
            factor = pveTimePrice[i][1];
            break;
        }
    }
    $("pve_price").update(accMul(factor, totalPvePrice));
}

function accMul(arg1,arg2) {
    var m = 0, s1 = arg1.toString(), s2 = arg2.toString();
    try {
        m += s1.split(".")[1].length
    }
    catch(e){}
    try{
        m += s2.split(".")[1].length
    }
    catch(e){}
    return Number(s1.replace(".","")) * Number(s2.replace(".","")) / Math.pow(10,m)
}

function findPveEquipment(element, type) {
    if (element.value.blank() || element.value == "0") {
        $("instance_id").update("<option value='0'>请选择</option>");
        $("pve_equipment_div").update("");
    }
    else {
        new Ajax.Request("/user/order_data/pve_equipment?type=" + type + "&instance_id=" + element.value, {
            method: 'get',
            evalScript:true
        });
    }
}

function onSearchEq() {
    if ($F("pve_eq_name").blank()) {
        alert("请填写装备名称");
    }
    else {
        new Ajax.Request('/user/order_data/pve_equipment?type=1&eq_name=' + $F("pve_eq_name"), {
            method: 'get',
            evalScript:true
        });
    }
}

function onSearchWeapon() {
    if ($F("pve_weapon_name").blank()) {
        alert("请填写武器名称");
    }
    else {
        new Ajax.Request('/user/order_data/pve_equipment?type=2&eq_name=' + $F("pve_weapon_name"), {
            method: 'get',
            evalScript:true
        });
    }
}

function onSubmitPve(form) {
    if ($F("pve_time_price_id") == "0" || $F("pve_time_price_id").blank()) {
        alert("请选择代练日期");
    }
    else if (parseFloat($("pve_eq_price").innerHTML) < parseFloat($("pve_min_price").innerHTML)) {
        alert("装备总金额小于最低金额");
    }
    else {
        form.submit();
    }
}

function findPvpSuits(element) {
    if (element.value.blank() || element.value == "0") {
        $("pvp_category_id").update("<option value='0'>请选择</option>");
        $("pvp_suits_div").update("");
    }
    else {
        new Ajax.Request('/user/order_data/pvp_suits?pvp_category_id=' + element.value, {
            method: 'get',
            evalScript:true
        });
    }
}

function selectPvpSuit(checked, suit_id) {
    var params = new Hash({
        type: (checked ? "add" : "remove"),
        pvp_suit_id: suit_id
    });
    connectPvpTimePrice(params)
}

function connectPvpTimePrice(params) {
    var url = "/user/order_data/pvp_time_price?" + params.toQueryString();
    new Ajax.Request(url, {
        method: 'get',
        evalScript:true
    });
}

function selectPvpEquipment(checked, eq_id) {
    var  params = new Hash({
        type: (checked ? "add" : "remove"),
        pvp_equipment_id: eq_id
    });
    connectPvpTimePrice(params)
}

function removePvpSuit(id) {
    var element = $("pvp_suit_select_" + id);
    if (element) {
        element.checked = false;
    }
    selectPvpSuit(false, id);
}

function removePvpEquipment(id) {
    var element = $("pvp_equipment_select_" + id);
    if (element) {
        element.checked = false;
    }
    selectPvpEquipment(false, id);
}

function findPvpEquipment(element) {
    if (element.value.blank() || element.value == "0") {
        $("instance_id").update("<option value='0'>请选择</option>");
        $("pvp_equipment_div").update("");
    }
    else {
        new Ajax.Request("/user/order_data/pvp_equipment?instance_id=" + element.value, {
            method: 'get',
            evalScript:true
        });
    }
}

function onSearchPvpWeapon() {
    if ($F("pvp_eq_name").blank()) {
        alert("请填写装备名称");
    }
    else {
        new Ajax.Request('/user/order_data/pve_equipment?eq_name=' + $F("pvp_eq_name"), {
            method: 'get',
            evalScript:true
        });
    }
}

function selectPvpTime(element) {
    var factor = 0;
    var selected = parseInt(element.value);
    for (var i = 0; i < pvpTimePrice.length; i++) {
        if (selected == pvpTimePrice[i][0]) {
            factor = pvpTimePrice[i][1];
            break;
        }
    }
    $("pvp_price").update(accMul(factor, totalPvpPrice));
}

function onSubmitPvp(form) {
    if ($F("pvp_time_price_id") == "0" || $F("pvp_time_price_id").blank()) {
        alert("请选择代练日期");
    }
    else if (parseFloat($("pvp_eq_price").innerHTML) < parseFloat($("pvp_min_price").innerHTML)) {
        alert("装备总金额小于最低金额");
    }
    else {
        form.submit();
    }
}