/*    ==Scripting Parameters==

    Source Server Version : SQL Server 2022 (16.0.1000)
    Source Database Engine Edition : Microsoft SQL Server Enterprise Edition
    Source Database Engine Type : Standalone SQL Server

    Target Server Version : SQL Server 2022
    Target Database Engine Edition : Microsoft SQL Server Enterprise Edition
    Target Database Engine Type : Standalone SQL Server
*/
USE [master]
GO
/****** Object:  Database [GreenHouseDB]    Script Date: 17.03.2025 12:07:58 ******/
IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = N'GreenHouseDB')
BEGIN
CREATE DATABASE [GreenHouseDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'GreenHouseDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\GreenHouseDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'GreenHouseDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\GreenHouseDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 COLLATE Turkish_CI_AS
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
END
GO
ALTER DATABASE [GreenHouseDB] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [GreenHouseDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [GreenHouseDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [GreenHouseDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [GreenHouseDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [GreenHouseDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [GreenHouseDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [GreenHouseDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [GreenHouseDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [GreenHouseDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [GreenHouseDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [GreenHouseDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [GreenHouseDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [GreenHouseDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [GreenHouseDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [GreenHouseDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [GreenHouseDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [GreenHouseDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [GreenHouseDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [GreenHouseDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [GreenHouseDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [GreenHouseDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [GreenHouseDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [GreenHouseDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [GreenHouseDB] SET RECOVERY FULL 
GO
ALTER DATABASE [GreenHouseDB] SET  MULTI_USER 
GO
ALTER DATABASE [GreenHouseDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [GreenHouseDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [GreenHouseDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [GreenHouseDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [GreenHouseDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [GreenHouseDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'GreenHouseDB', N'ON'
GO
ALTER DATABASE [GreenHouseDB] SET QUERY_STORE = ON
GO
ALTER DATABASE [GreenHouseDB] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
/****** Object:  Login [NT Service\MSSQLSERVER]    Script Date: 17.03.2025 12:07:58 ******/
IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = N'NT Service\MSSQLSERVER')
CREATE LOGIN [NT Service\MSSQLSERVER] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english]
GO
/****** Object:  Login [NT SERVICE\Winmgmt]    Script Date: 17.03.2025 12:07:58 ******/
IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = N'NT SERVICE\Winmgmt')
CREATE LOGIN [NT SERVICE\Winmgmt] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english]
GO
/****** Object:  Login [NT SERVICE\SQLWriter]    Script Date: 17.03.2025 12:07:58 ******/
IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = N'NT SERVICE\SQLWriter')
CREATE LOGIN [NT SERVICE\SQLWriter] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english]
GO
/****** Object:  Login [NT SERVICE\SQLTELEMETRY]    Script Date: 17.03.2025 12:07:58 ******/
IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = N'NT SERVICE\SQLTELEMETRY')
CREATE LOGIN [NT SERVICE\SQLTELEMETRY] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english]
GO
/****** Object:  Login [NT SERVICE\SQLSERVERAGENT]    Script Date: 17.03.2025 12:07:58 ******/
IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = N'NT SERVICE\SQLSERVERAGENT')
CREATE LOGIN [NT SERVICE\SQLSERVERAGENT] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english]
GO
/****** Object:  Login [NT AUTHORITY\SYSTEM]    Script Date: 17.03.2025 12:07:58 ******/
IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = N'NT AUTHORITY\SYSTEM')
CREATE LOGIN [NT AUTHORITY\SYSTEM] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english]
GO
/****** Object:  Login [FatmaNur\fnurd]    Script Date: 17.03.2025 12:07:58 ******/
IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = N'FatmaNur\fnurd')
CREATE LOGIN [FatmaNur\fnurd] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english]
GO
/* For security reasons the login is created disabled and with a random password. */
/****** Object:  Login [##MS_PolicyTsqlExecutionLogin##]    Script Date: 17.03.2025 12:07:58 ******/
IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = N'##MS_PolicyTsqlExecutionLogin##')
CREATE LOGIN [##MS_PolicyTsqlExecutionLogin##] WITH PASSWORD=N'jRLj50Rl0wM9HFmYa4NT/SEmB61wlYJZgatEUPWqDrs=', DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english], CHECK_EXPIRATION=OFF, CHECK_POLICY=ON
GO
ALTER LOGIN [##MS_PolicyTsqlExecutionLogin##] DISABLE
GO
/* For security reasons the login is created disabled and with a random password. */
/****** Object:  Login [##MS_PolicyEventProcessingLogin##]    Script Date: 17.03.2025 12:07:58 ******/
IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = N'##MS_PolicyEventProcessingLogin##')
CREATE LOGIN [##MS_PolicyEventProcessingLogin##] WITH PASSWORD=N'BHXqUeBCmvQyBi/q3rdw8KlnHN8IR2fbBfuZGKf5ztc=', DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english], CHECK_EXPIRATION=OFF, CHECK_POLICY=ON
GO
ALTER LOGIN [##MS_PolicyEventProcessingLogin##] DISABLE
GO
ALTER AUTHORIZATION ON DATABASE::[GreenHouseDB] TO [FatmaNur\fnurd]
GO
ALTER SERVER ROLE [sysadmin] ADD MEMBER [NT Service\MSSQLSERVER]
GO
ALTER SERVER ROLE [sysadmin] ADD MEMBER [NT SERVICE\Winmgmt]
GO
ALTER SERVER ROLE [sysadmin] ADD MEMBER [NT SERVICE\SQLWriter]
GO
ALTER SERVER ROLE [sysadmin] ADD MEMBER [NT SERVICE\SQLSERVERAGENT]
GO
ALTER SERVER ROLE [sysadmin] ADD MEMBER [FatmaNur\fnurd]
GO
USE [GreenHouseDB]
GO
GRANT VIEW ANY COLUMN ENCRYPTION KEY DEFINITION TO [public] AS [dbo]
GO
GRANT VIEW ANY COLUMN MASTER KEY DEFINITION TO [public] AS [dbo]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 17.03.2025 12:07:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[__EFMigrationsHistory]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) COLLATE Turkish_CI_AS NOT NULL,
	[ProductVersion] [nvarchar](32) COLLATE Turkish_CI_AS NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
ALTER AUTHORIZATION ON [dbo].[__EFMigrationsHistory] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[FavoriListeDetaylari]    Script Date: 17.03.2025 12:07:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FavoriListeDetaylari]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[FavoriListeDetaylari](
	[FavoriListeDetayId] [int] IDENTITY(1,1) NOT NULL,
	[FavoriListesiId] [int] NOT NULL,
	[UrunId] [int] NULL,
 CONSTRAINT [PK_FavoriListeDetaylari] PRIMARY KEY CLUSTERED 
(
	[FavoriListeDetayId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
ALTER AUTHORIZATION ON [dbo].[FavoriListeDetaylari] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[FavoriListeleri]    Script Date: 17.03.2025 12:07:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FavoriListeleri]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[FavoriListeleri](
	[FavoriListesiId] [int] IDENTITY(1,1) NOT NULL,
	[ListeAdi] [nvarchar](max) COLLATE Turkish_CI_AS NOT NULL,
	[UyeId] [int] NOT NULL,
 CONSTRAINT [PK_FavoriListeleri] PRIMARY KEY CLUSTERED 
(
	[FavoriListesiId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
ALTER AUTHORIZATION ON [dbo].[FavoriListeleri] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[Icerikler]    Script Date: 17.03.2025 12:07:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Icerikler]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Icerikler](
	[IcerikId] [int] IDENTITY(1,1) NOT NULL,
	[IcerikAdi] [nvarchar](255) COLLATE Turkish_CI_AS NOT NULL,
	[IcerikBilgi] [nvarchar](max) COLLATE Turkish_CI_AS NULL,
	[RiskDurumuId] [int] NOT NULL,
 CONSTRAINT [PK_Icerikler] PRIMARY KEY CLUSTERED 
(
	[IcerikId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
ALTER AUTHORIZATION ON [dbo].[Icerikler] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[KaraListeler]    Script Date: 17.03.2025 12:07:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[KaraListeler]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[KaraListeler](
	[KaraListeId] [int] IDENTITY(1,1) NOT NULL,
	[UyeId] [int] NOT NULL,
	[IcerikId] [int] NOT NULL,
 CONSTRAINT [PK_KaraListeler] PRIMARY KEY CLUSTERED 
(
	[KaraListeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
ALTER AUTHORIZATION ON [dbo].[KaraListeler] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[Kategoriler]    Script Date: 17.03.2025 12:07:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Kategoriler]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Kategoriler](
	[KategoriId] [int] IDENTITY(1,1) NOT NULL,
	[KategoriAdi] [nvarchar](max) COLLATE Turkish_CI_AS NOT NULL,
	[UstKategoriId] [int] NULL,
 CONSTRAINT [PK_Kategoriler] PRIMARY KEY CLUSTERED 
(
	[KategoriId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
ALTER AUTHORIZATION ON [dbo].[Kategoriler] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[RiskDurumlari]    Script Date: 17.03.2025 12:07:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RiskDurumlari]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[RiskDurumlari](
	[RiskDurumuId] [int] IDENTITY(1,1) NOT NULL,
	[RiskSeviyesi] [nvarchar](max) COLLATE Turkish_CI_AS NOT NULL,
 CONSTRAINT [PK_RiskDurumlari] PRIMARY KEY CLUSTERED 
(
	[RiskDurumuId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
ALTER AUTHORIZATION ON [dbo].[RiskDurumlari] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[Ureticiler]    Script Date: 17.03.2025 12:07:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Ureticiler]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Ureticiler](
	[UreticiId] [int] IDENTITY(1,1) NOT NULL,
	[UreticiAdi] [nvarchar](max) COLLATE Turkish_CI_AS NOT NULL,
 CONSTRAINT [PK_Ureticiler] PRIMARY KEY CLUSTERED 
(
	[UreticiId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
ALTER AUTHORIZATION ON [dbo].[Ureticiler] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[UrunIcerikler]    Script Date: 17.03.2025 12:07:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UrunIcerikler]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[UrunIcerikler](
	[UrunIcerikId] [int] IDENTITY(1,1) NOT NULL,
	[UrunId] [int] NOT NULL,
	[IcerikId] [int] NOT NULL,
 CONSTRAINT [PK_UrunIcerikler] PRIMARY KEY CLUSTERED 
(
	[UrunId] ASC,
	[IcerikId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
ALTER AUTHORIZATION ON [dbo].[UrunIcerikler] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[Urunler]    Script Date: 17.03.2025 12:07:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Urunler]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Urunler](
	[UrunId] [int] IDENTITY(1,1) NOT NULL,
	[UrunAdi] [nvarchar](max) COLLATE Turkish_CI_AS NOT NULL,
	[KategoriId] [int] NOT NULL,
	[UreticiId] [int] NOT NULL,
	[UyeId] [int] NOT NULL,
	[OlusturanKisi] [int] NOT NULL,
	[OlusturmaTarihi] [datetime2](7) NOT NULL,
	[RiskDurumuId] [int] NULL,
 CONSTRAINT [PK_Urunler] PRIMARY KEY CLUSTERED 
(
	[UrunId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
ALTER AUTHORIZATION ON [dbo].[Urunler] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[Uyeler]    Script Date: 17.03.2025 12:07:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Uyeler]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Uyeler](
	[UyeId] [int] IDENTITY(1,1) NOT NULL,
	[UyeAdi] [nvarchar](max) COLLATE Turkish_CI_AS NOT NULL,
	[UyeSoyadi] [nvarchar](max) COLLATE Turkish_CI_AS NOT NULL,
	[MailAdresi] [nvarchar](max) COLLATE Turkish_CI_AS NOT NULL,
	[UyelikTarihi] [datetime2](7) NOT NULL,
	[UyeSifre] [nvarchar](max) COLLATE Turkish_CI_AS NOT NULL,
	[OlusturmaTarihi] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Uyeler] PRIMARY KEY CLUSTERED 
(
	[UyeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
ALTER AUTHORIZATION ON [dbo].[Uyeler] TO  SCHEMA OWNER 
GO
SET IDENTITY_INSERT [dbo].[FavoriListeleri] ON 

INSERT [dbo].[FavoriListeleri] ([FavoriListesiId], [ListeAdi], [UyeId]) VALUES (1, N'Favorilerim', 1)
SET IDENTITY_INSERT [dbo].[FavoriListeleri] OFF
GO
SET IDENTITY_INSERT [dbo].[Icerikler] ON 

INSERT [dbo].[Icerikler] ([IcerikId], [IcerikAdi], [IcerikBilgi], [RiskDurumuId]) VALUES (2, N'Sodyum loril sülfat (SLS)', N'Gözü zedeler, cildi tahriş eder, depresyona ve solunum problemlerine yol açar. Saç dökülmesine, karaciğer-kalp-beyinde hasara, hayvanlarda ise ölüme sebep verir. Egzama, ağız ülseri, mide ve bağırsak kanamalarına yol açtığı gözlemlenmiştir.', 4)
INSERT [dbo].[Icerikler] ([IcerikId], [IcerikAdi], [IcerikBilgi], [RiskDurumuId]) VALUES (3, N'ProVitamin B5', N'B5 vitamini tabiatta çok fazla bulunabilir ve normal bir beslenme düzeni olan kişilerde eksikliği görülmeyebilir. B5 vitamini en çok yulaf ve tahıl ürünlerinde, süt ve yumurtada, kümes hayvanlarında, deniz ürünlerinde, mantar, patates gibi sebzelerde, nohut ve pirinç gibi bakliyatlarda bulunabilir. Eksikliği, cilt problemlerine sebebiyet verebilir.', 1)
INSERT [dbo].[Icerikler] ([IcerikId], [IcerikAdi], [IcerikBilgi], [RiskDurumuId]) VALUES (4, N'Formaldehit', N'Kimya endüstrisinde bir hayli yaygın olarak kullanılmaktadır. Yaygın bir üretime sahip olan bu Formaldehit maddesi zehirli bir kimyasal olma özelliğine sahiptir. Son derece kötü kokulu ve renksizdir. Formaldehit maddesi sulu bir çözelti halinde kullanılır. Söz konusu maddenin bu hali de formalin olarak adlandırılmaktadır.', 4)
INSERT [dbo].[Icerikler] ([IcerikId], [IcerikAdi], [IcerikBilgi], [RiskDurumuId]) VALUES (5, N'Paraben', N'Parabenler hem zehirli hem de toksik özellik taşırlar.

Parabenler cildi hassaslaştırabilir, alerjik reaksiyonlara neden olabilir. Deride egzama gibi deri hastalıklarına, tahriş ve alerjik tepkimelere neden olurlar.', 3)
INSERT [dbo].[Icerikler] ([IcerikId], [IcerikAdi], [IcerikBilgi], [RiskDurumuId]) VALUES (6, N'Cocamidoproply Betaine', N'Cocamidoproply Betaine', 2)
INSERT [dbo].[Icerikler] ([IcerikId], [IcerikAdi], [IcerikBilgi], [RiskDurumuId]) VALUES (7, N'BHT', N'BHA ve BHT özellikle katı ve sıvı yağlar ile hububat ürünlerinde kullanılır. Duyarlı kişilerde kurdeşene sebep olurlar; bununla birlikte gerçek alerjik reaksiyon çok nadirdir.', 4)
INSERT [dbo].[Icerikler] ([IcerikId], [IcerikAdi], [IcerikBilgi], [RiskDurumuId]) VALUES (8, N'Amonyak', N'Solunan amonyağın konsantrasyonuna bağlı olarak baş ağrısı, yanma hissi ve baygınlık gibi sağlık problemleri meydana gelebileceği gibi vücutta ödem oluşumlarına da neden olabilmektedir. Hoş olmayan bir kokuya sahip olan amonyağı, çok fazla solumak ölüme bile yol açabilmektedir.', 3)
INSERT [dbo].[Icerikler] ([IcerikId], [IcerikAdi], [IcerikBilgi], [RiskDurumuId]) VALUES (9, N'
Sodyum Benzoat', N'Sodyum benzoat maddesinin gıdalar da fazla kullanılması kişiler de ciddi sağlık sorunlarına yol açabilir. Verilen ölçünün üzerinde alınan bu madde kişiler de zamanla obezite gibi sorunlara yol açabilir ve ilerleyen günler de ciddi olumsuzluklara neden olabilir.', 2)
INSERT [dbo].[Icerikler] ([IcerikId], [IcerikAdi], [IcerikBilgi], [RiskDurumuId]) VALUES (10, N'Perfume', N'Cilde büyük zarar veriyor. Burun tıkanıklığı ,Hapşırma, Karın ağrısı, Öksürük, Astım, Ciltte kızarma, Cilt yanması', 3)
INSERT [dbo].[Icerikler] ([IcerikId], [IcerikAdi], [IcerikBilgi], [RiskDurumuId]) VALUES (12, N'Aqua', N'Su', 1)
INSERT [dbo].[Icerikler] ([IcerikId], [IcerikAdi], [IcerikBilgi], [RiskDurumuId]) VALUES (13, N'Kalsiyum Karbonat', N'Kalsiyum karbonat gıda takviyesi olarak kullanılır. Antiasit, fosfat bağlayıcı veya tıbbi tabletler için baz malzeme olarak kullanılmaktadır. Kalsiyum mineralinin referans günlük alım miktarı 800 mg’dır. Takviye olarak kalsiyum karbonat kullanacaksanız doktorunuzun tavsiye ettiği miktarlarda ya da ürün üzerindeki kullanım talimatlarında belirtilen şekilde kalsiyum karbonat tüketmeniz gerekir.', 2)
SET IDENTITY_INSERT [dbo].[Icerikler] OFF
GO
SET IDENTITY_INSERT [dbo].[Kategoriler] ON 

INSERT [dbo].[Kategoriler] ([KategoriId], [KategoriAdi], [UstKategoriId]) VALUES (1, N'Kişisel Bakım', 1)
INSERT [dbo].[Kategoriler] ([KategoriId], [KategoriAdi], [UstKategoriId]) VALUES (2, N'Makyaj Malzemeleri', 1)
INSERT [dbo].[Kategoriler] ([KategoriId], [KategoriAdi], [UstKategoriId]) VALUES (3, N'Kişisel Hijyen Malzemeleri', 1)
INSERT [dbo].[Kategoriler] ([KategoriId], [KategoriAdi], [UstKategoriId]) VALUES (4, N'Temizlik Malzemeleri', 4)
INSERT [dbo].[Kategoriler] ([KategoriId], [KategoriAdi], [UstKategoriId]) VALUES (5, N'Mutfak Temizlik Malzemeleri', 4)
INSERT [dbo].[Kategoriler] ([KategoriId], [KategoriAdi], [UstKategoriId]) VALUES (6, N'Banyo Temizlik Malzemeleri', 4)
SET IDENTITY_INSERT [dbo].[Kategoriler] OFF
GO
SET IDENTITY_INSERT [dbo].[RiskDurumlari] ON 

INSERT [dbo].[RiskDurumlari] ([RiskDurumuId], [RiskSeviyesi]) VALUES (1, N'Temiz')
INSERT [dbo].[RiskDurumlari] ([RiskDurumuId], [RiskSeviyesi]) VALUES (2, N'Az Riskli')
INSERT [dbo].[RiskDurumlari] ([RiskDurumuId], [RiskSeviyesi]) VALUES (3, N'Orta Riskli')
INSERT [dbo].[RiskDurumlari] ([RiskDurumuId], [RiskSeviyesi]) VALUES (4, N'Çok Riskli')
SET IDENTITY_INSERT [dbo].[RiskDurumlari] OFF
GO
SET IDENTITY_INSERT [dbo].[Ureticiler] ON 

INSERT [dbo].[Ureticiler] ([UreticiId], [UreticiAdi]) VALUES (1, N'Kopaş Kozmetik')
INSERT [dbo].[Ureticiler] ([UreticiId], [UreticiAdi]) VALUES (2, N'Unilever')
INSERT [dbo].[Ureticiler] ([UreticiId], [UreticiAdi]) VALUES (3, N'Loreal Paris')
INSERT [dbo].[Ureticiler] ([UreticiId], [UreticiAdi]) VALUES (4, N'Flormar')
INSERT [dbo].[Ureticiler] ([UreticiId], [UreticiAdi]) VALUES (5, N'Sun Products ')
SET IDENTITY_INSERT [dbo].[Ureticiler] OFF
GO
SET IDENTITY_INSERT [dbo].[UrunIcerikler] ON 

INSERT [dbo].[UrunIcerikler] ([UrunIcerikId], [UrunId], [IcerikId]) VALUES (1, 1, 2)
INSERT [dbo].[UrunIcerikler] ([UrunIcerikId], [UrunId], [IcerikId]) VALUES (2, 1, 3)
INSERT [dbo].[UrunIcerikler] ([UrunIcerikId], [UrunId], [IcerikId]) VALUES (3, 1, 4)
INSERT [dbo].[UrunIcerikler] ([UrunIcerikId], [UrunId], [IcerikId]) VALUES (4, 1, 5)
INSERT [dbo].[UrunIcerikler] ([UrunIcerikId], [UrunId], [IcerikId]) VALUES (5, 1, 6)
INSERT [dbo].[UrunIcerikler] ([UrunIcerikId], [UrunId], [IcerikId]) VALUES (6, 1, 7)
INSERT [dbo].[UrunIcerikler] ([UrunIcerikId], [UrunId], [IcerikId]) VALUES (7, 1, 8)
INSERT [dbo].[UrunIcerikler] ([UrunIcerikId], [UrunId], [IcerikId]) VALUES (8, 1, 9)
INSERT [dbo].[UrunIcerikler] ([UrunIcerikId], [UrunId], [IcerikId]) VALUES (9, 1, 10)
INSERT [dbo].[UrunIcerikler] ([UrunIcerikId], [UrunId], [IcerikId]) VALUES (10, 1, 12)
INSERT [dbo].[UrunIcerikler] ([UrunIcerikId], [UrunId], [IcerikId]) VALUES (1041, 1005, 2)
INSERT [dbo].[UrunIcerikler] ([UrunIcerikId], [UrunId], [IcerikId]) VALUES (1042, 1005, 3)
INSERT [dbo].[UrunIcerikler] ([UrunIcerikId], [UrunId], [IcerikId]) VALUES (1043, 1005, 4)
INSERT [dbo].[UrunIcerikler] ([UrunIcerikId], [UrunId], [IcerikId]) VALUES (1044, 1005, 5)
INSERT [dbo].[UrunIcerikler] ([UrunIcerikId], [UrunId], [IcerikId]) VALUES (1045, 1005, 6)
INSERT [dbo].[UrunIcerikler] ([UrunIcerikId], [UrunId], [IcerikId]) VALUES (1046, 1005, 7)
INSERT [dbo].[UrunIcerikler] ([UrunIcerikId], [UrunId], [IcerikId]) VALUES (1047, 1005, 9)
INSERT [dbo].[UrunIcerikler] ([UrunIcerikId], [UrunId], [IcerikId]) VALUES (1048, 1005, 10)
INSERT [dbo].[UrunIcerikler] ([UrunIcerikId], [UrunId], [IcerikId]) VALUES (1049, 1005, 12)
INSERT [dbo].[UrunIcerikler] ([UrunIcerikId], [UrunId], [IcerikId]) VALUES (1050, 1005, 13)
SET IDENTITY_INSERT [dbo].[UrunIcerikler] OFF
GO
SET IDENTITY_INSERT [dbo].[Urunler] ON 

INSERT [dbo].[Urunler] ([UrunId], [UrunAdi], [KategoriId], [UreticiId], [UyeId], [OlusturanKisi], [OlusturmaTarihi], [RiskDurumuId]) VALUES (1, N'Dalin Şampuan', 3, 1, 1, 0, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 1)
INSERT [dbo].[Urunler] ([UrunId], [UrunAdi], [KategoriId], [UreticiId], [UyeId], [OlusturanKisi], [OlusturmaTarihi], [RiskDurumuId]) VALUES (1005, N'Cif', 4, 2, 1, 0, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 1)
SET IDENTITY_INSERT [dbo].[Urunler] OFF
GO
SET IDENTITY_INSERT [dbo].[Uyeler] ON 

INSERT [dbo].[Uyeler] ([UyeId], [UyeAdi], [UyeSoyadi], [MailAdresi], [UyelikTarihi], [UyeSifre], [OlusturmaTarihi]) VALUES (1, N'Nur', N'Demir', N'ndemir@gmail.com', CAST(N'2025-03-14T16:09:42.5641679' AS DateTime2), N'123456', CAST(N'2025-03-14T16:09:42.5652159' AS DateTime2))
INSERT [dbo].[Uyeler] ([UyeId], [UyeAdi], [UyeSoyadi], [MailAdresi], [UyelikTarihi], [UyeSifre], [OlusturmaTarihi]) VALUES (3, N'Fatma', N'Demir', N'fdemir@gmail.com', CAST(N'2025-03-17T01:57:19.1884875' AS DateTime2), N'123456', CAST(N'2025-03-17T01:57:19.1892694' AS DateTime2))
SET IDENTITY_INSERT [dbo].[Uyeler] OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_RiskDurumu]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Urunler] ADD  CONSTRAINT [DF_RiskDurumu]  DEFAULT ((1)) FOR [RiskDurumuId]
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_FavoriListeDetaylari_FavoriListeleri]') AND parent_object_id = OBJECT_ID(N'[dbo].[FavoriListeDetaylari]'))
ALTER TABLE [dbo].[FavoriListeDetaylari]  WITH CHECK ADD  CONSTRAINT [FK_FavoriListeDetaylari_FavoriListeleri] FOREIGN KEY([FavoriListesiId])
REFERENCES [dbo].[FavoriListeleri] ([FavoriListesiId])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_FavoriListeDetaylari_FavoriListeleri]') AND parent_object_id = OBJECT_ID(N'[dbo].[FavoriListeDetaylari]'))
ALTER TABLE [dbo].[FavoriListeDetaylari] CHECK CONSTRAINT [FK_FavoriListeDetaylari_FavoriListeleri]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_FavoriListeDetaylari_Urun]') AND parent_object_id = OBJECT_ID(N'[dbo].[FavoriListeDetaylari]'))
ALTER TABLE [dbo].[FavoriListeDetaylari]  WITH CHECK ADD  CONSTRAINT [FK_FavoriListeDetaylari_Urun] FOREIGN KEY([UrunId])
REFERENCES [dbo].[Urunler] ([UrunId])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_FavoriListeDetaylari_Urun]') AND parent_object_id = OBJECT_ID(N'[dbo].[FavoriListeDetaylari]'))
ALTER TABLE [dbo].[FavoriListeDetaylari] CHECK CONSTRAINT [FK_FavoriListeDetaylari_Urun]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_FavoriListeleri_Uyeler_UyeId]') AND parent_object_id = OBJECT_ID(N'[dbo].[FavoriListeleri]'))
ALTER TABLE [dbo].[FavoriListeleri]  WITH CHECK ADD  CONSTRAINT [FK_FavoriListeleri_Uyeler_UyeId] FOREIGN KEY([UyeId])
REFERENCES [dbo].[Uyeler] ([UyeId])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_FavoriListeleri_Uyeler_UyeId]') AND parent_object_id = OBJECT_ID(N'[dbo].[FavoriListeleri]'))
ALTER TABLE [dbo].[FavoriListeleri] CHECK CONSTRAINT [FK_FavoriListeleri_Uyeler_UyeId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Icerikler_RiskDurumlari]') AND parent_object_id = OBJECT_ID(N'[dbo].[Icerikler]'))
ALTER TABLE [dbo].[Icerikler]  WITH CHECK ADD  CONSTRAINT [FK_Icerikler_RiskDurumlari] FOREIGN KEY([RiskDurumuId])
REFERENCES [dbo].[RiskDurumlari] ([RiskDurumuId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Icerikler_RiskDurumlari]') AND parent_object_id = OBJECT_ID(N'[dbo].[Icerikler]'))
ALTER TABLE [dbo].[Icerikler] CHECK CONSTRAINT [FK_Icerikler_RiskDurumlari]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Icerikler_RiskDurumlari_RiskDurumuId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Icerikler]'))
ALTER TABLE [dbo].[Icerikler]  WITH CHECK ADD  CONSTRAINT [FK_Icerikler_RiskDurumlari_RiskDurumuId] FOREIGN KEY([RiskDurumuId])
REFERENCES [dbo].[RiskDurumlari] ([RiskDurumuId])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Icerikler_RiskDurumlari_RiskDurumuId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Icerikler]'))
ALTER TABLE [dbo].[Icerikler] CHECK CONSTRAINT [FK_Icerikler_RiskDurumlari_RiskDurumuId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_KaraListeler_Icerikler]') AND parent_object_id = OBJECT_ID(N'[dbo].[KaraListeler]'))
ALTER TABLE [dbo].[KaraListeler]  WITH CHECK ADD  CONSTRAINT [FK_KaraListeler_Icerikler] FOREIGN KEY([IcerikId])
REFERENCES [dbo].[Icerikler] ([IcerikId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_KaraListeler_Icerikler]') AND parent_object_id = OBJECT_ID(N'[dbo].[KaraListeler]'))
ALTER TABLE [dbo].[KaraListeler] CHECK CONSTRAINT [FK_KaraListeler_Icerikler]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_KaraListeler_Icerikler_IcerikId]') AND parent_object_id = OBJECT_ID(N'[dbo].[KaraListeler]'))
ALTER TABLE [dbo].[KaraListeler]  WITH CHECK ADD  CONSTRAINT [FK_KaraListeler_Icerikler_IcerikId] FOREIGN KEY([IcerikId])
REFERENCES [dbo].[Icerikler] ([IcerikId])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_KaraListeler_Icerikler_IcerikId]') AND parent_object_id = OBJECT_ID(N'[dbo].[KaraListeler]'))
ALTER TABLE [dbo].[KaraListeler] CHECK CONSTRAINT [FK_KaraListeler_Icerikler_IcerikId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_KaraListeler_Uyeler_UyeId]') AND parent_object_id = OBJECT_ID(N'[dbo].[KaraListeler]'))
ALTER TABLE [dbo].[KaraListeler]  WITH CHECK ADD  CONSTRAINT [FK_KaraListeler_Uyeler_UyeId] FOREIGN KEY([UyeId])
REFERENCES [dbo].[Uyeler] ([UyeId])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_KaraListeler_Uyeler_UyeId]') AND parent_object_id = OBJECT_ID(N'[dbo].[KaraListeler]'))
ALTER TABLE [dbo].[KaraListeler] CHECK CONSTRAINT [FK_KaraListeler_Uyeler_UyeId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Kategoriler_Kategoriler_UstKategoriId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Kategoriler]'))
ALTER TABLE [dbo].[Kategoriler]  WITH CHECK ADD  CONSTRAINT [FK_Kategoriler_Kategoriler_UstKategoriId] FOREIGN KEY([UstKategoriId])
REFERENCES [dbo].[Kategoriler] ([KategoriId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Kategoriler_Kategoriler_UstKategoriId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Kategoriler]'))
ALTER TABLE [dbo].[Kategoriler] CHECK CONSTRAINT [FK_Kategoriler_Kategoriler_UstKategoriId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UrunIcerikler_Icerik]') AND parent_object_id = OBJECT_ID(N'[dbo].[UrunIcerikler]'))
ALTER TABLE [dbo].[UrunIcerikler]  WITH CHECK ADD  CONSTRAINT [FK_UrunIcerikler_Icerik] FOREIGN KEY([IcerikId])
REFERENCES [dbo].[Icerikler] ([IcerikId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UrunIcerikler_Icerik]') AND parent_object_id = OBJECT_ID(N'[dbo].[UrunIcerikler]'))
ALTER TABLE [dbo].[UrunIcerikler] CHECK CONSTRAINT [FK_UrunIcerikler_Icerik]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UrunIcerikler_Icerikler]') AND parent_object_id = OBJECT_ID(N'[dbo].[UrunIcerikler]'))
ALTER TABLE [dbo].[UrunIcerikler]  WITH CHECK ADD  CONSTRAINT [FK_UrunIcerikler_Icerikler] FOREIGN KEY([IcerikId])
REFERENCES [dbo].[Icerikler] ([IcerikId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UrunIcerikler_Icerikler]') AND parent_object_id = OBJECT_ID(N'[dbo].[UrunIcerikler]'))
ALTER TABLE [dbo].[UrunIcerikler] CHECK CONSTRAINT [FK_UrunIcerikler_Icerikler]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UrunIcerikler_Icerikler_IcerikId]') AND parent_object_id = OBJECT_ID(N'[dbo].[UrunIcerikler]'))
ALTER TABLE [dbo].[UrunIcerikler]  WITH CHECK ADD  CONSTRAINT [FK_UrunIcerikler_Icerikler_IcerikId] FOREIGN KEY([IcerikId])
REFERENCES [dbo].[Icerikler] ([IcerikId])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UrunIcerikler_Icerikler_IcerikId]') AND parent_object_id = OBJECT_ID(N'[dbo].[UrunIcerikler]'))
ALTER TABLE [dbo].[UrunIcerikler] CHECK CONSTRAINT [FK_UrunIcerikler_Icerikler_IcerikId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UrunIcerikler_Urun]') AND parent_object_id = OBJECT_ID(N'[dbo].[UrunIcerikler]'))
ALTER TABLE [dbo].[UrunIcerikler]  WITH CHECK ADD  CONSTRAINT [FK_UrunIcerikler_Urun] FOREIGN KEY([UrunId])
REFERENCES [dbo].[Urunler] ([UrunId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UrunIcerikler_Urun]') AND parent_object_id = OBJECT_ID(N'[dbo].[UrunIcerikler]'))
ALTER TABLE [dbo].[UrunIcerikler] CHECK CONSTRAINT [FK_UrunIcerikler_Urun]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UrunIcerikler_Urunler]') AND parent_object_id = OBJECT_ID(N'[dbo].[UrunIcerikler]'))
ALTER TABLE [dbo].[UrunIcerikler]  WITH CHECK ADD  CONSTRAINT [FK_UrunIcerikler_Urunler] FOREIGN KEY([UrunId])
REFERENCES [dbo].[Urunler] ([UrunId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UrunIcerikler_Urunler]') AND parent_object_id = OBJECT_ID(N'[dbo].[UrunIcerikler]'))
ALTER TABLE [dbo].[UrunIcerikler] CHECK CONSTRAINT [FK_UrunIcerikler_Urunler]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UrunIcerikler_Urunler_UrunId]') AND parent_object_id = OBJECT_ID(N'[dbo].[UrunIcerikler]'))
ALTER TABLE [dbo].[UrunIcerikler]  WITH CHECK ADD  CONSTRAINT [FK_UrunIcerikler_Urunler_UrunId] FOREIGN KEY([UrunId])
REFERENCES [dbo].[Urunler] ([UrunId])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UrunIcerikler_Urunler_UrunId]') AND parent_object_id = OBJECT_ID(N'[dbo].[UrunIcerikler]'))
ALTER TABLE [dbo].[UrunIcerikler] CHECK CONSTRAINT [FK_UrunIcerikler_Urunler_UrunId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Urunler_Kategoriler]') AND parent_object_id = OBJECT_ID(N'[dbo].[Urunler]'))
ALTER TABLE [dbo].[Urunler]  WITH CHECK ADD  CONSTRAINT [FK_Urunler_Kategoriler] FOREIGN KEY([KategoriId])
REFERENCES [dbo].[Kategoriler] ([KategoriId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Urunler_Kategoriler]') AND parent_object_id = OBJECT_ID(N'[dbo].[Urunler]'))
ALTER TABLE [dbo].[Urunler] CHECK CONSTRAINT [FK_Urunler_Kategoriler]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Urunler_Kategoriler_KategoriId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Urunler]'))
ALTER TABLE [dbo].[Urunler]  WITH CHECK ADD  CONSTRAINT [FK_Urunler_Kategoriler_KategoriId] FOREIGN KEY([KategoriId])
REFERENCES [dbo].[Kategoriler] ([KategoriId])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Urunler_Kategoriler_KategoriId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Urunler]'))
ALTER TABLE [dbo].[Urunler] CHECK CONSTRAINT [FK_Urunler_Kategoriler_KategoriId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Urunler_RiskDurumlari]') AND parent_object_id = OBJECT_ID(N'[dbo].[Urunler]'))
ALTER TABLE [dbo].[Urunler]  WITH CHECK ADD  CONSTRAINT [FK_Urunler_RiskDurumlari] FOREIGN KEY([RiskDurumuId])
REFERENCES [dbo].[RiskDurumlari] ([RiskDurumuId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Urunler_RiskDurumlari]') AND parent_object_id = OBJECT_ID(N'[dbo].[Urunler]'))
ALTER TABLE [dbo].[Urunler] CHECK CONSTRAINT [FK_Urunler_RiskDurumlari]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Urunler_Ureticiler]') AND parent_object_id = OBJECT_ID(N'[dbo].[Urunler]'))
ALTER TABLE [dbo].[Urunler]  WITH CHECK ADD  CONSTRAINT [FK_Urunler_Ureticiler] FOREIGN KEY([UreticiId])
REFERENCES [dbo].[Ureticiler] ([UreticiId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Urunler_Ureticiler]') AND parent_object_id = OBJECT_ID(N'[dbo].[Urunler]'))
ALTER TABLE [dbo].[Urunler] CHECK CONSTRAINT [FK_Urunler_Ureticiler]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Urunler_Ureticiler_UreticiId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Urunler]'))
ALTER TABLE [dbo].[Urunler]  WITH CHECK ADD  CONSTRAINT [FK_Urunler_Ureticiler_UreticiId] FOREIGN KEY([UreticiId])
REFERENCES [dbo].[Ureticiler] ([UreticiId])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Urunler_Ureticiler_UreticiId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Urunler]'))
ALTER TABLE [dbo].[Urunler] CHECK CONSTRAINT [FK_Urunler_Ureticiler_UreticiId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Urunler_Uyeler_UyeId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Urunler]'))
ALTER TABLE [dbo].[Urunler]  WITH CHECK ADD  CONSTRAINT [FK_Urunler_Uyeler_UyeId] FOREIGN KEY([UyeId])
REFERENCES [dbo].[Uyeler] ([UyeId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Urunler_Uyeler_UyeId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Urunler]'))
ALTER TABLE [dbo].[Urunler] CHECK CONSTRAINT [FK_Urunler_Uyeler_UyeId]
GO
USE [master]
GO
ALTER DATABASE [GreenHouseDB] SET  READ_WRITE 
GO
