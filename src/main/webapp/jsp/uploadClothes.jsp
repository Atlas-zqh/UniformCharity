<%--
  Created by IntelliJ IDEA.
  User: island
  Date: 2017/7/18
  Time: 下午10:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script>
    $(document).ready(function () {
        getAllSchool('uploadSchoolDrop');
        $('#id').val(getCookie("id"));
    });


</script>

<div id="uploadView">
    <button class="closeButton" onclick="closeUploadView()"></button>
    <h1>上&nbsp; 传&nbsp; 衣&nbsp; 物</h1>

    <p style="position: absolute; margin-top: 10%; margin-left: 3%;">图 片</p>
    <form action="/clothesAction/uploadClothesPics" class="dropzone" id="my-dropzone" method="post" target="hiddenIFrame" enctype="multipart/form-data">
        <ul style="margin-top: 0%">
            <li>
                <p>学 校</p>
                <div class="select" style="">
                    <select data-select-like-alignement="auto" class="drop-select" id="uploadSchoolDrop"
                            onchange="changeSchool('uploadTypeDrop', 'uploadSchoolDrop')" name="school" multiple>
                        <%--<option value="null" selected="selected"></option>--%>
                        <%--<option value="b">南京外国语学校仙林分校</option>--%>
                        <%--<option value="g">南京</option>--%>
                    </select>
                </div>
            </li>
            <br>
            <li style="top: 20%; position: absolute;">
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
            <li style="top: 40%; position: absolute;">
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

            <li style="top: 60%; position: absolute;">
                <p style="margin-left: 0px">尺 寸</p>
                <div class="select">
                    <select data-select-like-alignement="auto" class="drop-select" id="uploadSizeDrop" name="size" multiple>
                        <option value="null" selected="selected"></option>
                        <option value="XXXS">XXXS</option>
                        <option value="XXS">XXS</option>
                        <option value="XS">XS</option>
                        <option value="S">S</option>
                        <option value="M">M</option>
                        <option value="M">L</option>
                        <option value="XL">XL</option>
                        <option value="XXL">XXL</option>
                        <option value="XXXL">XXXL</option>
                    </select>
                </div>
            </li>
            <li style="top: 80%; position: absolute;">
            </li>
            <button onclick="uploadClothes()" class="mybt"
                    style="position: absolute; margin-bottom: 0%; width: 40%; top: 80%; margin-left: 35%; margin-top: 0%; font-size: 1.5vmax"
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


    <link rel="stylesheet" href="../static/css/dropzone.css">
    <script type="application/javascript" src="../static/js/dropzone.js"></script>
    <script type="application/javascript" src="../static/js/upload.js"></script>
</div>
