using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

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

        string sql = "select * from yonghu where username='" + username + "' and   psd='" + psd + "'";
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
            Server.Transfer("index.aspx");
        }

        else
        {

            Response.Write("<script>alert('用户名或者密码错误')</script>");


        }


    //          if (判断登录条件)

    //            ……

    //            FormsAuthentication.SetAuthCookie (凭据名称, 是否跨浏览器支持)

    //            if (string.IsNullOrEmpty(Request[“ReturnUrl”]))

    //            {

    //                        Response.Redirect (“默认页面”);

    //            }

    //Response.Redirect (Request[“ReturnUrl”]);





    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        Response.Redirect("yonghuzhuce.aspx");
    }
}