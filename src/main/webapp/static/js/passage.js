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
                // alert(data.passages.size);
                $.each(data.passages, function(i, item) {
                    var scroll = document.getElementById('scroll1');

                    var li = document.createElement('li');
                    scroll.appendChild(li);
                    var a = document.createElement('a');
                    a.onclick = function () {
                        window.open('../jsp/article.jsp?id=' + item.passage_id);
                    };
                    li.appendChild(a);
                    a.appendChild(document.createTextNode(item.ptitle));

                    var br = document.createElement("div");
                    br.innerHTML = "<br>";
                    scroll.appendChild(br);

                    var area1 = document.getElementById('scroll');
                    var cont11 = document.getElementById('scroll1');
                    var cont12 = document.getElementById('scroll2');

// area.scrollTop = 0;
                    area1.scrollTop = 0;
// 克隆cont1给cont2
                    cont12.innerHTML = cont11.innerHTML;
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
    $.ajax({
        url: "/passageAction/findPassageByID",
        type: "POST",
        dataType: "json",
        data: {
            "id": id
        },
        async: false,
        success: function (data) {
            if (data.success == "true") {
                $('#title').html(data.passages.ptitle);
                $('#time').html(data.time);
                $('#content').html(data.passages.pcontent);
                return;
            }
            else {
                fail_alert("获得文章失败...");
                return;
            }
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            fail_alert("哎呀，网络似乎不太好...");
        }
    });
}