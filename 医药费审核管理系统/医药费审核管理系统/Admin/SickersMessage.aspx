<%@ Page Language="C#" ValidateRequest="false" AutoEventWireup="true" CodeBehind="SickersMessage.aspx.cs" Inherits="医药费审核管理系统.Admin.SickersMessage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link href="umeditor/themes/default/css/umeditor.min.css" rel="stylesheet" />
    <script src="js/jquery-1.8.2.min.js"></script>
    <script src="umeditor/umeditor.min.js"></script>
    <script src="umeditor/umeditor.config.js"></script>
    <style>
        .tbr {
            width: 845px;
        }

            .tbr td {
                border: solid 1px #ccc;
            }
    </style>
    <script>
        $(function () {

        });
        function SickersDrugRemove(id) {
            $.post(
                "SickersDrugRemove.ashx",
                {
                    id: id,
                },
                function (msg) {
                    if (msg == 1) {
                        location.href = "SickersMessage.aspx";
                    } else {
                        alert("删除失败，请稍后重试。");
                    }
                }
                );
        }
        function SickerDurgSuccess() {
            location.href = "SickReimbursementList.aspx?snum=<%=Snum %>";
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <input type="hidden" name="snum" value="<%=Snum %>" />
        <div>
            <div style="font-size: 40px; text-align: center;">患者检查</div>
            <hr />
            基本信息：
            <table>
                <tr>
                    <td>姓名</td>
                    <td>
                        <input type="text" name="sname" value="<%=Sname %>" /></td>
                    <td>性别</td>
                    <td>
                        <input type="text" name="ssex" value="<%=Ssex %>" /></td>
                    <td>年龄</td>
                    <td>
                        <input type="text" name="sage" value="<%=Sage %>" /></td>
                    <td>生日</td>
                    <td>
                        <input type="text" name="sbirthday" value="<%=Sbirthday %>" /></td>
                </tr>
            </table>
           <%-- 病情描述：
            <script type="text/plain" id="myEditor" style="width: 845px; height: 70px;">
            </script>
            <script type="text/javascript">
                //实例化编辑器
                var um = UM.getEditor('myEditor');
            </script>--%>
            <hr />
            医生开药：
            药名：<input type="text" name="sddrugname" value="" />
            数量：<input type="text" name="sddrugcount" value="" />
            单价：<input type="text" name="sddrugprice" value="" />
            <br />
            <input type="submit" value="计入药单" />&nbsp;&nbsp;
            <input type="button" value="确定开药" onclick="javascript: SickerDurgSuccess()" />
            <asp:Repeater ID="Repeater1" runat="server">
                <HeaderTemplate>
                    <table class="tbr">
                        <tr>
                            <td>药名</td>
                            <td>数量</td>
                            <td>价格</td>
                            <td>小计</td>
                            <td>操作</td>
                        </tr>
                </HeaderTemplate>
                <FooterTemplate>
                    </table>
                </FooterTemplate>
                <ItemTemplate>
                    <tr>
                        <td><%#Eval("sddrugname") %></td>
                        <td><%#Eval("sddrugcount") %></td>
                        <td><%#Eval("sddrugprice") %></td>
                        <td><%#Eval("sddrugmoney") %></td>
                        <td><a href="javascript:SickersDrugRemove(<%#Eval("sdid") %>)">删除</a></td>
                    </tr>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </form>
</body>
</html>
