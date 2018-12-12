using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class xitong1 : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void zhuxiao_Click(object sender, EventArgs e)
    {
        Session.Remove("user");//清除session

        //跳转到本身看看
        Server.Transfer("houtai.aspx");

    }

   
}
