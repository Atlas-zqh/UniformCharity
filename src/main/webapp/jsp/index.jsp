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
    <link rel="stylesheet" href="../static/css/log.css"/>
    <link rel="stylesheet" href="../static/css/alert.css"/>
    <link rel="stylesheet" href="../static/css/custom_up_img.css">
    <%--<link rel="stylesheet" href="../static/css/amazeui.min.css">--%>
    <link rel="stylesheet" href="../static/css/amazeui.cropper.css">
    <link rel="stylesheet" href="../static/css/amazeui.css">
    <link rel="stylesheet" href="../static/css/font-awesome.css">
    <link rel="stylesheet" href="../static/css/upload.css"/>
    <link rel="stylesheet" href="../static/css/main.css"/>
    <link rel="stylesheet" href="../static/css/theme.css"/>
    <title>与子同袍</title>

    <script type="text/javascript" src="../static/js/jquery-3.2.1.min.js"></script>
    <%--<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"></script>--%>
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

        jQuery(document).ready(function ($) {
            $(".scroll").click(function (event) {
                event.preventDefault();
                $('html,body').animate({scrollTop: $(this.hash).offset().top}, 1000);
            });
        });

        $(document).ready(function () {
            checkCookie();
            getAllSchool('school');
            getAllSchool('schoolDrop');
            getPassages();
            getAllTransaction();
            getPosts();
        });

    </script>
    <%--<style type="text/css">--%>
    <%--.up-img-cover {width: 100px;height: 100px;}--%>
    <%--.up-img-cover img{width: 100%;}--%>
    <%--</style>--%>
</head>

<body>
<!--图片上传框-->
<div class="am-modal am-modal-no-btn up-frame-bj " tabindex="-1" id="doc-modal-1"
     style="display: none; margin-left: 20%;">
    <div class="am-modal-dialog up-frame-parent up-frame-radius" style="width: 70%;">
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

