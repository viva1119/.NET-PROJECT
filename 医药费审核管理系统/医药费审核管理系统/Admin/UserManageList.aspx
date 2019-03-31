<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserManageList.aspx.cs" Inherits="医药费审核管理系统.Admin.UserManageList" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>员工管理</title>
    <link href="../css/EmpManage.css" rel="Stylesheet" type="text/css" />
    <script src="js/jquery-1.8.2.min.js"></script>
    <style>
        select {
            width: 100%;
            height: 100%;
        }

        #buttom, #middle {
            float: left;
        }

        #middle {
            margin-left: 10px;
            height: 500px;
            border-left: solid 2px #000;
        }

            #middle table {
                margin-left: 10px;
                width: 500px;
            }

                #middle table td {
                    border: solid 1px #ccc;
                }
    </style>
    <script>
        function AddUser() {
            $.post(
                "UserManageAdd.ashx",
                {
                    username: $("#username").val(),
                    userpwd: $("#userpwd").val(),
                    usersex: $("#usersex").val(),
                    address: $("#address").val(),
                    phone: $("#phone").val(),
                    userrole: $("#userrole").val(),
                },
                function (msg) {
                    if (msg == 1) {
                        location.href = "UserManageList.aspx";
                    } else {
                        alert("添加用户失败，请稍后重试。");
                    }
                }
                );
        }
        function UserManageRemove(id) {
            if (confirm("确定删除吗？删除后不可恢复。")) {
                $.post(
                    "UserManageRemove.ashx",
                    {
                        EmpId: id,
                    },
                    function (msg) {
                        if (msg == 1) {
                            location.href = "UserManageList.aspx";
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
            <div id="top">
                <table id="Table1" style="height: 40px" cellspacing="0" cellpadding="0" width="100%" align="center" border="0">
                    <tr>
                        <td width="100%" align="center">
                            <font size="10">员工管理</font>
                        </td>
                    </tr>
                </table>
            </div>
            <div id="buttom">
                <asp:Label ID="Label1" runat="server" Text="Label">1、为管理员，2、为公司总经理 ，3、4为普通用户</asp:Label>
                <table>
                    <tr>
                        <td>用户编号</td>
                        <td colspan="3">&nbsp;</td>
                    </tr>
                    <tr>
                        <td>用户名</td>
                        <td>
                            <input type="text" name="username" id="username" value="" /></td>
                        <td>角色</td>
                        <td>
                            <select name="userrole" id="userrole">
                                <option value="二级用户">二级用户</option>
                                <option value="普通用户">普通用户</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>密码</td>
                        <td>
                            <input type="password" name="userpwd" id="userpwd" value="" /></td>

                        <td>性别</td>
                        <td>
                            <select name="usersex" id="usersex">
                                <option value="男">男</option>
                                <option value="女">女</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>地址</td>
                        <td>
                            <input type="text" name="address" id="address" value="" /></td>

                        <td>号码</td>
                        <td>
                            <input type="text" name="phone" id="phone" value="" /></td>
                    </tr>
                    <tr>
                        <td colspan="4">&nbsp;</td>
                    </tr>
                    <tr>
                        <td colspan="2"></td>
                        <td>&nbsp;</td>
                        <td>
                            <input type="button" value="新增员工" onclick="javascript: AddUser()" /></td>
                    </tr>
                </table>
            </div>
            <div id="middle">
                <asp:Repeater ID="Repeater1" runat="server">
                    <HeaderTemplate>
                        <table>
                            <tr>
                                <td>编号</td>
                                <td>用户名</td>
                                <td>密码</td>
                                <td>性别</td>
                                <td>地址</td>
                                <td>号码</td>
                                <td>角色</td>
                                <td>操作</td>
                            </tr>
                    </HeaderTemplate>
                    <FooterTemplate>
                        </table>
                    </FooterTemplate>
                    <ItemTemplate>
                        <tr>
                            <td><%#Eval("EmpId") %></td>
                            <td><%#Eval("EmpName") %></td>
                            <td><%#Eval("EmpPwd") %></td>
                            <td><%#Eval("EmpSex") %></td>
                            <td><%#Eval("EmpAddress") %></td>
                            <td><%#Eval("EmpPhone") %></td>
                            <td><%#Eval("EmpRole") %></td>
                            <td><a href="javascript:UserManageRemove(<%#Eval("EmpId") %>)">删除</a></td>
                        </tr>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
    </form>
</body>
</html>
