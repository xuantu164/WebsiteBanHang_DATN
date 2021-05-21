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
    public partial class Them_SuaPhieuNhapKho : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                load_dsTTDonnhaphang_TheoID();
                load_dsChitietdonnhaphang_theoNSX();
                load_dsChitietdonnhaphang_theoNSX2();
                load_Tongtien_Chitietdonnhaphang();
                load_Tongtien_Chitietdonnhaphang2();
                load_dsTTDonnhaphang_TheoID2();
                load_dsChitietdonnhaphang();
                load_dsChitietdonnhaphang2();
                lbMaDNH.Text = Request.QueryString["IDDonnhaphang"].ToString();
                lbPhieunhapkho.Text = Request.QueryString["IDPhieunhapkho"].ToString();
                if (Request.QueryString["IDTrangthai"].ToString() == "9")
                {
                    PNK.Visible = true;
                    btnHuyDuyet.Visible = false;
                    btnDuyet.Visible = false;
                    btnInhoadon.Visible = true;
                }

                btnDuyet.Visible = true;
            }
        }

        private void load_dsTTDonnhaphang_TheoID()
        {
            DataTable tb = Model.model.getDataWhere(Request.QueryString["IDTrangthai"].ToString(), "get_dsTrangthai_TheoID");
            rptTrangthai_Donnhaphang.DataSourceID = null;
            rptTrangthai_Donnhaphang.DataSource = tb;
            rptTrangthai_Donnhaphang.DataBind();
        }

        private void load_dsTTDonnhaphang_TheoID2()
        {
            DataTable tb = Model.model.getDataWhere(Request.QueryString["IDTrangthai"].ToString(), "get_dsTrangthai_TheoID");
            rptTrangthai_Donnhaphang2.DataSourceID = null;
            rptTrangthai_Donnhaphang2.DataSource = tb;
            rptTrangthai_Donnhaphang2.DataBind();
        }

        private void load_dsChitietdonnhaphang_theoNSX()
        {
            if (Request.QueryString["IDDonnhaphang"] != "")
            {
                DataTable tb = Model.model.getDataWhere(Request.QueryString["IDDonnhaphang"].ToString(), "get_ttNSX_theoIDDonhang");
                rptNSX.DataSourceID = null;
                rptNSX.DataSource = tb;
                rptNSX.DataBind();
            }
        }


        private void load_dsChitietdonnhaphang_theoNSX2()
        {
            if (Request.QueryString["IDDonnhaphang"] != "")
            {
                DataTable tb = Model.model.getDataWhere(Request.QueryString["IDDonnhaphang"].ToString(), "get_ttNSX_theoIDDonhang");
                rptNSX2.DataSourceID = null;
                rptNSX2.DataSource = tb;
                rptNSX2.DataBind();
            }
        }

        private void load_Tongtien_Chitietdonnhaphang()
        {
            if (Request.QueryString["IDDonnhaphang"] != "")
            {
                DataTable tb = Model.model.getDataWhere(Request.QueryString["IDDonnhaphang"].ToString(), "get_Donnhaphang_Tongtien");
                rptTongtien.DataSourceID = null;
                rptTongtien.DataSource = tb;
                rptTongtien.DataBind();
            }
        }

        private void load_Tongtien_Chitietdonnhaphang2()
        {
            if (Request.QueryString["IDDonnhaphang"] != "")
            {
                DataTable tb = Model.model.getDataWhere(Request.QueryString["IDDonnhaphang"].ToString(), "get_Donnhaphang_Tongtien");
                rptTongtien2.DataSourceID = null;
                rptTongtien2.DataSource = tb;
                rptTongtien2.DataBind();
            }
        }

        private void load_dsChitietdonnhaphang()
        {
            if (Request.QueryString["IDDonnhaphang"] != "")
            {
                DataTable tb = Model.model.getDataWhere(Request.QueryString["IDDonnhaphang"].ToString(), "get_chitietDonnhaphang");
                rptChitietdonnhaphang.DataSourceID = null;
                rptChitietdonnhaphang.DataSource = tb;
                rptChitietdonnhaphang.DataBind();

                PagedDataSource pgitems = new PagedDataSource();
                System.Data.DataView dv = new System.Data.DataView(tb);
                pgitems.DataSource = dv;
                pgitems.AllowPaging = true;
                pgitems.PageSize = 30;
                pgitems.CurrentPageIndex = PageNumber;
                if (pgitems.PageCount > 1)
                {
                    rptPages.Visible = true;
                    System.Collections.ArrayList pages = new System.Collections.ArrayList();
                    for (int i = 0; i < pgitems.PageCount; i++)
                        pages.Add((i + 1).ToString());
                    rptChitietdonnhaphang.DataSource = pgitems;
                    rptChitietdonnhaphang.DataBind();
                    rptPages.DataSource = pages;
                    rptPages.DataBind();
                }
                else
                {
                    rptPages.Visible = false;
                    rptChitietdonnhaphang.DataSource = pgitems;
                    rptChitietdonnhaphang.DataBind();
                }
            }
        }

        private void load_dsChitietdonnhaphang2()
        {
            if (Request.QueryString["IDDonnhaphang"] != "")
            {
                DataTable tb = Model.model.getDataWhere(Request.QueryString["IDDonnhaphang"].ToString(), "get_chitietDonnhaphang");
                rptChitietdonnhaphang2.DataSourceID = null;
                rptChitietdonnhaphang2.DataSource = tb;
                rptChitietdonnhaphang2.DataBind();

                PagedDataSource pgitems = new PagedDataSource();
                System.Data.DataView dv = new System.Data.DataView(tb);
                pgitems.DataSource = dv;
                pgitems.AllowPaging = true;
                pgitems.PageSize = 10;
                pgitems.CurrentPageIndex = PageNumber2;
                if (pgitems.PageCount > 1)
                {
                    rptPages2.Visible = true;
                    System.Collections.ArrayList pages = new System.Collections.ArrayList();
                    for (int i = 0; i < pgitems.PageCount; i++)
                        pages.Add((i + 1).ToString());
                    rptChitietdonnhaphang2.DataSource = pgitems;
                    rptChitietdonnhaphang2.DataBind();
                    rptPages2.DataSource = pages;
                    rptPages2.DataBind();
                }
                else
                {
                    rptPages2.Visible = false;
                    rptChitietdonnhaphang2.DataSource = pgitems;
                    rptChitietdonnhaphang2.DataBind();
                }
            }
        }
        public int PageNumber2
        {
            get
            {
                if (ViewState["PageNumber2"] != null)
                    return Convert.ToInt32(ViewState["PageNumber2"]);
                else
                    return 0;
            }
            set
            {
                ViewState["PageNumber2"] = value;
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
            load_dsChitietdonnhaphang();
        }

        protected void rptPages2_ItemCommand1(object source, RepeaterCommandEventArgs e)
        {
            PageNumber = Convert.ToInt32(e.CommandArgument) - 1;
            load_dsChitietdonnhaphang2();
        }

        protected void btnQuaylai_Click(object sender, EventArgs e)
        {
            Response.Redirect("PhieuNhapKho.aspx?IDTrangThai=" + Request.QueryString["IDTrangthai"].ToString());
        }

        protected void rptChitietdonnhaphang_ItemCommand(object source, RepeaterCommandEventArgs e)
        {

        }

        protected void btnDuyet_Click(object sender, EventArgs e)
        {
            DataTable tb = Model.model.getDataWhere(Request.QueryString["IDDonnhaphang"].ToString(), "get_chitietDonnhaphang");
            for (int i = 0; i < tb.Rows.Count; i++)
            {
                int updatePNK = Model.model.xacnhan_Phieunhapkho("xacnhan_Phieunhapkho", Request.QueryString["IDDonnhaphang"].ToString(),tb.Rows[i]["sMaMH"].ToString(), int.Parse(tb.Rows[i]["iSoluongnhap"].ToString()),int.Parse(tb.Rows[i]["iMaSize"].ToString()));

                if (updatePNK > 0)
                {
                    Response.Write("<script languague='javascript'> alert('Xác nhận đơn nhập hàng thành công !');window.location.href ='PhieuNhapKho.aspx?IDTrangThai=9';</script>");
                }
                else
                {
                    Response.Write("<script languague='javascript'> alert('Xác nhận đơn nhập hàng thất bại !');</script>");
                }
            }
        }

        protected void btnHuyDuyet_Click(object sender, EventArgs e)
        {

        }

        //protected void rptPages2_ItemCommand1(object source, RepeaterCommandEventArgs e)
        //{
        //    PageNumber = Convert.ToInt32(e.CommandArgument) - 1;
        //    load_dsChitietdonnhaphang2();
        //}

        protected void btnInhoadon_Click(object sender, EventArgs e)
        {
            lbHoadon2.Text = Request.QueryString["IDDonnhaphang"].ToString();
            lbPhieunhapkho2.Text = Request.QueryString["IDPhieunhapkho"].ToString();
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "myModal", "$('#myModal').modal();", true);
            upModal.Update();
        }
    }
}