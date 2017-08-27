<%--
  Created by IntelliJ IDEA.
  User: island
  Date: 2017/8/23
  Time: 下午3:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="../static/css/dropzoneModify.css">
<div id="modifySchoolInfoView" style="display: none;">
    <a href="#" onclick="closeModifySchoolInfoView()" class="am-icon-close" style="float: right; color: white; cursor: pointer"></a>
    <div id="modifySchoolInfoContent">
        <div id="modifySchoolInfoBorder">
            <div id="addTypeView">
                <h3>添<br>加<br>衣<br>物<br>种<br>类</h3>
                <h6 style="position: absolute; top: 2%; left: 23%;">默认图片</h6>
                <form action=""
                      style="position: absolute; left: 10%; margin: 0; top: 15%;"
                      class="dropzone" id="my-dropzone" method="post" target="hiddenIFrame" enctype="multipart/form-data">

                    <input type="hidden" name="id" value="1" multiple id="id"/>
                    <input type="hidden" name="clothesID" value="1" multiple id="clothesID"/>
                    <div class="fallback">
                        <input name="file" type="file" multiple/>
                    </div>
                </form>

                <h6 style="position: absolute; top: 2%; left: 50%; width: 50%; text-align: center;">种类名称</h6>
                <input class="textInput" style="position: absolute; width: 40%; left: 55%; top: 22%;">
                <h6 style="position: absolute; top: 37%; left: 50%; width: 50%; text-align: center;">种类价格</h6>
                <input class="textInput" style="position: absolute; width: 40%; left: 55%; top: 57%;">
                <button onclick="uploadClothes()" class="mybt"
                        style="white-space: nowrap; position: absolute; margin-bottom: 0%; width: 40%; top: 85%; left: 55%; font-size: 1.5vmax"
                        id="submit-all">上&nbsp;传
                </button>
            </div>
            <div id="addStudentView">

            </div>
        </div>

    </div>
</div>
<script type="application/javascript" src="../static/js/dropzoneModify.js"></script>
<script type="application/javascript" src="../static/js/modifySchool.js"></script>
