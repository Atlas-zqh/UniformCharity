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
    <link rel="stylesheet" href="../static/css/theme.css"/>
    <link rel="stylesheet" href="../static/css/log.css"/>
    <link rel="stylesheet" href="../static/css/custom_up_img.css">
    <link rel="stylesheet" href="../static/css/amazeui.min.css">
    <link rel="stylesheet" href="../static/css/amazeui.cropper.css">
    <link rel="stylesheet" href="../static/css/main.css"/>
    <link rel="stylesheet" type="text/css" href="http://cdn.amazeui.org/amazeui/2.7.2/css/amazeui.css">
    <link rel="stylesheet" type="text/css" href="http://cdn.amazeui.org/amazeui/2.7.2/css/amazeui.min.css">

    <script type="text/javascript" src="../static/js/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"></script>
    <%--<script type="text/javascript" src="http://jquery-json.googlecode.com/files/jquery.json-2.2.min.js"></script>--%>
    <script>
        $(document).ready(function () {
            $('#tab1').click(function () {
                $('#tab2').css("background", "none repeat scroll 0 0 #97d5dd");
                $('#tab2').css("text-shadow", "0 2px 0 #39576e");

                $('#tab1').css("background", "none repeat scroll 0 0 #39576e");
                $('#tab1').css("text-shadow", "0 2px 0 grey");
                $('#tableA').css("display", "inline-block");
                $('#tableB').css("display", "none");
            });
        });

        $(document).ready(function () {
            $('#tab2').click(function () {
                $('#tab1').css("background", "none repeat scroll 0 0 #97d5dd");
                $('#tab1').css("text-shadow", "0 2px 0 #39576e");

                $('#tab2').css("background", "none repeat scroll 0 0 #39576e");
                $('#tab2').css("text-shadow", "0 2px 0 grey");
                $('#tableB').css("display", "inline-block");
                $('#tableA').css("display", "none");
            });
        });

    </script>
    <%--<style type="text/css">--%>
    <%--.up-img-cover {width: 100px;height: 100px;}--%>
    <%--.up-img-cover img{width: 100%;}--%>
    <%--</style>--%>
</head>

<body>
<%--<div id="nav">--%>
<%--<div class="topNavBar">--%>
<%--<p class="navLabel" align="center">与 子 同 袍</p>--%>
<%--</div>--%>
<%--<div class="leftNavBar" align="left">--%>
<%--<div class="bt"><a href="index.jsp">首<br>页</a></div>--%>
<%--<div class="navLabel"><p><br>—<br></p></div>--%>
<%--<div class="bt"><a href="userInfo.jsp">我<br>的<br>主<br>页</a></div>--%>
<%--<div class="navLabel"><p><br>—<br></p></div>--%>
<%--<div class="bt"><a href="../static/html/404.html">我<br>的<br>交<br>易</a></div>--%>
<%--</div>--%>
<%--<div class="rightNavBar" align="right">--%>
<%--<div class="bt" id="loginButton"><a href="#toLoginPanel" onclick="showLoginPanel()">登<br>录</a></div>--%>
<%--<div class="navLabel"><p><br>—<br></p></div>--%>
<%--<div class="bt"><a href="#toSignupPanel" onclick="showSignupPanel()">注<br>册</a></div>--%>
<%--</div>--%>
<%--</div>--%>

<div id="mainPage"></div>

<div id="loginPanel">
    <p class="label"
       style="background: url(/static/images/UserNameLabel.png); background-size: cover; margin-left: 40.5%; margin-top: 36%; width: 20%"></p>
    <input id="username" class="textInput" style="width: 50%; margin-left: 25%; margin-top: 43%;">
    <p class="label"
       style="background: url(/static/images/PasswordLabel.png); background-size: cover; margin-left: 15%; margin-top: 66%; margin-left: 43%; width: 15%"></p>
    <input id="password" class="textInput" type="password"
           style="width: 50%; margin-left: 25%; margin-top: 73%;">
    <button id="loginBut" class="mybt" onclick="login()">登 录</button>
</div>


