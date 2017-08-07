/**
 * Created by island on 2017/8/6.
 */
function initBoardNav() {
    jQuery.ajax({
        type: 'GET',
        contentType: 'application/json',
        url: '/forumAction/getAllBoards',
        dataType: 'json',
        success: function (data) {
            // alert("success");
            if (data && data.success == "true") {
                $.each(data.boards, function (i, item) {
                    alert(i);
                    var li = document.createElement("li");
                    var a = document.createElement("a");
                    a.appendChild(document.createTextNode(item));
                    a.onclick = function () {
                        selectBoard(item);
                    };
                    $('#board').appendChild(li);
                });
            }
        },
        error: function () {
            fail_alert("哎呀呀，初始化信息失败...")
        }
    });
}

function selectBoard(id) {
    var nav = document.getElementById('board');
    var num = nav.childNodes.length;
    alert(num);
    for (num - 1; num >= 0; num--) {
        if (nav.childNodes.item(num) != null)
            nav.childNodes.item(num).style.color = "#2a4c70";
            // nav.childNodes.item(num).css({
            //     color: '#2a4c70',
            //     'text-shadow': '-0.1vmax 0.1vmax 0 lightgrey'
            // });
    }

    var item = document.getElementById(id);
    item.css({
        color: '#DABD61',
        'text-shadow': '-0.1vmax 0.1vmax 0 #7A6420'
    });
}