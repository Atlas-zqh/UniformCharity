<%--
  Created by IntelliJ IDEA.
  User: island
  Date: 5/27/17
  Time: 11:11 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="nav.jsp" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="stylesheet" href="../static/css/theme.css"/>
    <link rel="stylesheet" href="../static/css/userInfo.css"/>
    <link rel="stylesheet" type="text/css" href="http://cdn.amazeui.org/amazeui/2.7.2/css/amazeui.css">
    <link rel="stylesheet" type="text/css" href="http://cdn.amazeui.org/amazeui/2.7.2/css/amazeui.min.css">
    <link rel="stylesheet" href="../static/css/custom_up_img.css">
    <script type="text/javascript" src="../static/js/jquery-3.2.1.min.js"></script>
    <title>我的主页</title>
</head>
<body>
<div id="pageBackground"></div>
<div id="userPage">
    <div id="infoBlock" class="briefInfoBlock" style="margin-top: 5%;">
        <p class="titleP">个 人 信 息</p>
        <button class="iconButton"
                style="background-image: url(/static/images/maleIcon.png); margin-top: 25%; margin-left: 2%;"></button>
        <p class="nameP" id="username" style="margin-top: 25%; margin-left: 15%;">X X X</p>
        <button class="genderButton"
                style="background-image: url(/static/images/male.png); margin-top: 31%; margin-left: 8%; background-color: #ffffff"></button>
        <p class="labelP" style="margin-left: 2%; margin-top: 40%">姓 名:</p>
        <p class="contentP" style="margin-left: 23%; margin-top: 43%">XXX</p>
        <p class="labelP" style="margin-left: 2%; margin-top: 55%">学 校:</p>
        <p class="contentP" style="margin-left: 23%; margin-top: 58%">XXX</p>
        <a href="#" style="margin-top: 67%; margin-left: 70%">查 看 详 情 ></a>

        <!--<a href="404.html" class="iconButton" style="background-image: url(/images/infoBG.png)">aaa</a>-->
    </div>
    <div id="friendBlock" class="briefInfoBlock" style="margin-top: 22%;">
        <p class="titleP">好 友 信 息</p>
        <div id="friend1">
            <button class="iconButton"
                    style="background-image: url(/static/images/maleIcon.png); margin-top: 25%; margin-left: 2%;"></button>
            <a href="" class="labelP" id="username1" style="margin-top: 25%; margin-left: 15%;">X X X</a>
            <button class="genderButton"
                    style="background-image: url(/static/images/male.png); margin-top: 31%; margin-left: 8%; background-color: #ffffff"></button>
        </div>
        <div id="friend2">
            <button class="iconButton"
                    style="background-image: url(/static/images/maleIcon.png); margin-top: 40%; margin-left: 2%;"></button>
            <a href="" class="labelP" id="username2" style="margin-top: 40%; margin-left: 15%;">X X X</a>
            <button class="genderButton"
                    style="background-image: url(/static/images/male.png); margin-top: 46%; margin-left: 8%; background-color: #ffffff"></button>
        </div>
        <div id="friend3">
            <button class="iconButton"
                    style="background-image: url(/static/images/maleIcon.png); margin-top: 55%; margin-left: 2%;"></button>
            <a href="" class="labelP" id="username3" style="margin-top: 55%; margin-left: 15%;">X X X</a>
            <button class="genderButton"
                    style="background-image: url(/static/images/male.png); margin-top: 61%; margin-left: 8%; background-color: #ffffff"></button>
        </div>
        <a href="#" style="margin-top: 67%; margin-left: 70%">查 看 更 多 ></a>

    </div>
    <div id="" class="briefInfoBlock" style="margin-top: 39%;">
        <p class="titleP">公 益 信 息</p>
        <p class="labelP" style="margin-top: 20%; margin-left: 2%;">积 分:</p>
        <p class="contentP" style="margin-left: 23%; margin-top: 23%">X X X</p>
        <p class="labelP" style="margin-top: 35%; margin-left: 2%;">最 新 记 录:</p>
        <p class="contentP" style="margin-left: 2%; margin-top: 50%">xxxxxxxxxxxxxxxxxxx</p>
        <a href="#" style="margin-top: 67%; margin-left: 70%">查 看 更 多 ></a>
    </div>

    <div id="infoContent" class="contentBlock" style="display: none">
        <p class="titleP">个 人 信 息</p>
        <button class="genderButton"
                style="background-image: url(/static/images/maleIcon.png); margin-top: 12%; margin-left: 66%; width: 30%; padding-top: 30%;"></button>
        <p class="labelP" style="margin-left: 5%; margin-top: 12%">用 户 名:</p>
        <input class="contentP" id="usernameLabel" style="margin-left: 17%; margin-top: 13%" value="哈哈哈哈" disabled>
        <img style="margin-top: 24.5%; margin-left: 4%;">
        <p class="labelP" style="margin-left: 8.5%; margin-top: 24%">姓 名:</p>
        <input class="contentP" id="nameLabel" style="margin-left: 17%; margin-top: 25%" value="哈哈哈哈" disabled>

        <p class="labelP" style="margin-left: 5%; margin-top: 36%">身 份 证:</p>
        <input class="contentP" id="idLabel" style="margin-left: 17%; margin-top: 37%" value="哈哈哈哈" disabled>

        <p class="labelP" style="margin-left: 5%; margin-top: 48%">微 信 号:</p>
        <input class="contentP" id="wechatLabel" style="margin-left: 17%; margin-top: 49%" value="哈哈哈哈" disabled>
        <a href="" style="position:absolute; text-decoration: underline; margin-top: 48.8%; margin-left: 45%">修改</a>
        <p class="labelP" style="margin-left: 5%; margin-top: 60%">手 机 号:</p>
        <input class="contentP" id="phoneLabel" style="margin-left: 17%; margin-top: 61%" value="哈哈哈哈" disabled>
        <a href="" style="position:absolute; text-decoration: underline; margin-top: 60.8%; margin-left: 45%">修改</a>
        <p class="labelP" style="margin-left: 5%; margin-top: 72%">学 校:</p>
        <input class="contentP" id="schoolLabel" style="margin-left: 14%; margin-top: 73%" value="哈哈哈哈" disabled>
        <a href="" style="position:absolute; text-decoration: underline; margin-top: 72.8%; margin-left: 42%">修改</a>
        <p class="labelP" style="margin-left: 5%; margin-top: 84%">密 码:</p>
        <input class="contentP" id="passwordLabel" style="margin-left: 14%; margin-top: 85%" value="******" disabled>
        <a href="" style="position:absolute; text-decoration: underline; margin-top: 84.8%; margin-left: 42%">修改</a>
        <!--<div class="up-img-cover" id="up-img-touch">-->
        <!--<img src="../images/FundBulletin.png" class="iconImage" id="icon" alt="点击图片上传"-->
        <!--data-am-popover="{content: '点击上传', trigger: 'hover focus'}">-->
        <!--</div>-->

        <div id="modifyPasswordArea" style="display: none">
            <p class="titleP">修 改 密 码</p>
            <p class="labelP" style="margin-left: 25%; margin-top: 20%">输 入 原 密 码</p>
            <input class="contentP" id="originalPassword" style="margin-left: 20%; margin-top: 35%; width: 60%">
            <p class="labelP" style="margin-left: 25%; margin-top: 50%">输 入 新 密 码</p>
            <input class="contentP" id="newPassword1" style="margin-left: 20%; margin-top: 65%; width: 60%">
            <p class="labelP" style="margin-left: 25%; margin-top: 80%">确 认 新 密 码</p>
            <input class="contentP" id="newPassword2" style="margin-left: 20%; margin-top: 95%; width: 60%">

            <button class="mybt" style="width: 20%; font-size: 1vmax; margin-left: 40%; margin-top: 107%; border-width: medium">修 改</button>
        </div>
    </div>
    <div id="freindContent" class="contentBlock" style="display: none">
        <p class="titleP">好 友 列 表</p>
        <div class="singlePerson">
            <img src="/static/images/maleIcon.png">
            <a>哈哈</a>
            <p>哈哈</p>
            <button>访 问 主 页</button>
        </div>
    </div>
    <div id="publicContent" class="contentBlock">
        <p class="titleP">公 益 信 息</p>
        <p class="subtitle">666分</p>
        <div class="singleRecord">
            <p class="labelP" style="margin-top: 0%; margin-left: 5%;">获得积分数量:</p>
            <p class="labelP" style="margin-top: 0%; margin-left: 55%;">当前积分:</p>
            <p class="labelP" style="margin-top: 7%; margin-left: 5%;">获得积分方式:</p>
            <p class="labelP" style="margin-top: 7%; margin-left: 55%;">衣服编号:</p>

        </div>
    </div>
</div>
<script type="text/javascript" src="http://cdn.amazeui.org/amazeui/2.7.2/js/amazeui.js" charset="utf-8"></script>

</body>

</html>
