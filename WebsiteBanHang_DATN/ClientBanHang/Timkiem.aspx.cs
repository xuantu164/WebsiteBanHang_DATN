using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace WebsiteBanHang_DATN.ClientBanHang
{
    public partial class Timkiem : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            load_dsMatHang();
            load_dsMH_Goiy();
            load_dsMH_Goiy2();
            //get_dsMathang_theoLoaiMH();
            //get_dsMathang_theoNSX();
        }

        private void load_dsMatHang()
        {
            if(Request.QueryString["searchkey"].ToString() != null)
            {
                DataTable tb = Model.model.getDataWhere(Request.QueryString["searchkey"].ToString(), "timkiem_Mathang");
                rptMathanghomnay.DataSourceID = null;
                rptMathanghomnay.DataSource = tb;
                rptMathanghomnay.DataBind();

                //PagedDataSource pgitems = new PagedDataSource();
                //System.Data.DataView dv = new System.Data.DataView(tb);
                //pgitems.DataSource = dv;
                //pgitems.AllowPaging = true;
                //pgitems.PageSize = 10;
                //pgitems.CurrentPageIndex = PageNumber;
                //if (pgitems.PageCount > 1)
                //{
                //    rptPages.Visible = true;
                //    System.Collections.ArrayList pages = new System.Collections.ArrayList();
                //    for (int i = 0; i < pgitems.PageCount; i++)
                //        pages.Add((i + 1).ToString());
                //    rptMathanghomnay.DataSource = pgitems;
                //    rptMathanghomnay.DataBind();
                //    rptPages.DataSource = pages;
                //    rptPages.DataBind();
                //}
                //else
                //{
                //    rptPages.Visible = false;
                //    rptMathanghomnay.DataSource = pgitems;
                //    rptMathanghomnay.DataBind();
                //}
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
            get_dsMathang_theoNSX();
        }
        
        private void get_dsMathang_theoNSX()
        {
            if (Request.QueryString["IDNSX"].ToString() != null)
            {
                DataTable tb = Model.model.getDataWhere(Request.QueryString["IDNSX"].ToString(), "get_dsMathang_theoNSX");
                rptMathanghomnay.DataSourceID = null;
                rptMathanghomnay.DataSource = tb;
                rptMathanghomnay.DataBind();

                //PagedDataSource pgitems = new PagedDataSource();
                //System.Data.DataView dv = new System.Data.DataView(tb);
                //pgitems.DataSource = dv;
                //pgitems.AllowPaging = true;
                //pgitems.PageSize = 12;
                //pgitems.CurrentPageIndex = PageNumber;
                //if (pgitems.PageCount > 1)
                //{
                //    rptPages.Visible = true;
                //    System.Collections.ArrayList pages = new System.Collections.ArrayList();
                //    for (int i = 0; i < pgitems.PageCount; i++)
                //        pages.Add((i + 1).ToString());
                //    rptMathanghomnay.DataSource = pgitems;
                //    rptMathanghomnay.DataBind();
                //    rptPages.DataSource = pages;
                //    rptPages.DataBind();
                //}
                //else
                //{
                //    rptPages.Visible = false;
                //    rptMathanghomnay.DataSource = pgitems;
                //    rptMathanghomnay.DataBind();
                //}
            }
        }

        private void get_dsMathang_theoLoaiMH()
        {
            if (Request.QueryString["IDLoaiMH"].ToString() != null)
            {
                DataTable tb = Model.model.getDataWhere(Request.QueryString["IDLoaiMH"].ToString(), "get_dsMathang_theoLoaiMH");
                rptMathanghomnay.DataSourceID = null;
                rptMathanghomnay.DataSource = tb;
                rptMathanghomnay.DataBind();
            }
        }

        private void load_dsMH_Goiy()
        {
            DataTable tb = Model.model.getData("dsMathang_Aobongdatreem_random");
            rptGoiy.DataSourceID = null;
            rptGoiy.DataSource = tb;
            rptGoiy.DataBind();
        }

        private void load_dsMH_Goiy2()
        {
            DataTable tb = Model.model.getData("dsMathang_Aobongdatreem_random");
            rptGoiy2.DataSourceID = null;
            rptGoiy2.DataSource = tb;
            rptGoiy2.DataBind();
        }
    }
}