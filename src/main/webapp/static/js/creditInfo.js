/**
 * Created by island on 2017/7/29.
 */
function getCreditRecord(page) {
    jQuery.ajax({
        type: 'POST',
        url: '/userAction/getCreditRecord',
        data: {
            "userID": getCookie("id"),
            "page": page
        },
        dataType: 'json',
        success: function (data) {
            if (data && data.success == "true") {
                if(data.maxPage != 0){
                    $('#noRecordLabel').css("display", "none");
                    $.each(data.creditRecords, function (i, item) {
                        addSingleCreditRecord(i, item.createTime, item.recordtype, item.clothesID, item.variance, item.afterCredits)
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

function getMaxCreditPage() {
    var max = 0;
    jQuery.ajax({
        type: 'POST',
        url: '/userAction/getCreditRecord',
        data: {
            "userID": getCookie("id"),
            "page": 0
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
    var page = parseInt(decodeURIComponent(getArgsFromHref($('#creditFrame').attr('src'), 'page')).split('#')[0]);
    if (page == 1) {
        fail_alert("当前已经是第一页！");
    } else {
        var src = "../jsp/creditList.jsp?page=1";
        $('#creditFrame').attr('src', src);
        // window.location.href = '../jsp/search.jsp?school=' + school + "&gender=" + gender + "&size=" + size + "&type=" + type + "&page=" + 1;
    }
}

function previous() {
    var page = parseInt(decodeURIComponent(getArgsFromHref($('#creditFrame').attr('src'), 'page')).split('#')[0]);
    if (page > 1) {
        page = page - 1;
        var src = "../jsp/creditList.jsp?page=" + page;
        $('#creditFrame').attr('src', src);
        // window.location.href = '../jsp/search.jsp?school=' + school + "&gender=" + gender + "&size=" + size + "&type=" + type + "&page=" + page;
    }
    else {
        fail_alert("当前已经是第一页！")
    }
}


function next() {
    var page = parseInt(decodeURIComponent(getArgsFromHref($('#creditFrame').attr('src'), 'page')).split('#')[0]);

    var maxPage = getMaxCreditPage();
    if (page < maxPage) {
        page = page + 1;
        var src = "../jsp/creditList.jsp?page=" + page;
        $('#creditFrame').attr('src', src);
        // window.location.href = '../jsp/search.jsp?school=' + school + "&gender=" + gender + "&size=" + size + "&type=" + type + "&page=" + page;
    } else {
        fail_alert("当前已经是最后一页！")
    }
}

function last() {
    var maxPage = getMaxCreditPage();
    var page = parseInt(decodeURIComponent(getArgsFromHref($('#creditFrame').attr('src'), 'page')).split('#')[0]);
    if (page >= maxPage) {
        fail_alert("当前已经是最后一页！")
    } else {
        var src = "../jsp/creditList.jsp?page=" + maxPage;
        $('#creditFrame').attr('src', src);
        // window.location.href = '../jsp/search.jsp?school=' + school + "&gender=" + gender + "&size=" + size + "&type=" + type + "&page=" + maxPage;
    }
}

function addSingleCreditRecord(i, date, recordtype, clothesID, variance, afterCredits){
    var body = document.getElementById('body');
    var table = document.createElement("table");
    table.className = "table-content";
    table.style.top = (2 + 20*i) + '%';
    body.appendChild(table);

    var tbody1 = document.createElement("tbody");
    tbody1.className = "table-content-title";
    table.appendChild(tbody1);

    var tr1 = document.createElement("tr");
    tbody1.appendChild(tr1);

    for(var i = 0; i < 4; i ++){
        var td = document.createElement("td");
        td.style.width = "25%";
        if(i == 0)
            td.appendChild(document.createTextNode(date));
        tr1.appendChild(td);
    }

    var tbody2 = document.createElement("tbody");
    tbody2.className = "table-content-body";
    table.appendChild(tbody2);

    var tr2 = document.createElement("tr");
    tbody2.appendChild(tr2);

    var th1 = document.createElement("th");
    th1.style.width = "25%";
    th1.appendChild(document.createTextNode(recordtype));
    tr2.appendChild(th1);

    var th2 = document.createElement("th");
    th2.style.width = "25%";
    var a = document.createElement("a");
    // a.href = "../jsp/clothesDetail?id=" + clothesID;
    a.onclick = function () {
        window.open("../jsp/clothesDetail?id=" + clothesID);
    };
    a.className = "clothesID";
    a.appendChild(document.createTextNode(clothesID));
    th2.appendChild(a);
    tr2.appendChild(th2);

    var th3 = document.createElement("th");
    th3.style.width = "25%";
    th3.appendChild(document.createTextNode(variance));
    tr2.appendChild(th3);

    var th4 = document.createElement("th");
    th4.style.width = "25%";
    th4.appendChild(document.createTextNode(afterCredits));
    tr2.appendChild(th4);

}