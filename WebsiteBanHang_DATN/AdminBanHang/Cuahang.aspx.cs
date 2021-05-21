using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebsiteBanHang_DATN.AdminBanHang
{
    public partial class Cuahang : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnXacnhan_Click(object sender, EventArgs e)
        {
            
           int i = Model.model.Them_CuaHang("insert_ttCuahang", txtTencuahang.Text,txtSdt.Text,txtEmail.Text,txtDiachi.Text,txtGiomocua.Text,txtGiodongcua.Text,txtMota.Text,txtTaikhoan.Text);
            if (i > 0)
            {
                Response.Write("<script languague='javascript'> alert('Thêm thông tin cửa hàng thành công !');window.location.href ='Trangchu.aspx';</script>");
            }
            else
                Response.Write("<script languague='javascript'> alert('Thêm thông tin cửa hàng thất bại !');</script>");
        }

        protected void btnCapnhat_Click(object sender, EventArgs e)
        {
            int i = Model.model.Them_CuaHang("insert_ttCuahang", txtTencuahang.Text, txtSdt.Text, txtEmail.Text, txtDiachi.Text, txtGiomocua.Text, txtGiodongcua.Text, txtMota.Text, txtTaikhoan.Text);
            if (i > 0)
            {
                Response.Write("<script languague='javascript'> alert('Thêm thông tin cửa hàng thành công !');window.location.href ='Trangchu.aspx';</script>");
            }
            else
                Response.Write("<script languague='javascript'> alert('Thêm thông tin cửa hàng thất bại !');</script>");
        }
    }
}