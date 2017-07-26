<%--
  Created by IntelliJ IDEA.
  User: island
  Date: 2017/7/22
  Time: 下午5:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="nav.jsp" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="../static/css/confirmOrder.css">
    <!--<link rel="stylesheet" type="text/css" href="http://cdn.amazeui.org/amazeui/2.7.2/css/amazeui.css">-->
    <!--<link rel="stylesheet" type="text/css" href="http://cdn.amazeui.org/amazeui/2.7.2/css/amazeui.min.css">-->
    <link rel="stylesheet" type="text/css" href="../static/css/theme.css">
    <link rel="stylesheet" type="text/css" href="../static/css/alert.css">
    <script type="text/javascript" src="../static/js/jquery-3.2.1.min.js"></script>
</head>
<body>
<div id="orderArea">
    <div id="mainPart">
        <h1 style="float: left">确认订单</h1>
        <img src="../static/images/procedure1.png" style="width: 25%; float: right; margin-right: 5%; margin-top: 2%">
        <div id="orderTable">
            <table class="table-head orderTable" >
                <tr>
                    <th style="width: 10%">
                        图片
                    </th>
                    <th style="width: 20%">
                        品名
                    </th>
                    <th style="width: 10%">
                        学校
                    </th>
                    <th style="width: 10%">
                        款式
                    </th>
                    <th style="width: 10%">
                        尺码
                    </th>
                    <th style="width: 10%">
                        性别
                    </th>
                    <th style="width: 10%">
                        捐赠人
                    </th>
                    <th style="width: 10%">
                        价格
                    </th>
                </tr>
                </tbody>
                <tbody class="table-content-body">
                <tr>
                    <th style="width: 10%">
                        <div class="imageBox">
                            <img src="../images/mainBG2.png" class="largeImage" id="pic"/>
                        </div>
                    </th>
                    <th style="width: 20%">
                        <a href="" id="title">南京外国语学校仙林分校夏季男款短袖</a>
                    </th>
                    <th style="width: 20%" id="school">
                        南京外国语学校仙林分校
                    </th>
                    <th style="width: 10%" id="type">
                        夏季短袖
                    </th>
                    <th style="width: 10%" id="size">
                        M
                    </th>
                    <th style="width: 10%" id="gender">
                        男
                    </th>
                    <th style="width: 10%" id="user">
                        <a href=""> ADMIN</a>
                    </th>
                    <th style="width: 10%" id="price">
                        ¥188.00
                    </th>
                </tr>
                </tbody>
            </table>
        </div>

        <div id="pricePart">
            <h5 style="float: left; margin-top: 3%;">需付款:</h5>
            <h3 id="priceLabel" style="float: right">¥188.00</h3>
            <button class="mybt" style="float: right; width: 60%; font-size: 1.5vmax;" onclick="pay()">立即付款</button>
        </div>
    </div>
</div>
<div class="foot">
    <p class="navLabel" align="center" style="position: absolute; top:97.2%; text-align: center">与子同袍项目组 copyright@2017</p>
    <%--<p style="position:absolute; display: inline-block; z-index: 2; color: grey; margin-top: 0%; text-align: center; line-height: 100%; width: 100%; font-size: 90%;">与子同袍项目组 copyright@2017</p>--%>
</div>
<script type="text/javascript" src="../static/js/cookie.js" charset="utf-8"></script>
<script type="text/javascript" src="../static/js/alert.js" charset="utf-8"></script>
<script type="text/javascript" src="../static/js/util.js" charset="utf-8"></script>
<script type="text/javascript" src="../static/js/confirmOrder.js" charset="utf-8"></script>
</body>

</html>
