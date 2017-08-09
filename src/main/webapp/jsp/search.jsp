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
    <title>与子同袍-搜索结果</title>
    <link rel="stylesheet" href="../static/css/searchResult.css"/>
    <link rel="stylesheet" href="../static/css/alert.css"/>
    <link rel="stylesheet" href="../static/css/log.css"/>
    <link rel="stylesheet" href="../static/css/theme.css"/>
    <link rel="stylesheet" href="../static/css/menu.css" media="screen" type="text/css"/>
    <!--<link rel="stylesheet" href="../css/main.css"/>-->
    <!--<link rel="stylesheet" type="text/css" href="http://cdn.amazeui.org/amazeui/2.7.2/css/amazeui.css">-->
    <!--<link rel="stylesheet" type="text/css" href="http://cdn.amazeui.org/amazeui/2.7.2/css/amazeui.min.css">-->
    <script type="text/javascript" src="../static/js/jquery-3.2.1.min.js"></script>
    <script>
        $(document).ready(function () {
            checkCookie();
            getAllSchool('school');
//            alert(school);
            var school = decodeURIComponent(getArgsFromHref(window.location.href, 'school'));
            var type = decodeURIComponent(getArgsFromHref(window.location.href, 'type'));
            var gender = decodeURIComponent(getArgsFromHref(window.location.href, 'gender'));
            var size = decodeURIComponent(getArgsFromHref(window.location.href, 'size'));
            var page = decodeURIComponent(getArgsFromHref(window.location.href, 'page'));
            clearSelectList('type');
            getAllTypesOfSchool('type', school);
            initPage(page);
//            showResult(school, type, gender, size, page);
//            alert(getMaxPage(school, type, gender, size));
            initMenu(getMaxPage(school, type, gender, size), 'menu', page);



//            showResult(school, type, gender, size, 1);
        });
    </script>

</head>
<body>
<div id="bgPage"></div>
<div id="resultPage">
    <div id="searchPane">
        <p class="titleP">搜<br>索</p>
        <p class="labelP" style="margin-left: 15%; margin-top: 2.8%">性别</p>
        <div style="display: inline-block; position:absolute; width: 10%; margin-top: 2.4%; padding-bottom: 3.2%; margin-left: 20%">
            <select data-select-like-alignement="auto" class="drop-select" style="display:inline; width: 20%;"
                    id="gender">
                <option value="男" selected="selected">男</option>
                <option value="女">女</option>
            </select>
        </div>
        <p class="labelP" style="margin-left: 15%; margin-top: 7.8%">尺寸</p>
        <div style="display: inline-block; position:absolute; width: 10%; margin-top: 7.4%; padding-bottom: 3.2%; margin-left: 20%">
            <select data-select-like-alignement="auto" class="drop-select" id="size">
                <option value="XXXS">XXXS</option>
                <option value="XXS">XXS</option>
                <option value="XS">XS</option>
                <option value="S">S</option>
                <option value="M">M</option>
                <option value="L">L</option>
                <option value="XL">XL</option>
                <option value="XXL">XXL</option>
                <option value="XXXL">XXXL</option>
            </select>
        </div>
        <p class="labelP" style="margin-left: 50%; margin-top: 2.8%">学校</p>
        <div style="display: inline-block; position:absolute; width: 25%; margin-top: 2.4%; padding-bottom: 3.2%; margin-left: 55%"
             onchange="changeSchool('type', 'school')">
            <select data-select-like-alignement="auto" class="drop-select" id="school">
            </select>
        </div>
        <p class="labelP" style="margin-left: 50%; margin-top: 7.8%">款式</p>
        <div style="display: inline-block; position:absolute; width: 13%; margin-top: 7.4%; padding-bottom: 3.2%; margin-left: 55%">
            <select data-select-like-alignement="auto" class="drop-select" id="type">
            </select>
        </div>
        <button class="mybt"
                style="margin-left: 70%; margin-top: 7.5%; position: absolute; font-size: 1.5vmax; padding-bottom: 0.3%; white-space: nowrap"
                onclick="search()">搜索
        </button>
    </div>
    <div id="contentPage">
        <h1>搜索结果</h1>
        <h2 style="width: 100%; text-align: center; padding: 3%; display: none;" id="noResultLabel">哎呀，没有搜索结果，换个条件再试试吧！</h2>
        <%--<div class="singleClothe">--%>
            <%--<img src="">--%>
            <%--<p class="priceP">¥188.00</p>--%>
            <%--<a href="../jsp/clothesDetails.jsp?id=111" class="nameP">hahahahahahahahahahahahahahahahahahahahahahahaha</a>--%>
            <%--<a href="" class="userP">XXX</a>--%>
            <%--<p class="infoP">男</p>--%>
            <%--<p class="infoP" style="margin-left: 20%;">L</p>--%>

        <%--</div>--%>

    </div>
    <div style="text-align: center; padding-bottom: 3%;">
        <ul class="menu" id="menu">
            <li><a href="#" onclick="previous()">Previous</a></li>
            <li><a href="#">1</a></li>
            <li><a href="#" onclick="next()">Next</a></li>
        </ul>
    </div>

    <div class="foot" style="bottom: 0%; position: absolute; width: 100%;">
        <p class="navLabel" align="center" style="position: absolute; text-align: center">与子同袍项目组 copyright@2017</p>
        <%--<p style="position:absolute; display: inline-block; z-index: 2; color: grey; margin-top: 0%; text-align: center; line-height: 100%; width: 100%; font-size: 90%;">与子同袍项目组 copyright@2017</p>--%>
    </div>
</div>

<script type="text/javascript" src="../static/js/jquery.min.js" charset="utf-8"></script>
<script type="text/javascript" src="../static/js/cookie.js" charset="utf-8"></script>
<script type="text/javascript" src="../static/js/alert.js" charset="utf-8"></script>
<script type="text/javascript" src="../static/js/tether.js"></script>
<script type="text/javascript" src="../static/js/alert.js"></script>
<script type="text/javascript" src="../static/js/select.js"></script>
<script type="text/javascript" src="../static/js/clothes.js"></script>
<script type="text/javascript" src="../static/js/util.js" charset="utf-8"></script>
<script type="text/javascript" src="../static/js/search.js" charset="utf-8"></script>
<script type="text/javascript" src="../static/js/menu.js" charset="utf-8"></script>
<!--<script type="text/javascript" src="http://cdn.amazeui.org/amazeui/2.7.2/js/amazeui.js" charset="utf-8"></script>-->
<script>
    $('select.drop-select').each(function () {
        new Select({
            el: this,
            selectLikeAlignment: $(this).attr('data-select-like-alignement') || 'auto',
            className: 'select-theme-dark'
        });
    });

    $(document).ready(function () {
//        var school = decodeURIComponent(getArgsFromHref(window.location.href, 'school'));
//        var type = decodeURIComponent(getArgsFromHref(window.location.href, 'type'));
//        var gender = decodeURIComponent(getArgsFromHref(window.location.href, 'gender'));
//        var size = decodeURIComponent(getArgsFromHref(window.location.href, 'size'));
////        $('#type').find("option[text=" + type + "]").attr("selected", "selected");
////        $('#size').find("option[text=" + size + "]").attr("selected", true);
//        setSelected('size', size);
//        setSelected('school', school);
//        getAllTypesOfSchool('type', school);
//        fail_alert(type);
//        setSelected('type', type);
//        setSelected('gender', gender);
    });

    function setAllSelect() {
    }
</script>
</body>
</html>
