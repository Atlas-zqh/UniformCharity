<%--
  Created by IntelliJ IDEA.
  User: island
  Date: 2017/8/21
  Time: 下午10:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div id="addSchoolView" style="display: none">
    <div id="addSchoolContent">
        <h6 style="width: 50%; text-align: center; position: absolute; top: 15%; left: 0%; margin: 0%;">学校名称</h6>
        <input class="text" style="position: absolute; width: 20%; left: 15%; top: 20%;" placeholder="学校名">
        <h6 style="width: 50%; text-align: center; position: absolute; top: 35%; left: 0%; margin: 0%;">所属城市</h6>
        <input class="text" style="position: absolute; width: 20%; left: 15%; top: 40%; font-size: 2vh" placeholder="如：南京">
        <h6 style="width: 50%; text-align: center; position: absolute; top: 55%; left: 0%; margin: 0%;">所属区域</h6>
        <input class="text" style="position: absolute; width: 20%; left: 15%; top: 60%; font-size: 2vh"  placeholder="如：栖霞">

        <form id="gradeForm" name="form1" method="post" action="" style="position: absolute; width: 50%; left: 50%; top: 15%;">
            <h6 style="width: 100%; text-align: center;">班级信息</h6>
            <table width="698" border="0" cellpadding="0" cellspacing="0" id="tabProduct">
                <tr style="font-size: 2.2vh; color: #142535">
                    <td width="10%" align="center" bgcolor="#c2e2e7" Name="Num"></td>
                    <td width="45%" bgcolor="#c2e2e7" Name="Num" EditType="TextBox">入学年份</td>
                    <%--<td width="152" bgcolor="#EFEFEF" Name="ProductName" EditType="DropDownList"--%>
                        <%--DataItems="{text:'A',value:'a'},{text:'B',value:'b'},{text:'C',value:'c'},{text:'D',value:'d'}">--%>
                        <%--商品名称--%>
                    <%--</td>--%>
                    <td width="45%" bgcolor="#c2e2e7" Name="Amount" EditType="TextBox">班级数</td>
                    <%--<td width="103" bgcolor="#EFEFEF" Name="Price" EditType="TextBox">单价</td>--%>
                    <%--<td width="120" bgcolor="#EFEFEF" Name="SumMoney" Expression="Amount*Price" Format="#,###.00">合计--%>
                    <%--</td>--%>
                </tr>
                <tr>
                    <td align="center" bgcolor="#FFFFFF"><input type="checkbox" name="checkbox2" value="checkbox"/></td>
                    <td bgcolor="#FFFFFF"></td>
                    <%--<td bgcolor="#FFFFFF" Value="c">C</td>--%>
                    <%--<td bgcolor="#FFFFFF">0</td>--%>
                    <%--<td bgcolor="#FFFFFF">0</td>--%>
                    <td bgcolor="#FFFFFF"></td>
                </tr>
                <tr>
                    <td align="center" bgcolor="#FFFFFF"><input type="checkbox" name="checkbox22" value="checkbox"/>
                    </td>
                    <td bgcolor="#FFFFFF"></td>
                    <%--<td bgcolor="#FFFFFF" Value="d">D</td>--%>
                    <%--<td bgcolor="#FFFFFF">0</td>--%>
                    <%--<td bgcolor="#FFFFFF">0</td>--%>
                    <td bgcolor="#FFFFFF"></td>
                </tr>
                <tr>
                    <td align="center" bgcolor="#FFFFFF"><input type="checkbox" name="checkbox22" value="checkbox"/>
                    </td>
                    <td bgcolor="#FFFFFF"></td>
                    <%--<td bgcolor="#FFFFFF" Value="d">D</td>--%>
                    <%--<td bgcolor="#FFFFFF">0</td>--%>
                    <%--<td bgcolor="#FFFFFF">0</td>--%>
                    <td bgcolor="#FFFFFF"></td>
                </tr>
                <tr>
                    <td align="center" bgcolor="#FFFFFF"><input type="checkbox" name="checkbox22" value="checkbox"/>
                    </td>
                    <td bgcolor="#FFFFFF"></td>
                    <%--<td bgcolor="#FFFFFF" Value="d">D</td>--%>
                    <%--<td bgcolor="#FFFFFF">0</td>--%>
                    <%--<td bgcolor="#FFFFFF">0</td>--%>
                    <td bgcolor="#FFFFFF"></td>
                </tr>
                <tr>
                    <td align="center" bgcolor="#FFFFFF"><input type="checkbox" name="checkbox22" value="checkbox"/>
                    </td>
                    <td bgcolor="#FFFFFF"></td>
                    <%--<td bgcolor="#FFFFFF" Value="d">D</td>--%>
                    <%--<td bgcolor="#FFFFFF">0</td>--%>
                    <%--<td bgcolor="#FFFFFF">0</td>--%>
                    <td bgcolor="#FFFFFF"></td>
                </tr>
                <tr>
                    <td align="center" bgcolor="#FFFFFF"><input type="checkbox" name="checkbox22" value="checkbox"/>
                    </td>
                    <td bgcolor="#FFFFFF"></td>
                    <%--<td bgcolor="#FFFFFF" Value="d">D</td>--%>
                    <%--<td bgcolor="#FFFFFF">0</td>--%>
                    <%--<td bgcolor="#FFFFFF">0</td>--%>
                    <td bgcolor="#FFFFFF"></td>
                </tr>
            </table>

            <br/>
            <input type="button" class="mybt" style="border-width: medium; margin-left: 40%;" name="Submit" value="新增" onclick="AddRow(document.getElementById('tabProduct'),1)"/>
            <input type="button" class="mybt" style="border-width: medium" name="Submit2" value="删除"
                   onclick="DeleteRow(document.getElementById('tabProduct'),1)"/>
            <%--<input type="button" name="Submit22" value="重置" onclick="window.location.reload()"/>--%>
            <%--<input type="submit" name="Submit3" value="提交"--%>
                   <%--onclick="GetTableData(document.getElementById('tabProduct'));return false;"/>--%>
        </form>

        <button class="mybt" style="position: absolute; font-size: 3vh; width: 30%; left: 35%; top: 80%; white-space: nowrap" onclick="addSchool()">添加学校</button>
        <%--<script language="javascript" src="GridEdit.js"></script>--%>
        <script type="text/javascript" src="../static/js/jquery-3.2.1.min.js"></script>
        <script language="javascript" src="../static/js/editTable.js"></script>
        <script language="javascript" src="../static/js/manager.js"></script>
        <script language="javascript">
            var tabProduct = document.getElementById("tabProduct");

            // 设置表格可编辑
            // 可一次设置多个，例如：EditTables(tb1,tb2,tb2,......)
            EditTables(tabProduct);
        </script>
    </div>
</div>