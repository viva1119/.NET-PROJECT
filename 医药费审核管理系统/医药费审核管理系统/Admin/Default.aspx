<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Default" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>主页</title>
    <%--<link href="css/Default.css" rel="stylesheet" type="text/css" />--%>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table class="table" width="100%" bgcolor="#0066FF">
                <tr>
                    <td>
                        <span id="time"></span>
                        <%--<script>
                            document.getElementById('time').innerHTML = new Date().toLocaleString() + ' 星期' + '日一二三四五六'.charAt(new Date().getDay()); setInterval("document.getElementById('time').innerHTML=new Date().toLocaleString()+' 星期'+'日一二三四五六'.charAt(new Date().getDay());", 1000);
                        </script>--%>
                    </td>
                    <td>欢迎                                                     
                <asp:Label ID="Label1" name="Label1" runat="server" Text="Label"></asp:Label>
                        <a onclick="javascript:if(confirm('你确定要退出本系统吗?'))window.location='Login.aspx';" href="#">退出系统</a>
                    </td>
                </tr>
            </table>
            <table class="table" width="100%" border="1">
                <tr>
                    <td rowspan="2" style="width: 100px;" bgcolor="#0066FF">
                        <div>
                            <asp:TreeView ID="TreeView1" runat="server">
                                <Nodes>
                                    <asp:TreeNode Text="系统管理" Value="系统管理">
                                        <asp:TreeNode Text="员工管理" Value="员工管理" NavigateUrl="UserManageList.aspx" Target="mainiframe"></asp:TreeNode>
                                    </asp:TreeNode>
                                    <asp:TreeNode Text="医保信息" Value="医保信息">
                                        <asp:TreeNode Text="可报销药品列表" Value="可报销药品列表" NavigateUrl="DrugReimbursementList.aspx" Target="mainiframe"></asp:TreeNode>
                                        <asp:TreeNode Text="报销列表" Value="报销列表" NavigateUrl="SickReimbursementList.aspx" Target="mainiframe"></asp:TreeNode>
                                    </asp:TreeNode>
                                    <asp:TreeNode Text="患者信息" Value="患者信息">
                                        <asp:TreeNode Text="患者手术" Value="患者手术" NavigateUrl="SickersMessage.aspx" Target="mainiframe"></asp:TreeNode>
                                    </asp:TreeNode>
                                </Nodes>
                            </asp:TreeView>
                        </div>
                    </td>
                    <td>
                        <div>
                            <iframe name="mainiframe" id="mainiframe" src="ArticleList.aspx" style="width: 1248px; height: 600px"></iframe>
                        </div>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>

