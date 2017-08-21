<%--
  Created by IntelliJ IDEA.
  User: island
  Date: 2017/8/21
  Time: 下午6:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>与子同袍-管理员主页</title>
    <link rel="stylesheet" href="../static/css/nav.css"/>
    <link rel="stylesheet" href="../static/css/alert.css"/>
    <link rel="stylesheet" href="../static/css/theme.css"/>
    <link rel="stylesheet" href="../static/css/manage.css"/>
</head>
<body>
<div class="topNavBar" id="preTop">
    <p class="navLabel" align="center">与 子 同 袍</p>
</div>
<div id="mainArea">
    <div id="headPart">
        <div id="navBar">
            <a href="#" id="addSchool" onclick="selectAddSchool()">添加学校</a>
            <a href="#" id="searchSchool" onclick="selectSearchSchool()">搜索学校</a>
            <a href="#" id="postArticle" onclick="selectPostArticle()">发布文章</a>
        </div>
    </div>
    <div id="bodyPart">
        <div id="loginView">
            <div id="loginContent">
                <h3 style="position:absolute; top: 2%; width: 100%; text-align: center;">用户名</h3>
                <input id="username" class="textInput" style="position: absolute; top: 20%; width: 40%; left: 30%;">
                <h3 style="position: absolute; top: 37%; width: 100%; text-align: center;">密码</h3>
                <input id="password" class="textInput" type="password"
                       style="position: relative; top: 55%; width: 40%; left: 30%;">
                <br>
                <button id="loginBut" class="mybt" onclick="managerLogin()"
                        style="width: 20%; font-size: 1.5vmax; position: relative; left: 40%; top: 70%;">登 录
                </button>
            </div>
        </div>
    </div>
</div>
<div class="foot">
    <p class="navLabel" align="center" style="width: 100%; text-align: center; margin: 0;">与子同袍项目组
        copyright@2017</p>
</div>
</body>
<script type="text/javascript" src="../static/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="../static/js/alert.js"></script>
<script type="text/javascript" src="../static/js/login.js"></script>
<script type="text/javascript" src="../static/js/manager.js"></script>
</html>
