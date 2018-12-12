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
    //显示所有
    public void ListViewBind()
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
        ListView1.DataSource = ds;//设置数据源，用于填充控件中的项的值列表
        ListView1.DataBind();//将控件及其所有子控件绑定到指定的数据源
    }

    protected void BulletedList1_Click(object sender, BulletedListEventArgs e)
    {
        Session["classify"] = BulletedList1.Items[e.Index].Value;
    }

    protected override void OnPreRender(EventArgs e)
    {
        base.OnPreRender(e);

        //加载数据
        bind();
    }

    //查询
    protected void bind()
    {
        Boolean flag = false;
        if (!string.IsNullOrEmpty(TextBox1.Text.Trim()))
        {
            if (DropDownList1.SelectedValue == "first")
            {
                flag = true;
                //实例化SqlConnection对象
                SqlConnection sqlCon = new SqlConnection();
                //实例化SqlConnection对象连接数据库的字符串
                sqlCon.ConnectionString = "server=AIR;uid=wtaure;pwd=123456;database=chubanshe";
                //定义SQL语句
                string SqlStr = "select * from book_messages where bookid='" + TextBox1.Text + "'";

                //实例化SqlDataAdapter对象
                SqlDataAdapter da = new SqlDataAdapter(SqlStr, sqlCon);
                //实例化数据集DataSet
                DataSet ds = new DataSet();
                da.Fill(ds, "book_messages");
                //绑定GridView控件

            
                int i = ds.Tables[0].Rows.Count;
        
                ListView1.DataSource = ds;
                ListView1.DataBind();


                //if (i == 0) { ClientScript.RegisterStartupScript(typeof(string), "print", "<script>alert('没有满足条件的记录，请确定学号是否正确！')</script>"); }
                ////Response.Write(i.ToString());
                //TextBox1.Text = "";
                //TextBox1.Focus();
            }
            else if (DropDownList1.SelectedValue == "second")
            {

                flag = true;
                //实例化SqlConnection对象
                SqlConnection sqlCon = new SqlConnection();
                //实例化SqlConnection对象连接数据库的字符串
                sqlCon.ConnectionString = "server=AIR;uid=wtaure;pwd=123456;database=chubanshe";
                //定义SQL语句
                string SqlStr = "select * from book_messages where author like @Name";

                //实例化SqlDataAdapter对象

                SqlCommand comm = new SqlCommand(SqlStr, sqlCon);
                comm.Parameters.Add("@Name", SqlDbType.VarChar, 20).Value = "%" + this.TextBox1.Text.Trim() + "%";//把文本框里的值赋给@Name 用到了模糊查询
                SqlDataAdapter da = new SqlDataAdapter(comm);
                //实例化数据集DataSet
                DataSet ds = new DataSet();
                da.Fill(ds, "book_messages");
                //绑定GridView控件


         
                int i = ds.Tables[0].Rows.Count;
                ListView1.DataSource = ds;
                ListView1.EditIndex = 0;

                ListView1.DataKeyNames = new string[] { "bookid" };
                ListView1.DataBind();
                if (ds.Tables[0].Rows.Count > 0)
                {

                    ListView1.DataSource = ds;//如果有就显示出来
                    ListView1.DataBind();

                }
                else
                {
                    Response.Write("<script>alert('没有相关记录')</script>");
                }
                //释放资源 关闭连接
                da.Dispose();
                ds.Dispose();
                sqlCon.Close();


            }
            else if (DropDownList1.SelectedValue == "third")
            {
                flag = true;
                //实例化SqlConnection对象
                SqlConnection sqlCon = new SqlConnection();
                //实例化SqlConnection对象连接数据库的字符串
                sqlCon.ConnectionString = "server=AIR;uid=wtaure;pwd=123456;database=chubanshe";
                //定义SQL语句
                string SqlStr = "select * from book_messages ";

                if (!string.IsNullOrEmpty(TextBox1.Text.Trim()))
                {
                    SqlStr += "where title like @Name";


                }
                //实例化SqlDataAdapter对象

                SqlCommand comm = new SqlCommand(SqlStr, sqlCon);

                comm.Parameters.Add("@Name", SqlDbType.VarChar, 20).Value = "%" + this.TextBox1.Text.Trim() + "%";//把文本框里的值赋给@Name 用到了模糊查询

                SqlDataAdapter da = new SqlDataAdapter(comm);
                //实例化数据集DataSet
                DataSet ds = new DataSet();
                da.Fill(ds, "book_messages");
                //绑定GridView控件


                // GridView1.DataSource = ds;//设置数据源，用于填充控件中的项的值列表
                //GridView1.DataBind();//将控件及其所有子控件绑定到指定的数据源

                ListView1.DataSource = ds;


                ListView1.DataKeyNames = new string[] { "bookid" };
                ListView1.DataBind();
                if (ds.Tables[0].Rows.Count > 0)
                {

                    ListView1.DataSource = ds;//如果有就显示出来
                    ListView1.DataBind();

                }
                else
                {
                    Response.Write("<script>alert('没有相关记录')</script>");
                }
                //释放资源 关闭连接
                da.Dispose();
                ds.Dispose();
                sqlCon.Close();

                //if (i == 0) { ClientScript.RegisterStartupScript(typeof(string), "print", "<script>alert('没有满足条件的记录，请确定学号是否正确！')</script>"); }
                ////Response.Write(i.ToString());
                //TextBox1.Text = "";
                //TextBox1.Focus();

            }
        }
        else if (!string.IsNullOrEmpty(Request.QueryString["search_rule"]))
        {
            //实例化SqlConnection对象
            SqlConnection sqlCon = new SqlConnection();
            //实例化SqlConnection对象连接数据库的字符串
            sqlCon.ConnectionString = "server=AIR;uid=wtaure;pwd=123456;database=chubanshe";
            //定义SQL语句
            string SqlStr;

            switch (Request.QueryString["search_rule"])
            {
                case "bookid":
                    SqlStr = "select * from book_messages where bookid = '" + Request.QueryString["textbox"] + "'";
                    break;
                case "title":
                    SqlStr = "select * from book_messages where title like '%" + Request.QueryString["textbox"] + "%'";
                    break;
                case "author":
                    SqlStr = "select * from book_messages where author like '%" + Request.QueryString["textbox"] + "%'";
                    break;
                default:
                    SqlStr = "select * from book_messages ";
                    break;
            }
           

            //实例化SqlDataAdapter对象
            SqlDataAdapter da = new SqlDataAdapter(SqlStr, sqlCon);
            //实例化数据集DataSet
            DataSet ds = new DataSet();
            da.Fill(ds, "book_messages");
            //绑定GridView控件

            // GridView1.DataSource = ds;//设置数据源，用于填充控件中的项的值列表
            //GridView1.DataBind();//将控件及其所有子控件绑定到指定的数据源
            int i = ds.Tables[0].Rows.Count;
            ListView1.DataSourceID = null;
            ListView1.DataSource = ds;
            ListView1.DataBind();

        }
        else
        {
            ListViewBind();
        }

        

        
        
    }






}