<%--
  Created by IntelliJ IDEA.
  User: island
  Date: 2017/8/10
  Time: 下午12:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="nav.jsp" %>
<html>
<head>
    <title>与子同袍-我的衣物</title>
    <link rel="stylesheet" type="text/css" href="../static/css/alert.css">
    <link rel="stylesheet" type="text/css" href="../static/css/amazeui.css">
    <link rel="stylesheet" type="text/css" href="../static/css/theme.css">
    <link rel="stylesheet" type="text/css" href="../static/css/clothes.css">
    <script type="text/javascript" src="../static/js/jquery-3.2.1.min.js"></script>
    <script>
        $(document).ready(function () {
            checkCookie();
        });
    </script>
</head>
<body>
<div id="clothesArea">
    <div id="mainPart" style="overflow: hidden">
        <h1 style="margin-top: 2%; margin-left: 2%">我的衣物</h1>
        <div class="am-tabs" id="doc-my-tabs" style="width: 80%; margin-left: 10%; background-color: white;">
            <ul class="am-tabs-nav am-nav am-nav-tabs am-nav-justify">
                <li class="am-active"><a href="" class="tab" onclick="change('#buy')" id="buy">我购买的衣物</a></li>
                <li><a href="" class="tab" id="donate" onclick="change('#donate')">我捐赠的衣物</a></li>
            </ul>
            <div class="am-tabs-bd">
                <div class="am-tab-panel am-active" style="height: 73%;">
                    <iframe src="clothesList.jsp?s=2" style="width: 100%; height: 100%">
                    </iframe>
                    <br>

                </div>
                <div class="am-tab-panel" style="height: 73%">
                    <iframe src="clothesList.jsp?s=1" style="width: 100%; height: 100%"></iframe>

                </div>
            </div>

        </div>
        <script>
            $(function () {
                $('#doc-my-tabs').tabs();
            });
            function change(id) {
                $('#buy').css({"color": "#87b4bf", "text-shadow": "-0.1vmax 0.1vmax 0 #315770"});
                $('#donate').css({"color": "#87b4bf", "text-shadow": "-0.1vmax 0.1vmax 0 #315770"});


                $(id).css({"color": "#DABD61", "text-shadow": "-0.1vmax 0.1vmax 0 #7A6420"});
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
