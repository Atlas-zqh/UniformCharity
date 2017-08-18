<%--
  Created by IntelliJ IDEA.
  User: island
  Date: 2017/7/18
  Time: 下午10:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="nav.jsp" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>与子同袍-上传衣物</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="viewport" content="height=device-height, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="../static/css/alert.css">
    <link rel="stylesheet" type="text/css" href="../static/css/upload.css">
    <link rel="stylesheet" type="text/css" href="../static/css/amazeui.css">
    <link rel="stylesheet" type="text/css" href="../static/css/theme.css">
    <link rel="stylesheet" href="../static/css/dropzone.css">
    <script type="text/javascript" src="../static/js/jquery-3.2.1.min.js"></script>
    <script>
        $(document).ready(function () {
            checkCookie();
            getAllTypes('uploadTypeDrop');
            $('#id').val(getCookie("id"));
        });

    </script>
</head>
<body>
<div id="uploadArea">
    <div id="mainPart">
        <h1>上传衣物</h1>
        <label class="am-checkbox" style="color: grey; left: 2.5%; top: 2%; width: 30%;">
            <input type="checkbox" value="" data-am-ucheck onclick="uploadType()" id="typeCheck"> 上传在该平台上购买的衣物
        </label>
        <div id="uploadView">
            <p style="position: absolute; margin-left: 4%; margin-top: -2%;">图 片</p>
            <form action="/clothesAction/uploadClothesPics" class="dropzone" id="my-dropzone" method="post" target="hiddenIFrame" enctype="multipart/form-data">
                <ul style="margin-top: 0%">
                    <%--<li>--%>
                        <%--<p>学 校</p>--%>
                        <%--<div class="select" style="">--%>
                            <%--<select data-select-like-alignement="auto" class="drop-select" id="uploadSchoolDrop"--%>
                                    <%--onchange="changeSchool('uploadTypeDrop', 'uploadSchoolDrop')" name="school" multiple>--%>
                                <%--&lt;%&ndash;<option value="null" selected="selected"></option>&ndash;%&gt;--%>
                                <%--&lt;%&ndash;<option value="b">南京外国语学校仙林分校</option>&ndash;%&gt;--%>
                                <%--&lt;%&ndash;<option value="g">南京</option>&ndash;%&gt;--%>
                            <%--</select>--%>
                        <%--</div>--%>
                    <%--</li>--%>
                    <%--<br>--%>
                    <li style="top: 0%; position: absolute;">
                        <p style="margin-left: 0px">款 式</p>
                        <div class="select">
                            <select data-select-like-alignement="auto" class="drop-select" id="uploadTypeDrop" name="type" multiple>
                                <option value="null" selected="selected"></option>
                                <%--<option value="b">南京外国语学校仙林分校</option>--%>
                                <%--<option value="g">南京</option>--%>
                            </select>
                        </div>
                    </li>
                    <br>
                    <li style="top: 25%; position: absolute;">
                        <p>性 别</p>
                        <div class="select">
                            <select data-select-like-alignement="auto" class="drop-select" id="uploadGenderDrop" name="gender" multiple>
                                <%--<option value="b">南京外国语学校仙林分校</option>--%>
                                <%--<option value="g">南京</option>--%>
                                <option value="null" selected="selected"></option>
                                <option value="男">男</option>
                                <option value="女">女</option>
                            </select>
                        </div>
                    </li>
                    <br>

                    <li style="top: 50%; position: absolute;">
                        <p style="margin-left: 0px">尺 寸</p>
                        <div class="select">
                            <select data-select-like-alignement="auto" class="drop-select" id="uploadSizeDrop" name="size" multiple>
                                <option value="null" selected="selected"></option>
                                <option value="110">110</option>
                                <option value="120">120</option>
                                <option value="130">130</option>
                                <option value="140">140</option>
                                <option value="150">150</option>
                                <option value="160">160</option>
                                <option value="170">170</option>
                                <option value="180">180</option>
                            </select>
                        </div>
                    </li>
                    <li style="top: 75%; position: absolute;">
                    </li>
                    <button onclick="uploadClothes()" class="mybt"
                            style="white-space: nowrap; position: absolute; margin-bottom: 0%; width: 40%; top: 80%; margin-left: 35%; margin-top: 0%; font-size: 1.5vmax"
                            id="submit-all">上&nbsp;传
                    </button>
                </ul>
                <input type="hidden" name="id" value="1" multiple id="id"/>
                <input type="hidden" name="clothesID" value="1" multiple id="clothesID"/>
                <div class="fallback">
                    <input name="file" type="file" multiple/>
                </div>
            </form>
            <iframe style="display:none" name="hiddenIFrame" id="hiddenIFrame"></iframe>
            <%--<div style="position: absolute; margin-left: 55%; padding-top: 40%; margin-top: 10%; width: 40%; border: 2px solid #d6bd6f; box-shadow: 0 0 5px 2px #d6bd6f; background: white; z-index: 0; display: inline-block">--%>
            <%--</div>--%>
        </div>
        <div id="uploadOldView" style="display: none">
            <p style="top: 2%">衣物ID</p>
            <input id="clothesIDText" class="textInput" style="left: 30%; position: absolute; width: 50%;">
            <p style="top: 12%">衣物故事</p>
            <%--<input id="" class="textInput" style="left: 20%; position: absolute;">--%>
            <textarea class="clothesStory" id="clothesStory"></textarea>
            <button onclick="uploadOld()" class="mybt"
                    style="white-space: nowrap; position: absolute; margin-bottom: 0%; width: 20%; top: 85%; left: 60%; font-size: 1.5vmax"
                    >上&nbsp;传
            </button>
        </div>
        <div id="uploadedView">
            <iframe src="uploadedClothes.jsp" style="height: 100%; width: 90%; margin-left: 10%"></iframe>
        </div>
    </div>
</div>
<div class="foot">
    <p class="navLabel" align="center" style="position: absolute; top:97.2%; text-align: center">与子同袍项目组
        copyright@2017</p>
</div>
<script type="text/javascript" src="../static/js/cookie.js" charset="utf-8"></script>
<script type="text/javascript" src="../static/js/util.js" charset="utf-8"></script>
<script type="text/javascript" src="../static/js/alert.js" charset="utf-8"></script>
<script type="text/javascript" src="../static/js/tether.js" charset="utf-8"></script>
<script type="text/javascript" src="../static/js/select.js" charset="utf-8"></script>
<script type="text/javascript" src="../static/js/clothes.js" charset="utf-8"></script>
<script type="text/javascript" src="../static/js/amazeui.min.js" charset="utf-8"></script>
<script type="application/javascript" src="../static/js/dropzone.js"></script>
<script type="application/javascript" src="../static/js/upload.js"></script>
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

