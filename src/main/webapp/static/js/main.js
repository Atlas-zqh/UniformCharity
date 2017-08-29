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
    if (school == ""){
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
    if (school == ""){
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
                $.each(data.transactions, function(i, item) {
                    var scroll = document.getElementById('scroll4');

                    var li = document.createElement('li');
                    scroll.appendChild(li);
                    var p = document.createElement('p');
                    p.createTextNode(item);
                    li.appendChild(p);
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

