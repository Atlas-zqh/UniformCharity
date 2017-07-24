<%--
  Created by IntelliJ IDEA.
  User: island
  Date: 2017/7/11
  Time: 下午5:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="nav.jsp" %>

<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Title</title>
    <link rel="stylesheet" href="../static/css/searchResult.css"/>
    <!--<link rel="stylesheet" href="../css/theme.css"/>-->
    <link rel="stylesheet" href="../static/css/theme.css"/>
    <link rel="stylesheet" href="../static/css/menu.css" media="screen" type="text/css" />
    <!--<link rel="stylesheet" href="../css/main.css"/>-->
    <!--<link rel="stylesheet" type="text/css" href="http://cdn.amazeui.org/amazeui/2.7.2/css/amazeui.css">-->
    <!--<link rel="stylesheet" type="text/css" href="http://cdn.amazeui.org/amazeui/2.7.2/css/amazeui.min.css">-->
    <script type="text/javascript" src="../static/js/jquery-3.2.1.min.js"></script>

</head>
<body>
<div id="bgPage"></div>
<div id="resultPage">
    <div id="searchPane">
        <p class="titleP">搜<br>索</p>
        <p class="labelP" style="margin-left: 10%; margin-top: 2.8%">性别</p>
        <div style="display: inline-block; position:absolute; width: 7%; margin-top: 2.4%; padding-bottom: 3.2%; margin-left: 15%">
            <select data-select-like-alignement="auto" class="drop-select" style="display:inline; width: 20%;">
                <option value="b" selected="selected">男</option>
                <option value="g">女</option>
            </select>
        </div>
        <p class="labelP" style="margin-left: 30%; margin-top: 2.8%">尺寸</p>
        <div style="display: inline-block; position:absolute; width: 10%; margin-top: 2.4%; padding-bottom: 3.2%; margin-left: 35%">
            <select data-select-like-alignement="auto" class="drop-select">
                <option value="a" selected="selected">S</option>
                <option value="b">M</option>
                <option value="c">L</option>
                <option value="d">XL</option>
            </select>
        </div>
        <p class="labelP" style="margin-left: 50%; margin-top: 2.8%">学校</p>
        <div style="display: inline-block; position:absolute; width: 25%; margin-top: 2.4%; padding-bottom: 3.2%; margin-left: 55%">

            <select data-select-like-alignement="auto" class="drop-select">
                <option value="a" selected="selected"></option>
                <option value="b">南京外国语学校仙林分校</option>
                <option value="g">南京</option>
            </select>
        </div>
        <button class="mybt" style="margin-left: 85%;margin-top: 2.5%; position: absolute; font-size: 1.5vmax;">搜索
        </button>
    </div>
    <div id="contentPage">
        <div class="singleClothe">
            <img src="">
            <p class="priceP">¥188.00</p>
            <a href="" class="nameP">hahahahahahahahahahahahahahahahahahahahahahahaha</a>
            <a href="" class="userP">XXX</a>
        </div>
        <div class="singleClothe"></div>
        <div class="singleClothe"></div>
        <div class="singleClothe"></div>
        <div class="singleClothe"></div>

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
<script type="text/javascript" src="../static/js/jquery.min.js" charset="utf-8"></script>
<script type="text/javascript" src="../static/js/tether.js"></script>
<script type="text/javascript" src="../static/js/select.js"></script>
<!--<script type="text/javascript" src="http://cdn.amazeui.org/amazeui/2.7.2/js/amazeui.js" charset="utf-8"></script>-->
<script>
    $('select.drop-select').each(function () {
        new Select({
            el: this,
            selectLikeAlignment: $(this).attr('data-select-like-alignement') || 'auto',
            className: 'select-theme-dark'
        });
    });
</script>
</body>
</html>
