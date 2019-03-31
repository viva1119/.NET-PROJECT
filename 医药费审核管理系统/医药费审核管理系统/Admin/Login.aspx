<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="医药费审核管理系统.Admin.Log" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>用户登陆</title>
    <link href="css/Login.css" rel="stylesheet" type="text/css" />
    <script src="js/jquery-1.8.2.min.js"></script>
    <script>
        function CancelLogin() {
            location.href = "Login.aspx";
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div id="login">
            <table class="style1" align="center">
                <tr>
                    <td colspan="2">医药费审核管理系统</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr class="style1">
                    <td width="120">登陆名称</td>
                    <td class="style1">
                        <asp:TextBox ID="EmpName" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr class="style1">
                    <td height="30" width="120">登陆密码</td>
                    <td class="style1">
                        <asp:TextBox ID="EmpPwd" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td colspan="2"><%=ErrorMsg %></td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" value="登录" />
                        <input type="button" value="取消" onclick="javascript: CancelLogin()" />
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
<div align="center" id="conncetion">
    <h4>友情链接</h4>
    <a href="https://www.baidu.com/">百度</a>
    <a href="http://www.sina.com.cn/">新浪</a>
    <a href="https://www.qq.com/">腾讯</a>
    <a href="https://www.aliyun.com/">阿里云</a>
    <a href="https://www.yahoo.com/">雅虎</a>
    <a href="https://www.wangyi.com/">网易</a>
</div>

</html>
