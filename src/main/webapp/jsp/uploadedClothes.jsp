<%--
  Created by IntelliJ IDEA.
  User: island
  Date: 2017/8/11
  Time: 下午4:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html style="background-color: #DFEDF0;">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="viewport" content="height=device-height, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="../static/css/alert.css">
    <link rel="stylesheet" type="text/css" href="../static/css/amazeui.css">
    <link rel="stylesheet" type="text/css" href="../static/css/theme.css">
    <link rel="stylesheet" type="text/css" href="../static/css/uploadedClothes.css">
    <script type="text/javascript" src="../static/js/jquery-3.2.1.min.js"></script>
    <script>
        $(document).ready(function () {
            getAllClothes();
        });
    </script>
</head>
<body style="border: thick solid #C9D7DA; border-bottom: none; border-left: none; background-color: #DFEDF0;" id="body">
<h1 style="font-size: 5vw; text-shadow: -0.4vw 0.4vw 0 #7A6420;">已捐<span id="clothesNum">0</span>件衣物</h1>

<h4 style="font-size: 4vw; text-shadow: -0.3vw 0.3vw 0 #315770; position: absolute; top: 40%; width: 100%; text-align: center" id="noClothesLabel">暂无已捐衣物</h4>
<%--<table class="table-content">--%>
    <%--<tbody class="table-content-title">--%>
    <%--<tr>--%>
        <%--<td style="width: 30%">--%>
            <%--<a href="">123435345645</a>--%>
        <%--</td>--%>
        <%--<td style="width: 20%">--%>
            <%--款式--%>
        <%--</td>--%>
        <%--<td style="width: 20%">--%>
            <%--尺寸--%>
        <%--</td>--%>
        <%--<td style="width: 20%">--%>
            <%--状态--%>
        <%--</td>--%>
    <%--</tr>--%>
    <%--</tbody>--%>
    <%--<tbody class="table-content-body">--%>
    <%--<tr>--%>
        <%--<th style="width: 50%;">--%>
            <%--<div class="imageBox">--%>
                <%--<img src="../static/images/mainBG2.png" class="largeImage"/>--%>
        <%--<th style="width: 20%">--%>
            <%--夏季短袖--%>
        <%--</th>--%>
        <%--<th style="width: 20%">--%>
            <%--130--%>
        <%--</th>--%>
        <%--<th style="width: 20%">--%>
            <%--未卖出--%>
        <%--</th>--%>
    <%--</tr>--%>
    <%--</tbody>--%>
<%--</table>--%>
<script type="text/javascript" src="../static/js/cookie.js"></script>
<script type="text/javascript" src="../static/js/alert.js"></script>
<script type="text/javascript" src="../static/js/uploadedClothes.js"></script>

</body>
</html>
