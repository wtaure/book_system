<%@ Page Title="" Language="C#" MasterPageFile="~/xitong1.master" AutoEventWireup="true"
    CodeFile="houtailogin.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <style type="text/css">
        #denglu
        {
            width: 400px;
            margin: 0 auto;
            margin-top: 100px;
        }
        
        td
        {
            padding: 5px;
            color: #444;
            border: 1px solid #dedede;
        }
        table
        {
            width: 399px;
        }
        body
        {
        }
        th
        {
            letter-spacing: 5px;
            color: #666;
            font-family: 微软雅黑;
        }
    </style>
    <div id="denglu">
        <div>
            <table>
                <th colspan="2">
                    请登录
                </th>
                <tr>
                    <td>
                        用户名：
                    </td>
                    <td>
                        <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        密 码：
                    </td>
                    <td>
                        <asp:TextBox ID="TextBox2" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Button ID="Button2" runat="server" Text="确 定" OnClick="Button2_Click" CssClass="btn btn-primary"
                              />
                    </td>
                    <td>
                        <%--<asp:Button ID="Button3" runat="server" CssClass="anniu" Text="注   册" Height="28px"
                            Width="80px" OnClick="Button3_Click" />--%>
                    </td>
                </tr>
            </table>
        </div>
    </div>
</asp:Content>
