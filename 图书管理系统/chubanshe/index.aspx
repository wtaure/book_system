<%@ Page Title="" Language="C#" MasterPageFile="~/mu.master" AutoEventWireup="true"
    CodeFile="index.aspx.cs" Inherits="_Default" Debug="true" MaintainScrollPositionOnPostback="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
<script type="text/javascript">

<script src="js/jquery-1.4.1.js" type="text/javascript"></script>
    <script src="js/jquery-1.8.3.js" type="text/javascript"></script>
    <script src="js/index.js" type="text/javascript"></script>
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="box">
        <!--
            	作者：offline
            	时间：2018-06-13
            	描述：轮播图
           -->
        <div class="banner">
         	<div class="banner_wrap">
             <ul class="banner_img clear_fix">
                 <li class="ig"><img src="img/banner_01.jpg" alt=""></li>
                 <li class="ig"><img src="img/banner_02.jpg" alt=""></li>
                 <li class="ig"><img src="img/banner_03.jpg" alt=""></li>
                 <li class="ig"><img src="img/banner_05.jpg" alt=""></li>
             </ul>
             <div class="banner_left">
                 <img src="img/向左.png" alt="">
             </div >
             <div class="banner_right">
                 <img src="img/向右.png" alt="">
             </div>
         </div>
     </div>
        <div class="a">
            <hr />
            <div class="news_center">
                <!--
        	作者：offline
        	时间：2018-06-13
        	描述：新闻中心
        -->
                <div class="news">
                    <ul class="nav nav-tabs" id="myTab" role="tablist">
                        <li class="nav-item"><a class="nav-link" id="home-tab" href="newscenter.aspx">新闻中心</a>
                        </li>
                        <li class="nav-item"><a class="nav-link active" id="profile-tab" data-toggle="tab"
                            href="#profile" role="tab" aria-controls="profile" aria-selected="false">新书</a>
                        </li>
                        <li class="nav-item"><a class="nav-link" id="contact-tab" data-toggle="tab" href="#contact"
                            role="tab" aria-controls="contact" aria-selected="false">业内</a> </li>
                    </ul>
                    <!--
            	作者：offline
            	时间：2018-06-13
            	描述：新闻内容
            -->
                    <div style="margin: 10px;">
                        <div class="tab-content" id="myTabContent">
                            <div class="tab-pane fade show active" id="profile" role="tabpanel" aria-labelledby="profile-tab">
                                <ul>
                                    <asp:ListView ID="ListView1" runat="server" ItemPlaceholderID="itemhorder" DataSourceID="SqlDataSource5">
                                        <LayoutTemplate>
                                            <div id="itemhorder" runat="server">
                                            </div>
                                        </LayoutTemplate>
                                        <ItemTemplate>
                                            <li><a href="newsindex.aspx?id=<%#Eval("id")%>">
                                                <div class="bottom_right">
                                                    <p style="float: left; margin-left: 10px;">
                                                        <%#Eval("title")%>&nbsp;</p>
                                                    <div class="clear_fix">
                                                        <p style="position: relative; left: 30px;">
                                                            <%#Eval("time") %></p>
                                                    </div>
                                                </div></li>
                                            </a>
                                        </ItemTemplate>
                                    </asp:ListView>
                                    <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:chubansheConnectionString %>"
                                        SelectCommand="SELECT title, editors, neirong, img, time, classify, id FROM news_messages WHERE (classify = '新书') ORDER BY time DESC">
                                    </asp:SqlDataSource>
                                </ul>
                            </div>
                            <div class="tab-pane fade" id="contact" role="tabpanel" aria-labelledby="contact-tab">
                                <asp:ListView ID="ListView3" runat="server" ItemPlaceholderID="itemhorder" DataSourceID="SqlDataSource4">
                                    <LayoutTemplate>
                                        <div id="itemhorder" runat="server">
                                        </div>
                                    </LayoutTemplate>
                                    <ItemTemplate>
                                        <li><a href="newsindex.aspx?id=<%#Eval("id")%>">
                                            <div class="bottom_right">
                                                <p style="float: left; margin-left: 10px;">
                                                    <%#Eval("title")%>&nbsp;</p>
                                                <div class="clear_fix">
                                                    <p style="position: relative; left: 30px;">
                                                        <%#Eval("time") %></p>
                                                </div>
                                            </div></li>
                                        </a>
                                    </ItemTemplate>
                                </asp:ListView>
                                <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:chubansheConnectionString %>"
                                    SelectCommand="SELECT title, editors, neirong, img, time, classify, id FROM news_messages WHERE (classify = '业内') ORDER BY time DESC">
                                </asp:SqlDataSource>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="news">
                    <!--
                	作者：offline
                	时间：2018-06-13
                	描述：图书中心
                -->
                    <ul class="nav nav-tabs" id="Ul2" role="tablist">
                        <li class="nav-item"><a class="nav-link" id="home-tab" href="bookcenter.aspx">图书中心</a>
                        </li>
                        <div class="classifylist">
                            <asp:BulletedList ID="BulletedList1" runat="server" DataSourceID="SqlDataSource1"
                                DataTextField="classify" DataValueField="classify" OnClick="BulletedList1_Click"
                                DisplayMode="LinkButton">
                            </asp:BulletedList>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:chubansheConnectionString %>"
                                SelectCommand="SELECT [classify] FROM [bookclassify]"></asp:SqlDataSource>
                        </div>
                    </ul>
                    <!--
            	作者：offline
            	时间：2018-06-13
            	描述：图书内容
            -->
                    <div class="tab-pane fade show active" id="profile1" role="tabpanel" aria-labelledby="profile-tab1">
                    </div>
                    <div class="book" style="clear: both;">
                        <div class="classifylist">
                            <asp:ListView ID="ListView2" runat="server" ItemPlaceholderID="itemhorder" DataKeyNames="bookid"
                                DataSourceID="SqlDataSource3">
                                <LayoutTemplate>
                                    <div id="itemhorder" runat="server">
                                    </div>
                                </LayoutTemplate>
                                <ItemTemplate>
                                    <li class="left"><a href="renwen.aspx?id=<%#Eval("id")%>">
                                        <div class="book_size left">
                                            <div class="bookimg">
                                                <img alt="" src='<%#Eval("img","img/{0}") %>' /></div>
                                            <div class="left">
                                                <p>
                                                    <%#Eval("title") %></p>
                                            </div>
                                        </div>
                                    </a></li>
                                </ItemTemplate>
                            </asp:ListView>
                            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:chubansheConnectionString %>"
                                SelectCommand="SELECT * FROM [book_messages] WHERE ([classify] = @classify)">
                                <SelectParameters>
                                    <asp:SessionParameter Name="classify" SessionField="classify" Type="String" DefaultValue="信息技术类" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </div>
                    </div>
                </div>
                <div style="clear: both;">
                </div>
                <!-- 分页-->
                <!--  <div style="margin: 0px 30% 0px 35%; width: 800px;">
                    <asp:DataPager ID="DataPager1" runat="server" PagedControlID="ListView2" PageSize="5"
                        QueryStringField="pageid">
                        <Fields>
                            <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="false" />
                            <%--ButtonType按钮属性--%>
                            <asp:NumericPagerField ButtonCount="3" ButtonType="Button" NextPageText=">>" PreviousPageText="<<" />
                            <asp:NextPreviousPagerField ButtonType="Button" ShowPreviousPageButton="false" ShowLastPageButton="true" />
                            <%--ButtonType按钮属性--%>
                        </Fields>
                    </asp:DataPager>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:chubansheConnectionString %>"
                        SelectCommand="SELECT * FROM [book_messages] ORDER BY [time] DESC"></asp:SqlDataSource>
                </div>  -->
                <!--
            	作者：offline
            	时间：2018-06-13
            	描述：数字图书
            -->
                <div class="news">
                    <ul class="nav nav-tabs" id="Ul1" role="tablist">
                        <li class="nav-item"><a class="nav-link" id="home-tab" href="ebook.aspx">数字图书中心</a>
                        </li>
                        <li class="nav-item"><a class="nav-link active" id="A2" data-toggle="tab" href="#profile11"
                            role="tab" aria-controls="profile" aria-selected="false">信息技术类</a> </li>
                        <li class="nav-item"><a class="nav-link " id="A4" data-toggle="tab" href="#profile2"
                            role="tab" aria-controls="profile" aria-selected="false">艺术设计类</a> </li>
                        <li class="nav-item"><a class="nav-link " id="A5" data-toggle="tab" href="#profile3"
                            role="tab" aria-controls="profile" aria-selected="false">文学类</a> </li>
                        <li class="nav-item"><a class="nav-link " id="A6" data-toggle="tab" href="#profile4"
                            role="tab" aria-controls="profile" aria-selected="false">教育类</a> </li>
                        <li class="nav-item"><a class="nav-link" id="A3" data-toggle="tab" href="#profile5"
                            role="tab" aria-controls="contact" aria-selected="false">经济类</a> </li>
                    </ul>
                    <div style="margin: 20px 10px;">
                        <div class="tab-content" id="myTabContent" style="margin-top:10px;">
                            <div class="tab-pane fade show active" id="profile11" role="tabpanel" aria-labelledby="profile-tab" style="overflow: auto;">
                                <asp:ListView ID="ListView4" runat="server" ItemPlaceholderID="itemhorder" DataSourceID="SqlDataSource7">
                                    <LayoutTemplate>
                                        <div id="itemhorder" runat="server">
                                        </div>
                                    </LayoutTemplate>
                                    <ItemTemplate>
                                        <li><a href="ebookindex.aspx?id=<%#Eval("id")%>">
                                            <div class="book_size left">
                                                <div class="bookimg">
                                                    <img alt="" src='<%#Eval("img","img/{0}") %>' /></div>
                                                <div class="left">
                                                    <p>
                                                        <%#Eval("title") %></p>
                                                </div>
                                            </div></li>
                                        </a>
                                    </ItemTemplate>
                                </asp:ListView>
                                <asp:SqlDataSource ID="SqlDataSource7" runat="server" ConnectionString="<%$ ConnectionStrings:chubansheConnectionString %>"
                                    SelectCommand="select * from book_messages where classify='信息技术类'"></asp:SqlDataSource>
                            </div>
                            <div class="tab-pane fade" id="profile2" role="tabpanel" aria-labelledby="profile-tab" style="overflow: auto;">
                                <asp:ListView ID="ListView5" runat="server" ItemPlaceholderID="itemhorder" DataSourceID="SqlDataSource8">
                                    <LayoutTemplate>
                                        <div id="itemhorder" runat="server">
                                        </div>
                                    </LayoutTemplate>
                                    <ItemTemplate>
                                        <li><a href="ebookindex.aspx?id=<%#Eval("id")%>">
                                            <div class="book_size left">
                                                <div class="bookimg">
                                                    <img alt="" src='<%#Eval("img","img/{0}") %>' /></div>
                                                <div class="left">
                                                    <p>
                                                        <%#Eval("title") %></p>
                                                </div>
                                            </div></li>
                                        </a>
                                        
                                    </ItemTemplate>
                                </asp:ListView>
                                <asp:SqlDataSource ID="SqlDataSource8" runat="server" ConnectionString="<%$ ConnectionStrings:chubansheConnectionString %>"
                                    SelectCommand="select * from book_messages where classify='艺术设计类'"></asp:SqlDataSource>
                            </div>
                            <div class="tab-pane fade" id="profile3" role="tabpanel" aria-labelledby="profile-tab" style="overflow: hidden;">
                                <asp:ListView ID="ListView6" runat="server" ItemPlaceholderID="itemhorder" DataSourceID="SqlDataSource9">
                                    <LayoutTemplate>
                                        <div id="itemhorder" runat="server" >
                                        </div>
                                    </LayoutTemplate>
                                    <ItemTemplate>
                                        <li ><a href="ebookindex.aspx?id=<%#Eval("id")%>">
                                            <div class="book_size left" >
                                                <div class="bookimg">
                                                    <img alt="" src='<%#Eval("img","img/{0}") %>' /></div>
                                                <div class="left">
                                                    <p>
                                                        <%#Eval("title") %></p>
                                                </div>
                                            </div></li>
                                        </a>
                                        
                                    </ItemTemplate>
                                </asp:ListView>
                                <asp:SqlDataSource ID="SqlDataSource9" runat="server" ConnectionString="<%$ ConnectionStrings:chubansheConnectionString %>"
                                    SelectCommand="select * from book_messages where classify='文学类'"></asp:SqlDataSource>
                            </div>
                            <div class="tab-pane fade" id="profile4" role="tabpanel" aria-labelledby="profile-tab" style="overflow: auto;">
                                <asp:ListView ID="ListView7" runat="server" ItemPlaceholderID="itemhorder" DataSourceID="SqlDataSource10">
                                    <LayoutTemplate>
                                        <div id="itemhorder" runat="server">
                                        </div>
                                    </LayoutTemplate>
                                    <ItemTemplate>
                                        <li><a href="ebookindex.aspx?id=<%#Eval("id")%>">
                                            <div class="book_size left">
                                                <div class="bookimg">
                                                    <img alt="" src='<%#Eval("img","img/{0}") %>' /></div>
                                                <div class="left">
                                                    <p>
                                                        <%#Eval("title") %></p>
                                                </div>
                                            </div></li>
                                        </a>
                                    </ItemTemplate>
                                </asp:ListView>
                                <asp:SqlDataSource ID="SqlDataSource10" runat="server" ConnectionString="<%$ ConnectionStrings:chubansheConnectionString %>"
                                    SelectCommand="select * from book_messages where classify='教育类'"></asp:SqlDataSource>
                            </div>
                            <div class="tab-pane fade" id="profile5" role="tabpanel" aria-labelledby="profile-tab" style="overflow: auto;">
                                <asp:ListView ID="ListView8" runat="server" ItemPlaceholderID="itemhorder" DataSourceID="SqlDataSource11">
                                    <LayoutTemplate>
                                        <div id="itemhorder" runat="server">
                                        </div>
                                    </LayoutTemplate>
                                    <ItemTemplate>
                                        <li><a href="ebookindex.aspx?id=<%#Eval("id")%>">
                                            <div class="book_size left">
                                                <div class="bookimg">
                                                    <img alt="" src='<%#Eval("img","img/{0}") %>' /></div>
                                                <div class="left">
                                                    <p>
                                                        <%#Eval("title") %></p>
                                                </div>
                                            </div></li>
                                        </a>
                                    </ItemTemplate>
                                </asp:ListView>
                                <asp:SqlDataSource ID="SqlDataSource11" runat="server" ConnectionString="<%$ ConnectionStrings:chubansheConnectionString %>"
                                    SelectCommand="select * from book_messages where classify='经济类'"></asp:SqlDataSource>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--搜索-->
        <%--  <div style="border: 0px solid #ccc; width: 700px; color: #333; font-size: 14px;">
        <%-- <span class="alert alert-success" >请输入学号进行查询：</span><br />
        <asp:TextBox ID="TextBox1" runat="server" class="form-control mr-sm-5" Style="float: left;
            width: 230px; margin-right: 0px !important; border-radius: 0.25rem 0 0 0.25rem;"></asp:TextBox>
        <div style="float: left;">
            <asp:DropDownList ID="DropDownList1" runat="server" Style="display: block; width: 100%;
                padding: 0.375rem 0.75rem; font-size: 1rem; line-height: 1.5; color: #495057;
                background-color: #fff; background-clip: padding-box; border-radius: 0 0.25rem  0.25rem 0;
                border: 1px solid black; <%--border-radius: 0.25rem; 
    transition: border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;">
                <asp:ListItem Value="first">bookid</asp:ListItem>
                <asp:ListItem Value="second">author</asp:ListItem>
                <asp:ListItem Value="third">title</asp:ListItem>
            </asp:DropDownList>
        </div>
        <asp:SqlDataSource ID="search_rule" runat="server" ConnectionString="<%$ ConnectionStrings:chubansheConnectionString %>"
            SelectCommand="SELECT [search_rule] FROM [search_rule]"></asp:SqlDataSource>
    </div>
    <br />
    <br />
    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="搜索" class="btn btn-outline-success my-2 my-sm-0"
        Style="text-align: center;" />&nbsp;--%>
</asp:Content>
