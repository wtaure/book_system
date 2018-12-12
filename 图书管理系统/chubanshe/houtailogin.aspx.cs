using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Web.Security;
using System.Security.Cryptography;

public partial class _Default : System.Web.UI.Page
{
    
    SqlConnection sqlconn = new SqlConnection("server=AIR;uid=wtaure;pwd=123456;database=wgd");
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button2_Click(object sender, EventArgs e)
    {


        string username = TextBox1.Text;
        string psd = TextBox2.Text;
        string name = "";
        string mima = "";

        string sql = "select * from rule_user where username='" + username + "' and   psd='" + psd + "'";




        sqlconn.Open();
        SqlCommand cmd = new SqlCommand(sql, sqlconn);
        SqlDataReader datar = cmd.ExecuteReader();
        //if (datar.HasRows)
        //{
        //    Server.Transfer("shangpinggridview.aspx");
        //}

        while (datar.Read())
        {
            name = datar["username"].ToString();
            mima = datar["psd"].ToString();
        }

        sqlconn.Close();




        if (name != "" && mima != "")
        {
            Session["user"] = name;
            Session["password"] = mima;
            Server.Transfer("houtai.aspx");




        }

        else
        {

            Response.Write("<script>alert('用户名或者密码错误')</script>");


        }



//        string strRedirect=Resquest["ReturnUrl"];//用于获取用户请求的页面。
//FormsAuthentication.SetAuthCookie(user.Name,true);//给用户发凭证。
//if(strRedirect==null)
//{
//    Response.Redirect("");//跳首页
//}
//else
//{
//   Response.Redirect(strRedirect);//未登录前想要进入的页面
//}




    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        Response.Redirect("houtaizhuce.aspx");
    }

}