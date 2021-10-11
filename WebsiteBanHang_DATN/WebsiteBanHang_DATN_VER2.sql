﻿CREATE DATABASE WebsiteBanHang_DATN_VER2--COLLATE Vietnamese_CI_AS
ON(
	Name = WebsiteBanHang_DATN_VER2,
	FileName = 'D:\TAI LIEU HOC TAP\DO AN TOT NGHIEP\DO AN TOT NGHIEP\WebsiteBanHang_DATN_VER2.mdf'
  )

USE WebsiteBanHang_DATN_VER2;

CREATE TABLE tblMatHang 
( 
  sMaMH VARCHAR(10) PRIMARY KEY NOT NULL,
  sTenMH NVARCHAR(100) NOT NULL,
  sHinhanh VARCHAR(50) NOT NULL,
  sDonvitinh NVARCHAR(10) NOT NULL,
  sMota NVARCHAR(255) NOT NULL,
  iMaLoaiMH INT NOT NULL,
  dThoigiantao DATETIME,
  dThoigiansua DATETIME,
  iMaTrangThai INT NOT NULL
);

ALTER TABLE tblMatHang
ADD CONSTRAINT FK_MaLoaiMH FOREIGN KEY(iMaLoaiMH) REFERENCES tblLoaiMatHang(iMaLoaiMH),
CONSTRAINT FK_MaTT_MH FOREIGN KEY(iMaTrangThai) REFERENCES tblTrangThai(iMaTrangThai)

CREATE TABLE tblSize
(
	iMaSize INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	sTenSize VARCHAR(5) NOT NULL,
	sChieucao VARCHAR(20),
	sCannang VARCHAR(10)
)

CREATE TABLE tblDanhMuc
(
	iMaDM INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	sTenDM NVARCHAR(50) NOT NULL,
	dThoigiantao DATETIME,
	dThoigiansua DATETIME
);

SELECT * FROM tblDanhMuc

CREATE TABLE tblNhaSanXuat
(
	iMaNSX INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	sTenNSX NVARCHAR(100) NOT NULL,
	sDiachi NVARCHAR(100),
	sSdt VARCHAR(20),
	dThoigiantao DATETIME,
	dThoigiansua DATETIME
);

SELECT * FROM tblNhaSanXuat

DROP TABLE tblKho
CREATE TABLE tblKho
(
	iMaKho INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	sMaMH VARCHAR(10) NOT NULL,
	iSoluong INT NOT NULL,
	iMaSize INT NOT NULL
);

ALTER TABLE tblKho
ADD CONSTRAINT FK_MaMH FOREIGN KEY(sMaMH) REFERENCES tblMatHang(sMaMH),
CONSTRAINT FK_MaSize FOREIGN KEY(iMaSize) REFERENCES tblSize(iMaSize)

CREATE TABLE tblPhieuXuatKho
(
	sMaPhieuXuatKho VARCHAR(10) PRIMARY KEY NOT NULL,
	iMaNV INT NOT NULL,
	dNgayxuat DATETIME,
	dThoigiantao DATETIME,
	dThoigiansua DATETIME,
	iMaTrangThai INT NOT NULL,
	iMaKho INT NOT NULL,
	sMaDonDatHang VARCHAR(10) NOT NULL
);

ALTER TABLE tblPhieuXuatKho
ADD CONSTRAINT FK_MaNV FOREIGN KEY(iMaNV) REFERENCES tblNhanVien(iMaNV),
CONSTRAINT FK_MaTrangThai FOREIGN KEY(iMaTrangThai) REFERENCES tblTrangThai(iMaTrangThai),
CONSTRAINT FK_MaKho FOREIGN KEY(iMaKho) REFERENCES tblKho(iMaKho),
CONSTRAINT FK_MaDDH FOREIGN KEY(sMaDonDatHang) REFERENCES tblDonDatHang(sMaDonDatHang)

CREATE TABLE tblLoaiMatHang
(
	iMaLoaiMH INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	sTenLoaiMH NVARCHAR(50) NOT NULL,
	dThoigiantao DATETIME,
	dThoigiansua DATETIME,
	iMaDM INT NOT NULL
);

ALTER TABLE tblLoaiMatHang
ADD CONSTRAINT FK_MaDM FOREIGN KEY(iMaDM) REFERENCES tblDanhMuc(iMaDM)