<!--图片上传框-->
<div class="am-modal am-modal-no-btn up-frame-bj " tabindex="-1" id="doc-modal-1"
     style="display: none; margin-left: 20%;">
    <div class="am-modal-dialog up-frame-parent up-frame-radius" style="width: 600px;">
        <div class="am-modal-hd up-frame-header">
            <label>修改头像</label>
            <a href="javascript: void(0)" class="am-close am-close-spin" data-am-modal-close>x</a>
        </div>
        <div class="am-modal-bd  up-frame-body">
            <div class="am-g am-fl">
                <div class="am-form-group am-form-file">
                    <div class="am-fl">
                        <button type="button" class="am-btn am-btn-default am-btn-sm">
                            <i class="am-icon-cloud-upload"></i> 选择要上传的文件
                        </button>
                    </div>
                    <input type="file" id="inputImage">
                </div>
            </div>
            <div class="am-g am-fl">
                <div class="up-pre-before up-frame-radius">
                    <img alt="" src="" id="image">
                </div>
                <div class="up-pre-after up-frame-radius">
                </div>
            </div>
            <div class="am-g am-fl">
                <div class="up-control-btns">
                    <span class="am-icon-rotate-left" onclick="rotateimgleft()"></span>
                    <span class="am-icon-rotate-right" onClick="rotateimgright()"></span>
                    <span class="am-icon-check" id="up-btn-ok" url="/admin/user/upload.action"></span>
                </div>
            </div>

        </div>
    </div>
</div>

<!--加载框-->
<div class="am-modal am-modal-loading am-modal-no-btn" tabindex="-1" id="my-modal-loading">
    <div class="am-modal-dialog">
        <div class="am-modal-hd">正在上传...</div>
        <div class="am-modal-bd">
            <span class="am-icon-spinner am-icon-spin"></span>
        </div>
    </div>
</div>

<!--警告框-->
<div class="am-modal am-modal-alert" tabindex="-1" id="my-alert">
    <div class="am-modal-dialog">
        <div class="am-modal-hd">信息</div>
        <div class="am-modal-bd" id="alert_content">
            成功了
        </div>
        <div class="am-modal-footer">
            <span class="am-modal-btn">确定</span>
        </div>
    </div>
</div>

<div id="signupPanel" style="display: none">
    <div class="up-img-cover" id="up-img-touch">
        <img src="../images/maleIcon.png" class="iconImage" id="icon" alt="点击图片上传"
             data-am-popover="{content: '点击上传', trigger: 'hover focus'}">
    </div>
    <div><a style="text-align: center; display: block;" id="pic"></a></div>

    <p class="label"
       style="background: url(/static/images/UserNameLabel.png); background-size: cover; margin-left: 15%; margin-top: 29%; width: 20%"></p>
    <input id="usernameTextField" class="textInput" style="margin-left: 5%; margin-top: 35%">

    <p class="label"
       style="background: url(/static/images/PasswordLabel.png); background-size: cover; margin-left: 18.5%; margin-top: 51%; width: 15%"></p>
    <input id="passwordTextField" class="textInput" type="password" style="margin-left: 5%; margin-top: 57%">

    <p class="label"
       style="background: url(/static/images/IDLabel.png); background-size: cover; margin-left: 65%; margin-top: 51%; width: 20%"></p>
    <input id="idTextField" class="textInput" style="margin-left: 55%; margin-top: 57%">

    <p class="label"
       style="background: url(/static/images/StudentNameLabel.png); background-size: cover; margin-left: 11.5%; margin-top: 73%; width: 27%"></p>
    <input id="studentnameTextField" class="textInput" style="margin-left: 5%; margin-top: 79%">

    <p class="label"
       style="background: url(/static/images/SchoolLabel.png); background-size: cover; margin-left: 61.5%; margin-top: 73%; width: 27%"></p>
    <div id="schoolDropDown" style="height: 7%">
        <select data-select-like-alignement="auto" class="drop-select" id="schoolDrop">
            <option value="a" selected="selected"></option>
            <option value="b">南京外国语学校仙林分校</option>
            <option value="c">南京外国语学校仙林分校</option>
            <option value="d">南京外国语学校仙林分校</option>
            <option value="e">南京外国语学校仙林分校</option>
            <option value="f">南京外国语学校仙林分校</option>
            <option value="g">南京</option>
        </select>
    </div>
    <%--<input id="schoolTextField" class="textInput" style="margin-left: 55%; margin-top: 79%">--%>

    <p class="label"
       style="background: url(/static/images/GenderLabel.png); background-size: cover; margin-left: 18.5%; margin-top: 95%; width: 15%"></p>
    <button id="maleBut" class="mybt" style="margin-left: 5%; margin-top: 101%; width: 15.7%">男</button>

    <p style="position:absolute; color: white; margin-top: 101%; margin-left: 24%; text-align: center; font-size: 200%; width: 3%;">
        |</p>
    <button id="femaleBut" class="mybt" style="margin-left: 29%; margin-top: 101%; width: 15.7%">女</button>

    <p class="label"
       style="background: url(/static/images/PhoneLabel.png); background-size: cover; margin-left: 68.5%; margin-top: 95%; width: 15%"></p>
    <input id="phoneTextField" class="textInput" style="margin-left: 55%; margin-top: 101%">

    <button class="mybt" style="margin-left: 30%; margin-top: 120%; width: 40%" onclick="signup()">注 册</button>