<div id="mainPart">
    <div id="fullbg"></div>

    <div id="mainPage">
        <p class="titleP">现在就加入我们！</p>
        <button class="uploadBut" onclick="if(getCookie('id') == null){fail_alert('请先登录再捐赠衣物！')}else{window.location.href='../jsp/uploadClothes.jsp'}">立即捐衣! ></button>
        <div id="searchPanel" style="display: none">
            <h3 style="display: inline-block; margin-top: 20%; margin-left: 41%; position: absolute">性&nbsp别</h3>
            <button class="mybt" style="position: absolute; margin-top: 30%; margin-left: 25%; width: 20%;  font-size: 1.5vw" id="male"
                    onclick="male()">男
            </button>
            <p class="genderLine" style="margin-top: 28.8%">|</p>
            <button class="mybt" style="position: absolute; margin-top: 30%; margin-left: 54.7%; width: 20%;  font-size: 1.5vw" id="female"
                    onclick="female()">女
            </button>
            <h3 style="position:absolute; display: inline-block; margin-top: 45%; margin-left: 41%">学&nbsp校</h3>
            <div class="dropdown"
                 style="margin-top: 55%; font-family: 'Yuppy SC'; text-shadow: -0.1vmax 0.1vmax 0 grey; font-size: 1.5vmax">
                <select data-select-like-alignement="auto" class="drop-select" style="font-size: 150%" id="school"
                        onchange="changeSchool('type', 'school')">
                    <%--<option value="null" selected="selected"></option>--%>
                </select>
            </div>
            <h3 style="position:absolute; display: inline-block; margin-top: 70%; margin-left: 41%">款&nbsp式</h3>
            <div class="dropdown"
                 style="margin-top: 80%; font-family: 'Yuppy SC'; text-shadow: -0.1vmax 0.1vmax 0 grey; font-size: 1.5vmax;">
                <select data-select-like-alignement="auto" class="drop-select" style="font-size: 150%" id="type">
                    <option value="null" selected="selected"></option>
                </select>
            </div>
            <h3 style="position:absolute; display: inline-block; margin-top: 95%; margin-left: 41%">尺&nbsp码</h3>
            <div class="dropdown"
                 style="margin-top: 105%; font-family: 'Yuppy SC'; text-shadow: -0.1vmax 0.1vmax 0 grey; font-size: 1.5vmax">
                <select data-select-like-alignement="auto" class="drop-select" style="font-size: 150%" id="size">
                    <option value="null" selected="selected"></option>
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
            <button class="mybt" style="margin-top: 125%; margin-left: 25%; width: 50%; font-size: 1.5vw"
                    onclick="search()">搜 索
            </button>
        </div>
        <div id="loginPanel">
            <p class="label"
               style="background: url(/static/images/UserNameLabel.png); background-size: cover; margin-left: 40.5%; margin-top: 36%; width: 20%"></p>
            <input id="username" class="textInput" style="width: 50%; margin-left: 25%; margin-top: 43%;">
            <p class="label"
               style="background: url(/static/images/PasswordLabel.png); background-size: cover; margin-left: 15%; margin-top: 66%; margin-left: 43%; width: 15%"></p>
            <input id="password" class="textInput" type="password"
                   style="width: 50%; margin-left: 25%; margin-top: 73%;">
            <button id="loginBut" class="mybt" onclick="login()" style="width: 40%; font-size: 1.5vmax;">登 录</button>
        </div>
        <div id="signupPanel" style="display: none">
            <div class="up-img-cover" id="up-img-touch">
                <img src="../images/maleIcon.png" class="iconImage" id="icon" alt="点击图片上传"
                     data-am-popover="{content: '点击上传', trigger: 'hover focus'}">
            </div>
            <div><a style="text-align: center; display: block;" id="pic"></a></div>

            <h3 style="margin-left: 0%; margin-top: 24%; position: absolute; width: 50%; text-align: center; font-size: 1.5vw">用户名</h3>
            <input id="usernameTextField" class="textInput" style="margin-left: 5%; margin-top: 32%">

            <h3 style="margin-left: 0%; margin-top: 46%; position: absolute; width: 50%; text-align: center; font-size: 1.5vw">密码</h3>
            <input id="passwordTextField" class="textInput" type="password" style="margin-left: 5%; margin-top: 54%">

            <h3 style="margin-left: 50%; margin-top: 46%; position: absolute; width: 50%; text-align: center; font-size: 1.5vw">身份信息</h3>
            <img src="../static/images/question.png" style="margin-left: 87%; margin-top: 48%; position: absolute; width: 4%"
                 data-am-popover="{content: '身份信息可为身份证或是学籍号！', trigger: 'hover focus'}">
            <input id="idTextField" class="textInput" style="margin-left: 55%; margin-top: 54%">

            <h3 style="margin-left: 0%; margin-top: 68%; position: absolute; width: 50%; text-align: center; font-size: 1.5vw">学生姓名</h3>
            <input id="studentnameTextField" class="textInput" style="margin-left: 5%; margin-top: 76%">

            <h3 style="margin-left: 50%; margin-top: 68%; position: absolute; width: 50%; text-align: center; font-size: 1.5vw">所属学校</h3>
            <div id="schoolDropDown" style="margin-top: 76%">
                <select data-select-like-alignement="auto" class="drop-select" id="schoolDrop">
                    <%--<option value="a" selected="selected"></option>--%>
                    <%--<option value="b">南京外国语学校仙林分校</option>--%>
                    <%--<option value="g">南京</option>--%>
                </select>
            </div>
            <%--<input id="schoolTextField" class="textInput" style="margin-left: 55%; margin-top: 79%">--%>

            <h3 style="margin-left: 0%; margin-top: 90%; position: absolute; width: 50%; text-align: center; font-size: 1.5vw">性别</h3>
            <button id="maleBut" class="mybt" style="margin-left: 5%; margin-top: 98%; width: 15.7%; font-size: 1.5vw;">男
            </button>

            <p style="position:absolute; color: white; margin-top: 98%; margin-left: 23.5%; text-align: center; font-size: 1.8vw; width: 3%;">
                |</p>
            <button id="femaleBut" class="mybt" style="margin-left: 29%; margin-top: 98%; width: 15.7%; font-size: 1.5vw;">
                女
            </button>

            <h3 style="margin-left: 50%; margin-top: 90%; position: absolute; width: 50%; text-align: center; font-size: 1.5vw">手机</h3>
            <input id="phoneTextField" class="textInput" style="margin-left: 55%; margin-top: 98%">

            <h3 style="margin-left: 18.5%; margin-top: 112%; position: absolute; font-size: 1.5vw">班级</h3>
            <button class="mybt" style="margin-left: 5%; margin-top: 120%; width: 40%; font-size: 1.5vw; color: #142535; text-shadow: -0.1vmax 0.1vmax 0 lightgrey;"
                    onclick="showGradeAndClassPane()" id="GradeAndClass">&nbsp;
            </button>

            <button class="mybt" style="position: absolute; margin-left: 55%; margin-top: 120%; width: 40%; font-size: 1.5vw;"
                    onclick="signup()">注 册
            </button>
        </div>

    </div>

    <div id="bulletinPage">
        <div id="fundBulletin" align="left">
            <div id="scroll">
                <ul id="scroll1">
                    <%--<li><p>向 X X X 学校捐出 X X X</p></li>--%>
                    <%--<br>--%>
                    <%--<li><p>向 X X X 学校捐出 X X X</p></li>--%>
                    <%--<br>--%>
                    <%--<li><p>向 X X X 学校捐出 X X X</p></li>--%>
                    <%--<br>--%>
                    <%--<li><p>向 X X X 学校捐出 X X X</p></li>--%>
                    <%--<br>--%>
                    <%--<li><p>向 X X X 学校捐出 X X X</p></li>--%>
                    <%--<br>--%>
                    <%--<li><p>向 X X X 学校捐出 X X X</p></li>--%>
                    <%--<br>--%>
                    <%--<li><p>向 X X X 学校捐出 X X X</p></li>--%>
                    <%--<br>--%>
                    <%--<li><p>向 X X X 学校捐出 X X X</p></li>--%>
                    <%--<br>--%>
                    <%--<li><p>向 X X X 学校捐出 X X X</p></li>--%>
                    <%--<br>--%>
                    <%--<li><p>向 X X X 学校捐出 X X X</p></li>--%>
                    <%--<br>--%>
                </ul>
                <ul id="scroll2">
                </ul>
            </div>
        </div>
        <div id="transactionBulletin" align="right">
            <div id="scroll3">
                <ul id="scroll4">
                    <%--<li><p>X X X 购买了 X X X</p></li>--%>
                    <%--<br>--%>
                    <%--<li><p>X X X 购买了 X X X</p></li>--%>
                    <%--<br>--%>
                    <%--<li><p>X X X 购买了 X X X</p></li>--%>
                    <%--<br>--%>
                    <%--<li><p>X X X 购买了 X X X</p></li>--%>
                    <%--<br>--%>
                    <%--<li><p>X X X 购买了 X X X</p></li>--%>
                    <%--<br>--%>
                    <%--<li><p>X X X 购买了 X X X</p></li>--%>
                    <%--<br>--%>
                    <%--<li><p>X X X 购买了 X X X</p></li>--%>
                    <%--<br>--%>
                    <%--<li><p>X X X 购买了 X X X</p></li>--%>
                    <%--<br>--%>
                    <%--<li><p>X X X 购买了 X X X</p></li>--%>
                    <%--<br>--%>
                    <%--<li><p>X X X 购买了 X X X</p></li>--%>
                    <%--<br>--%>
                </ul>
                <ul id="scroll5">
                </ul>
            </div>
        </div>
    </div>
    <div id="forumPage">
        <div class="forumTitle"></div>
        <div class="forumArea">
            <div id="table1" style="height: 50%">
                <%--<button style="margin-top: 0%; margin-left: 0%; background: none repeat scroll 0 0 #39576e; text-shadow: 0 2px 0 grey;"--%>
                        <%--id="tab1">t<br>a<br>b<br>l<br>e<br>1--%>
                <%--</button>--%>
                <div id="tableA" class="forumTable" style="display: inline-block">
                    <table style="margin-left: 1%; border-collapse: separate; border-spacing: 1.7vw;" width="100%" id="postTable">
                        <tr class="titleTr">
                            <td width="70%">标题</td>
                            <td width="15%">作者</td>
                            <td width="15%">回帖数</td>
                        </tr>

                        <%--<tr class="bodyTr">--%>
                            <%--<td width="70%"><a href="../static/html/404.html">帖子1</a></td>--%>
                            <%--<td width="15%">我</td>--%>
                            <%--<td width="15%">13</td>--%>
                        <%--</tr>--%>
                    </table>
                </div>
            </div>
            <%--<div id="table2">--%>
                <%--<button style="margin-top: 22%; margin-left: 0%;" id="tab2">t<br>a<br>b<br>l<br>e<br>2</button>--%>
                <%--<div id="tableB" class="forumTable" style="display: none">--%>
                    <%--<table style="margin-left: 1%; border-collapse: separate; border-spacing: 1.7vw;" width="100%">--%>
                        <%--<tr class="titleTr">--%>
                            <%--<td width="70%">标题</td>--%>
                            <%--<td width="15%">作者</td>--%>
                            <%--<td width="15%">回帖数</td>--%>
                        <%--</tr>--%>

                        <%--<tr class="bodyTr">--%>
                            <%--<td width="70%"><a href="../static/html/404.html">帖子1</a></td>--%>
                            <%--<td width="15%">我</td>--%>
                            <%--<td width="15%">13</td>--%>
                        <%--</tr>--%>
                        <%--<tr class="bodyTr">--%>
                            <%--<td><a href="../static/html/404.html">test帖子1</a></td>--%>
                            <%--<td>a</td>--%>
                            <%--<td>13</td>--%>
                        <%--</tr>--%>
                        <%--<tr class="bodyTr">--%>
                            <%--<td><a href="../static/html/404.html">test帖子2</a></td>--%>
                            <%--<td>b</td>--%>
                            <%--<td>13</td>--%>
                        <%--</tr>--%>
                    <%--</table>--%>
                <%--</div>--%>
            <%--</div>--%>
            <!--<a href="#ab" class="mytab1" title="First" id="a" style="margin-left: 0%; margin-top: 0%; width: 5%">First</a>-->
            <!--<button id="a" class="mytab" style="margin-top: 0%; margin-left: 0%; width: 5%;">h<br>o<br>t</button>-->
            <!--<button class="mytab" style="margin-top: 7.9%; margin-left: 0%; width: 5%;">n<br>e<br>w</button>-->
        </div>

    </div>
    <div id="infoPage"></div>
    <div class="foot">
        <p class="navLabel" align="center" style="position: absolute; top:97.2%; text-align: center">与子同袍项目组
            copyright@2017</p>
    </div>
