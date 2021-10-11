USE [master]
GO
/****** Object:  Database [WebsiteBanHang_DATN_VER2]    Script Date: 11/10/2021 20:02:07 ******/
CREATE DATABASE [WebsiteBanHang_DATN_VER2]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'WebsiteBanHang_DATN_VER2', FILENAME = N'D:\TAI LIEU HOC TAP\DO AN TOT NGHIEP\DO AN TOT NGHIEP\WebsiteBanHang_DATN_VER2.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'WebsiteBanHang_DATN_VER2_log', FILENAME = N'D:\TAI LIEU HOC TAP\DO AN TOT NGHIEP\DO AN TOT NGHIEP\WebsiteBanHang_DATN_VER2_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [WebsiteBanHang_DATN_VER2] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [WebsiteBanHang_DATN_VER2].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [WebsiteBanHang_DATN_VER2] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [WebsiteBanHang_DATN_VER2] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [WebsiteBanHang_DATN_VER2] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [WebsiteBanHang_DATN_VER2] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [WebsiteBanHang_DATN_VER2] SET ARITHABORT OFF 
GO
ALTER DATABASE [WebsiteBanHang_DATN_VER2] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [WebsiteBanHang_DATN_VER2] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [WebsiteBanHang_DATN_VER2] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [WebsiteBanHang_DATN_VER2] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [WebsiteBanHang_DATN_VER2] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [WebsiteBanHang_DATN_VER2] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [WebsiteBanHang_DATN_VER2] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [WebsiteBanHang_DATN_VER2] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [WebsiteBanHang_DATN_VER2] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [WebsiteBanHang_DATN_VER2] SET  ENABLE_BROKER 
GO
ALTER DATABASE [WebsiteBanHang_DATN_VER2] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [WebsiteBanHang_DATN_VER2] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [WebsiteBanHang_DATN_VER2] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [WebsiteBanHang_DATN_VER2] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [WebsiteBanHang_DATN_VER2] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [WebsiteBanHang_DATN_VER2] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [WebsiteBanHang_DATN_VER2] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [WebsiteBanHang_DATN_VER2] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [WebsiteBanHang_DATN_VER2] SET  MULTI_USER 
GO
ALTER DATABASE [WebsiteBanHang_DATN_VER2] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [WebsiteBanHang_DATN_VER2] SET DB_CHAINING OFF 
GO
ALTER DATABASE [WebsiteBanHang_DATN_VER2] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [WebsiteBanHang_DATN_VER2] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [WebsiteBanHang_DATN_VER2] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [WebsiteBanHang_DATN_VER2] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [WebsiteBanHang_DATN_VER2] SET QUERY_STORE = OFF
GO
USE [WebsiteBanHang_DATN_VER2]
GO
/****** Object:  Table [dbo].[tblNhaSanXuat]    Script Date: 11/10/2021 20:02:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblNhaSanXuat](
	[iMaNSX] [int] IDENTITY(1,1) NOT NULL,
	[sTenNSX] [nvarchar](100) NOT NULL,
	[sDiachi] [nvarchar](100) NULL,
	[sSdt] [varchar](20) NULL,
	[dThoigiantao] [datetime] NULL,
	[dThoigiansua] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[iMaNSX] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblDonNhapHang]    Script Date: 11/10/2021 20:02:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblDonNhapHang](
	[sMaDonNhapHang] [varchar](10) NOT NULL,
	[iMaNV] [int] NOT NULL,
	[iMaNSX] [int] NOT NULL,
	[dNgaynhap] [datetime] NULL,
	[dThoigiantao] [datetime] NULL,
	[dThoigiansua] [datetime] NULL,
	[iMaTrangThai] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[sMaDonNhapHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblChiTietNhapHang]    Script Date: 11/10/2021 20:02:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblChiTietNhapHang](
	[sMaDonNhapHang] [varchar](10) NOT NULL,
	[sMaMH] [varchar](10) NOT NULL,
	[fGianhap] [float] NOT NULL,
	[iSoluongnhap] [int] NOT NULL,
	[iMaSize] [int] NOT NULL,
	[fMucchietkhau] [float] NULL,
	[dThoigiantao] [datetime] NULL,
	[dThoigiansua] [datetime] NULL,
 CONSTRAINT [PK_Primar] PRIMARY KEY CLUSTERED 
(
	[sMaDonNhapHang] ASC,
	[sMaMH] ASC,
	[iMaSize] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vw_MH_theoNSX]    Script Date: 11/10/2021 20:02:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_MH_theoNSX]
	AS
		SELECT tblNhaSanXuat.iMaNSX,sTenNSX,sMaMH,COUNT(sMaMH) AS [SL]
		FROM tblNhaSanXuat,tblChiTietNhapHang,tblDonNhapHang
		WHERE tblDonNhapHang.sMaDonNhapHang = tblChiTietNhapHang.sMaDonNhapHang 
		AND tblNhaSanXuat.iMaNSX = tblDonNhapHang.iMaNSX 
		GROUP BY tblNhaSanXuat.iMaNSX,sTenNSX,sMaMH
GO
/****** Object:  Table [dbo].[tblMatHang]    Script Date: 11/10/2021 20:02:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblMatHang](
	[sMaMH] [varchar](10) NOT NULL,
	[sTenMH] [nvarchar](100) NOT NULL,
	[sHinhanh] [varchar](50) NOT NULL,
	[sDonvitinh] [nvarchar](10) NOT NULL,
	[sMota] [nvarchar](255) NOT NULL,
	[iMaLoaiMH] [int] NOT NULL,
	[dThoigiantao] [datetime] NULL,
	[dThoigiansua] [datetime] NULL,
	[iMaTrangThai] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[sMaMH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblChiTietDatHang]    Script Date: 11/10/2021 20:02:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblChiTietDatHang](
	[sMaDonDatHang] [varchar](10) NOT NULL,
	[sMaMH] [varchar](10) NOT NULL,
	[iSLMua] [int] NOT NULL,
	[iMaKM] [int] NULL,
	[dThoigiantao] [datetime] NULL,
	[dThoigiansua] [datetime] NULL,
	[iMaSize] [int] NOT NULL,
 CONSTRAINT [PK_CTDH] PRIMARY KEY CLUSTERED 
(
	[sMaDonDatHang] ASC,
	[sMaMH] ASC,
	[iMaSize] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vw_chitietDonhang]    Script Date: 11/10/2021 20:02:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--view lay chi tiet don hang 
CREATE VIEW [dbo].[vw_chitietDonhang]
AS
	SELECT sMaDonDatHang,fGianhap,iSLMua,(fGianhap*iSLMua) AS [fThanhtien]
	FROM tblChiTietNhapHang,tblChiTietDatHang,tblMatHang
	WHERE tblChiTietNhapHang.sMaMH = tblMatHang.sMaMH AND tblChiTietDatHang.sMaMH = tblMatHang.sMaMH
	GROUP BY sMaDonDatHang,fGianhap,iSLMua
GO
/****** Object:  Table [dbo].[tblNhanVien]    Script Date: 11/10/2021 20:02:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblNhanVien](
	[iMaNV] [int] IDENTITY(1,1) NOT NULL,
	[sTenNV] [nvarchar](50) NOT NULL,
	[sGioitinh] [nvarchar](5) NULL,
	[dNgaysinh] [datetime] NULL,
	[sSdt] [varchar](20) NULL,
	[sQuequan] [nvarchar](20) NULL,
	[sEmail] [varchar](50) NULL,
	[dNgayvaolam] [datetime] NULL,
	[sTenDangNhap] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[iMaNV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vw_chitietDonnhaphang]    Script Date: 11/10/2021 20:02:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_chitietDonnhaphang]
AS
	SELECT tblDonNhapHang.sMaDonNhapHang,fGianhap,iSoluongnhap,fMucchietkhau,(fGianhap*iSoluongnhap) AS [fThanhtien],((fGianhap*iSoluongnhap) - (fGianhap*iSoluongnhap*(fMucchietkhau/100))) AS [fThanhtien_Sauchietkhau]
	FROM tblDonNhapHang,tblNhaSanXuat,tblNhanVien,tblChiTietNhapHang,tblMatHang
	WHERE tblNhanVien.iMaNV = tblDonNhapHang.iMaNV AND tblDonNhapHang.sMaDonNhapHang = tblChiTietNhapHang.sMaDonNhapHang 
		AND tblChiTietNhapHang.sMaMH = tblMatHang.sMaMH AND tblNhaSanXuat.iMaNSX = tblDonNhapHang.iMaNSX
GO
/****** Object:  Table [dbo].[tblDanhMuc]    Script Date: 11/10/2021 20:02:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblDanhMuc](
	[iMaDM] [int] IDENTITY(1,1) NOT NULL,
	[sTenDM] [nvarchar](50) NOT NULL,
	[dThoigiantao] [datetime] NULL,
	[dThoigiansua] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[iMaDM] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblDonDatHang]    Script Date: 11/10/2021 20:02:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblDonDatHang](
	[sMaDonDatHang] [varchar](10) NOT NULL,
	[iMaNV] [int] NOT NULL,
	[iMaKH] [int] NOT NULL,
	[dNgaydathang] [datetime] NULL,
	[dNgaygiaohang] [datetime] NULL,
	[sDiachigiaohang] [nvarchar](100) NULL,
	[dThoigiantao] [datetime] NULL,
	[dThoigiansua] [datetime] NULL,
	[iMaTrangThai] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[sMaDonDatHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblHeThong]    Script Date: 11/10/2021 20:02:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblHeThong](
	[sMaCuaHang] [varchar](50) NOT NULL,
	[sTenCuaHang] [nvarchar](255) NOT NULL,
	[sSdt] [varchar](20) NULL,
	[sEmail] [varchar](50) NULL,
	[sDiaChi] [nvarchar](255) NULL,
	[sGioMoCua] [varchar](10) NULL,
	[sGioDongCua] [varchar](10) NULL,
	[sMoTa] [nvarchar](255) NULL,
	[sTenDangNhap] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[sMaCuaHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblKhachHang]    Script Date: 11/10/2021 20:02:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblKhachHang](
	[iMaKH] [int] IDENTITY(1,1) NOT NULL,
	[sTenKH] [nvarchar](100) NOT NULL,
	[sSdt] [varchar](20) NULL,
	[dNgaysinh] [datetime] NULL,
	[sGioitinh] [nvarchar](5) NULL,
	[sEmail] [varchar](50) NULL,
	[sDiachi] [nvarchar](100) NULL,
	[sTenDangNhap] [varchar](50) NULL,
	[dThoigiantao] [datetime] NULL,
	[dThoigiansua] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[iMaKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblKho]    Script Date: 11/10/2021 20:02:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblKho](
	[iMaKho] [int] IDENTITY(1,1) NOT NULL,
	[sMaMH] [varchar](10) NOT NULL,
	[iSoluong] [int] NOT NULL,
	[iMaSize] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[iMaKho] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblKhuyenMai]    Script Date: 11/10/2021 20:02:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblKhuyenMai](
	[iMaKM] [int] IDENTITY(1,1) NOT NULL,
	[sTenKM] [nvarchar](255) NULL,
	[sMota] [nvarchar](255) NULL,
	[sDonvitinh] [nvarchar](10) NULL,
	[dThoigianbatdau] [datetime] NULL,
	[dThoigianketthuc] [datetime] NULL,
	[dThoigiantao] [datetime] NULL,
	[dThoigiansua] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[iMaKM] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblLoaiMatHang]    Script Date: 11/10/2021 20:02:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblLoaiMatHang](
	[iMaLoaiMH] [int] IDENTITY(1,1) NOT NULL,
	[sTenLoaiMH] [nvarchar](50) NOT NULL,
	[dThoigiantao] [datetime] NULL,
	[dThoigiansua] [datetime] NULL,
	[iMaDM] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[iMaLoaiMH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblLoaiTrangThai]    Script Date: 11/10/2021 20:02:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblLoaiTrangThai](
	[iMaLoaiTrangThai] [int] IDENTITY(1,1) NOT NULL,
	[sTenLoaiTrangThai] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[iMaLoaiTrangThai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblPhieuNhapKho]    Script Date: 11/10/2021 20:02:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblPhieuNhapKho](
	[sMaPhieuNhapKho] [varchar](10) NOT NULL,
	[iMaNV] [int] NOT NULL,
	[dNgaynhapkho] [datetime] NULL,
	[dThoigiantao] [datetime] NULL,
	[dThoigiansua] [datetime] NULL,
	[iMaTrangThai] [int] NOT NULL,
	[iMaKho] [int] NOT NULL,
	[sMaDonNhapHang] [varchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[sMaPhieuNhapKho] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblPhieuXuatKho]    Script Date: 11/10/2021 20:02:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblPhieuXuatKho](
	[sMaPhieuXuatKho] [varchar](10) NOT NULL,
	[iMaNV] [int] NOT NULL,
	[dNgayxuat] [datetime] NULL,
	[dThoigiantao] [datetime] NULL,
	[dThoigiansua] [datetime] NULL,
	[iMaTrangThai] [int] NOT NULL,
	[iMaKho] [int] NOT NULL,
	[sMaDonDatHang] [varchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[sMaPhieuXuatKho] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblQuyen]    Script Date: 11/10/2021 20:02:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblQuyen](
	[iMaQuyen] [int] IDENTITY(1,1) NOT NULL,
	[sTenQuyen] [nvarchar](50) NULL,
	[dThoigiantao] [datetime] NULL,
	[dThoigiansua] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[iMaQuyen] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblSize]    Script Date: 11/10/2021 20:02:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblSize](
	[iMaSize] [int] IDENTITY(1,1) NOT NULL,
	[sTenSize] [varchar](5) NULL,
	[sChieucao] [varchar](20) NULL,
	[sCannang] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[iMaSize] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblTaiKhoan]    Script Date: 11/10/2021 20:02:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblTaiKhoan](
	[sTenDangNhap] [varchar](50) NOT NULL,
	[sMatKhau] [varchar](50) NOT NULL,
	[sAnhdaidien] [varchar](20) NULL,
	[iMaTrangThai] [int] NOT NULL,
	[iMaQuyen] [int] NOT NULL,
	[dThoigiantao] [datetime] NULL,
	[dThoigiansua] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[sTenDangNhap] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblTrangThai]    Script Date: 11/10/2021 20:02:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblTrangThai](
	[iMaTrangThai] [int] IDENTITY(1,1) NOT NULL,
	[sTenTrangThai] [nvarchar](50) NULL,
	[iMaLoaiTrangThai] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[iMaTrangThai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblChiTietDatHang]  WITH CHECK ADD  CONSTRAINT [FK_MaDonDatHang] FOREIGN KEY([sMaDonDatHang])
REFERENCES [dbo].[tblDonDatHang] ([sMaDonDatHang])
GO
ALTER TABLE [dbo].[tblChiTietDatHang] CHECK CONSTRAINT [FK_MaDonDatHang]
GO
ALTER TABLE [dbo].[tblChiTietDatHang]  WITH CHECK ADD  CONSTRAINT [FK_MaKM] FOREIGN KEY([iMaKM])
REFERENCES [dbo].[tblKhuyenMai] ([iMaKM])
GO
ALTER TABLE [dbo].[tblChiTietDatHang] CHECK CONSTRAINT [FK_MaKM]
GO
ALTER TABLE [dbo].[tblChiTietDatHang]  WITH CHECK ADD  CONSTRAINT [FK_MaMH_CTDH] FOREIGN KEY([sMaMH])
REFERENCES [dbo].[tblMatHang] ([sMaMH])
GO
ALTER TABLE [dbo].[tblChiTietDatHang] CHECK CONSTRAINT [FK_MaMH_CTDH]
GO
ALTER TABLE [dbo].[tblChiTietDatHang]  WITH CHECK ADD  CONSTRAINT [FK_MaSize_CTDH] FOREIGN KEY([iMaSize])
REFERENCES [dbo].[tblSize] ([iMaSize])
GO
ALTER TABLE [dbo].[tblChiTietDatHang] CHECK CONSTRAINT [FK_MaSize_CTDH]
GO
ALTER TABLE [dbo].[tblChiTietNhapHang]  WITH CHECK ADD  CONSTRAINT [FK_MaDonNhapHang] FOREIGN KEY([sMaDonNhapHang])
REFERENCES [dbo].[tblDonNhapHang] ([sMaDonNhapHang])
GO
ALTER TABLE [dbo].[tblChiTietNhapHang] CHECK CONSTRAINT [FK_MaDonNhapHang]
GO
ALTER TABLE [dbo].[tblChiTietNhapHang]  WITH CHECK ADD  CONSTRAINT [FK_MaMH_CTNH] FOREIGN KEY([sMaMH])
REFERENCES [dbo].[tblMatHang] ([sMaMH])
GO
ALTER TABLE [dbo].[tblChiTietNhapHang] CHECK CONSTRAINT [FK_MaMH_CTNH]
GO
ALTER TABLE [dbo].[tblChiTietNhapHang]  WITH CHECK ADD  CONSTRAINT [FK_MaSize_CTNH] FOREIGN KEY([iMaSize])
REFERENCES [dbo].[tblSize] ([iMaSize])
GO
ALTER TABLE [dbo].[tblChiTietNhapHang] CHECK CONSTRAINT [FK_MaSize_CTNH]
GO
ALTER TABLE [dbo].[tblDonDatHang]  WITH CHECK ADD  CONSTRAINT [FK_MaKH] FOREIGN KEY([iMaKH])
REFERENCES [dbo].[tblKhachHang] ([iMaKH])
GO
ALTER TABLE [dbo].[tblDonDatHang] CHECK CONSTRAINT [FK_MaKH]
GO
ALTER TABLE [dbo].[tblDonDatHang]  WITH CHECK ADD  CONSTRAINT [FK_MaNV_DDH] FOREIGN KEY([iMaNV])
REFERENCES [dbo].[tblNhanVien] ([iMaNV])
GO
ALTER TABLE [dbo].[tblDonDatHang] CHECK CONSTRAINT [FK_MaNV_DDH]
GO
ALTER TABLE [dbo].[tblDonDatHang]  WITH CHECK ADD  CONSTRAINT [FK_MaTT_DDH] FOREIGN KEY([iMaTrangThai])
REFERENCES [dbo].[tblTrangThai] ([iMaTrangThai])
GO
ALTER TABLE [dbo].[tblDonDatHang] CHECK CONSTRAINT [FK_MaTT_DDH]
GO
ALTER TABLE [dbo].[tblDonNhapHang]  WITH CHECK ADD  CONSTRAINT [FK_MaNSX2] FOREIGN KEY([iMaNSX])
REFERENCES [dbo].[tblNhaSanXuat] ([iMaNSX])
GO
ALTER TABLE [dbo].[tblDonNhapHang] CHECK CONSTRAINT [FK_MaNSX2]
GO
ALTER TABLE [dbo].[tblDonNhapHang]  WITH CHECK ADD  CONSTRAINT [FK_MaNV_DNH] FOREIGN KEY([iMaNV])
REFERENCES [dbo].[tblNhanVien] ([iMaNV])
GO
ALTER TABLE [dbo].[tblDonNhapHang] CHECK CONSTRAINT [FK_MaNV_DNH]
GO
ALTER TABLE [dbo].[tblDonNhapHang]  WITH CHECK ADD  CONSTRAINT [FK_MaTT] FOREIGN KEY([iMaTrangThai])
REFERENCES [dbo].[tblTrangThai] ([iMaTrangThai])
GO
ALTER TABLE [dbo].[tblDonNhapHang] CHECK CONSTRAINT [FK_MaTT]
GO
ALTER TABLE [dbo].[tblHeThong]  WITH CHECK ADD  CONSTRAINT [FK_TK] FOREIGN KEY([sTenDangNhap])
REFERENCES [dbo].[tblTaiKhoan] ([sTenDangNhap])
GO
ALTER TABLE [dbo].[tblHeThong] CHECK CONSTRAINT [FK_TK]
GO
ALTER TABLE [dbo].[tblKhachHang]  WITH CHECK ADD  CONSTRAINT [FK_TenDangNhap] FOREIGN KEY([sTenDangNhap])
REFERENCES [dbo].[tblTaiKhoan] ([sTenDangNhap])
GO
ALTER TABLE [dbo].[tblKhachHang] CHECK CONSTRAINT [FK_TenDangNhap]
GO
ALTER TABLE [dbo].[tblKhachHang]  WITH CHECK ADD  CONSTRAINT [FK_TenDangNhap_NV] FOREIGN KEY([sTenDangNhap])
REFERENCES [dbo].[tblTaiKhoan] ([sTenDangNhap])
GO
ALTER TABLE [dbo].[tblKhachHang] CHECK CONSTRAINT [FK_TenDangNhap_NV]
GO
ALTER TABLE [dbo].[tblKho]  WITH CHECK ADD  CONSTRAINT [FK_MaMH] FOREIGN KEY([sMaMH])
REFERENCES [dbo].[tblMatHang] ([sMaMH])
GO
ALTER TABLE [dbo].[tblKho] CHECK CONSTRAINT [FK_MaMH]
GO
ALTER TABLE [dbo].[tblKho]  WITH CHECK ADD  CONSTRAINT [FK_MaSize] FOREIGN KEY([iMaSize])
REFERENCES [dbo].[tblSize] ([iMaSize])
GO
ALTER TABLE [dbo].[tblKho] CHECK CONSTRAINT [FK_MaSize]
GO
ALTER TABLE [dbo].[tblLoaiMatHang]  WITH CHECK ADD  CONSTRAINT [FK_MaDM] FOREIGN KEY([iMaDM])
REFERENCES [dbo].[tblDanhMuc] ([iMaDM])
GO
ALTER TABLE [dbo].[tblLoaiMatHang] CHECK CONSTRAINT [FK_MaDM]
GO
ALTER TABLE [dbo].[tblMatHang]  WITH CHECK ADD  CONSTRAINT [FK_MaLoaiMH] FOREIGN KEY([iMaLoaiMH])
REFERENCES [dbo].[tblLoaiMatHang] ([iMaLoaiMH])
GO
ALTER TABLE [dbo].[tblMatHang] CHECK CONSTRAINT [FK_MaLoaiMH]
GO
ALTER TABLE [dbo].[tblMatHang]  WITH CHECK ADD  CONSTRAINT [FK_MaTT_MH] FOREIGN KEY([iMaTrangThai])
REFERENCES [dbo].[tblTrangThai] ([iMaTrangThai])
GO
ALTER TABLE [dbo].[tblMatHang] CHECK CONSTRAINT [FK_MaTT_MH]
GO
ALTER TABLE [dbo].[tblPhieuNhapKho]  WITH CHECK ADD  CONSTRAINT [FK_MaDNH] FOREIGN KEY([sMaDonNhapHang])
REFERENCES [dbo].[tblDonNhapHang] ([sMaDonNhapHang])
GO
ALTER TABLE [dbo].[tblPhieuNhapKho] CHECK CONSTRAINT [FK_MaDNH]
GO
ALTER TABLE [dbo].[tblPhieuNhapKho]  WITH CHECK ADD  CONSTRAINT [FK_MaNV_PNK] FOREIGN KEY([iMaNV])
REFERENCES [dbo].[tblNhanVien] ([iMaNV])
GO
ALTER TABLE [dbo].[tblPhieuNhapKho] CHECK CONSTRAINT [FK_MaNV_PNK]
GO
ALTER TABLE [dbo].[tblPhieuNhapKho]  WITH CHECK ADD  CONSTRAINT [FK_MaTrangThai_PNK] FOREIGN KEY([iMaTrangThai])
REFERENCES [dbo].[tblTrangThai] ([iMaTrangThai])
GO
ALTER TABLE [dbo].[tblPhieuNhapKho] CHECK CONSTRAINT [FK_MaTrangThai_PNK]
GO
ALTER TABLE [dbo].[tblPhieuNhapKho]  WITH CHECK ADD  CONSTRAINT [FK_PNK_Kho] FOREIGN KEY([iMaKho])
REFERENCES [dbo].[tblKho] ([iMaKho])
GO
ALTER TABLE [dbo].[tblPhieuNhapKho] CHECK CONSTRAINT [FK_PNK_Kho]
GO
ALTER TABLE [dbo].[tblPhieuXuatKho]  WITH CHECK ADD  CONSTRAINT [FK_MaDDH] FOREIGN KEY([sMaDonDatHang])
REFERENCES [dbo].[tblDonDatHang] ([sMaDonDatHang])
GO
ALTER TABLE [dbo].[tblPhieuXuatKho] CHECK CONSTRAINT [FK_MaDDH]
GO
ALTER TABLE [dbo].[tblPhieuXuatKho]  WITH CHECK ADD  CONSTRAINT [FK_MaKho] FOREIGN KEY([iMaKho])
REFERENCES [dbo].[tblKho] ([iMaKho])
GO
ALTER TABLE [dbo].[tblPhieuXuatKho] CHECK CONSTRAINT [FK_MaKho]
GO
ALTER TABLE [dbo].[tblPhieuXuatKho]  WITH CHECK ADD  CONSTRAINT [FK_MaNV] FOREIGN KEY([iMaNV])
REFERENCES [dbo].[tblNhanVien] ([iMaNV])
GO
ALTER TABLE [dbo].[tblPhieuXuatKho] CHECK CONSTRAINT [FK_MaNV]
GO
ALTER TABLE [dbo].[tblPhieuXuatKho]  WITH CHECK ADD  CONSTRAINT [FK_MaTrangThai] FOREIGN KEY([iMaTrangThai])
REFERENCES [dbo].[tblTrangThai] ([iMaTrangThai])
GO
ALTER TABLE [dbo].[tblPhieuXuatKho] CHECK CONSTRAINT [FK_MaTrangThai]
GO
ALTER TABLE [dbo].[tblTaiKhoan]  WITH CHECK ADD  CONSTRAINT [FK_MaQuyen] FOREIGN KEY([iMaQuyen])
REFERENCES [dbo].[tblQuyen] ([iMaQuyen])
GO
ALTER TABLE [dbo].[tblTaiKhoan] CHECK CONSTRAINT [FK_MaQuyen]
GO
ALTER TABLE [dbo].[tblTaiKhoan]  WITH CHECK ADD  CONSTRAINT [FK_MaTT_TK] FOREIGN KEY([iMaTrangThai])
REFERENCES [dbo].[tblTrangThai] ([iMaTrangThai])
GO
ALTER TABLE [dbo].[tblTaiKhoan] CHECK CONSTRAINT [FK_MaTT_TK]
GO
ALTER TABLE [dbo].[tblTrangThai]  WITH CHECK ADD  CONSTRAINT [FK_LTT] FOREIGN KEY([iMaLoaiTrangThai])
REFERENCES [dbo].[tblLoaiTrangThai] ([iMaLoaiTrangThai])
GO
ALTER TABLE [dbo].[tblTrangThai] CHECK CONSTRAINT [FK_LTT]
GO
/****** Object:  StoredProcedure [dbo].[capnhat_Trangthai_Mathang]    Script Date: 11/10/2021 20:02:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[capnhat_Trangthai_Mathang](@MaMH VARCHAR(50),@MaTrangThai INT)
AS
BEGIN
	UPDATE tblMatHang
	SET iMaTrangThai = @MaTrangThai
	WHERE sMaMH = @MaMH
END
GO
/****** Object:  StoredProcedure [dbo].[count_DDH]    Script Date: 11/10/2021 20:02:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[count_DDH]
AS
BEGIN
	SELECT COUNT(sMaDonDatHang) FROM tblDonDatHang
END
GO
/****** Object:  StoredProcedure [dbo].[count_DNH]    Script Date: 11/10/2021 20:02:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[count_DNH]
AS
BEGIN
	SELECT COUNT(sMaDonNhapHang) FROM tblDonNhapHang
END
GO
/****** Object:  StoredProcedure [dbo].[count_Mathang]    Script Date: 11/10/2021 20:02:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[count_Mathang]
AS
BEGIN
	SELECT COUNT(sMaMH) FROM tblMatHang
END
GO
/****** Object:  StoredProcedure [dbo].[count_PNK]    Script Date: 11/10/2021 20:02:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[count_PNK]
AS
BEGIN
	SELECT COUNT(sMaPhieuNhapKho) FROM tblPhieuNhapKho
END
GO
/****** Object:  StoredProcedure [dbo].[count_PXK]    Script Date: 11/10/2021 20:02:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[count_PXK]
AS
BEGIN
	SELECT COUNT(sMaPhieuXuatKho) FROM tblPhieuXuatKho
END
GO
/****** Object:  StoredProcedure [dbo].[dangki_TKKhachhang]    Script Date: 11/10/2021 20:02:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[dangki_TKKhachhang](@TenKH NVARCHAR(100),@Sdt VARCHAR(20),@Diachigiaohang NVARCHAR(100),@Tendangnhap VARCHAR(50),@Matkhau VARCHAR(50))
AS
BEGIN
	IF NOT EXISTS(SELECT * FROM tblTaiKhoan WHERE sTenDangNhap = @Tendangnhap)
	BEGIN
		INSERT INTO tblTaiKhoan
		VALUES(@Tendangnhap,@Matkhau,NULL,'1','6',GETDATE(),NULL)

		INSERT INTO tblKhachHang
		VALUES(@TenKH,@Sdt,NULL,NULL,NULL,@Diachigiaohang,@Tendangnhap,GETDATE(),NULL)
	END
END
GO
/****** Object:  StoredProcedure [dbo].[dsAnhMathang_theoID]    Script Date: 11/10/2021 20:02:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[dsAnhMathang_theoID](@id VARCHAR(50))
AS
BEGIN
	SELECT sHinhanh
	FROM tblMatHang,tblLoaiMatHang,tblChiTietNhapHang 
	WHERE tblMatHang.iMaLoaiMH = tblLoaiMatHang.iMaLoaiMH AND tblChiTietNhapHang.sMaMH = tblMatHang.sMaMH AND tblMatHang.sMaMH = @id
	GROUP BY sHinhanh
END
GO
/****** Object:  StoredProcedure [dbo].[dsLoaimathang_random]    Script Date: 11/10/2021 20:02:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[dsLoaimathang_random]
AS
BEGIN
	SELECT TOP 4 * FROM tblLoaiMatHang
	ORDER BY NEWID()
END
GO
/****** Object:  StoredProcedure [dbo].[dsMathang_Aobongdatreem_random]    Script Date: 11/10/2021 20:02:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[dsMathang_Aobongdatreem_random]
AS
BEGIN
	SELECT TOP 3 * FROM tblLoaiMatHang,tblMatHang,tblChiTietNhapHang
	WHERE tblMatHang.iMaLoaiMH = tblLoaiMatHang.iMaLoaiMH AND tblChiTietNhapHang.sMaMH = tblMatHang.sMaMH
	AND tblLoaiMatHang.iMaLoaiMH = '3'
		AND tblMatHang.sMaMH IN (SELECT sMaMH FROM tblKho)
	ORDER BY NEWID()
END
GO
/****** Object:  StoredProcedure [dbo].[dsMathang_MoiNhat]    Script Date: 11/10/2021 20:02:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[dsMathang_MoiNhat]
AS
BEGIN
	SELECT tblDonDatHang.sMaDonDatHang,tblDonDatHang.dThoigiantao,sHinhanh,sTenSize,fGianhap,iSLMua,sTenTrangThai,tblMatHang.sMaMH,sTenMH,(fGianhap*iSLMua) AS [fThanhtien]
	FROM tblMatHang,tblTrangThai,tblChiTietNhapHang,tblDonDatHang,tblChiTietDatHang,tblSize
	WHERE tblMatHang.sMaMH = tblChiTietNhapHang.sMaMH AND tblChiTietDatHang.sMaMH = tblMatHang.sMaMH AND tblSize.iMaSize = tblChiTietDatHang.iMaSize
		AND tblDonDatHang.sMaDonDatHang = tblChiTietDatHang.sMaDonDatHang AND tblTrangThai.iMaTrangThai = tblDonDatHang.iMaTrangThai
		AND tblDonDatHang.sMaDonDatHang = (SELECT TOP 1 sMaDonDatHang FROM tblDonDatHang ORDER BY dThoigiantao DESC)
	GROUP BY tblDonDatHang.sMaDonDatHang,tblDonDatHang.dThoigiantao,sHinhanh,sTenSize,fGianhap,iSLMua,sTenTrangThai,tblMatHang.sMaMH,sTenMH,(fGianhap*iSLMua)
	ORDER BY tblDonDatHang.dThoigiantao DESC
END
GO
/****** Object:  StoredProcedure [dbo].[dsMathang_theoID]    Script Date: 11/10/2021 20:02:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[dsMathang_theoID](@id VARCHAR(50))
AS
BEGIN
	SELECT *
	FROM tblMatHang,tblLoaiMatHang,tblChiTietNhapHang 
	WHERE tblMatHang.iMaLoaiMH = tblLoaiMatHang.iMaLoaiMH AND tblChiTietNhapHang.sMaMH = tblMatHang.sMaMH AND tblMatHang.sMaMH = @id
END
GO
/****** Object:  StoredProcedure [dbo].[duyet_Donnhaphang]    Script Date: 11/10/2021 20:02:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[duyet_Donnhaphang](@MaDonNhapHang VARCHAR(50),@PhieuNhapKho VARCHAR(50),@MaNV INT)
AS
BEGIN
	BEGIN
		UPDATE tblDonNhapHang
		SET iMaTrangThai = '6',dThoigiansua = GETDATE()
		WHERE sMaDonNhapHang = @MaDonNhapHang
	END
	BEGIN
		INSERT INTO tblPhieuNhapKho
		VALUES(@PhieuNhapKho,@MaNV,GETDATE(),GETDATE(),NULL,'10','2',@MaDonNhapHang)
	END
END
GO
/****** Object:  StoredProcedure [dbo].[get_chitietDonhang]    Script Date: 11/10/2021 20:02:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[get_chitietDonhang](@id VARCHAR(50))
AS
BEGIN
	SELECT tblChiTietDatHang.dThoigiantao,tblDonDatHang.sMaDonDatHang,tblChiTietDatHang.sMaMH,sTenMH,tblSize.iMaSize,sTenSize,fGianhap,iSLMua, (fGianhap*iSLMua) AS [fThanhtien] 
	FROM tblChiTietDatHang,tblMatHang,tblSize,tblDonDatHang,tblChiTietNhapHang
	WHERE tblChiTietDatHang.sMaMH = tblMatHang.sMaMH AND tblSize.iMaSize = tblChiTietDatHang.iMaSize 
		AND tblDonDatHang.sMaDonDatHang = tblChiTietDatHang.sMaDonDatHang AND tblChiTietNhapHang.sMaMH = tblMatHang.sMaMH 
		AND tblDonDatHang.sMaDonDatHang = @id
	GROUP BY tblChiTietDatHang.dThoigiantao,tblDonDatHang.sMaDonDatHang,tblChiTietDatHang.sMaMH,sTenMH,tblSize.iMaSize,sTenSize,fGianhap,iSLMua
	ORDER BY tblChiTietDatHang.dThoigiantao DESC
END
GO
/****** Object:  StoredProcedure [dbo].[get_chitietDonnhaphang]    Script Date: 11/10/2021 20:02:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[get_chitietDonnhaphang](@id VARCHAR(50))
AS
BEGIN
	SELECT *, (fGianhap*iSoluongnhap) AS [fThanhtien],((fGianhap*iSoluongnhap) - (fGianhap*iSoluongnhap*(fMucchietkhau/100))) AS [fThanhtien_Sauchietkhau]
	FROM tblDonNhapHang,tblNhaSanXuat,tblNhanVien,tblChiTietNhapHang,tblMatHang,tblSize
	WHERE tblNhanVien.iMaNV = tblDonNhapHang.iMaNV AND tblDonNhapHang.sMaDonNhapHang = tblChiTietNhapHang.sMaDonNhapHang 
		AND tblChiTietNhapHang.sMaMH = tblMatHang.sMaMH AND tblNhaSanXuat.iMaNSX = tblDonNhapHang.iMaNSX AND tblChiTietNhapHang.iMaSize = tblSize.iMaSize
		AND tblDonNhapHang.sMaDonNhapHang = @id
	ORDER BY dNgaynhap DESC
END
GO
/****** Object:  StoredProcedure [dbo].[get_Donhang_Tongtien]    Script Date: 11/10/2021 20:02:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[get_Donhang_Tongtien](@id VARCHAR(50))
AS
BEGIN
	SELECT sMaDonDatHang, SUM(fThanhtien) AS [fTongtien]
	FROM vw_chitietDonhang
	WHERE sMaDonDatHang = @id
	GROUP BY sMaDonDatHang
END
	
GO
/****** Object:  StoredProcedure [dbo].[get_Donnhaphang_Tongtien]    Script Date: 11/10/2021 20:02:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[get_Donnhaphang_Tongtien](@id VARCHAR(50))
AS
BEGIN
	SELECT sMaDonNhapHang, SUM(fThanhtien_Sauchietkhau) AS [fTongtien_Donnhaphang]
	FROM vw_chitietDonnhaphang
	WHERE sMaDonNhapHang = @id
	GROUP BY sMaDonNhapHang
END
GO
/****** Object:  StoredProcedure [dbo].[get_dsALL_PhieuXuatKho]    Script Date: 11/10/2021 20:02:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[get_dsALL_PhieuXuatKho]
AS
BEGIN
	SELECT * FROM tblPhieuXuatKho,tblTrangThai,tblNhanVien
	WHERE tblPhieuXuatKho.iMaTrangThai = tblTrangThai.iMaTrangThai AND tblPhieuXuatKho.iMaNV = tblNhanVien.iMaNV
		--AND tblNhanVien.iMaNV = '1'
	ORDER BY dNgayxuat DESC
END
GO
/****** Object:  StoredProcedure [dbo].[get_dsALLPhieuNhapKho]    Script Date: 11/10/2021 20:02:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[get_dsALLPhieuNhapKho]
AS
BEGIN
	SELECT * FROM tblPhieuNhapKho,tblTrangThai,tblNhanVien
	WHERE tblPhieuNhapKho.iMaTrangThai = tblTrangThai.iMaTrangThai AND tblPhieuNhapKho.iMaNV = tblNhanVien.iMaNV
	ORDER BY dNgaynhapkho DESC
END
GO
/****** Object:  StoredProcedure [dbo].[get_dsDanhmuc]    Script Date: 11/10/2021 20:02:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[get_dsDanhmuc]
AS
BEGIN
	SELECT *
	FROM tblDanhMuc
END
GO
/****** Object:  StoredProcedure [dbo].[get_dsDonhang]    Script Date: 11/10/2021 20:02:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[get_dsDonhang]
AS
BEGIN
	SELECT tblDonDatHang.dThoigiantao,tblDonDatHang.dThoigiansua,sTenNV,sTenKH,* 
	FROM tblDonDatHang,tblTrangthai,tblNhanVien,tblKhachHang
	WHERE tblDonDatHang.iMaTrangThai = tblTrangthai.iMaTrangThai AND
		tblNhanVien.iMaNV = tblDonDatHang.iMaNV AND tblDonDatHang.iMaKH = tblKhachHang.iMaKH
	ORDER BY tblDonDatHang.dThoigiantao DESC
END
GO
/****** Object:  StoredProcedure [dbo].[get_dsDonhang_theoIDTrangthai]    Script Date: 11/10/2021 20:02:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[get_dsDonhang_theoIDTrangthai](@id VARCHAR(50))
AS
BEGIN
	SELECT tblDonDatHang.dThoigiantao,tblDonDatHang.dThoigiansua,* 
	FROM tblDonDatHang,tblTrangthai,tblNhanVien,tblLoaiTrangThai
	WHERE tblDonDatHang.iMaTrangThai = tblTrangthai.iMaTrangThai AND 
		tblNhanVien.iMaNV = tblDonDatHang.iMaNV AND tblLoaiTrangThai.iMaLoaiTrangThai = tblTrangThai.iMaLoaiTrangThai
		AND tblTrangthai.iMaTrangThai = @id
	ORDER BY tblDonDatHang.dThoigiantao DESC
END
GO
/****** Object:  StoredProcedure [dbo].[get_dsDonnhaphang]    Script Date: 11/10/2021 20:02:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[get_dsDonnhaphang]
AS
BEGIN
	SELECT *
	FROM tblDonNhapHang,tblTrangthai,tblNhanVien,tblNhaSanXuat
	WHERE tblDonNhapHang.iMaTrangThai = tblTrangthai.iMaTrangThai AND
		tblNhanVien.iMaNV = tblDonNhapHang.iMaNV AND tblNhaSanXuat.iMaNSX = tblDonNhapHang.iMaNSX
END
GO
/****** Object:  StoredProcedure [dbo].[get_dsDonnhaphang_theoIDTrangthai]    Script Date: 11/10/2021 20:02:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[get_dsDonnhaphang_theoIDTrangthai](@id VARCHAR(50))
AS
BEGIN
	SELECT tblDonNhapHang.dThoigiantao,*
	FROM tblDonNhapHang,tblTrangthai,tblNhanVien,tblNhaSanXuat
	WHERE tblDonNhapHang.iMaTrangThai = tblTrangthai.iMaTrangThai AND
		tblNhanVien.iMaNV = tblDonNhapHang.iMaNV AND tblNhaSanXuat.iMaNSX = tblDonNhapHang.iMaNSX 
		AND tblTrangthai.iMaTrangThai = @id
	ORDER BY tblDonNhapHang.dThoigiantao DESC
END
GO
/****** Object:  StoredProcedure [dbo].[get_dsKhachhang]    Script Date: 11/10/2021 20:02:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[get_dsKhachhang]
AS
BEGIN
	SELECT * FROM tblKhachHang
END
GO
/****** Object:  StoredProcedure [dbo].[get_dsLoaiMH]    Script Date: 11/10/2021 20:02:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[get_dsLoaiMH]
AS
BEGIN
	SELECT *
	FROM tblLoaiMatHang
END
GO
/****** Object:  StoredProcedure [dbo].[get_dsLoaiMH_theoDM]    Script Date: 11/10/2021 20:02:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[get_dsLoaiMH_theoDM](@id VARCHAR(10))
AS
BEGIN
	SELECT * FROM tblLoaiMatHang 
	WHERE iMaDM = @id
END
GO
/****** Object:  StoredProcedure [dbo].[get_dsMathang]    Script Date: 11/10/2021 20:02:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[get_dsMathang]
AS
BEGIN
	SELECT tblMatHang.sMaMH,sTenMH,sHinhanh,sDonvitinh,sMota,tblMatHang.dThoigiantao,tblMatHang.dThoigiansua,sTenTrangThai,sTenLoaiMH
	FROM tblMatHang,tblTrangThai,tblLoaiTrangThai,tblLoaiMatHang
	WHERE tblMatHang.iMaTrangThai = tblTrangThai.iMaTrangThai AND tblTrangThai.iMaLoaiTrangThai = tblLoaiTrangThai.iMaLoaiTrangThai
		AND tblMatHang.iMaLoaiMH = tblLoaiMatHang.iMaLoaiMH
		--AND tblMatHang.sMaMH IN (SELECT sMaMH FROM tblKho GROUP BY sMaMH)
	GROUP BY tblMatHang.sMaMH,sTenMH,sHinhanh,sDonvitinh,sMota,tblMatHang.dThoigiantao,tblMatHang.dThoigiansua,sTenTrangThai,sTenLoaiMH
	ORDER BY dThoigiantao DESC
END
GO
/****** Object:  StoredProcedure [dbo].[get_dsMathang_CLB]    Script Date: 11/10/2021 20:02:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[get_dsMathang_CLB]
AS
BEGIN
	SELECT TOP 12 tblMatHang.sMaMH,sTenMH,sHinhanh,fGianhap,sDonvitinh,sMota,tblMatHang.dThoigiantao,tblMatHang.dThoigiansua,sTenTrangThai,sTenLoaiMH
	FROM tblMatHang,tblTrangThai,tblLoaiTrangThai,tblLoaiMatHang,tblChiTietNhapHang
	WHERE tblMatHang.iMaTrangThai = tblTrangThai.iMaTrangThai AND tblTrangThai.iMaLoaiTrangThai = tblLoaiTrangThai.iMaLoaiTrangThai
		AND tblMatHang.iMaLoaiMH = tblLoaiMatHang.iMaLoaiMH AND tblLoaiMatHang.iMaLoaiMH = '1' AND tblChiTietNhapHang.sMaMH = tblMatHang.sMaMH
		AND tblMatHang.sMaMH IN (SELECT sMaMH FROM tblKho)
	ORDER BY NEWID()
END
GO
/****** Object:  StoredProcedure [dbo].[get_dsMathang_Kho]    Script Date: 11/10/2021 20:02:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[get_dsMathang_Kho]
AS
BEGIN
	SELECT tblKho.sMaMH,sHinhanh,sTenMH
	FROM tblKho,tblMatHang
	WHERE tblMatHang.sMaMH = tblKho.sMaMH
	GROUP BY tblKho.sMaMH,sHinhanh,sTenMH
END
GO
/****** Object:  StoredProcedure [dbo].[get_dsMathang_theoLoaiMH]    Script Date: 11/10/2021 20:02:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[get_dsMathang_theoLoaiMH](@id VARCHAR(50))
AS
BEGIN
	SELECT * FROM tblMatHang,tblChiTietNhapHang
	WHERE tblMatHang.sMaMH = tblChiTietNhapHang.sMaMH AND iMaLoaiMH = @id
END
GO
/****** Object:  StoredProcedure [dbo].[get_dsMathang_theoNSX]    Script Date: 11/10/2021 20:02:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[get_dsMathang_theoNSX](@id VARCHAR(50))
AS
BEGIN
	SELECT * FROM tblMatHang,tblChiTietNhapHang,tblDonNhapHang
	WHERE tblMatHang.sMaMH = tblChiTietNhapHang.sMaMH AND tblDonNhapHang.sMaDonNhapHang = tblChiTietNhapHang.sMaDonNhapHang
	AND iMaNSX = @id
END
GO
/****** Object:  StoredProcedure [dbo].[get_dsMathang_trongCTDH]    Script Date: 11/10/2021 20:02:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[get_dsMathang_trongCTDH](@MaDDH VARCHAR(50))
AS
BEGIN
	SELECT * FROM tblChiTietDatHang WHERE sMaDonDatHang = @MaDDH
END
GO
/****** Object:  StoredProcedure [dbo].[get_dsMathang_trongCTNH]    Script Date: 11/10/2021 20:02:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[get_dsMathang_trongCTNH](@MaDNH VARCHAR(50))
AS
BEGIN
	SELECT * FROM tblChiTietNhapHang WHERE sMaDonNhapHang = @MaDNH
END
GO
/****** Object:  StoredProcedure [dbo].[get_dsMathang_trongKho]    Script Date: 11/10/2021 20:02:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[get_dsMathang_trongKho]
AS
BEGIN
	SELECT tblMatHang.sMaMH,sTenMH
	FROM tblMatHang,tblKho 
	WHERE tblMatHang.sMaMH = tblKho.sMaMH AND tblMatHang.sMaMH IN (SELECT sMaMH FROM tblKho GROUP BY sMaMH)
	GROUP BY tblMatHang.sMaMH,sTenMH
END
GO
/****** Object:  StoredProcedure [dbo].[get_dsNSX]    Script Date: 11/10/2021 20:02:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[get_dsNSX]
AS
BEGIN
	SELECT * FROM tblNhaSanXuat
END
GO
/****** Object:  StoredProcedure [dbo].[get_dsPhieuNhapKho_theoIDTrangthai]    Script Date: 11/10/2021 20:02:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[get_dsPhieuNhapKho_theoIDTrangthai](@id VARCHAR(50))
AS
BEGIN
	SELECT * FROM tblPhieuNhapKho,tblTrangThai,tblNhanVien
	WHERE tblPhieuNhapKho.iMaTrangThai = tblTrangThai.iMaTrangThai AND tblPhieuNhapKho.iMaNV = tblNhanVien.iMaNV
		 AND tblTrangThai.iMaTrangThai = @id
	ORDER BY dNgaynhapkho DESC
END
GO
/****** Object:  StoredProcedure [dbo].[get_dsPhieuXuatKho]    Script Date: 11/10/2021 20:02:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[get_dsPhieuXuatKho](@id VARCHAR(50))
AS
BEGIN
	SELECT * FROM tblPhieuXuatKho,tblTrangThai,tblNhanVien
	WHERE tblPhieuXuatKho.iMaTrangThai = tblTrangThai.iMaTrangThai AND tblPhieuXuatKho.iMaNV = tblNhanVien.iMaNV
		AND sMaDonDatHang IN (SELECT sMaDonDatHang FROM tblDonDatHang WHERE iMaTrangThai = '3')
		 AND tblTrangThai.iMaTrangThai = @id
	ORDER BY dNgayxuat DESC
END
GO
/****** Object:  StoredProcedure [dbo].[get_dsQuyen]    Script Date: 11/10/2021 20:02:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--thu tuc lay danh sach quyen
CREATE PROC [dbo].[get_dsQuyen]
AS
BEGIN
	SELECT *
	FROM tblQuyen
END
GO
/****** Object:  StoredProcedure [dbo].[get_dsSize]    Script Date: 11/10/2021 20:02:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[get_dsSize]
AS
BEGIN
	SELECT * FROM tblSize
END
GO
/****** Object:  StoredProcedure [dbo].[get_dsSize_Mathang_Kho]    Script Date: 11/10/2021 20:02:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[get_dsSize_Mathang_Kho](@id VARCHAR(50))
AS
BEGIN
	SELECT *
	FROM tblKho,tblMatHang,tblSize
	WHERE tblMatHang.sMaMH = tblKho.sMaMH AND tblSize.iMaSize = tblKho.iMaSize
		AND tblKho.sMaMH = @id--'78E8A4F7-F8A5-462E-B31D-015ED121EAEF'
END
GO
/****** Object:  StoredProcedure [dbo].[get_dsSize_theoIDMH]    Script Date: 11/10/2021 20:02:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[get_dsSize_theoIDMH](@id VARCHAR(50))
AS
BEGIN
	SELECT sMaMH,tblSize.iMaSize,sTenSize 
	FROM tblSize,tblKho 
	WHERE tblSize.iMaSize = tblKho.iMaSize AND sMaMH = @id
	GROUP BY sMaMH,tblSize.iMaSize,sTenSize
END
GO
/****** Object:  StoredProcedure [dbo].[get_DSSize_theoMathang]    Script Date: 11/10/2021 20:02:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[get_DSSize_theoMathang](@id VARCHAR(50))
AS
BEGIN
	SELECT * FROM tblKho,tblSize WHERE tblKho.iMaSize = tblSize.iMaSize AND sMaMH = @id
END
GO
/****** Object:  StoredProcedure [dbo].[get_dsTaikhoan_ND]    Script Date: 11/10/2021 20:02:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[get_dsTaikhoan_ND]
AS
BEGIN
	SELECT *
	FROM tblTaiKhoan,tblTrangThai,tblQuyen,tblKhachHang
	WHERE tblTaiKhoan.iMaTrangThai = tblTrangThai.iMaTrangThai AND tblQuyen.iMaQuyen = tblTaiKhoan.iMaQuyen AND tblKhachHang.sTenDangNhap = tblTaiKhoan.sTenDangNhap
END
GO
/****** Object:  StoredProcedure [dbo].[get_dsTaikhoan_NV]    Script Date: 11/10/2021 20:02:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[get_dsTaikhoan_NV]
AS
BEGIN
	SELECT *
	FROM tblTaiKhoan,tblTrangThai,tblQuyen,tblNhanVien
	WHERE tblTaiKhoan.iMaTrangThai = tblTrangThai.iMaTrangThai AND tblQuyen.iMaQuyen = tblTaiKhoan.iMaQuyen AND tblNhanVien.sTenDangNhap = tblTaiKhoan.sTenDangNhap
END
GO
/****** Object:  StoredProcedure [dbo].[get_dsTrangthai_DDH]    Script Date: 11/10/2021 20:02:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[get_dsTrangthai_DDH]
AS
BEGIN
	SELECT * FROM tblTrangthai,tblLoaiTrangThai WHERE tblTrangthai.iMaLoaiTrangThai = tblLoaiTrangThai.iMaLoaiTrangThai
	AND tblLoaiTrangThai.iMaLoaiTrangThai = '2'
END
GO
/****** Object:  StoredProcedure [dbo].[get_dsTrangthai_DNH]    Script Date: 11/10/2021 20:02:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[get_dsTrangthai_DNH]
AS
BEGIN
	SELECT * FROM tblTrangthai,tblLoaiTrangThai WHERE tblTrangthai.iMaLoaiTrangThai = tblLoaiTrangThai.iMaLoaiTrangThai
	AND tblLoaiTrangThai.iMaLoaiTrangThai = '3'
END
GO
/****** Object:  StoredProcedure [dbo].[get_dsTrangthai_Mathang]    Script Date: 11/10/2021 20:02:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[get_dsTrangthai_Mathang]
AS
BEGIN
	SELECT * FROM tblTrangThai,tblLoaiTrangThai WHERE tblTrangThai.iMaLoaiTrangThai = tblLoaiTrangThai.iMaLoaiTrangThai
	AND tblLoaiTrangThai.iMaLoaiTrangThai = '6'
END
GO
/****** Object:  StoredProcedure [dbo].[get_dsTrangthai_Taikhoan]    Script Date: 11/10/2021 20:02:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[get_dsTrangthai_Taikhoan]
AS
BEGIN
	SELECT *
	FROM tblTrangThai,tblLoaiTrangThai
	WHERE tblTrangThai.iMaLoaiTrangThai = tblLoaiTrangThai.iMaLoaiTrangThai AND tblLoaiTrangThai.iMaLoaiTrangThai = 1
END
GO
/****** Object:  StoredProcedure [dbo].[get_dsTrangthai_TheoID]    Script Date: 11/10/2021 20:02:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[get_dsTrangthai_TheoID](@id VARCHAR(50))
AS
BEGIN
	SELECT * FROM tblTrangthai,tblLoaiTrangThai WHERE tblTrangthai.iMaLoaiTrangThai = tblLoaiTrangThai.iMaLoaiTrangThai AND iMaTrangThai = @id
END
GO
/****** Object:  StoredProcedure [dbo].[get_dsTrangthai_theoPNK]    Script Date: 11/10/2021 20:02:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[get_dsTrangthai_theoPNK]
AS
BEGIN
	SELECT * FROM tblTrangThai,tblLoaiTrangThai 
	WHERE tblTrangThai.iMaLoaiTrangThai = tblLoaiTrangThai.iMaLoaiTrangThai AND tblLoaiTrangThai.iMaLoaiTrangThai = '4'
END
GO
/****** Object:  StoredProcedure [dbo].[get_Mathang_theoChitietdonhang]    Script Date: 11/10/2021 20:02:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[get_Mathang_theoChitietdonhang](@id VARCHAR(50))
AS
BEGIN
	SELECT * FROM tblChiTietNhapHang, tblMatHang,tblSize
	WHERE tblChiTietNhapHang.sMaMH = tblMatHang.sMaMH AND tblSize.iMaSize = tblChiTietNhapHang.iMaSize AND sMaDonNhapHang = @id
END
GO
/****** Object:  StoredProcedure [dbo].[get_MH_NSX]    Script Date: 11/10/2021 20:02:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[get_MH_NSX]
AS
BEGIN
	SELECT iMaNSX,sTenNSX,COUNT(SL) AS [Tong]
	FROM vw_MH_theoNSX
	GROUP BY iMaNSX,sTenNSX
END
GO
/****** Object:  StoredProcedure [dbo].[get_ttCuahang]    Script Date: 11/10/2021 20:02:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[get_ttCuahang]
AS
BEGIN
	SELECT *
	FROM tblHeThong
END
GO
/****** Object:  StoredProcedure [dbo].[get_TTKhachhang_theoID]    Script Date: 11/10/2021 20:02:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[get_TTKhachhang_theoID](@id VARCHAR(10))
AS
BEGIN
	SELECT * FROM tblKhachHang WHERE iMaKH = @id
END
GO
/****** Object:  StoredProcedure [dbo].[get_ttKhachhang_theoIDDonhang]    Script Date: 11/10/2021 20:02:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--thu tuc lay thong tin khach hang theo id don hang
CREATE PROC [dbo].[get_ttKhachhang_theoIDDonhang](@id VARCHAR(50))
AS
BEGIN
	SELECT sMaDonDatHang,tblDonDatHang.iMaKH,sTenKH,sSdt,dNgaysinh,sGioitinh,sEmail,sDiachi
	FROM tblDonDatHang,tblKhachHang
	WHERE tblKhachHang.iMaKH = tblDonDatHang.iMaKH AND tblDonDatHang.sMaDonDatHang = @id
	GROUP BY sMaDonDatHang,tblDonDatHang.iMaKH,sTenKH,sSdt,dNgaysinh,sGioitinh,sEmail,sDiachi
END
GO
/****** Object:  StoredProcedure [dbo].[get_ttKhachhang_theoTendangnhap]    Script Date: 11/10/2021 20:02:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[get_ttKhachhang_theoTendangnhap](@id VARCHAR(50))
AS
BEGIN
	SELECT *
	FROM tblTaiKhoan,tblKhachHang
	WHERE tblTaiKhoan.sTenDangNhap = tblKhachHang.sTenDangNhap
END
GO
/****** Object:  StoredProcedure [dbo].[get_ttNSX_theoIDDonhang]    Script Date: 11/10/2021 20:02:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[get_ttNSX_theoIDDonhang](@id VARCHAR(50))
AS
BEGIN
	SELECT sMaDonNhapHang,tblNhaSanXuat.iMaNSX,sTenNSX,sSdt,sDiachi
	FROM tblDonNhapHang,tblNhaSanXuat
	WHERE tblNhaSanXuat.iMaNSX = tblDonNhapHang.iMaNSX AND tblDonNhapHang.sMaDonNhapHang = @id
	GROUP BY sMaDonNhapHang,tblNhaSanXuat.iMaNSX,sTenNSX,sSdt,sDiachi
END
GO
/****** Object:  StoredProcedure [dbo].[getMathang_theoID]    Script Date: 11/10/2021 20:02:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[getMathang_theoID](@id VARCHAR(50))
AS
BEGIN
	SELECT *
	FROM tblMatHang
	WHERE sMaMH = @id
END
GO
/****** Object:  StoredProcedure [dbo].[getTaikhoan_theoID]    Script Date: 11/10/2021 20:02:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[getTaikhoan_theoID](@id VARCHAR(50))
AS
BEGIN
	SELECT *
	FROM tblTaiKhoan,tblNhanVien
	WHERE tblTaiKhoan.sTenDangNhap = tblNhanVien.sTenDangNhap AND tblTaiKhoan.sTenDangNhap = @id
END
GO
/****** Object:  StoredProcedure [dbo].[getTaikhoan_theoID_KH]    Script Date: 11/10/2021 20:02:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[getTaikhoan_theoID_KH](@id VARCHAR(50))
AS
BEGIN
	SELECT *
	FROM tblTaiKhoan,tblKhachHang
	WHERE tblTaiKhoan.sTenDangNhap = tblKhachHang.sTenDangNhap AND tblTaiKhoan.sTenDangNhap = @id
END
GO
/****** Object:  StoredProcedure [dbo].[huyDuyet_Donnhaphang]    Script Date: 11/10/2021 20:02:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[huyDuyet_Donnhaphang](@MaDonNhapHang VARCHAR(50))
AS
BEGIN
	BEGIN
		UPDATE tblDonNhapHang
		SET iMaTrangThai = '7',dThoigiansua = GETDATE()
		WHERE sMaDonNhapHang = @MaDonNhapHang
	END
END
GO
/****** Object:  StoredProcedure [dbo].[insert_Chitietdathang_Khachhang]    Script Date: 11/10/2021 20:02:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[insert_Chitietdathang_Khachhang](@MaMH VARCHAR(50), @SLMua INT, @MaSize INT)
AS
BEGIN
	BEGIN
		DECLARE @MaDDH VARCHAR(50)
		SELECT @MaDDH = sMaDonDatHang FROM tblDonDatHang WHERE sMaDonDatHang = (SELECT TOP 1 sMaDonDatHang FROM tblDonDatHang ORDER BY dThoigiantao DESC)
	END

	BEGIN
		INSERT INTO tblChiTietDatHang
		VALUES(@MaDDH,@MaMH,@SLMua,'1',GETDATE(),null,@MaSize)
	END
END
GO
/****** Object:  StoredProcedure [dbo].[insert_Chitietdathang_Khachhang_Ngoaihethong]    Script Date: 11/10/2021 20:02:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[insert_Chitietdathang_Khachhang_Ngoaihethong](@MaDonDatHang VARCHAR(50),@MaMH VARCHAR(50),@SLMua INT,@MaSize INT)
AS
BEGIN
	IF EXISTS(SELECT * FROM tblChiTietDatHang WHERE sMaDonDatHang = @MaDonDatHang AND sMaMH = @MaMH AND iMaSize = @MaSize)
		BEGIN
			UPDATE tblChiTietDatHang
			SET iSLMua += @SLMua
			WHERE sMaDonDatHang = @MaDonDatHang AND sMaMH = @MaMH AND iMaSize = @MaSize
		END
	ELSE
		BEGIN
			INSERT INTO tblChiTietDatHang
			VALUES(@MaDonDatHang,@MaMH,@SLMua,'1',GETDATE(),NULL,@MaSize)
		END
END
GO
/****** Object:  StoredProcedure [dbo].[insert_Dondathang_Khachhang_Ngoaihethong]    Script Date: 11/10/2021 20:02:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[insert_Dondathang_Khachhang_Ngoaihethong](@TenKH NVARCHAR(50),@Sdt VARCHAR(20),@Diachigiaohang NVARCHAR(100),@dNgaygiaohang DATETIME,
@MaDonDatHang VARCHAR(10),@MaNV VARCHAR(50))
AS
BEGIN
	IF((@dNgaygiaohang - GETDATE()) > 2)
		BEGIN 
			BEGIN
				INSERT INTO tblKhachHang
				VALUES(@TenKH,@Sdt,NULL,NULL,NULL,@Diachigiaohang,NULL,GETDATE(),NULL)
			END
			BEGIN
				DECLARE @MaKH INT
				SELECT @MaKH = iMaKH
				FROM tblKhachHang
				WHERE iMaKH = (SELECT TOP 1 iMaKH FROM tblKhachHang ORDER BY dThoigiantao DESC)
			END
			BEGIN
				INSERT INTO tblDonDatHang
				VALUES(@MaDonDatHang,@MaNV,@MaKH,GETDATE(),@dNgaygiaohang,@Diachigiaohang,GETDATE(),NULL,'4')
			END
		END
END
GO
/****** Object:  StoredProcedure [dbo].[insert_Dondathang_Khachhang_Ngoaihethong_ND]    Script Date: 11/10/2021 20:02:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[insert_Dondathang_Khachhang_Ngoaihethong_ND](@TenKH NVARCHAR(50),@Sdt VARCHAR(20),@Diachigiaohang NVARCHAR(100),@dNgaygiaohang DATETIME,
@MaDonDatHang VARCHAR(10))
AS
BEGIN
	IF((@dNgaygiaohang - GETDATE()) > 2)
		BEGIN 
			INSERT INTO tblKhachHang
			VALUES(@TenKH,@Sdt,NULL,NULL,NULL,@Diachigiaohang,NULL,GETDATE(),NULL)

			DECLARE @MaKH INT
			SELECT @MaKH = iMaKH
			FROM tblKhachHang
			WHERE iMaKH = (SELECT TOP 1 iMaKH FROM tblKhachHang ORDER BY dThoigiantao DESC)

			INSERT INTO tblDonDatHang
			VALUES(@MaDonDatHang,'4',@MaKH,GETDATE(),@dNgaygiaohang,@Diachigiaohang,GETDATE(),NULL,'4')
		END
END
GO
/****** Object:  StoredProcedure [dbo].[insert_Dondathang_Khachhang_Tronghethong]    Script Date: 11/10/2021 20:02:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[insert_Dondathang_Khachhang_Tronghethong](@MaDonDatHang VARCHAR(10),@MaKH VARCHAR(10),@TenKH NVARCHAR(100),@Sdt VARCHAR(20),@dNgaygiaohang DATETIME, @Diachigiaohang NVARCHAR(100))
AS
BEGIN
	IF((@dNgaygiaohang - GETDATE()) > 2)
		BEGIN 
			UPDATE tblKhachHang
			SET sTenKH = @TenKH,sSdt = @Sdt,sDiachi = @Diachigiaohang
			WHERE iMaKH = @MaKH

			INSERT INTO tblDonDatHang
			VALUES(@MaDonDatHang,'4',@MaKH,GETDATE(),@dNgaygiaohang,@Diachigiaohang,GETDATE(),NULL,'4')
		END
END
GO
/****** Object:  StoredProcedure [dbo].[insert_ttCuahang]    Script Date: 11/10/2021 20:02:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[insert_ttCuahang](@MaCuaHang VARCHAR(50),@TenCuaHang NVARCHAR(255),@Sdt VARCHAR(50),@Email VARCHAR(50),@Diachi NVARCHAR(255),@Giomocua VARCHAR(10),@Giodongcua VARCHAR(10)
,@Mota NVARCHAR(255),@TenDangNhap VARCHAR(50))
AS
BEGIN
	INSERT INTO tblHeThong
	VALUES(@MaCuaHang,@TenCuaHang,@Sdt,@Email,@Diachi,@Giomocua,@Giodongcua,@Mota,@TenDangNhap)
END
GO
/****** Object:  StoredProcedure [dbo].[load_Trangthai_Phieuxuatkho]    Script Date: 11/10/2021 20:02:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[load_Trangthai_Phieuxuatkho]
AS
BEGIN
	SELECT * FROM tblTrangThai,tblLoaiTrangThai 
	WHERE tblTrangThai.iMaLoaiTrangThai = tblLoaiTrangThai.iMaLoaiTrangThai AND tblLoaiTrangThai.iMaLoaiTrangThai = '5'
END
GO
/****** Object:  StoredProcedure [dbo].[load_Trangthai_Phieuxuatkho_theoID]    Script Date: 11/10/2021 20:02:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--thu tuc lay trang thai phieu xuat kho
CREATE PROC [dbo].[load_Trangthai_Phieuxuatkho_theoID](@id VARCHAR(50))
AS
BEGIN
	SELECT * FROM tblTrangThai,tblLoaiTrangThai 
	WHERE tblTrangThai.iMaLoaiTrangThai = tblLoaiTrangThai.iMaLoaiTrangThai AND tblLoaiTrangThai.iMaLoaiTrangThai = '5'
		AND iMaTrangThai = @id
END
GO
/****** Object:  StoredProcedure [dbo].[pr_Capnhat_DsMathang]    Script Date: 11/10/2021 20:02:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[pr_Capnhat_DsMathang](@MaMH VARCHAR(50),@TenMH NVARCHAR(100),@Hinhanh VARCHAR(50),@Donvitinh NVARCHAR(10),
@Mota NVARCHAR(255),@MaLoaiMH INT,@MaTrangThai INT)
AS
BEGIN
			UPDATE tblMatHang
			SET sTenMH = @TenMH,
				sHinhanh = @Hinhanh,
				sDonvitinh = @Donvitinh,
				sMota = @Mota,
				iMaLoaiMH = @MaLoaiMH,
				dThoigiansua = GETDATE(),
				iMaTrangThai = @MaTrangThai
			WHERE
				sMaMH = @MaMH
END
GO
/****** Object:  StoredProcedure [dbo].[pr_Capnhat_HuyTTDonhang]    Script Date: 11/10/2021 20:02:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[pr_Capnhat_HuyTTDonhang](@MaDonDatHang VARCHAR(50))
AS
BEGIN
	UPDATE tblDonDatHang
	SET iMaTrangThai = '4', dThoigiansua = GETDATE()
	WHERE sMaDonDatHang = @MaDonDatHang
END
GO
/****** Object:  StoredProcedure [dbo].[pr_Capnhat_TTDonhang]    Script Date: 11/10/2021 20:02:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[pr_Capnhat_TTDonhang](@MaDonDatHang VARCHAR(10),@MaPhieuXuatKho VARCHAR(10))
AS
BEGIN
	BEGIN
		UPDATE tblDonDatHang
		SET iMaTrangThai = '3', dThoigiansua = GETDATE()
		WHERE sMaDonDatHang = @MaDonDatHang
	END
	BEGIN
		INSERT INTO tblPhieuXuatKho
		VALUES(@MaPhieuXuatKho,'1',GETDATE(),GETDATE(),NULL,'13','2',@MaDonDatHang)
	END
END
GO
/****** Object:  StoredProcedure [dbo].[pr_Dangnhap_ND]    Script Date: 11/10/2021 20:02:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[pr_Dangnhap_ND](@Tendangnhap VARCHAR(50), @Matkhau VARCHAR(50))
AS
BEGIN
	SELECT * FROM tblTaiKhoan,tblQuyen,tblTrangThai,tblKhachHang
	WHERE tblTaiKhoan.iMaQuyen = tblQuyen.iMaQuyen AND tblTaiKhoan.iMaTrangThai = tblTrangThai.iMaTrangThai 
		AND tblTaiKhoan.sTenDangNhap = tblKhachHang.sTenDangNhap AND tblTaiKhoan.sTenDangNhap = @Tendangnhap AND sMatKhau = @Matkhau 
END
GO
/****** Object:  StoredProcedure [dbo].[pr_Dangnhap_Nguoidung]    Script Date: 11/10/2021 20:02:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--thu tuc dang nhap nhan vien
CREATE PROC [dbo].[pr_Dangnhap_Nguoidung](@Tendangnhap VARCHAR(50), @Matkhau VARCHAR(50))
AS
BEGIN
	SELECT * FROM tblTaiKhoan,tblQuyen,tblTrangThai,tblKhachHang
	WHERE tblTaiKhoan.iMaQuyen = tblQuyen.iMaQuyen AND tblTaiKhoan.iMaTrangThai = tblTrangThai.iMaTrangThai 
		AND tblTaiKhoan.sTenDangNhap = tblKhachHang.sTenDangNhap AND tblTaiKhoan.sTenDangNhap = @Tendangnhap AND sMatKhau = @Matkhau 
END
GO
/****** Object:  StoredProcedure [dbo].[pr_Dangnhap_NV]    Script Date: 11/10/2021 20:02:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[pr_Dangnhap_NV](@Tendangnhap VARCHAR(50), @Matkhau VARCHAR(50))
AS
BEGIN
	SELECT * FROM tblTaiKhoan,tblQuyen,tblTrangThai,tblNhanVien
	WHERE tblTaiKhoan.iMaQuyen = tblQuyen.iMaQuyen AND tblTaiKhoan.iMaTrangThai = tblTrangThai.iMaTrangThai 
		AND tblTaiKhoan.sTenDangNhap = tblNhanVien.sTenDangNhap AND tblTaiKhoan.sTenDangNhap = @Tendangnhap AND sMatKhau = @Matkhau 
END
GO
/****** Object:  StoredProcedure [dbo].[pr_Them_DsMathang]    Script Date: 11/10/2021 20:02:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[pr_Them_DsMathang](@MaMH VARCHAR(10),@TenMH NVARCHAR(100), @Hinhanh VARCHAR(50),@Donvitinh NVARCHAR(10),
@Mota NVARCHAR(255),@MaLoaiMH INT,@MaTrangThai INT)
AS
BEGIN
	INSERT INTO tblMatHang
	VALUES(@MaMH,@TenMH,@Hinhanh,@Donvitinh,@Mota,@MaLoaiMH,GETDATE(),null,@MaTrangThai)
END
GO
/****** Object:  StoredProcedure [dbo].[pr_Tudongtru_MH]    Script Date: 11/10/2021 20:02:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[pr_Tudongtru_MH](@MaDonDatHang VARCHAR(10),@MaMH VARCHAR(10),@SLMua INT, @MaSize INT)
AS
BEGIN
	IF EXISTS(SELECT * FROM tblChiTietDatHang WHERE sMaDonDatHang = @MaDonDatHang AND sMaMH = @MaMH  AND iMaSize = @MaSize)
		BEGIN
			UPDATE tblKho
			SET iSoluong -= @SLMua
			WHERE sMaMH = @MaMH  AND iMaSize = @MaSize

			UPDATE tblPhieuXuatKho
			SET iMaTrangThai = '12',dThoigiansua = GETDATE()
			WHERE sMaDonDatHang = @MaDonDatHang
		END
	ELSE
		BEGIN
			INSERT INTO tblKho
			VALUES(@MaMH,@SLMua,@MaSize)
		END
END
GO
/****** Object:  StoredProcedure [dbo].[sua_Chitietdonhang]    Script Date: 11/10/2021 20:02:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sua_Chitietdonhang](@DonNhapHang VARCHAR(10),@MaMH VARCHAR(10), @Gianhap FLOAT, @Soluongnhap INT, @Mucchietkhau FLOAT,@Masize INT)
AS
BEGIN
	IF EXISTS (SELECT * FROM tblChiTietNhapHang WHERE sMaDonNhapHang = @DonNhapHang AND sMaMH = @MaMH AND iMaSize = @Masize)
		BEGIN
			UPDATE tblChiTietNhapHang
			SET iSoluongnhap += @Soluongnhap
			WHERE sMaDonNhapHang = @DonNhapHang AND sMaMH = @MaMH AND iMaSize = @Masize
		END
	ELSE
		BEGIN
			UPDATE tblChiTietNhapHang
			SET sMaMH = @MaMH, fGianhap = @Gianhap, iSoluongnhap = @Soluongnhap, fMucchietkhau = @Mucchietkhau,dThoigiansua = GETDATE(),iMaSize = @Masize
			WHERE sMaDonNhapHang = @DonNhapHang AND sMaMH = @MaMH AND iMaSize = @Masize
		END
END
GO
/****** Object:  StoredProcedure [dbo].[them_Chitietdonnhaphang]    Script Date: 11/10/2021 20:02:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[them_Chitietdonnhaphang](@DonNhapHang VARCHAR(50),@MaMH VARCHAR(50), @Gianhap FLOAT, @Soluongnhap INT, @Mucchietkhau FLOAT, @Masize INT)
AS
BEGIN
	INSERT INTO tblChiTietNhapHang
	VALUES(@DonNhapHang,@MaMH,@Gianhap,@Soluongnhap,@Masize,@Mucchietkhau,GETDATE(),null)
END
GO
/****** Object:  StoredProcedure [dbo].[them_Donnhaphang]    Script Date: 11/10/2021 20:02:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[them_Donnhaphang](@MaDonDatHang VARCHAR(50),@iMaNV INT, @iMaNSX INT)
AS
BEGIN
	INSERT INTO tblDonNhapHang
	VALUES(@MaDonDatHang,@iMaNV,@iMaNSX,GETDATE(),GETDATE(),NULL,'7')
END
GO
/****** Object:  StoredProcedure [dbo].[timkiem_Mathang]    Script Date: 11/10/2021 20:02:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[timkiem_Mathang](@id NVARCHAR(100))
AS
BEGIN
	SELECT tblMatHang.sMaMH,sTenMH,sHinhanh,fGianhap,sDonvitinh,sMota,tblMatHang.dThoigiantao,tblMatHang.dThoigiansua,sTenTrangThai,sTenLoaiMH
	FROM tblMatHang,tblTrangThai,tblLoaiTrangThai,tblLoaiMatHang,tblChiTietNhapHang
	WHERE tblMatHang.iMaTrangThai = tblTrangThai.iMaTrangThai AND tblTrangThai.iMaLoaiTrangThai = tblLoaiTrangThai.iMaLoaiTrangThai
		AND tblMatHang.iMaLoaiMH = tblLoaiMatHang.iMaLoaiMH AND tblChiTietNhapHang.sMaMH = tblMatHang.sMaMH
		AND tblMatHang.sMaMH IN (SELECT sMaMH FROM tblKho) AND sTenMH LIKE N'%' + @id + '%'
	GROUP BY tblMatHang.sMaMH,sTenMH,sHinhanh,fGianhap,sDonvitinh,sMota,tblMatHang.dThoigiantao,tblMatHang.dThoigiansua,sTenTrangThai,sTenLoaiMH
END
GO
/****** Object:  StoredProcedure [dbo].[xacnhan_Phieunhapkho]    Script Date: 11/10/2021 20:02:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[xacnhan_Phieunhapkho](@MaDonNhapHang VARCHAR(10),
@MaMH VARCHAR(10),@Soluongnhap INT,@MaSize INT)
AS
BEGIN
	IF EXISTS(SELECT * FROM tblChiTietNhapHang WHERE sMaDonNhapHang = @MaDonNhapHang AND sMaMH = @MaMH  AND iMaSize = @MaSize)
		BEGIN
			UPDATE tblKho
			SET iSoluong += @Soluongnhap
			WHERE sMaMH = @MaMH  AND iMaSize = @MaSize

			UPDATE tblPhieuNhapKho
			SET iMaTrangThai = '9',dThoigiansua = GETDATE()
			WHERE sMaDonNhapHang = @MaDonNhapHang
		END
	ELSE
		BEGIN
			INSERT INTO tblKho
			VALUES(@MaMH,@Soluongnhap,@MaSize)
		END
END
GO
/****** Object:  StoredProcedure [dbo].[xoa_Chitietdonnhaphang]    Script Date: 11/10/2021 20:02:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[xoa_Chitietdonnhaphang](@MaDonNhapHang VARCHAR(50), @MaMH VARCHAR(50),@iMaSize VARCHAR(50))
AS
BEGIN
	DELETE FROM tblChiTietNhapHang
	WHERE sMaDonNhapHang = @MaDonNhapHang AND sMaMH = @MaMH AND iMaSize = @iMaSize
END
GO
/****** Object:  StoredProcedure [dbo].[xoa_DDH_theoID]    Script Date: 11/10/2021 20:02:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[xoa_DDH_theoID](@MaDDH VARCHAR(50))
AS
BEGIN
	BEGIN
		DELETE FROM tblDonDatHang 
		WHERE sMaDonDatHang = @MaDDH AND sMaDonDatHang NOT IN (SELECT sMaDonDatHang FROM tblChiTietDatHang)
	END
END
GO
/****** Object:  StoredProcedure [dbo].[xoa_Mathang_CTDH]    Script Date: 11/10/2021 20:02:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[xoa_Mathang_CTDH](@MaDonDatHang VARCHAR(50),@MaMH VARCHAR(50), @MaSize INT)
AS
BEGIN
	DELETE FROM tblChiTietDatHang
	WHERE sMaMH = @MaMH AND iMaSize = @MaSize AND sMaDonDatHang = @MaDonDatHang
END
GO
USE [master]
GO
ALTER DATABASE [WebsiteBanHang_DATN_VER2] SET  READ_WRITE 
GO
