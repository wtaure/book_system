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

            Response.Redirect("houtailogin.aspx");
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (FileUpload1.HasFile)
        {
            string tar_file = MapPath("~/download/") + FileUpload1.FileName;
            FileUpload1.SaveAs(tar_file);
            Response.Redirect(Request.RawUrl);
        }
    }
}