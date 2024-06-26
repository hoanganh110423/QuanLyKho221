USE [master]
GO
/****** Object:  Database [ProjectPRN221]    Script Date: 4/9/2024 8:18:06 AM ******/
CREATE DATABASE [ProjectPRN221]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ProjectPRN221', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\ProjectPRN221.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ProjectPRN221_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\ProjectPRN221_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [ProjectPRN221] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ProjectPRN221].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ProjectPRN221] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ProjectPRN221] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ProjectPRN221] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ProjectPRN221] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ProjectPRN221] SET ARITHABORT OFF 
GO
ALTER DATABASE [ProjectPRN221] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ProjectPRN221] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ProjectPRN221] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ProjectPRN221] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ProjectPRN221] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ProjectPRN221] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ProjectPRN221] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ProjectPRN221] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ProjectPRN221] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ProjectPRN221] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ProjectPRN221] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ProjectPRN221] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ProjectPRN221] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ProjectPRN221] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ProjectPRN221] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ProjectPRN221] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ProjectPRN221] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ProjectPRN221] SET RECOVERY FULL 
GO
ALTER DATABASE [ProjectPRN221] SET  MULTI_USER 
GO
ALTER DATABASE [ProjectPRN221] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ProjectPRN221] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ProjectPRN221] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ProjectPRN221] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ProjectPRN221] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ProjectPRN221] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [ProjectPRN221] SET QUERY_STORE = ON
GO
ALTER DATABASE [ProjectPRN221] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [ProjectPRN221]
GO
/****** Object:  User [hoanganh1]    Script Date: 4/9/2024 8:18:06 AM ******/
CREATE USER [hoanganh1] FOR LOGIN [hoanganh1] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [hoanganh]    Script Date: 4/9/2024 8:18:06 AM ******/
CREATE USER [hoanganh] FOR LOGIN [hoanganh] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 4/9/2024 8:18:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DisplayName] [nvarchar](max) NULL,
	[Address] [nvarchar](max) NULL,
	[Phone] [nvarchar](20) NULL,
	[Email] [nvarchar](200) NULL,
	[MoreInfo] [nvarchar](max) NULL,
	[ContractDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Input]    Script Date: 4/9/2024 8:18:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Input](
	[Id] [nvarchar](128) NOT NULL,
	[DateInput] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InputInfo]    Script Date: 4/9/2024 8:18:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InputInfo](
	[Id] [nvarchar](128) NOT NULL,
	[IdObject] [nvarchar](128) NOT NULL,
	[IdInput] [nvarchar](128) NOT NULL,
	[Count] [int] NULL,
	[InputPrice] [float] NULL,
	[OutputPrice] [float] NULL,
	[Status] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Object]    Script Date: 4/9/2024 8:18:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Object](
	[Id] [nvarchar](128) NOT NULL,
	[DisplayName] [nvarchar](max) NULL,
	[IdUnit] [int] NOT NULL,
	[IdSuplier] [int] NOT NULL,
	[QRCode] [nvarchar](max) NULL,
	[BarCode] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Output]    Script Date: 4/9/2024 8:18:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Output](
	[Id] [nvarchar](128) NOT NULL,
	[DateOutput] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OutputInfo]    Script Date: 4/9/2024 8:18:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OutputInfo](
	[Id] [nvarchar](128) NOT NULL,
	[IdObject] [nvarchar](128) NOT NULL,
	[IdOutput] [nvarchar](128) NOT NULL,
	[IdCustomer] [int] NOT NULL,
	[Count] [int] NULL,
	[SumPrice] [int] NULL,
	[Status] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Suplier]    Script Date: 4/9/2024 8:18:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Suplier](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DisplayName] [nvarchar](max) NULL,
	[Address] [nvarchar](max) NULL,
	[Phone] [nvarchar](20) NULL,
	[Email] [nvarchar](200) NULL,
	[MoreInfo] [nvarchar](max) NULL,
	[ContractDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Unit]    Script Date: 4/9/2024 8:18:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Unit](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DisplayName] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserRole]    Script Date: 4/9/2024 8:18:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRole](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DisplayName] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 4/9/2024 8:18:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DisplayName] [nvarchar](max) NULL,
	[UserName] [nvarchar](100) NULL,
	[Password] [nvarchar](max) NULL,
	[IdRole] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Customer] ON 

