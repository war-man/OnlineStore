USE [master]
GO
/****** Object:  Database [OnlineStoreDB]    Script Date: 2019-03-24 10:07:39 PM ******/
CREATE DATABASE [OnlineStoreDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'OnlineStoreDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLEXPRESS\MSSQL\DATA\OnlineStoreDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'OnlineStoreDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLEXPRESS\MSSQL\DATA\OnlineStoreDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [OnlineStoreDB] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [OnlineStoreDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [OnlineStoreDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [OnlineStoreDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [OnlineStoreDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [OnlineStoreDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [OnlineStoreDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [OnlineStoreDB] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [OnlineStoreDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [OnlineStoreDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [OnlineStoreDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [OnlineStoreDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [OnlineStoreDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [OnlineStoreDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [OnlineStoreDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [OnlineStoreDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [OnlineStoreDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [OnlineStoreDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [OnlineStoreDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [OnlineStoreDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [OnlineStoreDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [OnlineStoreDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [OnlineStoreDB] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [OnlineStoreDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [OnlineStoreDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [OnlineStoreDB] SET  MULTI_USER 
GO
ALTER DATABASE [OnlineStoreDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [OnlineStoreDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [OnlineStoreDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [OnlineStoreDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [OnlineStoreDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [OnlineStoreDB] SET QUERY_STORE = OFF
GO
USE [OnlineStoreDB]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [OnlineStoreDB]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 2019-03-24 10:07:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Address]    Script Date: 2019-03-24 10:07:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Address](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Ward] [nvarchar](200) NULL,
	[District] [nvarchar](200) NULL,
	[Province] [nvarchar](200) NULL,
	[Detail] [nvarchar](200) NULL,
	[Timestamp] [timestamp] NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[Deleted] [bit] NULL,
 CONSTRAINT [PK_Address] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cart]    Script Date: 2019-03-24 10:07:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Timestamp] [timestamp] NULL,
	[CustomerId] [int] NOT NULL,
	[Deleted] [bit] NULL,
 CONSTRAINT [PK_Cart] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CartDetail]    Script Date: 2019-03-24 10:07:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CartDetail](
	[CartId] [int] NOT NULL,
	[ItemId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Timestamp] [timestamp] NULL,
	[Deleted] [bit] NULL,
 CONSTRAINT [PK_CartDetail] PRIMARY KEY CLUSTERED 
(
	[ItemId] ASC,
	[CartId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 2019-03-24 10:07:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Timestamp] [timestamp] NULL,
	[Name] [nvarchar](200) NOT NULL,
	[Deleted] [bit] NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comment]    Script Date: 2019-03-24 10:07:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comment](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Timestamp] [timestamp] NULL,
	[Content] [nvarchar](200) NULL,
	[ItemId] [int] NOT NULL,
	[Evaluation] [int] NOT NULL,
	[CustomerId] [int] NOT NULL,
	[Deleted] [bit] NULL,
 CONSTRAINT [PK_Comment] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 2019-03-24 10:07:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Timestamp] [timestamp] NULL,
	[FullName] [nvarchar](100) NOT NULL,
	[PhoneNumber] [nvarchar](max) NOT NULL,
	[Email] [varchar](100) NOT NULL,
	[Password] [nvarchar](max) NOT NULL,
	[Status] [int] NOT NULL,
	[TypeOfCustomerId] [int] NOT NULL,
	[Gender] [int] NOT NULL,
	[DateOfBirth] [date] NULL,
	[Deleted] [bit] NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer_Address]    Script Date: 2019-03-24 10:07:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer_Address](
	[CustomerId] [int] NOT NULL,
	[AddressId] [int] NOT NULL,
 CONSTRAINT [PK_Customer_Address] PRIMARY KEY CLUSTERED 
(
	[CustomerId] ASC,
	[AddressId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Event]    Script Date: 2019-03-24 10:07:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Event](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Timestamp] [timestamp] NULL,
	[Name] [nvarchar](200) NOT NULL,
	[Description] [nvarchar](500) NULL,
	[Bonus] [decimal](18, 2) NOT NULL,
	[StartDate] [datetime2](7) NOT NULL,
	[EndDate] [datetime2](7) NOT NULL,
	[Deleted] [bit] NULL,
 CONSTRAINT [PK_Event] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GoodsReceipt]    Script Date: 2019-03-24 10:07:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GoodsReceipt](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Timestamp] [timestamp] NULL,
	[SupplierId] [int] NOT NULL,
	[TotalAmount] [decimal](18, 2) NOT NULL,
	[Deleted] [bit] NULL,
 CONSTRAINT [PK_GoodsReceipt] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GoodsReceiptDetail]    Script Date: 2019-03-24 10:07:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GoodsReceiptDetail](
	[GoodsReceiptId] [int] NOT NULL,
	[ItemId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Timestamp] [timestamp] NULL,
	[Deleted] [bit] NULL,
 CONSTRAINT [PK_GoodsReceiptDetail] PRIMARY KEY CLUSTERED 
(
	[ItemId] ASC,
	[GoodsReceiptId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ImageEvent]    Script Date: 2019-03-24 10:07:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ImageEvent](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Directory] [nvarchar](max) NULL,
	[Deleted] [bit] NULL,
	[EventId] [int] NULL,
	[Timestamp] [timestamp] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ImageProduct]    Script Date: 2019-03-24 10:07:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ImageProduct](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Url] [nvarchar](max) NULL,
	[ItemId] [int] NULL,
	[Timestamp] [timestamp] NULL,
	[Deleted] [bit] NULL,
 CONSTRAINT [PK__ImagePro__3214EC079E4A12CA] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Item]    Script Date: 2019-03-24 10:07:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Item](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Timestamp] [timestamp] NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Image] [nvarchar](max) NULL,
	[Inventory] [int] NOT NULL,
	[View] [int] NULL,
	[CategoryId] [int] NOT NULL,
	[Deleted] [bit] NOT NULL,
	[AverageEvaluation] [decimal](18, 2) NULL,
	[EventId] [int] NULL,
	[BrandName] [nvarchar](max) NULL,
 CONSTRAINT [PK_Item] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LineItem]    Script Date: 2019-03-24 10:07:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LineItem](
	[OrderId] [int] NOT NULL,
	[ItemId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Timestamp] [timestamp] NULL,
	[Amount] [decimal](18, 2) NOT NULL,
	[Deleted] [bit] NULL,
 CONSTRAINT [PK_LineItem] PRIMARY KEY CLUSTERED 
(
	[ItemId] ASC,
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 2019-03-24 10:07:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Timestamp] [timestamp] NOT NULL,
	[DeliveryDate] [datetime2](7) NULL,
	[Bonus] [decimal](18, 2) NULL,
	[EmployeeId] [int] NULL,
	[CustomerId] [int] NOT NULL,
	[ShippingFee] [decimal](18, 2) NULL,
	[Status] [int] NULL,
	[OrderDate] [datetime2](7) NULL,
	[AddressId] [int] NULL,
	[Deleted] [bit] NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 2019-03-24 10:07:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Timestamp] [timestamp] NULL,
	[Name] [nvarchar](200) NULL,
	[Description] [nvarchar](500) NULL,
	[Deleted] [bit] NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Supplier]    Script Date: 2019-03-24 10:07:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Supplier](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Timestamp] [timestamp] NULL,
	[Name] [nvarchar](200) NULL,
	[Address] [nvarchar](200) NULL,
	[PhoneNumber] [varchar](20) NULL,
	[Email] [varchar](100) NULL,
	[Deleted] [bit] NULL,
 CONSTRAINT [PK_Supplier] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TypeOfCustomer]    Script Date: 2019-03-24 10:07:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TypeOfCustomer](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Timestamp] [timestamp] NULL,
	[Name] [nvarchar](200) NOT NULL,
	[Deleted] [bit] NULL,
 CONSTRAINT [PK_TypeOfCustomer] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TypeOfUser]    Script Date: 2019-03-24 10:07:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TypeOfUser](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Timestamp] [timestamp] NULL,
	[Name] [nvarchar](200) NOT NULL,
	[Deleted] [bit] NULL,
 CONSTRAINT [PK_TypeOfUser] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 2019-03-24 10:07:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Timestamp] [timestamp] NULL,
	[FullName] [nvarchar](100) NOT NULL,
	[PhoneNumber] [varchar](20) NULL,
	[Email] [nvarchar](max) NULL,
	[TypeOfUserId] [int] NULL,
	[Username] [nvarchar](max) NULL,
	[Password] [nvarchar](max) NULL,
	[Status] [int] NOT NULL,
	[Gender] [int] NOT NULL,
	[Deleted] [bit] NULL,
	[AddressId] [int] NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserDecentralization]    Script Date: 2019-03-24 10:07:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserDecentralization](
	[TypeOfUserId] [int] NOT NULL,
	[RoleId] [int] NOT NULL,
	[Timestamp] [timestamp] NULL,
	[Deleted] [bit] NULL,
 CONSTRAINT [PK_UserDecentralization] PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC,
	[TypeOfUserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20181107050735_Initial20181107', N'2.1.4-rtm-31024')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20181108091349_TestThemData', N'2.1.4-rtm-31024')
SET IDENTITY_INSERT [dbo].[Address] ON 

INSERT [dbo].[Address] ([Id], [Ward], [District], [Province], [Detail], [PhoneNumber], [Deleted]) VALUES (4, N'Linh Chiểu', N'Thủ Đức', N'Hồ Chí Minh', N'Trường ĐH Sư Phạm Kỹ Thuật Tp. HCM (1 Võ Văn Ngân, Linh Chiểu, Thủ Đức, Hồ Chí Minh)', N'0972626571', 0)
INSERT [dbo].[Address] ([Id], [Ward], [District], [Province], [Detail], [PhoneNumber], [Deleted]) VALUES (9, N'Xã test', N'Quận test', N'Bà Rịa-Vũng Tàu', N'Như trên', N'09123455678', 0)
SET IDENTITY_INSERT [dbo].[Address] OFF
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([Id], [Name], [Deleted]) VALUES (1, N'Điện thoại', 0)
INSERT [dbo].[Category] ([Id], [Name], [Deleted]) VALUES (2, N'Laptop', 0)
INSERT [dbo].[Category] ([Id], [Name], [Deleted]) VALUES (3, N'Máy tính bảng', 0)
INSERT [dbo].[Category] ([Id], [Name], [Deleted]) VALUES (4, N'Phụ kiện', 0)
SET IDENTITY_INSERT [dbo].[Category] OFF
SET IDENTITY_INSERT [dbo].[GoodsReceipt] ON 

INSERT [dbo].[GoodsReceipt] ([Id], [SupplierId], [TotalAmount], [Deleted]) VALUES (6, 1, CAST(100000000.00 AS Decimal(18, 2)), 0)
SET IDENTITY_INSERT [dbo].[GoodsReceipt] OFF
INSERT [dbo].[GoodsReceiptDetail] ([GoodsReceiptId], [ItemId], [Quantity], [Deleted]) VALUES (6, 15, 500, 0)
SET IDENTITY_INSERT [dbo].[Item] ON 

INSERT [dbo].[Item] ([Id], [Name], [Price], [Description], [Image], [Inventory], [View], [CategoryId], [Deleted], [AverageEvaluation], [EventId], [BrandName]) VALUES (1, N'Apple iPhone 8 Plus 64GB Gold', CAST(20490000.00 AS Decimal(18, 2)), N'<ul class="">
<li class="" data-spm-anchor-id="a2o4n.pdp.product_detail.i1.fd0aa738K77nkd">&Aacute;p dụng cho kh&aacute;ch h&agrave;ng thanh to&aacute;n bằng thẻ HSBC&Aacute;p dụng cho đơn h&agrave;ng tr&ecirc;n 3 triệu</li>
<li class="">M&atilde; h&agrave;ng VN/A d&agrave;nh cho thị trường Việt NamH&agrave;ng mới 100%, ch&iacute;nh h&atilde;ng, nguy&ecirc;n seal</li>
<li class="">M&agrave;n h&igrave;nh Retina HD 5.5 inch với True Tone</li>
<li class="">Thiết kế ho&agrave;n to&agrave;n bằng k&iacute;nh v&agrave; nh&ocirc;m, chống nước v&agrave; chống bụi</li>
<li class="">Camera k&eacute;p 12MP với OIS, chế độ chụp Ch&acirc;n dung, hiệu ứng Chiếu s&aacute;ng ch&acirc;n dung v&agrave; video 4K tốc độ tối đa 60fps</li>
<li class="" data-spm-anchor-id="a2o4n.pdp.product_detail.i0.fd0aa738K77nkd">Camera FaceTime HD 7MP với Retina Flash cho những bức ảnh selfie tuyệt đẹp</li>
<li class="">X&aacute;c thực bảo mật bằng Touch ID</li>
<li class="">Chip A11 Bionic, chip mạnh mẽ v&agrave; th&ocirc;ng minh nhất từng c&oacute; tr&ecirc;n một chiếc điện thoại th&ocirc;ng minh</li>
<li class="">Sạc kh&ocirc;ng d&acirc;y - hỗ trợ sạc Qi</li>
<li class="" data-spm-anchor-id="a2o4n.pdp.product_detail.i0.36bd2d1bjqfly6">&nbsp;</li>
</ul>', N'apple-iphone-8-plus-64gb-gold.jpg', 200, 0, 1, 0, NULL, NULL, N'Apple')
INSERT [dbo].[Item] ([Id], [Name], [Price], [Description], [Image], [Inventory], [View], [CategoryId], [Deleted], [AverageEvaluation], [EventId], [BrandName]) VALUES (3, N'Apple iPhoneX 256GB Space Grey', CAST(33987000.00 AS Decimal(18, 2)), N'<ul class="">
<li class="" data-spm-anchor-id="a2o4n.pdp.product_detail.i0.36bd2d1bjqfly6">&Aacute;p dụng cho kh&aacute;ch h&agrave;ng thanh to&aacute;n bằng thẻ HSBC&Aacute;p dụng cho đơn h&agrave;ng tr&ecirc;n 3 triệu</li>
<li class="">M&atilde; h&agrave;ng VN/A d&agrave;nh cho thị trường Việt NamH&agrave;ng mới 100%, ch&iacute;nh h&atilde;ng, nguy&ecirc;n seal</li>
<li class="">M&agrave;n h&igrave;nh Super Retina HD 5.8 inch với HDR v&agrave; True Tone</li>
<li class="">Thiết kế ho&agrave;n to&agrave;n bằng k&iacute;nh v&agrave; th&eacute;p kh&ocirc;ng gỉ, chống nước v&agrave; chống bụi</li>
<li class="" data-spm-anchor-id="a2o4n.pdp.product_detail.i1.36bd2d1bjqfly6">Camera k&eacute;p 12MP với OIS k&eacute;p, chế độ chụp Ch&acirc;n dung, hiệu ứng Chiếu s&aacute;ng ch&acirc;n dung v&agrave; video 4K tốc độ tối đa 60fps</li>
<li class="">Camera trước TrueDepth 7MP với chế độ chụp Ch&acirc;n dung, hiệu ứng Chiếu s&aacute;ng ch&acirc;n dung</li>
<li class="">X&aacute;c thực bảo mật bằng Face ID</li>
<li class="">Chip A11 Bionic, chip mạnh mẽ v&agrave; th&ocirc;ng minh nhất từng c&oacute; tr&ecirc;n một chiếc điện thoại th&ocirc;ng minh</li>
<li class="">Sạc kh&ocirc;ng d&acirc;y - hỗ trợ sạc Qi</li>
</ul>', N'apple-iphone-x-256gb-space-grey.jpg', 200, 3, 1, 0, NULL, NULL, N'Apple1')
INSERT [dbo].[Item] ([Id], [Name], [Price], [Description], [Image], [Inventory], [View], [CategoryId], [Deleted], [AverageEvaluation], [EventId], [BrandName]) VALUES (4, N'DELL 3440', CAST(12390000.00 AS Decimal(18, 2)), N'Đây là DELL', N'AP-ME294ZP.png', 300, 0, 2, 0, NULL, NULL, N'Dell')
INSERT [dbo].[Item] ([Id], [Name], [Price], [Description], [Image], [Inventory], [View], [CategoryId], [Deleted], [AverageEvaluation], [EventId], [BrandName]) VALUES (5, N'ACER-2215i', CAST(5000000.00 AS Decimal(18, 2)), N'<div id="CauHinh" > <div class="CauHinh_TieuDe" >Bộ vi xử lý</div> <ul> <li>+ Tên bộ vi xử lý : Intel® Core™ i7 380M.</li> <li>+ Tốc độ : 8.0Ghz.</li><li>+ Bộ nhớ đệm : 3MB Cache L3</li> </ul> <div style="clear:both"></div><div class="CauHinh_TieuDe">Bộ nhớ trong (RAM)</div><ul> <li>+ Loại Ram : DDR3 1066Mhz (PC3-8500).</li> <li>+ Dung lượng : 2GB.</li></ul> <div style="clear:both"></div><div class="CauHinh_TieuDe">Ổ đĩa cứng HDD</div> <ul> <li>+ Dung lượng : 320GB.</li><li>+ Kích thước : 2.5 inchs.</li> <li>+ Tốc độ vòng quay : 5400 rpm.</li></ul> <div style="clear:both"></div> <div class="CauHinh_TieuDe">Ổ đĩa quang (ODD)</div> <ul><li>+ Loại ổ đĩa quang : DVD+/- R/RW.</li>  </ul><div style="clear:both"></div><div class="CauHinh_TieuDe">Màn hình (Display)</div><ul><li>+ Độ lớn màn hình : 16 inchs.</li><li>+ Độ phân giải : HD (1366 x 768).</li> </ul> <div style="clear:both"></div> <div class="CauHinh_TieuDe">Đồ Họa (VGA)</div><ul><li>+ Bộ xử lý : Intel HD graphics.</li><li>+ Bộ nhớ đồ họa : Upto 1696MB.</li></ul> <div style="clear:both"></div><div class="CauHinh_TieuDe">Thông tin thêm</div><ul><li>+ Trọng lượng : 3.5 Kg.</li><li>+ Thời gian bảo hành : 24 Tháng.</li></ul><div style="clear:both"></div></div>', N'ACER-2215i.png', 200, 0, 2, 0, NULL, NULL, N'Acer')
INSERT [dbo].[Item] ([Id], [Name], [Price], [Description], [Image], [Inventory], [View], [CategoryId], [Deleted], [AverageEvaluation], [EventId], [BrandName]) VALUES (8, N'Tai nghe', CAST(5000000.00 AS Decimal(18, 2)), N'Đây là tai nghe', N'Iphone5-16G.png', 200, 0, 4, 0, NULL, NULL, NULL)
INSERT [dbo].[Item] ([Id], [Name], [Price], [Description], [Image], [Inventory], [View], [CategoryId], [Deleted], [AverageEvaluation], [EventId], [BrandName]) VALUES (9, N'Apple iPhoneX 64GB Silver', CAST(26150000.00 AS Decimal(18, 2)), N'', N'apple-iphone-x-64gb-silver.jpg', 200, 1, 1, 0, NULL, NULL, N'Apple')
INSERT [dbo].[Item] ([Id], [Name], [Price], [Description], [Image], [Inventory], [View], [CategoryId], [Deleted], [AverageEvaluation], [EventId], [BrandName]) VALUES (10, N'Apple iPhone 7 32GB Gold', CAST(15998000.00 AS Decimal(18, 2)), N'', N'apple-iphone-7-32gb-gold.jpg', 200, 5, 1, 0, NULL, NULL, N'Apple1')
INSERT [dbo].[Item] ([Id], [Name], [Price], [Description], [Image], [Inventory], [View], [CategoryId], [Deleted], [AverageEvaluation], [EventId], [BrandName]) VALUES (11, N'Apple iPhone 8 64GB Space Grey', CAST(16490000.00 AS Decimal(18, 2)), N'<ul class="">
<li class="" data-spm-anchor-id="a2o4n.pdp.product_detail.i0.36bd2d1bjqfly6">&Aacute;p dụng cho kh&aacute;ch h&agrave;ng thanh to&aacute;n bằng thẻ HSBC&Aacute;p dụng cho đơn h&agrave;ng tr&ecirc;n 3 triệu</li>
<li class="">M&atilde; h&agrave;ng VN/A d&agrave;nh cho thị trường Việt NamH&agrave;ng mới 100%, ch&iacute;nh h&atilde;ng, nguy&ecirc;n seal</li>
<li class="">M&agrave;n h&igrave;nh Super Retina HD 5.8 inch với HDR v&agrave; True Tone</li>
<li class="">Thiết kế ho&agrave;n to&agrave;n bằng k&iacute;nh v&agrave; th&eacute;p kh&ocirc;ng gỉ, chống nước v&agrave; chống bụi</li>
<li class="" data-spm-anchor-id="a2o4n.pdp.product_detail.i1.36bd2d1bjqfly6">Camera k&eacute;p 12MP với OIS k&eacute;p, chế độ chụp Ch&acirc;n dung, hiệu ứng Chiếu s&aacute;ng ch&acirc;n dung v&agrave; video 4K tốc độ tối đa 60fps</li>
<li class="">Camera trước TrueDepth 7MP với chế độ chụp Ch&acirc;n dung, hiệu ứng Chiếu s&aacute;ng ch&acirc;n dung</li>
<li class="">X&aacute;c thực bảo mật bằng Face ID</li>
<li class="">Chip A11 Bionic, chip mạnh mẽ v&agrave; th&ocirc;ng minh nhất từng c&oacute; tr&ecirc;n một chiếc điện thoại th&ocirc;ng minh</li>
<li class="">Sạc kh&ocirc;ng d&acirc;y - hỗ trợ sạc Qi</li>
</ul>', N'apple-iphone-8-64gb-space-grey.jpg', 200, 6, 1, 0, NULL, NULL, N'Apple')
INSERT [dbo].[Item] ([Id], [Name], [Price], [Description], [Image], [Inventory], [View], [CategoryId], [Deleted], [AverageEvaluation], [EventId], [BrandName]) VALUES (12, N'Apple iPhone 8 Plus Red', CAST(21289000.00 AS Decimal(18, 2)), N'', N'apple-iphone8-plus-red.jpg', 200, 8, 1, 0, NULL, NULL, N'Apple')
INSERT [dbo].[Item] ([Id], [Name], [Price], [Description], [Image], [Inventory], [View], [CategoryId], [Deleted], [AverageEvaluation], [EventId], [BrandName]) VALUES (13, N'Apple iPhone XS', CAST(29990000.00 AS Decimal(18, 2)), N'<ul class="">
<li class="" data-spm-anchor-id="a2o4n.pdp.product_detail.i0.5c456c6fYhJORq">M&atilde; h&agrave;ng VN/A d&agrave;nh cho thị trường Việt NamH&agrave;ng mới 100%, ch&iacute;nh h&atilde;ng, nguy&ecirc;n seal</li>
<li class="">M&agrave;n h&igrave;nh Super Retina 5.8"</li>
<li class="">Thiết kế ho&agrave;n to&agrave;n bằng k&iacute;nh cường lực v&agrave; th&eacute;p kh&ocirc;ng gỉ, chống nước v&agrave; chống bụi</li>
<li class="">Chip Inteligent A12 Bionic chip mạnh mẽ v&agrave; th&ocirc;ng minh nhất từng c&oacute; tr&ecirc;n một chiếc điện thoại th&ocirc;ng minh</li>
<li class="">Camera k&eacute;p 12MP với OIS k&eacute;p, chế độ chụp Ch&acirc;n dung, hiệu ứng Chiếu s&aacute;ng ch&acirc;n dung v&agrave; video 4K tốc độ tối đa 60fps</li>
<li class="">X&aacute;c thực bảo mật bằng Face ID thế hệ mới</li>
<li class="">Sạc kh&ocirc;ng d&acirc;y - hỗ trợ sạc nhanh</li>
</ul>', N'apple-iPhone-xs.jpg', 200, 7, 1, 0, NULL, NULL, N'Apple')
INSERT [dbo].[Item] ([Id], [Name], [Price], [Description], [Image], [Inventory], [View], [CategoryId], [Deleted], [AverageEvaluation], [EventId], [BrandName]) VALUES (15, N'Máy tính bảng Samsung Galaxy Tab A ', CAST(5490000.00 AS Decimal(18, 2)), N'<ul class="">
<li class="" data-spm-anchor-id="a2o4n.pdp.product_detail.i0.72b5eeccMUCGH7">Trải nghiệm dung lượng pin lớn 5000 mAh</li>
<li class="">Camera trước 5MP, sau 8MP ưu việt</li>
<li class="">Thiết kế kim loại thời thượng</li>
</ul>', N'Samsung-Galaxy-Tab-a.png', 200, 10, 3, 0, NULL, NULL, N'Samsung')
INSERT [dbo].[Item] ([Id], [Name], [Price], [Description], [Image], [Inventory], [View], [CategoryId], [Deleted], [AverageEvaluation], [EventId], [BrandName]) VALUES (16, N'laptop test', CAST(10000000.00 AS Decimal(18, 2)), N'laptop test', NULL, 100, 0, 2, 0, NULL, NULL, N'Samsung')
SET IDENTITY_INSERT [dbo].[Item] OFF
SET IDENTITY_INSERT [dbo].[Supplier] ON 

INSERT [dbo].[Supplier] ([Id], [Name], [Address], [PhoneNumber], [Email], [Deleted]) VALUES (1, N'Samsung', N'Silicon', NULL, NULL, 0)
INSERT [dbo].[Supplier] ([Id], [Name], [Address], [PhoneNumber], [Email], [Deleted]) VALUES (2, N'Apple', N'Silicon', NULL, NULL, 0)
SET IDENTITY_INSERT [dbo].[Supplier] OFF
SET IDENTITY_INSERT [dbo].[TypeOfCustomer] ON 

INSERT [dbo].[TypeOfCustomer] ([Id], [Name], [Deleted]) VALUES (1, N'New', 0)
INSERT [dbo].[TypeOfCustomer] ([Id], [Name], [Deleted]) VALUES (2, N'Potential', 0)
INSERT [dbo].[TypeOfCustomer] ([Id], [Name], [Deleted]) VALUES (3, N'Discount', 0)
INSERT [dbo].[TypeOfCustomer] ([Id], [Name], [Deleted]) VALUES (4, N'Loyal', 0)
SET IDENTITY_INSERT [dbo].[TypeOfCustomer] OFF
SET IDENTITY_INSERT [dbo].[TypeOfUser] ON 

INSERT [dbo].[TypeOfUser] ([Id], [Name], [Deleted]) VALUES (1, N'OrderManagement', 0)
INSERT [dbo].[TypeOfUser] ([Id], [Name], [Deleted]) VALUES (2, N'ProductManagement', 0)
INSERT [dbo].[TypeOfUser] ([Id], [Name], [Deleted]) VALUES (3, N'Boss', 0)
SET IDENTITY_INSERT [dbo].[TypeOfUser] OFF
/****** Object:  Index [IX_Cart_CustomerId]    Script Date: 2019-03-24 10:07:41 PM ******/
CREATE NONCLUSTERED INDEX [IX_Cart_CustomerId] ON [dbo].[Cart]
(
	[CustomerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_CartDetail_CartId]    Script Date: 2019-03-24 10:07:41 PM ******/
CREATE NONCLUSTERED INDEX [IX_CartDetail_CartId] ON [dbo].[CartDetail]
(
	[CartId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Comment_CustomerId]    Script Date: 2019-03-24 10:07:41 PM ******/
CREATE NONCLUSTERED INDEX [IX_Comment_CustomerId] ON [dbo].[Comment]
(
	[CustomerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Comment_ItemId]    Script Date: 2019-03-24 10:07:41 PM ******/
CREATE NONCLUSTERED INDEX [IX_Comment_ItemId] ON [dbo].[Comment]
(
	[ItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Customer_TypeOfCustomerId]    Script Date: 2019-03-24 10:07:41 PM ******/
CREATE NONCLUSTERED INDEX [IX_Customer_TypeOfCustomerId] ON [dbo].[Customer]
(
	[TypeOfCustomerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_GoodsReceipt_SupplierId]    Script Date: 2019-03-24 10:07:41 PM ******/
CREATE NONCLUSTERED INDEX [IX_GoodsReceipt_SupplierId] ON [dbo].[GoodsReceipt]
(
	[SupplierId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_GoodsReceiptDetail_GoodsReceiptId]    Script Date: 2019-03-24 10:07:41 PM ******/
CREATE NONCLUSTERED INDEX [IX_GoodsReceiptDetail_GoodsReceiptId] ON [dbo].[GoodsReceiptDetail]
(
	[GoodsReceiptId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Item_CategoryId]    Script Date: 2019-03-24 10:07:41 PM ******/
CREATE NONCLUSTERED INDEX [IX_Item_CategoryId] ON [dbo].[Item]
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Item_EventId]    Script Date: 2019-03-24 10:07:41 PM ******/
CREATE NONCLUSTERED INDEX [IX_Item_EventId] ON [dbo].[Item]
(
	[EventId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_LineItem_OrderId]    Script Date: 2019-03-24 10:07:41 PM ******/
CREATE NONCLUSTERED INDEX [IX_LineItem_OrderId] ON [dbo].[LineItem]
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Order_CustomerId]    Script Date: 2019-03-24 10:07:41 PM ******/
CREATE NONCLUSTERED INDEX [IX_Order_CustomerId] ON [dbo].[Order]
(
	[CustomerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_User_TypeOfUserId]    Script Date: 2019-03-24 10:07:41 PM ******/
CREATE NONCLUSTERED INDEX [IX_User_TypeOfUserId] ON [dbo].[User]
(
	[TypeOfUserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_UserDecentralization_TypeOfUserId]    Script Date: 2019-03-24 10:07:41 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserDecentralization_TypeOfUserId] ON [dbo].[UserDecentralization]
(
	[TypeOfUserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FK_Cart_Customer_CustomerId] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customer] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK_Cart_Customer_CustomerId]
GO
ALTER TABLE [dbo].[CartDetail]  WITH CHECK ADD  CONSTRAINT [FK_CartDetail_Cart_CartId] FOREIGN KEY([CartId])
REFERENCES [dbo].[Cart] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CartDetail] CHECK CONSTRAINT [FK_CartDetail_Cart_CartId]
GO
ALTER TABLE [dbo].[CartDetail]  WITH CHECK ADD  CONSTRAINT [FK_CartDetail_Item_ItemId] FOREIGN KEY([ItemId])
REFERENCES [dbo].[Item] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CartDetail] CHECK CONSTRAINT [FK_CartDetail_Item_ItemId]
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK_Comment_Customer_CustomerId] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customer] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK_Comment_Customer_CustomerId]
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK_Comment_Item_ItemId] FOREIGN KEY([ItemId])
REFERENCES [dbo].[Item] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK_Comment_Item_ItemId]
GO
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD  CONSTRAINT [FK_Customer_TypeOfCustomer_TypeOfCustomerId] FOREIGN KEY([TypeOfCustomerId])
REFERENCES [dbo].[TypeOfCustomer] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Customer] CHECK CONSTRAINT [FK_Customer_TypeOfCustomer_TypeOfCustomerId]
GO
ALTER TABLE [dbo].[Customer_Address]  WITH CHECK ADD  CONSTRAINT [FK_Customer_Address_Address] FOREIGN KEY([AddressId])
REFERENCES [dbo].[Address] ([Id])
GO
ALTER TABLE [dbo].[Customer_Address] CHECK CONSTRAINT [FK_Customer_Address_Address]
GO
ALTER TABLE [dbo].[Customer_Address]  WITH CHECK ADD  CONSTRAINT [FK_Customer_Address_Customer] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customer] ([Id])
GO
ALTER TABLE [dbo].[Customer_Address] CHECK CONSTRAINT [FK_Customer_Address_Customer]
GO
ALTER TABLE [dbo].[GoodsReceipt]  WITH CHECK ADD  CONSTRAINT [FK_GoodsReceipt_Supplier_SupplierId] FOREIGN KEY([SupplierId])
REFERENCES [dbo].[Supplier] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[GoodsReceipt] CHECK CONSTRAINT [FK_GoodsReceipt_Supplier_SupplierId]
GO
ALTER TABLE [dbo].[GoodsReceiptDetail]  WITH CHECK ADD  CONSTRAINT [FK_GoodsReceiptDetail_GoodsReceipt_GoodsReceiptId] FOREIGN KEY([GoodsReceiptId])
REFERENCES [dbo].[GoodsReceipt] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[GoodsReceiptDetail] CHECK CONSTRAINT [FK_GoodsReceiptDetail_GoodsReceipt_GoodsReceiptId]
GO
ALTER TABLE [dbo].[GoodsReceiptDetail]  WITH CHECK ADD  CONSTRAINT [FK_GoodsReceiptDetail_Item_ItemId] FOREIGN KEY([ItemId])
REFERENCES [dbo].[Item] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[GoodsReceiptDetail] CHECK CONSTRAINT [FK_GoodsReceiptDetail_Item_ItemId]
GO
ALTER TABLE [dbo].[ImageEvent]  WITH CHECK ADD  CONSTRAINT [FK_ImageEvent_Event] FOREIGN KEY([EventId])
REFERENCES [dbo].[Event] ([Id])
GO
ALTER TABLE [dbo].[ImageEvent] CHECK CONSTRAINT [FK_ImageEvent_Event]
GO
ALTER TABLE [dbo].[ImageProduct]  WITH CHECK ADD  CONSTRAINT [FK_ImageProduct_Item] FOREIGN KEY([ItemId])
REFERENCES [dbo].[Item] ([Id])
GO
ALTER TABLE [dbo].[ImageProduct] CHECK CONSTRAINT [FK_ImageProduct_Item]
GO
ALTER TABLE [dbo].[Item]  WITH CHECK ADD  CONSTRAINT [FK_Item_Category_CategoryId] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Item] CHECK CONSTRAINT [FK_Item_Category_CategoryId]
GO
ALTER TABLE [dbo].[Item]  WITH CHECK ADD  CONSTRAINT [FK_Item_Event_EventId] FOREIGN KEY([EventId])
REFERENCES [dbo].[Event] ([Id])
GO
ALTER TABLE [dbo].[Item] CHECK CONSTRAINT [FK_Item_Event_EventId]
GO
ALTER TABLE [dbo].[LineItem]  WITH CHECK ADD  CONSTRAINT [FK_LineItem_Item_ItemId] FOREIGN KEY([ItemId])
REFERENCES [dbo].[Item] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[LineItem] CHECK CONSTRAINT [FK_LineItem_Item_ItemId]
GO
ALTER TABLE [dbo].[LineItem]  WITH CHECK ADD  CONSTRAINT [FK_LineItem_Order_OrderId] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Order] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[LineItem] CHECK CONSTRAINT [FK_LineItem_Order_OrderId]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Address] FOREIGN KEY([AddressId])
REFERENCES [dbo].[Address] ([Id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Address]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Customer_CustomerId] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customer] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Customer_CustomerId]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Address] FOREIGN KEY([AddressId])
REFERENCES [dbo].[Address] ([Id])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Address]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_TypeOfUser_TypeOfUserId] FOREIGN KEY([TypeOfUserId])
REFERENCES [dbo].[TypeOfUser] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_TypeOfUser_TypeOfUserId]
GO
ALTER TABLE [dbo].[UserDecentralization]  WITH CHECK ADD  CONSTRAINT [FK_UserDecentralization_Role_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Role] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserDecentralization] CHECK CONSTRAINT [FK_UserDecentralization_Role_RoleId]
GO
ALTER TABLE [dbo].[UserDecentralization]  WITH CHECK ADD  CONSTRAINT [FK_UserDecentralization_TypeOfUser_TypeOfUserId] FOREIGN KEY([TypeOfUserId])
REFERENCES [dbo].[TypeOfUser] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserDecentralization] CHECK CONSTRAINT [FK_UserDecentralization_TypeOfUser_TypeOfUserId]
GO
USE [master]
GO
ALTER DATABASE [OnlineStoreDB] SET  READ_WRITE 
GO
