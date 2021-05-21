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
    public partial class PhieuXuatKho : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["Tendangnhap"] != "")
                {
                    load_dsPhieuXuatKho();
                    load_Trangthai_Phieuxuatkho_theoID();
                    if(Request.QueryString["IDTrangThai"].ToString() == "14")
                    {
                        load_Trangthai_Phieuxuatkho_theoID();
                        load_dsALL_PhieuXuatKho();
                    }
                }
            }
        }
            private void load_dsALL_PhieuXuatKho()
            {
                DataTable tb = Model.model.getData("get_dsALL_PhieuXuatKho");
                rptPhieuxuatkho.DataSourceID = null;
                rptPhieuxuatkho.DataSource = tb;
                rptPhieuxuatkho.DataBind();

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
                    rptPhieuxuatkho.DataSource = pgitems;
                    rptPhieuxuatkho.DataBind();
                    rptPages.DataSource = pages;
                    rptPages.DataBind();
                }
                else
                {
                    rptPages.Visible = false;
                    rptPhieuxuatkho.DataSource = pgitems;
                    rptPhieuxuatkho.DataBind();
                }
            }
        private void load_dsPhieuXuatKho()
        {
            DataTable tb = Model.model.getDataWhere(Request.QueryString["IDTrangThai"],"get_dsPhieuXuatKho");
            rptPhieuxuatkho.DataSourceID = null;
            rptPhieuxuatkho.DataSource = tb;
            rptPhieuxuatkho.DataBind();

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
                rptPhieuxuatkho.DataSource = pgitems;
                rptPhieuxuatkho.DataBind();
                rptPages.DataSource = pages;
                rptPages.DataBind();
            }
            else
            {
                rptPages.Visible = false;
                rptPhieuxuatkho.DataSource = pgitems;
                rptPhieuxuatkho.DataBind();
            }
        }

        private void load_Trangthai_Phieuxuatkho_theoID()
        {
            DataTable tb = Model.model.getDataWhere(Request.QueryString["IDTrangThai"], "load_Trangthai_Phieuxuatkho_theoID");
            rptTrangthai_Phieuxuatkho.DataSourceID = null;
            rptTrangthai_Phieuxuatkho.DataSource = tb;
            rptTrangthai_Phieuxuatkho.DataBind();
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
            load_dsPhieuXuatKho();
            load_Trangthai_Phieuxuatkho_theoID();
            load_dsALL_PhieuXuatKho();
        }
    }
}