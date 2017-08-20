/**
 * Created by island on 2017/7/29.
 */
function getOrders(page, status) {
    // for(var i =0; i < 5; i++){
    //     addSingleOrder('2018-08-08', '111', '../static/icons/-34038572315010534721591501053476154.jpg', '111', '111', '111', 'sad');
    // }
    // alert(getSelected());
    jQuery.ajax({
        type: 'POST',
        url: '/orderAction/getOrderByUser',
        data: {
            "userID": getCookie("id"),
            "page": page,
            "status": status
        },
        dataType: 'json',
        success: function (data) {
            if (data && data.success == "true") {
                if (data.maxSize != 0) {
                    $('#noRecordLabel').css("display", "none");
                    $.each(data.order, function (i, item) {
                        addSingleOrder(item.startTime, item.orderID, data.pics[i], item.clothesID, item.donorID, data.orderPrice[i], item.orderStatus);
                        // addSingleCreditRecord(i, item.createTime, item.recordtype, item.clothesID, item.variance, item.afterCredits)
                        // addSingleClothesPanel(item, data.pics[i], data.username[i], data.prices[i]);
                    });
                }
            } else {
                // fail_alert("无结果");
            }
        },
        error: function () {
            fail_alert("哎呀呀，网络似乎不太好...")
        }
    });
}

function getMaxOrderPage() {
    var status = getSelected();
    var max = 0;
    jQuery.ajax({
        type: 'POST',
        url: '/orderAction/getOrderByUser',
        data: {
            "userID": getCookie("id"),
            "page": 0,
            "status": status
        },
        dataType: 'json',
        success: function (data) {
            if (data && data.success == "true") {
                max = data.maxSize;
            } else {
                // fail_alert("无结果");
            }
        },
        error: function () {
            fail_alert("哎呀呀，网络似乎不太好...")
        }
    });
    return max;
}

function first() {
    var status = getSelected();
    var page = parseInt(decodeURIComponent(getArgsFromHref($('.orderFrame').attr('src'), 'page')));
    initPageLabel(1, getMaxOrderPage());

    var src = "../jsp/orderList.jsp?page=1&status=" + status;
    $('.orderFrame').attr('src', src);
    initMenu(getMaxOrderPage(), 'orderMenu', 1);
    // window.location.href = '../jsp/search.jsp?school=' + school + "&gender=" + gender + "&size=" + size + "&type=" + type + "&page=" + 1;

}

function previous() {
    var status = getSelected();
    var page = parseInt(decodeURIComponent(getArgsFromHref($('.orderFrame').attr('src'), 'page')));
    initPageLabel(1, getMaxOrderPage());
    if (page > 1) {
        page = page - 1;
        var src = "../jsp/orderList.jsp?page=" + page + "&status=" + status;
        $('.orderFrame').attr('src', src);
        initMenu(getMaxOrderPage(), 'orderMenu', page);
        // window.location.href = '../jsp/search.jsp?school=' + school + "&gender=" + gender + "&size=" + size + "&type=" + type + "&page=" + page;
    }
    else {
        fail_alert("当前已经是第一页！")
    }
}


function next() {
    var page = parseInt(decodeURIComponent(getArgsFromHref($('.orderFrame').attr('src'), 'page')));
    var status = getSelected();
    var maxPage = getMaxOrderPage();
    initPageLabel(1, maxPage);
    if (page < maxPage) {
        page = page + 1;
        var src = "../jsp/orderList.jsp?page=" + page + "&status=" + status;
        $('.orderFrame').attr('src', src);
        initMenu(getMaxOrderPage(), 'orderMenu', page);
        // window.location.href = '../jsp/search.jsp?school=' + school + "&gender=" + gender + "&size=" + size + "&type=" + type + "&page=" + page;
    } else {
        fail_alert("当前已经是最后一页！")
    }
}

function last() {
    var maxPage = getMaxOrderPage();
    var status = getSelected();
    var page = parseInt(decodeURIComponent(getArgsFromHref($('.orderFrame').attr('src'), 'page')));
    initPageLabel(1, maxPage);
    if (page >= maxPage) {
        fail_alert("当前已经是最后一页！")
    } else {
        var src = "../jsp/orderList.jsp?page=" + maxPage + "&status=" + status;
        $('.orderFrame').attr('src', src);
        initMenu(getMaxOrderPage(), 'orderMenu', 1);
        // window.location.href = '../jsp/search.jsp?school=' + school + "&gender=" + gender + "&size=" + size + "&type=" + type + "&page=" + maxPage;
    }
}

function getSelected() {
    if (colorRGB2Hex($('#all').css("color")) == "#DABD61")
        return -2;
    if (colorRGB2Hex($('#unchecked').css("color")) == "#DABD61")
        return 3;
    if (colorRGB2Hex($('#uncomformed').css("color")) == "#DABD61")
        return 2;
    if (colorRGB2Hex($('#unpaid').css("color")) == "#DABD61")
        return 1;
}

