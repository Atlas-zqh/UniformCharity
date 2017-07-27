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
    <%--<link rel="stylesheet" type="text/css" href="../static/css/amazeui.min.css">--%>
    <link rel="stylesheet" type="text/css" href="../static/css/amazeui.cropper.css">
    <link rel="stylesheet" type="text/css" href="../static/css/amazeui.css">
    <link rel="stylesheet" href="../static/css/theme.css"/>
    <link rel="stylesheet" href="../static/css/custom_up_img.css">
    <link rel="stylesheet" href="../static/css/userInfo.css"/>
    <link rel="stylesheet" href="../static/css/alert.css"/>
    <link rel="stylesheet" href="../static/css/font-awesome.css">

    <script type="text/javascript" src="../static/js/jquery-3.2.1.min.js"></script>
    <title>我的主页</title>
    <script>
        $(document).ready(function () {
            getInfo();
            checkCookie();
        });
    </script>
</head>
<body>

<!--图片上传框-->
<div class="am-modal am-modal-no-btn up-frame-bj " tabindex="-1" id="doc-modal-1"
     style="display: none; margin-left: 20%;">
    <div class="am-modal-dialog up-frame-parent up-frame-radius" style="width: 70%;">
        <div class="am-modal-hd up-frame-header">
            <label>修改头像</label>
            <a href="javascript: void(0)" class="am-close am-close-spin" data-am-modal-close>x</a>
        </div>
        <div class="am-modal-bd  up-frame-body">
            <div class="am-g am-fl">
                <div class="am-form-group am-form-file">
                    <div class="am-fl">
                        <button type="button" class="am-btn am-btn-default am-btn-sm">
                            <i class="am-icon-cloud-upload"></i> 选择要上传的文件
                        </button>
                    </div>
                    <input type="file" id="inputImage">
                </div>
            </div>
            <div class="am-g am-fl">
                <div class="up-pre-before up-frame-radius">
                    <img alt="" src="" id="image">
                </div>
                <div class="up-pre-after up-frame-radius">
                </div>
            </div>
            <div class="am-g am-fl">
                <div class="up-control-btns">
                    <span class="am-icon-rotate-left" onclick="rotateimgleft()"></span>
                    <span class="am-icon-rotate-right" onClick="rotateimgright()"></span>
                    <span class="am-icon-check" id="up-btn-ok" url="/admin/user/upload.action"></span>
                </div>
            </div>

        </div>
    </div>