INSERT [dbo].[Customer] ([Id], [DisplayName], [Address], [Phone], [Email], [MoreInfo], [ContractDate]) VALUES (1, N'Nguyễn Hoàng Anh', N'Nam Định', N'0123456789', N'nha@gmail.com', N'123', NULL)
INSERT [dbo].[Customer] ([Id], [DisplayName], [Address], [Phone], [Email], [MoreInfo], [ContractDate]) VALUES (2, N'Nguyễn Tuấn Anh', N'Hà Nội', N'0123456789', N'ta@gmail.com', NULL, NULL)
INSERT [dbo].[Customer] ([Id], [DisplayName], [Address], [Phone], [Email], [MoreInfo], [ContractDate]) VALUES (5, N'Trần Tuấn Anh', N'Ba Vì', N'0123456789', N'tta@gmail.com', N'39', CAST(N'2024-11-04T00:00:00.000' AS DateTime))
INSERT [dbo].[Customer] ([Id], [DisplayName], [Address], [Phone], [Email], [MoreInfo], [ContractDate]) VALUES (6, N'Nguyễn Mạnh Cường', N'Bắc Giang', N'0123456789', N'nmc@gmail.com', NULL, NULL)
INSERT [dbo].[Customer] ([Id], [DisplayName], [Address], [Phone], [Email], [MoreInfo], [ContractDate]) VALUES (7, N'Phan Duy Đông', N'Ba Vì', N'0123456789', N'pdd@gmail.com', NULL, NULL)
SET IDENTITY_INSERT [dbo].[Customer] OFF
GO
INSERT [dbo].[Input] ([Id], [DateInput]) VALUES (N'1', CAST(N'2024-04-12T00:00:00.000' AS DateTime))
INSERT [dbo].[Input] ([Id], [DateInput]) VALUES (N'1fadc114-fffe-4c49-a65b-87c254c2c633', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[Input] ([Id], [DateInput]) VALUES (N'2', CAST(N'2024-04-12T00:00:00.000' AS DateTime))
INSERT [dbo].[Input] ([Id], [DateInput]) VALUES (N'28ffffa3-2e56-4c02-92f5-f6ca4756e87e', CAST(N'2024-04-08T00:00:00.000' AS DateTime))
INSERT [dbo].[Input] ([Id], [DateInput]) VALUES (N'4ca4f84e-eab3-420f-97ac-e408ce751420', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[Input] ([Id], [DateInput]) VALUES (N'aeab46ea-2dbd-422c-8ae9-8c2bce6d88e6', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[Input] ([Id], [DateInput]) VALUES (N'b9846ec5-f9e1-4e96-9d7b-9fcceda5b825', CAST(N'2024-04-12T00:00:00.000' AS DateTime))
INSERT [dbo].[Input] ([Id], [DateInput]) VALUES (N'f7470090-2515-460d-9998-456e0cd4a073', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[Input] ([Id], [DateInput]) VALUES (N'fb68dff9-009b-460e-9466-e9d14cfe5da0', CAST(N'2024-04-12T00:00:00.000' AS DateTime))
INSERT [dbo].[Input] ([Id], [DateInput]) VALUES (N'ff203ba6-c5b2-4ebb-8569-b67c45ab1d1e', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[InputInfo] ([Id], [IdObject], [IdInput], [Count], [InputPrice], [OutputPrice], [Status]) VALUES (N'1', N'1', N'1', 500, 250000, 390000, NULL)
INSERT [dbo].[InputInfo] ([Id], [IdObject], [IdInput], [Count], [InputPrice], [OutputPrice], [Status]) VALUES (N'2', N'4', N'1', 500, 250000, 390000, NULL)
INSERT [dbo].[InputInfo] ([Id], [IdObject], [IdInput], [Count], [InputPrice], [OutputPrice], [Status]) VALUES (N'2f193082-1b3d-4706-9937-f29b379bc230', N'2', N'b9846ec5-f9e1-4e96-9d7b-9fcceda5b825', 500, 250000, 390000, NULL)
INSERT [dbo].[InputInfo] ([Id], [IdObject], [IdInput], [Count], [InputPrice], [OutputPrice], [Status]) VALUES (N'3', N'5', N'1', 500, 430000, 590000, NULL)
INSERT [dbo].[InputInfo] ([Id], [IdObject], [IdInput], [Count], [InputPrice], [OutputPrice], [Status]) VALUES (N'4', N'6', N'1', 500, 430000, 590000, NULL)
INSERT [dbo].[InputInfo] ([Id], [IdObject], [IdInput], [Count], [InputPrice], [OutputPrice], [Status]) VALUES (N'40409a76-df0b-4944-9e80-8b58f134d145', N'1', N'28ffffa3-2e56-4c02-92f5-f6ca4756e87e', 500, 250000, 390000, NULL)
INSERT [dbo].[InputInfo] ([Id], [IdObject], [IdInput], [Count], [InputPrice], [OutputPrice], [Status]) VALUES (N'5', N'7', N'2', 500, 430000, 590000, NULL)
INSERT [dbo].[InputInfo] ([Id], [IdObject], [IdInput], [Count], [InputPrice], [OutputPrice], [Status]) VALUES (N'6', N'10', N'2', 500, 230000, 310000, NULL)
INSERT [dbo].[InputInfo] ([Id], [IdObject], [IdInput], [Count], [InputPrice], [OutputPrice], [Status]) VALUES (N'7', N'11', N'2', 500, 230000, 310000, NULL)
INSERT [dbo].[InputInfo] ([Id], [IdObject], [IdInput], [Count], [InputPrice], [OutputPrice], [Status]) VALUES (N'8', N'12', N'2', 500, 230000, 310000, NULL)
INSERT [dbo].[InputInfo] ([Id], [IdObject], [IdInput], [Count], [InputPrice], [OutputPrice], [Status]) VALUES (N'ac1284f9-a195-4923-8c8d-60a30188a8a4', N'8', N'ff203ba6-c5b2-4ebb-8569-b67c45ab1d1e', 500, 430000, 600000, NULL)
INSERT [dbo].[InputInfo] ([Id], [IdObject], [IdInput], [Count], [InputPrice], [OutputPrice], [Status]) VALUES (N'b1de2a29-575b-4149-b792-7a152c41f394', N'9', N'4ca4f84e-eab3-420f-97ac-e408ce751420', 500, 30000, 590000, NULL)
INSERT [dbo].[InputInfo] ([Id], [IdObject], [IdInput], [Count], [InputPrice], [OutputPrice], [Status]) VALUES (N'c24809d8-c609-4101-a1e9-da554346381b', N'1', N'aeab46ea-2dbd-422c-8ae9-8c2bce6d88e6', 50, 250000, 390000, NULL)
GO
INSERT [dbo].[Object] ([Id], [DisplayName], [IdUnit], [IdSuplier], [QRCode], [BarCode]) VALUES (N'1', N'Nước hoa No. 32', 1, 1, NULL, NULL)
INSERT [dbo].[Object] ([Id], [DisplayName], [IdUnit], [IdSuplier], [QRCode], [BarCode]) VALUES (N'10', N'Sữa tắm BST Lumin - Rose Quince 300ml', 3, 1, NULL, NULL)
INSERT [dbo].[Object] ([Id], [DisplayName], [IdUnit], [IdSuplier], [QRCode], [BarCode]) VALUES (N'11', N'Sữa tắm BST Lumin - Harmony Of The Sea 300ml', 3, 1, NULL, NULL)
INSERT [dbo].[Object] ([Id], [DisplayName], [IdUnit], [IdSuplier], [QRCode], [BarCode]) VALUES (N'12', N'Sữa tắm BST Lumin - Lemon Cedar 300ml', 3, 1, NULL, NULL)
INSERT [dbo].[Object] ([Id], [DisplayName], [IdUnit], [IdSuplier], [QRCode], [BarCode]) VALUES (N'2', N'Nước hoa No. 33', 1, 1, NULL, NULL)
INSERT [dbo].[Object] ([Id], [DisplayName], [IdUnit], [IdSuplier], [QRCode], [BarCode]) VALUES (N'3', N'Nước hoa No. 226', 1, 1, NULL, NULL)
INSERT [dbo].[Object] ([Id], [DisplayName], [IdUnit], [IdSuplier], [QRCode], [BarCode]) VALUES (N'4', N'Nước hoa No. 03', 1, 1, NULL, NULL)
INSERT [dbo].[Object] ([Id], [DisplayName], [IdUnit], [IdSuplier], [QRCode], [BarCode]) VALUES (N'5', N'Nến Elements Mệnh Thổ - Christmas Spice', 2, 1, NULL, NULL)
INSERT [dbo].[Object] ([Id], [DisplayName], [IdUnit], [IdSuplier], [QRCode], [BarCode]) VALUES (N'6', N'Nến Elements Mệnh Mộc - Orange Sandalwood', 2, 1, NULL, NULL)
INSERT [dbo].[Object] ([Id], [DisplayName], [IdUnit], [IdSuplier], [QRCode], [BarCode]) VALUES (N'7', N'Nến Elements mệnh Thuỷ - Fougere Marine', 2, 1, NULL, NULL)
INSERT [dbo].[Object] ([Id], [DisplayName], [IdUnit], [IdSuplier], [QRCode], [BarCode]) VALUES (N'8', N'Nến Elements Mệnh Hỏa - Fresh Linen', 2, 1, NULL, NULL)
INSERT [dbo].[Object] ([Id], [DisplayName], [IdUnit], [IdSuplier], [QRCode], [BarCode]) VALUES (N'9', N'Nến Elements mệnh Kim - Prime', 2, 1, NULL, NULL)
INSERT [dbo].[Object] ([Id], [DisplayName], [IdUnit], [IdSuplier], [QRCode], [BarCode]) VALUES (N'ddabeed1-1a84-4b44-87e3-aa3d2b9f3407', N'bodymist', 1, 1, NULL, NULL)
GO
INSERT [dbo].[Output] ([Id], [DateOutput]) VALUES (N'0177b594-a4ba-4757-b20b-f1f41776b93f', CAST(N'2024-04-11T00:00:00.000' AS DateTime))
INSERT [dbo].[Output] ([Id], [DateOutput]) VALUES (N'06cdeffb-90bf-450f-9c1c-07f062117774', CAST(N'2024-04-12T00:00:00.000' AS DateTime))
INSERT [dbo].[Output] ([Id], [DateOutput]) VALUES (N'1', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[Output] ([Id], [DateOutput]) VALUES (N'10757a2c-9e52-4407-9c54-9a8e8ecb06f8', CAST(N'2024-04-14T00:00:00.000' AS DateTime))
INSERT [dbo].[Output] ([Id], [DateOutput]) VALUES (N'2', CAST(N'2024-04-16T00:00:00.000' AS DateTime))
INSERT [dbo].[Output] ([Id], [DateOutput]) VALUES (N'2269b338-6059-44a9-b2bf-c53c5051cbfd', CAST(N'2024-04-17T00:00:00.000' AS DateTime))
INSERT [dbo].[Output] ([Id], [DateOutput]) VALUES (N'24fd6666-8ea4-496d-aa2f-60ffd2160786', CAST(N'2024-04-18T00:00:00.000' AS DateTime))
INSERT [dbo].[Output] ([Id], [DateOutput]) VALUES (N'2ec61ab1-c547-4d72-8846-6d53771b8761', CAST(N'2024-04-19T00:00:00.000' AS DateTime))
INSERT [dbo].[Output] ([Id], [DateOutput]) VALUES (N'3', CAST(N'2024-04-20T00:00:00.000' AS DateTime))
INSERT [dbo].[Output] ([Id], [DateOutput]) VALUES (N'30ebc23f-c498-4311-b069-b67507e07938', CAST(N'2024-04-21T00:00:00.000' AS DateTime))
INSERT [dbo].[Output] ([Id], [DateOutput]) VALUES (N'3c181704-f18e-4503-9fb6-009a44563986', CAST(N'2024-04-22T00:00:00.000' AS DateTime))
INSERT [dbo].[Output] ([Id], [DateOutput]) VALUES (N'3e0023ec-10a7-4b64-a457-4c23ff10c18c', CAST(N'2024-04-24T00:00:00.000' AS DateTime))
INSERT [dbo].[Output] ([Id], [DateOutput]) VALUES (N'4', CAST(N'2024-04-25T00:00:00.000' AS DateTime))
INSERT [dbo].[Output] ([Id], [DateOutput]) VALUES (N'45fa08e5-4a8f-44fa-8e53-b4dc6f923e8b', CAST(N'2024-04-26T00:00:00.000' AS DateTime))
INSERT [dbo].[Output] ([Id], [DateOutput]) VALUES (N'51844227-4029-400f-8b9e-e4d3bde7a4fb', CAST(N'2024-04-27T00:00:00.000' AS DateTime))
INSERT [dbo].[Output] ([Id], [DateOutput]) VALUES (N'582df260-1cb6-491c-bd6f-ddf6126cfc06', CAST(N'2024-04-28T00:00:00.000' AS DateTime))
INSERT [dbo].[Output] ([Id], [DateOutput]) VALUES (N'68d58f0e-9bad-4221-ace3-1cf14f55b092', CAST(N'2024-04-29T00:00:00.000' AS DateTime))
INSERT [dbo].[Output] ([Id], [DateOutput]) VALUES (N'703a0b8e-c71d-4629-b3b7-9de28475ac49', CAST(N'2024-04-30T00:00:00.000' AS DateTime))
INSERT [dbo].[Output] ([Id], [DateOutput]) VALUES (N'85b6e139-2628-4699-9b54-fb4e434d7571', CAST(N'2024-05-11T00:00:00.000' AS DateTime))
INSERT [dbo].[Output] ([Id], [DateOutput]) VALUES (N'8aa18561-3697-4af2-8f68-43779c3b8da7', CAST(N'2024-05-12T00:00:00.000' AS DateTime))
INSERT [dbo].[Output] ([Id], [DateOutput]) VALUES (N'8f5995a6-d4ed-46b6-9593-1c6725f5aa5f', CAST(N'2024-05-13T00:00:00.000' AS DateTime))
INSERT [dbo].[Output] ([Id], [DateOutput]) VALUES (N'943f697f-66fa-4da2-8055-ea1b702c515a', CAST(N'2024-04-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Output] ([Id], [DateOutput]) VALUES (N'adf6435e-7498-4509-9730-c9604eb0fb18', CAST(N'2024-05-14T00:00:00.000' AS DateTime))
INSERT [dbo].[Output] ([Id], [DateOutput]) VALUES (N'b2677a50-aa4b-4a80-ba17-53f3f5923352', CAST(N'2024-04-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Output] ([Id], [DateOutput]) VALUES (N'c185384d-59b0-4112-a2ef-dedeb9c43e99', CAST(N'2024-05-15T00:00:00.000' AS DateTime))
INSERT [dbo].[Output] ([Id], [DateOutput]) VALUES (N'd69ede7a-d476-4827-9ea5-2bf081cafb54', CAST(N'2024-05-16T00:00:00.000' AS DateTime))
INSERT [dbo].[Output] ([Id], [DateOutput]) VALUES (N'e72c3288-e27c-49e2-b43d-09b5897060f9', CAST(N'2024-05-17T00:00:00.000' AS DateTime))
INSERT [dbo].[Output] ([Id], [DateOutput]) VALUES (N'ed6a53f2-d51d-489b-acf6-c54dc55fae3a', CAST(N'2024-05-18T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[OutputInfo] ([Id], [IdObject], [IdOutput], [IdCustomer], [Count], [SumPrice], [Status]) VALUES (N'004a8737-4024-4bdd-a3b6-3856a528220a', N'4', N'adf6435e-7498-4509-9730-c9604eb0fb18', 2, 12, 4680000, NULL)
INSERT [dbo].[OutputInfo] ([Id], [IdObject], [IdOutput], [IdCustomer], [Count], [SumPrice], [Status]) VALUES (N'0fcfe780-06cd-43ec-bc21-9aca535b2faf', N'9', N'2ec61ab1-c547-4d72-8846-6d53771b8761', 5, 10, 5900000, NULL)
INSERT [dbo].[OutputInfo] ([Id], [IdObject], [IdOutput], [IdCustomer], [Count], [SumPrice], [Status]) VALUES (N'1', N'1', N'1', 1, 1, 390000, NULL)
INSERT [dbo].[OutputInfo] ([Id], [IdObject], [IdOutput], [IdCustomer], [Count], [SumPrice], [Status]) VALUES (N'2', N'4', N'2', 1, 10, 3900000, NULL)
INSERT [dbo].[OutputInfo] ([Id], [IdObject], [IdOutput], [IdCustomer], [Count], [SumPrice], [Status]) VALUES (N'21d276e6-b955-484a-8bde-8a4694932ad1', N'4', N'd69ede7a-d476-4827-9ea5-2bf081cafb54', 2, 1, 390000, NULL)
INSERT [dbo].[OutputInfo] ([Id], [IdObject], [IdOutput], [IdCustomer], [Count], [SumPrice], [Status]) VALUES (N'3', N'7', N'3', 2, 14, 8260000, NULL)
INSERT [dbo].[OutputInfo] ([Id], [IdObject], [IdOutput], [IdCustomer], [Count], [SumPrice], [Status]) VALUES (N'396237aa-473b-45ab-8126-5230235c7824', N'11', N'943f697f-66fa-4da2-8055-ea1b702c515a', 1, 50, 15500000, NULL)
INSERT [dbo].[OutputInfo] ([Id], [IdObject], [IdOutput], [IdCustomer], [Count], [SumPrice], [Status]) VALUES (N'3d631906-5bd6-4de7-8145-da72940097cd', N'1', N'8aa18561-3697-4af2-8f68-43779c3b8da7', 1, 2, 780000, NULL)
INSERT [dbo].[OutputInfo] ([Id], [IdObject], [IdOutput], [IdCustomer], [Count], [SumPrice], [Status]) VALUES (N'3ea7d5ce-87ec-4307-9ff1-d96233f781af', N'6', N'ed6a53f2-d51d-489b-acf6-c54dc55fae3a', 2, 12, 7080000, NULL)
INSERT [dbo].[OutputInfo] ([Id], [IdObject], [IdOutput], [IdCustomer], [Count], [SumPrice], [Status]) VALUES (N'4', N'10', N'4', 2, 10, 5900000, NULL)
INSERT [dbo].[OutputInfo] ([Id], [IdObject], [IdOutput], [IdCustomer], [Count], [SumPrice], [Status]) VALUES (N'4b92b9fb-41b4-41c0-9726-2d247c4b0551', N'8', N'b2677a50-aa4b-4a80-ba17-53f3f5923352', 1, 50, 30000000, NULL)
INSERT [dbo].[OutputInfo] ([Id], [IdObject], [IdOutput], [IdCustomer], [Count], [SumPrice], [Status]) VALUES (N'7f6a067b-f29a-4434-81ed-94c9eb924af7', N'5', N'2269b338-6059-44a9-b2bf-c53c5051cbfd', 5, 2, 1180000, NULL)
INSERT [dbo].[OutputInfo] ([Id], [IdObject], [IdOutput], [IdCustomer], [Count], [SumPrice], [Status]) VALUES (N'88d184f5-e67b-400d-bcab-872860be9ce9', N'8', N'68d58f0e-9bad-4221-ace3-1cf14f55b092', 5, 9, 5400000, NULL)
INSERT [dbo].[OutputInfo] ([Id], [IdObject], [IdOutput], [IdCustomer], [Count], [SumPrice], [Status]) VALUES (N'8bf8c7aa-bb18-4b7e-87b7-439461ac2ad9', N'4', N'85b6e139-2628-4699-9b54-fb4e434d7571', 2, 14, 5460000, NULL)
INSERT [dbo].[OutputInfo] ([Id], [IdObject], [IdOutput], [IdCustomer], [Count], [SumPrice], [Status]) VALUES (N'91ccf104-f7a8-4e4d-8c23-f82d2ee531fa', N'5', N'06cdeffb-90bf-450f-9c1c-07f062117774', 1, 2, 1180000, NULL)
INSERT [dbo].[OutputInfo] ([Id], [IdObject], [IdOutput], [IdCustomer], [Count], [SumPrice], [Status]) VALUES (N'921503c9-af5b-4988-9b5b-98d14b4cb786', N'1', N'51844227-4029-400f-8b9e-e4d3bde7a4fb', 1, 13, 5070000, NULL)
INSERT [dbo].[OutputInfo] ([Id], [IdObject], [IdOutput], [IdCustomer], [Count], [SumPrice], [Status]) VALUES (N'95478d40-ad98-45ce-ba4b-5b1fcbca5c94', N'10', N'10757a2c-9e52-4407-9c54-9a8e8ecb06f8', 2, 1, 310000, NULL)
INSERT [dbo].[OutputInfo] ([Id], [IdObject], [IdOutput], [IdCustomer], [Count], [SumPrice], [Status]) VALUES (N'acc7e680-4cb2-45b6-a3d4-05dfefc3fe88', N'2', N'703a0b8e-c71d-4629-b3b7-9de28475ac49', 2, 12, 4680000, N'123')
INSERT [dbo].[OutputInfo] ([Id], [IdObject], [IdOutput], [IdCustomer], [Count], [SumPrice], [Status]) VALUES (N'b710279b-3f55-41d7-976a-91fd3bf4adae', N'1', N'e72c3288-e27c-49e2-b43d-09b5897060f9', 1, 13, 5070000, NULL)
INSERT [dbo].[OutputInfo] ([Id], [IdObject], [IdOutput], [IdCustomer], [Count], [SumPrice], [Status]) VALUES (N'ba81780c-9ffe-4626-bcb8-bd32368b03ec', N'10', N'c185384d-59b0-4112-a2ef-dedeb9c43e99', 1, 1, 310000, NULL)
INSERT [dbo].[OutputInfo] ([Id], [IdObject], [IdOutput], [IdCustomer], [Count], [SumPrice], [Status]) VALUES (N'c4cf5909-0155-411a-bd3a-8c6512ef0308', N'1', N'3c181704-f18e-4503-9fb6-009a44563986', 1, 13, 5070000, NULL)
INSERT [dbo].[OutputInfo] ([Id], [IdObject], [IdOutput], [IdCustomer], [Count], [SumPrice], [Status]) VALUES (N'd6fb90f3-f5f3-4bd4-8f7e-03dfd47aa127', N'9', N'0177b594-a4ba-4757-b20b-f1f41776b93f', 1, 10, 5900000, NULL)
INSERT [dbo].[OutputInfo] ([Id], [IdObject], [IdOutput], [IdCustomer], [Count], [SumPrice], [Status]) VALUES (N'd82b6711-b1fc-4767-8550-869cae35fac0', N'7', N'3e0023ec-10a7-4b64-a457-4c23ff10c18c', 2, 15, 8850000, NULL)
INSERT [dbo].[OutputInfo] ([Id], [IdObject], [IdOutput], [IdCustomer], [Count], [SumPrice], [Status]) VALUES (N'ddebbcd5-e1ef-41e5-a747-546342cdef28', N'1', N'582df260-1cb6-491c-bd6f-ddf6126cfc06', 1, 1, 390000, NULL)
GO
SET IDENTITY_INSERT [dbo].[Suplier] ON 

INSERT [dbo].[Suplier] ([Id], [DisplayName], [Address], [Phone], [Email], [MoreInfo], [ContractDate]) VALUES (1, N'Morra12', N'Hồ Chí Minh', N'0123456789', N'morra@gmail.com', N'123', CAST(N'2024-04-07T00:00:00.000' AS DateTime))
INSERT [dbo].[Suplier] ([Id], [DisplayName], [Address], [Phone], [Email], [MoreInfo], [ContractDate]) VALUES (2, N'Replica', N'Nước Ngoài', N'0123456789', N'replica@gmail.com', NULL, CAST(N'2024-04-10T00:00:00.000' AS DateTime))
INSERT [dbo].[Suplier] ([Id], [DisplayName], [Address], [Phone], [Email], [MoreInfo], [ContractDate]) VALUES (3, N'NCC test', N'Hà Nội', N'0123123123', N'test@gmail.com', N'test', CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[Suplier] ([Id], [DisplayName], [Address], [Phone], [Email], [MoreInfo], [ContractDate]) VALUES (5, N'Owen ', N'Hồ Chí Minh', N'0123456789', N'morra@gmail.com', N'123', CAST(N'2024-04-07T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Suplier] OFF
GO
SET IDENTITY_INSERT [dbo].[Unit] ON 

INSERT [dbo].[Unit] ([Id], [DisplayName]) VALUES (1, N'Lọ')
INSERT [dbo].[Unit] ([Id], [DisplayName]) VALUES (2, N'Cây')
INSERT [dbo].[Unit] ([Id], [DisplayName]) VALUES (3, N'Chai')
INSERT [dbo].[Unit] ([Id], [DisplayName]) VALUES (4, N'Hộp')
SET IDENTITY_INSERT [dbo].[Unit] OFF
GO
SET IDENTITY_INSERT [dbo].[UserRole] ON 

INSERT [dbo].[UserRole] ([Id], [DisplayName]) VALUES (1, N'Admin')
INSERT [dbo].[UserRole] ([Id], [DisplayName]) VALUES (2, N'Nhân viên')
SET IDENTITY_INSERT [dbo].[UserRole] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [DisplayName], [UserName], [Password], [IdRole]) VALUES (1, N'Nguyễn Hoàng Anh', N'hoanganh', N'hoanganh', 1)
INSERT [dbo].[Users] ([Id], [DisplayName], [UserName], [Password], [IdRole]) VALUES (2, N'Staff', N'staff', N'1', 2)
INSERT [dbo].[Users] ([Id], [DisplayName], [UserName], [Password], [IdRole]) VALUES (5, N'Trần Tuấn Anh', N'ttuananh', N'tuananh', 1)
INSERT [dbo].[Users] ([Id], [DisplayName], [UserName], [Password], [IdRole]) VALUES (6, N'Phan Duy Đông', N'dong', N'dong', 1)
INSERT [dbo].[Users] ([Id], [DisplayName], [UserName], [Password], [IdRole]) VALUES (7, N'Nguyễn Mạnh Cường', N'cuong', N'cuong', 1)
INSERT [dbo].[Users] ([Id], [DisplayName], [UserName], [Password], [IdRole]) VALUES (9, N'Nguyễn Tuấn Anh', N'ntuananh', N'tuananh', 1)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[InputInfo] ADD  DEFAULT ((0)) FOR [InputPrice]
GO
ALTER TABLE [dbo].[InputInfo] ADD  DEFAULT ((0)) FOR [OutputPrice]
GO
ALTER TABLE [dbo].[InputInfo]  WITH CHECK ADD FOREIGN KEY([IdInput])
REFERENCES [dbo].[Input] ([Id])
GO
ALTER TABLE [dbo].[InputInfo]  WITH CHECK ADD FOREIGN KEY([IdInput])
REFERENCES [dbo].[Input] ([Id])
GO
ALTER TABLE [dbo].[InputInfo]  WITH CHECK ADD FOREIGN KEY([IdObject])
REFERENCES [dbo].[Object] ([Id])
GO
ALTER TABLE [dbo].[InputInfo]  WITH CHECK ADD FOREIGN KEY([IdObject])
REFERENCES [dbo].[Object] ([Id])
GO
ALTER TABLE [dbo].[Object]  WITH CHECK ADD FOREIGN KEY([IdSuplier])
REFERENCES [dbo].[Suplier] ([Id])
GO
ALTER TABLE [dbo].[Object]  WITH CHECK ADD FOREIGN KEY([IdSuplier])
REFERENCES [dbo].[Suplier] ([Id])
GO
ALTER TABLE [dbo].[Object]  WITH CHECK ADD FOREIGN KEY([IdUnit])
REFERENCES [dbo].[Unit] ([Id])
GO
ALTER TABLE [dbo].[Object]  WITH CHECK ADD FOREIGN KEY([IdUnit])
REFERENCES [dbo].[Unit] ([Id])
GO
ALTER TABLE [dbo].[OutputInfo]  WITH CHECK ADD FOREIGN KEY([IdCustomer])
REFERENCES [dbo].[Customer] ([Id])
GO
ALTER TABLE [dbo].[OutputInfo]  WITH CHECK ADD FOREIGN KEY([IdCustomer])
REFERENCES [dbo].[Customer] ([Id])
GO
ALTER TABLE [dbo].[OutputInfo]  WITH CHECK ADD FOREIGN KEY([IdObject])
REFERENCES [dbo].[Object] ([Id])
GO
ALTER TABLE [dbo].[OutputInfo]  WITH CHECK ADD FOREIGN KEY([IdObject])
REFERENCES [dbo].[Object] ([Id])
GO
ALTER TABLE [dbo].[OutputInfo]  WITH CHECK ADD FOREIGN KEY([IdOutput])
REFERENCES [dbo].[Output] ([Id])
GO
ALTER TABLE [dbo].[OutputInfo]  WITH CHECK ADD FOREIGN KEY([IdOutput])
REFERENCES [dbo].[Output] ([Id])
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD FOREIGN KEY([IdRole])
REFERENCES [dbo].[UserRole] ([Id])
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD FOREIGN KEY([IdRole])
REFERENCES [dbo].[UserRole] ([Id])
GO
USE [master]
GO
ALTER DATABASE [ProjectPRN221] SET  READ_WRITE 
GO
