<%--
  Created by IntelliJ IDEA.
  User: island
  Date: 2017/7/18
  Time: 下午10:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div id="uploadView">
    <button class="closeButton" onclick="closeUploadView()"></button>
    <h1>上&nbsp; 传&nbsp; 衣&nbsp; 物</h1>
    <ul style="margin-top: 10%">
        <li>
            <p>学 校</p>
            <div class="select">
                <select data-select-like-alignement="auto" class="drop-select" id="uploadSchoolDrop">
                    <option value="a" selected="selected"></option>
                    <%--<option value="b">南京外国语学校仙林分校</option>--%>
                    <%--<option value="g">南京</option>--%>
                </select>
            </div>
        </li>

        <li>
            <p style="margin-left: 360px">款 式</p>
            <div class="select">
                <select data-select-like-alignement="auto" class="drop-select" id="uploadTypeDrop">
                    <option value="a" selected="selected"></option>
                    <%--<option value="b">南京外国语学校仙林分校</option>--%>
                    <%--<option value="g">南京</option>--%>
                </select>
            </div></li>

        <br>
        <br>
        <li>
            <p>性 别</p>
            <div class="select">
                <select data-select-like-alignement="auto" class="drop-select" id="uploadGenderDrop">
                    <option value="a" selected="selected"></option>
                    <%--<option value="b">南京外国语学校仙林分校</option>--%>
                    <%--<option value="g">南京</option>--%>
                </select>
            </div>
        </li>
        <li>
            <p style="margin-left: 360px">尺 寸</p>
            <div class="select">
                <select data-select-like-alignement="auto" class="drop-select" id="uploadSizeDrop">
                    <option value="a" selected="selected"></option>
                    <%--<option value="b">南京外国语学校仙林分校</option>--%>
                    <%--<option value="g">南京</option>--%>
                </select>
            </div>
        </li>
        <br>
        <br>
        <li>
            <p>图 片</p>
            <form action="/clothesAction/uploadClothes" class="dropzone" id="my-dropzone">
                <div class="fallback">
                    <input name="file" type="file" multiple />
                </div>
            </form>
        </li>
        <script type="application/javascript" src="../static/js/dropzone.js"></script>
        <script>
            Dropzone.options.myDropzone = {
                init: function() {
                    this.on("addedfile", function(file) {

                        // Create the remove button
                        var removeButton = Dropzone.createElement("<button></button>");
                        removeButton.className = "removeButton";

                        // Capture the Dropzone instance as closure.
                        var _this = this;

                        // Listen to the click event
                        removeButton.addEventListener("click", function(e) {
                            // Make sure the button click doesn't submit the form:
                            e.preventDefault();
                            e.stopPropagation();

                            // Remove the file preview.
                            _this.removeFile(file);
                            // If you want to the delete the file on the server as well,
                            // you can do the AJAX request here.
                        });

                        // Add the button to the file preview element.
                        file.previewElement.appendChild(removeButton);
                    });
                }
            };
        </script>
        <link rel="stylesheet" href="../static/css/dropzone.css">
    </ul>
    <button class="mybt" style="margin-top: 51%">上&nbsp;传</button>
</div>
