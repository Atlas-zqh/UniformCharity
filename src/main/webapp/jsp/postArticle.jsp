<%--
  Created by IntelliJ IDEA.
  User: island
  Date: 2017/8/22
  Time: 下午7:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div id="postArticleView" style="display: none">
    <div id="postArticleContent">
        <h1>发<br>表<br>文<br>章</h1>
            <h6 style="position: absolute; top: 5%; width: 100%; text-align: center;">标题</h6>
            <input type="text" class="postTitle" id="postTitle">
            <h6 style="position: absolute; top: 25%; width: 100%; text-align: center;">正文</h6>
            <textarea class="postContent" id="postContent"></textarea>
        <button class="mybt" onclick="addPassage()"
                style="position: absolute; left: 40%; top: 90%; font-size: 2vh; width: 20%; white-space: nowrap; overflow: visible;">
            发表帖子
        </button>
    </div>
</div>
<script type="text/javascript" src="../static/js/passage.js"></script>
