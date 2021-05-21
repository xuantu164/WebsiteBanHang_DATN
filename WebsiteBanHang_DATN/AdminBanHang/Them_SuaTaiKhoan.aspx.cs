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
    public partial class Them_SuaTaiKhoan : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                load_Trangthai_Taikhoan();
                load_dsQuyen();
                load_dsTaikhoan();
                if (Request.QueryString["mode"] == "them")
                {
                    btnCapnhat.Visible = false;
                    btnXacnhan.Visible = true;
                }
            }
        }
        private void load_dsTaikhoan()
        {
            if (Request.QueryString["Tendangnhap"] != "")
            {
                DataTable tb = Model.model.getDataWhere(Request.QueryString["Tendangnhap"].ToString(), "getTaikhoan_theoID");
                foreach (DataRow row in tb.Rows)
                {
                    txtTaikhoan.Text = row["sTendangnhap"].ToString();
                    txtHoten.Text = row["sTenNV"].ToString();
                    txtMatkhau.Text = row["sMatKhau"].ToString();
                    txtEmail.Text = row["sEmail"].ToString();
                    txtSdt.Text = row["sSdt"].ToString();
                    txtNgaysinh.Text = row["dNgaySinh"].ToString();
                    txtGioitinh.Text = row["sGioitinh"].ToString();
                    ddlTrangthai.SelectedValue = row["iMaTrangThai"].ToString();
                    ddlQuyen.SelectedValue = row["iMaQuyen"].ToString();
                    txtNgayvaolam.Text = row["dNgayvaolam"].ToString();
                    txtQuequan.Text = row["sQuequan"].ToString();
                }
            }
        }

        private void load_Trangthai_Taikhoan()
        {
            DataTable tb = Model.model.getData("get_dsTrangthai_Taikhoan");
            ddlTrangthai.DataSourceID = null;
            ddlTrangthai.DataSource = tb;
            ddlTrangthai.DataTextField = "sTenTrangThai";
            ddlTrangthai.DataValueField = "iMaTrangThai";
            ddlTrangthai.DataBind();
        }

        private void load_dsQuyen()
        {
            DataTable tb = Model.model.getData("get_dsQuyen");
            ddlQuyen.DataSourceID = null;
            ddlQuyen.DataSource = tb;
            ddlQuyen.DataTextField = "sTenQuyen";
            ddlQuyen.DataValueField = "iMaQuyen";
            ddlQuyen.DataBind();
        }

        protected void btnCapnhat_Click(object sender, EventArgs e)
        {
            int qt = Model.model.capnhat_Taikhoan("update_dsTaikhoan",Request.QueryString["Tendangnhap"].ToString(),txtMatkhau.Text,int.Parse(ddlTrangthai.SelectedValue), int.Parse(ddlQuyen.SelectedValue), int.Parse(Request.QueryString["MaNV"].ToString()) ,txtHoten.Text,txtGioitinh.Text, Convert.ToDateTime(txtNgaysinh.Text),txtSdt.Text, txtQuequan.Text, txtEmail.Text, Convert.ToDateTime(txtNgayvaolam.Text));
            if (qt > 0)
            {
                Response.Write("<script languague='javascript'> alert('Cập nhật thông tin tài khoản thành công !');window.location.href ='Taikhoan.aspx'</script>");
            }
            else
            {
                Response.Write("<script languague='javascript'> alert('Cập nhật thông tin tài khoản thất bại !');</script>");
            }
        }

        //protected void btnXoa_Click(object sender, EventArgs e)
        //{
        //    int qt = Model.model.Xoa("xoa_dsTaikhoan", "@Tendangnhap", Request.QueryString["Tendangnhap"].ToString());
        //    if (qt > 0)
        //    {
        //        Response.Write("<script languague='javascript'> alert('Xóa tài khoản thành công !');window.location.href ='Taikhoan.aspx'</script>");
        //    }
        //    else
        //    {
        //        Response.Write("<script languague='javascript'> alert('Xóa tài khoản không thành công !');</script>");
        //    }
        //}

        protected void btnXacnhan_Click(object sender, EventArgs e)
        {

        }

        protected void btnQuaylai_Click(object sender, EventArgs e)
        {
            Response.Redirect("Taikhoan.aspx");
        }


        //protected void btnCapnhat_Click(object sender, EventArgs e)
        //{
        //    int i = Model.model.Sua_MatHang("pr_Capnhat_DsMathang", int.Parse(Request.QueryString["IDMathang"].ToString()), txtTenMH.Text, float.Parse(txtDongia.Text), int.Parse(txtSoluong.Text), txtDonvitinh.Text, txtMota.Text, int.Parse(ddlNSX.SelectedValue), int.Parse(ddlLoaiMH.SelectedValue));
        //    if (i > 0)
        //    {
        //        Response.Write("<script languague='javascript'> alert('Cập nhập thông tin mặt hàng thành công !');window.location.href ='Mathang.aspx';</script>");
        //    }
        //    else
        //        Response.Write("<script languague='javascript'> alert('Cập nhập thông tin mặt hàng không thành công !');</script>");
        //}

        //protected void btnXoa_Click(object sender, EventArgs e)
        //{

        //}

        //protected void btnQuaylai_Click(object sender, EventArgs e)
        //{
        //    Response.Redirect("Mathang.aspx");
        //}

        //protected void btnXacnhan_Click(object sender, EventArgs e)
        //{
        //    string fn = System.IO.Path.GetFileName(fuMH.PostedFile.FileName);
        //    int i = Model.model.Them_MatHang("pr_Them_DsMathang", txtTenMH.Text, fn, float.Parse(txtDongia.Text), int.Parse(txtSoluong.Text), txtDonvitinh.Text, txtMota.Text, int.Parse(ddlNSX.SelectedValue), int.Parse(ddlLoaiMH.SelectedValue));
        //    if (i > 0)
        //    {
        //        Response.Write("<script languague='javascript'> alert('Thêm mặt hàng thành công !');window.location.href = 'Mathang.aspx';</script>");
        //    }
        //    else
        //        Response.Write("<script languague='javascript'> alert('Thêm mặt hàng không thành công !');</script>");
        //}

        //protected void btnThemLoaiMH_Click(object sender, EventArgs e)
        //{

        //}
    }
}