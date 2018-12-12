﻿<%@ Page Title="" Language="C#" MasterPageFile="~/xitong1.master" AutoEventWireup="true" CodeFile="newsedit.aspx.cs" Inherits="_Default" validateRequest="false"%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <script type="text/javascript"></script>
    <style type="text/css">
    .height
    {
        width:100%;
        height:500px;
        background: transparent;
        }
    
    </style>

<div id="content">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" AllowPaging="true" PageSize="5"
     OnRowCancelingEdit="GridView1_RowCancelingEdit"
            OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating"  OnPageIndexChanging="GridView1_PageIndexChanging"    >
        <Columns >
            <asp:BoundField DataField="newsid" HeaderText="newsid" ReadOnly="True" 
                SortExpression="newsid" />
            <asp:BoundField DataField="title" HeaderText="title" SortExpression="title" ><controlstyle CssClass="height"/></asp:BoundField>
            <asp:BoundField DataField="editors" HeaderText="editors" SortExpression="editors" ><controlstyle CssClass="height"/></asp:BoundField>
            <asp:BoundField DataField="classify" HeaderText="classify" SortExpression="classify"  ><controlstyle CssClass="height"/></asp:BoundField>
            <asp:BoundField DataField="neirong" HeaderText="neirong" SortExpression="neirong" ><controlstyle CssClass="height"/></asp:BoundField>
            
            <asp:CommandField ShowEditButton="True" />
        </Columns>
          <PagerTemplate>
                当前第:
               
                <asp:Label ID="LabelCurrentPage" runat="server" Text="<%# ((GridView)Container.NamingContainer).PageIndex + 1 %>"></asp:Label>
                页/共:
                
                <asp:Label ID="LabelPageCount" runat="server" Text="<%# ((GridView)Container.NamingContainer).PageCount %>"></asp:Label>
                页
               
                <asp:LinkButton ID="LinkButtonFirstPage" runat="server" CommandArgument="First" CommandName="Page"
                    Visible='<%#((GridView)Container.NamingContainer).PageIndex != 0 %>'>首页</asp:LinkButton>
                <asp:LinkButton ID="LinkButtonPreviousPage" runat="server" CommandArgument="Prev"
                    CommandName="Page" Visible='<%# ((GridView)Container.NamingContainer).PageIndex != 0 %>'>上一页</asp:LinkButton>
               
                <asp:LinkButton ID="LinkButtonNextPage" runat="server" CommandArgument="Next" CommandName="Page"
                    Visible='<%# ((GridView)Container.NamingContainer).PageIndex != ((GridView)Container.NamingContainer).PageCount - 1 %>'>下一页</asp:LinkButton>
                <asp:LinkButton ID="LinkButtonLastPage" runat="server" CommandArgument="Last" CommandName="Page"
                    Visible='<%# ((GridView)Container.NamingContainer).PageIndex != ((GridView)Container.NamingContainer).PageCount - 1 %>'>尾页</asp:LinkButton>
                转到第
                <asp:TextBox ID="txtNewPageIndex" runat="server" Width="20px" Text='<%# ((GridView)Container.Parent.Parent).PageIndex + 1 %>' />页
              
                <asp:LinkButton ID="btnGo" runat="server" CausesValidation="False" CommandArgument="-2"
                    CommandName="Page" Text="GO" />
            </PagerTemplate>
    </asp:GridView>
    </div>


</asp:Content>

