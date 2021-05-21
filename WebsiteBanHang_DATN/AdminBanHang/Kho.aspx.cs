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
    public partial class Kho : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                mathang_size.Visible = false;
                lbMaMH.Text = Request.QueryString["IDMathang"].ToString();
                load_dsMatHang_Kho();
                if (Request.QueryString["modeMH"].ToString() == "size")
                {
                    if (Request.QueryString["IDMathang"] != "")
                    {
                        load_dsSizeMatHang_Kho();
                        mathang_kho.Visible = false;
                        mathang_size.Visible = true;
                    }
                }
            }
        }
        private void load_dsSizeMatHang_Kho()
        {
            DataTable tb = Model.model.getDataWhere(Request.QueryString["IDMathang"], "get_dsSize_Mathang_Kho");
            rptMathang_Size.DataSourceID = null;
            rptMathang_Size.DataSource = tb;
            rptMathang_Size.DataBind();
            
        }

            private void load_dsMatHang_Kho()
        {
            DataTable tb = Model.model.getData("get_dsMathang_Kho");
            rptMathang_Kho.DataSourceID = null;
            rptMathang_Kho.DataSource = tb;
            rptMathang_Kho.DataBind();

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
                rptMathang_Kho.DataSource = pgitems;
                rptMathang_Kho.DataBind();
                rptPages.DataSource = pages;
                rptPages.DataBind();
            }
            else
            {
                rptPages.Visible = false;
                rptMathang_Kho.DataSource = pgitems;
                rptMathang_Kho.DataBind();
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
            load_dsMatHang_Kho();
        }
    }
}