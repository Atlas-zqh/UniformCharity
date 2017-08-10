<%--
  Created by IntelliJ IDEA.
  User: island
  Date: 2017/8/10
  Time: 下午3:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html style="background: #ffffff">
<head>
    <link rel="stylesheet" href="../static/css/theme.css"/>
    <link rel="stylesheet" type="text/css" href="../static/css/clothes.css">
    <link rel="stylesheet" type="text/css" href="../static/css/alert.css">
    <script type="text/javascript" src="../static/js/jquery-3.2.1.min.js"></script>
    <script>
        $(document).ready(function () {
            var s = decodeURIComponent(getArgsFromHref(window.location.href, 's'));
            getAllClothes(s);
        });
    </script>
</head>
<body style="background: #ffffff" id="contentPage">
<h4 style="font-size:3vmax; width: 100%; text-align: center; top: 45%; position:absolute;" id="noClothesLabel">暂无衣物</h4>
<%--<div class="singleClothe">--%>
    <%--<img src="">--%>
    <%--<p class="priceP">¥188.00</p>--%>
    <%--<a href="../jsp/clothesDetails.jsp?id=111" class="nameP">hahahahahahahahahahahahahahahahahahahahahahahaha</a>--%>
    <%--<a href="" class="userP">XXX</a>--%>
    <%--<p class="infoP">男&nbsp;L</p>--%>
<%--</div>--%>
<%--<div class="singleClothe">--%>
    <%--<img src="">--%>
    <%--<p class="priceP">¥188.00</p>--%>
    <%--<a href="../jsp/clothesDetails.jsp?id=111" class="nameP">hahahahahahahahahahahahahahahahahahahahahahahaha</a>--%>
    <%--<a href="" class="userP">XXX</a>--%>
    <%--<p class="infoP">男&nbsp;L</p>--%>
<%--</div>--%>
<%--<div class="singleClothe">--%>
    <%--<img src="">--%>
    <%--<p class="priceP">¥188.00</p>--%>
    <%--<a href="../jsp/clothesDetails.jsp?id=111" class="nameP">hahahahahahahahahahahahahahahahahahahahahahahaha</a>--%>
    <%--<a href="" class="userP">XXX</a>--%>
    <%--<p class="infoP">男&nbsp;L</p>--%>
<%--</div>--%>
<%--<div class="singleClothe">--%>
    <%--<img src="">--%>
    <%--<p class="priceP">¥188.00</p>--%>
    <%--<a href="../jsp/clothesDetails.jsp?id=111" class="nameP">hahahahahahahahahahahahahahahahahahahahahahahaha</a>--%>
    <%--<a href="" class="userP">XXX</a>--%>
    <%--<p class="infoP">男&nbsp;L</p>--%>
<%--</div>--%>
<%--<div class="singleClothe">--%>
    <%--<img src="">--%>
    <%--<p class="priceP">¥188.00</p>--%>
    <%--<a href="../jsp/clothesDetails.jsp?id=111" class="nameP">hahahahahahahahahahahahahahahahahahahahahahahaha</a>--%>
    <%--<a href="" class="userP">XXX</a>--%>
    <%--<p class="infoP">男&nbsp;L</p>--%>
<%--</div>--%>
<script type="text/javascript" src="../static/js/clothes.js" charset="utf-8"></script>
<script type="text/javascript" src="../static/js/util.js" charset="utf-8"></script>
<script type="text/javascript" src="../static/js/cookie.js" charset="utf-8"></script>
<script type="text/javascript" src="../static/js/alert.js" charset="utf-8"></script>
</body>
</html>