</div>

<div id="searchPanel" style="display: none">
    <div id="genderLabel"></div>
    <button class="mybt" style="margin-top: 35%; margin-left: 25%; width: 20%;">男</button>
    <p class="genderLine">|</p>
    <button class="mybt" style="margin-top: 35%; margin-left: 54.7%; width: 20%;">女</button>
    <div id="typeLabel"></div>
    <div id="typeDropDown">
        <select data-select-like-alignement="auto" class="drop-select" style="font-size: 120%">
            <option value="summer">夏季</option>
            <option value="winter" selected="selected">冬季</option>
        </select>
    </div>
    <div id="sizeLabel"></div>
    <div id="sizeDropDown">
        <select data-select-like-alignement="auto" class="drop-select" style="font-size: 120%">
            <option value="S">S</option>
            <option value="M" selected="selected">M</option>
            <option value="L">L</option>
        </select>
    </div>
    <button class="mybt" style="margin-top: 122%; margin-left: 25%; width: 50%;">搜 索</button>

</div>
<div id="bulletinPage">
</div>
<div id="fundBulletin" align="left">
    <div id="scroll">
        <ul id="scroll1">
            <li><p>向 X X X 学校捐出 X X X</p></li>
            <br>
            <li><p>向 X X X 学校捐出 X X X</p></li>
            <br>
            <li><p>向 X X X 学校捐出 X X X</p></li>
            <br>
            <li><p>向 X X X 学校捐出 X X X</p></li>
            <br>
            <li><p>向 X X X 学校捐出 X X X</p></li>
            <br>
            <li><p>向 X X X 学校捐出 X X X</p></li>
            <br>
            <li><p>向 X X X 学校捐出 X X X</p></li>
            <br>
            <li><p>向 X X X 学校捐出 X X X</p></li>
            <br>
            <li><p>向 X X X 学校捐出 X X X</p></li>
            <br>
            <li><p>向 X X X 学校捐出 X X X</p></li>
            <br>
        </ul>
        <ul id="scroll2">
        </ul>
    </div>
</div>
<div id="transactionBulletin" align="right">
    <div id="scroll3">
        <ul id="scroll4">
            <li><p>X X X 购买了 X X X</p></li>
            <br>
            <li><p>X X X 购买了 X X X</p></li>
            <br>
            <li><p>X X X 购买了 X X X</p></li>
            <br>
            <li><p>X X X 购买了 X X X</p></li>
            <br>
            <li><p>X X X 购买了 X X X</p></li>
            <br>
            <li><p>X X X 购买了 X X X</p></li>
            <br>
            <li><p>X X X 购买了 X X X</p></li>
            <br>
            <li><p>X X X 购买了 X X X</p></li>
            <br>
            <li><p>X X X 购买了 X X X</p></li>
            <br>
            <li><p>X X X 购买了 X X X</p></li>
            <br>
        </ul>
        <ul id="scroll5">
        </ul>
    </div>
</div>
<div id="forumPage">
    <div class="forumTitle"></div>