</div>
<%--<div id="pageBackground"></div>--%>
<div id="userPage">
    <div id="infoBlock" class="briefInfoBlock" style="top: 3%;">
        <p class="titleP">个 人 信 息</p>
        <button class="iconButton"
                style="background-image: url(/static/images/maleIcon.png); top: 25%; margin-left: 2%;"></button>
        <p class="nameP" style="top: 26%; margin-left: 25%;" id="briefUser">X X X</p>
        <button class="genderButton"
                style="background-image: url(/static/images/male.png); top: 24%; margin-left: 10%; background-color: #ffffff"
                id="briefGender"></button>
        <p class="labelP" style="margin-left: 2%; top: 50%">姓 名:</p>
        <p class="contentP" style="left: 30%; top: 53%" id="briefName">XXX</p>
        <p class="labelP" style="margin-left: 2%; top: 75%">学 校:</p>
        <p class="contentP" style="left: 30%; top: 78%" id="briefSchool">XXX</p>
        <a href="#" style="top: 90%; left: 65%" onclick="showInfoContent()">查 看 详 情 ></a>

        <!--<a href="404.html" class="iconButton" style="background-image: url(/images/infoBG.png)">aaa</a>-->
    </div>
    <div id="friendBlock" class="briefInfoBlock" style="top: 35%;">
        <p class="titleP">好 友 信 息</p>
        <div id="friend1">
            <button class="iconButton"
                    style="background-image: url(/static/images/maleIcon.png); top: 25%; margin-left: 2%;"></button>
            <a href="" class="labelP" id="username1" style="top: 25%; margin-left: 25%;">X X X</a>
            <button class="genderButton"
                    style="background-image: url(/static/images/male.png); top: 24%; margin-left: 10%; background-color: #ffffff"></button>
        </div>
        <div id="friend2">
            <button class="iconButton"
                    style="background-image: url(/static/images/maleIcon.png); top: 50%; margin-left: 2%;"></button>
            <a href="" class="labelP" id="username2" style="top: 50%; margin-left: 25%;">X X X</a>
            <button class="genderButton"
                    style="background-image: url(/static/images/male.png); top: 49%; margin-left: 10%; background-color: #ffffff"></button>
        </div>
        <div id="friend3">
            <button class="iconButton"
                    style="background-image: url(/static/images/maleIcon.png); top: 75%; margin-left: 2%;"></button>
            <a href="" class="labelP" id="username3" style="top: 75%; left: 25%;">X X X</a>
            <button class="genderButton"
                    style="background-image: url(/static/images/male.png); top: 74%; margin-left: 10%; background-color: #ffffff"></button>
        </div>
        <a href="#" style="top: 90%; margin-left: 65%" onclick="showFriendContent()">查 看 更 多 ></a>

    </div>
    <div id="" class="briefInfoBlock" style="top: 67%;">
        <p class="titleP">公 益 信 息</p>
        <p class="labelP" style="top: 25%; margin-left: 2%;">积 分:</p>
        <p class="contentP" style="left: 30%; top: 28%" id="briefScore">X X X</p>
        <p class="labelP" style="top: 45%; margin-left: 2%;">最 新 记 录:</p>
        <p class="contentP" style="margin-left: 2%; top: 60%">xxxxxxxxxxxxxxxxxxx</p>
        <a href="#" style="top: 90%; left: 65%" onclick="showPublicContent()">查 看 更 多 ></a>
    </div>

    <div id="infoContent" class="contentBlock">
        <p class="titleP">个 人 信 息</p>
        <div class="up-img-cover" id="up-img-touch">
            <button class="genderButton" id="iconLabel"
                    style="background-image: url(/static/images/maleIcon.png); top: 12%; margin-left: 66%; width: 30%; padding-top: 30%;"
                    alt="点击图片上传" data-am-popover="{content: '点击修改', trigger: 'hover focus'}"></button>
            <%--<img src="../images/maleIcon.png" class="iconImage" id="icon" alt="点击图片上传"--%>
            <%--data-am-popover="{content: '点击上传', trigger: 'hover focus'}">--%>
        </div>
        <p class="labelP" style="left: 5%; top: 12%">用 户 名:</p>
        <input class="contentP" id="usernameLabel" style="left: 23%; top: 12%" value="哈哈哈哈" disabled>
        <img style="top: 24.5%; left: 4%;">
        <p class="labelP" style="left: 8.5%; top: 24%">姓 名:</p>
        <input class="contentP" id="nameLabel" style="left: 23%; top: 24%" value="哈哈哈哈" disabled>

        <p class="labelP" style="left: 5%; top: 36%">身 份 证:</p>
        <input class="contentP" id="idLabel" style="left: 23%; top: 36%" value="哈哈哈哈" disabled>

        <p class="labelP" style="left: 5%; top: 48%">微 信 号:</p>
        <input class="contentP" id="wechatLabel" style="left: 23%; top: 48%" value="哈哈哈哈" disabled>
        <%--<a href="" style="position:absolute; text-decoration: underline; top: 48%; left: 56%">修改</a>--%>
        <p class="labelP" style="left: 5%; top: 60%">手 机 号:</p>
        <input class="contentP" id="phoneLabel" style="left: 23%; top: 60%" value="哈哈哈哈" disabled>
        <%--<a href="" style="position:absolute; text-decoration: underline; top: 60%; left: 56%">修改</a>--%>
        <p class="labelP" style="left: 5%; top: 72%">学 校:</p>
        <input class="contentP" id="schoolLabel" style="left: 23%; top: 72%" value="哈哈哈哈" disabled>
        <%--<a href="" style="position:absolute; text-decoration: underline; top: 72%; left: 56%">修改</a>--%>
        <p class="labelP" style="left: 5%; top: 84%">密 码:</p>
        <input class="contentP" id="passwordLabel" style="left: 23%; top: 84%" value="******" disabled>
        <a href="#" style="position:absolute; text-decoration: underline; top: 84%; left: 56%"
           data-am-modal="{target: '#my-popup'}">修改</a>

        <%--<div id="modifyPasswordArea" style="display: none">--%>
        <%--<p class="titleP">修 改 密 码</p>--%>
        <%--<p class="labelP" style="margin-left: 25%; margin-top: 20%">输 入 原 密 码</p>--%>
        <%--<input class="contentP" id="originalPassword" style="margin-left: 20%; margin-top: 35%; width: 60%">--%>
        <%--<p class="labelP" style="margin-left: 25%; margin-top: 50%">输 入 新 密 码</p>--%>
        <%--<input class="contentP" id="newPassword1" style="margin-left: 20%; margin-top: 65%; width: 60%">--%>
        <%--<p class="labelP" style="margin-left: 25%; margin-top: 80%">确 认 新 密 码</p>--%>
        <%--<input class="contentP" id="newPassword2" style="margin-left: 20%; margin-top: 95%; width: 60%">--%>

        <%--<button class="mybt" style="width: 20%; font-size: 1vmax; margin-left: 40%; margin-top: 107%; border-width: medium">修 改</button>--%>
        <%--</div>--%>
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
    <div id="publicContent" class="contentBlock" style="display: none">
        <p class="titleP">公 益 信 息</p>
        <p class="subtitle" id="score">666分</p>
        <div class="singleRecord">
            <p class="labelP" style="margin-top: 0%; margin-left: 5%;">获得积分数量:</p>
            <p class="labelP" style="margin-top: 0%; margin-left: 55%;">当前积分:</p>
            <p class="labelP" style="margin-top: 7%; margin-left: 5%;">获得积分方式:</p>
            <p class="labelP" style="margin-top: 7%; margin-left: 55%;">衣服编号:</p>

        </div>
    </div>
