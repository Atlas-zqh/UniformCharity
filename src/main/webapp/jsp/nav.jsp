<%--
  Created by IntelliJ IDEA.
  User: island
  Date: 2017/7/11
  Time: 下午5:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="stylesheet" href="../static/css/nav.css"/>
    <link rel="stylesheet" href="../static/css/theme.css"/>
    <%--<link rel="stylesheet" href="../static/css/main.css"/>--%>
    <script>
        function showLoginPanel() {
            document.getElementById("signupPanel").style.display = "none";
            $("#loginPanel").fadeIn(2000);
        }

        function showSignupPanel() {
            document.getElementById("loginPanel").style.display = "none";
            $("#signupPanel").fadeIn(2000);
        }
    </script>
</head>
<body>
<div id="nav">
    <div class="topNavBar" id="preTop">
        <p class="navLabel" align="center">与 子 同 袍</p>
    </div>
    <div class="topNavBar" id="afterTop" style="display: none">
        <p class="navLabel">与 子 同 袍 &nbsp;&nbsp;| &nbsp;</p>
        <img id="iconImage" src="">
        <p class="navLabel">&nbsp;</p>
        <p id="userName" class="navP" style="letter-spacing: 0.1vh"></p>
    </div>
    <div class="leftNavBar" align="left" id="afterLogInLeft" style="display: none">
        <div class="bt"><a href="../jsp/index.jsp">首<br>页</a></div>
        <div class="navLabel"><p><br>—<br></p></div>
        <div class="bt"><a href="../jsp/order.jsp">我<br>的<br>订<br>单</a></div>
        <div class="navLabel"><p><br>—<br></p></div>
        <div class="bt"><a href="../jsp/clothes.jsp">我<br>的<br>衣<br>物</a></div>
        <div class="navLabel"><p><br>—<br></p></div>
        <div class="bt"><a href="../jsp/forum.jsp">讨<br>论<br>区</a></div>

    </div>
    <div class="rightNavBar" align="left" id="beforeLogInRight">
        <div class="bt">
            <a href="../jsp/manager.jsp">
                进<br>入<br>管<br>理<br>员<br>模<br>式
            </a>
        </div>
        <%--<div class="navLabel"><p><br>—<br></p></div>--%>


    </div>
    <div class="rightNavBar" align="left" id="afterLogInRight" style="display: none">
        <%--<img id="iconImage" src="">--%>
        <%--<br>--%>
        <%--<p id="userName" class="navP"></p>--%>
        <%--<div class="navLabel"><p>—<br></p></div>--%>
        <div class="bt"><a href="../jsp/userInfo.jsp">我<br>的<br>主<br>页</a></div>
        <div class="navLabel"><p><br>—<br></p></div>
        <div class="bt"><a href="../jsp/class.jsp">班<br>级<br>天<br>地</a></div>
        <div class="navLabel"><p><br>—<br></p></div>
        <div class="bt"><a href="#" onclick="quitLog()">退<br>出<br>登<br>陆</a></div>

    </div>
    <div class="leftNavBar" align="left" id="preLogInLeft" style="display: inline-block">
        <div class="bt" id="loginButton"><a href="#toLoginPanel" onclick="showLoginPanel()">登<br>录</a></div>
        <div class="navLabel"><p><br>—<br></p></div>
        <div class="bt" id="signupButton"><a href="#toSignupPanel" onclick="showSignupPanel()">注<br>册</a></div>
    </div>

</div>
<script type="text/javascript" src="../static/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="../static/js/login.js"></script>

</body>
</html>
