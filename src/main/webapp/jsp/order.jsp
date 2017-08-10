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
    <title>与子同袍-我的订单</title>
    <link rel="stylesheet" type="text/css" href="../static/css/order.css">
    <link rel="stylesheet" type="text/css" href="../static/css/alert.css">
    <link rel="stylesheet" type="text/css" href="../static/css/amazeui.css">
    <link rel="stylesheet" type="text/css" href="../static/css/theme.css">
    <link rel="stylesheet" href="../static/css/menu.css" media="screen" type="text/css"/>
    <script type="text/javascript" src="../static/js/jquery-3.2.1.min.js"></script>
    <script>
        $(document).ready(function () {
            $('#all').css({"color": "#DABD61", "text-shadow": "-0.1vmax 0.1vmax 0 #7A6420"});
            checkCookie();
            getSelected();
            var max = getMaxOrderPage();
            initMenu(max, 'orderMenu', 1);
            initPageLabel(1, max);
        });
    </script>

</head>
<body>
<div id="orderArea">
    <div id="mainPart" style="overflow: hidden">
        <h1 style="margin-top: 2%; margin-left: 2%">我的订单</h1>
        <div class="am-tabs" id="doc-my-tabs" style="width: 80%; margin-left: 10%">
            <ul class="am-tabs-nav am-nav am-nav-tabs am-nav-justify">
                <li class="am-active"><a href="" class="tab" onclick="change('#all')" id="all">所有订单</a></li>
                <li><a href="" class="tab" id="unpaid" onclick="change('#unpaid')">待付款订单</a></li>
                <li><a href="" class="tab" id="uncomformed" onclick="change('#uncomformed')">待确认订单</a></li>
                <li><a href="" class="tab" id="unchecked" onclick="change('#unchecked')">待收货订单</a></li>
            </ul>
            <div class="am-tabs-bd">
                <div class="am-tab-panel am-active" style="height: 65%">
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
                    <div>
                        <p style="float: left; margin-top: 0.6%; font-size: 1vmax; margin-left:1%;">当前页: </p>
                        <p style="margin-left: 10%; margin-top: 0.5%; float: left; position: absolute; font-size: 1vmax"
                           class="pageLabel"> 1 / 15</p>
                        <button class="mybt"
                                style="margin-left: 1%; float: right; width: 6%; border-width: medium; margin-top: 0.5%"
                                onclick="next()">
                            下一页
                        </button>
                        <button class="mybt"
                                style="margin-left: 1%; float: right; width: 6%; border-width: medium; margin-top: 0.5%"
                                onclick="previous()">
                            上一页
                        </button>
                    </div>
                    <iframe src="orderList.jsp?page=1&status=-2" style="width: 100%; height: 80%" class="orderFrame">
                    </iframe>


                    <br>

                </div>
                <div class="am-tab-panel" style="height: 65%">
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
                    <div>
                        <p style="float: left; margin-top: 0.6%;">当前页: </p>
                        <p style="margin-left: 10%; margin-top: 0.5%; float: left; position: absolute;"
                           class="pageLabel"> 1 / 15</p>
                        <button class="mybt"
                                style="margin-left: 1%; float: right; width: 6%; border-width: medium; margin-top: 0.5%">
                            下一页
                        </button>
                        <button class="mybt"
                                style="margin-left: 1%; float: right; width: 6%; border-width: medium; margin-top: 0.5%">
                            上一页
                        </button>
                    </div>
                    <iframe src="orderList.jsp?page=1&status=3" style="width: 100%; height: 80%"></iframe>

                </div>
                <div class="am-tab-panel" style="height: 65%">
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
                    <div id="briefPagePane3">
                        <p style="float: left; margin-top: 0.6%;">当前页: </p>
                        <p style="margin-left: 10%; margin-top: 0.5%; float: left; position: absolute;"
                           class="pageLabel"> 1 / 15</p>
                        <button class="mybt"
                                style="margin-left: 1%; float: right; width: 6%; border-width: medium; margin-top: 0.5%">
                            下一页
                        </button>
                        <button class="mybt"
                                style="margin-left: 1%; float: right; width: 6%; border-width: medium; margin-top: 0.5%">
                            上一页
                        </button>
                    </div>
                    <iframe src="orderList.jsp?page=1&status=2" style="width: 100%; height: 80%"></iframe>

                </div>
                <div class="am-tab-panel" style="height: 65%">
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
                    <div>
                        <p style="float: left; margin-top: 0.6%;">当前页: </p>
                        <p style="margin-left: 10%; margin-top: 0.5%; float: left; position: absolute;"
                           class="pageLabel"> 1 / 15</p>
                        <button class="mybt"
                                style="margin-left: 1%; float: right; width: 6%; border-width: medium; margin-top: 0.5%">
                            下一页
                        </button>
                        <button class="mybt"
                                style="margin-left: 1%; float: right; width: 6%; border-width: medium; margin-top: 0.5%">
                            上一页
                        </button>
                    </div>
                    <iframe src="orderList.jsp?page=1&status=1" style="width: 100%; height: 80%"></iframe>

                </div>
            </div>

            <div style="text-align: center; width: 100%;">
                <ul class="menu" style="left: 25%; margin-top: 1%" id="orderMenu">
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
                initPageLabel(1, getMaxOrderPage());
                if(id == '#all'){
                    first();
                }

                if(id == '#unchecked'){
                    first();
                }

                if(id == '#uncomformed'){
                    first();
                }

                if(id == '#unpaid'){
                    first();
                }
            }
        </script>
    </div>
</div>
<div class="foot">
    <p class="navLabel" align="center" style="position: absolute; top:97.2%; text-align: center">与子同袍项目组
        copyright@2017</p>
</div>
<script type="text/javascript" src="../static/js/amazeui.min.js" charset="utf-8"></script>
<script type="text/javascript" src="../static/js/cookie.js" charset="utf-8"></script>
<script type="text/javascript" src="../static/js/alert.js" charset="utf-8"></script>
<script type="text/javascript" src="../static/js/util.js" charset="utf-8"></script>
<script type="text/javascript" src="../static/js/menu.js" charset="utf-8"></script>
<script type="text/javascript" src="../static/js/order.js" charset="utf-8"></script>
</body>
</html>