function colorRGB2Hex(color) {
    var rgb = color.split(',');
    var r = parseInt(rgb[0].split('(')[1]);
    var g = parseInt(rgb[1]);
    var b = parseInt(rgb[2].split(')')[0]);

    var hex = "#" + ((1 << 24) + (r << 16) + (g << 8) + b).toString(16).slice(1);
    return hex.toUpperCase();
}

function addSingleOrder(date, orderID, picurl, clothesID, userID, price, status) {
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


    var width = new Array("10%", "30%", "20%", "10%", "10%", "10%");

    for (var i = 0; i < 6; i++) {
        var td = document.createElement("td");
        td.style.width = width[i];
        if (i == 0)
            td.appendChild(document.createTextNode(date));
        tr1.appendChild(td);
    }

    var tbody2 = document.createElement("tbody");
    tbody2.className = "table-content-body";
    table.appendChild(tbody2);

    var tr2 = document.createElement("tr");
    tbody2.appendChild(tr2);

    var th1 = document.createElement("th");
    th1.style.width = "10%";
    var a1 = document.createElement("a");
    // a.href = "../jsp/clothesDetail?id=" + clothesID;
    a1.onclick = function () {
        window.open("../jsp/orderDetails?id=" + orderID);
    };
    a1.appendChild(document.createTextNode(orderID));
    th1.appendChild(a1);
    tr2.appendChild(th1);

    var th2 = document.createElement("th");
    th2.style.width = "30%";
    var div = document.createElement("div");
    div.className = 'imageBox';
    th2.appendChild(div);
    var img = document.createElement("img");
    img.src = picurl;
    img.className = 'largeImage';
    div.appendChild(img);
    var a = document.createElement("a");
    // a.href = "../jsp/clothesDetail?id=" + clothesID;
    a.onclick = function () {
        window.open("../jsp/clothesDetail?id=" + clothesID);
    };
    a.className = "nameP";
    a.appendChild(document.createTextNode(clothesID));
    th2.appendChild(a);
    tr2.appendChild(th2);

    var th3 = document.createElement("th");
    th3.style.width = "20%";
    var a3 = document.createElement("a");
    // a.href = "../jsp/clothesDetail?id=" + clothesID;
    if (userID == getCookie('id')) {
        a3.onclick = function () {
            window.open("../jsp/userInfo.jsp");
        };
    }
    else {
        a3.onclick = function () {
            window.open("../jsp/friendInfo.jsp?id=" + userID);
        };
    }    // a3.onclick = function () {
    //     window.open("../jsp/orderDetails?id=" + orderID);
    // };
    a3.appendChild(document.createTextNode(userID));
    th3.appendChild(a3);
    tr2.appendChild(th3);

    var th4 = document.createElement("th");
    th4.style.width = "10%";
    th4.appendChild(document.createTextNode("¥" + price));
    tr2.appendChild(th4);

    var th5 = document.createElement("th");
    th5.style.width = "10%";
    tr2.appendChild(th5);

    var th6 = document.createElement("th");
    th6.style.width = "10%";
    var button = document.createElement("button");
    button.className = "mybt orderbt";
    status = parseInt(data.order.orderStatus);
    if (status == -1) {
        th5.appendChild(document.createTextNode("已撤销订单"));
        button.appendChild(document.createTextNode("查看订单"));
        button.onclick = processOrder("查看订单");
    }
    if (status == 1) {
        th5.appendChild(document.createTextNode("待交易订单"));
        button.appendChild(document.createTextNode("确认交易"));
        button.onclick = processOrder("确认交易");
    }
    if (status == 2) {
        th5.appendChild(document.createTextNode("待付款订单"));
        button.appendChild(document.createTextNode("立即付款"));
        button.onclick = processOrder("立即付款");
    }
    if (status == 3) {
        th5.appendChild(document.createTextNode("已完成订单"));
        button.appendChild(document.createTextNode("查看订单"));
        button.onclick = processOrder("查看订单");
    }
    th6.appendChild(button);
    tr2.appendChild(th6);
}

function processOrder(type, orderID) {
    if (type == "查看订单") {
        window.location.href("../jsp/orderDetail.jsp?id=" + orderID);
    }
    if (type == "确认交易") {
        jQuery.ajax({
            type: 'POST',
            url: '/orderAction/finishOrder',
            data: {
                "orderID": orderID
            },
            dataType: 'json',
            success: function (data) {
                if (data && data.success == "true") {
                    window.location.href("../jsp/order.jsp");
                    success_alert("确认成功");
                } else {
                    fail_alert("确认失败，网络似乎不太好...");
                }
            },
            error: function () {
                fail_alert("哎呀呀，网络似乎不太好...")
            }
        });
    }
    if (type == "立即付款") {
        window.location.href("../jsp/pay.jsp?id=" + orderID);
    }
}



function initPageLabel(current, max) {
    if (max == 0)
        max = 1;
    $('.pageLabel').text(current + " / " + max);
}
