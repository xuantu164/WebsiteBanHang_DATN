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
    public partial class Dangnhap : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if(Session["Tendangnhap"] != null)
                {
                    if (Request.QueryString["mode"] != null && Request.QueryString["mode"] == "logout")
                    {
                        Session["Tendangnhap"] = null;
                        Session.Abandon();
                        Response.Write("<script languague='javascript'>window.location.href='Trangchu.aspx';</script>");
                    }
                }
            }
        }

        protected void btnDangnhap_Click(object sender, EventArgs e)
        {
            //if (Session["Tendangnhap"] == null)
            //{
            //    int i = Model.model.checklogin_Nguoidung(txtTaikhoan.Text, txtMatkhau.Text);
            //    if (i > 0)
            //    {
            //        Session["Tendangnhap"]= txtTaikhoan.Text;
            //        Response.Write("<script languague='javascript'> window.location.href='Trangchu.aspx';</script>");
            //    }
            //    else
            //        Response.Write("<script languague='javascript'> alert('Tài khoản hoặc mật khẩu không chính xác, vui lòng thử lại !');</script>");
            //}
                SqlDataReader reader = Model.model.checklogin("pr_Dangnhap_ND", txtTaikhoan.Text, txtMatkhau.Text);
                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        Session["Tendangnhap"] = reader["sTenDangNhap"];
                        Session["MaNV"] = reader["iMaKH"];
                        Session["Hoten"] = reader["sTenKH"];
                        Session["Matkhau"] = reader["sMatkhau"];
                        Session["Maquyen"] = reader["iMaQuyen"];
                        Session["Tenquyen"] = reader["sTenQuyen"];
                        Session["Matrangthai"] = reader["iMaTrangThai"];
                    }
                    if (Session["Matrangthai"].ToString() != "1")
                    {
                        Response.Write("<script languague='javascript'> alert('Tài khoản của bạn không được phép hoạt động, vui lòng liên hệ với quản trị viên !')</script>");
                    }
                    else
                    {
                        if (Session["Maquyen"].ToString() == "6")
                        {
                            Response.Write("<script languague='javascript'>window.location.href ='Trangchu.aspx';</script>");
                            reader.Close();
                    }
                        else
                        {
                            Response.Write("<script languague='javascript'> alert('Tài khoản, mật khẩu không chính xác vui lòng kiểm tra lại thông tin !')</script>");
                    }
                        
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