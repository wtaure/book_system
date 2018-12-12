<%@ Page Title="" Language="C#" MasterPageFile="~/mu.master" AutoEventWireup="true"
    CodeFile="login.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <style type="text/css">
        #denglu
        {
            width: 400px;
            margin: 0 auto;
            margin-top: 300px;
        }
        
       
       
    </style>
    <div id="denglu">
        <div>
           


             <div>
        <div class="card border-primary mb-3 m-auto" style="max-width: 20rem;">
            <div class="card-header text-center">xx出版社</div>
            <div class="card-body text-primary">
                <h5 class="card-title">普通用户登录</h5>
                <div class="input-group mb-2 mr-sm-2 mb-sm-0">
                    <div class="input-group-addon"><i class="fa fa-user fa-2x text-secondary" aria-hidden="true"></i></div> &nbsp
                    
 <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <p  id="errorbox1" class="m-0 p-0 text-danger"> &nbsp</p>
                <div class="input-group mb-2 mr-sm-2 mb-sm-0">
                    <div class="input-group-addon"><i class="fa fa-lock fa-2x text-secondary"></i></div> &nbsp
                    <asp:TextBox ID="TextBox2" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>
                </div>
                <p id="errorbox2" class="m-0 p-0 text-danger"> &nbsp</p>
                <div class="row">
                    <div class="col-3">
                        <asp:Button ID="Button2" runat="server" Text="登陆" OnClick="Button2_Click" 
                           CssClass="btn btn-primary" style="position: absolute;left: 42px;top: -5px;"/>

                    </div>

                    <div class="col-9 text-sm-right">
                       <asp:Button ID="Button3" runat="server"  Text="注   册" OnClick="Button3_Click" style="background:transparent;border:0px; color:#007bff;"/>|<a href="#" class="text-sm-right"> 忘记密码？</a>
                    </div>
                </div>

            </div>
        </div>
    </div>
        </div>
    </div>
</asp:Content>
