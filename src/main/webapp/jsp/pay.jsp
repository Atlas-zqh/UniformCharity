<%--
  Created by IntelliJ IDEA.
  User: island
  Date: 2017/8/9
  Time: 下午8:11
  To change this template use File | Settings | File Templates.
--%>
<%--
  Created by IntelliJ IDEA.
  User: island
  Date: 2017/7/22
  Time: 下午8:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="nav.jsp" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>与子同袍-付款</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="viewport" content="height=device-height, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="../static/css/payed.css">
    <link rel="stylesheet" type="text/css" href="../static/css/theme.css">
    <link rel="stylesheet" type="text/css" href="../static/css/alert.css">
    <script type="text/javascript" src="../static/js/jquery-3.2.1.min.js"></script>
    <script>
        $(document).ready(function () {
            checkCookie();
            var orderID = getArgsFromHref(window.location.href, "id");
            $.ajax({
                url: "/orderAction/getOrderByID",
                type: "POST",
                dataType: "json",
                data: {"orderID": orderID},
                success: function (data) {
                    if(data.success == 'true'){
                        $('#price').html(data.orderPrice);
                    }
                }
            });
        });
    </script>
</head>
<body>
<div id="contentArea">
    <div id="mainPart">
        <h1>立即支付</h1>
        <img src="../static/images/procedure2.png" style="width: 25%; float: right; margin-right: 5%; margin-top: -7%">
        <div id="infoPart">
            <h2 style="left: 25%; top: 20%; text-align: center; width: 90%">您需要支付<span id="price">188.88</span>元。
            </h2>
            <%--<h2 style="width: 60%; display: inline;">感谢您对"与子同袍"的支持！</h2>--%>
            <%--<a href="" style="font-size: 1.2vmax;" id="detail">点击查看订单详情</a>--%>
            <br>
            <button class="mybt" style="font-size: 1.5vmax; width: 30%; margin-top: 10%; margin-left: 10%;"
                    id="payBut">支&nbsp;付
            </button>
            <button class="mybt" style="font-size: 1.5vmax; width: 30%; margin-left: 10%"
                    id="cancelBut">取&nbsp;消
            </button>
        </div>
    </div>
</div>
<div class="foot">
    <p class="navLabel" align="center" style="position: absolute; top:97.2%; text-align: center">与子同袍项目组
        copyright@2017</p>
</div>
<script>
    $('#payBut').click(function () {
        var orderID = getArgsFromHref(window.location.href, "id");
        window.location.href = "../jsp/payed.jsp?id=" + orderID;
        //todo 更改订单状态
    });

    $('#cancelBut').click(function () {
        var orderID = getArgsFromHref(window.location.href, "id");
        $.ajax({
            url: "/orderAction/getOrderByID",
            type: "POST",
            dataType: "json",
            data: {"orderID": orderID},
            success: function (data) {
                if(data.success == 'true'){
                    //todo 更改订单状态
                    window.location.href = "../jsp/clothesDetails.jsp?id=" + data.clothes.clothesID;
                }
            },
            error: function () {
                fail_alert("哎呀呀，网络有一点问题...");
            }
        });
    });
</script>
<script type="text/javascript" src="../static/js/cookie.js" charset="utf-8"></script>
<script type="text/javascript" src="../static/js/util.js" charset="utf-8"></script>
<script type="text/javascript" src="../static/js/alert.js" charset="utf-8"></script>
</body>
</html>
