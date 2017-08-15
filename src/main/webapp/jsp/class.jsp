<%--
  Created by IntelliJ IDEA.
  User: island
  Date: 2017/8/14
  Time: 下午8:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="nav.jsp" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <%--<link rel="stylesheet" type="text/css" href="../static/css/amazeui.min.css">--%>

    <link rel="stylesheet" type="text/css" href="../static/css/amazeui.css">
    <link rel="stylesheet" href="../static/css/theme.css"/>
    <link rel="stylesheet" href="../static/css/alert.css"/>
    <link rel="stylesheet" href="../static/css/font-awesome.css">
    <link rel="stylesheet" href="../static/css/class.css">

    <script type="text/javascript" src="../static/js/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="../static/js/echarts.js"></script>
    <title>与子同袍-班级详情</title>
    <script>
        $(document).ready(function () {
            checkCookie();
        });
    </script>
</head>
<body>
<div id="classPage" >
    <div id="classBlock" class="briefInfoBlock" style="top: 3%;">
        <h3>我 的 班 级:</h3>
        <h4 style="position: absolute; top: 2%; left: 65%">1班</h4>
        <h5 style="top: 20%; position:absolute;" class="titleP">班级总积分:</h5>
        <h4 style="width: 100%; text-align: center; top: 35%; position:absolute;">188分</h4>
        <h5 style="top: 50%; position:absolute;" class="titleP">班级在年级中的排名:</h5>
        <h4 style="width: 100%; text-align: center; top: 65%; position:absolute;">第1名</h4>

        <a href="#" style="top: 92%; position:absolute; width: 98%; text-align: right" onclick="showClassContent()">查 看 详 情 ></a>

        <!--<a href="404.html" class="iconButton" style="background-image: url(/images/infoBG.png)">aaa</a>-->
    </div>
    <div id="gradeBlock" class="briefInfoBlock" style="top: 54%;">
        <h3>我 的 年 级:</h3>
        <h4 style="position: absolute; top: 2%; left: 65%">1年级</h4>
        <h5 style="top: 20%; position:absolute;" class="titleP">年级总积分:</h5>
        <h4 style="width: 100%; text-align: center; top: 35%; position:absolute;">188分</h4>
        <h5 style="top: 50%; position:absolute;" class="titleP">年级在全校中的排名:</h5>
        <h4 style="width: 100%; text-align: center; top: 65%; position:absolute;">第1名</h4>
        <a href="#" style="top: 92%; position:absolute; width: 98%; text-align: right" onclick="showGradeContent()">查 看 详 情 ></a>
    </div>

    <div id="classContent" class="contentBlock">
        <h1>班 级 信 息</h1>
        <h3 style="position: absolute; top: 3%; white-space: nowrap; width: 98%; text-align: right">本班总积分：<span id="classScore">18888分</span></h3>
        <h4 style="position: absolute; left: 3%; top: 12%;">班级成员</h4>
        <h4 style="position: absolute; width: 95%; top: 12%; text-align: right">共<span id="classMem">0</span>人</h4>
        <iframe src="../jsp/studentList.jsp" style="position: absolute; width: 94%; left: 3%; top: 20%; height: 77%"></iframe>
    </div>
    <div id="gradeContent" class="contentBlock" style="display: none">
        <h1>年 级 信 息</h1>
        <h3 style="position: absolute; top: 3%; white-space: nowrap; width: 98%; text-align: right">本年级总积分：<span id="gradeScore">18888分</span></h3>
        <h4 style="position: absolute; left: 3%; top: 12%;">所有年级</h4>
        <iframe src="../jsp/gradeList.jsp" style="position: absolute; width: 94%; left: 3%; top: 20%; height: 60%"></iframe>
        <div style="position: absolute; width: 52vw; left: 3%; top: 45%; height: 50vh;" id="gradeChart"></div>
    </div>
</div>

<div class="am-popup" id="my-popup">
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

    <button class="mybt" style="width: 20%; font-size: 1.5vmax; margin-left: 40%; margin-top: 20%;"
            onclick="changePassword()">
        修 改
    </button>
</div>
<div class="foot">
    <p class="navLabel" align="center" style="position: absolute; top:97.2%; text-align: center">与子同袍项目组
        copyright@2017</p>
</div>
<%--<script type="text/javascript" src="http://cdn.amazeui.org/amazeui/2.7.2/js/amazeui.js" charset="utf-8"></script>--%>
<script type="text/javascript" src="../static/js/amazeui.js" charset="utf-8"></script>
<script type="text/javascript" src="../static/js/util.js" charset="utf-8"></script>
<script type="text/javascript" src="../static/js/login.js" charset="utf-8"></script>
<script type="text/javascript" src="../static/js/cookie.js" charset="utf-8"></script>
<script type="text/javascript" src="../static/js/alert.js" charset="utf-8"></script>
<script type="text/javascript" src="../static/js/class.js" charset="utf-8"></script>
</body>

</html>
