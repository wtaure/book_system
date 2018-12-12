<%@ Page Title="" Language="C#" MasterPageFile="~/mu.master" AutoEventWireup="true" CodeFile="ebookindex.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


<asp:ListView ID="ListView1" runat="server" ItemPlaceholderID="itemhorder" 
    DataSourceID="SqlDataSource1">
    <LayoutTemplate>
    <div id="itemhorder" runat="server"></div>
    </LayoutTemplate>

    <ItemTemplate>

    
    <div class="box" style=" min-height:300px; max-height:500px; height: auto;">
    <div class="a">
        <p style=" font-size:34px"><%#Eval("title") %></p>
         <small><%#Eval("time") %></small>
         </div>
         <hr />
         <div class="c" > <p class="b"><%#Eval("ebookmessages") %></p>
         <%--<img style="width:200px;" alt="" src='<%#Eval("img","img/{0}") %>' />--%>
             <%--<p>
                 <%#Eval("neirong") %></p>
             <span>
                 <%#Eval("author") %></span>--%>
            </div>
    </div>
    </div>
    </ItemTemplate>

    </asp:ListView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:chubansheConnectionString %>" 
        SelectCommand="SELECT * FROM [ebook] WHERE ([id] = @id)">
        <SelectParameters>
            <asp:QueryStringParameter Name="id" QueryStringField="id" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>

