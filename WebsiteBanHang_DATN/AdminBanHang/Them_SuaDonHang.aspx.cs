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
    public partial class Them_SuaDonHang : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                themMH.Visible = false;
                if (Request.QueryString["mode"] == "sua")
                {
                    sua.Visible = true;
                    them.Visible = false;
                }
                else
                {
                    if (Request.QueryString["mode"] == "them")
                    {
                        sua.Visible = false;
                        them.Visible = true;
                    }
                }

                if (Request.QueryString["IDTrangthai"] == "3")
                {
                    btnDuyet.Visible = false;
                }

                if (Request.QueryString["IDTrangthai"] == "3" && Request.QueryString["modeDuyet"] == "1")
                {
                    btnHuyDuyet.Visible = true;
                }

                if (Request.QueryString["IDTrangthai"] == "4" && Request.QueryString["modeDuyet"] == "1")
                {
                    btnXoaDonHang_Chuaduyet.Visible = true;
                }

                lbDondathang.Text = Request.QueryString["IDDonhang"].ToString();
                lbMaDH.Text = Request.QueryString["IDDonhang"].ToString();
                load_dsChitietdonhang();
                load_Tongtien_Chitietdonhang();
                load_maKH_theoChitietdonhang();
                load_dsKhachhang();
                load_dsMatHang_ddlThemMH_DDH();
                load_dsTTDonhang_TheoID();
            }
        }

        private void load_dsMatHang_ddlThemMH_DDH()
        {
            if (!Page.IsPostBack)
            {
                DataTable tb = Model.model.getData("get_dsMathang_trongKho");
                ddlThemMH_DDH.DataSourceID = null;
                ddlThemMH_DDH.DataSource = tb;
                ddlThemMH_DDH.DataTextField = "sTenMH";
                ddlThemMH_DDH.DataValueField = "sMaMH";
                ddlThemMH_DDH.DataBind();
                load_dsSize_ddlSizeThemMH_DDH(ddlThemMH_DDH.SelectedValue.ToString());
            }
        }

        private void load_dsSize_ddlSizeThemMH_DDH(string maMH)
        {
            DataTable tb = Model.model.getDataWhere(maMH, "get_dsSize_theoIDMH");
            ddlSizeThemMH_DDH.DataSourceID = null;
            ddlSizeThemMH_DDH.DataSource = tb;
            ddlSizeThemMH_DDH.DataTextField = "sTenSize";
            ddlSizeThemMH_DDH.DataValueField = "iMaSize";
            ddlSizeThemMH_DDH.DataBind();
        }

        private void load_dsTTDonhang_TheoID()
        {
            DataTable tb = Model.model.getDataWhere(Request.QueryString["IDTrangthai"].ToString(), "get_dsTrangthai_TheoID");
            rptTrangthai_Dondathang.DataSourceID = null;
            rptTrangthai_Dondathang.DataSource = tb;
            rptTrangthai_Dondathang.DataBind();
        }

        private void load_dsChitietdonhang()
        {
            if (Request.QueryString["IDDonhang"] != "")
            {
                DataTable tb = Model.model.getDataWhere(Request.QueryString["IDDonhang"].ToString(), "get_chitietDonhang");
                rptChitietdonhang.DataSourceID = null;
                rptChitietdonhang.DataSource = tb;
                rptChitietdonhang.DataBind();
            }
        }

        private void load_Tongtien_Chitietdonhang()
        {
            if (Request.QueryString["IDDonhang"] != "")
            {
                DataTable tb = Model.model.getDataWhere(Request.QueryString["IDDonhang"].ToString(), "get_Donhang_Tongtien");
                rptTongtien.DataSourceID = null;
                rptTongtien.DataSource = tb;
                rptTongtien.DataBind();
            }
        }

        private void load_maKH_theoChitietdonhang()
        {
            if (Request.QueryString["IDDonhang"] != "")
            {
                DataTable tb = Model.model.getDataWhere(Request.QueryString["IDDonhang"].ToString(),"get_ttKhachhang_theoIDDonhang");
                rptMaKH.DataSourceID = null;
                rptMaKH.DataSource = tb;
                rptMaKH.DataBind();
            }
        }

        protected void btnQuaylai_Click(object sender, EventArgs e)
        {
            Response.Redirect("Donhang.aspx?IDTrangthai=" + Request.QueryString["IDTrangthai"].ToString());
        }

        private void load_dsKhachhang()
        {
            DataTable tb = Model.model.getData("get_dsKhachhang");
            //ddlKhachhang.DataSourceID = null;
            //ddlKhachhang.DataSource = tb;
            //ddlKhachhang.DataTextField = "sTenKH";
            //ddlKhachhang.DataValueField = "iMaKH";
            //ddlKhachhang.DataBind();
        }

        protected void btnQuaylaiDH_Click(object sender, EventArgs e)
        {
            Response.Redirect("Donhang.aspx?IDTrangthai=" + Request.QueryString["IDTrangthai"].ToString());
        }

        protected void btnThemDH_Click(object sender, EventArgs e)
        {
            int i = Model.model.Them_DonHang_KhachHang_Ngoaihethong("insert_Dondathang_Khachhang_Ngoaihethong", int.Parse(Session["MaNV"].ToString()),txtKhachhang.Text,txtSdt.Text,txtDiachigiaohang.Text,Convert.ToDateTime(txtNgaygiaohang.Text));
            if (i > 0)
            {
                Response.Write("<script languague='javascript'> alert('Thêm đơn hàng thành công !');window.location.href ='Donhang.aspx?IDTrangThai=4';</script>");
            }
            else
                Response.Write("<script languague='javascript'> alert('Thêm đơn hàng thất bại !');</script>");
        }

        protected void btnDuyet_Click(object sender, EventArgs e)
        {
            int i = Model.model.xacnhan_Donhang(Request.QueryString["IDDonhang"].ToString(), "pr_Capnhat_TTDonhang");
            if (i > 0)
            {
                Response.Write("<script languague='javascript'> alert('Duyệt đơn hàng thành công !');window.location.href ='Donhang.aspx?IDTrangthai=3';</script>");
            }
            else
                Response.Write("<script languague='javascript'> alert('Duyệt đơn hàng thất bại !');</script>");
        }

        protected void btnHuyDuyet_Click(object sender, EventArgs e)
        {
            int i = Model.model.boxacnhan_Donhang(Request.QueryString["IDDonhang"].ToString(), "pr_Capnhat_HuyTTDonhang");
            if (i > 0)
            {
                Response.Write("<script languague='javascript'> alert('Bỏ duyệt đơn hàng thành công !');window.location.href ='Donhang.aspx?IDTrangthai=4';</script>");
            }
            else
                Response.Write("<script languague='javascript'> alert('Bỏ duyệt đơn hàng thất bại !');</script>");
        }

        protected void btnThemMH_Click(object sender, EventArgs e)
        {
            themMH.Visible = true;
            sua.Visible = false;
            them.Visible = false;
        }

        protected void btnXacnhan_Click(object sender, EventArgs e)
        {

        }

        protected void ddlThemMH_DDH_SelectedIndexChanged(object sender, EventArgs e)
        {
            load_dsSize_ddlSizeThemMH_DDH(ddlThemMH_DDH.SelectedValue);
        }

        protected void btnThemMH_DDH_Click(object sender, EventArgs e)
        {
            int soLuong = int.Parse(Request.Form["quantity"]);

            int themMH = Model.model.insert_Chitietdathang_Khachhang_Ngoaihethong("insert_Chitietdathang_Khachhang_Ngoaihethong", Request.QueryString["IDDonhang"], ddlThemMH_DDH.SelectedValue, soLuong, int.Parse(ddlSizeThemMH_DDH.SelectedValue));
            if (themMH > 0)
            {
                Response.Write("<script languague='javascript'> alert('Thêm mặt hàng thành công !');window.location.href ='Them_SuaDonHang.aspx?modeDuyet=1&IDTrangthai=" + Request.QueryString["IDTrangthai"] + "&IDDonhang=" + Request.QueryString["IDDonhang"] + "&mode=sua';</script>");
            }
            else
            {
                Response.Write("<script languague='javascript'> alert('Thêm mặt hàng thất bại !');</script>");
            }
        }

        protected void btnQuaylaiThemMH_DDH_Click(object sender, EventArgs e)
        {
            Response.Write("<script languague='javascript'>;window.location.href ='Them_SuaDonHang.aspx?modeDuyet=1&IDTrangthai=" + Request.QueryString["IDTrangthai"] + "&IDDonhang=" + Request.QueryString["IDDonhang"] + "&mode=sua';</script>");
        }

        protected void rptChitietdonhang_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            SqlDataReader reader = Model.model.get_CTDH("get_dsMathang_trongCTDH", Request.QueryString["IDDonhang"].ToString());
            if (reader.HasRows)
            {
                while (reader.Read())
                {
                    Session["sMaMH"] = reader["sMaMH"];
                    Session["iMaSize"] = reader["iMaSize"];
                }
            }

            if (e.CommandName == "lbtnXoa")
            {
                int i = Model.model.xoa_Chitietdathang_Khachhang_Ngoaihethong("xoa_Mathang_CTDH", Request.QueryString["IDDonhang"].ToString() ,e.CommandArgument.ToString(), int.Parse(Session["iMaSize"].ToString()));
                if (i > 0)
                {
                    Response.Write("<script languague='javascript'> alert('Xóa mặt hàng thành công !');window.location.href ='Them_SuaDonHang.aspx?modeDuyet=1&IDTrangthai=" + Request.QueryString["IDTrangthai"] + "&IDDonhang=" + Request.QueryString["IDDonhang"] + "&mode=sua';</script>");
                }
                else
                {
                    Response.Write("<script languague='javascript'> alert('Xóa mặt hàng thất bại !');</script>");
                }
            }
        }

        protected void btnXoaDonHang_Chuaduyet_Click(object sender, EventArgs e)
        {
            int i = Model.model.xoa_Dondathang_KhongcoMH("xoa_DDH_theoID",Request.QueryString["IDDonhang"].ToString());
            if (i > 0)
            {
                Response.Write("<script languague='javascript'> alert('Xóa đơn hàng thành công !');window.location.href ='Donhang.aspx?IDTrangthai=4';</script>");
            }
            else
            {
                Response.Write("<script languague='javascript'> alert('Xóa đơn hàng thất bại !');</script>");
            }
        }
    }
}