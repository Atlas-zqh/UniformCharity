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

function selectBoard() {

}