<%@ Page Title="" Language="C#" MasterPageFile="~/xitong1.master" AutoEventWireup="true" CodeFile="DELuser.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div id="content">
    <asp:GridView ID="GridView1" runat="server" OnRowDeleting="GridView1_RowDeleting"  OnRowDataBound="GridView1_RowDataBound" CssClass="table table-striped">
     
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" />
                   
                   
                  
                </Columns>
                 
    </asp:GridView>

</asp:Content>

