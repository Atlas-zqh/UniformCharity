// $(document).ready(function () {
//     checkCookie();
//
//     getAllSchool('schoolDrop');
// });

function showGradeAndClassPane() {
    if ($('#schoolDrop option:selected').text() == "") {
        fail_alert("请先选择学校！");
    }
    else {
        $('#my-popup').modal('open');
        getAllGrades('gradeDrop');
        clearSelectList('classDrop');

    }
}
function getGradeAndClass() {
    var gradeNum = $('#gradeDrop option:selected').val();
    var classNum = $('#classDrop option:selected').val();
    if (gradeNum == 'null' || classNum == 'null') {
        fail_alert('请选择完整信息');
    } else {
        $('#my-popup').modal('close');
        $('#GradeAndClass').text(gradeNum + " " + classNum);
    }
}

function getAllGrades(id) {
    var school = $('#schoolDrop option:selected').text();
    if (school == "") {
        school = $('#schoolLabel').val();
    }
    clearSelectList(id);
    jQuery.ajax({
        type: 'POST',
        url: '/schoolAction/allGradesOfSchool',
        data: {
            "school": school
        },
        dataType: 'json',
        success: function (data) {
            // alert("success");
            if (data && data.success == "true") {
                addOption(id, "null", "");
                $.each(data.grades, function (i, item) {
                    addOption(id, item, item);
                    // fail_alert(i);
                });
            }
        },
        error: function () {
            fail_alert("哎呀呀，初始化信息失败...")
        }
    });
}

function getAllClass(id) {
    var school = $('#schoolDrop option:selected').text();
    var grade = $('#gradeDrop option:selected').text();
    if (school == "") {
        school = $('#schoolLabel').val();
    }
    clearSelectList(id);
    jQuery.ajax({
        type: 'POST',
        url: '/schoolAction/allClassesOfGrade',
        data: {
            "school": school,
            "grade": grade
        },
        dataType: 'json',
        success: function (data) {
            // alert("success");
            if (data && data.success == "true") {
                addOption(id, "null", "");
                $.each(data.classes, function (i, item) {
                    addOption(id, item, item);
                    // fail_alert(i);
                });
            }
        },
        error: function () {
            fail_alert("哎呀呀，初始化信息失败...")
        }
    });
}

function getAllTransaction() {
    $.ajax({
        url: "/orderAction/getAllTransactions",
        type: "GET",
        async: false,
        success: function (data) {
            if (data.success == "true") {
                $.each(data.transactions, function (i, item) {
                    var scroll = document.getElementById('scroll4');

                    var li = document.createElement('li');
                    scroll.appendChild(li);
                    var p = document.createElement('p');
                    p.appendChild(document.createTextNode(item));
                    li.appendChild(p);

                    var br = document.createElement("div");
                    br.innerHTML = "<br>";
                    scroll.appendChild(br);

                    var area2 = document.getElementById('scroll3');
                    var cont21 = document.getElementById('scroll4');
                    var cont22 = document.getElementById('scroll5');

// area.scrollTop = 0;
                    area2.scrollTop = 0;
// 克隆cont1给cont2
                    cont22.innerHTML = cont21.innerHTML;

                    // scroll.appendChild('<br>');
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

function getPosts() {
    $.ajax({
        url: "/forumAction/getNewestPosts",
        type: "GET",
        async: false,
        success: function (data) {
            if (data.success == "true") {
                $.each(data.posts, function (i, item) {
                    var table = document.getElementById('postTable');

                    var tr = document.createElement('tr');
                    tr.class = 'bodyTr';
                    table.appendChild(tr);

                    var td1 = document.createElement('td');
                    td1.width = '70%';
                    table.appendChild(td1);

                    var a = document.createElement('a');
                    a.onclick = function () {
                        window.open('../jsp/article.jsp?id=' + item.post_id);
                    };
                    a.appendChild(document.createTextNode(item.post_topic));
                    td1.appendChild(a);

                    var td2 = document.createElement('td');
                    td2.width = '15%';
                    table.appendChild(td2);
                    var user = document.createElement('a');
                    user.onclick = function () {
                        window.open('../jsp/friendInfo.jsp?id=' + item.post_uid);
                    };
                    user.appendChild(document.createTextNode(data.users[i]));
                    td2.appendChild(user);

                    var td3 = document.createElement('td');
                    td3.width = '15%';
                    td3.style.color = '#ffffff';
                    table.appendChild(td3);
                    td3.appendChild(document.createTextNode(item.post_commentcount));
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