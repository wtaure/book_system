<%@ Page Title="" Language="C#" MasterPageFile="~/mu.master" AutoEventWireup="true" CodeFile="bookcenter.aspx.cs" Inherits="_Default"  Debug="true" MaintainScrollPositionOnPostback="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   
    
   <asp:ListView ID="ListView3" runat="server" ItemPlaceholderID="itemhorder" 
                                 DataKeyNames="bookid">
             <LayoutTemplate>
                            <div id="itemhorder" runat="server"></div>
                            </LayoutTemplate>

                            <ItemTemplate>
                            <li class="left">
                                <a href="renwen.aspx?id=<%#Eval("id")%>">
                                <div class="book_size left">
                                
                               <div class="bookimg"> <img alt="" src='<%#Eval("img","img/{0}") %>' /></div>
                                <div class="left">
                                   <p><%#Eval("title") %></p>
                                </div>
                                
                                </div>
                                </a>
                            </li>
                            
                            </ItemTemplate>
                  

               


           </asp:ListView>

    <div class="bookbox">
    
    <%# Request.QueryString["textbox"]%>
    <!--搜索-->
        
       <div style=" border:0px solid #ccc; color:#333; font-size:14px; margin-top:90px;    margin-left: 20px;">
        <br />
    <span class="alert alert-success">请选择查询条件</span>
        <div style="width:200px;position:relative;top:15px;">
           <asp:DropDownList ID="DropDownList1" runat="server" CssClass="DropDownList">
            <asp:ListItem Value="first"> bookid</asp:ListItem>
            <asp:ListItem Value="second">author</asp:ListItem>
            <asp:ListItem Value="third">title</asp:ListItem>
        </asp:DropDownList>
        <br />

        <asp:TextBox ID="TextBox1" runat="server" class="form-control mr-sm-2" ></asp:TextBox>
        
         </div>
           <asp:SqlDataSource ID="search_rule" runat="server" 
               ConnectionString="<%$ ConnectionStrings:chubansheConnectionString %>" 
               SelectCommand="SELECT [search_rule] FROM [search_rule]"></asp:SqlDataSource>
        <br />
        <br/>
    <div style="position: relative;" >
    <asp:Button ID="Button1" runat="server" Text="搜索"  class="btn btn-outline-success my-2 my-sm-0" style="text-align:center;"  />&nbsp;
   </div>
    <asp:ListView ID="ListView1" runat="server" ItemPlaceholderID="itemhorder" 
                                 DataKeyNames="bookid"  >
                            <LayoutTemplate>
                            <div id="itemhorder" runat="server"></div>
                            </LayoutTemplate>

                            <ItemTemplate>
                            <li class="left">
                                <a href="renwen.aspx?id=<%#Eval("id")%>">
                                <div class="book_size left">
                                
                               <div class="bookimg"> <img alt="" src='<%#Eval("img","img/{0}") %>' /></div>
                                <div class="left">
                                   <p><%#Eval("title") %></p>
                                </div>
                                
                                </div>
                                </a>
                            </li>
                            
                            </ItemTemplate>

                            </asp:ListView>
                            <div style=" clear:both;"></div>

                           <div style="margin: 0px 30% 0px 35%;width: 800px;">
                            <asp:DataPager ID="DataPager1" runat="server" PagedControlID="ListView1"   
            PageSize="6" QueryStringField="pageid">  
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
        </asp:DataPager>  
  </div>
                        
                        
                            
       
   
           
</div>  
<div style="width:1000px; margin:0px auto;">
   <hr />
</div>
     <!-- 分类查询-->

      <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:chubansheConnectionString %>" 
                                
                                
                                SelectCommand="SELECT * FROM [search_rule]">
                            </asp:SqlDataSource>
            <div class="tab-pane fade show active" id="profile1" role="tabpanel" aria-labelledby="profile-tab1">

   

                <div class="classifylist">
    <asp:BulletedList ID="BulletedList1" runat="server" 
        DataSourceID="SqlDataSource1" DataTextField="classify" 
        DataValueField="classify" onclick="BulletedList1_Click" DisplayMode="LinkButton"  >
    </asp:BulletedList>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:chubansheConnectionString %>" 
        SelectCommand="SELECT [classify] FROM [bookclassify]"></asp:SqlDataSource>
   
 </div>
                    <div class="book" style="clear: both;">
     <div class="classifylist">
                     <ul>
                            <asp:ListView ID="ListView2" runat="server" ItemPlaceholderID="itemhorder" 
                                 DataKeyNames="bookid" DataSourceID="SqlDataSource2"  >
                            <LayoutTemplate>
                            <div id="itemhorder" runat="server"></div>
                            </LayoutTemplate>

                            <ItemTemplate>
                            <li class="left">
                                <a href="renwen.aspx?id=<%#Eval("id")%>">
                                <div class="book_size left">
                                
                               <div class="bookimg"> <img alt="" src='<%#Eval("img","img/{0}") %>' /></div>
                                <div class="left">
                                   <p><%#Eval("title") %></p>
                                </div>
                                
                                </div>
                                </a>
                            </li>
                            
                            </ItemTemplate>


                            </asp:ListView>
                        
                        
                            <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:chubansheConnectionString %>" 
                                
                                
                                SelectCommand="SELECT * FROM [book_messages] WHERE ([classify] = @classify)">
                                <SelectParameters>
                                    <asp:SessionParameter Name="classify" SessionField="classify" Type="String" 
                                        DefaultValue="信息技术类" />
                                </SelectParameters>
                            </asp:SqlDataSource>
       
       </ul>
       </div>
        </div>
         </div>
         
    

   <div>
</div>
   
   </div>


    	
  
</asp:Content>

