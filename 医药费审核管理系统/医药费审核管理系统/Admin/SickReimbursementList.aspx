<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SickReimbursementList.aspx.cs" Inherits="医药费审核管理系统.Admin.SickReimbursementList" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <style>
        table {
            width: 900px;
        }

            table td {
                border: solid 1px #ccc;
            }
    </style>
    <script src="js/jquery-1.8.2.min.js"></script>
    <script>
        function SickersRemove(id) {
            if (confirm("确定删除吗？删除后不可恢复。")) {
                $.post(
                    "SickersRemove.ashx",
                    {
                        id: id,
                    },
                    function (msg) {
                        if (msg == 1) {
                            location.href = "SickReimbursementList.aspx";
                        } else {
                            alert("删除失败，请稍后重试。");
                        }
                    }
                    );
            }
        }
    </script>
</head>
<body>
    <div style="font-size: 40px;">报销列表查看</div>
    <form id="form1" runat="server">
        <div>
            <asp:Repeater ID="Repeater1" runat="server">
                <HeaderTemplate>
                    <table class="tbr">
                        <tr>
                            <td>单号</td>
                            <td>姓名</td>
                            <td>年龄</td>
                            <td>性别</td>
                            <td>生日</td>
                            <td>操作</td>
                        </tr>
                </HeaderTemplate>
                <FooterTemplate>
                    </table>
                </FooterTemplate>
                <ItemTemplate>
                    <tr>
                        <td><%#Eval("snum") %></td>
                        <td><%#Eval("sname") %></td>
                        <td><%#Eval("sage") %></td>
                        <td><%#Eval("ssex") %></td>
                        <td><%#Eval("sbirthday") %></td>
                        <td>
                            <a href="SickReimbursementDetail.aspx?snum='<%#Eval("snum") %>'">报销查看</a>
                            <a href="javascript:SickersRemove(<%#Eval("sid") %>)">删除</a></td>
                    </tr>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </form>
</body>
</html>
