USE [master]
GO
/****** Object:  Database [HotelZaPseDB]    Script Date: 31-Mar-21 07:46:39 PM ******/
CREATE DATABASE [HotelZaPseDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'HotelZaPseDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\HotelZaPseDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'HotelZaPseDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\HotelZaPseDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [HotelZaPseDB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [HotelZaPseDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [HotelZaPseDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [HotelZaPseDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [HotelZaPseDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [HotelZaPseDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [HotelZaPseDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [HotelZaPseDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [HotelZaPseDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [HotelZaPseDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [HotelZaPseDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [HotelZaPseDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [HotelZaPseDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [HotelZaPseDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [HotelZaPseDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [HotelZaPseDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [HotelZaPseDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [HotelZaPseDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [HotelZaPseDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [HotelZaPseDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [HotelZaPseDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [HotelZaPseDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [HotelZaPseDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [HotelZaPseDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [HotelZaPseDB] SET RECOVERY FULL 
GO
ALTER DATABASE [HotelZaPseDB] SET  MULTI_USER 
GO
ALTER DATABASE [HotelZaPseDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [HotelZaPseDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [HotelZaPseDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [HotelZaPseDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [HotelZaPseDB] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'HotelZaPseDB', N'ON'
GO
ALTER DATABASE [HotelZaPseDB] SET QUERY_STORE = OFF
GO
USE [HotelZaPseDB]
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 31-Mar-21 07:46:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admin](
	[adminID] [int] IDENTITY(1,1) NOT NULL,
	[ime] [nvarchar](50) NOT NULL,
	[prezime] [nvarchar](50) NOT NULL,
	[mail] [nvarchar](50) NOT NULL,
	[lozinka] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Admin] PRIMARY KEY CLUSTERED 
(
	[adminID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pas]    Script Date: 31-Mar-21 07:46:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pas](
	[pasID] [int] NOT NULL,
	[vlasnikID] [int] NOT NULL,
	[imePsa] [nvarchar](50) NOT NULL,
	[rasa] [nvarchar](50) NOT NULL,
	[pol] [bit] NOT NULL,
	[sterilisan] [bit] NOT NULL,
	[opis] [nvarchar](500) NULL,
	[obrisan] [bit] NOT NULL,
 CONSTRAINT [PK_Pas] PRIMARY KEY CLUSTERED 
(
	[pasID] ASC,
	[vlasnikID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rezervacija]    Script Date: 31-Mar-21 07:46:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rezervacija](
	[rezervacijaID] [int] IDENTITY(1,1) NOT NULL,
	[datumPrijavljivanja] [date] NOT NULL,
	[datumOdjavljivanja] [date] NOT NULL,
	[napomena] [nvarchar](500) NULL,
	[cena] [float] NOT NULL,
	[uslugaID] [int] NOT NULL,
	[vlasnikID] [int] NOT NULL,
	[pasID] [int] NOT NULL,
 CONSTRAINT [PK_Rezervacija] PRIMARY KEY CLUSTERED 
(
	[rezervacijaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usluga]    Script Date: 31-Mar-21 07:46:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usluga](
	[uslugaID] [int] IDENTITY(1,1) NOT NULL,
	[naziv] [nvarchar](50) NOT NULL,
	[cena] [float] NOT NULL,
	[opis] [nvarchar](500) NULL,
	[kapacitet] [int] NOT NULL,
	[aktivna] [bit] NOT NULL,
	[adminID] [int] NOT NULL,
 CONSTRAINT [PK_Usluga] PRIMARY KEY CLUSTERED 
(
	[uslugaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vlasnik]    Script Date: 31-Mar-21 07:46:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vlasnik](
	[vlasnikID] [int] IDENTITY(1,1) NOT NULL,
	[ime] [nvarchar](50) NOT NULL,
	[prezime] [nvarchar](50) NOT NULL,
	[adresa] [nvarchar](50) NOT NULL,
	[telefon] [nvarchar](50) NOT NULL,
	[mail] [nvarchar](50) NOT NULL,
	[lozinka] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Vlasnik] PRIMARY KEY CLUSTERED 
(
	[vlasnikID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Admin] ON 

INSERT [dbo].[Admin] ([adminID], [ime], [prezime], [mail], [lozinka]) VALUES (1, N'Maja', N'Živković', N'maja.zivko@admin.com', N'maja123')
INSERT [dbo].[Admin] ([adminID], [ime], [prezime], [mail], [lozinka]) VALUES (2, N'Teodora', N'Majstorović', N'tea.majstor@admin.com', N'majstor456')
SET IDENTITY_INSERT [dbo].[Admin] OFF
INSERT [dbo].[Pas] ([pasID], [vlasnikID], [imePsa], [rasa], [pol], [sterilisan], [opis], [obrisan]) VALUES (1, 1, N'Dora', N'Labrador', 1, 1, N'Poslušna, pametna. Odlično se slaže sa drugim psima, a i sa ljudima.', 0)
INSERT [dbo].[Pas] ([pasID], [vlasnikID], [imePsa], [rasa], [pol], [sterilisan], [opis], [obrisan]) VALUES (1, 2, N'Lana', N'Hrt', 1, 0, N'Hiperaktivna. Mora u šetnju barem 3 puta dnevno.', 0)
INSERT [dbo].[Pas] ([pasID], [vlasnikID], [imePsa], [rasa], [pol], [sterilisan], [opis], [obrisan]) VALUES (1, 5, N'Max', N'Doberman', 0, 0, NULL, 0)
INSERT [dbo].[Pas] ([pasID], [vlasnikID], [imePsa], [rasa], [pol], [sterilisan], [opis], [obrisan]) VALUES (2, 1, N'Balto', N'Bigl', 0, 0, N'Samostalan, neposlušan. Do sada uništio nebrojano mnogo kućnih papuča.', 0)
INSERT [dbo].[Pas] ([pasID], [vlasnikID], [imePsa], [rasa], [pol], [sterilisan], [opis], [obrisan]) VALUES (2, 2, N'Bela', N'Koker španijel', 1, 0, NULL, 0)
INSERT [dbo].[Pas] ([pasID], [vlasnikID], [imePsa], [rasa], [pol], [sterilisan], [opis], [obrisan]) VALUES (3, 1, N'Petar Drugi', N'Jorkširski terijer', 0, 1, N'Agresivan, jede malu količinu hrane više puta dnevno i plaši se da jede iz zelene činije.', 0)
INSERT [dbo].[Pas] ([pasID], [vlasnikID], [imePsa], [rasa], [pol], [sterilisan], [opis], [obrisan]) VALUES (4, 1, N'Sima', N'Mešanac', 0, 1, NULL, 1)
SET IDENTITY_INSERT [dbo].[Rezervacija] ON 

INSERT [dbo].[Rezervacija] ([rezervacijaID], [datumPrijavljivanja], [datumOdjavljivanja], [napomena], [cena], [uslugaID], [vlasnikID], [pasID]) VALUES (1, CAST(N'2021-01-20' AS Date), CAST(N'2021-01-24' AS Date), N'Sva tri psa se super slažu.', 2000, 1, 1, 1)
INSERT [dbo].[Rezervacija] ([rezervacijaID], [datumPrijavljivanja], [datumOdjavljivanja], [napomena], [cena], [uslugaID], [vlasnikID], [pasID]) VALUES (3, CAST(N'2021-01-20' AS Date), CAST(N'2021-01-24' AS Date), N'Sva tri psa se super slažu.', 2000, 1, 1, 2)
INSERT [dbo].[Rezervacija] ([rezervacijaID], [datumPrijavljivanja], [datumOdjavljivanja], [napomena], [cena], [uslugaID], [vlasnikID], [pasID]) VALUES (4, CAST(N'2021-01-20' AS Date), CAST(N'2021-01-24' AS Date), N'Sva tri psa se super slažu.', 2000, 1, 1, 3)
INSERT [dbo].[Rezervacija] ([rezervacijaID], [datumPrijavljivanja], [datumOdjavljivanja], [napomena], [cena], [uslugaID], [vlasnikID], [pasID]) VALUES (5, CAST(N'2021-02-16' AS Date), CAST(N'2021-02-18' AS Date), N'', 1600, 4, 2, 2)
INSERT [dbo].[Rezervacija] ([rezervacijaID], [datumPrijavljivanja], [datumOdjavljivanja], [napomena], [cena], [uslugaID], [vlasnikID], [pasID]) VALUES (6, CAST(N'2021-03-29' AS Date), CAST(N'2021-04-01' AS Date), N'Mora da uzima probiotik koji sam vam dostavila svako jutro u 9.', 1950, 9, 2, 1)
INSERT [dbo].[Rezervacija] ([rezervacijaID], [datumPrijavljivanja], [datumOdjavljivanja], [napomena], [cena], [uslugaID], [vlasnikID], [pasID]) VALUES (8, CAST(N'2020-11-27' AS Date), CAST(N'2020-11-30' AS Date), NULL, 2400, 4, 1, 3)
INSERT [dbo].[Rezervacija] ([rezervacijaID], [datumPrijavljivanja], [datumOdjavljivanja], [napomena], [cena], [uslugaID], [vlasnikID], [pasID]) VALUES (9, CAST(N'2020-11-27' AS Date), CAST(N'2020-11-30' AS Date), NULL, 2400, 4, 1, 4)
INSERT [dbo].[Rezervacija] ([rezervacijaID], [datumPrijavljivanja], [datumOdjavljivanja], [napomena], [cena], [uslugaID], [vlasnikID], [pasID]) VALUES (10, CAST(N'2020-11-24' AS Date), CAST(N'2020-11-30' AS Date), N'Molim da obroci budu na bazi piletine.', 3900, 9, 2, 1)
INSERT [dbo].[Rezervacija] ([rezervacijaID], [datumPrijavljivanja], [datumOdjavljivanja], [napomena], [cena], [uslugaID], [vlasnikID], [pasID]) VALUES (11, CAST(N'2020-11-24' AS Date), CAST(N'2020-11-30' AS Date), N'Molim da obroci budu na bazi piletine.', 3900, 9, 2, 2)
INSERT [dbo].[Rezervacija] ([rezervacijaID], [datumPrijavljivanja], [datumOdjavljivanja], [napomena], [cena], [uslugaID], [vlasnikID], [pasID]) VALUES (12, CAST(N'2021-02-03' AS Date), CAST(N'2021-02-07' AS Date), N'', 4800, 6, 1, 1)
INSERT [dbo].[Rezervacija] ([rezervacijaID], [datumPrijavljivanja], [datumOdjavljivanja], [napomena], [cena], [uslugaID], [vlasnikID], [pasID]) VALUES (13, CAST(N'2021-01-23' AS Date), CAST(N'2021-01-26' AS Date), N'Molim da mi svako veče pošaljete mail kako je moj Max.', 1500, 1, 5, 1)
INSERT [dbo].[Rezervacija] ([rezervacijaID], [datumPrijavljivanja], [datumOdjavljivanja], [napomena], [cena], [uslugaID], [vlasnikID], [pasID]) VALUES (14, CAST(N'2020-11-22' AS Date), CAST(N'2020-11-28' AS Date), NULL, 7200, 6, 5, 1)
INSERT [dbo].[Rezervacija] ([rezervacijaID], [datumPrijavljivanja], [datumOdjavljivanja], [napomena], [cena], [uslugaID], [vlasnikID], [pasID]) VALUES (15, CAST(N'2021-04-09' AS Date), CAST(N'2021-04-12' AS Date), N'Dovešću pse tek u 23h uveče.', 2400, 4, 1, 1)
INSERT [dbo].[Rezervacija] ([rezervacijaID], [datumPrijavljivanja], [datumOdjavljivanja], [napomena], [cena], [uslugaID], [vlasnikID], [pasID]) VALUES (16, CAST(N'2021-04-09' AS Date), CAST(N'2021-04-12' AS Date), N'Dovešću pse tek u 23h uveče.', 2400, 4, 1, 2)
INSERT [dbo].[Rezervacija] ([rezervacijaID], [datumPrijavljivanja], [datumOdjavljivanja], [napomena], [cena], [uslugaID], [vlasnikID], [pasID]) VALUES (17, CAST(N'2021-04-09' AS Date), CAST(N'2021-04-12' AS Date), N'Dovešću pse tek u 23h uveče.', 2400, 4, 1, 3)
INSERT [dbo].[Rezervacija] ([rezervacijaID], [datumPrijavljivanja], [datumOdjavljivanja], [napomena], [cena], [uslugaID], [vlasnikID], [pasID]) VALUES (18, CAST(N'2021-04-07' AS Date), CAST(N'2021-04-14' AS Date), NULL, 3500, 1, 2, 1)
INSERT [dbo].[Rezervacija] ([rezervacijaID], [datumPrijavljivanja], [datumOdjavljivanja], [napomena], [cena], [uslugaID], [vlasnikID], [pasID]) VALUES (19, CAST(N'2021-04-07' AS Date), CAST(N'2021-04-14' AS Date), NULL, 3500, 1, 2, 2)
INSERT [dbo].[Rezervacija] ([rezervacijaID], [datumPrijavljivanja], [datumOdjavljivanja], [napomena], [cena], [uslugaID], [vlasnikID], [pasID]) VALUES (20, CAST(N'2021-04-08' AS Date), CAST(N'2021-04-13' AS Date), NULL, 2500, 1, 5, 1)
SET IDENTITY_INSERT [dbo].[Rezervacija] OFF
SET IDENTITY_INSERT [dbo].[Usluga] ON 

INSERT [dbo].[Usluga] ([uslugaID], [naziv], [cena], [opis], [kapacitet], [aktivna], [adminID]) VALUES (1, N'Osnovni paket', 500, N'U uslugu je uključeno prenoćište.', 30, 1, 1)
INSERT [dbo].[Usluga] ([uslugaID], [naziv], [cena], [opis], [kapacitet], [aktivna], [adminID]) VALUES (4, N'Premijum', 800, N'U uslugu je uključeno prenoćište i obroci.', 20, 1, 2)
INSERT [dbo].[Usluga] ([uslugaID], [naziv], [cena], [opis], [kapacitet], [aktivna], [adminID]) VALUES (6, N'Lux paket', 1200, N'U uslugu je uključeno prenoćište, obroci, šetanje i personalni trener za vreme boravka Vašeg psa.', 2, 1, 1)
INSERT [dbo].[Usluga] ([uslugaID], [naziv], [cena], [opis], [kapacitet], [aktivna], [adminID]) VALUES (9, N'Premijum', 650, N'U uslugu je uključeno prenoćište, obroci i šišanje za vreme boravka Vašeg psa.', 15, 0, 2)
SET IDENTITY_INSERT [dbo].[Usluga] OFF
SET IDENTITY_INSERT [dbo].[Vlasnik] ON 

INSERT [dbo].[Vlasnik] ([vlasnikID], [ime], [prezime], [adresa], [telefon], [mail], [lozinka]) VALUES (1, N'Pera', N'Perić', N'Paunova 20, Novi Sad', N'064334455', N'pera.peric@gmail.com', N'Pera123')
INSERT [dbo].[Vlasnik] ([vlasnikID], [ime], [prezime], [adresa], [telefon], [mail], [lozinka]) VALUES (2, N'Ivana', N'Ivanović', N'Nemanjina 10 A, Beograd', N'011776688', N'ivana.ivanovic@gmail.com', N'Ivana123')
INSERT [dbo].[Vlasnik] ([vlasnikID], [ime], [prezime], [adresa], [telefon], [mail], [lozinka]) VALUES (5, N'Milan', N'Milanović', N'Bulevar oslobođenja 15 prvi ulaz, Beograd', N'+38162778899', N'milan.milanovic@its.edu.rs', N'Milan123')
SET IDENTITY_INSERT [dbo].[Vlasnik] OFF
ALTER TABLE [dbo].[Pas]  WITH CHECK ADD  CONSTRAINT [FK_Pas_Vlasnik] FOREIGN KEY([vlasnikID])
REFERENCES [dbo].[Vlasnik] ([vlasnikID])
GO
ALTER TABLE [dbo].[Pas] CHECK CONSTRAINT [FK_Pas_Vlasnik]
GO
ALTER TABLE [dbo].[Rezervacija]  WITH CHECK ADD  CONSTRAINT [FK_Rezervacija_Pas] FOREIGN KEY([pasID], [vlasnikID])
REFERENCES [dbo].[Pas] ([pasID], [vlasnikID])
GO
ALTER TABLE [dbo].[Rezervacija] CHECK CONSTRAINT [FK_Rezervacija_Pas]
GO
ALTER TABLE [dbo].[Rezervacija]  WITH CHECK ADD  CONSTRAINT [FK_Rezervacija_Usluga] FOREIGN KEY([uslugaID])
REFERENCES [dbo].[Usluga] ([uslugaID])
GO
ALTER TABLE [dbo].[Rezervacija] CHECK CONSTRAINT [FK_Rezervacija_Usluga]
GO
ALTER TABLE [dbo].[Usluga]  WITH CHECK ADD  CONSTRAINT [FK_Usluga_Admin] FOREIGN KEY([adminID])
REFERENCES [dbo].[Admin] ([adminID])
GO
ALTER TABLE [dbo].[Usluga] CHECK CONSTRAINT [FK_Usluga_Admin]
GO
USE [master]
GO
ALTER DATABASE [HotelZaPseDB] SET  READ_WRITE 
GO
