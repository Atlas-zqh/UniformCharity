<%--
  Created by IntelliJ IDEA.
  User: island
  Date: 2017/8/1
  Time: 上午9:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="nav.jsp" %>
<html>
<head>
    <title>与子同袍-讨论区</title>
    <link rel="stylesheet" type="text/css" href="../static/css/forum.css">
    <link rel="stylesheet" type="text/css" href="../static/css/alert.css">
    <link rel="stylesheet" type="text/css" href="../static/css/amazeui.css">
    <link rel="stylesheet" type="text/css" href="../static/css/theme.css">
    <link rel="stylesheet" href="../static/css/menu.css" media="screen" type="text/css"/>
    <script type="text/javascript" src="../static/js/jquery-3.2.1.min.js"></script>
    <script>
        $(document).ready(function () {
            checkCookie();
        });
    </script>

</head>
<body>
<div id="forumArea">
    <div id="forumPart">
        <h1 style="margin-top: 2%; margin-left: 2%">讨论区</h1>

        <div class="am-tabs" id="doc-my-tabs" style="width: 90%; margin-left: 5%">
            <ul class="am-tabs-nav am-nav am-nav-tabs am-nav-justify">
                <li class="am-active"><a href="" class="tab" onclick="change('#board1')" id="board1">板块1</a></li>
                <li><a href="" class="tab" id="board2" onclick="change('#board2')">板块2</a></li>
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

                </div>
            </div>

            <div style="text-align: center; width: 76%; position: absolute;">
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
    </div>

</div>
<script type="text/javascript" src="../static/js/amazeui.min.js" charset="utf-8"></script>
<script type="text/javascript" src="../static/js/cookie.js" charset="utf-8"></script>
<script type="text/javascript" src="../static/js/alert.js" charset="utf-8"></script>
<script type="text/javascript" src="../static/js/util.js" charset="utf-8"></script>
<script type="text/javascript" src="../static/js/menu.js" charset="utf-8"></script>
<script>
    $(function () {
        $('#doc-my-tabs').tabs();
    });
    function change(id) {
        $('#board1').css({"color": "#87b4bf", "text-shadow": "-0.1vmax 0.1vmax 0 #315770"});
        $('#board2').css({"color": "#87b4bf", "text-shadow": "-0.1vmax 0.1vmax 0 #315770"});

        $(id).css({"color": "#DABD61", "text-shadow": "-0.1vmax 0.1vmax 0 #7A6420"});
//        initPageLabel(1, getMaxOrderPage());
//        if(id == '#all'){
//            first();
//        }
//
//        if(id == '#unchecked'){
//            first();
//        }
    }
</script>
</body>
</html>
