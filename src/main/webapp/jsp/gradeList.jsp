<%--
  Created by IntelliJ IDEA.
  User: island
  Date: 2017/8/15
  Time: 下午9:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html style="background-color: #DFEDF0">
<head>
    <link rel="stylesheet" href="../static/css/class.css">
    <title>Title</title>
    <script type="text/javascript" src="../static/js/jquery-3.2.1.min.js"></script>
    <script>
        $(document).ready(function () {
            getGradeContent();
        });
    </script>
</head>
<body style="background-color: #DFEDF0">
<table class="table-head orderTable" id="gradeTable" >
    <tbody>
    <tr>
        <th style="width: 20%">
            排名
        </th>
        <th style="width: 40%">
            年级
        </th>
        <th style="width: 40%">
            公益积分
        </th>
    </tr>
    </tbody>
    <%--<tbody class="table-content-body">--%>
    <%--<tr>--%>
    <%--<td style="width: 10%">--%>
    <%--1--%>
    <%--</td>--%>
    <%--<td style="width: 20%">--%>
    <%--1年级--%>
    <%--</td>--%>
    <%--<td style="width: 10%">--%>
    <%--11--%>
    <%--</td>--%>
    <%--</tr>--%>
    <%--</tbody>--%>

</table>
<script type="text/javascript" src="../static/js/class.js" charset="utf-8"></script>
<script type="text/javascript" src="../static/js/util.js" charset="utf-8"></script>
<script type="text/javascript" src="../static/js/cookie.js" charset="utf-8"></script>
<script type="text/javascript" src="../static/js/alert.js" charset="utf-8"></script>
</body>
</html>
