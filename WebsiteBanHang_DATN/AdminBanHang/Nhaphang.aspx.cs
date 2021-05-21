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
    public partial class Nhaphang : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["Tendangnhap"] != "")
                {
                    if (Request.QueryString["IDTrangthai"] == "8")
                    {
                        load_dsDonnhaphang_All();
                        load_dsTTDonnhaphang_TheoID();
                    }
                    else
                    {
                        load_dsTTDonnhaphang_TheoID();
                        load_dsDonnhaphang_TheoIDTrangthai();
                    }
                    if (Session["Maquyen"].ToString() != "2" && Session["Maquyen"].ToString() != "3")
                    {
                            Response.Write("<script languague='javascript'> alert('Bạn không có quyền truy cập chức năng này !');window.location.href='Trangchu.aspx';</script>");
                    }
                }
            }
        }

        private void load_dsTTDonnhaphang_TheoID()
        {
            DataTable tb = Model.model.getDataWhere(Request.QueryString["IDTrangthai"].ToString(), "get_dsTrangthai_TheoID");
            rptTrangthai_Donnhaphang.DataSourceID = null;
            rptTrangthai_Donnhaphang.DataSource = tb;
            rptTrangthai_Donnhaphang.DataBind();
        }
        private void load_dsDonnhaphang_TheoIDTrangthai()
        {
            DataTable tb = Model.model.getDataWhere(Request.QueryString["IDTrangthai"].ToString(), "get_dsDonnhaphang_theoIDTrangthai");
            rptDonnhaphang.DataSourceID = null;
            rptDonnhaphang.DataSource = tb;
            rptDonnhaphang.DataBind();

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
                rptDonnhaphang.DataSource = pgitems;
                rptDonnhaphang.DataBind();
                rptPages.DataSource = pages;
                rptPages.DataBind();
            }
            else
            {
                rptPages.Visible = false;
                rptDonnhaphang.DataSource = pgitems;
                rptDonnhaphang.DataBind();
            }
        }

        private void load_dsDonnhaphang_All()
        {
            DataTable tb = Model.model.getData("get_dsDonnhaphang");
            rptDonnhaphang.DataSourceID = null;
            rptDonnhaphang.DataSource = tb;
            rptDonnhaphang.DataBind();

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
                rptDonnhaphang.DataSource = pgitems;
                rptDonnhaphang.DataBind();
                rptPages.DataSource = pages;
                rptPages.DataBind();
            }
            else
            {
                rptPages.Visible = false;
                rptDonnhaphang.DataSource = pgitems;
                rptDonnhaphang.DataBind();
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
            load_dsDonnhaphang_All();
            load_dsDonnhaphang_TheoIDTrangthai();
        }

        protected void btnThemDNH_Click(object sender, EventArgs e)
        {
            Response.Redirect("Them_SuaDonNhapHang.aspx?IDTrangthai=" + Request.QueryString["IDTrangthai"].ToString() + "&IDDonnhaphang=&mode=them");
        }
    }
}