using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class gridviewdel : System.Web.UI.Page
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
    public SqlConnection GetCon()
    {
        //实例化SqlConnection对象
        SqlConnection sqlCon = new SqlConnection();
        //实例化SqlConnection对象连接数据库的字符串
        sqlCon.ConnectionString = "server=AIR;uid=wtaure;pwd=123456;database=chubanshe";
        return sqlCon;
    }
    public void GridViewBind()
    {
        SqlConnection myConn = GetCon();
        //定义SQL语句
        string SqlStr = "select * from book_messages";
        //实例化SqlDataAdapter对象
        SqlDataAdapter da = new SqlDataAdapter(SqlStr, myConn);
        //实例化数据集DataSet
        DataSet ds = new DataSet();
        da.Fill(ds, "book_messages");
        //绑定DataList控件
        GridView1.DataSource = ds;//设置数据源，用于填充控件中的项的值列表
        GridView1.DataKeyNames = new string[] { "bookid" };
        GridView1.DataBind();//将控件及其所有子控件绑定到指定的数据源
    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
         //获取被删除行的键值
       string cname=(GridView1.DataKeys[e.RowIndex].Value).ToString();
        //定义SQL语句
       string SqlStr = " delete from book_messages where bookid='" + cname+ "'"; 
        SqlConnection myConn = GetCon();
       
        SqlCommand sqlcom = new SqlCommand(SqlStr, myConn);
        myConn.Open();
        sqlcom.ExecuteNonQuery();
        ClientScript.RegisterClientScriptBlock(this.GetType(), "info", "alert('记录已删除');", true);
        //重新绑定数据
        myConn.Close();
        GridViewBind();

        }
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        for (int i = 0; i < GridView1.Rows.Count; i++)
        {
            for (int j = 0; j < GridView1.Rows[i].Cells.Count; j++)
            {
                GridView1.Rows[i].Cells[j].ToolTip = GridView1.Rows[i].Cells[j].Text;
                if (GridView1.Rows[i].Cells[j].Text.Length > 15)
                {
                    GridView1.Rows[i].Cells[j].Text = GridView1.Rows[i].Cells[j].Text.Substring(0, 15) + "...";
                }
            }
        }
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            ((LinkButton)(e.Row.Cells[0].Controls[0])).Attributes.Add("onclick", "return confirm('确定要删除此记录吗？')");

        }
       
    }


}