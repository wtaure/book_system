using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void BulletedList1_Click(object sender, BulletedListEventArgs e)
    {
        Session["classify"] = BulletedList1.Items[e.Index].Value;
       
    }

    //public void ListViewBind()
    //{
    //    //实例化SqlConnection对象
    //    SqlConnection sqlCon = new SqlConnection();
    //    //实例化SqlConnection对象连接数据库的字符串
    //    sqlCon.ConnectionString = "server=AIR;uid=wtaure;pwd=123456;database=chubanshe";
    //    //定义SQL语句
    //    string SqlStr = "select * from book_messages";
    //    //实例化SqlDataAdapter对象
    //    SqlDataAdapter da = new SqlDataAdapter(SqlStr, sqlCon);
    //    //实例化数据集DataSet
    //    DataSet ds = new DataSet();
    //    da.Fill(ds, "book_messages");
    //    //绑定GridView控件
    //    ListView1.DataSource = ds;//设置数据源，用于填充控件中的项的值列表
    //    ListView1.DataBind();//将控件及其所有子控件绑定到指定的数据源
    //}

   

    //查询
    //protected void Button1_Click(object sender, EventArgs e)
    //{
    //    string s_url;
    //    s_url = "bookcenter.aspx?search_rule=" + DropDownList1.SelectedItem.Text + "&textbox=" + TextBox1.Text;
    //    Response.Redirect(s_url);
    //}


   

    //protected void Button2_Click(object sender, EventArgs e)
    //{
    //    ListViewBind();
    //}
    
}