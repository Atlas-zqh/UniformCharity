<%--
  Created by IntelliJ IDEA.
  User: island
  Date: 2017/7/22
  Time: 下午8:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="nav.jsp" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="viewport" content="height=device-height, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="../static/css/payed.css">
    <link rel="stylesheet" type="text/css" href="../static/css/theme.css">
    <script type="text/javascript" src="../static/js/jquery-3.2.1.min.js"></script>
    <script>
        $(document).ready(function () {
           checkCookie();
        });
    </script>
</head>
<body>
<div id="contentArea">
    <div id="mainPart">
        <h1>付款成功</h1>
        <img src="../static/images/procedure3.png" style="width: 25%; float: right; margin-right: 5%; margin-top: -7%">
        <div id="infoPart">
            <h2 style="left: 25%; top: 20%;">您成功支付了<span>188.88</span>元，获得了<span>188</span>公益积分。</h2>
            <h2 style="width: 60%; display: inline;">感谢您对"与子同袍"的支持！</h2>
            <a href="" style="font-size: 1.2vmax;">点击查看订单详情</a>
            <br>
            <button class="mybt" style="font-size: 1.5vmax; width: 30%; margin-top: 5%; margin-left: 10%;" onclick="window.location.href = '../jsp/index.jsp'">返回首页</button>
            <button class="mybt" style="font-size: 1.5vmax; width: 30%; margin-left: 10%" onclick="window.location.href = '../jsp/order.jsp'">我的订单</button>
        </div>
    </div>
</div>
<div class="foot">
    <p class="navLabel" align="center" style="position: absolute; top:97.2%; text-align: center">与子同袍项目组
        copyright@2017</p>
</div>
<script type="text/javascript" src="../static/js/cookie.js" charset="utf-8"></script>
<script type="text/javascript" src="../static/js/alert.js" charset="utf-8"></script>
</body>
</html>
