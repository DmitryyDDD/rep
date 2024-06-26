USE [master]
GO
/****** Object:  Database [SportMarket]    Script Date: 27.04.2024 20:42:07 ******/
CREATE DATABASE [SportMarket]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SportMarket', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\SportMarket.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SportMarket_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\SportMarket_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [SportMarket] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SportMarket].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SportMarket] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SportMarket] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SportMarket] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SportMarket] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SportMarket] SET ARITHABORT OFF 
GO
ALTER DATABASE [SportMarket] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SportMarket] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SportMarket] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SportMarket] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SportMarket] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SportMarket] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SportMarket] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SportMarket] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SportMarket] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SportMarket] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SportMarket] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SportMarket] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SportMarket] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SportMarket] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SportMarket] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SportMarket] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SportMarket] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SportMarket] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [SportMarket] SET  MULTI_USER 
GO
ALTER DATABASE [SportMarket] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SportMarket] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SportMarket] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SportMarket] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SportMarket] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SportMarket] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [SportMarket] SET QUERY_STORE = OFF
GO
USE [SportMarket]
GO
/****** Object:  Table [dbo].[Product_Category]    Script Date: 27.04.2024 20:42:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product_Category](
	[id_product_category] [int] IDENTITY(1,1) NOT NULL,
	[category_name] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK_Product_Category] PRIMARY KEY CLUSTERED 
(
	[id_product_category] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Provider]    Script Date: 27.04.2024 20:42:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Provider](
	[id_provider] [int] IDENTITY(1,1) NOT NULL,
	[name_provider] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_Provider] PRIMARY KEY CLUSTERED 
(
	[id_provider] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Manufacturer]    Script Date: 27.04.2024 20:42:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Manufacturer](
	[id_manufacturer] [int] IDENTITY(1,1) NOT NULL,
	[name_manufacturer] [nvarchar](15) NOT NULL,
 CONSTRAINT [PK_Manufacturer] PRIMARY KEY CLUSTERED 
(
	[id_manufacturer] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 27.04.2024 20:42:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[article] [nvarchar](8) NOT NULL,
	[name_product] [nvarchar](20) NOT NULL,
	[measure] [nvarchar](5) NOT NULL,
	[price] [int] NOT NULL,
	[max_discount] [int] NOT NULL,
	[id_manufacturer] [int] NULL,
	[id_provider] [int] NOT NULL,
	[id_product_category] [int] NOT NULL,
	[current_discount] [int] NOT NULL,
	[count] [int] NOT NULL,
	[description] [nvarchar](max) NOT NULL,
	[image] [nvarchar](20) NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[article] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[View_Product]    Script Date: 27.04.2024 20:42:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_Product]
AS
SELECT        dbo.Products.article AS Артикул, dbo.Products.name_product AS Название, dbo.Products.price AS Цена, dbo.Products.count AS Количество, dbo.Products.measure AS Мера, 
                         dbo.Products.current_discount AS [Текущая скидка], dbo.Manufacturer.name_manufacturer AS Производитель, dbo.Provider.name_provider AS Поставщик, dbo.Product_Category.category_name AS Категория, 
                         dbo.Products.description AS Описание
FROM            dbo.Products INNER JOIN
                         dbo.Manufacturer ON dbo.Products.id_manufacturer = dbo.Manufacturer.id_manufacturer INNER JOIN
                         dbo.Provider ON dbo.Products.id_provider = dbo.Provider.id_provider INNER JOIN
                         dbo.Product_Category ON dbo.Products.id_product_category = dbo.Product_Category.id_product_category
GO
/****** Object:  Table [dbo].[Cities]    Script Date: 27.04.2024 20:42:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cities](
	[id_city] [int] NOT NULL,
	[name_city] [nvarchar](15) NOT NULL,
 CONSTRAINT [PK_Cities] PRIMARY KEY CLUSTERED 
(
	[id_city] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order_Details]    Script Date: 27.04.2024 20:42:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order_Details](
	[article] [nvarchar](8) NOT NULL,
	[number_order] [int] NOT NULL,
	[count] [int] NOT NULL,
 CONSTRAINT [PK_Order_Details] PRIMARY KEY CLUSTERED 
(
	[article] ASC,
	[number_order] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 27.04.2024 20:42:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[number_order] [int] IDENTITY(1,1) NOT NULL,
	[date_order] [date] NOT NULL,
	[date_delivary] [date] NOT NULL,
	[id_pick-up_point] [int] NOT NULL,
	[id_user] [int] NULL,
	[receipt_code] [int] NOT NULL,
	[id_status] [int] NOT NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[number_order] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pick-up_Ponts]    Script Date: 27.04.2024 20:42:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pick-up_Ponts](
	[id_pick-up_point] [int] IDENTITY(1,1) NOT NULL,
	[number] [int] NOT NULL,
	[id_city] [int] NOT NULL,
	[street] [nvarchar](50) NOT NULL,
	[house] [int] NOT NULL,
 CONSTRAINT [PK_Pick-up_Ponts_1] PRIMARY KEY CLUSTERED 
(
	[id_pick-up_point] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Status]    Script Date: 27.04.2024 20:42:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Status](
	[id_status] [int] IDENTITY(1,1) NOT NULL,
	[name_status] [nvarchar](15) NOT NULL,
 CONSTRAINT [PK_Status] PRIMARY KEY CLUSTERED 
(
	[id_status] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User_Roles]    Script Date: 27.04.2024 20:42:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User_Roles](
	[id_user_roles] [int] IDENTITY(1,1) NOT NULL,
	[name_role] [nvarchar](15) NOT NULL,
 CONSTRAINT [PK_User_Roles] PRIMARY KEY CLUSTERED 
(
	[id_user_roles] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 27.04.2024 20:42:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[id_user] [int] IDENTITY(1,1) NOT NULL,
	[id_user_roles] [int] NOT NULL,
	[last_name] [nvarchar](50) NOT NULL,
	[first_name] [nvarchar](20) NOT NULL,
	[patronymic] [nvarchar](20) NOT NULL,
	[login] [nvarchar](50) NOT NULL,
	[password] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[id_user] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Cities] ([id_city], [name_city]) VALUES (1, N'Дубна')
GO
SET IDENTITY_INSERT [dbo].[Manufacturer] ON 

INSERT [dbo].[Manufacturer] ([id_manufacturer], [name_manufacturer]) VALUES (1, N'X-Match')
INSERT [dbo].[Manufacturer] ([id_manufacturer], [name_manufacturer]) VALUES (2, N'Perfetto Sport')
INSERT [dbo].[Manufacturer] ([id_manufacturer], [name_manufacturer]) VALUES (3, N'ROMANA Next')
INSERT [dbo].[Manufacturer] ([id_manufacturer], [name_manufacturer]) VALUES (4, N'Moby Kids')
INSERT [dbo].[Manufacturer] ([id_manufacturer], [name_manufacturer]) VALUES (5, N'playToday')
INSERT [dbo].[Manufacturer] ([id_manufacturer], [name_manufacturer]) VALUES (6, N'Совтехстром')
INSERT [dbo].[Manufacturer] ([id_manufacturer], [name_manufacturer]) VALUES (7, N'Abtoys')
INSERT [dbo].[Manufacturer] ([id_manufacturer], [name_manufacturer]) VALUES (8, N'DFC')
INSERT [dbo].[Manufacturer] ([id_manufacturer], [name_manufacturer]) VALUES (9, N'Nordway')
INSERT [dbo].[Manufacturer] ([id_manufacturer], [name_manufacturer]) VALUES (10, N'Ridex')
INSERT [dbo].[Manufacturer] ([id_manufacturer], [name_manufacturer]) VALUES (11, N'Salomon')
INSERT [dbo].[Manufacturer] ([id_manufacturer], [name_manufacturer]) VALUES (12, N'Mikasa')
INSERT [dbo].[Manufacturer] ([id_manufacturer], [name_manufacturer]) VALUES (13, N'Molten')
INSERT [dbo].[Manufacturer] ([id_manufacturer], [name_manufacturer]) VALUES (14, N'Colton')
INSERT [dbo].[Manufacturer] ([id_manufacturer], [name_manufacturer]) VALUES (15, N'Atemi')
INSERT [dbo].[Manufacturer] ([id_manufacturer], [name_manufacturer]) VALUES (16, N'Green Hill')
INSERT [dbo].[Manufacturer] ([id_manufacturer], [name_manufacturer]) VALUES (17, N'SKIF')
INSERT [dbo].[Manufacturer] ([id_manufacturer], [name_manufacturer]) VALUES (18, N'Starfit')
INSERT [dbo].[Manufacturer] ([id_manufacturer], [name_manufacturer]) VALUES (19, N'Bradex')
SET IDENTITY_INSERT [dbo].[Manufacturer] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([number_order], [date_order], [date_delivary], [id_pick-up_point], [id_user], [receipt_code], [id_status]) VALUES (1, CAST(N'2022-05-15' AS Date), CAST(N'2022-05-21' AS Date), 18, 7, 401, 1)
INSERT [dbo].[Orders] ([number_order], [date_order], [date_delivary], [id_pick-up_point], [id_user], [receipt_code], [id_status]) VALUES (2, CAST(N'2022-05-16' AS Date), CAST(N'2022-05-22' AS Date), 20, 8, 402, 1)
INSERT [dbo].[Orders] ([number_order], [date_order], [date_delivary], [id_pick-up_point], [id_user], [receipt_code], [id_status]) VALUES (3, CAST(N'2022-05-17' AS Date), CAST(N'2022-05-23' AS Date), 20, 9, 403, 2)
INSERT [dbo].[Orders] ([number_order], [date_order], [date_delivary], [id_pick-up_point], [id_user], [receipt_code], [id_status]) VALUES (4, CAST(N'2022-05-18' AS Date), CAST(N'2022-05-24' AS Date), 22, 10, 404, 1)
INSERT [dbo].[Orders] ([number_order], [date_order], [date_delivary], [id_pick-up_point], [id_user], [receipt_code], [id_status]) VALUES (5, CAST(N'2022-05-19' AS Date), CAST(N'2022-05-25' AS Date), 22, NULL, 405, 1)
INSERT [dbo].[Orders] ([number_order], [date_order], [date_delivary], [id_pick-up_point], [id_user], [receipt_code], [id_status]) VALUES (6, CAST(N'2022-05-19' AS Date), CAST(N'2022-05-25' AS Date), 16, NULL, 406, 1)
INSERT [dbo].[Orders] ([number_order], [date_order], [date_delivary], [id_pick-up_point], [id_user], [receipt_code], [id_status]) VALUES (7, CAST(N'2022-05-21' AS Date), CAST(N'2022-05-27' AS Date), 16, NULL, 407, 2)
INSERT [dbo].[Orders] ([number_order], [date_order], [date_delivary], [id_pick-up_point], [id_user], [receipt_code], [id_status]) VALUES (8, CAST(N'2022-05-22' AS Date), CAST(N'2022-05-28' AS Date), 18, NULL, 408, 2)
INSERT [dbo].[Orders] ([number_order], [date_order], [date_delivary], [id_pick-up_point], [id_user], [receipt_code], [id_status]) VALUES (9, CAST(N'2022-05-23' AS Date), CAST(N'2022-05-29' AS Date), 24, NULL, 409, 1)
INSERT [dbo].[Orders] ([number_order], [date_order], [date_delivary], [id_pick-up_point], [id_user], [receipt_code], [id_status]) VALUES (10, CAST(N'2022-05-24' AS Date), CAST(N'2022-05-30' AS Date), 24, NULL, 410, 2)
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[Pick-up_Ponts] ON 

INSERT [dbo].[Pick-up_Ponts] ([id_pick-up_point], [number], [id_city], [street], [house]) VALUES (1, 125061, 1, N'Подгорная', 8)
INSERT [dbo].[Pick-up_Ponts] ([id_pick-up_point], [number], [id_city], [street], [house]) VALUES (2, 125703, 1, N'Партизанская', 49)
INSERT [dbo].[Pick-up_Ponts] ([id_pick-up_point], [number], [id_city], [street], [house]) VALUES (3, 125837, 1, N'Шоссейная', 40)
INSERT [dbo].[Pick-up_Ponts] ([id_pick-up_point], [number], [id_city], [street], [house]) VALUES (4, 190949, 1, N'Мичурина', 26)
INSERT [dbo].[Pick-up_Ponts] ([id_pick-up_point], [number], [id_city], [street], [house]) VALUES (5, 344288, 1, N'Чехова', 1)
INSERT [dbo].[Pick-up_Ponts] ([id_pick-up_point], [number], [id_city], [street], [house]) VALUES (6, 394060, 1, N'Фрунзе', 43)
INSERT [dbo].[Pick-up_Ponts] ([id_pick-up_point], [number], [id_city], [street], [house]) VALUES (7, 394242, 1, N'Коммунистическая', 43)
INSERT [dbo].[Pick-up_Ponts] ([id_pick-up_point], [number], [id_city], [street], [house]) VALUES (8, 394782, 1, N'Чехова', 3)
INSERT [dbo].[Pick-up_Ponts] ([id_pick-up_point], [number], [id_city], [street], [house]) VALUES (9, 400562, 1, N'Зеленая', 32)
INSERT [dbo].[Pick-up_Ponts] ([id_pick-up_point], [number], [id_city], [street], [house]) VALUES (10, 410172, 1, N'Северная', 13)
INSERT [dbo].[Pick-up_Ponts] ([id_pick-up_point], [number], [id_city], [street], [house]) VALUES (11, 410542, 1, N'Светлая', 46)
INSERT [dbo].[Pick-up_Ponts] ([id_pick-up_point], [number], [id_city], [street], [house]) VALUES (12, 410661, 1, N'Школьная', 50)
INSERT [dbo].[Pick-up_Ponts] ([id_pick-up_point], [number], [id_city], [street], [house]) VALUES (13, 420151, 1, N'Вишневая', 32)
INSERT [dbo].[Pick-up_Ponts] ([id_pick-up_point], [number], [id_city], [street], [house]) VALUES (14, 426030, 1, N'Маяковского', 44)
INSERT [dbo].[Pick-up_Ponts] ([id_pick-up_point], [number], [id_city], [street], [house]) VALUES (15, 443890, 1, N'Коммунистическая', 1)
INSERT [dbo].[Pick-up_Ponts] ([id_pick-up_point], [number], [id_city], [street], [house]) VALUES (16, 450375, 1, N'Клубная', 44)
INSERT [dbo].[Pick-up_Ponts] ([id_pick-up_point], [number], [id_city], [street], [house]) VALUES (17, 450558, 1, N'Набережная', 30)
INSERT [dbo].[Pick-up_Ponts] ([id_pick-up_point], [number], [id_city], [street], [house]) VALUES (18, 450983, 1, N'Комсомольская', 26)
INSERT [dbo].[Pick-up_Ponts] ([id_pick-up_point], [number], [id_city], [street], [house]) VALUES (19, 454311, 1, N'Новая', 19)
INSERT [dbo].[Pick-up_Ponts] ([id_pick-up_point], [number], [id_city], [street], [house]) VALUES (20, 603002, 1, N'Дзержинского', 28)
INSERT [dbo].[Pick-up_Ponts] ([id_pick-up_point], [number], [id_city], [street], [house]) VALUES (21, 603036, 1, N'Садовая', 4)
INSERT [dbo].[Pick-up_Ponts] ([id_pick-up_point], [number], [id_city], [street], [house]) VALUES (22, 603379, 1, N'Спортивная', 46)
INSERT [dbo].[Pick-up_Ponts] ([id_pick-up_point], [number], [id_city], [street], [house]) VALUES (23, 603721, 1, N'Гоголя', 41)
INSERT [dbo].[Pick-up_Ponts] ([id_pick-up_point], [number], [id_city], [street], [house]) VALUES (24, 614164, 1, N'Степная', 30)
INSERT [dbo].[Pick-up_Ponts] ([id_pick-up_point], [number], [id_city], [street], [house]) VALUES (25, 614510, 1, N'Маяковского', 47)
INSERT [dbo].[Pick-up_Ponts] ([id_pick-up_point], [number], [id_city], [street], [house]) VALUES (26, 614611, 1, N'Молодежная', 50)
INSERT [dbo].[Pick-up_Ponts] ([id_pick-up_point], [number], [id_city], [street], [house]) VALUES (27, 614753, 1, N'Полевая', 35)
INSERT [dbo].[Pick-up_Ponts] ([id_pick-up_point], [number], [id_city], [street], [house]) VALUES (28, 620839, 1, N'Цветочная', 8)
INSERT [dbo].[Pick-up_Ponts] ([id_pick-up_point], [number], [id_city], [street], [house]) VALUES (29, 625283, 1, N'Победы', 46)
INSERT [dbo].[Pick-up_Ponts] ([id_pick-up_point], [number], [id_city], [street], [house]) VALUES (30, 625560, 1, N'Некрасова', 12)
INSERT [dbo].[Pick-up_Ponts] ([id_pick-up_point], [number], [id_city], [street], [house]) VALUES (31, 625590, 1, N'Коммунистическая', 20)
INSERT [dbo].[Pick-up_Ponts] ([id_pick-up_point], [number], [id_city], [street], [house]) VALUES (32, 625683, 1, N'8 Марта', 12)
INSERT [dbo].[Pick-up_Ponts] ([id_pick-up_point], [number], [id_city], [street], [house]) VALUES (33, 630201, 1, N'Комсомольская', 17)
INSERT [dbo].[Pick-up_Ponts] ([id_pick-up_point], [number], [id_city], [street], [house]) VALUES (34, 630370, 1, N'Шоссейная', 24)
INSERT [dbo].[Pick-up_Ponts] ([id_pick-up_point], [number], [id_city], [street], [house]) VALUES (35, 660007, 1, N'Октябрьская', 19)
INSERT [dbo].[Pick-up_Ponts] ([id_pick-up_point], [number], [id_city], [street], [house]) VALUES (36, 660540, 1, N'Солнечная', 25)
SET IDENTITY_INSERT [dbo].[Pick-up_Ponts] OFF
GO
SET IDENTITY_INSERT [dbo].[Product_Category] ON 

INSERT [dbo].[Product_Category] ([id_product_category], [category_name]) VALUES (1, N'Спортивный инвентарь')
INSERT [dbo].[Product_Category] ([id_product_category], [category_name]) VALUES (2, N'Одежда')
SET IDENTITY_INSERT [dbo].[Product_Category] OFF
GO
INSERT [dbo].[Products] ([article], [name_product], [measure], [price], [max_discount], [id_manufacturer], [id_provider], [id_product_category], [current_discount], [count], [description], [image]) VALUES (N'B538G6', N'Спортивный костюм', N'шт.', 839, 5, 5, 1, 2, 3, 17, N'Спортивный костюм 5 (футболка + шорты)', N'B538G6.jpg')
INSERT [dbo].[Products] ([article], [name_product], [measure], [price], [max_discount], [id_manufacturer], [id_provider], [id_product_category], [current_discount], [count], [description], [image]) VALUES (N'C324S5', N'Шлем', N'шт.', 4000, 10, 11, 2, 1, 5, 16, N'Шлем г.л./сноуб. 11 Grom р.:KS черный (L40836800)', NULL)
INSERT [dbo].[Products] ([article], [name_product], [measure], [price], [max_discount], [id_manufacturer], [id_provider], [id_product_category], [current_discount], [count], [description], [image]) VALUES (N'D038G6', N'Лыжный комплект', N'шт.', 3000, 30, 9, 2, 1, 4, 23, N'Лыжный комплект беговые 9 XC Classic, 45-45-45мм, 160см', NULL)
INSERT [dbo].[Products] ([article], [name_product], [measure], [price], [max_discount], [id_manufacturer], [id_provider], [id_product_category], [current_discount], [count], [description], [image]) VALUES (N'D648N7', N'Набор для хоккея', N'шт.', 350, 10, 6, 2, 1, 4, 7, N'Набор для хоккея 6', N'D648N7.jpg')
INSERT [dbo].[Products] ([article], [name_product], [measure], [price], [max_discount], [id_manufacturer], [id_provider], [id_product_category], [current_discount], [count], [description], [image]) VALUES (N'D830R5', N'Тренажер прыжков', N'шт.', 1120, 15, 4, 1, 1, 4, 8, N'Тренажер для прыжков 4 Moby-Jumper со счетчиком', N'D830R5.jpg')
INSERT [dbo].[Products] ([article], [name_product], [measure], [price], [max_discount], [id_manufacturer], [id_provider], [id_product_category], [current_discount], [count], [description], [image]) VALUES (N'D893W4', N'Мяч', N'шт.', 900, 5, NULL, 1, 1, 2, 5, N'Мяч футбольный DEMIX 1STLS1JWWW, универсальный, 4-й размер, белый/зеленый', NULL)
INSERT [dbo].[Products] ([article], [name_product], [measure], [price], [max_discount], [id_manufacturer], [id_provider], [id_product_category], [current_discount], [count], [description], [image]) VALUES (N'D927K3', N'Перчатки ', N'шт.', 660, 15, 18, 2, 1, 4, 3, N'Перчатки 18 SU-125 атлетические S черный', NULL)
INSERT [dbo].[Products] ([article], [name_product], [measure], [price], [max_discount], [id_manufacturer], [id_provider], [id_product_category], [current_discount], [count], [description], [image]) VALUES (N'E324U7', N'Велотренажер', N'шт.', 6480, 25, 8, 1, 1, 5, 5, N'Велотренажер двойной 8 B804 dual bike', N'E324U7.jpg')
INSERT [dbo].[Products] ([article], [name_product], [measure], [price], [max_discount], [id_manufacturer], [id_provider], [id_product_category], [current_discount], [count], [description], [image]) VALUES (N'F047J7', N'Коврик', N'шт.', 720, 15, 19, 1, 1, 5, 11, N'Коврик 19 для мягкой йоги дл.:1730мм ш.:610мм т.:3мм серый', NULL)
INSERT [dbo].[Products] ([article], [name_product], [measure], [price], [max_discount], [id_manufacturer], [id_provider], [id_product_category], [current_discount], [count], [description], [image]) VALUES (N'F687G5', N'Защита голени', N'шт.', 1900, 15, 16, 1, 1, 4, 6, N'Защита голени 16 Panther, L, синий/черный', NULL)
INSERT [dbo].[Products] ([article], [name_product], [measure], [price], [max_discount], [id_manufacturer], [id_provider], [id_product_category], [current_discount], [count], [description], [image]) VALUES (N'F735B6', N'Игровой набор', N'шт.', 320, 15, 6, 2, 1, 2, 9, N'Игровой набор 6 Кегли и шары', N'F735B6.jpg')
INSERT [dbo].[Products] ([article], [name_product], [measure], [price], [max_discount], [id_manufacturer], [id_provider], [id_product_category], [current_discount], [count], [description], [image]) VALUES (N'F746E6', N'Шведская стенка', N'шт.', 9900, 10, 3, 2, 1, 3, 5, N'Шведская стенка 3, pastel', N'F746E6.jpg')
INSERT [dbo].[Products] ([article], [name_product], [measure], [price], [max_discount], [id_manufacturer], [id_provider], [id_product_category], [current_discount], [count], [description], [image]) VALUES (N'F937G4', N'Игровой набор', N'шт.', 480, 10, 7, 1, 1, 4, 12, N'Набор 7 Бадминтон и теннис ', N'F937G4.jpg')
INSERT [dbo].[Products] ([article], [name_product], [measure], [price], [max_discount], [id_manufacturer], [id_provider], [id_product_category], [current_discount], [count], [description], [image]) VALUES (N'G403T5', N'Тюбинг', N'шт.', 1450, 15, 9, 1, 1, 4, 13, N'Тюбинг 9, 73 см', N'G403T5.jpg')
INSERT [dbo].[Products] ([article], [name_product], [measure], [price], [max_discount], [id_manufacturer], [id_provider], [id_product_category], [current_discount], [count], [description], [image]) VALUES (N'G480F5', N'Ролики', N'шт.', 1600, 15, 10, 1, 1, 4, 7, N'Коньки роликовые 10 Cricket жен. ABEC 3 кол.:72мм р.:39-42 синий', NULL)
INSERT [dbo].[Products] ([article], [name_product], [measure], [price], [max_discount], [id_manufacturer], [id_provider], [id_product_category], [current_discount], [count], [description], [image]) VALUES (N'G522B5', N'Ласты', N'шт.', 1980, 15, 14, 2, 1, 3, 6, N'Ласты 14 CF-02 для плавания р.:33-34 серый/голубой', NULL)
INSERT [dbo].[Products] ([article], [name_product], [measure], [price], [max_discount], [id_manufacturer], [id_provider], [id_product_category], [current_discount], [count], [description], [image]) VALUES (N'G598Y6', N'Спортивный мат', N'шт.', 2390, 15, 2, 2, 1, 2, 16, N'Спортивный мат 100x100x10 см 2 № 3 бежевый', N'G598Y6.jpg')
INSERT [dbo].[Products] ([article], [name_product], [measure], [price], [max_discount], [id_manufacturer], [id_provider], [id_product_category], [current_discount], [count], [description], [image]) VALUES (N'G873H4', N'Велосипед', N'шт.', 14930, 5, 17, 1, 1, 4, 6, N'Велосипед 17 29 Disc (2021), горный (взрослый), рама: 17", колеса: 29", темно-серый', NULL)
INSERT [dbo].[Products] ([article], [name_product], [measure], [price], [max_discount], [id_manufacturer], [id_provider], [id_product_category], [current_discount], [count], [description], [image]) VALUES (N'J4DF5E', N'Насос', N'шт.', 300, 5, 13, 1, 1, 4, 12, N'Насос 13 HP-18-B для мячей мультиколор', NULL)
INSERT [dbo].[Products] ([article], [name_product], [measure], [price], [max_discount], [id_manufacturer], [id_provider], [id_product_category], [current_discount], [count], [description], [image]) VALUES (N'J532D4', N'Перчатки для карате', N'шт.', 1050, 15, 16, 1, 1, 3, 5, N'Перчатки для каратэ 16 KMС-6083 L красный', NULL)
INSERT [dbo].[Products] ([article], [name_product], [measure], [price], [max_discount], [id_manufacturer], [id_provider], [id_product_category], [current_discount], [count], [description], [image]) VALUES (N'K432G6', N'Шапочка для плавания', N'шт.', 440, 25, 15, 2, 1, 5, 17, N'Шапочка для плавания 15 PU 140 ткань с покрытием желтый', NULL)
INSERT [dbo].[Products] ([article], [name_product], [measure], [price], [max_discount], [id_manufacturer], [id_provider], [id_product_category], [current_discount], [count], [description], [image]) VALUES (N'K937A5', N'Гиря', N'шт.', 890, 5, 18, 2, 1, 4, 10, N'Гиря 18 ГМБ4 мягкое 4кг синий/оранжевый', NULL)
INSERT [dbo].[Products] ([article], [name_product], [measure], [price], [max_discount], [id_manufacturer], [id_provider], [id_product_category], [current_discount], [count], [description], [image]) VALUES (N'N483G5', N'Клюшка', N'шт.', 1299, 10, 9, 2, 1, 3, 4, N'Клюшка 9 NDW300 (2019/2020) SR лев. 19 150см', NULL)
INSERT [dbo].[Products] ([article], [name_product], [measure], [price], [max_discount], [id_manufacturer], [id_provider], [id_product_category], [current_discount], [count], [description], [image]) VALUES (N'N836R5', N'Коньки', N'шт.', 2000, 10, 15, 2, 1, 3, 16, N'Коньки 15 AKSK01DXS, раздвижные, прогулочные, унисекс, 27-30, черный/зеленый', NULL)
INSERT [dbo].[Products] ([article], [name_product], [measure], [price], [max_discount], [id_manufacturer], [id_provider], [id_product_category], [current_discount], [count], [description], [image]) VALUES (N'N892G6', N'Очки для плавания', N'шт.', 500, 5, 15, 2, 1, 5, 14, N'Очки для плавания 15 N8401 синий', NULL)
INSERT [dbo].[Products] ([article], [name_product], [measure], [price], [max_discount], [id_manufacturer], [id_provider], [id_product_category], [current_discount], [count], [description], [image]) VALUES (N'S374B5', N'Ролик для йоги', N'шт.', 700, 10, 19, 1, 1, 3, 12, N'Ролик для йоги 19 Туба d=14см ш.:33см оранжевый', NULL)
INSERT [dbo].[Products] ([article], [name_product], [measure], [price], [max_discount], [id_manufacturer], [id_provider], [id_product_category], [current_discount], [count], [description], [image]) VALUES (N'V312R4', N'Мяч', N'шт.', 4150, 20, 12, 2, 1, 2, 5, N'Мяч волейбольный 12 VT370W, для зала, 5-й размер, желтый/синий', NULL)
INSERT [dbo].[Products] ([article], [name_product], [measure], [price], [max_discount], [id_manufacturer], [id_provider], [id_product_category], [current_discount], [count], [description], [image]) VALUES (N'V392H7', N'Степ-платформа', N'шт.', 4790, 10, 18, 1, 1, 3, 15, N'Степ-платформа 18 SP-204 серый/черный', NULL)
INSERT [dbo].[Products] ([article], [name_product], [measure], [price], [max_discount], [id_manufacturer], [id_provider], [id_product_category], [current_discount], [count], [description], [image]) VALUES (N'V423D4', N'Штанга', N'шт.', 5600, 10, 18, 2, 1, 3, 8, N'Штанга 18 BB-401 30кг пласт. черный ', NULL)
INSERT [dbo].[Products] ([article], [name_product], [measure], [price], [max_discount], [id_manufacturer], [id_provider], [id_product_category], [current_discount], [count], [description], [image]) VALUES (N'А112Т4', N'Боксерская груша', N'шт.', 778, 30, 1, 1, 1, 5, 6, N'Боксерская груша 1 черная', N'А112Т4.jpg')
GO
SET IDENTITY_INSERT [dbo].[Provider] ON 

INSERT [dbo].[Provider] ([id_provider], [name_provider]) VALUES (1, N'Спортмастер')
INSERT [dbo].[Provider] ([id_provider], [name_provider]) VALUES (2, N'Декатлон')
SET IDENTITY_INSERT [dbo].[Provider] OFF
GO
SET IDENTITY_INSERT [dbo].[Status] ON 

INSERT [dbo].[Status] ([id_status], [name_status]) VALUES (1, N'Новый')
INSERT [dbo].[Status] ([id_status], [name_status]) VALUES (2, N'Завершён')
SET IDENTITY_INSERT [dbo].[Status] OFF
GO
SET IDENTITY_INSERT [dbo].[User_Roles] ON 

INSERT [dbo].[User_Roles] ([id_user_roles], [name_role]) VALUES (1, N'Администратор')
INSERT [dbo].[User_Roles] ([id_user_roles], [name_role]) VALUES (2, N'Менеджер')
INSERT [dbo].[User_Roles] ([id_user_roles], [name_role]) VALUES (3, N'Клиент')
SET IDENTITY_INSERT [dbo].[User_Roles] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([id_user], [id_user_roles], [last_name], [first_name], [patronymic], [login], [password]) VALUES (1, 1, N'Пахомова', N'Аиша', N'Анатольевна', N'm4ic8j5qgstw@gmail.com', N'2L6KZG')
INSERT [dbo].[Users] ([id_user], [id_user_roles], [last_name], [first_name], [patronymic], [login], [password]) VALUES (2, 1, N'Жуков', N'Роман', N'Богданович', N'd43zfg9tlsyv@gmail.com', N'uzWC67')
INSERT [dbo].[Users] ([id_user], [id_user_roles], [last_name], [first_name], [patronymic], [login], [password]) VALUES (3, 1, N'Киселева', N'Анастасия', N'Максимовна', N'8ohgisf6k45w@outlook.com', N'8ntwUp')
INSERT [dbo].[Users] ([id_user], [id_user_roles], [last_name], [first_name], [patronymic], [login], [password]) VALUES (4, 2, N'Григорьева', N'Арина', N'Арсентьевна', N'hi1brwj46czx@mail.com', N'YOyhfR')
INSERT [dbo].[Users] ([id_user], [id_user_roles], [last_name], [first_name], [patronymic], [login], [password]) VALUES (5, 2, N'Иванов', N'Лев', N'Михайлович', N'fvkbcamhlj52@gmail.com', N'RSbvHv')
INSERT [dbo].[Users] ([id_user], [id_user_roles], [last_name], [first_name], [patronymic], [login], [password]) VALUES (6, 2, N'Григорьев', N'Лев', N'Давидович', N'9qxnce8jwruv@gmail.com', N'rwVDh9')
INSERT [dbo].[Users] ([id_user], [id_user_roles], [last_name], [first_name], [patronymic], [login], [password]) VALUES (7, 3, N'Поляков', N'Степан', N'Егорович', N'dotiex942p1r@gmail.com', N'LdNyos')
INSERT [dbo].[Users] ([id_user], [id_user_roles], [last_name], [first_name], [patronymic], [login], [password]) VALUES (8, 3, N'Леонова', N'Алиса', N'Кирилловна', N'n0bmi2h1xral@tutanota.com', N'gynQMT')
INSERT [dbo].[Users] ([id_user], [id_user_roles], [last_name], [first_name], [patronymic], [login], [password]) VALUES (9, 3, N'Яковлев', N'Платон', N'Константинович', N'sfm3t278kdvz@yahoo.com', N'AtnDjr')
INSERT [dbo].[Users] ([id_user], [id_user_roles], [last_name], [first_name], [patronymic], [login], [password]) VALUES (10, 3, N'Ковалева', N'Ева', N'Яковлевна', N'ilb8rdut0v7e@mail.com', N'JlFRCZ')
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[Order_Details]  WITH CHECK ADD  CONSTRAINT [FK_Order_Details_Orders] FOREIGN KEY([number_order])
REFERENCES [dbo].[Orders] ([number_order])
GO
ALTER TABLE [dbo].[Order_Details] CHECK CONSTRAINT [FK_Order_Details_Orders]
GO
ALTER TABLE [dbo].[Order_Details]  WITH CHECK ADD  CONSTRAINT [FK_Order_Details_Products] FOREIGN KEY([article])
REFERENCES [dbo].[Products] ([article])
GO
ALTER TABLE [dbo].[Order_Details] CHECK CONSTRAINT [FK_Order_Details_Products]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Pick-up_Ponts] FOREIGN KEY([id_pick-up_point])
REFERENCES [dbo].[Pick-up_Ponts] ([id_pick-up_point])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Pick-up_Ponts]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Status] FOREIGN KEY([id_status])
REFERENCES [dbo].[Status] ([id_status])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Status]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Users] FOREIGN KEY([id_user])
REFERENCES [dbo].[Users] ([id_user])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Users]
GO
ALTER TABLE [dbo].[Pick-up_Ponts]  WITH CHECK ADD  CONSTRAINT [FK_Pick-up_Ponts_Pick-up_Ponts] FOREIGN KEY([id_city])
REFERENCES [dbo].[Cities] ([id_city])
GO
ALTER TABLE [dbo].[Pick-up_Ponts] CHECK CONSTRAINT [FK_Pick-up_Ponts_Pick-up_Ponts]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Manufacturer] FOREIGN KEY([id_manufacturer])
REFERENCES [dbo].[Manufacturer] ([id_manufacturer])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Manufacturer]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Product_Category] FOREIGN KEY([id_product_category])
REFERENCES [dbo].[Product_Category] ([id_product_category])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Product_Category]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Provider] FOREIGN KEY([id_provider])
REFERENCES [dbo].[Provider] ([id_provider])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Provider]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_User_Roles] FOREIGN KEY([id_user_roles])
REFERENCES [dbo].[User_Roles] ([id_user_roles])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_User_Roles]
GO
/****** Object:  StoredProcedure [dbo].[Autorization_Proc]    Script Date: 27.04.2024 20:42:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Autorization_Proc]
	@login nvarchar(50),
	@password nvarchar(30)
AS
BEGIN
	SET NOCOUNT ON;

	SELECT * FROM [dbo].[Users] WHERE (@login = login) and (@password = password)
END
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[47] 4[15] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Products"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 242
               Right = 235
            End
            DisplayFlags = 280
            TopColumn = 2
         End
         Begin Table = "Manufacturer"
            Begin Extent = 
               Top = 6
               Left = 273
               Bottom = 102
               Right = 469
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Provider"
            Begin Extent = 
               Top = 6
               Left = 507
               Bottom = 102
               Right = 677
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Product_Category"
            Begin Extent = 
               Top = 6
               Left = 715
               Bottom = 102
               Right = 912
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_Product'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_Product'
GO
USE [master]
GO
ALTER DATABASE [SportMarket] SET  READ_WRITE 
GO
