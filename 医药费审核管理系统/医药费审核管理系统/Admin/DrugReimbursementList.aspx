<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DrugReimbursementList.aspx.cs" Inherits="医药费审核管理系统.Admin.DrugReimbursementList" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <style>
        .tbr {
            width:960px;
        }
            .tbr td {
                border:solid 1px #ccc;
            }
    </style>
    <script src="js/jquery-1.8.2.min.js"></script>
    <script>
        function DrugsRemove(id) {
            if (confirm("确定删除吗？删除后不可恢复。")) {
                $.post(
                    "DrugsRemove.ashx",
                    {
                        id: id,
                    },
                    function (msg) {
                        if (msg == 1) {
                            location.href = "DrugReimbursementList.aspx";
                        } else {
                            alert("删除用户失败，请稍后重试。");
                        }
                    }
                    );
            }
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table>
                <tr>
                    <td>商品名</td>
                    <td>
                        <input type="text" name="drugsailname" value="" /></td>
                    <td>通用名</td>
                    <td>
                        <input type="text" name="drugcommonname" value="" /></td>
                    <td>价格</td>
                    <td>
                        <input type="text" name="drugprice" value="" /></td>
                    <td>生产厂家</td>
                    <td>
                        <input type="text" name="drugfactory" value="" /></td>
                </tr>
                <tr>
                    <td>功能主治</td>
                    <td>
                        <input type="text" name="drugbility" value="" /></td>
                    <td>不良反应</td>
                    <td>
                        <input type="text" name="drugability" value="" /></td>
                    <td>生产日期</td>
                    <td>
                        <input type="text" name="drugmakedate" value="" /></td>
                    <td>保质期</td>
                    <td>
                        <input type="text" name="druglife" value="" /></td>
                </tr>
                <tr>
                    <td colspan="4">
                        <input type="submit" value="提交数据" /><%=ErrorMsg %></td>
                </tr>
            </table>
            <hr />
            <asp:Repeater ID="Repeater1" runat="server">
                <HeaderTemplate>
                    <table class="tbr">
                        <tr>
                            <td>商品名</td>
                            <td>通用名</td>
                            <td>价格</td>
                            <td>生产厂家</td>
                            <td>功能主治</td>
                            <td>不良反应</td>
                            <td>生产日期</td>
                            <td>保质期</td>
                            <td>操作</td>
                        </tr>
                </HeaderTemplate>
                <FooterTemplate>
                    </table>
                </FooterTemplate>
                <ItemTemplate>
                    <tr>
                        <td><%#Eval("drugsailname") %></td>
                        <td><%#Eval("drugcommonname") %></td>
                        <td><%#Eval("drugprice") %></td>
                        <td><%#Eval("drugfactory") %></td>
                        <td><%#Eval("drugbility") %></td>
                        <td><%#Eval("drugability") %></td>
                        <td><%#Eval("drugmakedate") %></td>
                        <td><%#Eval("druglife") %></td>
                        <td><a href="javascript:DrugsRemove(<%#Eval("did") %>)">删除</a></td>
                    </tr>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </form>
</body>
</html>
