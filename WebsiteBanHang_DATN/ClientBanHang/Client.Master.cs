using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace WebsiteBanHang_DATN.ClientBanHang
{
    public partial class Client : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                dangxuat.Visible = false;
                load_ttCuahang();
                if (Session["Tendangnhap"] != null)
                {
                    lbTendangnhap.Text = Session["Hoten"].ToString();
                    taikhoan.Visible = false;
                    dangxuat.Visible = true;
                }
                else
                {
                    dangxuat.Visible = false;
                }
                //if (txtSearch.Text == "")
                //{
                //    Response.Write("<script languague='javascript'> alert('Vui lòng nhập dữ liệu tìm kiếm !');</script>");
                //}
                //else
                //{
                //    //Response.Redirect("Timkiem.aspx?searchkey=" + search + "");
                //}
            }
        }
        private void load_ttCuahang()
        {
            DataTable tb = Model.model.getData("get_ttCuahang");
            rptCuahang.DataSourceID = null;
            rptCuahang.DataSource = tb;
            rptCuahang.DataBind();
        }

        protected void lbtnTimkiem_Click(object sender, EventArgs e)
        {
            if(txtTimkiem.Text == "")
            {
                Response.Write("<script languague='javascript'>alert('Bạn chưa nhập tên sản phẩm cần tìm kiếm !');window.location.href='Trangchu.aspx';</script>");
            }
            else
                Response.Write("<script languague='javascript'>window.location.href='Timkiem.aspx?searchkey=" + txtTimkiem.Text+ "&IDNsx=&IDLoaiMH=';</script>");
        }
    }
}