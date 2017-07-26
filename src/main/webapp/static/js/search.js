/**
 * Created by island on 2017/7/24.
 */
var gender = "";
var type = "";
var school = "";
var size = "";
var gender1 = "";
function male() {
    gender = "男";
    gender1 = "男";
    $("#male").css("color", "#142535");
    $("#male").css("text-shadow", "-0.1vmax 0.1vmax 0 lightgrey");
    $("#female").css("color", "white");
    $("#female").css("text-shadow", "-0.1vmax 0.1vmax 0 grey");
}

function female() {
    gender = "女";
    gender1 = "女";
    $("#male").css("color", "white");
    $("#male").css("text-shadow", "-0.1vmax 0.1vmax 0 grey");
    $("#female").css("color", "#142535");
    $("#female").css("text-shadow", "-0.1vmax 0.1vmax 0 lightgrey");

}

function search() {
    $('#noResultLabel').css("display", "none");
    delCookie("gender");
    delCookie("school");
    delCookie("size");
    delCookie("type");
    type = $('#type option:selected').text();
    size = $('#size option:selected').text();
    school = $('#school option:selected').text();
    gender1 = $('#gender option:selected').text();
    if (gender == null || gender == 'null' || gender == '' || (gender != gender1 && gender1 != "")) {
        gender = gender1;
        gender1 = "";
    }
    if (gender == "" || school == "" || size == "" || type == "") {
        fail_alert("请选择完整的搜索条件！");
    } else {
        setCookie("gender", gender);
        setCookie("school", school);
        setCookie("size", size);
        setCookie("type", type);
        window.location.href = '../jsp/search.jsp?school=' + school + "&gender=" + gender + "&size=" + size + "&type=" + type + "&page=1";
        gender = '';
    }
    $("#male").css("color", "white");
    $("#male").css("text-shadow", "-0.1vmax 0.1vmax 0 grey");
    $("#female").css("color", "white");
    $("#female").css("text-shadow", "-0.1vmax 0.1vmax 0 grey");
}

function showResult(school, type, gender, size, page) {
    jQuery.ajax({
        type: 'POST',
        url: '/clothesAction/searchClothes',
        data: {
            "school": school,
            "type": type,
            "gender": gender,
            "size": size,
            "page": page
        },
        dataType: 'json',
        success: function (data) {
            // alert("success");
            if (data && data.success == "true") {
                $.each(data.clothes, function (i, item) {
                    addSingleClothesPanel(item);
                });
            } else {
                // fail_alert("无结果");
            }
        },
        error: function () {
            fail_alert("哎呀呀，网络似乎不太好...")
        }
    });
}

function initPage(page){
    clearSelectList('type');
    getInfo();

    jQuery.ajax( {
        type : 'POST',
        url : '/clothesAction/allTypesOfSchool',
        data:{
            "school": school
        },
        dataType : 'json',
        success : function(data) {
            // alert("success");
            if (data && data.success == "true") {
                addOption('type', "null", "");
                $.each(data.type, function(i, item) {
                    addOption('type', item, item);
                    // fail_alert(i);
                });
            }


            setSelected('school', school);
            setSelected('size', size);
//                    fail_alert(type);
            setSelected('type', type);
            setSelected('gender', gender);
        },
        error : function() {
            fail_alert("哎呀呀，初始化信息失败...")
        }
    });
    showResult(school, type, gender, size, page);

}

function addSingleClothesPanel(clothes) {
    var clothe_list = document.getElementById('contentPage');
    var clothe_item = document.createElement("div");
    clothe_item.className = "singleClothe";
    clothe_list.appendChild(clothe_item);

    var img = document.createElement("img");
    img.src = clothes.picUrl;
    clothe_item.appendChild(img);

    var priceLabel = document.createElement("p");
    priceLabel.className = "priceP";
    priceLabel.appendChild(document.createTextNode('¥' + clothes.price));
    clothe_item.appendChild(priceLabel);

    var nameLbale = document.createElement("a");
    nameLbale.className = "nameP";
    nameLbale.appendChild(document.createTextNode(clothes.school + '-' + clothes.type));
    clothe_item.appendChild(nameLbale);

    var userLabel = document.createElement("a");
    userLabel.className = "userP";
    userLabel.appendChild(document.createTextNode(clothes.donor));
    clothe_item.appendChild(userLabel);

    var genderLabel = document.createElement("p");
    genderLabel.className = "infoP";
    genderLabel.appendChild(document.createTextNode(clothes.gender));
    clothe_item.appendChild(genderLabel);

    var sizeLabel = document.createElement("p");
    sizeLabel.className = "infoP";
    sizeLabel.appendChild(document.createTextNode(clothes.size));
    sizeLabel.css("margin-left", "20%");
    clothe_item.appendChild(sizeLabel);

}

function getMaxPage(school, type, gender, size) {
    var max = 0;
    getInfo();
    jQuery.ajax({
        type: 'POST',
        url: '/clothesAction/searchClothes',
        data: {
            "school": school,
            "type": type,
            "gender": gender,
            "size": size,
            "page": 1,
        },
        dataType: 'json',
        success: function (data) {
            if (data && data.success == "true") {
                max = data.maxPage
                return data.maxPage;
            } else {
                // fail_alert("无结果");
                $('#noResultLabel').css("display", "inline-block");
            }
        },
        error: function () {
            fail_alert("哎呀呀，网络似乎不太好...")
        }
    });
    return max;
}

function first() {
    var page = parseInt(decodeURIComponent(getArgsFromHref(window.location.href, 'page')).split('#')[0]);
    getInfo();
    if (page == 1) {
        fail_alert("当前已经是第一页！");
    } else {
        window.location.href = '../jsp/search.jsp?school=' + school + "&gender=" + gender + "&size=" + size + "&type=" + type + "&page=" + 1;
    }
}

function previous() {
    var page = parseInt(decodeURIComponent(getArgsFromHref(window.location.href, 'page')).split('#')[0]);
    getInfo();
    if (page > 1) {
        page = page - 1;
        window.location.href = '../jsp/search.jsp?school=' + school + "&gender=" + gender + "&size=" + size + "&type=" + type + "&page=" + page;
    }
    else {
        fail_alert("当前已经是第一页！")
    }
}


function next() {
    var page = parseInt(decodeURIComponent(getArgsFromHref(window.location.href, 'page')).split('#')[0]);
    getInfo();

    var maxPage = getMaxPage(school, type, gender, size);
    if (page < maxPage) {
        page = page + 1;
        window.location.href = '../jsp/search.jsp?school=' + school + "&gender=" + gender + "&size=" + size + "&type=" + type + "&page=" + page;
    } else {
        fail_alert("当前已经是最后一页！")
    }
}

function last() {
    getInfo();
    var maxPage = getMaxPage(school, type, gender, size);
    var page = parseInt(decodeURIComponent(getArgsFromHref(window.location.href, 'page')).split('#')[0]);
    if (page >= maxPage) {
        fail_alert("当前已经是最后一页！")
    } else {
        window.location.href = '../jsp/search.jsp?school=' + school + "&gender=" + gender + "&size=" + size + "&type=" + type + "&page=" + maxPage;
    }
}

function getInfo(){
    school = getCookie("school");
    size = getCookie("size");
    type = getCookie("type");
    gender = getCookie("gender");
}