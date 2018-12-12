<%@ Page Title="" Language="C#" MasterPageFile="~/mu.master" AutoEventWireup="true" CodeFile="newsindex.aspx.cs" Inherits="_Default" %>

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
         <p class="b"><%#Eval("title") %></p>
         <small><%#Eval("time") %></small>
         </div>
         <hr />
         <div class="c" >
         <img style="" alt="" src='<%#Eval("img","img/{0}") %>' />
        
         
          <p><%#Eval("neirong") %></p>
           <span><%#Eval("editors") %></span>
            </div>
    
    </div>
    </ItemTemplate>

    </asp:ListView>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:chubansheConnectionString %>" 
        SelectCommand="SELECT * FROM [news_messages] WHERE ([id] = @id) ORDER BY [time] DESC">
        <SelectParameters>
            <asp:QueryStringParameter Name="id" QueryStringField="id" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>

</asp:Content>

