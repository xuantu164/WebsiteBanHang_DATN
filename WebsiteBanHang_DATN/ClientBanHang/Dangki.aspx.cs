using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebsiteBanHang_DATN.ClientBanHang
{
    public partial class Dangki : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnDangki_Click(object sender, EventArgs e)
        {
            int i = Model.model.dangki_TKKhachhang("dangki_TKKhachhang",txtHoten.Text,txtSdt.Text,txtDiachi.Text,txtTaikhoan.Text,txtMatkhau.Text);
            
            if (i > 0)
            {
                 Response.Write("<script languague='javascript'>alert('Đăng ký tài khoản thành công, vui lòng đăng nhập để tiếp tục sử dụng !');window.location.href='Dangnhap.aspx';</script>");
            }
            else
            {
                 Response.Write("<script languague='javascript'>alert('Tài khoản đã có, vui lòng nhập lại !');</script>");
                 txtTaikhoan.Focus();
            }
        }
    }
}