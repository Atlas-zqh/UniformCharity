<%--
  Created by IntelliJ IDEA.
  User: island
  Date: 2017/8/3
  Time: 下午11:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="nav.jsp" %>
<html>
<head>
    <title>与子同袍-帖子详情</title>
    <link rel="stylesheet" type="text/css" href="../static/css/note.css">
    <link rel="stylesheet" type="text/css" href="../static/css/alert.css">
    <link rel="stylesheet" type="text/css" href="../static/css/amazeui.css">
    <link rel="stylesheet" type="text/css" href="../static/css/theme.css">
    <link rel="stylesheet" href="../static/css/menu.css" media="screen" type="text/css"/>
    <script type="text/javascript" src="../static/js/jquery-3.2.1.min.js"></script>
    <script>
        $(document).ready(function () {
            checkCookie();
            var id = decodeURIComponent(getArgsFromHref(window.location.href, 'id'));
            var page = decodeURIComponent(getArgsFromHref(window.location.href, 'page'));
            initNoteInfo(id, page)
            initMenu(getMaxPage(id, page), 'noteMenu', 1);
        });
    </script>

</head>
<body>
<div id="noteArea">
    <div id="notePart">
        <h1>帖子详情</h1>
        <div id="noteTitle">
            <p></p>
        </div>
        <div id="noteContent">
            <%--<div class="singleNote">--%>
                <%--<div class="userBlock">--%>
                    <%--<img src="../static/images/mainBG1.png">--%>
                    <%--<a href="" class="userP">ABCDEF</a>--%>
                <%--</div>--%>
                <%--<div class="contentBlock">--%>
                    <%--<p class="contentP">ABCDEFGHIGKLMNOP</p>--%>
                    <%--<p class="timeP">2017-07-07 12:12:12</p>--%>
                    <%--<p class="floorP">楼主</p>--%>
                <%--</div>--%>
            <%--</div>--%>
            <%--<div class="singleNote">--%>
                <%--<div class="userBlock">--%>
                    <%--<img src="../static/images/mainBG1.png">--%>
                    <%--<a href="" class="userP">ABCDEF</a>--%>
                <%--</div>--%>
                <%--<div class="contentBlock">--%>
                    <%--<p class="contentP">QRSTUVWXYZABCDEFGQRSTUVWXYZABCDEFGQRSTUVWXYZABCDEFGQRSTUVWXYZABCDEFGQRSTUVWXYZABCDEFG</p>--%>
                    <%--<p class="timeP">2017-07-07 12:12:12</p>--%>
                <%--</div>--%>
            <%--</div>--%>
            <%--<div class="singleNote">--%>
                <%--<div class="userBlock">--%>
                    <%--<img src="../static/images/mainBG1.png">--%>
                    <%--<a href="" class="userP">ABCDEF</a>--%>
                <%--</div>--%>
                <%--<div class="contentBlock">--%>
                    <%--<p class="contentP">QRSTUVWXYZABCDEFGQRSTUVWXYZABCDEFGQRSTUVWXYZABCDEFGQRSTUVWXYZABCDEFGQRSTUVWXYZABCDEFG</p>--%>
                    <%--<p class="timeP">2017-07-07 12:12:12</p>--%>
                <%--</div>--%>
            <%--</div>--%>
        </div>
        <div style="background-color: #d5e0ea; width: 80%; margin-left: 10%;">
        <div style="text-align: center; width: 100%; padding: 2%;">
            <ul class="menu" style="left: 25%; padding: 1%; margin-top: 0%" id="noteMenu">
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
        <div class="postArea">
            <div style="display: inline">
                <h4 style="margin-left: 10%; position: absolute; margin-top: 3%;">跟帖</h4>
                <textarea class="postContent"></textarea>
            </div>
            <button class="mybt" onclick="postReply()"
                    style="margin-left: 52%; font-size: 1vmax; width: 8%; border-width: medium; position: absolute; margin-top: 25%; white-space: nowrap">发表帖子
            </button>


        </div>
    </div>
    <div class="foot" style="bottom: 0%; position: absolute; width: 100%;">
        <p class="navLabel" align="center" style="position: absolute; text-align: center">与子同袍项目组 copyright@2017</p>
        <%--<p style="position:absolute; display: inline-block; z-index: 2; color: grey; margin-top: 0%; text-align: center; line-height: 100%; width: 100%; font-size: 90%;">与子同袍项目组 copyright@2017</p>--%>
    </div>
</div>

<script type="text/javascript" src="../static/js/amazeui.min.js" charset="utf-8"></script>
<script type="text/javascript" src="../static/js/cookie.js" charset="utf-8"></script>
<script type="text/javascript" src="../static/js/alert.js" charset="utf-8"></script>
<script type="text/javascript" src="../static/js/util.js" charset="utf-8"></script>
<script type="text/javascript" src="../static/js/menu.js" charset="utf-8"></script>
<script type="text/javascript" src="../static/js/note.js" charset="utf-8"></script>
</body>
</html>
