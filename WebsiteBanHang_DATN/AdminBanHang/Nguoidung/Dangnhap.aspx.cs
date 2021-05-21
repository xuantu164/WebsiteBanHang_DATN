using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace WebsiteBanHang_DATN.AdminBanHang.Login
{
    public partial class Dangnhap : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["mode"] != null && Request.QueryString["mode"] == "logout")
                {
                    //Session.Abandon();
                    Session["Tendangnhap"] = null;
                    Response.Write("<script languague='javascript'>window.location.href ='../Nguoidung/Dangnhap.aspx';</script>");
                }
            }
        }

        protected void btnDangnhap_Click(object sender, EventArgs e)
        {
            if (Session["Tendangnhap"] != "")
            {
                SqlDataReader reader = Model.model.checklogin("pr_Dangnhap_NV", txtTaikhoan.Text, txtMatkhau.Text);
                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        Session["Tendangnhap"] = reader["sTenDangNhap"];
                        Session["MaNV"] = reader["iMaNV"];
                        Session["Hoten"] = reader["sTenNV"];
                        Session["Matkhau"] = reader["sMatKhau"];
                        Session["Maquyen"] = reader["iMaQuyen"];
                        Session["Tenquyen"] = reader["sTenQuyen"];
                        Session["Matrangthai"] = reader["iMaTrangThai"];
                    }
                    if(Session["Matrangthai"].ToString() != "1")
                    {
                        Response.Write("<script languague='javascript'> alert('Tài khoản của bạn không được phép hoạt động, vui lòng liên hệ với quản trị viên !')</script>");
                    }
                    else
                    {
                        Response.Write("<script languague='javascript'>window.location.href ='../Trangchu.aspx';</script>");
                        reader.Close();
                    }
                }
                else
                {
                    Response.Write("<script languague='javascript'> alert('Tài khoản, mật khẩu không chính xác, vui lòng kiểm tra lại thông tin !')</script>");
                    txtTaikhoan.Focus();
                }
            }
        }
    }
}