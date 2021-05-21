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
    public partial class Donhang : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["Tendangnhap"] != "")
                {
                    if(Request.QueryString["IDTrangthai"] == "5")
                    {
                        load_dsDonhang_All();
                        load_dsTTDonhang_TheoID();
                    }
                    else
                    {
                        load_dsTTDonhang_TheoID();
                        load_dsDonhang_TheoIDTrangthai();
                    }
                }
            }
        }

        private void load_dsTTDonhang_TheoID()
        {
            DataTable tb = Model.model.getDataWhere(Request.QueryString["IDTrangthai"].ToString(), "get_dsTrangthai_TheoID");
            rptTrangthai_Dondathang.DataSourceID = null;
            rptTrangthai_Dondathang.DataSource = tb;
            rptTrangthai_Dondathang.DataBind();
        }

        private void load_dsDonhang_TheoIDTrangthai()
        {
            DataTable tb = Model.model.getDataWhere(Request.QueryString["IDTrangthai"].ToString(), "get_dsDonhang_theoIDTrangthai");
            rptDonhang.DataSourceID = null;
            rptDonhang.DataSource = tb;
            rptDonhang.DataBind();

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
                rptDonhang.DataSource = pgitems;
                rptDonhang.DataBind();
                rptPages.DataSource = pages;
                rptPages.DataBind();
            }
            else
            {
                rptPages.Visible = false;
                rptDonhang.DataSource = pgitems;
                rptDonhang.DataBind();
            }
        }

        private void load_dsDonhang_All()
        {
            DataTable tb = Model.model.getData("get_dsDonhang");
            rptDonhang.DataSourceID = null;
            rptDonhang.DataSource = tb;
            rptDonhang.DataBind();

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
                rptDonhang.DataSource = pgitems;
                rptDonhang.DataBind();
                rptPages.DataSource = pages;
                rptPages.DataBind();
            }
            else
            {
                rptPages.Visible = false;
                rptDonhang.DataSource = pgitems;
                rptDonhang.DataBind();
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
            load_dsDonhang_All();
            load_dsDonhang_TheoIDTrangthai();
        }

        protected void btnThemDH_Click(object sender, EventArgs e)
        {
            Response.Redirect("Them_SuaDonHang.aspx?IDDonhang=&IDTrangthai=" + Request.QueryString["IDTrangthai"].ToString() + "&mode=them");
        }
    }
    
}