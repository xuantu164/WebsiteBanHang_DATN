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
    public partial class Them_SuaPhieuXuatKho : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                lbMaDH.Text = Request.QueryString["IDDonhang"].ToString();
                lbPhieuxuatkho.Text = Request.QueryString["IDPhieuxuatkho"].ToString();
                load_maKH_theoChitietdonhang();
                load_maKH_theoChitietdonhang2();
                load_dsChitietdonhang();
                load_dsChitietdonhang2();
                load_Tongtien_Chitietdonhang();
                load_Tongtien_Chitietdonhang2();
                load_dsTTDonhang_TheoID();
                if (Request.QueryString["IDTrangthai"].ToString() == "12")
                {
                    PXK.Visible = true;
                    btnHuyDuyet.Visible = false;
                    btnDuyet.Visible = false;
                    btnInhoadon.Visible = true;
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

        private void load_maKH_theoChitietdonhang()
        {
            if (Request.QueryString["IDDonhang"] != "")
            {
                DataTable tb = Model.model.getDataWhere(Request.QueryString["IDDonhang"].ToString(), "get_ttKhachhang_theoIDDonhang");
                rptMaKH.DataSourceID = null;
                rptMaKH.DataSource = tb;
                rptMaKH.DataBind();
            }
        }

        private void load_maKH_theoChitietdonhang2()
        {
            if (Request.QueryString["IDDonhang"] != "")
            {
                DataTable tb = Model.model.getDataWhere(Request.QueryString["IDDonhang"].ToString(), "get_ttKhachhang_theoIDDonhang");
                rptMaKH2.DataSourceID = null;
                rptMaKH2.DataSource = tb;
                rptMaKH2.DataBind();
            }
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
        private void load_dsChitietdonhang2()
        {
            if (Request.QueryString["IDDonhang"] != "")
            {
                DataTable tb = Model.model.getDataWhere(Request.QueryString["IDDonhang"].ToString(), "get_chitietDonhang");
                rptChitietdonhang2.DataSourceID = null;
                rptChitietdonhang2.DataSource = tb;
                rptChitietdonhang2.DataBind();
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

        private void load_Tongtien_Chitietdonhang2()
        {
            if (Request.QueryString["IDDonhang"] != "")
            {
                DataTable tb = Model.model.getDataWhere(Request.QueryString["IDDonhang"].ToString(), "get_Donhang_Tongtien");
                rptTongtien2.DataSourceID = null;
                rptTongtien2.DataSource = tb;
                rptTongtien2.DataBind();
            }
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
                int i = Model.model.xoa_Chitietdathang_Khachhang_Ngoaihethong("xoa_Mathang_CTDH", Request.QueryString["IDDonhang"], Session["sMaMH"].ToString(), int.Parse(Session["iMaSize"].ToString()));
                if (i > 0)
                {
                    Response.Write("<script languague='javascript'> alert('Xóa mặt hàng thành công !');window.location.href ='hem_SuaPhieuXuatKho.aspx?modeDuyet=1&IDTrangthai=" + Request.QueryString["IDTrangthai"] + "&IDPhieuxuatkho= " + Request.QueryString["IDPhieuxuatkho"] + "&mode=sua&IDDonhang=" + Request.QueryString["IDDonhang"]+"';</script>");
                }
                else
                {
                    Response.Write("<script languague='javascript'> alert('Xóa mặt hàng thất bại !');</script>");
                }
            }
        }

        protected void btnDuyet_Click(object sender, EventArgs e)
        {
            DataTable tb = Model.model.getDataWhere(Request.QueryString["IDDonhang"].ToString(), "get_chitietDonhang");
            for(int i = 0; i < tb.Rows.Count; i++)
            {
                int updatePXK = Model.model.trumathang_KhicapnhatPXK("pr_Tudongtru_MH", Request.QueryString["IDDonhang"].ToString(), tb.Rows[i]["sMaMH"].ToString(), int.Parse(tb.Rows[i]["iSLMua"].ToString()), int.Parse(tb.Rows[i]["iMaSize"].ToString()));

                if (updatePXK > 0)
                {
                    Response.Write("<script languague='javascript'> alert('Xác nhận phiếu xuất kho thành công !');window.location.href ='PhieuXuatKho.aspx?IDTrangThai=12';</script>");
                }
                else
                {
                    Response.Write("<script languague='javascript'> alert('Xác nhận phiếu xuất kho thất bại !');</script>");
                }
            }
        }

        protected void btnQuaylai_Click(object sender, EventArgs e)
        {
            Response.Redirect("PhieuXuatKho.aspx?IDTrangThai=" + Request.QueryString["IDTrangthai"].ToString());
        }

        protected void btnInhoadon_Click(object sender, EventArgs e)
        {
            lbHoadon.Text = Request.QueryString["IDDonhang"].ToString();
            lbPXK.Text = Request.QueryString["IDPhieuxuatkho"].ToString();
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "myModal", "$('#myModal').modal();", true);
            upModal.Update();
        }
    }
}