</div>

<div class="am-popup" id="my-popup" style="height: 60%">
    <h1 style="width: 50%; float: left;">班&nbsp;级&nbsp;选&nbsp;择</h1>
    <span data-am-modal-close
          class="am-close" style="top: 30%; float: right;">&times;</span>
    <br>
    <h2 style="margin-left: 0%; width: 100%; text-align: center; margin-top: 15%">年级</h2>
    <div style="padding-bottom: 3vw; margin-top: 0%; position: absolute; z-index: 100; width: 40%; margin-left: 30%;">
        <select data-select-like-alignement="auto" class="drop-select" id="gradeDrop" onchange="getAllClass('classDrop')">
            <option value="" selected="selected"></option>
            <option value="1">一年级</option>
            <option value="2">二年级</option>
            <option value="3">三年级</option>
            <option value="4">四年级</option>
            <option value="5">五年级</option>
            <option value="6">六年级</option>
        </select>
    </div>
    <h2 style="margin-left: 0%; width: 100%; text-align: center; margin-top: 10%">班级</h2>
    <div style="padding-bottom: 3vw; margin-top: 0%; position: absolute; z-index: 100; width: 40%; margin-left: 30%;">
        <select data-select-like-alignement="auto" class="drop-select" id="classDrop">
            <option value="" selected="selected"></option>
            <option value="1">1班</option>
            <option value="2">2班</option>
            <option value="3">3班</option>
            <option value="4">4班</option>
            <option value="5">5班</option>
            <option value="6">6班</option>
            <option value="7">7班</option>
            <option value="8">8班</option>
            <option value="9">9班</option>
            <option value="10">10班</option>
            <option value="11">11班</option>
            <option value="12">12班</option>
            <option value="13">13班</option>
            <option value="14">14班</option>
            <option value="15">15班</option>
            <option value="16">16班</option>
            <option value="17">17班</option>
            <option value="18">18班</option>
        </select>
    </div>
    <button class="mybt" style="width: 20%; font-size: 1.5vmax; margin-left: 40%; margin-top: 20%;"
            onclick="getGradeAndClass()">
        确 定
    </button>
