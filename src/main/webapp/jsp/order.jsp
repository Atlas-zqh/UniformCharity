<%--
  Created by IntelliJ IDEA.
  User: island
  Date: 2017/7/21
  Time: 下午4:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="nav.jsp" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="../static/css/order.css">
    <link rel="stylesheet" type="text/css" href="../static/css/amazeui.min.css">
    <link rel="stylesheet" type="text/css" href="../static/css/amazeui.css">
    <link rel="stylesheet" type="text/css" href="../static/css/theme.css">
    <link rel="stylesheet" href="../static/css/menu.css" media="screen" type="text/css" />
    <script type="text/javascript" src="../static/js/jquery-3.2.1.min.js"></script>

</head>
<body>
<div id="orderArea">
    <div id="mainPart">
        <h1 style="margin-top: 2%; margin-left: 2%">我的订单</h1>
        <div class="am-tabs" id="doc-my-tabs" style="width: 80%; margin-left: 10%">
            <ul class="am-tabs-nav am-nav am-nav-tabs am-nav-justify">
                <li class="am-active"><a href="" class="tab" onclick="change('#all')" id="all">所有订单</a></li>
                <li><a href="" class="tab" id="unpaid" onclick="change('#unpaid')">待付款订单</a></li>
                <li><a href="" class="tab" id="uncomformed" onclick="change('#uncomformed')">待确认订单</a></li>
                <li><a href="" class="tab" id="unchecked" onclick="change('#unchecked')">待收货订单</a></li>
            </ul>
            <div class="am-tabs-bd">
                <div class="am-tab-panel am-active">
                    <table class="table-head">
                        <tbody>
                        <tr>
                            <th style="width: 10%">
                                编号
                            </th>
                            <th style="width: 30%">
                                品名
                            </th>
                            <th style="width: 20%">
                                捐赠人
                            </th>
                            <th style="width: 10%">
                                价格
                            </th>
                            <th style="width: 10%">
                                交易状态
                            </th>
                            <th style="width: 10%">
                                交易操作
                            </th>
                        </tr>
                        </tbody>
                    </table>
                    <div id="briefPagePane">
                        <p style="float: left; margin-top: 0.6%;">当前页: </p>
                        <p style="margin-left: 5.5%; margin-top: 0.5%; float: left; position: absolute;"> 1 / 15</p>
                        <button class="mybt"
                                style="margin-left: 1%; float: right; width: 6%; border-width: medium; margin-top: 0.5%">
                            下一页
                        </button>
                        <button class="mybt"
                                style="margin-left: 1%; float: right; width: 6%; border-width: medium; margin-top: 0.5%">
                            上一页
                        </button>
                    </div>
                    <table class="table-content">
                        <tbody class="table-content-title">
                        <tr>
                            <td style="width: 10%">
                                2017-07-17
                            </td>
                            <td style="width: 30%">
                            </td>
                            <td style="width: 20%">
                            </td>
                            <td style="width: 10%">
                            </td>
                            <td style="width: 10%">
                            </td>
                            <td style="width: 10%">
                            </td>
                        </tr>
                        </tbody>
                        <tbody class="table-content-body">
                        <tr>
                            <th style="width: 10%">
                                11111
                            </th>
                            <th style="width: 30%">
                                <div class="imageBox">
                                    <img src="../static/images/mainBG2.png" class="largeImage"/>
                                </div>
                                <a href="" class="nameP">asaasaasaasaasaasaasaasaasaasaasaasaasaasaasa</a>
                            </th>
                            <th style="width: 20%">
                                <a href="">捐赠人</a>
                            </th>
                            <th style="width: 10%">
                                ¥188.00
                            </th>
                            <th style="width: 10%">
                                待付款
                            </th>
                            <th style="width: 10%">
                                <button class="mybt orderbt">取消订单</button>
                            </th>
                        </tr>
                        </tbody>
                    </table>
                    <br>
                    <table class="table-content">
                        <tbody class="table-content-title">
                        <tr>
                            <td style="width: 10%">
                                2017-07-17
                            </td>
                            <td style="width: 30%">
                            </td>
                            <td style="width: 20%">
                            </td>
                            <td style="width: 10%">
                            </td>
                            <td style="width: 10%">
                            </td>
                            <td style="width: 10%">
                            </td>
                        </tr>
                        </tbody>
                        <tbody class="table-content-body">
                        <tr>
                            <th style="width: 10%">
                                11111
                            </th>
                            <th style="width: 30%">
                                <div class="imageBox">
                                    <img src="../static/images/mainBG2.png" class="largeImage"/>
                                </div>
                                <a href="" class="nameP">asaasaasaasaasaasaasaasaasaasaasaasaasaasaasa</a>
                            </th>
                            <th style="width: 20%">
                                <a href="">捐赠人</a>
                            </th>
                            <th style="width: 10%">
                                ¥188.00
                            </th>
                            <th style="width: 10%">
                                待付款
                            </th>
                            <th style="width: 10%">
                                <button class="mybt orderbt">取消订单</button>
                            </th>
                        </tr>
                        </tbody>
                    </table>
                    <br>
                    <table class="table-content">
                        <tbody class="table-content-title">
                        <tr>
                            <td style="width: 10%">
                                2017-07-17
                            </td>
                            <td style="width: 30%">
                            </td>
                            <td style="width: 20%">
                            </td>
                            <td style="width: 10%">
                            </td>
                            <td style="width: 10%">
                            </td>
                            <td style="width: 10%">
                            </td>
                        </tr>
                        </tbody>
                        <tbody class="table-content-body">
                        <tr>
                            <th style="width: 10%">
                                11111
                            </th>
                            <th style="width: 30%">
                                <div class="imageBox">
                                    <img src="../static/images/mainBG2.png" class="largeImage"/>
                                </div>
                                <a href="" class="nameP">asaasaasaasaasaasaasaasaasaasaasaasaasaasaasa</a>
                            </th>
                            <th style="width: 20%">
                                <a href="">捐赠人</a>
                            </th>
                            <th style="width: 10%">
                                ¥188.00
                            </th>
                            <th style="width: 10%">
                                待付款
                            </th>
                            <th style="width: 10%">
                                <button class="mybt orderbt">取消订单</button>
                            </th>
                        </tr>
                        </tbody>
                    </table>
                    <br>
                    <table class="table-content">
                        <tbody class="table-content-title">
                        <tr>
                            <td style="width: 10%">
                                2017-07-17
                            </td>
                            <td style="width: 30%">
                            </td>
                            <td style="width: 20%">
                            </td>
                            <td style="width: 10%">
                            </td>
                            <td style="width: 10%">
                            </td>
                            <td style="width: 10%">
                            </td>
                        </tr>
                        </tbody>
                        <tbody class="table-content-body">
                        <tr>
                            <th style="width: 10%">
                                11111
                            </th>
                            <th style="width: 30%">
                                <div class="imageBox">
                                    <img src="../static/images/mainBG2.png" class="largeImage"/>
                                </div>
                                <a href="" class="nameP">asaasaasaasaasaasaasaasaasaasaasaasaasaasaasa</a>
                            </th>
                            <th style="width: 20%">
                                <a href="">捐赠人</a>
                            </th>
                            <th style="width: 10%">
                                ¥188.00
                            </th>
                            <th style="width: 10%">
                                待付款
                            </th>
                            <th style="width: 10%">
                                <button class="mybt orderbt">取消订单</button>
                            </th>
                        </tr>
                        </tbody>
                    </table>
                    <br>
                </div>
                <div class="am-tab-panel">...</div>
                <div class="am-tab-panel">...</div>
                <div class="am-tab-panel">...</div>
            </div>

            <div style="text-align: center">
                <ul id="menu">
                    <li><a href="#">Previous</a></li>
                    <li><a href="#">1</a></li>
                    <li><a href="#">2</a></li>
                    <li><a href="#">3</a></li>
                    <li><a href="#">4</a></li>
                    <li><a href="#">5</a></li>
                    <li><a href="#">6</a></li>
                    <li><a href="#">Next</a></li>
                </ul>
            </div>
        </div>
        <script>
            $(function () {
                $('#doc-my-tabs').tabs();
            });
            function change(id) {
                $('#all').css({"color": "#87b4bf", "text-shadow": "-0.1vmax 0.1vmax 0 #315770"});
                $('#unchecked').css({"color": "#87b4bf", "text-shadow": "-0.1vmax 0.1vmax 0 #315770"});
                $('#uncomformed').css({"color": "#87b4bf", "text-shadow": "-0.1vmax 0.1vmax 0 #315770"});
                $('#unpaid').css({"color": "#87b4bf", "text-shadow": "-0.1vmax 0.1vmax 0 #315770"});

                $(id).css({"color": "#DABD61", "text-shadow": "-0.1vmax 0.1vmax 0 #7A6420"});
            }
        </script>
    </div>
</div>
<script type="text/javascript" src="../static/js/jquery.min.js" charset="utf-8"></script>

<script type="text/javascript" src="../static/js/amazeui.min.js" charset="utf-8"></script>
</body>
</html>
