<%@ Page Title="" Language="C#" MasterPageFile="~/xitong1.master" AutoEventWireup="true" CodeFile="newssearch.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

 <div style=" border:0px solid #ccc; width:700px; color:#333; font-size:14px;">
        <br />
    <span class="alert alert-success">请输入新闻号进行查询：</span><br />
        <br />
        <asp:TextBox ID="TextBox1" runat="server" class="form-control mr-sm-2" ></asp:TextBox>
        <br />
        <br/>
    <asp:Button ID="Button1" runat="server" Text="搜索" onclick="Button1_Click" class="btn btn-outline-success my-2 my-sm-0" style="text-align:center;"  />&nbsp;
    <asp:Button ID="Button2" runat="server" Text="显示全部记录" onclick="Button2_Click" class="btn btn-outline-success my-2 my-sm-0"  />
    </div> 
    <div style="text-align:center;margin-top:20px;">
    
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" OnPageIndexChanging="GridView1_PageIndexChanging"
            PageSize="6" AutoGenerateColumns="False" 
        CellPadding="4" ForeColor="#333333" GridLines="None" DataKeyNames="newsid" 
            >
               <AlternatingRowStyle  />
               <Columns>
                   <asp:BoundField DataField="newsid" HeaderText="newsid" ReadOnly="true" 
                       SortExpression="newsid" />
                   <asp:BoundField DataField="title" HeaderText="title" SortExpression="title" />
                   <asp:BoundField DataField="editors" HeaderText="editors" SortExpression="editors" />
                   <asp:BoundField DataField="classify" HeaderText="classify" SortExpression="classify" />
                   <asp:BoundField DataField="time" HeaderText="time" SortExpression="time" />
               </Columns>
              
            <PagerTemplate>
                当前第:
               
                <asp:Label ID="LabelCurrentPage" runat="server" Text="<%# ((GridView)Container.NamingContainer).PageIndex + 1 %>"></asp:Label>
                页/共:
                
                <asp:Label ID="LabelPageCount" runat="server" Text="<%# ((GridView)Container.NamingContainer).PageCount %>"></asp:Label>
                页
               
                <asp:LinkButton ID="LinkButtonFirstPage" runat="server" CommandArgument="First" CommandName="Page"
                    Visible='<%#((GridView)Container.NamingContainer).PageIndex != 0 %>' class="btn btn-secondary">首页</asp:LinkButton>
                <asp:LinkButton ID="LinkButtonPreviousPage" runat="server" CommandArgument="Prev"
                    CommandName="Page" Visible='<%# ((GridView)Container.NamingContainer).PageIndex != 0 %>' class="btn btn-secondary">上一页</asp:LinkButton>
               
                <asp:LinkButton ID="LinkButtonNextPage" runat="server" CommandArgument="Next" CommandName="Page"
                    Visible='<%# ((GridView)Container.NamingContainer).PageIndex != ((GridView)Container.NamingContainer).PageCount - 1 %>' class="btn btn-secondary">下一页</asp:LinkButton>
                <asp:LinkButton ID="LinkButtonLastPage" runat="server" CommandArgument="Last" CommandName="Page"
                    Visible='<%# ((GridView)Container.NamingContainer).PageIndex != ((GridView)Container.NamingContainer).PageCount - 1 %>' class="btn btn-secondary">尾页</asp:LinkButton>
                转到第
                <asp:TextBox ID="txtNewPageIndex" runat="server" Width="20px" Text='<%# ((GridView)Container.Parent.Parent).PageIndex + 1 %>' />页
              
                <asp:LinkButton ID="btnGo" runat="server" CausesValidation="False" CommandArgument="-2"
                    CommandName="Page" Text="GO" class="btn btn-secondary" />
            </PagerTemplate>
  
       
    </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:wgdConnectionString9 %>" 
            SelectCommand="SELECT * FROM [stu]"></asp:SqlDataSource>
    </div>

</asp:Content>

