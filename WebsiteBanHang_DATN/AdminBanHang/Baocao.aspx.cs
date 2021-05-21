using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebsiteBanHang_DATN.AdminBanHang
{
    public partial class Baocoa : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //if (Session["Tendangnhap"] != "")
                //{
                //    if (Session["Maquyen"] != "1")
                //    {
                //        Response.Write("<script languague='javascript'> alert('Bạn không có quyền truy cập chức năng này !')</script>");
                //    }
                //}
            }
        }
    }
}