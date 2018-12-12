<%@ Page Title="" Language="C#" MasterPageFile="~/mu.master" AutoEventWireup="true" CodeFile="newscenter.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div class="newsbox">
    <asp:ListView ID="ListView1" runat="server" ItemPlaceholderID="itemhorder" 
                                DataSourceID="SqlDataSource1">
                            <LayoutTemplate>
                            <div id="itemhorder" runat="server"></div>
                            </LayoutTemplate>

                            <ItemTemplate>
                            <li  class="nav-item">
                                <a href="newsindex.aspx?id=<%#Eval("id")%>" style=" float:left;">
                                <img style="width:161px;height:108px;" alt="" src='<%#Eval("img","img/{0}") %>' />
                                <div style=" float: right;">
                                   <p><%#Eval("title") %></p>
                                   <div class="clear_fix">
                                    <p><%#Eval("editors") %></p>
                                    <p><%#Eval("time") %></p>
                                    </div>
                                
                                </div>
                                
                            </li></a>
                            <div style="clear:both;"></div>
                            </ItemTemplate>


                            </asp:ListView>
                            <div style="width:400px; margin:15px auto;" >
               <asp:DataPager ID="DataPager1" runat="server" PagedControlID="ListView1" PageSize="7"
                        QueryStringField="pageid" >
                        <Fields>
                            <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="false" />
                            <%--ButtonType按钮属性--%>
                            <asp:NumericPagerField ButtonCount="3" ButtonType="Button" NextPageText=">>" PreviousPageText="<<" />
                            <asp:NextPreviousPagerField ButtonType="Button" ShowPreviousPageButton="false" ShowLastPageButton="true" />
                            <%--ButtonType按钮属性--%>
                        </Fields>
                    </asp:DataPager>    </div>     
         <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:chubansheConnectionString %>" 
                                
        SelectCommand="SELECT * FROM [news_messages] ORDER BY [time] DESC"></asp:SqlDataSource>
    



    </div>

</asp:Content>

