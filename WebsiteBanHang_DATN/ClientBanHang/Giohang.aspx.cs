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
    public partial class Giohang : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                thanhtoan.Visible = false;
                //if (Session["Tendangnhap"] == null)
                //{
                //    Response.Write("<script languague='javascript'>alert('Bạn cần đăng nhập để thực hiện chức năng này !');window.location.href='Dangnhap.aspx';</script>");
                //}
                //else
                //{
                //    Response.Write("<script languague='javascript'>alert('Thêm vào giỏ hàng thành công !');</script>");
                //}
                load_ttMatHang_theoID();
                tinh_Tongtienhang();
                //load_maKH_theoChitietdonhang();
                load_Donhang_Moinhat();
                get_TTKhachhang_theoID();
            }
        }

        private void load_maKH_theoChitietdonhang()
        {
            if (Session["Tendangnhap"] != "")
            {
                DataTable tb = Model.model.getDataWhere(Session["Tendangnhap"].ToString(), "get_ttKhachhang_theoTendangnhap");
                rptMaKH.DataSourceID = null;
                rptMaKH.DataSource = tb;
                rptMaKH.DataBind();
            }
        }

        private void tinh_Tongtienhang()
        {
            if (Session["Giohang"] != null)
            {
                DataTable dtGiohang = new DataTable();
                dtGiohang = (DataTable)Session["Giohang"];
                float tongtien = 0;
                for (int i = 0; i < dtGiohang.Rows.Count; i++)
                {
                    tongtien += float.Parse(dtGiohang.Rows[i]["fThanhtien"].ToString());
                }
                lbTongtien.Text = tongtien.ToString("00,0 đ");
                lbSomathang.Text = dtGiohang.Rows.Count.ToString();
            }
        }

        private void load_Donhang_Moinhat()
        {
            DataTable tb = Model.model.getData("dsMathang_MoiNhat");
            rptDonhangmoinhat.DataSourceID = null;
            rptDonhangmoinhat.DataSource = tb;
            rptDonhangmoinhat.DataBind();
        }

        private void load_ttMatHang_theoID()
        {
            DataTable tb = new DataTable();
            //DataTable tb = Model.model.getDataWhere(Request.QueryString["IDMathang"].ToString(), "dsMathang_theoID");
            tb = (DataTable) Session["Giohang"];
            rptGiohang.DataSourceID = null;
            rptGiohang.DataSource = tb;
            rptGiohang.DataBind();
        }

        private void get_TTKhachhang_theoID()
        {
            if (Session["Tendangnhap"] != null)
            {
                DataTable tb = Model.model.getDataWhere(Session["MaNV"].ToString(), "get_TTKhachhang_theoID");
                foreach (DataRow row in tb.Rows)
                {
                    txtHoten.Text = row["sTenKH"].ToString();
                    txtSdt.Text = row["sSdt"].ToString();
                    txtDiachigiaohang.Text = row["sDiachi"].ToString();
                }
            }
        }

        protected void lbtThanhtoan_Click(object sender, EventArgs e)
        {
            //if (Session["Tendangnhap"] != null && Session["Giohang"] != null)
            //{
            //    sua.Visible = true;
            //    thanhtoan.Visible = false;
            //    int themDH = Model.model.Them_DonDatHang_KhachHang("insert_Dondathang_Khachhang", Session["MaNV"].ToString());
            //    if(themDH > 0)
            //    {
            //        DataTable dtGiohang = new DataTable();
            //        dtGiohang = (DataTable)Session["Giohang"];
            //        for (int i = 0; i < dtGiohang.Rows.Count; i++)
            //        {
            //            int themCTDH = Model.model.Them_ChiTietDatHang_KhachHang("insert_Chitietdathang_Khachhang", dtGiohang.Rows[i]["sMaMH"].ToString(), int.Parse(dtGiohang.Rows[i]["iSoluong"].ToString()), int.Parse(dtGiohang.Rows[i]["iMaSize"].ToString()));
            //        }
            //        if (themDH > 0)
            //        {
            //            lbtnDonhangcuatoi.Visible = true;
            //            Response.Write("<script languague='javascript'>alert('Đặt hàng thành công, đơn hàng của bạn đang được xử lý !');window.location.href='Trangchu.aspx';</script>");
            //            dtGiohang.Clear();
            //        }
            //        else
            //            Response.Write("<script languague='javascript'> alert('Ngày giao hàng phải lớn hơn ngày hiện tại tối thiểu là 2 ngày !');</script>");
            //    }
            //}
            //else
            //{
                thanhtoan.Visible = true;
                lbtnXacnhan.Visible = true;
                lbtnThanhtoan.Visible = false;
                //}
        }

        protected void rptGiohang_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (Session["Giohang"] != null)
            {
                if (e.CommandName == "xoa")
                {
                    DataTable dtGiohang = new DataTable();
                    dtGiohang = (DataTable)Session["Giohang"];
                    foreach (DataRow dr in dtGiohang.Rows)
                    {
                        if (dr["sMaMH"].ToString() == e.CommandArgument.ToString())
                        {
                            dr.Delete();
                            break;
                        }
                    }
                    Session["Giohang"] = dtGiohang;
                    rptGiohang.DataSourceID = null;
                    rptGiohang.DataSource = dtGiohang;
                    rptGiohang.DataBind();

                    float tongtien = 0;
                    for (int i = 0; i < dtGiohang.Rows.Count; i++)
                    {
                        tongtien += float.Parse(dtGiohang.Rows[i]["fThanhtien"].ToString());
                    }
                    lbTongtien.Text = tongtien.ToString("00,0 đ");
                    lbSomathang.Text = dtGiohang.Rows.Count.ToString();

                }
            }
        }

        protected void lbtnXacnhan_Click(object sender, EventArgs e)
        {
            if (Session["Tendangnhap"] != null)
            {
                int themDH_THT = Model.model.insert_Dondathang_Khachhang_Tronghethong("insert_Dondathang_Khachhang_Tronghethong", Session["MaNV"].ToString(), txtHoten.Text, txtSdt.Text, Convert.ToDateTime(txtThoigiangiaohang.Text), txtDiachigiaohang.Text);
                if (themDH_THT > 0)
                {
                    DataTable dtGiohang = new DataTable();
                    dtGiohang = (DataTable)Session["Giohang"];
                    for (int i = 0; i < dtGiohang.Rows.Count; i++)
                    {
                        int themCTDH = Model.model.Them_ChiTietDatHang_KhachHang("insert_Chitietdathang_Khachhang", dtGiohang.Rows[i]["sMaMH"].ToString(), int.Parse(dtGiohang.Rows[i]["iSoluong"].ToString()), int.Parse(dtGiohang.Rows[i]["iMaSize"].ToString()));

                    }
                    if (themDH_THT > 0)
                    {
                        Response.Write("<script languague='javascript'>alert('Đặt hàng thành công, đơn hàng của bạn đang được xử lý !');window.location.href='Trangchu.aspx';</script>");
                        dtGiohang.Clear();
                    }
                    else
                        Response.Write("<script languague='javascript'> alert('Ngày giao hàng phải lớn hơn ngày hiện tại tối thiểu là 2 ngày !');</script>");
                }
                else
                    Response.Write("<script languague='javascript'> alert('Ngày giao hàng phải lớn hơn ngày hiện tại tối thiểu là 2 ngày !');</script>");
            }
            else
            {
                int themDH = Model.model.Them_DonHang_KhachHang_Ngoaihethong_ND("insert_Dondathang_Khachhang_Ngoaihethong_ND", txtHoten.Text, txtSdt.Text, txtDiachigiaohang.Text, Convert.ToDateTime(txtThoigiangiaohang.Text));
                if (themDH > 0)
                {
                    DataTable dtGiohang = new DataTable();
                    dtGiohang = (DataTable)Session["Giohang"];
                    for (int i = 0; i < dtGiohang.Rows.Count; i++)
                    {
                        int themCTDH = Model.model.Them_ChiTietDatHang_KhachHang("insert_Chitietdathang_Khachhang", dtGiohang.Rows[i]["sMaMH"].ToString(), int.Parse(dtGiohang.Rows[i]["iSoluong"].ToString()), int.Parse(dtGiohang.Rows[i]["iMaSize"].ToString()));
                    }
                    if (themDH > 0)
                    {
                        Response.Write("<script languague='javascript'>alert('Đặt hàng thành công, đơn hàng của bạn đang được xử lý !');window.location.href='Trangchu.aspx';</script>");
                        dtGiohang.Clear();
                    }
                    else
                        Response.Write("<script languague='javascript'> alert('Ngày giao hàng phải lớn hơn ngày hiện tại tối thiểu là 2 ngày !');</script>");
                }
                else
                    Response.Write("<script languague='javascript'> alert('Ngày giao hàng phải lớn hơn ngày hiện tại tối thiểu là 2 ngày !');</script>");
            }
        }

        protected void lbtnDonhangcuatoi_Click(object sender, EventArgs e)
        {
            donhangcuatoi.Visible = true;
        }
    }
}