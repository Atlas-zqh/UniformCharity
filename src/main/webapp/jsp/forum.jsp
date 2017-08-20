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
            var board = decodeURIComponent(getArgsFromHref(window.location.href, 'board'));
            var page = decodeURIComponent(getArgsFromHref(window.location.href, 'page'));
            initBoardNav(board);
            initNotesArea(board, page);
            initMenu(getMaxPage(board, page), 'notesMenu', 1);
        });
    </script>

</head>
<body>
<div id="forumArea">
    <div id="forumPart">
        <h1 style="margin-top: 2%; margin-left: 2%">讨论区</h1>
        <div style="width: 10%; margin-left: 2%">
            <div id="boardNav" data-am-sticky>
                <ul id="board" class="am-nav"
                    style="background-color: #B8D7F1; border: thick solid #98BBD7;border-bottom: none; border-left: none; box-sizing: content-box;">
                    <%--<li class="am-active"><a href="#" onclick="selectBoard(this.id)" id="board1">board1</a></li>--%>
                    <%--<li><a href="#" id="board2" onclick="selectBoard(this.id)">board2</a></li>--%>
                    <%--<li><a href="#" id="board3" onclick="selectBoard(this.id)">board3</a></li>--%>
                </ul>
            </div>
        </div>
        <div style="width: 85%; margin-left: 14%; border: thin solid lightblue; background-color: white;
