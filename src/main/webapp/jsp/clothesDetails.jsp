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
    <title></title>
    <link rel="stylesheet" type="text/css" href="../static/css/clothesDetail.css">

    <%--<link rel="stylesheet" type="text/css" href="http://cdn.amazeui.org/amazeui/2.7.2/css/amazeui.css">--%>
    <%--<link rel="stylesheet" type="text/css" href="http://cdn.amazeui.org/amazeui/2.7.2/css/amazeui.min.css">--%>
    <link rel="stylesheet" type="text/css" href="../static/css/theme.css">
</head>
<body>

<div id="detailArea">
    <div id="headPart">
        <h1>衣物信息</h1>
        <div id="imageArea">
            <div style="">
                <div class="imageBox" style="width: 36vmax; height: 36vmax; margin-left: 5%; margin-top: 5%">
                    <img src="../static/images/mainBG2.png" class="largeImage"/>
                </div>
                <br>
                <div class="imageBox" style="width: 9vmax; height: 9vmax;" id="pic1">
                    <img src="../static/images/mainBG2.png" class="largeImage"/>
                </div>
                <div class="imageBox" style="width: 9vmax; height: 9vmax;" id="pic2">
                    <img src="../static/images/mainBG2.png" class="largeImage"/>
                </div>
                <div class="imageBox" style="width: 12vmax; height: 12vmax; display: none" id="pic3">
                    <img src="../static/images/mainBG2.png" class="largeImage"/>
                </div>
                <div class="imageBox" style="width: 9vmax; height: 9vmax; display: none" id="pic4">
                    <img src="../static/images/mainBG2.png" class="largeImage"/>
                </div>
            </div>
        </div>
        <div id="infoArea">
            <h2 id="title">南京外国语学校仙林分校夏季男款短袖</h2>
            <br>
            <h5 style="position: absolute; margin-left: 1%; margin-top: 0%;">捐赠者:</h5>
            <a href="" id="user" style="position: absolute; margin-left: 7%; margin-top: 0%;">123456(XXX)</a>
            <h5 style="position: absolute; margin-left: 1%; margin-top: 5%">学校:</h5>
            <p id="school" class="contentP" style="position: absolute; margin-left: 5.5%; margin-top: 5.3%">
                南京外国语学校仙林分校</p>
            <h5 style="position: absolute; margin-left: 1%; margin-top: 10%">款式:</h5>
            <p id="type" class="contentP" style="position: absolute; margin-left: 5.5%; margin-top: 10.3%">夏季短袖T恤</p>
            <h5 style="position: absolute; margin-left: 1%; margin-top: 15%">性别:</h5>
            <p id="gender" class="contentP" style="position: absolute; margin-left: 5.5%; margin-top: 15.3%">男</p>
            <h5 style="position: absolute; margin-left: 1%; margin-top: 20%">尺寸:</h5>
            <p id="size" class="contentP" style="position: absolute; margin-left: 5.5%; margin-top: 20.3%">M</p>
            <button class="mybt" style="position:absolute; margin-top: 28%; margin-left: 20%; font-size: 1.5vmax; width: 20%">立 即 购 买</button>
        </div>
    </div>

    <div id="detailPart">
        <h1>图片详情</h1>
        <img src="../static/images/infoBG.png"/>
        <img src="../static/images/FundBulletin.png"/>
        <img src="../static/images/mainBG2.png"/>

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
</div>

<script type="text/javascript" src="../static/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="../static/js/jquery.min.js" charset="utf-8"></script>

<%--<script type="text/javascript" src="http://cdn.amazeui.org/amazeui/2.7.2/js/amazeui.js" charset="utf-8"></script>--%>

</body>
</html>
