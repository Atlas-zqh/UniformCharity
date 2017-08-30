/**
 * Created by island on 2017/7/23.
 */
function getAllSchool(id){
    jQuery.ajax( {
        type : 'GET',
        contentType : 'application/json',
        url : '/schoolAction/allSchool',
        dataType : 'json',
        success : function(data) {
            // alert("success");
            if (data && data.success == "true") {
                addOption(id, "null", "");
                $.each(data.schools, function(i, item) {
                    addOption(id, item, item);
                });
            }
        },
        error : function() {
            fail_alert("哎呀呀，初始化信息失败...")
        }
    });
}

function getAllTypesOfSchool(id, school){
    clearSelectList(id);
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
                addOption(id, "null", "");
                $.each(data.type, function(i, item) {
                    addOption(id, item, item);
                    // fail_alert(i);
                });
            }
        },
        error : function() {
            fail_alert("哎呀呀，初始化信息失败...")
        }
    });
}

function clearSelectList(id) {
    var case_list = document.getElementById(id);
    var num = case_list.childNodes.length;
    for (num - 1; num >= 0; num--) {
        if (case_list.childNodes.item(num) != null)
        // alert(case_list.childNodes.item(num));
            case_list.removeChild(case_list.childNodes.item(num));
    }
}

function addOption(id, value, text) {
    var drop = document.getElementById(id);
    // alert(drop.options.length);
    var op = document.createElement("option");      // 新建OPTION (op)
    drop.options.add(op);
    op.setAttribute("value", value);          // 设置OPTION的 VALUE
    op.appendChild(document.createTextNode(text)); // 设置OPTION的 TEXT
    op.text = text;
}

function changeSchool(id, school_id){
    s = '#' + school_id + ' option:selected';
    var school = $(s).text();
    // alert(id);
    // alert(school);
    getAllTypesOfSchool(id, school);
}

function addSingleClothesPanel(clothes, pic, price) {

    var clothe_list = document.getElementById('contentPage');
    var clothe_item = document.createElement("div");
    clothe_item.className = "singleClothe";
    clothe_list.appendChild(clothe_item);

    var div = document.createElement('div');
    div.className = 'imageBox';
    clothe_item.appendChild(div);

    var img = document.createElement("img");
    img.src = pic;
    img.onclick = function () {
        window.open("../jsp/clothesDetails.jsp?id=" + clothes.clothesID);
    };
    img.style.cursor = "pointer";
    div.appendChild(img);

    var priceLabel = document.createElement("p");
    priceLabel.className = "priceP";
    priceLabel.appendChild(document.createTextNode('¥' + price));
    clothe_item.appendChild(priceLabel);

    var nameLabel = document.createElement("a");
    nameLabel.className = "nameP";
    nameLabel.appendChild(document.createTextNode(clothes.schoolName + '-' + clothes.clothesType));
    nameLabel.href = "../jsp/clothesDetails.jsp?id=" + clothes.clothesID;
    nameLabel.target = "_blank";
    clothe_item.appendChild(nameLabel);

    var userLabel = document.createElement("a");
    userLabel.className = "userP";
    userLabel.appendChild(document.createTextNode(clothes.clothesID));
    userLabel.href = "../jsp/clothesDetails.jsp?id=" + clothes.clothesID;
    userLabel.target = "_blank";
    clothe_item.appendChild(userLabel);

    var genderLabel = document.createElement("p");
    genderLabel.className = "infoP";
    genderLabel.appendChild(document.createTextNode(clothes.gender + '  ' + clothes.clothessize));
    clothe_item.appendChild(genderLabel);
}

function getAllClothes(s){
    var id = getCookie('id');
    jQuery.ajax({
        type: 'POST',
        url: '/clothesAction/findClothesByUser',
        data: {
            "id": id,
            "type": s
        },
        dataType: 'json',
        success: function (data) {
            // alert("success");
            if (data && data.success == "true") {
                if(data.clothes.length > 0) {
                    $('#noClothesLabel').css("display", "none");
                    $.each(data.clothes, function (i, item) {
                        addSingleClothesPanel(item, data.pics[i], data.prices[i]);
                    });
                }
            } else {
                fail_alert("无结果");
            }
        },
        error: function () {
            fail_alert("哎呀呀，网络似乎不太好...")
        }
    });
}