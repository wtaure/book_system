<%@ Page Title="" Language="C#" MasterPageFile="~/mu.master" AutoEventWireup="true" CodeFile="yonghuzhuce.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<style type="text/css">
      body
     {  
      font-family:华文细黑;
         background-image:url(image/zhucee.jpg);
            background-attachment: fixed;
    background-repeat: no-repeat;
    background-position: center center;
   background-size: 85%;
  
        }
     #zhuce
     {
         width:422px;
         position:relative;
         left:576px;
         top:37px;
            height: 320px;
             background-color:#fffffff;
        }
    .biaoti
    {
        border-top-right-radius:6px;
        border-top-left-radius:6px;
        
        height:37px;
            width: 428px;
        }
   
    .biaodan
    {
        width:426px;
        height:305px;
        background-color:;
        border-bottom-right-radius:6px;
        border-bottom-left-radius:6px;        
        }
    .inputtext
     {
         Width:240px; 
         Height:26px;
         border-radius:6px;
         border:1px solid #D3D3D3;
             
        
            
        }      
        .inputtext1
        {  
     .divcss{color:#Ffffff}
            } 
    .style1
    {
            height: 15px;
            font-family: 宋体;
            padding: 0px 10px 5px 20px;
            width: 127px;
        }
    .style2
    {
        padding:5px;
            height: 15px;
        }
    .style2 a
    {
        text-decoration:none;
        font-size:14px;
        color:#4276AF;
        }
   .style2 a:hover
    {
        text-decoration:underline;
        }                   
    .rfv
    {
        color:Red;  
        font-size:12px; 
        }
    .button
    {
        height:30px;
        width:80px;
        background-color:#B0C4DE;
        border:none;
        font-size:18px;
        border-color:#CBDDEF;
        border-radius:4px;
        background: rgba(0,0,0,0.01);
        cursor: pointer; 
        } 
        
    
    
        #form1
        {
            height: 477px;
        }
    
        .style3
        {
            height: 15px;
        }
    
    </style> 
 <div >
        <div id="zhuce">
   <div class="table">

			<div class="table-head-group">
				<ul class="table-row">
					<li class="table-cell">请您注册</li>
					<li class="table-cell"> </li>

				</ul>
			</div>
			<div class="table-row-group" style=" position: relative;
    margin: 25%;
    left: 150px;">

				<ul class="table-row">
					<li class="table-cell">用&nbsp;户&nbsp;名：</li>
					<li class="table-cell">
						<asp:TextBox ID="txtusername" runat="server" CssClass="inputtext"></asp:TextBox>
					</li>
				</ul>

				<ul class="table-row">
					<li class="table-cell"></li>
					<li class="table-cell">
						</asp:TextBox>
						<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="RequiredFieldValidator" CssClass="rfv" ControlToValidate="txtusername">*用户名不能为空！</asp:RequiredFieldValidator>
					</li>

				</ul>
				<ul class="table-row">
					<li class="table-cell">&nbsp;&nbsp; 性&nbsp;别：</li>
					<li class="table-cell">
						<asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal" Width="180px">
							<asp:ListItem Selected="True">男</asp:ListItem>
							<asp:ListItem>女</asp:ListItem>
                            </asp:RadioButtonList>

					</li>

				</ul>

				<ul class="table-row">
					<li class="table-cell">联系方式：</li>
					<li class="table-cell">
						<asp:TextBox ID="txtdianhua" runat="server" CssClass="inputtext"></asp:TextBox>
					</li>

				</ul>

                	<ul class="table-row">
					<li class="table-cell"></li>
					<li class="table-cell"></li>
		
				</ul>



				<ul class="table-row">
					<li class="table-cell">&nbsp;&nbsp; 地&nbsp;址：</li>
					<li class="table-cell">
						<asp:TextBox ID="txtdizhi" runat="server" CssClass="inputtext"></asp:TextBox>
					</li>

				</ul>

				<ul class="table-row">
					<li class="table-cell"></li>
					<li class="table-cell">
						<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="RequiredFieldValidator" CssClass="rfv" ControlToValidate="txtdizhi">*地址不能为空！</asp:RequiredFieldValidator>
					</li>
				</ul>

				<ul class="table-row">
					<li class="table-cell">&nbsp;&nbsp; 密&nbsp;码：</li>
					<li class="table-cell">
						<asp:TextBox ID="txtpassword" runat="server" TextMode="Password" CssClass="inputtext"></asp:TextBox>
					</li>
				</ul>

				<ul class="table-row">
					<li class="table-cell"></li>
					<li class="table-cell">
						<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" CssClass="rfv" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtpassword">密码不能为空!</asp:RequiredFieldValidator>

					</li>
				</ul>

				<ul class="table-row">
					<li class="table-cell">确认密码：</li>
					<li class="table-cell">
						<asp:TextBox ID="txtrepassword" runat="server" TextMode="Password" CssClass="inputtext"></asp:TextBox>
					</li>
                   

				</ul>

				<ul class="table-row">
					<li class="table-cell"></li>
					<li class="table-cell">
					
                         <asp:CompareValidator ID="CompareValidator2" runat="server" CssClass="rfv"
                        ErrorMessage="CompareValidator" ControlToCompare="txtpassword" 
                        ControlToValidate="txtrepassword" >两次输入密码的密码不同！
                        
                        
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                         ErrorMessage="RequiredFieldValidator" ControlToValidate="txtrepassword" >密码不能为空!</asp:RequiredFieldValidator>
                   
                        
                        </asp:CompareValidator> 
                    
                    
                    </li>
				</ul>

				

				<ul class="table-row">
					<li class="table-cell"></li>
					<li class="table-cell">
						<asp:Button ID="Button1" runat="server" Text="注册" CssClass="button" onclick="Button1_Click" />
						<a href="denglu.aspx"> 返回登录页面</a>
					</li>
				</ul>

			</div>
		</div>
   </div>

</asp:Content>