CREATE TABLE tblDonNhapHang
(
	sMaDonNhapHang VARCHAR(10) PRIMARY KEY NOT NULL,
	iMaNV INT NOT NULL,
	iMaNSX INT NOT NULL,
	dNgaynhap DATETIME,
	dThoigiantao DATETIME,
	dThoigiansua DATETIME,
	iMaTrangThai INT NOT NULL
);

ALTER TABLE tblDonNhapHang
ADD CONSTRAINT FK_MaNV_DNH FOREIGN KEY(iMaNV) REFERENCES tblNhanVien(iMaNV),
CONSTRAINT FK_MaNSX2 FOREIGN KEY(iMaNSX) REFERENCES tblNhaSanXuat(iMaNSX),
CONSTRAINT FK_MaTT FOREIGN KEY(iMaTrangThai) REFERENCES tblTrangThai(iMaTrangThai)

DROP TABLE tblChiTietNhapHang
CREATE TABLE tblChiTietNhapHang
(
	sMaDonNhapHang VARCHAR(10) NOT NULL,
	sMaMH VARCHAR(10) NOT NULL,
	fGianhap FLOAT NOT NULL,
	iSoluongnhap INT NOT NULL,
	iMaSize INT NOT NULL,
	fMucchietkhau FLOAT,
	dThoigiantao DATETIME,
	dThoigiansua DATETIME
);

ALTER TABLE tblChiTietNhapHang
ADD CONSTRAINT FK_MaDonNhapHang FOREIGN KEY(sMaDonNhapHang) REFERENCES tblDonNhapHang(sMaDonNhapHang),
CONSTRAINT FK_MaMH_CTNH FOREIGN KEY(sMaMH) REFERENCES tblMatHang(sMaMH),
CONSTRAINT FK_MaSize_CTNH FOREIGN KEY(iMaSize) REFERENCES tblSize(iMaSize)

ALTER TABLE tblChiTietNhapHang
ADD CONSTRAINT PK_Primar PRIMARY KEY(sMaDonNhapHang,sMaMH,iMaSize)

CREATE TABLE tblTaiKhoan
(
	sTenDangNhap VARCHAR(50) PRIMARY KEY NOT NULL,
	sMatKhau VARCHAR(50) NOT NULL,
	sAnhdaidien VARCHAR(20),
	iMaTrangThai INT NOT NULL,
	iMaQuyen INT NOT NULL,
	dThoigiantao DATETIME,
	dThoigiansua DATETIME
);

ALTER TABLE tblTaiKhoan
ADD CONSTRAINT FK_MaTT_TK FOREIGN KEY(iMaTrangThai) REFERENCES tblTrangThai(iMaTrangThai),
CONSTRAINT FK_MaQuyen FOREIGN KEY(iMaQuyen) REFERENCES tblQuyen(iMaQuyen)

CREATE TABLE tblHeThong
(
	sMaCuaHang VARCHAR(50) PRIMARY KEY NOT NULL,
	sTenCuaHang NVARCHAR(255) NOT NULL,
	sSdt VARCHAR(20),
	sEmail VARCHAR(50),
	sDiaChi NVARCHAR(255),
	sGioMoCua VARCHAR(10),
	sGioDongCua VARCHAR(10),
	sMoTa NVARCHAR(255),
	sTenDangNhap VARCHAR(50) NOT NULL
);

ALTER TABLE tblHeThong
ADD CONSTRAINT FK_TK FOREIGN KEY(sTenDangNhap) REFERENCES tblTaiKhoan(sTenDangNhap)

CREATE TABLE tblTrangThai
(
	iMaTrangThai INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	sTenTrangThai NVARCHAR(50),
	iMaLoaiTrangThai INT NOT NULL
);

ALTER TABLE tblTrangThai
ADD CONSTRAINT FK_LTT FOREIGN KEY(iMaLoaiTrangThai) REFERENCES tblLoaiTrangThai(iMaLoaiTrangThai)

CREATE TABLE tblLoaiTrangThai
(
	iMaLoaiTrangThai INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	sTenLoaiTrangThai NVARCHAR(50)
)

CREATE TABLE tblDonDatHang
(
	sMaDonDatHang VARCHAR(10) PRIMARY KEY NOT NULL,
	iMaNV INT NOT NULL,
	iMaKH INT NOT NULL,
	dNgaydathang DATETIME,
	dNgaygiaohang DATETIME,
	sDiachigiaohang NVARCHAR(100),
	dThoigiantao DATETIME,
	dThoigiansua DATETIME,
	iMaTrangThai INT NOT NULL
);

