<%--
  Created by IntelliJ IDEA.
  User: island
  Date: 2017/7/26
  Time: 下午5:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html style="background-color: white">
<head>
    <link rel="stylesheet" type="text/css" href="../static/css/theme.css">
    <link rel="stylesheet" type="text/css" href="../static/css/order.css">
    <link rel="stylesheet" type="text/css" href="../static/css/alert.css">
    <link rel="stylesheet" href="../static/css/menu.css" media="screen" type="text/css" />
    <script type="text/javascript" src="../static/js/jquery-3.2.1.min.js"></script>
    <script>
        $(document).ready(function () {
            var page = decodeURIComponent(getArgsFromHref(window.location.href, 'page'));
            var status = decodeURIComponent(getArgsFromHref(window.location.href, 'status'));

            getOrders(page, status);
        });
    </script>
</head>
<body style="background-color: white" id="body">
<h4 id="noRecordLabel" style="position: absolute; font-size: 3vmax; top: 40%; width: 100%; text-align: center; text-shadow: -0.2vmax 0.2vmax 0 #315770;">暂无订单记录</h4>

<%--<table class="table-content">--%>
    <%--<tbody class="table-content-title">--%>
    <%--<tr>--%>
        <%--<td style="width: 10%">--%>
            <%--2017-07-17--%>
        <%--</td>--%>
        <%--<td style="width: 30%">--%>
        <%--</td>--%>
        <%--<td style="width: 20%">--%>
        <%--</td>--%>
        <%--<td style="width: 10%">--%>
        <%--</td>--%>
        <%--<td style="width: 10%">--%>
        <%--</td>--%>
        <%--<td style="width: 10%">--%>
        <%--</td>--%>
    <%--</tr>--%>
    <%--</tbody>--%>
    <%--<tbody class="table-content-body">--%>
    <%--<tr>--%>
        <%--<th style="width: 10%">--%>
            <%--<a href="" onclick="window.open('orderDetails.jsp?orderID=111')">1111111</a>--%>
        <%--</th>--%>
        <%--<th style="width: 30%">--%>
            <%--<div class="imageBox">--%>
                <%--<img src="../static/images/mainBG2.png" class="largeImage"/>--%>
            <%--</div>--%>
            <%--<a href="" class="nameP">asaasaasaasaasaasaasaasaasaasaasaasaasaasaasa</a>--%>
        <%--</th>--%>
        <%--<th style="width: 20%">--%>
            <%--<a href="">捐赠人</a>--%>
        <%--</th>--%>
        <%--<th style="width: 10%">--%>
            <%--¥188.00--%>
        <%--</th>--%>
        <%--<th style="width: 10%">--%>
            <%--待付款--%>
        <%--</th>--%>
        <%--<th style="width: 10%">--%>
            <%--<button class="mybt orderbt">取消订单</button>--%>
        <%--</th>--%>
    <%--</tr>--%>
    <%--</tbody>--%>
<%--</table>--%>
<script type="text/javascript" src="../static/js/order.js"></script>
<script type="text/javascript" src="../static/js/alert.js"></script>
<script type="text/javascript" src="../static/js/cookie.js"></script>
<script type="text/javascript" src="../static/js/util.js"></script>

</body>
</html>
