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
        Session["username"] = txtusername.Text;
    }

    protected void Button1_Click(object sender, EventArgs e)
    {

        int i = -1;

        string password = txtpassword.Text;                  //密码
        string sex = RadioButtonList1.SelectedValue;                  //性别
        //string leixing = RadioButtonList2.SelectedValue; 
        //string birth = txtBirth.Text;                       //出生日期
        //string eduation = dropEducation.SelectedValue;       //学历
        string phone = txtdianhua.Text;                         //电话
        string address = txtdizhi.Text;                    //地址
        //string zip = txtZip.Text;                           //邮政编码
        //string email = txtEmail.Text;                       //电子邮件
        //string regdate = DateTime.Now.ToShortDateString();  //注册时间
        string address1 = "会员";

        // string insertstr = "insert into  用户信息$(用户名,密码,性别,联系电话,地址,身份 ) values('" + txtusername.Text + "','" + txtpassword.Text + "','" + RadioButtonList1.SelectedItem.Text + "','" + txtdianhua.Text + "','" + txtdizhi.Text + "','" + RadioButtonList2.SelectedItem.Text + "')";
        string insertstr = "insert into  rule_user(username,psd,sex,phone,address,address1 ) values('" + txtusername.Text + "','" + txtpassword.Text + "','" + RadioButtonList1.SelectedItem.Text + "','" + txtdianhua.Text + "','" + txtdizhi.Text + "','" + address1 + "')";

        SqlCommand mycmd = new SqlCommand(insertstr, sqlconn);


        sqlconn.Open();
        try
        {
            i = mycmd.ExecuteNonQuery();
            string selectstr = "select username,psd,sex,phone,address,assress1  from rule_user";
            SqlCommand mycmd2 = new SqlCommand(selectstr, sqlconn);
            SqlDataReader mydr = mycmd2.ExecuteReader();

        }
        catch (Exception ex)
        {

        }

        sqlconn.Close();
        if (i == 1)
        {
            Response.Write("<script>alert('注册成功!')</script>");
            Server.Transfer("houtailogin.aspx");
        }
        else if (i < 1)
        {
            Response.Write("<script>alert('用户名已有人使用，请重新输入用户名!')</script>");
        }

    }     
}