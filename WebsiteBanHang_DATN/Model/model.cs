using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace WebsiteBanHang_DATN.Model
{
    public class SqlConnectionData
    {

        // kết nối cơ sở dữ liệu
        public static SqlConnection Connect()
        {
            string strcon = @"Data Source=XUANTU\XUANTU;Initial Catalog=WebsiteBanHang_DATN_VER2;Integrated Security=True";
            SqlConnection conn = new SqlConnection(strcon); // khởi tạo connect;
            return conn;
        }
    }

    public class model
    {
        // checklogin
        public static SqlDataReader checklogin(string procedure ,string username, string password)
        {
            SqlConnection conn = SqlConnectionData.Connect();
            conn.Open();
            SqlCommand command = new SqlCommand(procedure, conn);
            command.CommandType = CommandType.StoredProcedure;
            command.Parameters.AddWithValue("@Tendangnhap", username);
            command.Parameters.AddWithValue("@Matkhau", password);
            command.Connection = conn;
            SqlDataReader reader = command.ExecuteReader();

            return reader;
        }
        public static int checklogin_Nguoidung(string username, string password)
        {
            SqlConnection conn = SqlConnectionData.Connect();
            conn.Open();
            SqlCommand command = new SqlCommand("pr_Dangnhap_Nguoidung", conn);
            command.CommandType = CommandType.StoredProcedure;
            command.Parameters.AddWithValue("@Tendangnhap", username);
            command.Parameters.AddWithValue("@Matkhau", password);
            command.Connection = conn;
            int ret = command.ExecuteNonQuery();
            return ret;
        }

        public static SqlDataReader get_CTDH(string procedure, string maDDH)
        {
            SqlConnection conn = SqlConnectionData.Connect();
            conn.Open();
            SqlCommand command = new SqlCommand(procedure, conn);
            command.CommandType = CommandType.StoredProcedure;
            command.Parameters.AddWithValue("@MaDDH", maDDH);
            command.Connection = conn;
            SqlDataReader reader = command.ExecuteReader();

            return reader;
        }

        public static SqlDataReader get_CTNH(string procedure, string maDNH)
        {
            SqlConnection conn = SqlConnectionData.Connect();
            conn.Open();
            SqlCommand command = new SqlCommand(procedure, conn);
            command.CommandType = CommandType.StoredProcedure;
            command.Parameters.AddWithValue("@MaDNH", maDNH);
            command.Connection = conn;
            SqlDataReader reader = command.ExecuteReader();

            return reader;
        }

        public static SqlDataReader get_TTKhachhang_theoID(string procedure, string maKH)
        {
            SqlConnection conn = SqlConnectionData.Connect();
            conn.Open();
            SqlCommand command = new SqlCommand(procedure, conn);
            command.CommandType = CommandType.StoredProcedure;
            command.Parameters.AddWithValue("@MaKH", maKH);
            command.Connection = conn;
            SqlDataReader reader = command.ExecuteReader();

            return reader;
        }

        public static int doiMatkhau(string username, string passold, string passnew)
        {
            SqlConnection conn = SqlConnectionData.Connect();
            conn.Open();
            SqlCommand command = new SqlCommand("get_doimatkhau", conn);
            command.CommandType = CommandType.StoredProcedure;
            command.Parameters.AddWithValue("@user", username);
            command.Parameters.AddWithValue("@passOld", passold);
            command.Parameters.AddWithValue("@passNew", passnew);
            command.Connection = conn;
            int ret = command.ExecuteNonQuery();
            return ret;
        }


        public static SqlDataReader getRow(string proc)
        {
            SqlConnection conn = SqlConnectionData.Connect();
            conn.Open();
            SqlCommand command = new SqlCommand(proc, conn);
            command.CommandType = CommandType.StoredProcedure;
            command.Connection = conn;
            SqlDataReader reader = command.ExecuteReader();
            return reader;
        }

        // hàm get dữ liệu
        public static DataTable getData(string proceduce)
        {
            SqlConnection Conn = SqlConnectionData.Connect();
            try
            {
                Conn.Open();
                DataTable dtb = new DataTable();
                SqlCommand cmd = new SqlCommand(proceduce, Conn);
                cmd.CommandType = CommandType.StoredProcedure;
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                SqlCommandBuilder builder = new SqlCommandBuilder(adapter); // cho phép  insert, update, delete gán cho adapter
                DataSet ds = new DataSet();
                adapter.Fill(ds); // đẩy câu lệnh vừa truy vấn được vào dataset
                return ds.Tables[0];
            }
            finally
            {
                Conn.Close();
            }
        }

        // hàm get dữ liệu
        public static DataTable getDataWhere(string id, string proceduce)
        {
            DataTable dtb = new DataTable();
            SqlConnection Conn = SqlConnectionData.Connect();
            Conn.Open();
            SqlCommand cmd = new SqlCommand(proceduce, Conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@id", id);
            SqlDataAdapter adapter = new SqlDataAdapter(cmd);
            SqlCommandBuilder builder = new SqlCommandBuilder(adapter); // cho phép  insert, update, delete gán cho adapter
            DataSet ds = new DataSet();
            adapter.Fill(ds); // đẩy câu lệnh vừa truy vấn được vào dataset
            return ds.Tables[0];
        }

        public static DataTable getDataWhere_2para(string id, string idnhanvien , string proceduce)
        {
            DataTable dtb = new DataTable();
            SqlConnection Conn = SqlConnectionData.Connect();
            Conn.Open();
            SqlCommand cmd = new SqlCommand(proceduce, Conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@id", id);
            cmd.Parameters.AddWithValue("@idnhanvien", idnhanvien);
            SqlDataAdapter adapter = new SqlDataAdapter(cmd);
            SqlCommandBuilder builder = new SqlCommandBuilder(adapter); // cho phép  insert, update, delete gán cho adapter
            DataSet ds = new DataSet();
            adapter.Fill(ds); // đẩy câu lệnh vừa truy vấn được vào dataset
            return ds.Tables[0];
        }

        //hàm đăng kí
        public static int getDangki(string ma, string taikhoan, string matkhau, string hoten, string email, string sdt, string quyen, string proceduce)
        {
            DataTable dtb = new DataTable();
            SqlConnection Conn = SqlConnectionData.Connect();
            Conn.Open();
            SqlCommand cmd = new SqlCommand(proceduce, Conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Connection = Conn;
            cmd.Parameters.AddWithValue("@MaTK", ma);
            cmd.Parameters.AddWithValue("@TaiKhoan", taikhoan);
            cmd.Parameters.AddWithValue("@MatKhau", matkhau);
            cmd.Parameters.AddWithValue("@Hoten", hoten);
            cmd.Parameters.AddWithValue("@Email", email);
            cmd.Parameters.AddWithValue("@Sdt", sdt);
            cmd.Parameters.AddWithValue("@quyen", quyen);
            int ret = cmd.ExecuteNonQuery();
            return ret;
        }

        public static int xacnhan_Donhang(string maDDH, string proceduce)
        {
            DataTable dtb = new DataTable();
            SqlConnection Conn = SqlConnectionData.Connect();
            Conn.Open();
            SqlCommand cmd = new SqlCommand(proceduce, Conn);
            SqlCommand cmnPXK = new SqlCommand("count_PXK", Conn);
            int count = (int)cmnPXK.ExecuteScalar() + 1;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@MaDonDatHang", maDDH);
            cmd.Parameters.AddWithValue("@MaPhieuXuatKho", "DDS-PXK-" +count.ToString());
            int ret = cmd.ExecuteNonQuery();
            return ret;
        }

        public static int boxacnhan_Donhang(string maDDH, string proceduce)
        {
            DataTable dtb = new DataTable();
            SqlConnection Conn = SqlConnectionData.Connect();
            Conn.Open();
            SqlCommand cmd = new SqlCommand(proceduce, Conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@MaDonDatHang", maDDH);
            int ret = cmd.ExecuteNonQuery();
            return ret;
        }

        // Hàm xóa bài viết
        public static int Xoa(string proc, string parameter, string value)
        {
            SqlConnection conn = SqlConnectionData.Connect();
            conn.Open();
            SqlCommand command = new SqlCommand(proc, conn);
            command.CommandType = CommandType.StoredProcedure;
            command.Parameters.AddWithValue(parameter, value);
            command.Connection = conn;
            int banghitacdong = command.ExecuteNonQuery();
            return banghitacdong;
        }
        public static int Sua_MatHang(string proceduce, string maMH, string tenMH, string hinhAnh, string donviTinh, string moTa, int maloaiMH, int maTrangthai)
        {
            SqlConnection Conn = SqlConnectionData.Connect();
            Conn.Open();
            SqlCommand cmd = new SqlCommand(proceduce, Conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Connection = Conn;
            cmd.Parameters.AddWithValue("@MaMH", maMH);
            cmd.Parameters.AddWithValue("@TenMH", tenMH);
            cmd.Parameters.AddWithValue("@Hinhanh", hinhAnh);
            cmd.Parameters.AddWithValue("@Donvitinh", donviTinh);
            cmd.Parameters.AddWithValue("@Mota", moTa);
            cmd.Parameters.AddWithValue("@MaLoaiMH", maloaiMH);
            cmd.Parameters.AddWithValue("@MaTrangThai", maTrangthai);
            int ret = cmd.ExecuteNonQuery();
            return ret;
        }

        public static int Them_MatHang(string proceduce, string tenMH, string hinhAnh, string donviTinh, string moTa, int maloaiMH, int maTrangthai)
        {
            SqlConnection Conn = SqlConnectionData.Connect();
            Conn.Open();
            SqlCommand cmd = new SqlCommand(proceduce, Conn);
            SqlCommand cmdMaMH = new SqlCommand("count_Mathang", Conn);
            int count = (int)cmdMaMH.ExecuteScalar() + 1;

            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Connection = Conn; 
            cmd.Parameters.AddWithValue("@MaMH", "DDS-MH-"+count.ToString());
            cmd.Parameters.AddWithValue("@TenMH", tenMH);
            cmd.Parameters.AddWithValue("@Hinhanh", hinhAnh);
            cmd.Parameters.AddWithValue("@Donvitinh", donviTinh);
            cmd.Parameters.AddWithValue("@Mota", moTa);
            cmd.Parameters.AddWithValue("@MaLoaiMH", maloaiMH);
            cmd.Parameters.AddWithValue("@MaTrangThai", maTrangthai);
            int ret = cmd.ExecuteNonQuery();
            return ret;
        }

        public static int Them_CuaHang(string proceduce, string tenCH, string sDT, string eMail, string diaChi,
            string gioMocua, string giocDongcua, string moTa, string tenDN)
        {
            SqlConnection Conn = SqlConnectionData.Connect();
            Conn.Open();
            SqlCommand cmd = new SqlCommand(proceduce, Conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Connection = Conn;
            cmd.Parameters.AddWithValue("@TenCuaHang", tenCH);
            cmd.Parameters.AddWithValue("@Sdt", sDT);
            cmd.Parameters.AddWithValue("@Email", eMail);
            cmd.Parameters.AddWithValue("@Diachi", diaChi);
            cmd.Parameters.AddWithValue("@Giomocua", gioMocua);
            cmd.Parameters.AddWithValue("@Giodongcua", giocDongcua);
            cmd.Parameters.AddWithValue("@Mota", moTa);
            cmd.Parameters.AddWithValue("@TenDangNhap", tenDN); 
            int ret = cmd.ExecuteNonQuery();
            return ret;
        }

        public static int Them_DonHang_KhachHang_Ngoaihethong(string proceduce, int maNV, string sTenKH, string sdt, string sDiachigiaohang, DateTime dNgaygiaohang)
        {
            SqlConnection Conn = SqlConnectionData.Connect();
            Conn.Open();
            SqlCommand cmd = new SqlCommand(proceduce, Conn);
            SqlCommand cmdDDH = new SqlCommand("count_DDH", Conn);
            int count = (int)cmdDDH.ExecuteScalar() + 1;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Connection = Conn;
            cmd.Parameters.AddWithValue("@MaDonDatHang", "DDS-DDH-"+count.ToString());
            cmd.Parameters.AddWithValue("@MaNV", maNV);
            cmd.Parameters.AddWithValue("@TenKH", sTenKH);
            cmd.Parameters.AddWithValue("@Sdt", sdt);
            cmd.Parameters.AddWithValue("@Diachigiaohang", sDiachigiaohang);
            cmd.Parameters.AddWithValue("@dNgaygiaohang", dNgaygiaohang);
            int ret = cmd.ExecuteNonQuery();
            return ret;
        }

        public static int Them_DonHang_KhachHang_Ngoaihethong_ND(string proceduce, string sTenKH, string sdt, string sDiachigiaohang, DateTime dNgaygiaohang)
        {
            SqlConnection Conn = SqlConnectionData.Connect();
            Conn.Open();
            SqlCommand cmd = new SqlCommand(proceduce, Conn);
            SqlCommand cmdDDH = new SqlCommand("count_DDH", Conn);
            int count = (int)cmdDDH.ExecuteScalar() + 1;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Connection = Conn;
            cmd.Parameters.AddWithValue("@MaDonDatHang", "DDS-DDH-" + count.ToString());
            cmd.Parameters.AddWithValue("@TenKH", sTenKH);
            cmd.Parameters.AddWithValue("@Sdt", sdt);
            cmd.Parameters.AddWithValue("@Diachigiaohang", sDiachigiaohang);
            cmd.Parameters.AddWithValue("@dNgaygiaohang", dNgaygiaohang);
            int ret = cmd.ExecuteNonQuery();
            return ret;
        }

        public static int xacnhan_Phieunhapkho(string proceduce, string maDNH, string maMH, int slNhap, int maSize)
        {
            SqlConnection Conn = SqlConnectionData.Connect();
            Conn.Open();
            SqlCommand cmd = new SqlCommand(proceduce, Conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Connection = Conn;
            cmd.Parameters.AddWithValue("@MaDonNhapHang", maDNH);
            cmd.Parameters.AddWithValue("@MaMH", maMH);
            cmd.Parameters.AddWithValue("@Soluongnhap", slNhap);
            cmd.Parameters.AddWithValue("@MaSize", maSize);
            int ret = cmd.ExecuteNonQuery();
            return ret;
        }

        public static int insert_Dondathang_Khachhang_Tronghethong(string proceduce, string maKH, string tenKH, string sdt, DateTime dNgaygiaohang, string diachigiaohang)
        {
            SqlConnection Conn = SqlConnectionData.Connect();
            Conn.Open();
            SqlCommand cmd = new SqlCommand(proceduce, Conn);
            SqlCommand cmdDDH = new SqlCommand("count_DDH", Conn);
            int count = (int)cmdDDH.ExecuteScalar() + 1;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Connection = Conn;
            cmd.Parameters.AddWithValue("@MaDonDatHang", "DDS-DDH-" + count.ToString());
            cmd.Parameters.AddWithValue("@MaKH", maKH);
            cmd.Parameters.AddWithValue("@TenKH", tenKH);
            cmd.Parameters.AddWithValue("@Sdt", sdt);
            cmd.Parameters.AddWithValue("@Diachigiaohang", diachigiaohang);
            cmd.Parameters.AddWithValue("@dNgaygiaohang", dNgaygiaohang);
            int ret = cmd.ExecuteNonQuery();
            return ret;
        }

        public static int insert_Chitietdathang_Khachhang_Ngoaihethong(string proceduce,string maDDH, string maMH, int slMua, int maSize)
        {
            SqlConnection Conn = SqlConnectionData.Connect();
            Conn.Open();
            SqlCommand cmd = new SqlCommand(proceduce, Conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Connection = Conn;
            cmd.Parameters.AddWithValue("@MaDonDatHang", maDDH);
            cmd.Parameters.AddWithValue("@MaMH", maMH);
            cmd.Parameters.AddWithValue("@SLMua", slMua);
            cmd.Parameters.AddWithValue("@MaSize", maSize);
            int ret = cmd.ExecuteNonQuery();
            return ret;
        }

        public static int xoa_Chitietdathang_Khachhang_Ngoaihethong(string proceduce, string maDDH, string maMH, int maSize)
        {
            SqlConnection Conn = SqlConnectionData.Connect();
            Conn.Open();
            SqlCommand cmd = new SqlCommand(proceduce, Conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Connection = Conn;
            cmd.Parameters.AddWithValue("@MaDonDatHang", maDDH);
            cmd.Parameters.AddWithValue("@MaMH", maMH);
            cmd.Parameters.AddWithValue("@MaSize", maSize);
            int ret = cmd.ExecuteNonQuery();
            return ret;
        }

        public static int xoa_Dondathang_KhongcoMH(string proceduce, string MaDDH)
        {
            SqlConnection Conn = SqlConnectionData.Connect();
            Conn.Open();
            SqlCommand cmd = new SqlCommand(proceduce, Conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Connection = Conn;
            cmd.Parameters.AddWithValue("@MaDDH", MaDDH);
            int ret = cmd.ExecuteNonQuery();
            return ret;
        }

        public static int Them_DonDatHang_KhachHang(string proceduce, string sMaKH)
        {
            SqlConnection Conn = SqlConnectionData.Connect();
            Conn.Open();
            SqlCommand cmd = new SqlCommand(proceduce, Conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Connection = Conn;
            cmd.Parameters.AddWithValue("@MaKH", sMaKH);
            int ret = cmd.ExecuteNonQuery();
            return ret;
        }
        public static int Them_ChiTietDatHang_KhachHang(string proceduce, string maMH, int slMua, int maSize)
        {
            SqlConnection Conn = SqlConnectionData.Connect();
            Conn.Open();
            SqlCommand cmd = new SqlCommand(proceduce, Conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Connection = Conn;
            cmd.Parameters.AddWithValue("@MaMH", maMH);
            cmd.Parameters.AddWithValue("@SLMua", slMua);
            cmd.Parameters.AddWithValue("@MaSize", maSize);
            int ret = cmd.ExecuteNonQuery();
            return ret;
        }

        public static int dangki_TKKhachhang(string proceduce, string tenKH, string sdt, string diachigiaohang, string tenDangnhap,
        string matKhau)
        {
            SqlConnection Conn = SqlConnectionData.Connect();
            Conn.Open();
            SqlCommand cmd = new SqlCommand(proceduce, Conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Connection = Conn;
            cmd.Parameters.AddWithValue("@TenKH", tenKH);
            cmd.Parameters.AddWithValue("@Sdt", sdt);
            cmd.Parameters.AddWithValue("@Diachigiaohang", diachigiaohang);
            cmd.Parameters.AddWithValue("@Tendangnhap", tenDangnhap);
            cmd.Parameters.AddWithValue("@Matkhau", matKhau);
            int ret = cmd.ExecuteNonQuery();
            return ret;
        }

        public static int pr_Suabaiviet(string proceduce, string id, int FK_MaLT, string sTenbaiviet, string sTieude, string sTomtatnoidung, string sNoidung, string FK_User_dang, string sNgaydang, string sAnhdaidien)
        {
            SqlConnection Conn = SqlConnectionData.Connect();
            Conn.Open();
            SqlCommand cmd = new SqlCommand(proceduce, Conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Connection = Conn;
            cmd.Parameters.AddWithValue("@PK_sMabaiviet", id);
            cmd.Parameters.AddWithValue("@FK_MaLT", FK_MaLT);
            cmd.Parameters.AddWithValue("@sTenbaiviet", sTenbaiviet);
            cmd.Parameters.AddWithValue("@sTieude", sTieude);
            cmd.Parameters.AddWithValue("@sTomtatnoidung", sTomtatnoidung);
            cmd.Parameters.AddWithValue("@sNoidung", sNoidung);
            cmd.Parameters.AddWithValue("@FK_User_dang", FK_User_dang);
            cmd.Parameters.AddWithValue("@sNgaydang", sNgaydang);
            cmd.Parameters.AddWithValue("@sAnhdaidien", sAnhdaidien);
            int ret = cmd.ExecuteNonQuery();
            return ret;
        }

        // gọi hàm tạo mã tự động ở đây

        public static string Create_Key(string key_noi, string key_where, string table)
        {
            //key_noi    = "'KH'";
            //key_where  = "sMaKH";
            //table      = "tbl_khachang";
            SqlConnection conn = SqlConnectionData.Connect();
            conn.Open();
            SqlCommand command = new SqlCommand();
            command.CommandType = CommandType.Text;
            string truyvan = "Select CONCAT(" + key_noi + ", RIGHT(CONCAT('0000',ISNULL(right(max(" + key_where + "),4),0) + 1),4)) as " + key_where + " from " + table + " where " + key_where + " like " + key_noi + "+'%' ";
            command.CommandText = truyvan;
            command.Connection = conn;
            object data = command.ExecuteScalar();
            string ma = data.ToString();
            return ma;
        }

        public static SqlDataReader getWhere(string id, string proceduce)
        {
            //"getBlog"
            SqlConnection conn = SqlConnectionData.Connect();
            conn.Open();
            SqlCommand command = new SqlCommand(proceduce, conn);
            command.CommandType = CommandType.StoredProcedure;
            command.Parameters.AddWithValue("@id", id);
            command.Connection = conn;
            SqlDataReader reader = command.ExecuteReader();
            return reader;
        }

        public static int capnhat_Trangthai_Mathang(string proceduce,string maMH, int maTrangthai)
        {
            SqlConnection Conn = SqlConnectionData.Connect();
            Conn.Open();
            SqlCommand cmd = new SqlCommand(proceduce, Conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Connection = Conn;
            cmd.Parameters.AddWithValue("@MaMH", maMH);
            cmd.Parameters.AddWithValue("@@MaTrangThai", maTrangthai);
            int ret = cmd.ExecuteNonQuery();
            return ret;
        }

        public static DataTable get_LoaiMH_theoDM(string proceduce, int maDM)
        {
            SqlConnection Conn = SqlConnectionData.Connect();
            Conn.Open();
            SqlCommand cmd = new SqlCommand(proceduce, Conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Connection = Conn;
            cmd.Parameters.AddWithValue("@id", maDM);
            SqlDataAdapter adapter = new SqlDataAdapter(cmd);
            SqlCommandBuilder builder = new SqlCommandBuilder(adapter); // cho phép  insert, update, delete gán cho adapter
            DataSet ds = new DataSet();
            adapter.Fill(ds); // đẩy câu lệnh vừa truy vấn được vào dataset
            return ds.Tables[0];
        }
        public static int them_Donnhaphang(string proceduce, int maNV, int maNSX)
        {
            SqlConnection Conn = SqlConnectionData.Connect();
            Conn.Open();
            SqlCommand cmd = new SqlCommand(proceduce, Conn);
            SqlCommand cmdMaDNH = new SqlCommand("count_DNH", Conn);
            int count = (int)cmdMaDNH.ExecuteScalar() + 1;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Connection = Conn;
            cmd.Parameters.AddWithValue("@MaDonDatHang", "DDS-DNH-" +count.ToString());
            cmd.Parameters.AddWithValue("@iMaNV", maNV);
            cmd.Parameters.AddWithValue("@iMaNSX", maNSX);
            int ret = cmd.ExecuteNonQuery();
            return ret;
        }

        public static int trumathang_KhicapnhatPXK(string proceduce, string maDondathang, string maMH, int slMua, int maSize)
        {
            SqlConnection Conn = SqlConnectionData.Connect();
            Conn.Open();
            SqlCommand cmd = new SqlCommand(proceduce, Conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Connection = Conn;
            cmd.Parameters.AddWithValue("@MaDonDatHang", maDondathang);
            cmd.Parameters.AddWithValue("@MaMH", maMH);
            cmd.Parameters.AddWithValue("@SLMua", slMua);
            cmd.Parameters.AddWithValue("@MaSize", maSize);
            int ret = cmd.ExecuteNonQuery();
            return ret;
        }

        public static int them_Chitiet_Donnhaphang(string proceduce, string maDNH, string maMH , float giaNhap ,int soluongNhap , float mucChietkhau, int maSize)
        {
            SqlConnection Conn = SqlConnectionData.Connect();
            Conn.Open();
            SqlCommand cmd = new SqlCommand(proceduce, Conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Connection = Conn;
            cmd.Parameters.AddWithValue("@DonNhapHang", maDNH);
            cmd.Parameters.AddWithValue("@MaMH", maMH);
            cmd.Parameters.AddWithValue("@Gianhap", giaNhap);
            cmd.Parameters.AddWithValue("@Soluongnhap", soluongNhap);
            cmd.Parameters.AddWithValue("@Mucchietkhau", mucChietkhau);
            cmd.Parameters.AddWithValue("@Masize", maSize); 
            int ret = cmd.ExecuteNonQuery();
            return ret;
        }

        public static int capnhat_chitietNhaphang(string proceduce, string maDNH, string maMH, float giaNhap, int soluongNhap, float mucChietkhau, int maSize)
        {
            SqlConnection Conn = SqlConnectionData.Connect();
            Conn.Open();
            SqlCommand cmd = new SqlCommand(proceduce, Conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Connection = Conn;
            cmd.Parameters.AddWithValue("@DonNhapHang", maDNH);
            cmd.Parameters.AddWithValue("@MaMH", maMH);
            cmd.Parameters.AddWithValue("@Gianhap", giaNhap);
            cmd.Parameters.AddWithValue("@Soluongnhap", soluongNhap);
            cmd.Parameters.AddWithValue("@Mucchietkhau", mucChietkhau);
            cmd.Parameters.AddWithValue("@Masize", maSize);
            int ret = cmd.ExecuteNonQuery();
            return ret;
        }

        public static int xoa_Donnhaphang(string proceduce, string maDNH, string maMH, int maSize)
        {
            SqlConnection Conn = SqlConnectionData.Connect();
            Conn.Open();
            SqlCommand cmd = new SqlCommand(proceduce, Conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Connection = Conn;
            cmd.Parameters.AddWithValue("@MaDonNhapHang", maDNH);
            cmd.Parameters.AddWithValue("@MaMH", maMH);
            cmd.Parameters.AddWithValue("@iMaSize", maSize);
            int ret = cmd.ExecuteNonQuery();
            return ret;
        }

        public static int xacnhan_Donnhaphang(string maDNH, string maNV, string proceduce)
        {
            SqlConnection Conn = SqlConnectionData.Connect();
            Conn.Open();
            SqlCommand cmd = new SqlCommand(proceduce, Conn);
            SqlCommand cmdMaPNK = new SqlCommand("count_PNK", Conn);
            int count = (int)cmdMaPNK.ExecuteScalar() + 1;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Connection = Conn;
            cmd.Parameters.AddWithValue("@MaDonNhapHang", maDNH);
            cmd.Parameters.AddWithValue("@PhieuNhapKho", "DDS-PNK-" + count.ToString());
            cmd.Parameters.AddWithValue("@MaNV", maNV);
            int ret = cmd.ExecuteNonQuery();
            return ret;
        }

        public static int boxacnhan_Donnhaphang(string maDNH, string proceduce)
        {
            SqlConnection Conn = SqlConnectionData.Connect();
            Conn.Open();
            SqlCommand cmd = new SqlCommand(proceduce, Conn);
            SqlCommand cmdMaPNK = new SqlCommand("count_PNK", Conn);
            int count = (int)cmdMaPNK.ExecuteScalar() + 1;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Connection = Conn;
            cmd.Parameters.AddWithValue("@MaDonNhapHang", maDNH);
            int ret = cmd.ExecuteNonQuery();
            return ret;
        }

        public static int capnhat_Taikhoan(string proceduce, string tenDN, string mk, int maTT, int maQuyen, int maNV, string tenNV,
            string gioiTinh, DateTime ngaySinh, string sDT, string queQuan, string eMail, DateTime ngayVaolam)
        {
            SqlConnection Conn = SqlConnectionData.Connect();
            Conn.Open();
            SqlCommand cmd = new SqlCommand(proceduce, Conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Connection = Conn;
            cmd.Parameters.AddWithValue("@Tendangnhap", tenDN);
            cmd.Parameters.AddWithValue("@Matkhau", mk);
            cmd.Parameters.AddWithValue("@MaTrangThai", maTT);
            cmd.Parameters.AddWithValue("@MaQuyen", maQuyen);
            cmd.Parameters.AddWithValue("@MaNV", maNV);
            cmd.Parameters.AddWithValue("@TenNV", tenNV);
            cmd.Parameters.AddWithValue("@Gioitinh", gioiTinh);
            cmd.Parameters.AddWithValue("@Ngaysinh", ngaySinh);
            cmd.Parameters.AddWithValue("@Sdt", sDT);
            cmd.Parameters.AddWithValue("@Quequan", queQuan);
            cmd.Parameters.AddWithValue("@Email", eMail);
            cmd.Parameters.AddWithValue("@Ngayvaolam", ngayVaolam);
            int ret = cmd.ExecuteNonQuery();
            return ret;
        }
    }
}