</div>
<div class="forumArea">
    <div id="table1" style="height: 50%">
        <button style="margin-top: 0%; margin-left: 0%; background: none repeat scroll 0 0 #39576e; text-shadow: 0 2px 0 grey;"
                id="tab1">t<br>a<br>b<br>l<br>e<br>1
        </button>
        <div id="tableA" class="forumTable" style="display: inline-block">
            <table style="margin-left: 1%;    border-collapse: separate; border-spacing: 1em;" width="100%">
                <tr class="titleTr">
                    <td width="70%">标题</td>
                    <td width="15%">作者</td>
                    <td width="15%">回帖数</td>
                </tr>

                <tr class="bodyTr">
                    <td width="70%"><a href="../static/html/404.html">帖子1</a></td>
                    <td width="15%">我</td>
                    <td width="15%">13</td>
                </tr>
                <tr class="bodyTr">
                    <td><a href="../static/html/404.html">test帖子1</a></td>
                    <td>a</td>
                    <td>13</td>
                </tr>
                <tr class="bodyTr">
                    <td><a href="../static/html/404.html">test帖子2</a></td>
                    <td>b</td>
                    <td>13</td>
                </tr>
                <tr class="bodyTr">
                    <td><a href="../static/html/404.html">test帖子3</a></td>
                    <td>c</td>
                    <td>13</td>
                </tr>
                <tr class="bodyTr">
                    <td><a href="../static/html/404.html">test帖子4</a></td>
                    <td>d</td>
                    <td>13</td>
                </tr>
                <tr class="bodyTr">
                    <td><a href="../static/html/404.html">test帖子5</a></td>
                    <td>e</td>
                    <td>13</td>
                </tr>
                <tr class="bodyTr">
                    <td><a href="../static/html/404.html">test帖子6</a></td>
                    <td>f</td>
                    <td>13</td>
                </tr>
                <tr class="bodyTr">
                    <td><a href="../static/html/404.html">test帖子7</a></td>
                    <td>g</td>
                    <td>13</td>
                </tr>
                <tr class="bodyTr">
                    <td><a href="../static/html/404.html">test帖子8</a></td>
                    <td>h</td>
                    <td>13</td>
                </tr>
                <tr class="bodyTr">
                    <td><a href="../static/html/404.html">test帖子9</a></td>
                    <td>i</td>
                    <td>13</td>
                </tr>
            </table>
        </div>
    </div>
    <div id="table2">
        <button style="margin-top: 22%; margin-left: 0%;" id="tab2">t<br>a<br>b<br>l<br>e<br>2</button>
        <div id="tableB" class="forumTable" style="display: none">
            <table style="margin-left: 1%;    border-collapse: separate; border-spacing: 1em;" width="100%">
                <tr class="titleTr">
                    <td width="70%">标题</td>
                    <td width="15%">作者</td>
                    <td width="15%">回帖数</td>
                </tr>

                <tr class="bodyTr">
                    <td width="70%"><a href="../static/html/404.html">帖子1</a></td>
                    <td width="15%">我</td>
                    <td width="15%">13</td>
                </tr>
                <tr class="bodyTr">
                    <td><a href="../static/html/404.html">test帖子1</a></td>
                    <td>a</td>
                    <td>13</td>
                </tr>
                <tr class="bodyTr">
                    <td><a href="../static/html/404.html">test帖子2</a></td>
                    <td>b</td>
                    <td>13</td>
                </tr>
            </table>
        </div>
    </div>
    <!--<a href="#ab" class="mytab1" title="First" id="a" style="margin-left: 0%; margin-top: 0%; width: 5%">First</a>-->
    <!--<button id="a" class="mytab" style="margin-top: 0%; margin-left: 0%; width: 5%;">h<br>o<br>t</button>-->
    <!--<button class="mytab" style="margin-top: 7.9%; margin-left: 0%; width: 5%;">n<br>e<br>w</button>-->
</div>
<div id="infoPage"></div>

<div class="foot" style="margin-top: 166.5%;">
    <%--<p style="position:absolute; display: inline-block; z-index: 2; color: grey; margin-top: 0%; text-align: center; line-height: 100%; width: 100%; font-size: 90%;">与子同袍项目组 copyright@2017</p>--%>
</div>

<script type="text/javascript" src="/static/js/jquery.min.js" charset="utf-8"></script>
<script type="text/javascript" src="/static/js/tether.js"></script>
<script type="text/javascript" src="/static/js/main.js"></script>
<script type="text/javascript" src="/static/js/select.js"></script>
<script type="text/javascript" src="/static/js/scroll.js"></script>
<script type="text/javascript" src="/static/js/login.js"></script>
<script type="text/javascript" src="http://cdn.amazeui.org/amazeui/2.7.2/js/amazeui.js" charset="utf-8"></script>
<script type="text/javascript" src="/static/js/cropper.min.js" charset="utf-8"></script>
<script type="text/javascript" src="/static/js/custom_up_img.js" charset="utf-8"></script>

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