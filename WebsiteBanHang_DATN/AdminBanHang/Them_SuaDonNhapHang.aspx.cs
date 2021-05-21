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
    public partial class Them_SuaDonNhapHang : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["mode"] == "sua")
                {
                    sua.Visible = true;
                    them.Visible = false;
                    themmathang.Visible = false;
                }
                else
                {
                    if (Request.QueryString["mode"] == "them")
                    {
                        sua.Visible = false;
                        them.Visible = true;
                        themmathang.Visible = false;
                    }
                }

                if (Request.QueryString["suamathang"] == "suamathang")
                {
                    sua.Visible = false;
                    them.Visible = false;
                    themmathang.Visible = true;
                    ddlMathang.Enabled = false;
                }

                if(Request.QueryString["IDTrangthai"] == "6")
                {
                    btnDuyet.Visible = false;
                }

                if (Request.QueryString["IDTrangthai"] == "6" && Request.QueryString["modeDuyet"] == "1")
                {
                    btnHuyDuyet.Visible = true;
                }

                lbDNH.Text = Request.QueryString["IDDonnhaphang"].ToString();
                lbMaDNH.Text = Request.QueryString["IDDonnhaphang"].ToString();
                load_dsChitietdonnhaphang();
                load_Tongtien_Chitietdonnhaphang();
                load_dsChitietdonnhaphang_theoNSX();
                load_maNSX_theoChitietdonnhaphang();
                load_dsNSX();
                load_dsMatHang();
                load_ttMathang_theoDonhaphang();
                load_dsTTDonnhaphang_TheoID();
                load_dsSize();
            }
        }

        private void load_dsTTDonnhaphang_TheoID()
        {
            DataTable tb = Model.model.getDataWhere(Request.QueryString["IDTrangthai"].ToString(), "get_dsTrangthai_TheoID");
            rptTrangthai_Donnhaphang.DataSourceID = null;
            rptTrangthai_Donnhaphang.DataSource = tb;
            rptTrangthai_Donnhaphang.DataBind();
        }

        private void load_ttMathang_theoDonhaphang()
        {
            if (Request.QueryString["suamathang"] == "suamathang")
            {
                btnXacnhan.Visible = true;
                btnThem.Visible = false;
                DataTable tb = Model.model.getDataWhere(Request.QueryString["IDDonnhaphang"].ToString(), "get_Mathang_theoChitietdonhang");
                foreach (DataRow row in tb.Rows)
                {
                    ddlMathang.SelectedValue = row["sMaMH"].ToString();
                    txtGianhap.Text = row["fGianhap"].ToString();
                    txtSoluongnhap.Text = row["iSoluongnhap"].ToString();
                    txtMucchietkhau.Text = row["fMucchietkhau"].ToString();
                    ddlSize.Text = row["iMaSize"].ToString();
                }
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

        private void load_dsNSX()
        {
            DataTable tb = Model.model.getData("get_dsNSX");
            ddlNSX.DataSourceID = null;
            ddlNSX.DataSource = tb;
            ddlNSX.DataTextField = "sTenNSX";
            ddlNSX.DataValueField = "iMaNSX";
            ddlNSX.DataBind();
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

        private void load_maNSX_theoChitietdonnhaphang()
        {
            //if (Request.QueryString["IDDonnhaphang"] != "")
            //{
            //    DataTable tb = Model.model.getDataWhere(Request.QueryString["IDDonnhaphang"].ToString(), "get_ttNSX_theoIDDonhang");
            //    rptMaNSX.DataSourceID = null;
            //    rptMaNSX.DataSource = tb;
            //    rptMaNSX.DataBind();
            //}
        }

        protected void btnQuaylai_Click(object sender, EventArgs e)
        {
            Response.Redirect("Nhaphang.aspx?IDTrangthai=" + Request.QueryString["IDTrangthai"].ToString());
        }

        protected void btnThemDNH_Click(object sender, EventArgs e)
        {

        }

        protected void btnQuaylaiDNH_Click(object sender, EventArgs e)
        {
            Response.Redirect("Nhaphang.aspx?IDTrangthai=" + Request.QueryString["IDTrangthai"].ToString());
        }

        protected void btnThemDNH_Click1(object sender, EventArgs e)
        {
            int i = Model.model.them_Donnhaphang("them_Donnhaphang", int.Parse(Session["MaNV"].ToString()), int.Parse(ddlNSX.SelectedValue));
            if (i > 0)
            {
                Response.Write("<script languague='javascript'> alert('Thêm đơn nhập hàng thành công !');window.location.href ='Nhaphang.aspx?IDTrangthai=7';</script>");
            }
        }

        protected void btnThemMH_Click(object sender, EventArgs e)
        {
            sua.Visible = false;
            them.Visible = false;
            themmathang.Visible = true;
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

        protected void btnThem_Click(object sender, EventArgs e)
        {
            int i = Model.model.them_Chitiet_Donnhaphang("them_Chitietdonnhaphang", Request.QueryString["IDDonnhaphang"], ddlMathang.SelectedValue, float.Parse(txtGianhap.Text), int.Parse(txtSoluongnhap.Text),float.Parse(txtMucchietkhau.Text), int.Parse(ddlSize.SelectedValue));
            if (i > 0)
            {
                Response.Write("<script languague='javascript'> alert('Thêm mặt hàng vào đơn hàng thành công !');window.location.href='Them_SuaDonNhapHang.aspx?modeDuyet=1&IDTrangthai=" + Request.QueryString["IDTrangthai"].ToString() + "&IDDonnhaphang=" + Request.QueryString["IDDonnhaphang"].ToString() + "&IDMathang=" +ddlMathang.SelectedValue + "&mode=sua';</script>");
            }
        }

        private void load_dsMatHang()
        {
            DataTable tb = Model.model.getData("get_dsMathang");
            ddlMathang.DataSourceID = null;
            ddlMathang.DataSource = tb;
            ddlMathang.DataTextField = "sTenMH";
            ddlMathang.DataValueField = "sMaMH";
            ddlMathang.DataBind();
        }

        private void load_dsSize()
        {
            DataTable tb = Model.model.getData("get_dsSize");
            ddlSize.DataSourceID = null;
            ddlSize.DataSource = tb;
            ddlSize.DataTextField = "sTenSize";
            ddlSize.DataValueField = "iMaSize";
            ddlSize.DataBind();
        }
        
        protected void btnQuaylai2_Click(object sender, EventArgs e)
        {
            Response.Redirect("Them_SuaDonNhapHang.aspx?&IDTrangthai=" +Request.QueryString["IDTrangthai"].ToString() + "&IDDonnhaphang="+ Request.QueryString["IDDonnhaphang"].ToString() + "&mode=sua");
        }

        protected void btnXacnhan_Click(object sender, EventArgs e)
        {
            
            int i = Model.model.capnhat_chitietNhaphang("sua_Chitietdonhang", Request.QueryString["IDDonnhaphang"].ToString(),ddlMathang.SelectedValue,float.Parse(txtGianhap.Text),int.Parse(txtSoluongnhap.Text),float.Parse(txtMucchietkhau.Text),int.Parse(ddlSize.SelectedValue));
            if (i > 0)
            {
                Response.Write("<script languague='javascript'> alert('Cập nhật chi tiết đơn nhập hàng thành công !');window.location.href='Them_SuaDonNhapHang.aspx?IDTrangthai=" + Request.QueryString["IDDonnhaphang"].ToString() + "&IDDonnhaphang=" + Request.QueryString["IDDonnhaphang"].ToString() + "&mode=sua';</script>");
            }
            else
                Response.Write("<script languague='javascript'> alert('Cập nhật chi tiết đơn nhập hàng thất bại !');</script>");
        }

        protected void btnDuyet_Click(object sender, EventArgs e)
        {
            if (Request.QueryString["IDMathang"] != "")
            {
                int i = Model.model.xacnhan_Donnhaphang(Request.QueryString["IDDonnhaphang"].ToString(), Session["MaNV"].ToString(), "duyet_Donnhaphang");
                if (i > 0)
                {
                    Response.Write("<script languague='javascript'> alert('Duyệt đơn nhập hàng thành công !');window.location.href='Nhaphang.aspx?IDTrangthai=6';</script>");
                }
                else
                    Response.Write("<script languague='javascript'> alert('Duyệt đơn nhập hàng thất bại !');</script>");
            }
            else
            {
                Response.Write("<script languague='javascript'> alert('Vui lòng thêm mặt hàng vào đơn nhập hàng !');</script>");
            }
            
        }

        protected void btnHuyDuyet_Click(object sender, EventArgs e)
        {
                int i = Model.model.boxacnhan_Donnhaphang(Request.QueryString["IDDonnhaphang"].ToString(), "huyDuyet_Donnhaphang");
                if (i > 0)
                {
                    Response.Write("<script languague='javascript'> alert('Bỏ duyệt đơn nhập hàng thành công !');window.location.href='Nhaphang.aspx?IDTrangthai=7';</script>");
                }
                else
                    Response.Write("<script languague='javascript'> alert('Bỏ duyệt đơn nhập hàng thất bại !');</script>");
        }

        protected void ddlMathang_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void rptChitietdonnhaphang_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            SqlDataReader reader = Model.model.get_CTNH("get_dsMathang_trongCTNH", Request.QueryString["IDDonnhaphang"].ToString());
            if (reader.HasRows)
            {
                while (reader.Read())
                {
                    Session["sMaMH"] = reader["sMaMH"];
                    Session["iMaSize"] = reader["iMaSize"];
                }
            }

            if (e.CommandName == "xoa")
            {
                int i = Model.model.xoa_Donnhaphang("xoa_Chitietdonnhaphang",Request.QueryString["IDDonnhaphang"],e.CommandArgument.ToString(), int.Parse(Session["iMaSize"].ToString()));
                if(i > 0)
                {
                    Response.Write("<script languague='javascript'> alert('Xóa mặt hàng thành công !');window.location.href ='Them_SuaDonNhapHang.aspx?modeDuyet=1&IDTrangthai=" + Request.QueryString["IDTrangthai"] + "&IDDonnhaphang=" + Request.QueryString["IDDonnhaphang"] + "&mode=sua';</script>");
                }
                else
                {
                    Response.Write("<script languague='javascript'> alert('Xóa mặt hàng thất bại !');</script>");
                }
            }
        }
    }
}