">
            <div class="boardIntroduction">
                <h4 style="padding: 10%; text-align: center;">板块介绍</h4>
            </div>

            <div class="notesArea" id="notesArea">
                <%--<div class="singleNote" data-am-scrollspy="{animation:'fade'}">--%>
                    <%--<a href="../jsp/noteDetails.jsp" class="titleP" target="_blank">ABCDEFGHIGKLMNOPQ</a>--%>
                    <%--<a href="" class="userP" target="_blank">ABCDEFG</a>--%>
                    <%--<p class="timeP">2017-07-18 12:12:12</p>--%>
                    <%--<img src="../static/images/browse.png" class="browseIcon">--%>
                    <%--<p class="browseP">123</p>--%>
                    <%--<img src="../static/images/comments.png" class="commentIcon">--%>
                    <%--<p class="commentP">12</p>--%>
                <%--</div>--%>
                <%--<div class="singleNote" data-am-scrollspy="{animation:'fade'}">--%>
                    <%--<a href="" class="titleP" target="_blank">ABCDEFGHIGKLMNOPQRSTUVWXYZABCDEFG</a>--%>
                    <%--<a href="" class="userP" target="_blank">HIJKLMN</a>--%>
                    <%--<p class="timeP">2017-07-18 12:12:12</p>--%>
                    <%--<img src="../static/images/browse.png" class="browseIcon">--%>
                    <%--<p class="browseP">123</p>--%>
                    <%--<img src="../static/images/comments.png" class="commentIcon">--%>
                    <%--<p class="commentP">12</p>--%>
                <%--</div>--%>
                <%--<div class="singleNote" data-am-scrollspy="{animation:'fade'}">--%>
                    <%--<a href="" class="titleP" target="_blank">ABCDEFGHIGKLMNOPQRSTUVWXYZABCDEFGHIGKLMNOPQRSTUVWXYZABCDEFGHIGKLMNOPQRSTUVWXYZ</a>--%>
                    <%--<a href="" class="userP" target="_blank">OPQRST</a>--%>
                    <%--<p class="timeP">2017-07-18 12:12:12</p>--%>
                    <%--<img src="../static/images/browse.png" class="browseIcon">--%>
                    <%--<p class="browseP">123</p>--%>
                    <%--<img src="../static/images/comments.png" class="commentIcon">--%>
                    <%--<p class="commentP">12</p>--%>
                <%--</div>--%>
                <%--<div class="singleNote" data-am-scrollspy="{animation:'fade'}">--%>
                    <%--<a href="../jsp/noteDetails.jsp" class="titleP" target="_blank">ABCDEFGHIGKLMNOPQ</a>--%>
                    <%--<a href="" class="userP" target="_blank">ABCDEFG</a>--%>
                    <%--<p class="timeP">2017-07-18 12:12:12</p>--%>
                    <%--<img src="../static/images/browse.png" class="browseIcon">--%>
                    <%--<p class="browseP">123</p>--%>
                    <%--<img src="../static/images/comments.png" class="commentIcon">--%>
                    <%--<p class="commentP">12</p>--%>
                <%--</div>--%>
                <%--<div class="singleNote" data-am-scrollspy="{animation:'fade'}">--%>
                    <%--<a href="" class="titleP" target="_blank">ABCDEFGHIGKLMNOPQRSTUVWXYZABCDEFG</a>--%>
                    <%--<a href="" class="userP" target="_blank">HIJKLMN</a>--%>
                    <%--<p class="timeP">2017-07-18 12:12:12</p>--%>
                    <%--<img src="../static/images/browse.png" class="browseIcon">--%>
                    <%--<p class="browseP">123</p>--%>
                    <%--<img src="../static/images/comments.png" class="commentIcon">--%>
                    <%--<p class="commentP">12</p>--%>
                <%--</div>--%>
                <%--<div class="singleNote" data-am-scrollspy="{animation:'fade'}">--%>
                    <%--<a href="" class="titleP" target="_blank">ABCDEFGHIGKLMNOPQRSTUVWXYZABCDEFGHIGKLMNOPQRSTUVWXYZABCDEFGHIGKLMNOPQRSTUVWXYZ</a>--%>
                    <%--<a href="" class="userP" target="_blank">OPQRST</a>--%>
                    <%--<p class="timeP">2017-07-18 12:12:12</p>--%>
                    <%--<img src="../static/images/browse.png" class="browseIcon">--%>
                    <%--<p class="browseP">123</p>--%>
                    <%--<img src="../static/images/comments.png" class="commentIcon">--%>
                    <%--<p class="commentP">12</p>--%>
                <%--</div>--%>
                <%--<div class="singleNote" data-am-scrollspy="{animation:'fade'}">--%>
                    <%--<a href="../jsp/noteDetails.jsp" class="titleP" target="_blank">ABCDEFGHIGKLMNOPQ</a>--%>
                    <%--<a href="" class="userP" target="_blank">ABCDEFG</a>--%>
                    <%--<p class="timeP">2017-07-18 12:12:12</p>--%>
                    <%--<img src="../static/images/browse.png" class="browseIcon">--%>
                    <%--<p class="browseP">123</p>--%>
                    <%--<img src="../static/images/comments.png" class="commentIcon">--%>
                    <%--<p class="commentP">12</p>--%>
                <%--</div>--%>
                <%--<div class="singleNote" data-am-scrollspy="{animation:'fade'}">--%>
                    <%--<a href="" class="titleP" target="_blank">ABCDEFGHIGKLMNOPQRSTUVWXYZABCDEFG</a>--%>
                    <%--<a href="" class="userP" target="_blank">HIJKLMN</a>--%>
                    <%--<p class="timeP">2017-07-18 12:12:12</p>--%>
                    <%--<img src="../static/images/browse.png" class="browseIcon">--%>
                    <%--<p class="browseP">123</p>--%>
                    <%--<img src="../static/images/comments.png" class="commentIcon">--%>
                    <%--<p class="commentP">12</p>--%>
                <%--</div>--%>
                <%--<div class="singleNote" data-am-scrollspy="{animation:'fade'}">--%>
                    <%--<a href="" class="titleP" target="_blank">ABCDEFGHIGKLMNOPQRSTUVWXYZABCDEFGHIGKLMNOPQRSTUVWXYZABCDEFGHIGKLMNOPQRSTUVWXYZ</a>--%>
                    <%--<a href="" class="userP" target="_blank">OPQRST</a>--%>
                    <%--<p class="timeP">2017-07-18 12:12:12</p>--%>
                    <%--<img src="../static/images/browse.png" class="browseIcon">--%>
                    <%--<p class="browseP">123</p>--%>
                    <%--<img src="../static/images/comments.png" class="commentIcon">--%>
                    <%--<p class="commentP">12</p>--%>
                <%--</div>--%>
                <%--<div class="singleNote" data-am-scrollspy="{animation:'fade'}">--%>
                    <%--<a href="../jsp/noteDetails.jsp" class="titleP" target="_blank">ABCDEFGHIGKLMNOPQ</a>--%>
                    <%--<a href="" class="userP" target="_blank">ABCDEFG</a>--%>
                    <%--<p class="timeP">2017-07-18 12:12:12</p>--%>
                    <%--<img src="../static/images/browse.png" class="browseIcon">--%>
                    <%--<p class="browseP">123</p>--%>
                    <%--<img src="../static/images/comments.png" class="commentIcon">--%>
                    <%--<p class="commentP">12</p>--%>
                <%--</div>--%>
                <%--<div class="singleNote" data-am-scrollspy="{animation:'fade'}">--%>
                    <%--<a href="" class="titleP" target="_blank">ABCDEFGHIGKLMNOPQRSTUVWXYZABCDEFG</a>--%>
                    <%--<a href="" class="userP" target="_blank">HIJKLMN</a>--%>
                    <%--<p class="timeP">2017-07-18 12:12:12</p>--%>
                    <%--<img src="../static/images/browse.png" class="browseIcon">--%>
                    <%--<p class="browseP">123</p>--%>
                    <%--<img src="../static/images/comments.png" class="commentIcon">--%>
                    <%--<p class="commentP">12</p>--%>
                <%--</div>--%>
                <%--<div class="singleNote" data-am-scrollspy="{animation:'fade'}">--%>
                    <%--<a href="" class="titleP" target="_blank">ABCDEFGHIGKLMNOPQRSTUVWXYZABCDEFGHIGKLMNOPQRSTUVWXYZABCDEFGHIGKLMNOPQRSTUVWXYZ</a>--%>
                    <%--<a href="" class="userP" target="_blank">OPQRST</a>--%>
                    <%--<p class="timeP">2017-07-18 12:12:12</p>--%>
                    <%--<img src="../static/images/browse.png" class="browseIcon">--%>
                    <%--<p class="browseP">123</p>--%>
                    <%--<img src="../static/images/comments.png" class="commentIcon">--%>
                    <%--<p class="commentP">12</p>--%>
                <%--</div>--%>
                <%--<div class="singleNote" data-am-scrollspy="{animation:'fade'}">--%>
                    <%--<a href="../jsp/noteDetails.jsp" class="titleP" target="_blank">ABCDEFGHIGKLMNOPQ</a>--%>
                    <%--<a href="" class="userP" target="_blank">ABCDEFG</a>--%>
                    <%--<p class="timeP">2017-07-18 12:12:12</p>--%>
                    <%--<img src="../static/images/browse.png" class="browseIcon">--%>
                    <%--<p class="browseP">123</p>--%>
                    <%--<img src="../static/images/comments.png" class="commentIcon">--%>
                    <%--<p class="commentP">12</p>--%>
                <%--</div>--%>
                <%--<div class="singleNote" data-am-scrollspy="{animation:'fade'}">--%>
                    <%--<a href="" class="titleP" target="_blank">ABCDEFGHIGKLMNOPQRSTUVWXYZABCDEFG</a>--%>
                    <%--<a href="" class="userP" target="_blank">HIJKLMN</a>--%>
                    <%--<p class="timeP">2017-07-18 12:12:12</p>--%>
                    <%--<img src="../static/images/browse.png" class="browseIcon">--%>
                    <%--<p class="browseP">123</p>--%>
                    <%--<img src="../static/images/comments.png" class="commentIcon">--%>
                    <%--<p class="commentP">12</p>--%>
                <%--</div>--%>
                <%--<div class="singleNote" data-am-scrollspy="{animation:'fade'}">--%>
                    <%--<a href="" class="titleP" target="_blank">ABCDEFGHIGKLMNOPQRSTUVWXYZABCDEFGHIGKLMNOPQRSTUVWXYZABCDEFGHIGKLMNOPQRSTUVWXYZ</a>--%>
                    <%--<a href="" class="userP" target="_blank">OPQRST</a>--%>
                    <%--<p class="timeP">2017-07-18 12:12:12</p>--%>
                    <%--<img src="../static/images/browse.png" class="browseIcon">--%>
                    <%--<p class="browseP">123</p>--%>
                    <%--<img src="../static/images/comments.png" class="commentIcon">--%>
                    <%--<p class="commentP">12</p>--%>
                <%--</div>--%>
                <%--<div class="singleNote" data-am-scrollspy="{animation:'fade'}">--%>
                    <%--<a href="../jsp/noteDetails.jsp" class="titleP" target="_blank">ABCDEFGHIGKLMNOPQ</a>--%>
                    <%--<a href="" class="userP" target="_blank">ABCDEFG</a>--%>
                    <%--<p class="timeP">2017-07-18 12:12:12</p>--%>
                    <%--<img src="../static/images/browse.png" class="browseIcon">--%>
                    <%--<p class="browseP">123</p>--%>
                    <%--<img src="../static/images/comments.png" class="commentIcon">--%>
                    <%--<p class="commentP">12</p>--%>
                <%--</div>--%>
                <%--<div class="singleNote" data-am-scrollspy="{animation:'fade'}">--%>
                    <%--<a href="" class="titleP" target="_blank">ABCDEFGHIGKLMNOPQRSTUVWXYZABCDEFG</a>--%>
                    <%--<a href="" class="userP" target="_blank">HIJKLMN</a>--%>
                    <%--<p class="timeP">2017-07-18 12:12:12</p>--%>
                    <%--<img src="../static/images/browse.png" class="browseIcon">--%>
                    <%--<p class="browseP">123</p>--%>
                    <%--<img src="../static/images/comments.png" class="commentIcon">--%>
                    <%--<p class="commentP">12</p>--%>
                <%--</div>--%>
                <%--<div class="singleNote" data-am-scrollspy="{animation:'fade'}">--%>
                    <%--<a href="" class="titleP" target="_blank">ABCDEFGHIGKLMNOPQRSTUVWXYZABCDEFGHIGKLMNOPQRSTUVWXYZABCDEFGHIGKLMNOPQRSTUVWXYZ</a>--%>
                    <%--<a href="" class="userP" target="_blank">OPQRST</a>--%>
                    <%--<p class="timeP">2017-07-18 12:12:12</p>--%>
                    <%--<img src="../static/images/browse.png" class="browseIcon">--%>
                    <%--<p class="browseP">123</p>--%>
                    <%--<img src="../static/images/comments.png" class="commentIcon">--%>
                    <%--<p class="commentP">12</p>--%>
                <%--</div>--%>
            </div>
            <div style="text-align: center; width: 100%;">
                <ul class="menu" style="left: 25%; margin-top: 1%" id="notesMenu">
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
                <div style="display: inline">
                    <h4 style="margin-left: 5%; position: absolute;">标题</h4>
                    <input type="text" class="postTitle" id="postTitle">
                </div>
                <div style="display: inline">
                    <h4 style="margin-left: 5%; position: absolute; margin-top:5%;">正文</h4>
                    <textarea class="postContent" id="postContent"></textarea>
                </div>
                <button class="mybt" onclick="postTopic()"
                        style="position: absolute; margin-left: 66%; margin-top: 28%; font-size: 1vmax; width: 10%; white-space: nowrap; overflow: visible; font-size: 1.5vw">
                    发表帖子
                </button>


            </div>
        </div>

    </div>
</div>
<div class="foot" style="bottom: 0%; position: absolute; width: 100%;">
    <p class="navLabel" align="center" style="position: absolute; text-align: center">与子同袍项目组 copyright@2017</p>
    <%--<p style="position:absolute; display: inline-block; z-index: 2; color: grey; margin-top: 0%; text-align: center; line-height: 100%; width: 100%; font-size: 90%;">与子同袍项目组 copyright@2017</p>--%>
</div>
<script type="text/javascript" src="../static/js/amazeui.js" charset="utf-8"></script>
<script type="text/javascript" src="../static/js/cookie.js" charset="utf-8"></script>
<script type="text/javascript" src="../static/js/forum.js" charset="utf-8"></script>
<script type="text/javascript" src="../static/js/alert.js" charset="utf-8"></script>
<script type="text/javascript" src="../static/js/util.js" charset="utf-8"></script>
<script type="text/javascript" src="../static/js/menu.js" charset="utf-8"></script>
</body>
</html>
