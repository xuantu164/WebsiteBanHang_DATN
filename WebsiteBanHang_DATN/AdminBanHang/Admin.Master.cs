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
    public partial class Admin : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                lbNgay.Text = DateTime.Now.ToString("yyyy/MM/dd");
                load_dsTrangthai_Donhang();
                load_dsTrangthai_Nhaphang();
                load_dsTrangthai_PNK();
                load_dsTrangthai_PXK();
                if (Session["Tendangnhap"] != "")
                {
                    lbTenquyen.Text = Session["Tenquyen"].ToString();
                    lbTendangnhap2.Text = Session["Hoten"].ToString();
                    if (Session["Maquyen"].ToString() == "2")
                    {
                        infor_cuahang.Visible = true;
                    }
                    else
                    {
                        infor_cuahang.Visible = false;
                    }
                }
            }
            
        }

        private void load_dsTrangthai_Donhang()
        {
            DataTable tb = Model.model.getData("get_dsTrangthai_DDH");
            rptTrangthai_Donhang.DataSourceID = null;
            rptTrangthai_Donhang.DataSource = tb;
            rptTrangthai_Donhang.DataBind();
        }

        private void load_dsTrangthai_Nhaphang()
        {
            DataTable tb = Model.model.getData("get_dsTrangthai_DNH");
            rptTrangthai_Nhaphang.DataSourceID = null;
            rptTrangthai_Nhaphang.DataSource = tb;
            rptTrangthai_Nhaphang.DataBind();
        }

        private void load_dsTrangthai_PNK()
        {
            DataTable tb = Model.model.getData("get_dsTrangthai_theoPNK");
            rptTrangthai_Phieunhapkho.DataSourceID = null;
            rptTrangthai_Phieunhapkho.DataSource = tb;
            rptTrangthai_Phieunhapkho.DataBind();
        }

        private void load_dsTrangthai_PXK()
        {
            DataTable tb = Model.model.getData("load_Trangthai_Phieuxuatkho");
            rptTrangthai_Phieuxuatkho.DataSourceID = null;
            rptTrangthai_Phieuxuatkho.DataSource = tb;
            rptTrangthai_Phieuxuatkho.DataBind();
        }
    }
}