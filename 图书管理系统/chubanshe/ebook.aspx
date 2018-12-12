<%@ Page Title="" Language="C#" MasterPageFile="~/mu.master" AutoEventWireup="true"
    CodeFile="ebook.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    
         <div style="
    position: relative;
    top: 100px;
">
     <div id="box">
    <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1" 
        ItemPlaceholderID="itemhorder" 
       >
     <LayoutTemplate>
                                            <div id="itemhorder" runat="server" >
                                            </div>
                                        </LayoutTemplate>
                                        
                                        <ItemTemplate>
                                       
                                            <li>
                                               <div style="width:100%; border-bottom:1px solid;"><a href="renwen.aspx?id=<%#Eval("id")%>">
                                               <div class="bookimg" style="float: left; margin:5px 50px 0 10px"> <img alt="" src='<%#Eval("img","img/{0}") %>' /></div>
                                                    <p>
                                                        <%#Eval("title")%>&nbsp;</p>
                                                         <p>(<%#Eval("author")+")" %></p>
                                                        <p>
                                                           <%#Eval("time") %></p></a>
                                                           <%--<%#Eval("download") %>--%>

                                                           <a href="ebookindex.aspx?id=<%#Eval("id")%>">
                                                           <%#Eval("text") %>
                                                           
                                                           </a>
                                                          <%--<asp:Button ID="Button1" runat="server" Text="Button" /> --%>
                                                           
                                                    </div>
                                                
                                            </li>
                                        </ItemTemplate>


    </asp:ListView>
    

     <div style=" clear:both;"></div>

                           <div style="margin: 0px 30% 0px 35%;width: 800px;">
                            <asp:DataPager ID="DataPager1" runat="server" PagedControlID="ListView1"   
            PageSize="5" QueryStringField="pageid">  
            <Fields>  
                <asp:NextPreviousPagerField ButtonType="Button"   
                ShowFirstPageButton="True"   
                    ShowNextPageButton="false"  /><%--ButtonType按钮属性--%>  
                    <asp:NumericPagerField  ButtonCount="3" ButtonType="Button" NextPageText=">>"  
                     PreviousPageText="<<"/>  
                     <asp:NextPreviousPagerField ButtonType="Button"   
                ShowPreviousPageButton="false"   
                    ShowLastPageButton="true"  /><%--ButtonType按钮属性--%>  
            </Fields>  
        </asp:DataPager> </div> 
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:chubansheConnectionString %>" 
        SelectCommand="SELECT * FROM [book_messages]"></asp:SqlDataSource>

        </div>
</asp:Content>
