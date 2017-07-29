<%--
  Created by IntelliJ IDEA.
  User: island
  Date: 2017/7/27
  Time: 上午9:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html style="background: #DFEDF0">
<head>
    <title>Title</title>
    <link rel="stylesheet" href="../static/css/theme.css"/>
    <link rel="stylesheet" href="../static/css/userInfo.css"/>
    <script type="text/javascript" src="../static/js/jquery-3.2.1.min.js"></script>
    <script>
        $(document).ready(function () {
            var page = decodeURIComponent(getArgsFromHref(window.location.href, 'page'));
            getCreditRecord(page);
//            for (var i = 0; i < 5; i++){
//                addSingleCreditRecord(i, '2017-01-01', '购买衣物', '111', '111', '111');
//            }
        });
    </script>
</head>
<body style="background: #DFEDF0" id="body">
<%--<div class="singleRecord">--%>
    <%--<p class="labelP" style="margin-top: 0%; margin-left: 5%;">获得积分数量:</p>--%>
    <%--<p class="labelP" style="margin-top: 0%; margin-left: 55%;">当前积分:</p>--%>
    <%--<p class="labelP" style="margin-top: 7%; margin-left: 5%;">获得积分方式:</p>--%>
    <%--<p class="labelP" style="margin-top: 7%; margin-left: 55%;">衣服编号:</p>--%>
<%--</div>--%>
<h4 id="noRecordLabel" style="position: absolute; font-size: 5vmax; top: 40%; width: 100%; text-align: center; text-shadow: -0.3vmax 0.3vmax 0 #315770;">暂无公益记录</h4>
<%--<table style="top: 2%" class="table-content">--%>
    <%--<tbody class="table-content-title">--%>
    <%--<tr>--%>
        <%--<td style="width: 25%">--%>
            <%--2017-07-17--%>
        <%--</td>--%>
        <%--<td style="width: 25%">--%>
        <%--</td>--%>
        <%--<td style="width: 25%">--%>
        <%--</td>--%>
        <%--<td style="width: 25%">--%>
        <%--</td>--%>
    <%--</tr>--%>
    <%--</tbody>--%>
    <%--<tbody class="table-content-body">--%>
    <%--<tr>--%>
        <%--<th style="width: 25%">--%>
            <%--捐赠衣物--%>
        <%--</th>--%>
        <%--<th style="width: 25%">--%>
            <%--<a href="" class="clothesID">衣物ID</a>--%>
        <%--</th>--%>
        <%--<th style="width: 25%">--%>
            <%--188--%>
        <%--</th>--%>
        <%--<th style="width: 28%">--%>
            <%--188--%>
        <%--</th>--%>
    <%--</tr>--%>
    <%--</tbody>--%>
<%--</table>--%>
<script type="text/javascript" src="../static/js/util.js" charset="utf-8"></script>
<script type="text/javascript" src="../static/js/userInfo.js" charset="utf-8"></script>
<script type="text/javascript" src="../static/js/creditInfo.js" charset="utf-8"></script>
</body>

</html>
