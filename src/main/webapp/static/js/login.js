var gender = "";

function login() {
    delCookie("username");
    var username = $('#username').val();
    var password = $('#password').val();

    // alert(username);
    // alert(password);

    if (username == "" || password == "") {
        fail_alert("请输入完整信息");
        return;
    }

    $.ajax({
        url: "/userAction/userLogin",
        type: "POST",
        dataType: "json",
        data: {
            "username": username,
            "password": password
        },
        async: false,
        success: function (data) {
            if (data.result == "success") {
                success_alert("登陆成功!");
                document.getElementById("preLogInLeft").style.display = "none";
                document.getElementById("afterLogInLeft").style.display = "inline-block";
                document.getElementById("afterLogInRight").style.display = "inline-block";
                document.getElementById("beforeLogInRight").style.display = "none";
                document.getElementById("preTop").style.display = "none";
                document.getElementById("afterTop").style.display = "inline-block";
                var tmp = data.userInfo.username;
                var name = "";
                for (var i = 0; i < tmp.length; i++) {
                    name = name + (tmp.charAt(i)) + "<br>";
                }
                $('#userName').html(tmp);
                $('#iconImage').attr("src", data.userInfo.picurl);
                $('#loginPanel').css("display", "none");
                $('#searchPanel').fadeIn();
                setCookie("username", data.userInfo.username, "h1");
                setCookie("picurl", data.userInfo.picurl, "h1");
                setCookie("id", data.userInfo.personID, "h1");
                return;
            }
            if (data.result == "fail") {
                fail_alert(data.loginInfo);
                return;
            }
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            fail_alert("哎呀，网络似乎不太好...");
        }
    });
}


function quitLog() {
    delCookie("username");
    delCookie("picurl");
    delCookie("id");
    document.getElementById("preLogInLeft").style.display = "inline-block";
    document.getElementById("afterLogInLeft").style.display = "none";
    document.getElementById("afterLogInRight").style.display = "none";
    document.getElementById("beforeLogInRight").style.display = "inline-block";
    document.getElementById("preTop").style.display = "inline-block";
    document.getElementById("afterTop").style.display = "none";
    $('#searchPanel').css("display", "none");
    $('#loginPanel').fadeIn();
    $('#username').val("");
    $('#password').val("");

}

$('#maleBut').click(function () {
    gender = "男";
    $("#maleBut").css("color", "#142535");
    $("#maleBut").css("text-shadow", "-0.1vmax 0.1vmax 0 lightgrey");
    $("#femaleBut").css("color", "white");
    $("#femaleBut").css("text-shadow", "-0.1vmax 0.1vmax 0 grey");
    if ($("#icon").attr('src') == "../images/femaleIcon.png")
        $("#icon").attr('src', "../images/maleIcon.png")
});

$('#femaleBut').click(function () {
    gender = "女";
    $("#maleBut").css("color", "white");
    $("#maleBut").css("text-shadow", "-0.1vmax 0.1vmax 0 grey");
    $("#femaleBut").css("color", "#142535");
    $("#femaleBut").css("text-shadow", "-0.1vmax 0.1vmax 0 lightgrey");
    if ($("#icon").attr('src') == "../images/maleIcon.png")
        $("#icon").attr('src', "../images/femaleIcon.png")
});


function signup() {
    var username = $('#usernameTextField').val();
    var password = $('#passwordTextField').val();
    var id = $('#idTextField').val();
    var studentname = $('#studentnameTextField').val();
    var school = $('#schoolDrop option:selected').text();
    var phone = $('#phoneTextField').val();
    var image = $('#icon').attr("src");
    var GradeAndClass = $('#GradeAndClass').text();

    var sgrade = GradeAndClass.split(' ')[0];
    var sclass = GradeAndClass.split(' ')[1];

    // var gender = "";
    // alert($("#femaleBut").attr("color"));
    // if ($("#femaleBut").attr("color") == "#142535")
    //     gender = "female";
    // if ($("#maleBut").attr("color") == "#142535")
    //     gender = "male";

    // alert(username);
    // alert(password);

    // alert(gender);

    if (username == "" || password == "" || id == "" || studentname == "" || school == "" || phone == "" || gender == "") {
        fail_alert("请输入完整信息");
        return;
    }

    var reg = /(^\d{16}$)|(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/;
    if (reg.test(id) == false) {
        fail_alert("身份信息输入不合法! 请输入身份证或学籍号！");
        return;
    }

    var myreg = /^(((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1}))+\d{8})$/;
    if (!myreg.test(phone) || phone.length != 11) {
        fail_alert('请输入有效的手机号码！');
        return;
    }

    if (!image.startsWith("data:image/png;base64,")) {
        // alert(image);
    } else {
        image = image.replace(/\+/g, "%2B");
        // image = image.replace(/ /g, "%20");
        // image = image.replace(/\//g, "%2F");
        // image = image.replace(/\?/g, "%3F");
        // image = image.replace(/%/g, "%25");
        // image = image.replace(/#/g, "%23");
        // image = image.replace(/&/g, "%26");
        // image = image.replace(/=/g, "%3D");
        image = image.split(',')[1];

    }
    // alert(image);
    $.ajax({
        url: "/userAction/userSignUp",
        type: "POST",
        dataType: "json",
        data: {
            "username": username,
            "password": password,
            "id": id,
            "studentname": studentname,
            "school": school,
            "phone": phone,
            "gender": gender,
            "image": image,
            "grade": sgrade,
            "class": sclass
        },
        async: false,
        success: function (data) {
            if (data.result == "fail") {
                fail_alert(data.errorType);
            }
            if (data.result == "success") {
                success_alert("注册成功");
                showLoginPanel();
            }
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            fail_alert("哎呀，网络似乎不太好...");
        }
    });
}

function dataURItoBlob(base64Data) {
    var byteString;
    if (base64Data.split(',')[0].indexOf('base64') >= 0)
        byteString = atob(base64Data.split(',')[1]);
    else
        byteString = unescape(base64Data.split(',')[1]);
    var mimeString = base64Data.split(',')[0].split(':')[1].split(';')[0];
    var ia = new Uint8Array(byteString.length);
    for (var i = 0; i < byteString.length; i++) {
        ia[i] = byteString.charCodeAt(i);
    }
    return new Blob([ia], {type: mimeString});
}

function showLoginPanel() {
    document.getElementById("signupPanel").style.display = "none";
    $("#loginPanel").fadeIn(2000);
}

function showSignupPanel() {
    document.getElementById("loginPanel").style.display = "none";
    $("#signupPanel").fadeIn(2000);
}

function managerLogin() {
    var username = $('#username').val();
    var password = $('#password').val();
    //todo 登陆
    $('#loginView').css("display", "none");
    selectSearchSchool();

//     var url = "http://app.cet.edu.cn:7066/baas/app/setuser.do?method=UserVerify";
//     var ks_data = {
//         "ks_xm": "钱柯宇",
//     "ks_sfz": "320522199702145011",
//     "jb": 2
// };
//     var postdata = {
//         "action": "",
//         "params": JSON.stringify(ks_data)
//     };
//     $.post(url = url, data = postdata, callback = function(data) {
//         data = $.parseJSON(data)
//         console.log(data["ks_bh"]);
//     });
}
