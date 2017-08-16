/**
 * Created by island on 2017/7/25.
 */
function showInfoContent(){
    $('#infoContent').css("display", "inline-block");
    $('#freindContent').css("display", "none");
    $('#publicContent').css("display", "none");

    var username = getCookie('username');
    // alert(username);
    $.ajax({
        url: "/userAction/getUser",
        type: "POST",
        dataType: "json",
        data: {
            "username": username
        },
        async: false,
        success: function (data) {
            if (data.success == "true") {
                // success_alert(data.user.username);
                $('#usernameLabel').val(data.user.username);
                $('#nameLabel').val(data.user.realName);
                $('#idLabel').val(data.user.personID);
                $('#wechatLabel').val(data.user.wechatID);
                $('#phoneLabel').val(data.user.phone);
                $('#schoolLabel').val(data.user.school);
                $('#classLabel').val(data.user.sgrade + " " + data.user.sclass);
                $('#iconLabel').css("background-image", "url(" + data.user.picurl + ")");
                if (data.user.gender == '男'){
                    $('#genderImage').css("background-image", "url(../images/male.png)");
                } else {
                    $('#genderImage').css("background-image", "url(../images/female.png)");
                }
                return;
            }else{
                fail_alert("哎呀，获取信息失败...");
            }
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            fail_alert("哎呀，网络似乎不太好...");
        }
    });

    // <img style="top: 24.5%; left: 4%;">
}

function showFriendContent(){
    $('#freindContent').css("display", "inline-block");
    $('#infoContent').css("display", "none");
    $('#publicContent').css("display", "none");
}

function showPublicContent(){
    $('#publicContent').css("display", "inline-block");
    $('#freindContent').css("display", "none");
    $('#infoContent').css("display", "none");

    $('#score').html($('#briefScore').html());
    getCreditRecord(1);
    initMenu(getMaxCreditPage(), 'creditMenu', 1);
}

function getInfo() {
    var username = getCookie('username');
    // alert(username);
    $.ajax({
        url: "/userAction/getUser",
        type: "POST",
        dataType: "json",
        data: {
            "username": username
        },
        async: false,
        success: function (data) {
            if (data.success == "true") {
                // success_alert(data.user.username);
                $('#briefSchool').html(data.user.school);
                $('#briefUser').html(data.user.username);
                $('#briefName').html(data.user.realName);
                $('#briefScore').html(data.user.credits + '分');
                if(data.user.gender == "男"){
                    $('#briefGender').css("background-image", "url(/static/images/male.png)");
                }else{
                    $('#briefGender').css("background-image", "url(/static/images/female.png)");
                }
                return;
            }else{
                fail_alert("哎呀，获取信息失败...");
            }
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            fail_alert("哎呀，网络似乎不太好...");
        }
    });

    showInfoContent();
}

function changePassword() {
    var oldPassword = $('#originalPassword').val();
    var newPassword1 = $('#newPassword1').val();
    var newPassword2 = $('#newPassword2').val();
    var id = $('#idLabel').val();

    if(newPassword1 != newPassword2){
        fail_alert("哎呀，两次输入的密码不一致！");
    }else{
        $.ajax({
            url: "/userAction/modifyPassword",
            type: "POST",
            dataType: "json",
            data: {
                "id": id,
                "oldPassword": oldPassword,
                "newPassword": newPassword1
            },
            async: false,
            success: function (data) {
                if (data.success == "true") {
                    window.location.href = '../jsp/index.jsp';
                    success_alert("修改密码成功！请重新登录。");
                    quitLog();
                }else{
                    fail_alert("原密码输入错误！");
                }
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                fail_alert("哎呀，网络似乎不太好...");
            }
        });
    }
}

function openSchoolModify() {
    $('#school-popup').modal('open');
    clearSelectList('schoolDrop');
    // getAllSchool('schoolDrop');
    var school = $('#schoolLabel').val();

    jQuery.ajax( {
        type : 'GET',
        contentType : 'application/json',
        url : '/schoolAction/allSchool',
        dataType : 'json',
        success : function(data) {
            // alert("success");
            if (data && data.success == "true") {
                addOption('schoolDrop', "null", "");
                $.each(data.schools, function(i, item) {
                    addOption('schoolDrop', item, item);
                });
                setSelected('schoolDrop', school);
            }
        },
        error : function() {
            fail_alert("哎呀呀，初始化信息失败...")
        }
    });


    var sgrade = $('#classLabel').val().split(' ')[0];
    var sclass = $('#classLabel').val().split(' ')[1];

    clearSelectList('gradeDrop');
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
                addOption('gradeDrop', "null", "");
                $.each(data.grades, function (i, item) {
                    addOption('gradeDrop', item, item);
                    // fail_alert(i);
                });
                setSelected('gradeDrop', sgrade);
            }
        },
        error: function () {
            fail_alert("哎呀呀，初始化信息失败...")
        }
    });
    // getAllGrades('gradeDrop');

    clearSelectList('classDrop');
    jQuery.ajax({
        type: 'POST',
        url: '/schoolAction/allClassesOfGrade',
        data: {
            "school": school,
            "grade": sgrade
        },
        dataType: 'json',
        success: function (data) {
            // alert("success");
            if (data && data.success == "true") {
                addOption('classDrop', "null", "");
                $.each(data.classes, function (i, item) {
                    addOption('classDrop', item, item);
                    // fail_alert(i);
                });
                setSelected('classDrop', sclass);
            }
        },
        error: function () {
            fail_alert("哎呀呀，初始化信息失败...")
        }
    });
}

function modifySchool() {
    var school = $('#schoolDrop option:selected').text();
    var sgrade = $('#gradeDrop option:selected').text();
    var sclass = $('#classDrop option:selected').text();
    var id = $('#idLabel').val();
    if(school == 'null' || sgrade == 'null' || sclass == 'null'){
        fail_alert("请选择完整信息！")
    }else {
        jQuery.ajax({
            type: 'POST',
            url: '/userAction/modifyClass',
            data: {
                "school": school,
                "grade": sgrade,
                "class": sclass,
                "id": id
            },
            dataType: 'json',
            success: function (data) {
                // alert("success");
                if (data && data.success == "true") {
                    // var href = window.location.href;
                    // window.location.href = href;
                    $('#school-popup').modal('close');
                    window.location.href = "../jsp/userInfo.jsp";
                    success_alert("修改成功！");
                }else{
                    fail_alert("哎呀呀，修改失败...请稍后再试");
                }
            },
            error: function () {
                fail_alert("哎呀呀，修改失败...请稍后再试")
            }
        });
    }
}
