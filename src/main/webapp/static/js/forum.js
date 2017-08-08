/**
 * Created by island on 2017/8/6.
 */
function initBoardNav(board) {
    jQuery.ajax({
        type: 'GET',
        contentType: 'application/json',
        url: '/forumAction/getAllBoards',
        dataType: 'json',
        success: function (data) {
            // alert("success");
            if (data && data.success == "true") {
                $.each(data.boards, function (i, item) {
                    var li = document.createElement("li");
                    var a = document.createElement("a");
                    a.appendChild(document.createTextNode(item.board_name));
                    a.id = item.board_id;
                    a.onclick = function () {
                        selectBoard(item.board_id);
                    };
                    li.appendChild(a);
                    document.getElementById('board').appendChild(li);
                    if (board == item.board_id) {
                        a.style.color = '#DABD61';
                        a.style.textShadow = '-0.1vmax 0.1vmax 0 #7A6420';
                    }
                    if (board == '') {
                        if (item.board_id == 1) {
                            a.style.color = '#DABD61';
                            a.style.textShadow = '-0.1vmax 0.1vmax 0 #7A6420';
                        }
                    }
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
    var as = nav.getElementsByTagName("a");
    var num = as.length;
    var i = 0;
    for (i = num - 1; i >= 0; i--) {
        if (as[i] != null) {
            as[i].style.color = "#2a4c70";
            as[i].style.textShadow = "-0.1vmax 0.1vmax 0 lightgrey";
        }
        // nav.childNodes.item(num).css({
        //     color: '#2a4c70',
        //     'text-shadow': '-0.1vmax 0.1vmax 0 lightgrey'
        // });
    }

    var item = document.getElementById(id);
    item.style.color = '#DABD61';
    item.style.textShadow = '-0.1vmax 0.1vmax 0 #7A6420';

    window.location.href = "../jsp/forum.jsp?page=1&board=" + id;
}

function initNotesArea(board, page) {
    // addSinglePost("a", "as", "as", "sa", "As", "sa");
    if (board == '') {
        board = 1;
    }
    if (page == '') {
        page = 1;
    }
    jQuery.ajax({
        type: 'POST',
        url: '/forumAction/getPostsByBoard',
        data: {
            "board": board,
            "page": page
        },
        dataType: 'json',
        success: function (data) {
            // alert("success");
            if (data && data.success == "true") {
                $.each(data.posts, function (i, item) {
                    addSinglePost(item.post_id, item.post_topic, item.post_commentcount, data.times[i], item.post_uid, data.users[i].username);
                    // addOption(id, item, item);
                    // fail_alert(i);
                });
            }
        },
        error: function () {
            fail_alert("哎呀呀，初始化信息失败...")
        }
    });
}


function addSinglePost(pid, topic, comment, time, uid, username) {
    var note = document.createElement('div');
    note.className = 'singleNote';
    note.id = pid;

    var topic_a = document.createElement('a');
    topic_a.target = '_blank';
    topic_a.className = 'titleP';
    topic_a.href = "../jsp/noteDetails.jsp?id=" + pid;
    topic_a.appendChild(document.createTextNode(topic));
    note.appendChild(topic_a);

    var user_a = document.createElement('a');
    user_a.target = '_blank';
    user_a.className = 'userP';
    //todo
    // a.href = "../jsp/noteDetails.jsp?id=" + pid;
    user_a.appendChild(document.createTextNode(username));
    note.appendChild(user_a);

    var time_p = document.createElement('p');
    time_p.className = 'timeP';
    time_p.appendChild(document.createTextNode(time));
    note.appendChild(time_p);

    var browse_img = document.createElement('img');
    browse_img.className = 'browseIcon';
    browse_img.src = '../static/images/browse.png';
    note.appendChild(browse_img);

    var browse_p = document.createElement('p');
    browse_p.className = 'browseP';
    browse_p.appendChild(document.createTextNode(comment));
    note.appendChild(browse_p);

    var comment_img = document.createElement('img');
    comment_img.className = 'commentIcon';
    comment_img.src = '../static/images/comments.png';
    note.appendChild(comment_img);

    var comment_p = document.createElement('p');
    comment_p.className = 'commentP';
    comment_p.appendChild(document.createTextNode(comment));
    note.appendChild(comment_p);


    document.getElementById('notesArea').appendChild(note);
    $('#' + pid).scrollspy({
        animation: 'fade'
    });
}

function postTopic() {
    var title = $('#postTitle').val();
    var content = $('#postContent').val();
    var id = getCookie("id");
    var board = decodeURIComponent(getArgsFromHref(window.location.href, 'board'));
    if (board == "")
        board = 1;
    jQuery.ajax({
        type: 'POST',
        url: '/forumAction/insertPost',
        data: {
            "board": board,
            "uid": id,
            "content": content,
            "title": title
        },
        dataType: 'json',
        success: function (data) {
            // alert("success");
            if (data && data.success == "true") {
                window.location.href = "../jsp/forum.jsp?page=1&board=" + board;
            }
        },
        error: function () {
            fail_alert("哎呀呀，初始化信息失败...")
        }
    });

}

function getMaxPage(board, page) {
    var max = 0;
    jQuery.ajax({
        type: 'POST',
        url: '/forumAction/getPostsByBoard',
        data: {
            "board": board,
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
    var board = decodeURIComponent(getArgsFromHref(window.location.href, 'board'));
    var page = decodeURIComponent(getArgsFromHref(window.location.href, 'page'));
    if (board == "")
        board = 1;
    if (page == "")
        page = 1;
    if (page == 1) {
        fail_alert("当前已经是第一页！");
    } else {
        window.location.href = "../jsp/forum.jsp?page=1&board=" + board;
    }
}

function previous() {
    var board = decodeURIComponent(getArgsFromHref(window.location.href, 'board'));
    var page = decodeURIComponent(getArgsFromHref(window.location.href, 'page'));
    if (board == "")
        board = 1;
    if (page == "")
        page = 1;
    if (page > 1) {
        page = page - 1;
        window.location.href = "../jsp/forum.jsp?page=" + page + "&board=" + board;
    }
    else {
        fail_alert("当前已经是第一页！")
    }
}


function next() {
    var board = decodeURIComponent(getArgsFromHref(window.location.href, 'board'));
    var page = decodeURIComponent(getArgsFromHref(window.location.href, 'page'));
    if (board == "")
        board = 1;
    if (page == "")
        page = 1;
    var maxPage = getMaxPage(board, page);
    if (page < maxPage) {
        page = page + 1;
        window.location.href = "../jsp/forum.jsp?page=" + page + "&board=" + board;
    } else {
        fail_alert("当前已经是最后一页！")
    }
}

function last() {
    var board = decodeURIComponent(getArgsFromHref(window.location.href, 'board'));
    var page = decodeURIComponent(getArgsFromHref(window.location.href, 'page'));
    if (board == "")
        board = 1;
    if (page == "")
        page = 1;
    var maxPage = getMaxPage(board, page);
    if (page >= maxPage) {
        fail_alert("当前已经是最后一页！")
    } else {
        window.location.href = "../jsp/forum.jsp?page=" + page + "&board=" + board;
    }
}