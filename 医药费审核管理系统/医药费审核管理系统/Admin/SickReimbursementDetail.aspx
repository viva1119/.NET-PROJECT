<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SickReimbursementDetail.aspx.cs" Inherits="医药费审核管理系统.Admin.SickReimbursementDetail" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <script src="js/jquery-1.8.2.min.js"></script>
    <script>
        function Back() {
            location.href = "SickReimbursementList.aspx";
        }
    </script>
    <style>
        table {
            width: 900px;
        }

            table td {
                border: solid 1px #ccc;
            }
    </style>
</head>
<body>
    <div style="font-size: 40px;">报销明细查看</div>
    <form id="form1" runat="server">
        <div>
            药单总金额：<%=Totle %>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;可报销金额：<%=TotleMoney %>
            <br />
            可报销明细：
            <asp:Repeater ID="Repeater1" runat="server">
                <HeaderTemplate>
                    <table class="tbr">
                        <tr>
                            <td>单号</td>
                            <td>姓名</td>
                            <td>药名</td>
                            <td>数量</td>
                            <td>单价</td>
                            <td>金额</td>
                            <td>是否可报</td>
                        </tr>
                </HeaderTemplate>
                <FooterTemplate>
                    </table>
                </FooterTemplate>
                <ItemTemplate>
                    <tr>
                        <td><%#Eval("单号") %></td>
                        <td><%#Eval("姓名") %></td>
                        <td><%#Eval("药名") %></td>
                        <td><%#Eval("数量") %></td>
                        <td><%#Eval("单价") %></td>
                        <td><%#Eval("金额") %></td>
                        <td><%#Eval("是否可报") %></td>
                    </tr>
                </ItemTemplate>
            </asp:Repeater>
        </div>
        <input type="button" value="点击返回" onclick="javascript: Back()" />
    </form>
</body>
</html>
