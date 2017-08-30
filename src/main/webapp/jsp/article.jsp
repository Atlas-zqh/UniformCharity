<%--
  Created by IntelliJ IDEA.
  User: island
  Date: 2017/8/20
  Time: 下午8:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="nav.jsp" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>与子同袍-文章详情</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="viewport" content="height=device-height, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="../static/css/article.css">
    <link rel="stylesheet" type="text/css" href="../static/css/alert.css">
    <link rel="stylesheet" type="text/css" href="../static/css/theme.css">
    <script type="text/javascript" src="../static/js/jquery-3.2.1.min.js"></script>
    <script>
        $(document).ready(function () {
            checkCookie();
            var id = getArgsFromHref(window.location.href, "id");
            getPassagesByID(id);
        });
    </script>
</head>
<body>
<div id="contentArea">
    <div id="mainPart">
        <h1>文章详情</h1>
        <div id="infoPart">
            <div id="titlePart">
                <p id="title"></p>
                <p id="time"></p>
            </div>
            <div id="contentPart">
                <p id="content">
                </p>
            </div>
        </div>
    </div>
</div>
<div class="foot">
    <p class="navLabel" align="center" style="width: 100%; text-align: center; margin: 0;">与子同袍项目组
        copyright@2017</p>
</div>
<script type="text/javascript" src="../static/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="../static/js/cookie.js" charset="utf-8"></script>
<script type="text/javascript" src="../static/js/util.js" charset="utf-8"></script>
<script type="text/javascript" src="../static/js/alert.js" charset="utf-8"></script>
<script type="text/javascript" src="../static/js/passage.js" charset="utf-8"></script>
</body>
</html>
