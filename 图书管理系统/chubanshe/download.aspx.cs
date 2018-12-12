using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["user"] == null)
        {

            Response.Redirect("login.aspx");
        }
    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {

        //string fileName = ".jpg";
        //string filePath = Server.MapPath("~/download/.jpg");

        //Response.Clear();
        //Response.Buffer = true;

        //Response.AddHeader("Content-Disposition", "attachment;filename=" + fileName);
        //Response.ContentType = "application/unknow";
        //Response.TransmitFile(filePath);
        //Response.End();

    }
  
}