</div>

<div class="am-popup" id="my-popup" style="left: ">
    <h1 style="width: 50%; float: left;">修&nbsp;改&nbsp;密&nbsp;码</h1>
    <span data-am-modal-close
          class="am-close" style="top: 30%; float: right;">&times;</span>
    <br>
    <h2 style="margin-left: 0%; width: 100%; text-align: center; margin-top: 15%">输 入 原 密 码</h2>
    <input id="originalPassword" style="margin-left: 20%; margin-top: -2%; width: 60%" type="password">
    <h2 style="margin-left: 0%; width: 100%; text-align: center; margin-top: 10%">输 入 新 密 码</h2>
    <input id="newPassword1" style="margin-left: 20%; margin-top: -2%; width: 60%" type="password">
    <h2 style="margin-left: 0%; width: 100%; text-align: center; margin-top: 10%">确 认 新 密 码</h2>
    <input id="newPassword2" style="margin-left: 20%; margin-top: -2%; width: 60%" type="password">

    <button class="mybt" style="width: 20%; font-size: 1.5vmax; margin-left: 40%; margin-top: 20%;" onclick="changePassword()">
        修 改
    </button>
</div>
<div class="foot">
    <p class="navLabel" align="center" style="position: absolute; top:97.2%; text-align: center">与子同袍项目组
        copyright@2017</p>
</div>
<%--<script type="text/javascript" src="http://cdn.amazeui.org/amazeui/2.7.2/js/amazeui.js" charset="utf-8"></script>--%>
<script type="text/javascript" src="../static/js/amazeui.js" charset="utf-8"></script>
<script type="text/javascript" src="../static/js/login.js" charset="utf-8"></script>
<script type="text/javascript" src="../static/js/cookie.js" charset="utf-8"></script>
<script type="text/javascript" src="../static/js/userInfo.js" charset="utf-8"></script>
<script type="text/javascript" src="../static/js/alert.js" charset="utf-8"></script>
<script type="text/javascript" src="../static/js/cropper.min.js" charset="utf-8"></script>
<script type="text/javascript" src="../static/js/custom_up_img.js" charset="utf-8"></script>

</body>

</html>
