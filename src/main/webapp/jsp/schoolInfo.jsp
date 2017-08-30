<%--
  Created by IntelliJ IDEA.
  User: island
  Date: 2017/8/22
  Time: 下午8:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div id="schoolInfoView" style="display: none">
    <div id="schoolInfoContent">
        <h1 id="schoolName"></h1>
        <div id="grade" class="block" style="left: 7%; position: relative; height: 65vh; top: 0%; float: left; overflow: hidden;">
            <h6 style="width: 100%; text-align: center;">班级信息</h6>
            <form id="gradeForm2" name="form2" method="post" action=""
                  style="position: relative; width: 100%; left: 0%; top: 0%;">
                <%--<h6 style="width: 100%; text-align: center;">班级信息</h6>--%>
                <table class="table-head orderTable" width="698" border="0" cellpadding="0" cellspacing="0" id="tabProduct2" style="margin: 1%;">
                    <tr style="font-size: 2.2vh; color: #142535;">
                        <td width="20%" align="center" bgcolor="#c2e2e7" Name="Num"></td>
                        <td width="40%" bgcolor="#c2e2e7" Name="Num" EditType="TextBox" style="text-align: center">入学年份</td>
                        <%--<td width="152" bgcolor="#EFEFEF" Name="ProductName" EditType="DropDownList"--%>
                        <%--DataItems="{text:'A',value:'a'},{text:'B',value:'b'},{text:'C',value:'c'},{text:'D',value:'d'}">--%>
                        <%--商品名称--%>
                        <%--</td>--%>
                        <td width="40%" bgcolor="#c2e2e7" Name="Amount" EditType="TextBox" style="text-align: center">班级数</td>
                        <%--<td width="103" bgcolor="#EFEFEF" Name="Price" EditType="TextBox">单价</td>--%>
                        <%--<td width="120" bgcolor="#EFEFEF" Name="SumMoney" Expression="Amount*Price" Format="#,###.00">合计--%>
                        <%--</td>--%>
                    </tr>
                    <tr style="height: 5vh;">
                        <td align="center" bgcolor="#FFFFFF"><input type="checkbox" name="checkbox2" value="checkbox"/></td>
                        <td bgcolor="#FFFFFF" style="text-align: center"></td>
                        <%--<td bgcolor="#FFFFFF" Value="c">C</td>--%>
                        <%--<td bgcolor="#FFFFFF">0</td>--%>
                        <%--<td bgcolor="#FFFFFF">0</td>--%>
                        <td bgcolor="#FFFFFF" style="text-align: center"></td>
                    </tr>

                </table>

                <br/>
                <input type="button" class="mybt" style="border-width: medium; margin-left: 9%; width: 20%" name="Submit" value="新增"
                       onclick="AddRow(document.getElementById('tabProduct2'),1)"/>
                <input type="button" class="mybt" style="border-width: medium; margin-left: 9%; width: 20%;" name="Submit2" value="删除"
                       onclick="DeleteRow(document.getElementById('tabProduct2'),1)"/>
                <input type="button" class="mybt" style="border-width: medium; margin-left: 9%; width: 20%;" name="Submit2" value="修改"
                       onclick=""/>
                <%--<input type="button" name="Submit22" value="重置" onclick="window.location.reload()"/>--%>
                <%--<input type="submit" name="Submit3" value="提交"--%>
                <%--onclick="GetTableData(document.getElementById('tabProduct'));return false;"/>--%>
            </form>

        </div>
        <div id="typeArea" class="block" style="left: 14%; position: relative; height: 65vh; top: 0%; float: left">
            <h6 style="width: 100%; text-align: center;">衣物种类</h6>
            <input type="button" class="mybt" style="top: 0%; border-width: medium; margin-left: 89%; width: 2vw; height: 2vw; position: absolute; margin-top: 1%; white-space: nowrap; font-size: 1vw; border: none; display: inline-block; border-radius: 50%; padding: 0;" name="Submit2" value="+"
                   onclick="showAddTypeView()"/>
            <table class="table-head orderTable" style="margin: 1%;" id="typeTable">
                <tr>
                    <th style="width: 10%">
                        图片
                    </th>
                    <th style="width: 20%">
                        品名
                    </th>
                    <th style="width: 10%">
                        价格
                    </th>
                </tr>
                </tbody>
                <%--<tbody class="table-content-body">--%>
                <%--<tr>--%>
                    <%--<th style="width: 10%">--%>
                        <%--<div class="imageBox">--%>
                            <%--<img src="../static/images/maleIcon.png" class="largeImage" id="pic"/>--%>
                        <%--</div>--%>
                    <%--</th>--%>
                    <%--<th style="width: 20%">--%>
                        <%--<a href="" id="title">短袖衬衫</a>--%>
                    <%--</th>--%>
                    <%--<th style="width: 20%" id="school">--%>
                        <%--50--%>
                    <%--</th>--%>
                <%--</tr>--%>
                <%--</tbody>--%>
            </table>
        </div>
        <div id="student" class="block" style="left: 21%; position: relative; height: 65vh; top: 0%;">
            <h6 style="width: 100%; text-align: center; position: relative;">学生列表</h6>
            <input type="button" class="mybt" style="top: 0%; border-width: medium; margin-left: 89%; width: 2vw; height: 2vw; position: absolute; margin-top: 1%; white-space: nowrap; font-size: 1vw; border: none; display: inline-block; border-radius: 50%; padding: 0;" name="Submit2" value="+"
                   onclick="showAddStudentView()"/>
            <table class="table-head orderTable" style="margin: 1%;" id="userTable">
                <tr>
                    <th style="width: 20%">
                        班级
                    </th>
                    <th style="width: 10%">
                        姓名
                    </th>
                    <th style="width: 10%">
                        性别
                    </th>
                </tr>
                </tbody>
                <%--<tbody class="table-content-body">--%>
                <%--<tr>--%>
                    <%--<th>--%>
                        <%--2016级1班--%>
                    <%--</th>--%>
                    <%--<th>--%>
                        <%--<a href="">XXX</a>--%>
                    <%--</th>--%>
                    <%--<th>--%>
                        <%--男--%>
                    <%--</th>--%>
                <%--</tr>--%>
                <%--</tbody>--%>
            </table>
        </div>
        <script type="text/javascript" src="../static/js/jquery-3.2.1.min.js"></script>
        <script language="javascript" src="../static/js/editTable.js"></script>
        <script language="javascript" src="../static/js/manager.js"></script>
        <script language="javascript">
            var tabProduct = document.getElementById("tabProduct2");

            // 设置表格可编辑
            // 可一次设置多个，例如：EditTables(tb1,tb2,tb2,......)
            EditTables(tabProduct);
        </script>
    </div>
</div>