using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace WebsiteBanHang_DATN.AdminBanHang
{
    public partial class Nguoidung : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            load_dsTaikhoan();
            if (!IsPostBack)
            {
                if (Session["Tendangnhap"] != "")
                {
                    if (Session["Maquyen"].ToString() != "2")
                    {
                        if (Session["Maquyen"].ToString() != "3")
                        {
                            Response.Write("<script languague='javascript'> alert('Bạn không có quyền truy cập chức năng này !');window.location.href='Trangchu.aspx';</script>");
                        }
                    }
                }
            }
        }
        private void load_dsTaikhoan()
        {
            DataTable tb = Model.model.getData("get_dsTaikhoan_NV");
            rptTaikhoan.DataSourceID = null;
            rptTaikhoan.DataSource = tb;
            rptTaikhoan.DataBind();

            PagedDataSource pgitems = new PagedDataSource();
            System.Data.DataView dv = new System.Data.DataView(tb);
            pgitems.DataSource = dv;
            pgitems.AllowPaging = true;
            pgitems.PageSize = 5;
            pgitems.CurrentPageIndex = PageNumber;
            if (pgitems.PageCount > 1)
            {
                rptPages.Visible = true;
                System.Collections.ArrayList pages = new System.Collections.ArrayList();
                for (int i = 0; i < pgitems.PageCount; i++)
                    pages.Add((i + 1).ToString());
                rptTaikhoan.DataSource = pgitems;
                rptTaikhoan.DataBind();
                rptPages.DataSource = pages;
                rptPages.DataBind();
            }
            else
            {
                rptPages.Visible = false;
                rptTaikhoan.DataSource = pgitems;
                rptTaikhoan.DataBind();
            }
        }

        public int PageNumber
        {
            get
            {
                if (ViewState["PageNumber"] != null)
                    return Convert.ToInt32(ViewState["PageNumber"]);
                else
                    return 0;
            }
            set
            {
                ViewState["PageNumber"] = value;
            }
        }

        protected void rptPages_ItemCommand1(object source, RepeaterCommandEventArgs e)
        {
            PageNumber = Convert.ToInt32(e.CommandArgument) - 1;
            load_dsTaikhoan();
        }

        protected void btnThemTK_Click(object sender, EventArgs e)
        {
            Response.Redirect("Them_SuaTaiKhoan.aspx?Tendangnhap=&mode=them");
        }
    }
}