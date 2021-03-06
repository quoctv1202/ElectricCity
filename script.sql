USE [master]
GO
/****** Object:  Database [ElectricCityOnline]    Script Date: 6/24/2018 6:07:16 AM ******/
CREATE DATABASE [ElectricCityOnline]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ElectricCityOnline', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\ElectricCityOnline.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ElectricCityOnline_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\ElectricCityOnline_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [ElectricCityOnline] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ElectricCityOnline].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ElectricCityOnline] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ElectricCityOnline] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ElectricCityOnline] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ElectricCityOnline] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ElectricCityOnline] SET ARITHABORT OFF 
GO
ALTER DATABASE [ElectricCityOnline] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ElectricCityOnline] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ElectricCityOnline] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ElectricCityOnline] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ElectricCityOnline] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ElectricCityOnline] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ElectricCityOnline] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ElectricCityOnline] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ElectricCityOnline] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ElectricCityOnline] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ElectricCityOnline] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ElectricCityOnline] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ElectricCityOnline] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ElectricCityOnline] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ElectricCityOnline] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ElectricCityOnline] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ElectricCityOnline] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ElectricCityOnline] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ElectricCityOnline] SET  MULTI_USER 
GO
ALTER DATABASE [ElectricCityOnline] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ElectricCityOnline] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ElectricCityOnline] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ElectricCityOnline] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ElectricCityOnline] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ElectricCityOnline] SET QUERY_STORE = OFF
GO
USE [ElectricCityOnline]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [ElectricCityOnline]
GO
/****** Object:  Table [dbo].[Bill]    Script Date: 6/24/2018 6:07:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bill](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[CustomerName] [nvarchar](100) NULL,
	[CustomerEmail] [varchar](100) NULL,
	[CustomerPhone] [varchar](20) NULL,
	[CustomerAddress] [nvarchar](200) NULL,
	[PaymentType] [varchar](50) NULL,
	[PaymentInfo] [nvarchar](200) NULL,
	[CreatedDate] [datetime] NULL,
 CONSTRAINT [PK_Bill] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BillDetail]    Script Date: 6/24/2018 6:07:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BillDetail](
	[IDProduct] [int] NOT NULL,
	[IDBill] [bigint] NOT NULL,
	[Quantity] [int] NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_BillDetail] PRIMARY KEY CLUSTERED 
(
	[IDProduct] ASC,
	[IDBill] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Brand]    Script Date: 6/24/2018 6:07:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Brand](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[ImageLink] [varchar](100) NULL,
	[DisplayOrder] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
	[CreatedBy] [varchar](50) NULL,
	[ModifiedBy] [varchar](50) NULL,
	[Status] [bit] NULL,
	[DisplayOnHome] [bit] NULL,
	[MetaTitle] [varchar](200) NULL,
 CONSTRAINT [PK_Brand] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contact]    Script Date: 6/24/2018 6:07:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contact](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Contents] [nchar](10) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Contact] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FeedBack]    Script Date: 6/24/2018 6:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FeedBack](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[PhoneNumber] [varchar](20) NULL,
	[Email] [varchar](50) NULL,
	[Contents] [nvarchar](500) NULL,
	[CreatedDate] [datetime] NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_FeedBack] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Image]    Script Date: 6/24/2018 6:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Image](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ImageLink] [varchar](100) NULL,
	[Status] [bit] NULL,
	[ProductID] [int] NULL,
 CONSTRAINT [PK_Image] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Permisssion]    Script Date: 6/24/2018 6:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Permisssion](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PermissionName] [varchar](50) NULL,
	[Description] [nvarchar](200) NULL,
 CONSTRAINT [PK_Permisssion] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 6/24/2018 6:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](200) NULL,
	[Description] [nvarchar](500) NULL,
	[ImageLink] [varchar](100) NULL,
	[Price] [decimal](18, 0) NULL,
	[PromotionPrice] [decimal](18, 0) NULL,
	[QuantityLeft] [nchar](10) NULL,
	[CategoryID] [int] NULL,
	[BrandID] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
	[CreatedBy] [varchar](50) NULL,
	[ModifiedBy] [varchar](50) NULL,
	[Status] [bit] NULL,
	[PromotedItem] [bit] NULL,
	[HotItem] [bit] NULL,
	[MetaTitle] [varchar](200) NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductCategory]    Script Date: 6/24/2018 6:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductCategory](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[DisplayOrder] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
	[CreatedBy] [varchar](50) NULL,
	[ModifiedBy] [varchar](50) NULL,
	[Status] [bit] NULL,
	[DisplayOnHome] [bit] NULL,
	[MetaTitle] [varchar](200) NULL,
 CONSTRAINT [PK_ProductCategory] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SystemConfig]    Script Date: 6/24/2018 6:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SystemConfig](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Type] [varchar](100) NULL,
	[Value] [nvarchar](200) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_SystemConfig] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 6/24/2018 6:07:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](50) NULL,
	[Password] [varchar](50) NULL,
	[NameDisplay] [nvarchar](100) NULL,
	[DoB] [datetime] NULL,
	[Email] [varchar](100) NULL,
	[Address] [nvarchar](200) NULL,
	[PhoneNumber] [varchar](20) NULL,
	[Status] [bit] NULL,
	[Permission] [int] NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Brand] ON 

INSERT [dbo].[Brand] ([ID], [Name], [ImageLink], [DisplayOrder], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Status], [DisplayOnHome], [MetaTitle]) VALUES (1, N'Samsung', NULL, 0, CAST(N'2018-05-04T01:53:35.853' AS DateTime), NULL, NULL, NULL, 1, 0, NULL)
INSERT [dbo].[Brand] ([ID], [Name], [ImageLink], [DisplayOrder], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Status], [DisplayOnHome], [MetaTitle]) VALUES (2, N'Apple', NULL, 0, CAST(N'2018-05-04T01:53:44.263' AS DateTime), NULL, NULL, NULL, 1, 0, NULL)
INSERT [dbo].[Brand] ([ID], [Name], [ImageLink], [DisplayOrder], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Status], [DisplayOnHome], [MetaTitle]) VALUES (3, N'Oppo', NULL, 0, CAST(N'2018-05-04T01:53:48.567' AS DateTime), NULL, NULL, NULL, 1, 0, NULL)
INSERT [dbo].[Brand] ([ID], [Name], [ImageLink], [DisplayOrder], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Status], [DisplayOnHome], [MetaTitle]) VALUES (4, N'Hp', NULL, 0, CAST(N'2018-05-04T01:53:52.207' AS DateTime), NULL, NULL, NULL, 1, 0, NULL)
INSERT [dbo].[Brand] ([ID], [Name], [ImageLink], [DisplayOrder], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Status], [DisplayOnHome], [MetaTitle]) VALUES (5, N'Dell', NULL, 0, CAST(N'2018-05-04T01:53:59.637' AS DateTime), NULL, NULL, NULL, 1, 0, NULL)
INSERT [dbo].[Brand] ([ID], [Name], [ImageLink], [DisplayOrder], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Status], [DisplayOnHome], [MetaTitle]) VALUES (6, N'Sony', NULL, 0, CAST(N'2018-05-04T01:55:22.920' AS DateTime), NULL, NULL, NULL, 1, 0, NULL)
SET IDENTITY_INSERT [dbo].[Brand] OFF
SET IDENTITY_INSERT [dbo].[Permisssion] ON 

INSERT [dbo].[Permisssion] ([ID], [PermissionName], [Description]) VALUES (1, N'admin', N'Quyền quản trị')
INSERT [dbo].[Permisssion] ([ID], [PermissionName], [Description]) VALUES (2, N'staff', N'Quyền thao tác với Sản phẩm CRUD')
INSERT [dbo].[Permisssion] ([ID], [PermissionName], [Description]) VALUES (3, N'customer', N'Quyền người dùng xem, đặt hàng')
SET IDENTITY_INSERT [dbo].[Permisssion] OFF
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ID], [Name], [Description], [ImageLink], [Price], [PromotionPrice], [QuantityLeft], [CategoryID], [BrandID], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Status], [PromotedItem], [HotItem], [MetaTitle]) VALUES (1, N'IPhone X', NULL, NULL, NULL, NULL, NULL, 1, 2, CAST(N'2018-05-04T01:42:33.673' AS DateTime), NULL, NULL, NULL, 1, 0, 0, NULL)
INSERT [dbo].[Product] ([ID], [Name], [Description], [ImageLink], [Price], [PromotionPrice], [QuantityLeft], [CategoryID], [BrandID], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Status], [PromotedItem], [HotItem], [MetaTitle]) VALUES (2, N'IPhone 8', NULL, NULL, NULL, NULL, NULL, 1, 2, CAST(N'2018-05-04T01:42:58.530' AS DateTime), NULL, NULL, NULL, 1, 0, 0, NULL)
INSERT [dbo].[Product] ([ID], [Name], [Description], [ImageLink], [Price], [PromotionPrice], [QuantityLeft], [CategoryID], [BrandID], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Status], [PromotedItem], [HotItem], [MetaTitle]) VALUES (3, N'IPhone 7', NULL, NULL, NULL, NULL, NULL, 1, 2, CAST(N'2018-05-04T01:43:06.260' AS DateTime), NULL, NULL, NULL, 1, 0, 0, NULL)
INSERT [dbo].[Product] ([ID], [Name], [Description], [ImageLink], [Price], [PromotionPrice], [QuantityLeft], [CategoryID], [BrandID], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Status], [PromotedItem], [HotItem], [MetaTitle]) VALUES (4, N'IPhone 7 Plus', NULL, NULL, NULL, NULL, NULL, 1, 2, CAST(N'2018-05-04T01:43:19.253' AS DateTime), NULL, NULL, NULL, 1, 0, 0, NULL)
INSERT [dbo].[Product] ([ID], [Name], [Description], [ImageLink], [Price], [PromotionPrice], [QuantityLeft], [CategoryID], [BrandID], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Status], [PromotedItem], [HotItem], [MetaTitle]) VALUES (5, N'Samsung S8', NULL, NULL, NULL, NULL, NULL, 1, 1, CAST(N'2018-05-04T01:43:27.670' AS DateTime), NULL, NULL, NULL, 1, 0, 0, NULL)
INSERT [dbo].[Product] ([ID], [Name], [Description], [ImageLink], [Price], [PromotionPrice], [QuantityLeft], [CategoryID], [BrandID], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Status], [PromotedItem], [HotItem], [MetaTitle]) VALUES (6, N'Samsung S7', NULL, NULL, NULL, NULL, NULL, 1, 1, CAST(N'2018-05-04T01:43:33.280' AS DateTime), NULL, NULL, NULL, 1, 0, 0, NULL)
INSERT [dbo].[Product] ([ID], [Name], [Description], [ImageLink], [Price], [PromotionPrice], [QuantityLeft], [CategoryID], [BrandID], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Status], [PromotedItem], [HotItem], [MetaTitle]) VALUES (7, N'Samsung S6 Plus', NULL, NULL, NULL, NULL, NULL, 1, 1, CAST(N'2018-05-04T01:43:49.027' AS DateTime), NULL, NULL, NULL, 1, 0, 0, NULL)
INSERT [dbo].[Product] ([ID], [Name], [Description], [ImageLink], [Price], [PromotionPrice], [QuantityLeft], [CategoryID], [BrandID], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Status], [PromotedItem], [HotItem], [MetaTitle]) VALUES (8, N'Oppo F5', NULL, NULL, NULL, NULL, NULL, 1, 3, CAST(N'2018-05-04T01:44:09.987' AS DateTime), NULL, NULL, NULL, 1, 0, 0, NULL)
INSERT [dbo].[Product] ([ID], [Name], [Description], [ImageLink], [Price], [PromotionPrice], [QuantityLeft], [CategoryID], [BrandID], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Status], [PromotedItem], [HotItem], [MetaTitle]) VALUES (9, N'Sony Braviva 4K', NULL, NULL, NULL, NULL, NULL, 2, 6, CAST(N'2018-05-04T01:44:24.183' AS DateTime), NULL, NULL, NULL, 1, 0, 0, NULL)
INSERT [dbo].[Product] ([ID], [Name], [Description], [ImageLink], [Price], [PromotionPrice], [QuantityLeft], [CategoryID], [BrandID], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Status], [PromotedItem], [HotItem], [MetaTitle]) VALUES (10, N'Samsung Oled', NULL, NULL, NULL, NULL, NULL, 2, 1, CAST(N'2018-05-04T01:44:36.460' AS DateTime), NULL, NULL, NULL, 1, 0, 0, NULL)
INSERT [dbo].[Product] ([ID], [Name], [Description], [ImageLink], [Price], [PromotionPrice], [QuantityLeft], [CategoryID], [BrandID], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Status], [PromotedItem], [HotItem], [MetaTitle]) VALUES (11, N'Samgsung 4K', NULL, NULL, NULL, NULL, NULL, 2, 1, CAST(N'2018-05-04T01:45:03.960' AS DateTime), NULL, NULL, NULL, 1, 0, 0, NULL)
INSERT [dbo].[Product] ([ID], [Name], [Description], [ImageLink], [Price], [PromotionPrice], [QuantityLeft], [CategoryID], [BrandID], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Status], [PromotedItem], [HotItem], [MetaTitle]) VALUES (12, N'HP Ultrabook', NULL, NULL, NULL, NULL, NULL, 3, 4, CAST(N'2018-05-04T01:45:17.797' AS DateTime), NULL, NULL, NULL, 1, 0, 0, NULL)
INSERT [dbo].[Product] ([ID], [Name], [Description], [ImageLink], [Price], [PromotionPrice], [QuantityLeft], [CategoryID], [BrandID], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Status], [PromotedItem], [HotItem], [MetaTitle]) VALUES (13, N'Dell Precision', NULL, NULL, NULL, NULL, NULL, 3, 5, CAST(N'2018-05-04T01:50:21.433' AS DateTime), NULL, NULL, NULL, 1, 0, 0, NULL)
INSERT [dbo].[Product] ([ID], [Name], [Description], [ImageLink], [Price], [PromotionPrice], [QuantityLeft], [CategoryID], [BrandID], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Status], [PromotedItem], [HotItem], [MetaTitle]) VALUES (14, N'HP Work Staiton', NULL, NULL, NULL, NULL, NULL, 3, NULL, CAST(N'2018-05-04T01:50:41.577' AS DateTime), NULL, NULL, NULL, 1, 0, 0, NULL)
INSERT [dbo].[Product] ([ID], [Name], [Description], [ImageLink], [Price], [PromotionPrice], [QuantityLeft], [CategoryID], [BrandID], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Status], [PromotedItem], [HotItem], [MetaTitle]) VALUES (15, N'Oppo F7', NULL, NULL, NULL, NULL, NULL, 1, 3, CAST(N'2018-05-04T01:51:09.517' AS DateTime), NULL, NULL, NULL, 1, 0, 0, NULL)
INSERT [dbo].[Product] ([ID], [Name], [Description], [ImageLink], [Price], [PromotionPrice], [QuantityLeft], [CategoryID], [BrandID], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Status], [PromotedItem], [HotItem], [MetaTitle]) VALUES (16, N'Oppo F6', NULL, NULL, NULL, NULL, NULL, 1, 3, CAST(N'2018-05-04T01:51:18.580' AS DateTime), NULL, NULL, NULL, 1, 0, 0, NULL)
INSERT [dbo].[Product] ([ID], [Name], [Description], [ImageLink], [Price], [PromotionPrice], [QuantityLeft], [CategoryID], [BrandID], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Status], [PromotedItem], [HotItem], [MetaTitle]) VALUES (17, N'Sony Xperia Z7', NULL, NULL, NULL, NULL, NULL, 1, 6, CAST(N'2018-05-04T01:56:02.240' AS DateTime), NULL, NULL, NULL, 1, 0, 0, NULL)
SET IDENTITY_INSERT [dbo].[Product] OFF
SET IDENTITY_INSERT [dbo].[ProductCategory] ON 

INSERT [dbo].[ProductCategory] ([ID], [Name], [DisplayOrder], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Status], [DisplayOnHome], [MetaTitle]) VALUES (1, N'Phone', 0, CAST(N'2018-05-04T01:46:37.583' AS DateTime), NULL, NULL, NULL, 1, 1, NULL)
INSERT [dbo].[ProductCategory] ([ID], [Name], [DisplayOrder], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Status], [DisplayOnHome], [MetaTitle]) VALUES (2, N'Tivi', 0, CAST(N'2018-05-04T01:47:20.740' AS DateTime), NULL, NULL, NULL, 1, 1, NULL)
INSERT [dbo].[ProductCategory] ([ID], [Name], [DisplayOrder], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Status], [DisplayOnHome], [MetaTitle]) VALUES (3, N'Laptop', 0, CAST(N'2018-05-04T01:47:55.903' AS DateTime), NULL, NULL, NULL, 1, 1, NULL)
INSERT [dbo].[ProductCategory] ([ID], [Name], [DisplayOrder], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Status], [DisplayOnHome], [MetaTitle]) VALUES (4, N'AirConditional', 0, CAST(N'2018-05-04T01:48:22.110' AS DateTime), NULL, NULL, NULL, 1, 0, NULL)
INSERT [dbo].[ProductCategory] ([ID], [Name], [DisplayOrder], [CreatedDate], [ModifiedDate], [CreatedBy], [ModifiedBy], [Status], [DisplayOnHome], [MetaTitle]) VALUES (5, N'PC', 0, CAST(N'2018-05-04T01:48:46.620' AS DateTime), NULL, NULL, NULL, 1, 1, NULL)
SET IDENTITY_INSERT [dbo].[ProductCategory] OFF
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([ID], [UserName], [Password], [NameDisplay], [DoB], [Email], [Address], [PhoneNumber], [Status], [Permission]) VALUES (1, N'admin', N'21232f297a57a5a743894a0e4a801fc3', N'QTV(Quan Tri Vien)', CAST(N'1996-12-02T00:00:00.000' AS DateTime), N'admin@gmai.com', N'Ha Noi', N'0123123123', 1, 1)
INSERT [dbo].[User] ([ID], [UserName], [Password], [NameDisplay], [DoB], [Email], [Address], [PhoneNumber], [Status], [Permission]) VALUES (2, N'quoc', N'cd0863bff03af8fd4bf9764ca0513a92', N'QTV(Quoc TV)', CAST(N'1996-12-02T00:00:00.000' AS DateTime), N'quoctv1202@gmail.com', N'Ha Noi', N'0123234345', 1, 2)
INSERT [dbo].[User] ([ID], [UserName], [Password], [NameDisplay], [DoB], [Email], [Address], [PhoneNumber], [Status], [Permission]) VALUES (3, N'abc', N'900150983cd24fb0d6963f7d28e17f72', N'User', CAST(N'1997-01-01T00:00:00.000' AS DateTime), N'user@mta.edu.vn', N'Hai Duong', N'0123321122', 1, 3)
INSERT [dbo].[User] ([ID], [UserName], [Password], [NameDisplay], [DoB], [Email], [Address], [PhoneNumber], [Status], [Permission]) VALUES (1011, N'giang', N'8905cc1433f2ca305e8479703e43f5ce', N'Giang', CAST(N'1996-08-18T00:00:00.000' AS DateTime), N'giangnv@gmail.com', N'Ha Noi', N'0129539395', 1, 3)
INSERT [dbo].[User] ([ID], [UserName], [Password], [NameDisplay], [DoB], [Email], [Address], [PhoneNumber], [Status], [Permission]) VALUES (1013, N'quoc123', N'2cc10a94ccc2f08d57e08c410cdaf60a', N'Quoc123', CAST(N'1996-12-24T00:00:00.000' AS DateTime), N'q123@gmail.com', N'Bac Ninh', N'0973412312', 1, 3)
INSERT [dbo].[User] ([ID], [UserName], [Password], [NameDisplay], [DoB], [Email], [Address], [PhoneNumber], [Status], [Permission]) VALUES (1014, N'tuan12', N'5c3cbc832637117e50425a2c3f5af718', N'Tuan', CAST(N'1996-04-27T00:00:00.000' AS DateTime), N'tuandv@gmail.com', N'Lao Cai', N'0967123123', 1, 3)
INSERT [dbo].[User] ([ID], [UserName], [Password], [NameDisplay], [DoB], [Email], [Address], [PhoneNumber], [Status], [Permission]) VALUES (1016, N'truong', N'047c30e8313db6e45fd87ab6e1bfd1fb', N'Truong', CAST(N'1996-11-21T00:00:00.000' AS DateTime), N'truongnv@gmail.com', N'Hai Phong', N'0936542123', 1, 3)
INSERT [dbo].[User] ([ID], [UserName], [Password], [NameDisplay], [DoB], [Email], [Address], [PhoneNumber], [Status], [Permission]) VALUES (1017, N'son', N'498d3c6bfa033f6dc1be4fcc3c370aa7', N'Son', CAST(N'1997-03-04T00:00:00.000' AS DateTime), N'sonnt@gmail.com', N'Dien Bien', N'0942123123', 1, 3)
INSERT [dbo].[User] ([ID], [UserName], [Password], [NameDisplay], [DoB], [Email], [Address], [PhoneNumber], [Status], [Permission]) VALUES (1018, N'thanh', N'8478e2bdb758f8467225ae87ed3750c2', N'Thanh', CAST(N'1996-04-04T00:00:00.000' AS DateTime), N'thanhthanh@gmail.com', N'Ha Noi', N'0169123123', 0, 3)
INSERT [dbo].[User] ([ID], [UserName], [Password], [NameDisplay], [DoB], [Email], [Address], [PhoneNumber], [Status], [Permission]) VALUES (1019, N'trang', N'c786f96bb9eef05cd4c8641fc7cdeb24', N'Trang', CAST(N'1998-09-09T00:00:00.000' AS DateTime), N'trangnt@gmail.com', N'Ha', N'0123555666', 0, 3)
SET IDENTITY_INSERT [dbo].[User] OFF
ALTER TABLE [dbo].[Bill] ADD  CONSTRAINT [DF_Bill_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[BillDetail] ADD  CONSTRAINT [DF_BillDetail_Status]  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [dbo].[Brand] ADD  CONSTRAINT [DF_Brand_DisplayOrder]  DEFAULT ((0)) FOR [DisplayOrder]
GO
ALTER TABLE [dbo].[Brand] ADD  CONSTRAINT [DF_Brand_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Brand] ADD  CONSTRAINT [DF_Brand_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Brand] ADD  CONSTRAINT [DF_Brand_DisplayOnHome]  DEFAULT ((0)) FOR [DisplayOnHome]
GO
ALTER TABLE [dbo].[Contact] ADD  CONSTRAINT [DF_Contact_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[FeedBack] ADD  CONSTRAINT [DF_FeedBack_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[FeedBack] ADD  CONSTRAINT [DF_FeedBack_Status]  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [dbo].[Image] ADD  CONSTRAINT [DF_Image_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_PromotedItem]  DEFAULT ((0)) FOR [PromotedItem]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_DisplayOnHome]  DEFAULT ((0)) FOR [HotItem]
GO
ALTER TABLE [dbo].[ProductCategory] ADD  CONSTRAINT [DF_ProductCategory_DisplayOrder]  DEFAULT ((0)) FOR [DisplayOrder]
GO
ALTER TABLE [dbo].[ProductCategory] ADD  CONSTRAINT [DF_ProductCategory_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[ProductCategory] ADD  CONSTRAINT [DF_ProductCategory_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[ProductCategory] ADD  CONSTRAINT [DF_ProductCategory_DisplayOnHome]  DEFAULT ((0)) FOR [DisplayOnHome]
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_Permission]  DEFAULT ((3)) FOR [Permission]
GO
ALTER TABLE [dbo].[BillDetail]  WITH CHECK ADD  CONSTRAINT [FK_BillDetail_Bill] FOREIGN KEY([IDBill])
REFERENCES [dbo].[Bill] ([ID])
GO
ALTER TABLE [dbo].[BillDetail] CHECK CONSTRAINT [FK_BillDetail_Bill]
GO
ALTER TABLE [dbo].[BillDetail]  WITH CHECK ADD  CONSTRAINT [FK_BillDetail_Product] FOREIGN KEY([IDProduct])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[BillDetail] CHECK CONSTRAINT [FK_BillDetail_Product]
GO
ALTER TABLE [dbo].[Image]  WITH CHECK ADD  CONSTRAINT [FK_Image_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[Image] CHECK CONSTRAINT [FK_Image_Product]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Brand] FOREIGN KEY([BrandID])
REFERENCES [dbo].[Brand] ([ID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Brand]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_ProductCategory] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[ProductCategory] ([ID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_ProductCategory]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Permisssion] FOREIGN KEY([Permission])
REFERENCES [dbo].[Permisssion] ([ID])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Permisssion]
GO
USE [master]
GO
ALTER DATABASE [ElectricCityOnline] SET  READ_WRITE 
GO
