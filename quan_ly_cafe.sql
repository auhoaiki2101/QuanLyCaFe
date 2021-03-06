USE [master]
GO
/****** Object:  Database [quan_ly_cafe]    Script Date: 11/14/2021 3:19:53 PM ******/
CREATE DATABASE [quan_ly_cafe]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'quan_ly_cafe', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\quan_ly_cafe.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'quan_ly_cafe_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\quan_ly_cafe_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [quan_ly_cafe] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [quan_ly_cafe].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [quan_ly_cafe] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [quan_ly_cafe] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [quan_ly_cafe] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [quan_ly_cafe] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [quan_ly_cafe] SET ARITHABORT OFF 
GO
ALTER DATABASE [quan_ly_cafe] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [quan_ly_cafe] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [quan_ly_cafe] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [quan_ly_cafe] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [quan_ly_cafe] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [quan_ly_cafe] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [quan_ly_cafe] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [quan_ly_cafe] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [quan_ly_cafe] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [quan_ly_cafe] SET  ENABLE_BROKER 
GO
ALTER DATABASE [quan_ly_cafe] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [quan_ly_cafe] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [quan_ly_cafe] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [quan_ly_cafe] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [quan_ly_cafe] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [quan_ly_cafe] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [quan_ly_cafe] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [quan_ly_cafe] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [quan_ly_cafe] SET  MULTI_USER 
GO
ALTER DATABASE [quan_ly_cafe] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [quan_ly_cafe] SET DB_CHAINING OFF 
GO
ALTER DATABASE [quan_ly_cafe] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [quan_ly_cafe] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [quan_ly_cafe] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [quan_ly_cafe] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [quan_ly_cafe] SET QUERY_STORE = OFF
GO
USE [quan_ly_cafe]
GO
/****** Object:  Table [dbo].[hanghoa]    Script Date: 11/14/2021 3:19:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[hanghoa](
	[ma_hh] [nvarchar](25) NOT NULL,
	[ten_hh] [nvarchar](25) NOT NULL,
	[soluong] [int] NOT NULL,
	[gia_sp] [int] NOT NULL,
	[ma_lh] [nvarchar](25) NOT NULL,
 CONSTRAINT [PK__hanghoa__0FE16E820BCDDB7E] PRIMARY KEY CLUSTERED 
(
	[ma_hh] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[func_timDoUongTheoTen]    Script Date: 11/14/2021 3:19:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[func_timDoUongTheoTen](@TenDoUong nchar(50))
returns table 
as 
return
	select * from hanghoa where ten_hh like '%' +  @TenDoUong + '%'
GO
/****** Object:  View [dbo].[view_DoUong]    Script Date: 11/14/2021 3:19:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[view_DoUong] as 
select a.ma_hh as N'Mã Đồ Uống', a.ten_hh as N'Tên Đồ Uống', a.soluong as N'Số Lượng', a.gia_sp as N'Giá', a.ma_lh as N'Danh Mục'
from hanghoa a
GO
/****** Object:  Table [dbo].[ban]    Script Date: 11/14/2021 3:19:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ban](
	[ma_ban] [nvarchar](25) NOT NULL,
	[ten_ban] [nvarchar](25) NOT NULL,
	[thuoc_tinh] [bit] NOT NULL,
 CONSTRAINT [PK__ban__03FFDF0D8766773E] PRIMARY KEY CLUSTERED 
(
	[ma_ban] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[view_Ban]    Script Date: 11/14/2021 3:19:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[view_Ban] as 
select a.ma_ban as N'Mã Bàn', a.ten_ban as N'Tên Bàn', a.thuoc_tinh as N'Thuộc Tính'
from ban a
GO
/****** Object:  Table [dbo].[nhanvien]    Script Date: 11/14/2021 3:19:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[nhanvien](
	[ma_nv] [nvarchar](25) NOT NULL,
	[ten_nv] [nvarchar](25) NOT NULL,
	[diachi] [nvarchar](25) NOT NULL,
	[sdt] [nvarchar](25) NOT NULL,
	[chucvu] [nvarchar](25) NOT NULL,
	[gioitinh] [nvarchar](25) NOT NULL,
	[ngay_vao_lam] [date] NOT NULL,
	[username] [nvarchar](25) NOT NULL,
	[password] [nvarchar](25) NOT NULL,
	[avatar] [varbinary](max) NULL,
 CONSTRAINT [PK__nhanvien__0FE15F7C86935464] PRIMARY KEY CLUSTERED 
(
	[ma_nv] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[view_NhanVien]    Script Date: 11/14/2021 3:19:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[view_NhanVien] as 
select a.ma_nv as N'Mã Nhân Viên', a.ten_nv as N'Tên Nhân Viên', a.diachi as N'Địa Chỉ', a.sdt as N'SĐT', a.chucvu as N'Chức Vụ', a.gioitinh as N'Giới Tính', a.ngay_vao_lam as N'Ngày Vào Làm'
from nhanvien a
GO
/****** Object:  Table [dbo].[chi_tiet_ban_hang]    Script Date: 11/14/2021 3:19:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[chi_tiet_ban_hang](
	[ma_hd] [nvarchar](25) NOT NULL,
	[ma_hh] [nvarchar](25) NOT NULL,
	[so_luong] [int] NULL,
 CONSTRAINT [PK_chi_tiet_ban_hang] PRIMARY KEY CLUSTERED 
(
	[ma_hd] ASC,
	[ma_hh] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[hoadon]    Script Date: 11/14/2021 3:19:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[hoadon](
	[ma_hd] [nvarchar](25) NOT NULL,
	[ngay_hd] [datetime] NOT NULL,
	[tong_tien] [int] NOT NULL,
	[ma_nv] [nvarchar](25) NOT NULL,
	[ma_ban] [nvarchar](25) NOT NULL,
 CONSTRAINT [PK__hoadon__0FE16E86E52A206F] PRIMARY KEY CLUSTERED 
(
	[ma_hd] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[loaihang]    Script Date: 11/14/2021 3:19:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[loaihang](
	[ma_lh] [nvarchar](25) NOT NULL,
	[ten_lh] [nvarchar](25) NOT NULL,
	[mo_ta] [nvarchar](50) NULL,
 CONSTRAINT [PK__loaihang__0FE08C0D10624044] PRIMARY KEY CLUSTERED 
(
	[ma_lh] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[ban] ([ma_ban], [ten_ban], [thuoc_tinh]) VALUES (N'1', N'Bàn 1                    ', 0)
INSERT [dbo].[ban] ([ma_ban], [ten_ban], [thuoc_tinh]) VALUES (N'10        ', N'Ban 10                   ', 0)
INSERT [dbo].[ban] ([ma_ban], [ten_ban], [thuoc_tinh]) VALUES (N'2         ', N'Bàn 2                    ', 0)
INSERT [dbo].[ban] ([ma_ban], [ten_ban], [thuoc_tinh]) VALUES (N'3         ', N'Ban 3                    ', 0)
INSERT [dbo].[ban] ([ma_ban], [ten_ban], [thuoc_tinh]) VALUES (N'4         ', N'ban 4                    ', 0)
INSERT [dbo].[ban] ([ma_ban], [ten_ban], [thuoc_tinh]) VALUES (N'5         ', N'Ban 5                    ', 0)
INSERT [dbo].[ban] ([ma_ban], [ten_ban], [thuoc_tinh]) VALUES (N'6         ', N'ban 6                    ', 0)
INSERT [dbo].[ban] ([ma_ban], [ten_ban], [thuoc_tinh]) VALUES (N'7         ', N'ban 7            ', 0)
INSERT [dbo].[ban] ([ma_ban], [ten_ban], [thuoc_tinh]) VALUES (N'8         ', N'ban 8                    ', 0)
INSERT [dbo].[ban] ([ma_ban], [ten_ban], [thuoc_tinh]) VALUES (N'9         ', N'ban 9                    ', 0)
GO
INSERT [dbo].[chi_tiet_ban_hang] ([ma_hd], [ma_hh], [so_luong]) VALUES (N'HD08181220211110', N'4         ', 6)
INSERT [dbo].[chi_tiet_ban_hang] ([ma_hd], [ma_hh], [so_luong]) VALUES (N'HD08181220211110', N'5         ', 3)
INSERT [dbo].[chi_tiet_ban_hang] ([ma_hd], [ma_hh], [so_luong]) VALUES (N'HD08181220211110', N'9         ', 6)
INSERT [dbo].[chi_tiet_ban_hang] ([ma_hd], [ma_hh], [so_luong]) VALUES (N'HD08400020211110', N'9         ', 3)
INSERT [dbo].[chi_tiet_ban_hang] ([ma_hd], [ma_hh], [so_luong]) VALUES (N'HD08401220211110', N'8         ', 3)
GO
INSERT [dbo].[hanghoa] ([ma_hh], [ten_hh], [soluong], [gia_sp], [ma_lh]) VALUES (N'1         ', N'SoDa Chanh               ', 10, 15000, N'1         ')
INSERT [dbo].[hanghoa] ([ma_hh], [ten_hh], [soluong], [gia_sp], [ma_lh]) VALUES (N'10        ', N'SoDa Cam                 ', 10, 15000, N'1         ')
INSERT [dbo].[hanghoa] ([ma_hh], [ten_hh], [soluong], [gia_sp], [ma_lh]) VALUES (N'11        ', N'Matcha Đã xay            ', 20, 30000, N'5         ')
INSERT [dbo].[hanghoa] ([ma_hh], [ten_hh], [soluong], [gia_sp], [ma_lh]) VALUES (N'12        ', N'Matcha Cream             ', 20, 30000, N'5         ')
INSERT [dbo].[hanghoa] ([ma_hh], [ten_hh], [soluong], [gia_sp], [ma_lh]) VALUES (N'2         ', N'Chanh Ðá                 ', 20, 15000, N'2         ')
INSERT [dbo].[hanghoa] ([ma_hh], [ten_hh], [soluong], [gia_sp], [ma_lh]) VALUES (N'3         ', N'Cafe                     ', 10, 20000, N'3         ')
INSERT [dbo].[hanghoa] ([ma_hh], [ten_hh], [soluong], [gia_sp], [ma_lh]) VALUES (N'4         ', N'Cafe Sữa                 ', 15, 15000, N'3         ')
INSERT [dbo].[hanghoa] ([ma_hh], [ten_hh], [soluong], [gia_sp], [ma_lh]) VALUES (N'5         ', N'Capuchino                ', 30, 30000, N'3         ')
INSERT [dbo].[hanghoa] ([ma_hh], [ten_hh], [soluong], [gia_sp], [ma_lh]) VALUES (N'6         ', N'Nước ép Cam              ', 20, 20000, N'4         ')
INSERT [dbo].[hanghoa] ([ma_hh], [ten_hh], [soluong], [gia_sp], [ma_lh]) VALUES (N'7         ', N'Nước ép táo              ', 40, 25000, N'4         ')
INSERT [dbo].[hanghoa] ([ma_hh], [ten_hh], [soluong], [gia_sp], [ma_lh]) VALUES (N'8         ', N'Nước ép Ổi               ', 20, 20000, N'4         ')
INSERT [dbo].[hanghoa] ([ma_hh], [ten_hh], [soluong], [gia_sp], [ma_lh]) VALUES (N'9         ', N'Bạc Xỉu                  ', 20, 15000, N'3         ')
GO
INSERT [dbo].[hoadon] ([ma_hd], [ngay_hd], [tong_tien], [ma_nv], [ma_ban]) VALUES (N'HD08181220211110', CAST(N'2021-11-10T20:18:12.930' AS DateTime), 270000, N'8', N'1')
INSERT [dbo].[hoadon] ([ma_hd], [ngay_hd], [tong_tien], [ma_nv], [ma_ban]) VALUES (N'HD08400020211110', CAST(N'2021-11-10T20:40:00.863' AS DateTime), 45000, N'8', N'1')
INSERT [dbo].[hoadon] ([ma_hd], [ngay_hd], [tong_tien], [ma_nv], [ma_ban]) VALUES (N'HD08401220211110', CAST(N'2021-11-10T20:40:12.533' AS DateTime), 60000, N'8', N'10        ')
INSERT [dbo].[hoadon] ([ma_hd], [ngay_hd], [tong_tien], [ma_nv], [ma_ban]) VALUES (N'hd123', CAST(N'2021-11-12T00:00:00.000' AS DateTime), 23000, N'8', N'1')
INSERT [dbo].[hoadon] ([ma_hd], [ngay_hd], [tong_tien], [ma_nv], [ma_ban]) VALUES (N'hd124', CAST(N'2021-11-12T00:00:00.000' AS DateTime), 23000, N'8', N'1')
INSERT [dbo].[hoadon] ([ma_hd], [ngay_hd], [tong_tien], [ma_nv], [ma_ban]) VALUES (N'hd125', CAST(N'2021-11-12T00:00:00.000' AS DateTime), 23000, N'8', N'1')
INSERT [dbo].[hoadon] ([ma_hd], [ngay_hd], [tong_tien], [ma_nv], [ma_ban]) VALUES (N'hd126', CAST(N'2021-11-12T00:00:00.000' AS DateTime), 23000, N'8', N'1')
INSERT [dbo].[hoadon] ([ma_hd], [ngay_hd], [tong_tien], [ma_nv], [ma_ban]) VALUES (N'hd127', CAST(N'2021-11-03T00:00:00.000' AS DateTime), 23000, N'8', N'1')
GO
INSERT [dbo].[loaihang] ([ma_lh], [ten_lh], [mo_ta]) VALUES (N'1         ', N'Nước Có Ga               ', N'Mô tả nước có ga                                  ')
INSERT [dbo].[loaihang] ([ma_lh], [ten_lh], [mo_ta]) VALUES (N'2         ', N'Nước đá                  ', N'Mô tả nước không có ga                            ')
INSERT [dbo].[loaihang] ([ma_lh], [ten_lh], [mo_ta]) VALUES (N'3         ', N'Nước Giải Khát           ', N'Mô tả nước giải khát                              ')
INSERT [dbo].[loaihang] ([ma_lh], [ten_lh], [mo_ta]) VALUES (N'4         ', N'Nước Có Men              ', N'Mô tả nước có men                                 ')
INSERT [dbo].[loaihang] ([ma_lh], [ten_lh], [mo_ta]) VALUES (N'5         ', N'CoockTail                ', N'Mô tả coocktail                                   ')
GO
INSERT [dbo].[nhanvien] ([ma_nv], [ten_nv], [diachi], [sdt], [chucvu], [gioitinh], [ngay_vao_lam], [username], [password], [avatar]) VALUES (N'1         ', N'Nguyễn Minh Khoa         ', N'Quận 9    ', N'0651321565', N'Thu Ngân  ', N'Nam       ', CAST(N'2021-10-29' AS Date), N'khoa', N'khoa', NULL)
INSERT [dbo].[nhanvien] ([ma_nv], [ten_nv], [diachi], [sdt], [chucvu], [gioitinh], [ngay_vao_lam], [username], [password], [avatar]) VALUES (N'2         ', N'Nguyễn Phước Tuân        ', N'Quận 2    ', N'0384583984', N'Nhân Viên ', N'Nam       ', CAST(N'2021-09-12' AS Date), N'tuan', N'tuan', NULL)
INSERT [dbo].[nhanvien] ([ma_nv], [ten_nv], [diachi], [sdt], [chucvu], [gioitinh], [ngay_vao_lam], [username], [password], [avatar]) VALUES (N'3         ', N'Phạm Hồng Hạnh           ', N'DĨ An     ', N'0927849783', N'Nhân Viên ', N'Nữ        ', CAST(N'2021-09-30' AS Date), N'hanh', N'hanh', NULL)
INSERT [dbo].[nhanvien] ([ma_nv], [ten_nv], [diachi], [sdt], [chucvu], [gioitinh], [ngay_vao_lam], [username], [password], [avatar]) VALUES (N'4         ', N'Nguyễn Minh Phước        ', N'Bình Thạnh', N'0928489327', N'Nhân Viên ', N'Nam       ', CAST(N'2021-05-27' AS Date), N'phuoc', N'phuoc', NULL)
INSERT [dbo].[nhanvien] ([ma_nv], [ten_nv], [diachi], [sdt], [chucvu], [gioitinh], [ngay_vao_lam], [username], [password], [avatar]) VALUES (N'5         ', N'Phan Thị Lan             ', N'Thu Duc   ', N'0828948273', N'Thu Ngân  ', N'Nữ        ', CAST(N'2021-07-12' AS Date), N'lann', N'lann', NULL)
INSERT [dbo].[nhanvien] ([ma_nv], [ten_nv], [diachi], [sdt], [chucvu], [gioitinh], [ngay_vao_lam], [username], [password], [avatar]) VALUES (N'7', N'Phước Tuân', N'KonTum', N'0193818822', N'Quản lý', N'Nam', CAST(N'2021-02-11' AS Date), N'ptuan', N'ptuan', NULL)
INSERT [dbo].[nhanvien] ([ma_nv], [ten_nv], [diachi], [sdt], [chucvu], [gioitinh], [ngay_vao_lam], [username], [password], [avatar]) VALUES (N'8', N'admin', N'admin', N'0123456789', N'Quản lý', N'Nam', CAST(N'2021-01-01' AS Date), N'admin', N'admin', NULL)
GO
ALTER TABLE [dbo].[chi_tiet_ban_hang]  WITH CHECK ADD  CONSTRAINT [FK__chi_tiet___ma_hd__3C69FB99] FOREIGN KEY([ma_hd])
REFERENCES [dbo].[hoadon] ([ma_hd])
GO
ALTER TABLE [dbo].[chi_tiet_ban_hang] CHECK CONSTRAINT [FK__chi_tiet___ma_hd__3C69FB99]
GO
ALTER TABLE [dbo].[chi_tiet_ban_hang]  WITH CHECK ADD  CONSTRAINT [FK__chi_tiet___ma_hh__47DBAE45] FOREIGN KEY([ma_hh])
REFERENCES [dbo].[hanghoa] ([ma_hh])
GO
ALTER TABLE [dbo].[chi_tiet_ban_hang] CHECK CONSTRAINT [FK__chi_tiet___ma_hh__47DBAE45]
GO
ALTER TABLE [dbo].[hanghoa]  WITH CHECK ADD  CONSTRAINT [FK__hanghoa__ma_lh__4AB81AF0] FOREIGN KEY([ma_lh])
REFERENCES [dbo].[loaihang] ([ma_lh])
GO
ALTER TABLE [dbo].[hanghoa] CHECK CONSTRAINT [FK__hanghoa__ma_lh__4AB81AF0]
GO
ALTER TABLE [dbo].[hoadon]  WITH CHECK ADD  CONSTRAINT [FK__hoadon__ma_ban__4BAC3F29] FOREIGN KEY([ma_ban])
REFERENCES [dbo].[ban] ([ma_ban])
GO
ALTER TABLE [dbo].[hoadon] CHECK CONSTRAINT [FK__hoadon__ma_ban__4BAC3F29]
GO
ALTER TABLE [dbo].[hoadon]  WITH CHECK ADD  CONSTRAINT [FK__hoadon__ma_nv__4D94879B] FOREIGN KEY([ma_nv])
REFERENCES [dbo].[nhanvien] ([ma_nv])
GO
ALTER TABLE [dbo].[hoadon] CHECK CONSTRAINT [FK__hoadon__ma_nv__4D94879B]
GO
ALTER TABLE [dbo].[hanghoa]  WITH CHECK ADD  CONSTRAINT [ck_hanghoa] CHECK  (([gia_sp]>(0)))
GO
ALTER TABLE [dbo].[hanghoa] CHECK CONSTRAINT [ck_hanghoa]
GO
ALTER TABLE [dbo].[hanghoa]  WITH CHECK ADD  CONSTRAINT [ck_soluong_hh] CHECK  (([soluong]>=(0)))
GO
ALTER TABLE [dbo].[hanghoa] CHECK CONSTRAINT [ck_soluong_hh]
GO
ALTER TABLE [dbo].[nhanvien]  WITH CHECK ADD  CONSTRAINT [ck_ngaylam] CHECK  (([ngay_vao_lam]<=getdate()))
GO
ALTER TABLE [dbo].[nhanvien] CHECK CONSTRAINT [ck_ngaylam]
GO
ALTER TABLE [dbo].[nhanvien]  WITH CHECK ADD  CONSTRAINT [ck_sdt_nv] CHECK  ((len([sdt])>(9) AND len([sdt])<(11)))
GO
ALTER TABLE [dbo].[nhanvien] CHECK CONSTRAINT [ck_sdt_nv]
GO
/****** Object:  StoredProcedure [dbo].[ban_delete]    Script Date: 11/14/2021 3:19:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[ban_delete](
	@ma_ban nvarchar(25)
	)
as
begin
	delete from ban where ma_ban = @ma_ban
end
GO
/****** Object:  StoredProcedure [dbo].[ban_insert]    Script Date: 11/14/2021 3:19:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[ban_insert](
	@ma_ban nvarchar(25),
	@ten_ban nvarchar(25),
	@thuoc_tinh bit
	)
as
begin
	insert into ban(ma_ban, ten_ban, thuoc_tinh) values (@ma_ban, @ten_ban, @thuoc_tinh)
end
GO
/****** Object:  StoredProcedure [dbo].[ban_selectall]    Script Date: 11/14/2021 3:19:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[ban_selectall]
as
begin
	select * from ban
end
GO
/****** Object:  StoredProcedure [dbo].[ban_update]    Script Date: 11/14/2021 3:19:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[ban_update](
	@ma_ban nvarchar(25),
	@ten_ban nvarchar(25),
	@thuoc_tinh bit
	)
as
begin
	update ban set ten_ban = @ten_ban, thuoc_tinh = @thuoc_tinh where ma_ban = @ma_ban
end
GO
/****** Object:  StoredProcedure [dbo].[chi_tiet_bh_delete]    Script Date: 11/14/2021 3:19:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[chi_tiet_bh_delete](
	@mahd nvarchar(25)
)
as
begin
	delete from chi_tiet_ban_hang where ma_hd = @mahd
end
GO
/****** Object:  StoredProcedure [dbo].[chi_tiet_bh_insert]    Script Date: 11/14/2021 3:19:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[chi_tiet_bh_insert](
	@mahd nvarchar(25),
	@mahh nvarchar(25),
	@so_luong int
)
as
begin
	insert into chi_tiet_ban_hang(ma_hd, ma_hh, so_luong) values (@mahd, @mahh, @so_luong)
end
GO
/****** Object:  StoredProcedure [dbo].[chi_tiet_bh_selectall]    Script Date: 11/14/2021 3:19:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[chi_tiet_bh_selectall]
as
begin
	select * from chi_tiet_ban_hang
end
GO
/****** Object:  StoredProcedure [dbo].[chi_tiet_bh_update]    Script Date: 11/14/2021 3:19:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[chi_tiet_bh_update](
	@mahd nvarchar(25),
	@mahh nvarchar(25),
	@so_luong int
)
as
begin
	update chi_tiet_ban_hang set ma_hh = @mahh, so_luong= @so_luong where ma_hd = @mahd
end
GO
/****** Object:  StoredProcedure [dbo].[doanh_thu]    Script Date: 11/14/2021 3:19:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[doanh_thu]
as
begin
	select year(ngay_hd) nam, sum(tong_tien) doanh_thu
	from hoadon
	group by year(ngay_hd)
end
GO
/****** Object:  StoredProcedure [dbo].[doanh_thu_nam]    Script Date: 11/14/2021 3:19:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[doanh_thu_nam]
(	
	@nam int
)
as
begin
	select month(ngay_hd) thang, sum(tong_tien) doanh_thu
	from hoadon where year(ngay_hd) = @nam
	group by month(ngay_hd)

end
GO
/****** Object:  StoredProcedure [dbo].[doanh_thu_thang]    Script Date: 11/14/2021 3:19:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[doanh_thu_thang]
(	
	@thang int,
	@nam int
)
as
begin
	select day(ngay_hd) ngay, sum(tong_tien) doanh_thu
	from hoadon where month(ngay_hd) = @thang and year(ngay_hd) = @nam
	group by day(ngay_hd)

end
GO
/****** Object:  StoredProcedure [dbo].[douong_delete]    Script Date: 11/14/2021 3:19:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[douong_delete](
	@ma_hh nvarchar(25)
	)
as
begin
	delete from hanghoa where ma_hh = @ma_hh
end
GO
/****** Object:  StoredProcedure [dbo].[douong_insert]    Script Date: 11/14/2021 3:19:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[douong_insert](
	@ma_hh nvarchar(25),
	@ten_hh nvarchar(25),
	@soluong int,
	@gia_sp int,
	@ma_lh nvarchar(25)
	)
as
begin
	insert into hanghoa(ma_hh, ten_hh, soluong, gia_sp, ma_lh) values (@ma_hh, @ten_hh, @soluong, @gia_sp, @ma_hh)
end
GO
/****** Object:  StoredProcedure [dbo].[douong_selectall]    Script Date: 11/14/2021 3:19:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[douong_selectall]
as
begin
	select * from hanghoa
end
GO
/****** Object:  StoredProcedure [dbo].[douong_update]    Script Date: 11/14/2021 3:19:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[douong_update](
	@ma_hh nvarchar(25),
	@ten_hh nvarchar(25),
	@soluong int,
	@gia_sp int,
	@ma_lh nvarchar(25)
	)
as
begin
	update hanghoa set ten_hh = @ten_hh, soluong = @soluong, gia_sp = @gia_sp, ma_lh = @ma_lh where ma_hh = @ma_hh
end
GO
/****** Object:  StoredProcedure [dbo].[hoadon_delete]    Script Date: 11/14/2021 3:19:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[hoadon_delete](
	@ma_hd nvarchar(25)
)
as
begin
	delete from hoadon where ma_hd = @ma_hd
end
GO
/****** Object:  StoredProcedure [dbo].[hoadon_insert]    Script Date: 11/14/2021 3:19:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[hoadon_insert](
	@ma_hd nvarchar(25),
	@ngay_hd datetime,
	@tong_tien int,
	@ma_nv nvarchar(25),
	@ma_ban nvarchar(25)
)
as
begin
	insert into hoadon(ma_hd, ngay_hd, tong_tien, ma_nv, ma_ban) values (@ma_hd, @ngay_hd, @tong_tien, @ma_nv, @ma_ban)
end
GO
/****** Object:  StoredProcedure [dbo].[hoadon_selectall]    Script Date: 11/14/2021 3:19:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[hoadon_selectall]
as
begin
	select * from hoadon
end
GO
/****** Object:  StoredProcedure [dbo].[hoadon_update]    Script Date: 11/14/2021 3:19:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[hoadon_update](
	@ma_hd nvarchar(25),
	@ngay_hd datetime,
	@tong_tien int,
	@ma_nv nvarchar(25),
	@ma_ban nvarchar(25)
)
as
begin
	update hoadon set ngay_hd = @ngay_hd, tong_tien = @tong_tien, ma_nv = @ma_nv, ma_ban = @ma_ban where ma_hd = @ma_hd
end
GO
/****** Object:  StoredProcedure [dbo].[loaihang_delete]    Script Date: 11/14/2021 3:19:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[loaihang_delete](
	@ma_lh nvarchar(25)
)
as
begin
	delete from loaihang where ma_lh = @ma_lh
end
GO
/****** Object:  StoredProcedure [dbo].[loaihang_insert]    Script Date: 11/14/2021 3:19:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[loaihang_insert](
	@ma_lh nvarchar(25),
	@ten_lh nvarchar(25),
	@mo_ta nvarchar(50)
	)
as
begin
	insert into loaihang(ma_lh, ten_lh, mo_ta) values (@ma_lh, @ten_lh, @mo_ta)
end
GO
/****** Object:  StoredProcedure [dbo].[loaihang_selectall]    Script Date: 11/14/2021 3:19:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[loaihang_selectall]
as
begin
	select * from loaihang
end
GO
/****** Object:  StoredProcedure [dbo].[loaihang_update]    Script Date: 11/14/2021 3:19:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[loaihang_update](
	@ma_lh nvarchar(25),
	@ten_lh nvarchar(25),
	@mo_ta nvarchar(50)
)
as
begin
	update loaihang set ten_lh = @ten_lh, mo_ta = @mo_ta where ma_lh = @ma_lh
end
GO
/****** Object:  StoredProcedure [dbo].[nhanvien_delete]    Script Date: 11/14/2021 3:19:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[nhanvien_delete](
	@ma_nv nvarchar(25)
	)
as
begin
	delete from nhanvien where ma_nv = @ma_nv
end
GO
/****** Object:  StoredProcedure [dbo].[nhanvien_insert]    Script Date: 11/14/2021 3:19:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[nhanvien_insert](
	@ma_nv nvarchar(25),
	@ten_nv nvarchar(25),
	@diachi nvarchar(25),
	@sdt nvarchar(25),
	@chucvu nvarchar(25),
	@gioitinh nvarchar(25),
	@ngay_vao_lam date,
	@username nvarchar(25),
	@password nvarchar(25),
	@avatar varbinary(MAX)
	)
as
begin
	insert into nhanvien (ma_nv, ten_nv, diachi, sdt, chucvu, gioitinh, ngay_vao_lam, username, password, avatar) values (@ma_nv, @ten_nv, @diachi, @sdt, @chucvu, @gioitinh, @ngay_vao_lam, @username, @password, @avatar)
end
GO
/****** Object:  StoredProcedure [dbo].[nhanvien_selectall]    Script Date: 11/14/2021 3:19:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[nhanvien_selectall]
as
begin
	select * from nhanvien
end
GO
/****** Object:  StoredProcedure [dbo].[nhanvien_update]    Script Date: 11/14/2021 3:19:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[nhanvien_update](
	@ma_nv nvarchar(25),
	@ten_nv nvarchar(25),
	@diachi nvarchar(25),
	@sdt nvarchar(25),
	@chucvu nvarchar(25),
	@gioitinh nvarchar(25),
	@ngay_vao_lam date,
	@username nvarchar(25),
	@password nvarchar(25),
	@avatar varbinary(MAX)
	)
as
begin
	update nhanvien set ten_nv = @ten_nv, diachi = @diachi, sdt = @sdt, chucvu = @chucvu, gioitinh = @gioitinh, ngay_vao_lam = @ngay_vao_lam, username= @username, password = @password, avatar = @avatar where ma_nv = @ma_nv
end
GO
/****** Object:  StoredProcedure [dbo].[thanhtoan]    Script Date: 11/14/2021 3:19:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[thanhtoan]
(	
	@ma_ban nvarchar(25)
)
as
begin
	declare @Tong_Tien table(name nvarchar(25) ,count int, price int, total int)
	insert into @Tong_Tien EXEC tinhtien @ma_ban
	declare @tt int
	select SUM(total) from @Tong_Tien
end
GO
/****** Object:  StoredProcedure [dbo].[tinhtien]    Script Date: 11/14/2021 3:19:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[tinhtien]
(	
	@ma_ban nvarchar(25)
)
as
begin
	select ten_hh as name, chi_tiet_ban_hang.so_luong as count , gia_sp as price, (chi_tiet_ban_hang.so_luong*gia_sp) as total
	from(select * from hoadon where ma_ban = @ma_ban and tong_tien = 0) a
	  inner join chi_tiet_ban_hang ON a.ma_hd = chi_tiet_ban_hang.ma_hd
	  inner join hanghoa ON chi_tiet_ban_hang.ma_hh = hanghoa.ma_hh

end
GO
/****** Object:  Trigger [dbo].[CHECK_BAN]    Script Date: 11/14/2021 3:19:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create TRIGGER [dbo].[CHECK_BAN] --Tên Trigger
ON [dbo].[ban]
FOR UPDATE,INSERT
AS
BEGIN
	DECLARE @Ban AS NCHAR(50), @TEMP AS INT
		SELECT @Ban=inserted.ten_ban FROM inserted
		SELECT @TEMP=COUNT(*) FROM ban
		WHERE ten_ban=@Ban
		IF (@TEMP>1)
	BEGIN
		PRINT N'Bàn này đã tồn tại'
		ROLLBACK TRANSACTION
	END
END
GO
ALTER TABLE [dbo].[ban] ENABLE TRIGGER [CHECK_BAN]
GO
/****** Object:  Trigger [dbo].[CHECK_HANG_HOA]    Script Date: 11/14/2021 3:19:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create TRIGGER [dbo].[CHECK_HANG_HOA] --Tên Trigger
ON [dbo].[hanghoa]
FOR UPDATE,INSERT
AS
BEGIN
	DECLARE @HangHoa AS NCHAR(50), @TEMP AS INT
		SELECT @HangHoa=inserted.ten_hh FROM inserted
		SELECT @TEMP=COUNT(*) FROM hanghoa
		WHERE ten_hh=@HangHoa
		IF (@TEMP>1)
	BEGIN
		PRINT N'Hàng hóa này đã tồn tại'
		ROLLBACK TRANSACTION
	END
END
GO
ALTER TABLE [dbo].[hanghoa] ENABLE TRIGGER [CHECK_HANG_HOA]
GO
/****** Object:  Trigger [dbo].[CHECK_LOAIHANG]    Script Date: 11/14/2021 3:19:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create TRIGGER [dbo].[CHECK_LOAIHANG] --Tên Trigger
ON [dbo].[loaihang]
FOR UPDATE,INSERT
AS
BEGIN
	DECLARE @LoaiHang AS NCHAR(50), @TEMP AS INT
	SELECT @LoaiHang=inserted.ten_lh FROM inserted
	SELECT @TEMP=COUNT(*) FROM dbo.loaihang
	WHERE ten_lh=@LoaiHang
	IF (@TEMP>1)
	BEGIN
		PRINT N'Loại hàng này đã tồn tại'
		ROLLBACK TRANSACTION
	END
END
GO
ALTER TABLE [dbo].[loaihang] ENABLE TRIGGER [CHECK_LOAIHANG]
GO
/****** Object:  Trigger [dbo].[CHECK_PASS]    Script Date: 11/14/2021 3:19:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create trigger [dbo].[CHECK_PASS] on [dbo].[nhanvien]
after update, insert as
begin
	DECLARE  @PassWord_new varchar(30)
	select @PassWord_new=new.password from inserted new
	if(len(@PassWord_new) < 4)
	begin
		print('Minimum password length is 4 characters');
		rollback transaction;
	end
end
GO
ALTER TABLE [dbo].[nhanvien] ENABLE TRIGGER [CHECK_PASS]
GO
/****** Object:  Trigger [dbo].[CHECK_USERS]    Script Date: 11/14/2021 3:19:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create TRIGGER [dbo].[CHECK_USERS] --Tên Trigger
ON [dbo].[nhanvien]
FOR UPDATE,INSERT
AS
BEGIN
	DECLARE @USERNAME AS NCHAR(50), @TEMP AS INT
	SELECT @USERNAME=inserted.username FROM inserted
	SELECT @TEMP=COUNT(*) FROM dbo.nhanvien
	WHERE username=@USERNAME
	IF (@TEMP>1)
	BEGIN
		PRINT N'Tài khoản này đã tồn tại'
		ROLLBACK TRANSACTION
	END
END
GO
ALTER TABLE [dbo].[nhanvien] ENABLE TRIGGER [CHECK_USERS]
GO
USE [master]
GO
ALTER DATABASE [quan_ly_cafe] SET  READ_WRITE 
GO
