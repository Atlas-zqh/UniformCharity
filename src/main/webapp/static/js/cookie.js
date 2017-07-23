/**
 * Created by island on 2017/7/16.
 */
var username = document.cookie.split(";")[0].split("=")[1];
//JS操作cookies方法
function setCookie(name, value) {
    var Days = 30;
    var exp = new Date();
    exp.setTime(exp.getTime() + Days * 24 * 60 * 60 * 1000);
    document.cookie = name + "=" + escape(value) + ";expires=" + exp.toGMTString();
}

function getCookie(name) {
    var arr, reg = new RegExp("(^| )" + name + "=([^;]*)(;|$)");
    if (arr = document.cookie.match(reg))
        return unescape(arr[2]);
    else
        return null;
}

function delCookie(name) {
    var exp = new Date();
    exp.setTime(exp.getTime() - 1);
    var cval = getCookie(name);
    if (cval != null)
        document.cookie = name + "=" + cval + ";expires=" + exp.toGMTString();
}

//如果需要设定自定义过期时间
//s秒 h小时 d天数
function setCookie(name, value, time) {
    var strsec = getsec(time);
    var exp = new Date();
    exp.setTime(exp.getTime() + strsec * 1);
    document.cookie = name + "=" + escape(value) + ";expires=" + exp.toGMTString();
}
function getsec(str) {
    // alert(str);
    var str1 = str.substring(1, str.length) * 1;
    var str2 = str.substring(0, 1);
    if (str2 == "s") {
        return str1 * 1000;
    }
    else if (str2 == "h") {
        return str1 * 60 * 60 * 1000;
    }
    else if (str2 == "d") {
        return str1 * 24 * 60 * 60 * 1000;
    }
}

function checkCookie() {
    var username = getCookie('username');
    var picurl = getCookie('picurl');
    // alert(username);
    // alert(picurl);
    if (username != null && username != "" && picurl != null && picurl != "") {
        document.getElementById("preLogIn").style.display = "none";
        document.getElementById("afterLogIn").style.display = "inline-block";
        var tmp = username;
        var name = "";
        for (var i = 0; i < tmp.length; i++) {
            name = name + (tmp.charAt(i)) + "<br>";
        }
        $('#userName').html(name);
        $('#iconImage').attr("src", picurl);
        $('#loginPanel').css("display", "none");
        $('#searchPanel').fadeIn();
        return true;
    }else{
        document.getElementById("preLogIn").style.display = "inline-block";
        document.getElementById("afterLogIn").style.display = "none";
        return false;
    }

}
