/**
 * Created by island on 2017/8/9.
 */
function initNoteInfo(id, page){
    jQuery.ajax({
        type: 'POST',
        url: '/forumAction/getPostByID',
        data: {
            "id": id,
            "page": page
        },
        dataType: 'json',
        success: function (data) {
            // alert("success");
            if (data && data.success == "true") {
                $('#noteTitle').html(data.post.post_topic);
                addSingleNote(data.post_user.picurl, data.post_user.username, data.post_user.personID, data.post.post_content, data.post_time, '楼主');
                $.each(data.replies, function (i, item) {
                    addSingleNote(data.users[i].picurl, data.users[i].username, data.users[i].personID, item.reply_content, data.times[i], page*20 + i + 1 + '楼');
                });
            }
        },
        error: function () {
            fail_alert("哎呀呀，初始化信息失败...")
        }
    });
}

function addSingleNote(picUrl, username, uid, content, time, floor) {
    var note = document.createElement('div');
    note.className = 'singleNote';

    var userBlock = document.createElement('div');
    userBlock.className = 'userBlock';
    note.appendChild(userBlock);

    var img = document.createElement('img');
    img.src = picUrl;
    if (uid == getCookie('id')) {
        img.onclick = function () {
            window.open("../jsp/userInfo.jsp");
        };
    }
    else {
        img.onclick = function () {
            window.open("../jsp/friendInfo.jsp?id=" + uid);
        };
    }
    // img.href = "";
    img.style.cursor = 'pointer';
    userBlock.appendChild(img);

    var user_a = document.createElement('a');
    if (uid == getCookie('id')) {
        user_a.onclick = function () {
            window.open("../jsp/userInfo.jsp");
        };
    }
    else {
        user_a.onclick = function () {
            window.open("../jsp/friendInfo.jsp?id=" + uid);
        };
    }
    user_a.href = "";
    user_a.className = 'userP';
    user_a.appendChild(document.createTextNode(username));
    userBlock.appendChild(user_a);

    var contentBlock = document.createElement('div');
    contentBlock.className = 'contentBlock';
    note.appendChild(contentBlock);

    var content_p = document.createElement('p');
    content_p.className = 'contentP';
    content_p.appendChild(document.createTextNode(content));
    contentBlock.appendChild(content_p);

    var time_p = document.createElement('p');
    time_p.className = 'timeP';
    time_p.appendChild(document.createTextNode(time));
    contentBlock.appendChild(time_p);

    var floor_p = document.createElement('p');
    floor_p.className = 'floorP';
    floor_p.appendChild(document.createTextNode(floor));
    contentBlock.appendChild(floor_p);

    var noteContent = document.getElementById('noteContent');
    noteContent.appendChild(note);
}


function getMaxPage(id, page) {
    var max = 0;
    jQuery.ajax({
        type: 'POST',
        url: '/forumAction/getPostByID',
        data: {
            "id": id,
            "page": page
        },
        dataType: 'json',
        success: function (data) {
            // alert("success");
            if (data && data.success == "true") {
                max = data.maxPage;
            }
        },
        error: function () {
            fail_alert("哎呀呀，初始化信息失败...")
        }
    });
    return max;
}

function first() {
    var id = decodeURIComponent(getArgsFromHref(window.location.href, 'id'));
    var page = decodeURIComponent(getArgsFromHref(window.location.href, 'page'));
    if (page == 1) {
        fail_alert("当前已经是第一页！");
    } else {
        window.location.href = "../jsp/forum.jsp?page=1&id=" + id;
    }
}

function previous() {
    var id = decodeURIComponent(getArgsFromHref(window.location.href, 'id'));
    var page = decodeURIComponent(getArgsFromHref(window.location.href, 'page'));
    if (page > 1) {
        page = page - 1;
        window.location.href = "../jsp/forum.jsp?page=" + page + "&board=" + id;
    }
    else {
        fail_alert("当前已经是第一页！")
    }
}


function next() {
    var id = decodeURIComponent(getArgsFromHref(window.location.href, 'id'));
    var page = decodeURIComponent(getArgsFromHref(window.location.href, 'page'));
    var maxPage = getMaxPage(id, page);
    if (page < maxPage) {
        page = page + 1;
        window.location.href = "../jsp/forum.jsp?page=" + page + "&board=" + id;
    } else {
        fail_alert("当前已经是最后一页！")
    }
}

function last() {
    var id = decodeURIComponent(getArgsFromHref(window.location.href, 'id'));
    var page = decodeURIComponent(getArgsFromHref(window.location.href, 'page'));
    var maxPage = getMaxPage(id, page);
    if (page >= maxPage) {
        fail_alert("当前已经是最后一页！")
    } else {
        window.location.href = "../jsp/forum.jsp?page=" + page + "&board=" + id;
    }
}

function postReply() {
    var content = $('.postContent').val();
    alert(content);
    var id = getCookie("id");
    var pid = decodeURIComponent(getArgsFromHref(window.location.href, 'id'));
    jQuery.ajax({
        type: 'POST',
        url: '/forumAction/insertReply',
        data: {
            "id": pid,
            "uid": id,
            "content": content
        },
        dataType: 'json',
        success: function (data) {
            if (data && data.success == "true") {
                var maxPage = getMaxPage(pid, 1);
                window.location.href = "../jsp/noteDetails.jsp?page=" + maxPage +"&id=" + pid;
            }
        },
        error: function () {
            fail_alert("哎呀呀，初始化信息失败...")
        }
    });

}