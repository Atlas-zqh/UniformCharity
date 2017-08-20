<%--
  Created by IntelliJ IDEA.
  User: island
  Date: 2017/8/19
  Time: 下午10:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="nav.jsp" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>与子同袍-用户资料</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="viewport" content="height=device-height, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="../static/css/friendInfo.css">
    <link rel="stylesheet" type="text/css" href="../static/css/theme.css">
    <link rel="stylesheet" type="text/css" href="../static/css/alert.css">
    <script type="text/javascript" src="../static/js/jquery-3.2.1.min.js"></script>
    <script>
        $(document).ready(function () {
            checkCookie();
            var id = getArgsFromHref(window.location.href, "id");
            $.ajax({
                url: "/userAction/getUserByID",
                type: "POST",
                dataType: "json",
                data: {
                    "id": id
                },
                async: false,
                success: function (data) {
                    if (data.success == "true") {
                        $('#icon').attr('src', data.user.picurl);
                        $('#username').val(data.user.username);
                        $('#name').val(data.user.realName);
                        $('#gender').val(data.user.gender);
                        $('#school').val(data.user.school);
                        $('#class').val(data.user.sgrade + ' ' + data.user.sclass);
                        $('#score').val(data.user.credits);

                        return;
                    }else{
                        fail_alert("哎呀，获取信息失败...");
                    }
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    fail_alert("哎呀，网络似乎不太好...");
                }
            });
        });
    </script>
</head>
<body>
<div id="contentArea">
    <div id="mainPart">
        <h1>用户资料</h1>
        <div id="infoPart">
            <img src="../static/images/maleIcon.png" id="icon">
            <div id="infoArea">
                <h4 style="position: absolute; top: 2%;">用户名</h4>
                <input class="textInput" disabled style="position: absolute; top: 2%; left: 30%; width: 70%" id="username">
                <h4 style="position: absolute; top: 20%;">姓名</h4>
                <input class="textInput" disabled style="position: absolute; top: 20%; left: 30%; width: 70%" id="name">
                <h4 style="position: absolute; top: 38%;">性别</h4>
                <input class="textInput" disabled style="position: absolute; top: 38%; left: 30%; width: 70%" id="gender">
                <h4 style="position: absolute; top: 56%;">学校</h4>
                <input class="textInput" disabled style="position: absolute; top: 56%; left: 30%; width: 70%" id="school">
                <h4 style="position: absolute; top: 74%;">班级</h4>
                <input class="textInput" disabled style="position: absolute; top: 74%; left: 30%; width: 70%" id="class">
                <h4 style="position: absolute; top: 92%;">公益积分</h4>
                <input class="textInput" disabled style="position: absolute; top: 92%; left: 30%; width: 70%" id="score">
            </div>

        </div>
    </div>
</div>
<div class="foot">
    <p class="navLabel" align="center" style="position: absolute; top:97.2%; text-align: center">与子同袍项目组
        copyright@2017</p>
</div>

<script type="text/javascript" src="../static/js/cookie.js" charset="utf-8"></script>
<script type="text/javascript" src="../static/js/util.js" charset="utf-8"></script>
<script type="text/javascript" src="../static/js/alert.js" charset="utf-8"></script>
</body>
</html>