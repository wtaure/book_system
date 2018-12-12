using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class gridviewpaged : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (Session["user"] == null)
        {

            Response.Redirect("houtailogin.aspx");
        }
        if (!IsPostBack)
        {
            GridViewBind();
        }

    }
    public void GridViewBind()
    {
        //实例化SqlConnection对象
        SqlConnection sqlCon = new SqlConnection();
        //实例化SqlConnection对象连接数据库的字符串
        sqlCon.ConnectionString = "server=AIR;uid=wtaure;pwd=123456;database=chubanshe";
        //定义SQL语句
        string SqlStr = "select * from book_messages";
        //实例化SqlDataAdapter对象
        SqlDataAdapter da = new SqlDataAdapter(SqlStr, sqlCon);
        //实例化数据集DataSet
        DataSet ds = new DataSet();
        da.Fill(ds, "book_messages");
        //绑定GridView控件
        GridView1.DataSource = ds;//设置数据源，用于填充控件中的项的值列表
        GridView1.DataBind();//将控件及其所有子控件绑定到指定的数据源
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView theGrid = sender as GridView;
        int newPageIndex = 0;
        if (e.NewPageIndex == -3)
        {
            //点击了Go按钮
            TextBox txtNewPageIndex = null;

            //GridView较DataGrid提供了更多的API，获取分页块可以使用BottomPagerRow 或者TopPagerRow，当然还增加了HeaderRow和FooterRow
            GridViewRow pagerRow = theGrid.BottomPagerRow;

            if (pagerRow != null)
            {
                //得到text控件
                txtNewPageIndex = pagerRow.FindControl("txtNewPageIndex") as TextBox;
            }
            if (txtNewPageIndex != null)
            {
                  
                newPageIndex = int.Parse(txtNewPageIndex.Text) - 1;
            }
        }
        else
        {
            //点击了其他的按钮
            newPageIndex = e.NewPageIndex; 
        }
        //防止新索引溢出
        newPageIndex = newPageIndex < 0 ? 0 : newPageIndex;
        newPageIndex = newPageIndex >= theGrid.PageCount ? theGrid.PageCount - 1 : newPageIndex;

        //得到新的值
        theGrid.PageIndex = newPageIndex;

        //重新绑定
     
        GridViewBind();
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
         //实例化SqlConnection对象
        SqlConnection sqlCon = new SqlConnection();
        //实例化SqlConnection对象连接数据库的字符串
        sqlCon.ConnectionString = "server=AIR;uid=wtaure;pwd=123456;database=chubanshe";
        //定义SQL语句
        string SqlStr = "select * from book_messages where bookid like '%"+TextBox1.Text+"%'";
        //实例化SqlDataAdapter对象
        SqlDataAdapter da = new SqlDataAdapter(SqlStr, sqlCon);
        //实例化数据集DataSet
        DataSet ds = new DataSet();
        da.Fill(ds, "book_messages");
        //绑定GridView控件
        
        GridView1.DataSource = ds;//设置数据源，用于填充控件中的项的值列表
        GridView1.DataBind();//将控件及其所有子控件绑定到指定的数据源
       int i= GridView1.Rows.Count;
       if (i == 0) { ClientScript.RegisterStartupScript(typeof(string), "print", "<script>alert('没有满足条件的记录，请确定书籍号是否正确！')</script>"); }
      // Response.Write(i.ToString ());
        TextBox1.Text = "";
        TextBox1.Focus();
    }


    protected void Button2_Click(object sender, EventArgs e)
    {
        GridViewBind();
    }
}