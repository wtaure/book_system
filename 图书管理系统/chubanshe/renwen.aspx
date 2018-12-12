<%@ Page Title="" Language="C#" MasterPageFile="~/mu.master" AutoEventWireup="true" CodeFile="renwen.aspx.cs" Inherits="_Default" Debug="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<asp:ListView ID="ListView1" runat="server" ItemPlaceholderID="itemhorder" 
    DataSourceID="SqlDataSource1">
    <LayoutTemplate>
    <div id="itemhorder" runat="server"></div>
    </LayoutTemplate>

    <ItemTemplate>

    <div class="box">
    <div class="a">
         <p class="b"><%#Eval("title") %><span>&nbsp;(<%#Eval("author") %>)</span></p>
         <small><%#Eval("time") %></small>
          
         </div>
         <hr />
         <div class="c" style="">
         <img style="width:300px;" alt="" src='<%#Eval("img","img/{0}") %>' />
        
         
          <p><%#Eval("neirong") %></p>
          
            </div>
    
    </div>
    </ItemTemplate>

    </asp:ListView>

<asp:SqlDataSource ID="SqlDataSource1" runat="server" 
    ConnectionString="<%$ ConnectionStrings:chubansheConnectionString %>" 
    
        SelectCommand="SELECT * FROM [book_messages] WHERE ([id] = @id) ORDER BY [time] DESC">
    <SelectParameters>
        <asp:QueryStringParameter Name="id" QueryStringField="id" Type="String" />
    </SelectParameters>
    </asp:SqlDataSource>

</asp:Content>

