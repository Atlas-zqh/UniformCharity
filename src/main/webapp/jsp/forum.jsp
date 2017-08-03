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
            change('#board1');
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
                    <div class="boardIntroduction">
                        <h4 style="padding: 8%; text-align: center;">板块介绍</h4>
                    </div>

                    <div class="notesArea">
                        <div class="singleNote">
                            <a href="" class="titleP" target="_blank">ABCDEFGHIGKLMNOPQ</a>
                            <a href="" class="userP" target="_blank">ABCDEFG</a>
                        </div>
                        <div class="singleNote">
                            <a href="" class="titleP" target="_blank">ABCDEFGHIGKLMNOPQRSTUVWXYZABCDEFG</a>
                            <a href="" class="userP" target="_blank">HIJKLMN</a>
                        </div>
                        <div class="singleNote">
                            <a href="" class="titleP" target="_blank">ABCDEFGHIGKLMNOPQRSTUVWXYZABCDEFGHIGKLMNOPQRSTUVWXYZABCDEFGHIGKLMNOPQRSTUVWXYZ</a>
                            <a href="" class="userP" target="_blank">OPQRST</a>
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
                    <div class="postArea">

                    </div>

                </div>
                <div class="am-tab-panel" style="height: 65%">

                </div>
            </div>

        </div>
    </div>
    <div class="foot" style="height: 2.8%;bottom: -2.8%; position: absolute; width: 100%;">
        <p class="navLabel" align="center" style="position: absolute; text-align: center">与子同袍项目组 copyright@2017</p>
        <%--<p style="position:absolute; display: inline-block; z-index: 2; color: grey; margin-top: 0%; text-align: center; line-height: 100%; width: 100%; font-size: 90%;">与子同袍项目组 copyright@2017</p>--%>
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
