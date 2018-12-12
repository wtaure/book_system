using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
public partial class mu : System.Web.UI.MasterPage
{
    SqlConnection sqlconn = new SqlConnection("server=AIR;uid=wtaure;pwd=123456;database=wgd");
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        string s_url;
        s_url = "bookcenter.aspx?search_rule=" + DropDownList1.SelectedItem.Text + "&textbox=" + TextBox1.Text;
        Response.Redirect(s_url);
    }
    protected void zhuxiao_Click(object sender, EventArgs e)
    {
        Session.Remove("user");//清除session

        //跳转到本身看看
        Server.Transfer("index.aspx");

    }


}
