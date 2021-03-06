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
    <link rel="stylesheet" href="../static/css/amazeui.css"/>

    <link rel="stylesheet" href="../static/css/alert.css"/>
    <%--<link rel="stylesheet" href="../static/css/boot.css"/>--%>
    <link rel="stylesheet" href="../static/css/alert.css"/>
    <link rel="stylesheet" href="../static/css/theme.css"/>
    <link rel="stylesheet" href="../static/css/manage.css"/>
    <script type="text/javascript" src="../static/js/jquery-3.2.1.min.js"></script>
    <script>
        $(document).ready(function () {
            getCities();
        });
    </script>
</head>
<body>
<div class="topNavBar" id="preTop">
    <p class="navLabel" align="center" style="margin: 0;">与 子 同 袍</p>
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
        <div id="searchView" style="display: none">
            <div id="searchContent">
                <h6 style="position: absolute; left: 15%; top: 2%;">城市</h6>
                <div id="city" class="block" style="left: 7%">
                    <ul id="cityList">
                        <%--<li>北京</li>--%>
                        <%--<li>南京</li>--%>
                    </ul>
                </div>
                <h6 style="position: absolute; left: 46%; top: 2%;">区域</h6>
                <div id="block" class="block" style="left: 38%;">
                    <ul id="blockList">
                        <%--<li>北京</li>--%>
                        <%--<li>南京</li>--%>
                    </ul>
                </div>
                <h6 style="position: absolute; left: 77%; top: 2%;">学校</h6>
                <div id="school" class="block" style="left: 69%">
                    <ul id="schoolList">
                        <%--<li>北京</li>--%>
                        <%--<li>南京</li>--%>
                    </ul>
                </div>

                <button id="searchBut" class="mybt" onclick="searchSchool()"
                        style="width: 20%; font-size: 1.5vmax; position: relative; left: 40%; top: 85%;">搜 索
                </button>
            </div>
        </div>
        <%@ include file="addSchool.jsp" %>
        <%@ include file="postArticle.jsp" %>
    </div>
    <%@ include file="schoolInfo.jsp" %>
    <%@ include file="modifySchoolInfo.jsp" %>

</div>

<div class="foot">
    <p class="navLabel" align="center" style="width: 100%; text-align: center; margin: 0;">与子同袍项目组
        copyright@2017</p>
</div>
<div data-am-widget="gotop" class="am-gotop am-gotop-fixed" style="width: 2.5%; right: 1.6%; bottom: 0.8vh;">
    <a href="#top" title="回到顶部">
        <span class="am-gotop-title">回到顶部</span>
        <i class="am-gotop-icon am-icon-chevron-up"></i>
    </a>
</div>
</body>
<script type="text/javascript" src="../static/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="../static/js/bootstrap.js"></script>
<script type="text/javascript" src="../static/js/amazeui.js"></script>
<script type="text/javascript" src="../static/js/alert.js"></script>
<script type="text/javascript" src="../static/js/login.js"></script>
<script type="text/javascript" src="../static/js/manager.js"></script>
</html>
