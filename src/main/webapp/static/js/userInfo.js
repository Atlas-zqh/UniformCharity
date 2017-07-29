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
                $('#iconLabel').css("background-image", "url(" + data.user.picurl + ")");

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

    if(newPassword1 != newPassword2){
        fail_alert("哎呀，两次输入的密码不一致！");
    }else{
        $.ajax({
            url: "/userAction/modifyPassword",
            type: "POST",
            dataType: "json",
            data: {
                "username": getCookie("username"),
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