</div>

<script type="text/javascript" src="../static/js/alert.js"></script>
<script type="text/javascript" src="../static/js/scroll.js"></script>
<script type="text/javascript" src="../static/js/passage.js"></script>
<script type="text/javascript" src="../static/js/util.js"></script>
<script type="text/javascript" src="../static/js/SmoothScroll.min.js"></script>
<script type="text/javascript" src="../static/js/jquery.min.js" charset="utf-8"></script>
<script type="text/javascript" src="../static/js/tether.js"></script>
<script type="text/javascript" src="../static/js/main.js"></script>
<script type="text/javascript" src="../static/js/select.js"></script>
<script type="text/javascript" src="../static/js/login.js"></script>
<script type="text/javascript" src="../static/js/cookie.js"></script>
<script type="text/javascript" src="../static/js/bootstrap.js"></script>
<script type="text/javascript" src="../static/js/amazeui.min.js" charset="utf-8"></script>
<script type="text/javascript" src="../static/js/cropper.min.js" charset="utf-8"></script>
<script type="text/javascript" src="../static/js/custom_up_img.js" charset="utf-8"></script>
<script type="text/javascript" src="../static/js/move-top.js"></script>
<script type="text/javascript" src="../static/js/easing.js"></script>
<script type="text/javascript" src="../static/js/clothes.js"></script>
<script type="text/javascript" src="../static/js/search.js"></script>
<%--<script type="text/javascript" src="../static/js/upload.js"></script>--%>

<script>
    $('select.drop-select').each(function () {
        new Select({
            el: this,
            selectLikeAlignment: $(this).attr('data-select-like-alignement') || 'auto',
            className: 'select-theme-dark'
        });
    });
</script>

<!-- here stars scrolling icon -->
<script type="text/javascript">
    $(document).ready(function () {

        var defaults = {
            containerID: 'toTop', // fading element id
            containerHoverID: 'toTopHover', // fading element hover id
            scrollSpeed: 1200,
            easingType: 'linear'
        };


        $().UItoTop({easingType: 'easeOutQuart'});

        $('#toTop').css({
            "display": "none",
            "position": "fixed",
            "bottom": "0%",
            "float": "right",
            "margin-left": "96.5%",
            "z-index": "5000",
            "background": "url(../images/up.png)no-repeat",
            "width": "1.5%",
            "padding-top": "1.5%",
            "background-size": "cover"
        });

    });
</script>
<!-- //here ends scrolling icon -->
</body>
</html>