ALTER TABLE tblDonDatHang
ADD CONSTRAINT FK_MaNV_DDH FOREIGN KEY(iMaNV) REFERENCES tblNhanVien(iMaNV),
CONSTRAINT FK_MaKH FOREIGN KEY(iMaKH) REFERENCES tblKhachHang(iMaKH),
CONSTRAINT FK_MaTT_DDH FOREIGN KEY(iMaTrangThai) REFERENCES tblTrangThai(iMaTrangThai)

CREATE TABLE tblChiTietDatHang
(
	sMaDonDatHang VARCHAR(10) NOT NULL,
	sMaMH VARCHAR(10) NOT NULL,
	iSLMua INT NOT NULL,
	iMaKM INT,
	dThoigiantao DATETIME,
	dThoigiansua DATETIME,
	iMaSize INT NOT NULL
);

ALTER TABLE tblChiTietDatHang
ADD CONSTRAINT FK_MaDonDatHang FOREIGN KEY(sMaDonDatHang) REFERENCES tblDonDatHang(sMaDonDatHang),
CONSTRAINT FK_MaMH_CTDH FOREIGN KEY(sMaMH) REFERENCES tblMatHang(sMaMH),
CONSTRAINT FK_MaKM FOREIGN KEY(iMaKM) REFERENCES tblKhuyenMai(iMaKM),
CONSTRAINT FK_MaSize_CTDH FOREIGN KEY(iMaSize) REFERENCES tblSize(iMaSize)

ALTER TABLE tblChiTietDatHang
ADD CONSTRAINT PK_CTDH PRIMARY KEY(sMaDonDatHang,sMaMH,iMaSize)

CREATE TABLE tblKhuyenMai
(
	iMaKM INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	sTenKM NVARCHAR(255),
	sMota NVARCHAR(255),
	sDonvitinh NVARCHAR(10),
	dThoigianbatdau DATETIME,
	dThoigianketthuc DATETIME,
	dThoigiantao DATETIME,
	dThoigiansua DATETIME
);

CREATE TABLE tblKhachHang
(
	iMaKH INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	sTenKH NVARCHAR(100) NOT NULL,
	sSdt VARCHAR(20),
	dNgaysinh DATETIME,
	sGioitinh NVARCHAR(5),
	sEmail VARCHAR(50),
	sDiachi NVARCHAR(100),
	sTenDangNhap VARCHAR(50),
	dThoigiantao DATETIME,
	dThoigiansua DATETIME
);

ALTER TABLE tblKhachHang
ADD CONSTRAINT FK_TenDangNhap FOREIGN KEY(sTenDangNhap) REFERENCES tblTaiKhoan(sTenDangNhap)

CREATE TABLE tblNhanVien
(
	iMaNV INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	sTenNV NVARCHAR(50) NOT NULL,
	sGioitinh NVARCHAR(5),
	dNgaysinh DATETIME,
	sSdt VARCHAR(20),
	sQuequan NVARCHAR(20),
	sEmail VARCHAR(50),
	dNgayvaolam DATETIME,
	sTenDangNhap VARCHAR(50) NOT NULL
);

ALTER TABLE tblKhachHang
ADD CONSTRAINT FK_TenDangNhap_NV FOREIGN KEY(sTenDangNhap) REFERENCES tblTaiKhoan(sTenDangNhap)

CREATE TABLE tblQuyen
(
	iMaQuyen INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	sTenQuyen NVARCHAR(50) NOT NULL,
	dThoigiantao DATETIME,
	dThoigiansua DATETIME
)

CREATE TABLE tblPhieuNhapKho
(
	sMaPhieuNhapKho VARCHAR(10) PRIMARY KEY NOT NULL,
	iMaNV INT NOT NULL,
	dNgaynhapkho DATETIME,
	dThoigiantao DATETIME,
	dThoigiansua DATETIME,
	iMaTrangThai INT NOT NULL,
	iMaKho INT NOT NULL,
	sMaDonNhapHang VARCHAR(10) NOT NULL
);

ALTER TABLE tblPhieuNhapKho
ADD CONSTRAINT FK_MaNV_PNK FOREIGN KEY(iMaNV) REFERENCES tblNhanVien(iMaNV),
CONSTRAINT FK_MaTrangThai_PNK FOREIGN KEY(iMaTrangThai) REFERENCES tblTrangThai(iMaTrangThai),
CONSTRAINT FK_PNK_Kho FOREIGN KEY(iMaKho) REFERENCES tblKho(iMaKho),
CONSTRAINT FK_MaDNH FOREIGN KEY(sMaDonNhapHang) REFERENCES tblDonNhapHang(sMaDonNhapHang)