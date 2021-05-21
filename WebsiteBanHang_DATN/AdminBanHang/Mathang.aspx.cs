using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace WebsiteBanHang_DATN.AdminBanHang
{
    public partial class Mathang : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            load_dsMatHang();
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
        private void load_dsMatHang()
        {
            DataTable tb = Model.model.getData("get_dsMathang");
            rptMathang.DataSourceID = null;
            rptMathang.DataSource = tb;
            rptMathang.DataBind();

            PagedDataSource pgitems = new PagedDataSource();
            System.Data.DataView dv = new System.Data.DataView(tb);
            pgitems.DataSource = dv;
            pgitems.AllowPaging = true;
            pgitems.PageSize = 10;
            pgitems.CurrentPageIndex = PageNumber;
            if (pgitems.PageCount > 1)
            {
                rptPages.Visible = true;
                System.Collections.ArrayList pages = new System.Collections.ArrayList();
                for (int i = 0; i < pgitems.PageCount; i++)
                    pages.Add((i + 1).ToString());
                rptMathang.DataSource = pgitems;
                rptMathang.DataBind();
                rptPages.DataSource = pages;
                rptPages.DataBind();
            }
            else
            {
                rptPages.Visible = false;
                rptMathang.DataSource = pgitems;
                rptMathang.DataBind();
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
            load_dsMatHang();
        }

        protected void btnThemMH_Click(object sender, EventArgs e)
        {
            Response.Redirect("Them_SuaMatHang.aspx?IDMathang=&mode=them");
        }

    }
}