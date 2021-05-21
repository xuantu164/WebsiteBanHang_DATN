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
    public partial class PhieuNhapKho : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["Tendangnhap"] != "")
                {
                    load_dsPhieuNhapKho_theoID();
                    load_dsTTPhieuNhapKho_theoID();
                }
                if (Request.QueryString["IDTrangThai"].ToString() == "11")
                {
                    load_dsTTPhieuNhapKho_theoID();
                    load_dsALLPhieuNhapKho();
                }
            }
        }

        private void load_dsALLPhieuNhapKho()
        {
            DataTable tb = Model.model.getData("get_dsALLPhieuNhapKho");
            rptPhieunhapkho.DataSourceID = null;
            rptPhieunhapkho.DataSource = tb;
            rptPhieunhapkho.DataBind();

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
                rptPhieunhapkho.DataSource = pgitems;
                rptPhieunhapkho.DataBind();
                rptPages.DataSource = pages;
                rptPages.DataBind();
            }
            else
            {
                rptPages.Visible = false;
                rptPhieunhapkho.DataSource = pgitems;
                rptPhieunhapkho.DataBind();
            }
        }

        private void load_dsTTPhieuNhapKho_theoID()
        {
            DataTable tb = Model.model.getDataWhere(Request.QueryString["IDTrangthai"].ToString(), "get_dsPhieuNhapKho_theoIDTrangthai");
            rptTrangthai_Phieunhapkho.DataSourceID = null;
            rptTrangthai_Phieunhapkho.DataSource = tb;
            rptTrangthai_Phieunhapkho.DataBind();
        }

            private void load_dsPhieuNhapKho_theoID()
        {
            DataTable tb = Model.model.getDataWhere(Request.QueryString["IDTrangthai"].ToString(), "get_dsPhieuNhapKho_theoIDTrangthai");
            rptPhieunhapkho.DataSourceID = null;
            rptPhieunhapkho.DataSource = tb;
            rptPhieunhapkho.DataBind();

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
                rptPhieunhapkho.DataSource = pgitems;
                rptPhieunhapkho.DataBind();
                rptPages.DataSource = pages;
                rptPages.DataBind();
            }
            else
            {
                rptPages.Visible = false;
                rptPhieunhapkho.DataSource = pgitems;
                rptPhieunhapkho.DataBind();
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
            load_dsPhieuNhapKho_theoID();
            load_dsTTPhieuNhapKho_theoID();
            load_dsALLPhieuNhapKho();
        }
    }
}