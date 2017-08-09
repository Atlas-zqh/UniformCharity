<%--
  Created by IntelliJ IDEA.
  User: island
  Date: 2017/7/21
  Time: 下午1:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="nav.jsp" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>与子同袍-衣物详情</title>
    <link rel="stylesheet" type="text/css" href="../static/css/clothesDetail.css">

    <%--<link rel="stylesheet" type="text/css" href="http://cdn.amazeui.org/amazeui/2.7.2/css/amazeui.css">--%>
    <%--<link rel="stylesheet" type="text/css" href="http://cdn.amazeui.org/amazeui/2.7.2/css/amazeui.min.css">--%>
    <link rel="stylesheet" type="text/css" href="../static/css/theme.css">
    <link rel="stylesheet" type="text/css" href="../static/css/alert.css">
    <script type="text/javascript" src="../static/js/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="../static/js/jquery.min.js" charset="utf-8"></script>
    <script>
        $(document).ready(function () {
            checkCookie();
        });
    </script>
</head>
<body>

<div id="detailArea">
    <div id="headPart">
        <h1>衣物信息</h1>
        <div id="imageArea">
            <div style="">
                <div class="imageBox" style="width: 36vmax; height: 36vmax; margin-left: 5%; margin-top: 5%">
                    <img src="" class="largeImage" id="pic"/>
                </div>
                <br>
                <div class="imageBox" style="width: 9vmax; height: 9vmax; display: table-cell" id="box1">
                    <img src="" class="largeImage" id="pic1" onmousemove="changePic('pic1')"/>
                </div>
                <div class="imageBox" style="width: 9vmax; height: 9vmax; display: none" id="box2">
                    <img src="" class="largeImage" id="pic2" onmousemove="changePic('pic2')"/>
                </div>
                <div class="imageBox" style="width: 9vmax; height: 9vmax; display: none" id="box3">
                    <img src="" class="largeImage" id="pic3" onmousemove="changePic('pic3')"/>
                </div>
                <div class="imageBox" style="width: 9vmax; height: 9vmax; display: none" id="box4">
                    <img src="" class="largeImage" id="pic4" onmousemove="changePic('pic4')"/>
                </div>
            </div>
        </div>
        <div id="infoArea">
            <h2 id="title"></h2>
            <br>
            <h5 style="position: absolute; margin-left: 1%; margin-top: 0%">衣物ID:</h5>
            <p id="clothesID" class="contentP" style="position: absolute; margin-left: 10%; margin-top: 0.3%"></p>
            <h5 style="position: absolute; margin-left: 1%; margin-top: 5%;">捐赠者:</h5>
            <a href="" id="user" style="position: absolute; margin-left: 10%; margin-top: 5.3%;"></a>
            <h5 style="position: absolute; margin-left: 1%; margin-top: 10%">学校:</h5>
            <p id="school" class="contentP" style="position: absolute; margin-left: 10%; margin-top: 10.3%">
                </p>
            <h5 style="position: absolute; margin-left: 1%; margin-top: 15%">款式:</h5>
            <p id="type" class="contentP" style="position: absolute; margin-left: 10%; margin-top: 15.3%"></p>
            <h5 style="position: absolute; margin-left: 1%; margin-top: 20%">性别:</h5>
            <p id="gender" class="contentP" style="position: absolute; margin-left: 10%; margin-top: 20.3%"></p>
            <h5 style="position: absolute; margin-left: 1%; margin-top: 25%">尺寸:</h5>
            <p id="size" class="contentP" style="position: absolute; margin-left: 10%; margin-top: 25.3%"></p>
            <h5 style="position: absolute; margin-left: 1%; margin-top: 30%">状态:</h5>
            <p id="status" class="contentP" style="position: absolute; margin-left: 10%; margin-top: 30.3%"></p>
            <h5 style="position: absolute; margin-left: 1%; margin-top: 35%">价格:</h5>
            <h3 id="price" class="" style="position: absolute; margin-left: 10%; margin-top: 34.5%"></h3>
            <button class="mybt" style="position:absolute; margin-top: 38%; margin-left: 23%; font-size: 1.5vmax; width: 20%" onclick="buyClothes()">立 即 购 买</button>
        </div>
    </div>

    <div id="detailPart">
        <h1>图片详情</h1>
        <%--<img src="../static/images/infoBG.png" id="largePic1"/>--%>
        <%--<img src="../static/images/FundBulletin.png"/>--%>
        <%--<img src="../static/images/mainBG2.png"/>--%>
    </div>

    <!--<div class="am-slider am-slider-default" data-am-flexslider="{controlNav: 'thumbnails', directionNav: false, slideshow: false}">-->
    <!--<ul class="am-slides">-->
    <!--<li data-thumb="../images/FundBulletin.png">-->
    <!--<img src="../images/FundBulletin.png"/></li>-->
    <!--<li data-thumb="../images/mainBG2.png">-->
    <!--<img src="../images/mainBG2.png"/></li>-->
    <!--<li data-thumb="../images/mainBG1.png">-->
    <!--<img src="../images/mainBG1.png"/></li>-->
    <!--<li data-thumb="../images/mainBG2.png">-->
    <!--<img src="../images/mainBG2.png"/></li>-->
    <!--</ul>-->
    <!--</div>-->
    <div class="foot" style="bottom: 0%; position: absolute; width: 100%;">
        <p class="navLabel" align="center" style="position: absolute; text-align: center">与子同袍项目组 copyright@2017</p>
        <%--<p style="position:absolute; display: inline-block; z-index: 2; color: grey; margin-top: 0%; text-align: center; line-height: 100%; width: 100%; font-size: 90%;">与子同袍项目组 copyright@2017</p>--%>
    </div>
</div>

<script type="text/javascript" src="../static/js/cookie.js" charset="utf-8"></script>
<script type="text/javascript" src="../static/js/alert.js" charset="utf-8"></script>
<script type="text/javascript" src="../static/js/util.js" charset="utf-8"></script>
<script type="text/javascript" src="../static/js/clothesDetails.js" charset="utf-8"></script>

<%--<script type="text/javascript" src="http://cdn.amazeui.org/amazeui/2.7.2/js/amazeui.js" charset="utf-8"></script>--%>

</body>
</html>
