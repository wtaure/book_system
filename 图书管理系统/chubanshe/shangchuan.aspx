<%@ Page Title="" Language="C#" MasterPageFile="~/xitong1.master" AutoEventWireup="true" CodeFile="shangchuan.aspx.cs" Inherits="_Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<head>
<script src="jquery-1.8.3.js" type="text/javascript"></script>
  
    <script type="text/javascript">
        $(document).ready(function () {
            $("#FileUpLoad1").val("");
        });
        function checksize(obj_file) {
            var filesize = obj_file.files[0].size;
            if (filesize > 12000000) {
                alert(filesize);
                $(obj_file).focus();
            }
        }
    </script>
</head>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


    
    <div>
        <asp:FileUpload ID="FileUpload1" runat="server"   onchange=checksize(this)/>&nbsp
        <asp:Button ID="Button1" runat="server"
            Text="上传" onclick="Button1_Click" style="height: 21px" />
    </div>
</asp:Content>

