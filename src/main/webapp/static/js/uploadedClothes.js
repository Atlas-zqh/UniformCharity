/**
 * Created by island on 2017/8/11.
 */
function getAllClothes() {
    var id = getCookie('id');
    jQuery.ajax({
        type: 'POST',
        url: '/clothesAction/findClothesByUser',
        data: {
            "id": id,
            "type": '1'
        },
        dataType: 'json',
        success: function (data) {
            // alert("success");
            if (data && data.success == "true") {
                if (data.clothes.length > 0) {
                    $('#noClothesLabel').css("display", "none");
                    $('#clothesNum').html(data.clothes.length);
                    $.each(data.clothes, function (i, item) {
                        addSingleClothes(item.clothesID, data.pics[i], item.clothesType, item.clothessize, item.status);
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

function addSingleClothes(clothesID, picurl, type, size, status) {
    var body = document.getElementById('body');
    var table = document.createElement("table");
    table.className = "table-content";
    // table.style.top = (2 + 20*i) + '%';
    body.appendChild(table);

    var tbody1 = document.createElement("tbody");
    tbody1.className = "table-content-title";
    table.appendChild(tbody1);

    var tr1 = document.createElement("tr");
    tbody1.appendChild(tr1);


    var td1 = document.createElement("td");
    td1.style.width = "30%";
    var a1 = document.createElement("a");
    // a.href = "../jsp/clothesDetail?id=" + clothesID;
    a1.onclick = function () {
        window.open("../jsp/clothesDetails.jsp?id=" + clothesID);
    };
    a1.appendChild(document.createTextNode(clothesID));
    td1.appendChild(a1);
    tr1.appendChild(td1);

    var td2 = document.createElement("td");
    td2.style.width = "20%";
    td2.appendChild(document.createTextNode("款式"));
    tr1.appendChild(td2);

    var td3 = document.createElement("td");
    td3.style.width = "20%";
    td3.appendChild(document.createTextNode("尺寸"));
    tr1.appendChild(td3);

    var td4 = document.createElement("td");
    td4.style.width = "20%";
    td4.appendChild(document.createTextNode("状态"));
    tr1.appendChild(td4);

    var tbody2 = document.createElement("tbody");
    tbody2.className = "table-content-body";
    table.appendChild(tbody2);

    var tr2 = document.createElement("tr");
    tbody2.appendChild(tr2);

    var th2 = document.createElement("th");
    th2.style.width = "30%";
    var div = document.createElement("div");
    div.className = 'imageBox';
    th2.appendChild(div);
    var img = document.createElement("img");
    img.src = picurl;
    img.className = 'largeImage';
    div.appendChild(img);
    tr2.appendChild(th2);

    var th4 = document.createElement("th");
    th4.style.width = "20%";
    th4.appendChild(document.createTextNode(type));
    tr2.appendChild(th4);

    var th5 = document.createElement("th");
    th5.style.width = "20%";
    th5.appendChild(document.createTextNode(size));
    tr2.appendChild(th5);


    var th6 = document.createElement("th");
    th6.style.width = "20%";
    if (status == 'Available')
        th6.appendChild(document.createTextNode("未卖出"));
    else
        th6.appendChild(document.createTextNode("已卖出"));
    tr2.appendChild(th6);


}