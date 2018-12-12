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
    SqlConnection sqlconn = new SqlConnection("server=AIR;uid=wtaure;pwd=123456;database=chubanshe");
  
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["user"] == null)
        {

            Response.Redirect("houtailogin.aspx");
        }

        if (!IsPostBack)
        {
            GridViewDataBind();
            //  Response.Write("jjkjklj");
        }
       
    }

    protected void Button1_Click(object sender, EventArgs e)
    {

        string shujihao = TextBox1.Text;
        string biaoti = TextBox2.Text;
        string neirong = TextBox3.Text;
        //int nianling = Convert.ToInt16(TextBox3.Text);
        string author = TextBox4.Text;
        string classify = DropDownList1.Text;
        string id = TextBox5.Text;
        DateTime d = DateTime.Now;
        string img = TextBox6.Text;
        
        string sqltext = "insert into news_messages(newsid,title,neirong,classify,id,editors,time,img) values ('" + shujihao + "','" + biaoti + "','" + neirong + "','" + classify + "','" + id + "','" + author + "','" + d + "','" + img + "')";

        
        SqlCommand cmd = new SqlCommand(sqltext, sqlconn);
        sqlconn.Open();


        int countrecord = cmd.ExecuteNonQuery();

        string sqltext2 = "select * from news_messages";
        SqlCommand cmd2 = new SqlCommand(sqltext2, sqlconn);

        SqlDataReader sdr = cmd2.ExecuteReader();

        GridView2.DataSource = sdr;

        GridView2.DataBind();
        sqlconn.Close();

        if (FileUpload1.HasFile)
        {
            string tar_file = MapPath("~/img/") + FileUpload1.FileName;
            FileUpload1.SaveAs(tar_file);
            Response.Redirect(Request.RawUrl);
        }


    }
    protected void GridViewDataBind()
    {
        SqlConnection sqlconn = new SqlConnection("server=AIR;uid=wtaure;pwd=123456;database=chubanshe");

        string sqltext = "select * from news_messages";
        SqlCommand cmd = new SqlCommand(sqltext, sqlconn);

        sqlconn.Open();


        SqlDataAdapter ad = new SqlDataAdapter(sqltext, sqlconn);

        DataSet ds = new DataSet();
        ad.Fill(ds, "news_messages");
        GridView2.DataSource = ds;
        GridView2.DataBind();

        sqlconn.Close();


    }
    protected void GridView2_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView2.PageIndex = e.NewPageIndex;


        GridViewDataBind();
    }

    protected void GridView2_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        for (int i = 0; i < GridView2.Rows.Count; i++)
        {
            for (int j = 0; j < GridView2.Rows[i].Cells.Count; j++)
            {
                GridView2.Rows[i].Cells[j].ToolTip = GridView2.Rows[i].Cells[j].Text;
                if (GridView2.Rows[i].Cells[j].Text.Length > 15)
                {
                    GridView2.Rows[i].Cells[j].Text = GridView2.Rows[i].Cells[j].Text.Substring(0, 15) + "...";
                }
            }
        }
    }
    //protected void Button2_Click(object sender, EventArgs e)
    //{
    //    if (FileUpload1.HasFile)
    //    {
    //        string tar_file = MapPath("~/img/") + FileUpload1.FileName;
    //        FileUpload1.SaveAs(tar_file);
    //        Response.Redirect(Request.RawUrl);
    //    }
    //}
   

}