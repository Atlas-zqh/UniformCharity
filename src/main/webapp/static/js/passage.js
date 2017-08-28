/**
 * Created by island on 2017/8/28.
 */
function addPassage() {
    var title = $('#postTitle').val();
    var content = $('#postContent').val();
    // alert(title);
    $.ajax({
        url: "/passageAction/addPassage",
        type: "POST",
        dataType: "json",
        data: {
            "content": content,
            "title": title
        },
        async: false,
        success: function (data) {
            if (data.success == "true") {
                success_alert("发表文章成功!");
                $('#postTitle').val('');
                $('#postContent').val('');
                scrollToTop();
                return;
            }
            else {
                fail_alert("发表文章失败");
                return;
            }
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            fail_alert("哎呀，网络似乎不太好...");
        }
    });
}

function getPassages() {
    $.ajax({
        url: "/passageAction/findPassage",
        type: "GET",
        async: false,
        success: function (data) {
            if (data.success == "true") {
                alert(data.passages.size);
                $.each(data.passages, function(i, item) {
                    var scroll = document.getElementById('scroll1');

                    var li = document.createElement('li');
                    scroll.appendChild(li);
                    var a = document.createElement('a');
                    a.href = '../jsp/article.jsp?id=' + item.passage_id;

                    scroll.appendChild('<br>');
                    // fail_alert(i);
                });
                return;
            }
            else {
                fail_alert("获取文章失败");
                return;
            }
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            fail_alert("哎呀，网络似乎不太好...");
        }
    });

}

function getPassagesByID(id) {
    // alert(title);
    $.ajax({
        url: "/passageAction/addPassage",
        type: "POST",
        dataType: "json",
        data: {
            "id": id
        },
        async: false,
        success: function (data) {
            if (data.success == "true") {
                $('#title').val(data.passage.title);
                $('#time').val(data.time);
                $('#content').val(data.passage.content);
                return;
            }
            else {
                fail_alert("获得文章失败");
                return;
            }
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            fail_alert("哎呀，网络似乎不太好...");
        }
    });
}