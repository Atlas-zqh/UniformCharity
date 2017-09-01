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
    <a href="#" onclick="closeModifySchoolInfoView()" class="am-icon-close"
       style="float: right; color: white; cursor: pointer"></a>
    <div id="modifySchoolInfoContent">
        <div id="modifySchoolInfoBorder">
            <div id="addTypeView">
                <h3>添<br>加<br>衣<br>物<br>种<br>类</h3>
                <h6 style="position: absolute; top: 2%; left: 23%;">默认图片</h6>
                <form action=""
                      style="position: absolute; left: 10%; margin: 0; top: 15%;"
                      class="dropzone" id="my-dropzone" method="post" target="hiddenIFrame"
                      enctype="multipart/form-data">

                    <%--<input type="hidden" name="id" value="1" multiple id="id"/>--%>
                        <input type="hidden" name="name" value="1" multiple id="name"/>
                        <input type="hidden" name="schoolNameInput" value="1" multiple id="schoolNameInput"/>
                        <input type="hidden" name="price" value="1" multiple id="price"/>

                    <div class="fallback">
                        <input name="file" type="file" multiple/>
                    </div>
                </form>

                <h6 style="position: absolute; top: 2%; left: 50%; width: 50%; text-align: center;">种类名称</h6>
                <input class="textInput" style="position: absolute; width: 40%; left: 55%; top: 22%;" id="typeName">
                <h6 style="position: absolute; top: 37%; left: 50%; width: 50%; text-align: center;">种类价格</h6>
                <input class="textInput" style="position: absolute; width: 40%; left: 55%; top: 57%;" id="typePrice">
                <button class="mybt"
                        style="white-space: nowrap; position: absolute; margin-bottom: 0%; width: 40%; top: 85%; left: 55%; font-size: 1.5vmax"
                        id="submit-all">上&nbsp;传
                </button>
            </div>
            <div id="addStudentView">
                <h3>添<br>加<br>学<br>生</h3>
                <form id="studentForm" name="form2" method="post" action=""
                      style="position: absolute; width: 80%; left: 10%; top: 5%;">
                    <h6 style="width: 100%; text-align: center;">学生信息</h6>
                    <table width="698" border="0" cellpadding="0" cellspacing="0" id="tabProduct3">
                        <tr style="font-size: 2.2vh; color: #142535">
                            <td width="5%" align="center" bgcolor="#c2e2e7" Name="Num"></td>
                            <td width="20%" bgcolor="#c2e2e7" Name="Name" EditType="TextBox">学生姓名</td>
                            <td width="45%" bgcolor="#c2e2e7" Name="ID" EditType="TextBox">学生ID</td>
                            <td width="10%" bgcolor="#c2e2e7" Name="Gender" EditType="DropDownList"
                                DataItems="{text:'男',value:'男'},{text:'女',value:'女'}">性别
                            </td>
                            <td width="10%" bgcolor="#c2e2e7" Name="Grade" EditType="DropDownList" id="gradeDropDown">年级</td>
                            <td width="10%" bgcolor="#c2e2e7" Name="Class" EditType="DropDownList" id="classDropDown">班级</td>
                            <%--<td width="152" bgcolor="#EFEFEF" Name="ProductName" EditType="DropDownList"--%>
                            <%--DataItems="{text:'A',value:'a'},{text:'B',value:'b'},{text:'C',value:'c'},{text:'D',value:'d'}">--%>
                            <%--商品名称--%>
                            <%--</td>--%>
                            <%--<td width="103" bgcolor="#EFEFEF" Name="Price" EditType="TextBox">单价</td>--%>
                            <%--<td width="120" bgcolor="#EFEFEF" Name="SumMoney" Expression="Amount*Price" Format="#,###.00">合计--%>
                            <%--</td>--%>
                        </tr>
                        <tr>
                            <td align="center" bgcolor="#FFFFFF"><input type="checkbox" name="checkbox2"
                                                                        value="checkbox"/></td>
                            <td bgcolor="#FFFFFF"></td>
                            <%--<td bgcolor="#FFFFFF" Value="c">C</td>--%>
                            <%--<td bgcolor="#FFFFFF">0</td>--%>
                            <%--<td bgcolor="#FFFFFF">0</td>--%>
                            <td bgcolor="#FFFFFF"></td>
                            <td bgcolor="#FFFFFF"></td>
                            <td bgcolor="#FFFFFF"></td>
                            <td bgcolor="#FFFFFF"></td>
                        </tr>
                    </table>

                    <br/>
                    <input type="button" class="mybt" style="border-width: medium; margin-left: 35%;" name="Submit"
                           value="新增" onclick="AddRow(document.getElementById('tabProduct3'),1)"/>
                    <input type="button" class="mybt" style="border-width: medium" name="Submit2" value="删除"
                           onclick="DeleteRow(document.getElementById('tabProduct3'),1)"/>
                    <%--<input type="button" name="Submit22" value="重置" onclick="window.location.reload()"/>--%>
                    <input type="submit" class="mybt" style="border-width: medium;" name="Submit3" value="提交"
                    <%--onclick="GetTableData(document.getElementById('tabProduct'));return false;"/>--%>
                </form>
                <script type="text/javascript" src="../static/js/jquery-3.2.1.min.js"></script>
                <script language="javascript" src="../static/js/editTable.js"></script>
                <script language="javascript">
                    var tabProduct2 = document.getElementById("tabProduct3");

                    // 设置表格可编辑
                    // 可一次设置多个，例如：EditTables(tb1,tb2,tb2,......)
                    EditTables(tabProduct2);
                </script>
            </div>
        </div>

    </div>
</div>
<script type="application/javascript" src="../static/js/dropzoneModify.js"></script>
<script type="application/javascript" src="../static/js/modifySchool.js"></script>
