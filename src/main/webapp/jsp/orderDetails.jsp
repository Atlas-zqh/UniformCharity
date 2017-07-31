<%--
  Created by IntelliJ IDEA.
  User: island
  Date: 2017/7/27
  Time: 上午10:34
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
    <script>
        $(document).ready(function () {
            checkCookie();
            var orderID = getArgsFromHref(window.location.href, "orderID");
            $('#orderID').html(orderID);
            findOrderByID(orderID);

        });
    </script>
</head>
<body>
<div id="orderArea">
    <div id="mainPart">
        <h1 style="float: left">订单详情</h1>
        <img src="../static/images/procedure1.png" style="width: 35%; float: right; margin-right: 5%; margin-top: 2%" id="image">
        <input type="hidden" id="clothesID">
        <div id="orderTable">
            <table class="table-head orderTable">
                <tbody class="table-title">
                <tr>
                    <th style="width: 10%">
                        订单号
                    </th>
                    <th style="width: 20%" id="orderID">
                        111111
                    </th>
                    <th style="width: 10%">
                        日期
                    </th>
                    <th style="width: 10%" id="date">
                        111111
                    </th>
                    <th style="width: 10%">

                    </th>
                    <th style="width: 10%">

                    </th>
                    <th style="width: 10%">
                        订单状态
                    </th>
                    <th style="width: 10%" id="status">
                        待付款
                    </th>
                </tr>
                </tbody>
                <tbody>
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


        <button class="mybt"
                style="float: right; width: 10%; font-size: 1.5vmax; left: 85%; top: 90%; position: absolute"
                onclick="processOrder()"
                id="doButton">立即付款
        </button>

        <button class="mybt" style="position:absolute; left: 73%; top: 90%; font-size: 1.5vmax; display: none;" id="cancelButton" onclick="cancelOrder()">取消订单</button>

    </div>
</div>
<div class="foot">
    <p class="navLabel" align="center" style="position: absolute; top:97.2%; text-align: center">与子同袍项目组
        copyright@2017</p>
</div>
<script type="text/javascript" src="../static/js/cookie.js" charset="utf-8"></script>
<script type="text/javascript" src="../static/js/alert.js" charset="utf-8"></script>
<script type="text/javascript" src="../static/js/util.js" charset="utf-8"></script>
<script type="text/javascript" src="../static/js/confirmOrder.js" charset="utf-8"></script>
</body>

</html>
