<%@ Page Title="" Language="C#" MasterPageFile="~/xitong1.master" AutoEventWireup="true" CodeFile="houtaibookadd.aspx.cs" Inherits="sinf2008" Debug="true"  %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <%-- <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
    DataSourceID="SqlDataSource1">
        <Columns>
            <asp:BoundField DataField="Sno" HeaderText="Sno" SortExpression="Sno" />
            <asp:BoundField DataField="Sname" HeaderText="Sname" SortExpression="Sname" />
            <asp:BoundField DataField="Ssex" HeaderText="Ssex" SortExpression="Ssex" />
            <asp:BoundField DataField="Sage" HeaderText="Sage" SortExpression="Sage" />
            <asp:BoundField DataField="Sdept" HeaderText="Sdept" SortExpression="Sdept" />
            <asp:HyperLinkField DataNavigateUrlFields="Sno" 
                DataNavigateUrlFormatString="xuanke.aspx?xuehao={0}" 
                Text="查看成绩" />
        </Columns>
    </asp:GridView>--%>
   
<%--<asp:SqlDataSource ID="SqlDataSource1" runat="server" 
    ConnectionString="<%$ ConnectionStrings:libnewConnectionString2 %>" 
    SelectCommand="SELECT * FROM [s]"></asp:SqlDataSource>--%>
    <hr />
 
    <div id="charu" style="margin-top:35px;">
    <div class="form-row">
    <div class="col">
   请输入书籍号： <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control"></asp:TextBox>
   </div>
   <div class="col">
     请输入标题： <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control"></asp:TextBox>
     </div>
     <div class="col">
     请输入书籍图片： <asp:TextBox ID="TextBox6" runat="server" CssClass="form-control"></asp:TextBox>
     </div>
</div>
 <br/>
 <div class="form-row">
       <div class="col">请输入内容：  <asp:TextBox ID="TextBox3" runat="server" CssClass="form-control w-2"></asp:TextBox></div>
       <div class="col">请输入书籍类别：  <asp:TextBox ID="TextBox4" runat="server" CssClass="form-control"></asp:TextBox></div>
        <div class="col">请输入书籍ID： <asp:TextBox ID="TextBox5" runat="server" CssClass="form-control"></asp:TextBox></div>
        
        
        </div>
     <asp:FileUpload ID="FileUpload1" runat="server"  onchange="checksize(this)" />
        <asp:DropDownList ID="DropDownList1" runat="server" 
            DataSourceID="SqlDataSource2" DataTextField="classify" 
            DataValueField="classify" AppendDataBoundItems="True">
            <asp:ListItem Value="xuanze">--请选择--</asp:ListItem>
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:chubansheConnectionString %>" 
            SelectCommand="SELECT [classify] FROM [bookclassify]"></asp:SqlDataSource>
        <br/>
     <br/>
       
        <asp:Button ID="Button1" runat="server" Text="确定" onclick="Button1_Click" CssClass="btn btn-secondary"/>
        <asp:GridView ID="GridView2" runat="server" OnPageIndexChanging="GridView2_PageIndexChanging"
            OnRowDataBound="GridView2_RowDataBound" CssClass="table table-striped">
        </asp:GridView>
    </div>
</asp:Content>

