USE [master]
GO
/****** Object:  Database [MyDesk]    Script Date: 6/30/2024 12:36:20 PM ******/
CREATE DATABASE [MyDesk]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MyDesk', FILENAME = N'/var/opt/mssql/data/MyDesk.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MyDesk_log', FILENAME = N'/var/opt/mssql/data/MyDesk_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [MyDesk] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MyDesk].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MyDesk] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MyDesk] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MyDesk] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MyDesk] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MyDesk] SET ARITHABORT OFF 
GO
ALTER DATABASE [MyDesk] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MyDesk] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MyDesk] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MyDesk] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MyDesk] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MyDesk] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MyDesk] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MyDesk] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MyDesk] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MyDesk] SET  ENABLE_BROKER 
GO
ALTER DATABASE [MyDesk] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MyDesk] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MyDesk] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MyDesk] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MyDesk] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MyDesk] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [MyDesk] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MyDesk] SET RECOVERY FULL 
GO
ALTER DATABASE [MyDesk] SET  MULTI_USER 
GO
ALTER DATABASE [MyDesk] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MyDesk] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MyDesk] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MyDesk] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [MyDesk] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [MyDesk] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'MyDesk', N'ON'
GO
ALTER DATABASE [MyDesk] SET QUERY_STORE = OFF
GO
USE [MyDesk]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 6/30/2024 12:36:20 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Buildings]    Script Date: 6/30/2024 12:36:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Buildings](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Address] [nvarchar](max) NOT NULL,
	[Deleted] [bit] NOT NULL,
	[Created_At] [datetime2](7) NOT NULL,
	[Updated_At] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Buildings] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Credentials]    Script Date: 6/30/2024 12:36:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Credentials](
	[Id] [uniqueidentifier] NOT NULL,
	[User_Id] [uniqueidentifier] NOT NULL,
	[Password] [varbinary](max) NOT NULL,
	[Salt] [nvarchar](max) NOT NULL,
	[Number_Of_Tries] [int] NOT NULL,
	[Is_Active] [bit] NOT NULL,
	[TOTP] [nvarchar](max) NOT NULL,
	[Updated_At] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Credentials] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Floors]    Script Date: 6/30/2024 12:36:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Floors](
	[Id] [uniqueidentifier] NOT NULL,
	[Building_Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Deleted] [bit] NOT NULL,
	[Created_At] [datetime2](7) NOT NULL,
	[Updated_At] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Floors] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Photos]    Script Date: 6/30/2024 12:36:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Photos](
	[User_Id] [uniqueidentifier] NOT NULL,
	[PhotoUrl] [nvarchar](max) NOT NULL,
	[Updated_At] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Photos] PRIMARY KEY CLUSTERED 
(
	[User_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reservations]    Script Date: 6/30/2024 12:36:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reservations](
	[Id] [uniqueidentifier] NOT NULL,
	[User_Id] [uniqueidentifier] NOT NULL,
	[Desk_Id] [uniqueidentifier] NOT NULL,
	[Date] [datetime2](7) NOT NULL,
	[Deleted] [bit] NOT NULL,
	[Created_At] [datetime2](7) NOT NULL,
	[Updated_At] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Reservations] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Teams]    Script Date: 6/30/2024 12:36:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Teams](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Created_At] [datetime2](7) NOT NULL,
	[Updated_At] [datetime2](7) NOT NULL,
	[Deleted] [bit] NOT NULL,
 CONSTRAINT [PK_Teams] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tiles]    Script Date: 6/30/2024 12:36:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tiles](
	[Id] [uniqueidentifier] NOT NULL,
	[Zone_Id] [uniqueidentifier] NOT NULL,
	[Type] [int] NOT NULL,
	[X_Position] [int] NOT NULL,
	[Y_Position] [int] NOT NULL,
	[Deleted] [bit] NOT NULL,
	[Created_At] [datetime2](7) NOT NULL,
	[Updated_At] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Tiles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 6/30/2024 12:36:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [uniqueidentifier] NOT NULL,
	[Team_Id] [uniqueidentifier] NOT NULL,
	[Photo_Id] [uniqueidentifier] NULL,
	[Email] [nvarchar](max) NOT NULL,
	[First_Name] [nvarchar](max) NOT NULL,
	[Last_Name] [nvarchar](max) NOT NULL,
	[Is_Admin] [bit] NOT NULL,
	[Deleted] [bit] NOT NULL,
	[Created_At] [datetime2](7) NOT NULL,
	[Updated_At] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Zones]    Script Date: 6/30/2024 12:36:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Zones](
	[Id] [uniqueidentifier] NOT NULL,
	[Floor_Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Size_X] [int] NOT NULL,
	[Size_Y] [int] NOT NULL,
	[Deleted] [bit] NOT NULL,
	[Created_At] [datetime2](7) NOT NULL,
	[Updated_At] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Zones] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240211111829_Initial', N'8.0.1')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240211114401_TileInitializedAsBlankBug', N'8.0.1')
GO
INSERT [dbo].[Buildings] ([Id], [Name], [Address], [Deleted], [Created_At], [Updated_At]) VALUES (N'056a3a9a-2be6-46d8-f3e5-08dc2af3b981', N'Oregon', N'Str. Calarasi nr.5', 0, CAST(N'2024-02-11T11:22:26.9633333' AS DateTime2), CAST(N'2024-02-11T11:22:26.9633333' AS DateTime2))
GO
INSERT [dbo].[Credentials] ([Id], [User_Id], [Password], [Salt], [Number_Of_Tries], [Is_Active], [TOTP], [Updated_At]) VALUES (N'47aea6e0-62d8-4e07-2350-08dc2af36bdf', N'91b88619-2e71-4f6e-b95b-77f13464c6e1', 0xD07B3444AB71CEE4DF33DE3D2CBB4F754152087B4F4B8096289E2D9AAB91AB12, N'0674e865-7fcb-416b-8c39-d8f303b7ca1d', 0, 1, N'', CAST(N'2024-02-11T11:20:16.6766667' AS DateTime2))
INSERT [dbo].[Credentials] ([Id], [User_Id], [Password], [Salt], [Number_Of_Tries], [Is_Active], [TOTP], [Updated_At]) VALUES (N'abbbc8ff-866e-4ef7-24ec-08dc32161cf7', N'a7304e9a-f5d6-4463-a7fe-aaecc2249788', 0x325E7489163DA9CED3813B8689A4226FA251D835BA170ECF08D9B3E146C49F9B, N'8ec924cd-b715-4a79-b04b-cae0bc4897bd', 0, 1, N'', CAST(N'2024-02-20T13:16:13.5566667' AS DateTime2))
INSERT [dbo].[Credentials] ([Id], [User_Id], [Password], [Salt], [Number_Of_Tries], [Is_Active], [TOTP], [Updated_At]) VALUES (N'67d8eb66-91f5-49ec-10b2-08dc9822304c', N'6ac0b948-243e-4d8e-9fef-12d2fb9c473c', 0x91925D7308B66B0197D5D5AB655AB34DF01AB8A5A300451442E98F0B3B9662BC, N'742d446a-4348-4ddf-af31-3b4d7f96fbbc', 0, 1, N'', CAST(N'2024-06-29T09:59:39.7266667' AS DateTime2))
INSERT [dbo].[Credentials] ([Id], [User_Id], [Password], [Salt], [Number_Of_Tries], [Is_Active], [TOTP], [Updated_At]) VALUES (N'c7579da2-60f3-432b-10b3-08dc9822304c', N'd82a2a87-36bc-4622-b83e-db1677b6ced5', 0xF2DE30B72AD124E4B20A1A67544DA25A412CCE50FE9BBC418676C48DBBFEF468, N'88bdf511-62b6-4347-baca-65acaddf0065', 0, 1, N'', CAST(N'2024-06-29T10:00:01.1500000' AS DateTime2))
INSERT [dbo].[Credentials] ([Id], [User_Id], [Password], [Salt], [Number_Of_Tries], [Is_Active], [TOTP], [Updated_At]) VALUES (N'1971a86d-5256-4458-b9aa-08dc9823fdf4', N'7dd91432-eb5d-40b7-bc24-fe963a43d819', 0x8456F6394BEA8D951D5A297729CD59E1506537CC95FAE451071F5FD2F55F96D2, N'c01792cf-ef4d-4e49-be50-1027dac0311d', 0, 1, N'', CAST(N'2024-06-29T10:12:33.6900000' AS DateTime2))
INSERT [dbo].[Credentials] ([Id], [User_Id], [Password], [Salt], [Number_Of_Tries], [Is_Active], [TOTP], [Updated_At]) VALUES (N'e8c5ee4d-d3ed-4c7d-b9ab-08dc9823fdf4', N'7db97e6a-457e-4c91-b2d8-c0b6c38bb643', 0xF903B9AD1FC61BAC9EE385CE6C68C0A8FC7460A8447595A639E260BC615EFC53, N'e782e610-a13a-4aa5-9bd9-0c6ea3676d19', 0, 1, N'', CAST(N'2024-06-29T10:12:56.2933333' AS DateTime2))
INSERT [dbo].[Credentials] ([Id], [User_Id], [Password], [Salt], [Number_Of_Tries], [Is_Active], [TOTP], [Updated_At]) VALUES (N'cae86fc6-3ed7-4dbf-b9ac-08dc9823fdf4', N'6f3b0e9e-1744-4551-ad7c-56880ae07a78', 0xE323FF4B1C56576089C296BA10F75C472B78E1DDA9881D2F0374A9A0CBFD5898, N'4c0be5cd-cd5a-4eef-9a55-98534db3ce5a', 0, 1, N'', CAST(N'2024-06-29T10:14:36.1000000' AS DateTime2))
INSERT [dbo].[Credentials] ([Id], [User_Id], [Password], [Salt], [Number_Of_Tries], [Is_Active], [TOTP], [Updated_At]) VALUES (N'04f43eb8-b242-4308-b9ad-08dc9823fdf4', N'26012643-8c96-49c1-8337-5ba4887f8830', 0x6DA525FD41007942F04E1CC0FF845FD6D4BA70B6BEE4AB37592851825036A55F, N'9b03d434-9661-4199-9ff8-aeee8c501947', 0, 1, N'', CAST(N'2024-06-29T10:14:55.5700000' AS DateTime2))
GO
INSERT [dbo].[Floors] ([Id], [Building_Id], [Name], [Deleted], [Created_At], [Updated_At]) VALUES (N'e4f79a51-7c6c-4729-9e33-08dc2af3c352', N'056a3a9a-2be6-46d8-f3e5-08dc2af3b981', N'1', 0, CAST(N'2024-02-11T11:22:43.3200000' AS DateTime2), CAST(N'2024-02-11T11:22:43.3200000' AS DateTime2))
GO
INSERT [dbo].[Reservations] ([Id], [User_Id], [Desk_Id], [Date], [Deleted], [Created_At], [Updated_At]) VALUES (N'c15cc4f2-d77e-441a-5731-08dc7e65cd49', N'91b88619-2e71-4f6e-b95b-77f13464c6e1', N'48fdd8d3-919a-4042-c949-08dc7dbb3119', CAST(N'2024-05-27T00:00:00.0000000' AS DateTime2), 0, CAST(N'2024-05-27T16:05:13.9966667' AS DateTime2), CAST(N'2024-05-27T16:05:13.9966667' AS DateTime2))
INSERT [dbo].[Reservations] ([Id], [User_Id], [Desk_Id], [Date], [Deleted], [Created_At], [Updated_At]) VALUES (N'1cc8b7f1-18b9-4846-5732-08dc7e65cd49', N'a7304e9a-f5d6-4463-a7fe-aaecc2249788', N'fc91e85d-9aa9-4e3d-c94a-08dc7dbb3119', CAST(N'2024-05-27T00:00:00.0000000' AS DateTime2), 0, CAST(N'2024-05-27T16:05:13.9966667' AS DateTime2), CAST(N'2024-05-27T16:05:13.9966667' AS DateTime2))
INSERT [dbo].[Reservations] ([Id], [User_Id], [Desk_Id], [Date], [Deleted], [Created_At], [Updated_At]) VALUES (N'65c54754-99df-49aa-8215-08dc9449d139', N'a7304e9a-f5d6-4463-a7fe-aaecc2249788', N'fd335e69-375e-4eb9-c95e-08dc7dbb3119', CAST(N'2024-06-24T00:00:00.0000000' AS DateTime2), 0, CAST(N'2024-06-24T12:33:13.8533333' AS DateTime2), CAST(N'2024-06-24T12:33:13.8533333' AS DateTime2))
INSERT [dbo].[Reservations] ([Id], [User_Id], [Desk_Id], [Date], [Deleted], [Created_At], [Updated_At]) VALUES (N'bf4bc967-a796-4362-1212-08dc9822da87', N'a7304e9a-f5d6-4463-a7fe-aaecc2249788', N'fd335e69-375e-4eb9-c95e-08dc7dbb3119', CAST(N'2024-06-29T00:00:00.0000000' AS DateTime2), 1, CAST(N'2024-06-29T10:04:39.6533333' AS DateTime2), CAST(N'2024-06-29T10:04:39.6533333' AS DateTime2))
INSERT [dbo].[Reservations] ([Id], [User_Id], [Desk_Id], [Date], [Deleted], [Created_At], [Updated_At]) VALUES (N'cfef3d59-57dd-4a2f-1214-08dc9822da87', N'6ac0b948-243e-4d8e-9fef-12d2fb9c473c', N'48fdd8d3-919a-4042-c949-08dc7dbb3119', CAST(N'2024-06-29T00:00:00.0000000' AS DateTime2), 1, CAST(N'2024-06-29T10:04:50.9533333' AS DateTime2), CAST(N'2024-06-29T10:04:50.9533333' AS DateTime2))
INSERT [dbo].[Reservations] ([Id], [User_Id], [Desk_Id], [Date], [Deleted], [Created_At], [Updated_At]) VALUES (N'b10c9433-4112-4182-1215-08dc9822da87', N'91b88619-2e71-4f6e-b95b-77f13464c6e1', N'fc91e85d-9aa9-4e3d-c94a-08dc7dbb3119', CAST(N'2024-06-29T00:00:00.0000000' AS DateTime2), 1, CAST(N'2024-06-29T10:04:50.9533333' AS DateTime2), CAST(N'2024-06-29T10:04:50.9533333' AS DateTime2))
INSERT [dbo].[Reservations] ([Id], [User_Id], [Desk_Id], [Date], [Deleted], [Created_At], [Updated_At]) VALUES (N'00ebd800-c4bf-488d-1216-08dc9822da87', N'a7304e9a-f5d6-4463-a7fe-aaecc2249788', N'dd7b18a4-54f4-4274-c95d-08dc7dbb3119', CAST(N'2024-06-29T00:00:00.0000000' AS DateTime2), 1, CAST(N'2024-06-29T10:04:50.9533333' AS DateTime2), CAST(N'2024-06-29T10:04:50.9533333' AS DateTime2))
INSERT [dbo].[Reservations] ([Id], [User_Id], [Desk_Id], [Date], [Deleted], [Created_At], [Updated_At]) VALUES (N'338451ee-a5a7-4bd1-1217-08dc9822da87', N'd82a2a87-36bc-4622-b83e-db1677b6ced5', N'dc9091e2-1e10-4c58-c971-08dc7dbb3119', CAST(N'2024-06-29T00:00:00.0000000' AS DateTime2), 1, CAST(N'2024-06-29T10:04:50.9533333' AS DateTime2), CAST(N'2024-06-29T10:04:50.9533333' AS DateTime2))
INSERT [dbo].[Reservations] ([Id], [User_Id], [Desk_Id], [Date], [Deleted], [Created_At], [Updated_At]) VALUES (N'1939788b-9590-48d4-2a06-08dc98245a2a', N'6f3b0e9e-1744-4551-ad7c-56880ae07a78', N'48fdd8d3-919a-4042-c949-08dc7dbb3119', CAST(N'2024-06-29T00:00:00.0000000' AS DateTime2), 1, CAST(N'2024-06-29T10:15:08.7966667' AS DateTime2), CAST(N'2024-06-29T10:15:08.7966667' AS DateTime2))
INSERT [dbo].[Reservations] ([Id], [User_Id], [Desk_Id], [Date], [Deleted], [Created_At], [Updated_At]) VALUES (N'a425b3ce-40b3-4153-2a07-08dc98245a2a', N'26012643-8c96-49c1-8337-5ba4887f8830', N'fc91e85d-9aa9-4e3d-c94a-08dc7dbb3119', CAST(N'2024-06-29T00:00:00.0000000' AS DateTime2), 1, CAST(N'2024-06-29T10:15:08.7966667' AS DateTime2), CAST(N'2024-06-29T10:15:08.7966667' AS DateTime2))
INSERT [dbo].[Reservations] ([Id], [User_Id], [Desk_Id], [Date], [Deleted], [Created_At], [Updated_At]) VALUES (N'fd2c76c9-c7ee-4cf2-2a08-08dc98245a2a', N'7db97e6a-457e-4c91-b2d8-c0b6c38bb643', N'dd7b18a4-54f4-4274-c95d-08dc7dbb3119', CAST(N'2024-06-29T00:00:00.0000000' AS DateTime2), 1, CAST(N'2024-06-29T10:15:23.0400000' AS DateTime2), CAST(N'2024-06-29T10:15:23.0400000' AS DateTime2))
INSERT [dbo].[Reservations] ([Id], [User_Id], [Desk_Id], [Date], [Deleted], [Created_At], [Updated_At]) VALUES (N'90e20d7f-fb97-429a-2a09-08dc98245a2a', N'7dd91432-eb5d-40b7-bc24-fe963a43d819', N'fd335e69-375e-4eb9-c95e-08dc7dbb3119', CAST(N'2024-06-29T00:00:00.0000000' AS DateTime2), 1, CAST(N'2024-06-29T10:15:23.0400000' AS DateTime2), CAST(N'2024-06-29T10:15:23.0400000' AS DateTime2))
GO
INSERT [dbo].[Teams] ([Id], [Name], [Created_At], [Updated_At], [Deleted]) VALUES (N'2112f055-7a92-47b1-528b-08dc2af355e1', N'SSO', CAST(N'2024-02-11T11:19:38.5815031' AS DateTime2), CAST(N'2024-02-11T11:19:38.5815033' AS DateTime2), 0)
INSERT [dbo].[Teams] ([Id], [Name], [Created_At], [Updated_At], [Deleted]) VALUES (N'39f2d3c5-4f31-4182-823e-08dc9823e4dd', N'Marketing', CAST(N'2024-06-29T10:11:51.0628069' AS DateTime2), CAST(N'2024-06-29T10:11:51.0628069' AS DateTime2), 0)
INSERT [dbo].[Teams] ([Id], [Name], [Created_At], [Updated_At], [Deleted]) VALUES (N'701c15ba-8338-4b9a-823f-08dc9823e4dd', N'Legal', CAST(N'2024-06-29T10:13:26.6875820' AS DateTime2), CAST(N'2024-06-29T10:13:26.6875821' AS DateTime2), 0)
GO
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'48fdd8d3-919a-4042-c949-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 0, 0, 0, 0, CAST(N'2024-05-26T19:36:52.2600000' AS DateTime2), CAST(N'2024-05-26T19:38:25.3961478' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'fc91e85d-9aa9-4e3d-c94a-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 0, 0, 1, 0, CAST(N'2024-05-26T19:36:52.4333333' AS DateTime2), CAST(N'2024-05-26T19:38:32.0609725' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'd1b0f77d-c942-4670-c94b-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 6, 0, 2, 0, CAST(N'2024-05-26T19:36:52.3733333' AS DateTime2), CAST(N'2024-06-29T09:22:00.2417558' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'a5303c51-7b1c-43aa-c94c-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 1, 0, 3, 0, CAST(N'2024-05-26T19:36:52.3266667' AS DateTime2), CAST(N'2024-06-29T09:22:02.6122933' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'182c5e00-55c2-4409-c94d-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 0, 4, 0, CAST(N'2024-05-26T19:36:52.2400000' AS DateTime2), CAST(N'2024-05-26T19:36:52.2400000' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'9085479f-1dd0-44d6-c94e-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 0, 5, 0, CAST(N'2024-05-26T19:36:52.3266667' AS DateTime2), CAST(N'2024-05-26T19:36:52.3266667' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'9edfbd81-36c4-4553-c94f-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 0, 6, 0, CAST(N'2024-05-26T19:36:52.3266667' AS DateTime2), CAST(N'2024-05-26T19:36:52.3266667' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'cd0a5631-7f38-4262-c950-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 0, 7, 0, CAST(N'2024-05-26T19:36:52.3733333' AS DateTime2), CAST(N'2024-05-26T19:36:52.3733333' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'f96d4f1e-4063-454c-c951-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 0, 8, 0, CAST(N'2024-05-26T19:36:52.4333333' AS DateTime2), CAST(N'2024-05-26T19:36:52.4333333' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'bbb72197-e1e8-4d4a-c952-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 0, 9, 0, CAST(N'2024-05-26T19:36:52.3500000' AS DateTime2), CAST(N'2024-05-26T19:36:52.3500000' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'be2027ba-a44b-4be7-c953-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 0, 10, 0, CAST(N'2024-05-26T19:36:52.3500000' AS DateTime2), CAST(N'2024-05-26T19:36:52.3500000' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'495b8854-1915-4906-c954-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 0, 11, 0, CAST(N'2024-05-26T19:36:52.2600000' AS DateTime2), CAST(N'2024-05-26T19:36:52.2600000' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'19158627-9fa3-47eb-c955-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 0, 12, 0, CAST(N'2024-05-26T19:36:52.2400000' AS DateTime2), CAST(N'2024-05-26T19:36:52.2400000' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'7d21be95-2493-410e-c956-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 0, 13, 0, CAST(N'2024-05-26T19:36:52.3033333' AS DateTime2), CAST(N'2024-05-26T19:36:52.3033333' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'882542e3-fbed-4ab9-c957-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 0, 14, 0, CAST(N'2024-05-26T19:36:52.3033333' AS DateTime2), CAST(N'2024-05-26T19:36:52.3033333' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'27315ef0-e147-4282-c958-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 0, 15, 0, CAST(N'2024-05-26T19:36:52.2400000' AS DateTime2), CAST(N'2024-05-26T19:36:52.2400000' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'b981bc09-5209-4c53-c959-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 0, 16, 0, CAST(N'2024-05-26T19:36:52.3500000' AS DateTime2), CAST(N'2024-05-26T19:36:52.3500000' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'85c33974-5206-4cb0-c95a-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 0, 17, 0, CAST(N'2024-05-26T19:36:52.3033333' AS DateTime2), CAST(N'2024-05-26T19:36:52.3033333' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'cdcb987e-9da3-4868-c95b-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 0, 18, 0, CAST(N'2024-05-26T19:36:52.3733333' AS DateTime2), CAST(N'2024-05-26T19:36:52.3733333' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'a3a67bc1-0b38-44a2-c95c-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 0, 19, 0, CAST(N'2024-05-26T19:36:52.3266667' AS DateTime2), CAST(N'2024-05-26T19:36:52.3266667' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'dd7b18a4-54f4-4274-c95d-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 0, 1, 0, 0, CAST(N'2024-05-26T19:36:52.4033333' AS DateTime2), CAST(N'2024-06-29T09:28:32.9563610' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'fd335e69-375e-4eb9-c95e-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 0, 1, 1, 0, CAST(N'2024-05-26T19:36:52.4333333' AS DateTime2), CAST(N'2024-06-24T12:33:10.5409932' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'f54d6c59-904b-4c64-c95f-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 6, 1, 2, 0, CAST(N'2024-05-26T19:36:52.4333333' AS DateTime2), CAST(N'2024-06-29T09:21:56.6438751' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'81376ec8-d5ab-4b74-c960-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 1, 1, 3, 0, CAST(N'2024-05-26T19:36:52.3033333' AS DateTime2), CAST(N'2024-06-29T09:22:04.6925821' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'65415eea-c6c9-48a2-c961-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 1, 4, 0, CAST(N'2024-05-26T19:36:52.2833333' AS DateTime2), CAST(N'2024-05-26T19:36:52.2833333' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'70fc123c-9d97-4612-c962-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 1, 5, 0, CAST(N'2024-05-26T19:36:52.3033333' AS DateTime2), CAST(N'2024-05-26T19:36:52.3033333' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'e911fad8-7662-48f9-c963-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 1, 6, 0, CAST(N'2024-05-26T19:36:52.4033333' AS DateTime2), CAST(N'2024-05-26T19:36:52.4033333' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'b1f97c0f-ca5f-4f88-c964-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 1, 7, 0, CAST(N'2024-05-26T19:36:52.3500000' AS DateTime2), CAST(N'2024-05-26T19:36:52.3500000' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'6922a006-4a80-4dbd-c965-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 1, 8, 0, CAST(N'2024-05-26T19:36:52.2833333' AS DateTime2), CAST(N'2024-05-26T19:36:52.2833333' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'd40d60f1-1e9a-4e4d-c966-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 1, 9, 0, CAST(N'2024-05-26T19:36:52.3733333' AS DateTime2), CAST(N'2024-05-26T19:36:52.3733333' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'5f543223-6182-446e-c967-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 1, 10, 0, CAST(N'2024-05-26T19:36:52.2833333' AS DateTime2), CAST(N'2024-05-26T19:36:52.2833333' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'b7857bab-7741-40a6-c968-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 1, 11, 0, CAST(N'2024-05-26T19:36:52.3500000' AS DateTime2), CAST(N'2024-05-26T19:36:52.3500000' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'43ca5c19-1e62-41d6-c969-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 1, 12, 0, CAST(N'2024-05-26T19:36:52.2600000' AS DateTime2), CAST(N'2024-05-26T19:36:52.2600000' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'14b12501-1bf5-4da7-c96a-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 1, 13, 0, CAST(N'2024-05-26T19:36:52.2033333' AS DateTime2), CAST(N'2024-05-26T19:36:52.2033333' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'58e2ac0e-9ed6-4e7f-c96b-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 1, 14, 0, CAST(N'2024-05-26T19:36:52.2833333' AS DateTime2), CAST(N'2024-05-26T19:36:52.2833333' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'80e48edf-128d-4ff6-c96c-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 1, 15, 0, CAST(N'2024-05-26T19:36:52.3033333' AS DateTime2), CAST(N'2024-05-26T19:36:52.3033333' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'304292cc-0812-484e-c96d-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 1, 16, 0, CAST(N'2024-05-26T19:36:52.2400000' AS DateTime2), CAST(N'2024-05-26T19:36:52.2400000' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'd26ddf17-e464-4418-c96e-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 1, 17, 0, CAST(N'2024-05-26T19:36:52.3733333' AS DateTime2), CAST(N'2024-05-26T19:36:52.3733333' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'e07efd42-6ac8-4f03-c96f-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 1, 18, 0, CAST(N'2024-05-26T19:36:52.4033333' AS DateTime2), CAST(N'2024-05-26T19:36:52.4033333' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'086c5c0c-a492-4dfd-c970-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 1, 19, 0, CAST(N'2024-05-26T19:36:52.2033333' AS DateTime2), CAST(N'2024-05-26T19:36:52.2033333' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'dc9091e2-1e10-4c58-c971-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 0, 2, 0, 0, CAST(N'2024-05-26T19:36:52.4033333' AS DateTime2), CAST(N'2024-06-29T09:28:57.2807834' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'7cdcdddd-da19-4461-c972-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 0, 2, 1, 0, CAST(N'2024-05-26T19:36:52.3033333' AS DateTime2), CAST(N'2024-06-29T09:20:45.7459078' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'df9a2618-8afe-4586-c973-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 6, 2, 2, 0, CAST(N'2024-05-26T19:36:52.4033333' AS DateTime2), CAST(N'2024-06-29T09:21:46.3457413' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'2d028444-c0c5-4fa4-c974-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 1, 2, 3, 0, CAST(N'2024-05-26T19:36:52.2400000' AS DateTime2), CAST(N'2024-06-29T09:22:06.6943198' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'54666a0d-3ca4-426e-c975-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 2, 4, 0, CAST(N'2024-05-26T19:36:52.2833333' AS DateTime2), CAST(N'2024-05-26T19:36:52.2833333' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'6dac4b6e-7ecd-4dc6-c976-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 0, 2, 5, 0, CAST(N'2024-05-26T19:36:52.2833333' AS DateTime2), CAST(N'2024-05-26T19:50:49.6214625' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'b1484aa4-1c30-41b5-c977-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 2, 6, 0, CAST(N'2024-05-26T19:36:52.3500000' AS DateTime2), CAST(N'2024-05-26T19:36:52.3500000' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'14654f10-a512-4967-c978-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 2, 7, 0, CAST(N'2024-05-26T19:36:52.2033333' AS DateTime2), CAST(N'2024-05-26T19:36:52.2033333' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'449c72af-687c-48d8-c979-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 2, 8, 0, CAST(N'2024-05-26T19:36:52.2600000' AS DateTime2), CAST(N'2024-05-26T19:36:52.2600000' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'5c97a8bf-117e-4a7c-c97a-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 2, 9, 0, CAST(N'2024-05-26T19:36:52.2833333' AS DateTime2), CAST(N'2024-05-26T19:36:52.2833333' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'43b8b185-9177-4e3e-c97b-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 2, 10, 0, CAST(N'2024-05-26T19:36:52.2600000' AS DateTime2), CAST(N'2024-05-26T19:36:52.2600000' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'135bcf62-defd-48d9-c97c-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 2, 11, 0, CAST(N'2024-05-26T19:36:52.2033333' AS DateTime2), CAST(N'2024-05-26T19:36:52.2033333' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'd4a97fd1-9232-4dad-c97d-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 2, 12, 0, CAST(N'2024-05-26T19:36:52.3733333' AS DateTime2), CAST(N'2024-05-26T19:36:52.3733333' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'76f99ba5-e8ad-4c13-c97e-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 2, 13, 0, CAST(N'2024-05-26T19:36:52.3033333' AS DateTime2), CAST(N'2024-05-26T19:36:52.3033333' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'95974978-27b9-4725-c97f-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 2, 14, 0, CAST(N'2024-05-26T19:36:52.3266667' AS DateTime2), CAST(N'2024-05-26T19:36:52.3266667' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'051f6afa-56eb-4bde-c980-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 2, 15, 0, CAST(N'2024-05-26T19:36:52.2033333' AS DateTime2), CAST(N'2024-05-26T19:36:52.2033333' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'8e5635be-e7e1-4f08-c981-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 2, 16, 0, CAST(N'2024-05-26T19:36:52.3266667' AS DateTime2), CAST(N'2024-05-26T19:36:52.3266667' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'f0340858-ab28-4a11-c982-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 2, 17, 0, CAST(N'2024-05-26T19:36:52.4033333' AS DateTime2), CAST(N'2024-05-26T19:36:52.4033333' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'a2b17c4c-8bcd-4c5b-c983-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 2, 18, 0, CAST(N'2024-05-26T19:36:52.3266667' AS DateTime2), CAST(N'2024-05-26T19:36:52.3266667' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'28039d31-be2c-40f0-c984-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 2, 19, 0, CAST(N'2024-05-26T19:36:52.2400000' AS DateTime2), CAST(N'2024-05-26T19:36:52.2400000' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'746b56e4-d1e5-4dcd-c985-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 0, 3, 0, 0, CAST(N'2024-05-26T19:36:52.3033333' AS DateTime2), CAST(N'2024-06-24T12:33:06.0302118' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'625246a3-67ab-4db4-c986-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 0, 3, 1, 0, CAST(N'2024-05-26T19:36:52.2833333' AS DateTime2), CAST(N'2024-06-29T09:20:50.2899504' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'7f8f0461-d2d1-4842-c987-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 6, 3, 2, 0, CAST(N'2024-05-26T19:36:52.3033333' AS DateTime2), CAST(N'2024-06-29T09:21:43.3935241' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'cc065c68-4b35-4a28-c988-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 1, 3, 3, 0, CAST(N'2024-05-26T19:36:52.3733333' AS DateTime2), CAST(N'2024-06-29T09:22:09.2918666' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'b50d3463-f24b-4cae-c989-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 3, 4, 0, CAST(N'2024-05-26T19:36:52.3500000' AS DateTime2), CAST(N'2024-05-26T19:36:52.3500000' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'2ec92596-3085-4f23-c98a-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 3, 5, 0, CAST(N'2024-05-26T19:36:52.2400000' AS DateTime2), CAST(N'2024-05-26T19:36:52.2400000' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'8a380bd7-0098-40ae-c98b-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 3, 6, 0, CAST(N'2024-05-26T19:36:52.3033333' AS DateTime2), CAST(N'2024-05-26T19:36:52.3033333' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'a764aab1-e2ef-4428-c98c-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 3, 7, 0, CAST(N'2024-05-26T19:36:52.3500000' AS DateTime2), CAST(N'2024-05-26T19:36:52.3500000' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'0d5480f3-a093-4397-c98d-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 3, 8, 0, CAST(N'2024-05-26T19:36:52.2033333' AS DateTime2), CAST(N'2024-05-26T19:36:52.2033333' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'785665fb-66ed-4ddc-c98e-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 3, 9, 0, CAST(N'2024-05-26T19:36:52.3033333' AS DateTime2), CAST(N'2024-05-26T19:36:52.3033333' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'ffa60719-cc46-4dff-c98f-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 3, 10, 0, CAST(N'2024-05-26T19:36:52.4333333' AS DateTime2), CAST(N'2024-05-26T19:36:52.4333333' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'996d46cc-0e32-45f4-c990-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 3, 11, 0, CAST(N'2024-05-26T19:36:52.3266667' AS DateTime2), CAST(N'2024-05-26T19:36:52.3266667' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'f72625f2-5820-42c3-c991-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 3, 12, 0, CAST(N'2024-05-26T19:36:52.4333333' AS DateTime2), CAST(N'2024-05-26T19:36:52.4333333' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'e06b2ab0-63d4-48cd-c992-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 3, 13, 0, CAST(N'2024-05-26T19:36:52.4033333' AS DateTime2), CAST(N'2024-05-26T19:36:52.4033333' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'744d037e-fd96-44d8-c993-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 3, 14, 0, CAST(N'2024-05-26T19:36:52.3033333' AS DateTime2), CAST(N'2024-05-26T19:36:52.3033333' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'f0c844ed-a54f-4cbc-c994-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 3, 15, 0, CAST(N'2024-05-26T19:36:52.4033333' AS DateTime2), CAST(N'2024-05-26T19:36:52.4033333' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'0a556ab9-fc3c-4c72-c995-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 3, 16, 0, CAST(N'2024-05-26T19:36:52.2033333' AS DateTime2), CAST(N'2024-05-26T19:36:52.2033333' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'e09b25f5-8ad0-4496-c996-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 3, 17, 0, CAST(N'2024-05-26T19:36:52.4033333' AS DateTime2), CAST(N'2024-05-26T19:36:52.4033333' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'4b3c4c4d-041b-41b2-c997-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 3, 18, 0, CAST(N'2024-05-26T19:36:52.2600000' AS DateTime2), CAST(N'2024-05-26T19:36:52.2600000' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'497132a5-4dc6-4498-c998-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 3, 19, 0, CAST(N'2024-05-26T19:36:52.2600000' AS DateTime2), CAST(N'2024-05-26T19:36:52.2600000' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'b7046023-625f-4da0-c999-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 4, 0, 0, CAST(N'2024-05-26T19:36:52.3500000' AS DateTime2), CAST(N'2024-05-26T19:36:52.3500000' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'd224fda4-8b60-4bd0-c99a-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 6, 4, 1, 0, CAST(N'2024-05-26T19:36:52.3733333' AS DateTime2), CAST(N'2024-06-24T12:32:54.1980260' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'd173575d-24a1-4640-c99b-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 6, 4, 2, 0, CAST(N'2024-05-26T19:36:52.3733333' AS DateTime2), CAST(N'2024-06-29T09:21:32.1916725' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'cb08070f-6617-4460-c99c-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 6, 4, 3, 0, CAST(N'2024-05-26T19:36:52.3733333' AS DateTime2), CAST(N'2024-05-26T19:56:09.4584653' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'0f75203b-1c43-44a8-c99d-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 4, 4, 0, CAST(N'2024-05-26T19:36:52.2033333' AS DateTime2), CAST(N'2024-05-26T19:36:52.2033333' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'34c74252-1f4b-48aa-c99e-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 4, 5, 0, CAST(N'2024-05-26T19:36:52.2400000' AS DateTime2), CAST(N'2024-05-26T19:36:52.2400000' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'11396101-6975-49b5-c99f-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 4, 6, 0, CAST(N'2024-05-26T19:36:52.2033333' AS DateTime2), CAST(N'2024-05-26T19:36:52.2033333' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'db85e35c-dc54-4c2e-c9a0-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 4, 7, 0, CAST(N'2024-05-26T19:36:52.3733333' AS DateTime2), CAST(N'2024-05-26T19:36:52.3733333' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'81f81414-3807-4ac0-c9a1-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 4, 8, 0, CAST(N'2024-05-26T19:36:52.3033333' AS DateTime2), CAST(N'2024-05-26T19:36:52.3033333' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'b87d5065-3321-4cbc-c9a2-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 4, 9, 0, CAST(N'2024-05-26T19:36:52.3500000' AS DateTime2), CAST(N'2024-05-26T19:36:52.3500000' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'42c82ded-c363-45c9-c9a3-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 4, 10, 0, CAST(N'2024-05-26T19:36:52.2600000' AS DateTime2), CAST(N'2024-05-26T19:36:52.2600000' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'3c52d31b-d31b-4779-c9a4-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 4, 11, 0, CAST(N'2024-05-26T19:36:52.2600000' AS DateTime2), CAST(N'2024-05-26T19:36:52.2600000' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'3aa52124-7a30-4ea5-c9a5-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 4, 12, 0, CAST(N'2024-05-26T19:36:52.2600000' AS DateTime2), CAST(N'2024-05-26T19:36:52.2600000' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'03dae3cc-c159-4ff0-c9a6-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 4, 13, 0, CAST(N'2024-05-26T19:36:52.2033333' AS DateTime2), CAST(N'2024-05-26T19:36:52.2033333' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'897fdffa-2bdb-4e81-c9a7-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 4, 14, 0, CAST(N'2024-05-26T19:36:52.3033333' AS DateTime2), CAST(N'2024-05-26T19:36:52.3033333' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'365f521c-830f-4210-c9a8-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 4, 15, 0, CAST(N'2024-05-26T19:36:52.2600000' AS DateTime2), CAST(N'2024-05-26T19:36:52.2600000' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'54d5a589-b4d5-4a38-c9a9-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 4, 16, 0, CAST(N'2024-05-26T19:36:52.2833333' AS DateTime2), CAST(N'2024-05-26T19:36:52.2833333' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'ad834116-905a-4fb6-c9aa-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 4, 17, 0, CAST(N'2024-05-26T19:36:52.3500000' AS DateTime2), CAST(N'2024-05-26T19:36:52.3500000' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'd8a16b05-19a0-4073-c9ab-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 4, 18, 0, CAST(N'2024-05-26T19:36:52.3733333' AS DateTime2), CAST(N'2024-05-26T19:36:52.3733333' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'adfb2f7a-c5cf-4c38-c9ac-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 4, 19, 0, CAST(N'2024-05-26T19:36:52.3500000' AS DateTime2), CAST(N'2024-05-26T19:36:52.3500000' AS DateTime2))
GO
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'78ca875c-0d9b-4270-c9ad-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 5, 0, 0, CAST(N'2024-05-26T19:36:52.3033333' AS DateTime2), CAST(N'2024-05-26T19:36:52.3033333' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'2929183e-0b4c-487a-c9ae-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 6, 5, 1, 0, CAST(N'2024-05-26T19:36:52.2400000' AS DateTime2), CAST(N'2024-06-29T09:21:34.6784523' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'65df1c3f-02b0-467b-c9af-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 6, 5, 2, 0, CAST(N'2024-05-26T19:36:52.2833333' AS DateTime2), CAST(N'2024-06-29T09:21:29.8601029' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'5aada0e6-c224-441d-c9b0-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 5, 3, 0, CAST(N'2024-05-26T19:36:52.2833333' AS DateTime2), CAST(N'2024-05-26T19:36:52.2833333' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'56146328-1099-42e5-c9b1-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 5, 4, 0, CAST(N'2024-05-26T19:36:52.2833333' AS DateTime2), CAST(N'2024-05-26T19:36:52.2833333' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'83815548-a748-4252-c9b2-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 5, 5, 0, CAST(N'2024-05-26T19:36:52.3033333' AS DateTime2), CAST(N'2024-05-26T19:36:52.3033333' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'9b939885-feeb-43af-c9b3-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 5, 6, 0, CAST(N'2024-05-26T19:36:52.3266667' AS DateTime2), CAST(N'2024-05-26T19:36:52.3266667' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'950aaca4-0c9d-4c99-c9b4-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 5, 7, 0, CAST(N'2024-05-26T19:36:52.3266667' AS DateTime2), CAST(N'2024-05-26T19:36:52.3266667' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'c676ffad-92b9-4a3f-c9b5-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 5, 8, 0, CAST(N'2024-05-26T19:36:52.3733333' AS DateTime2), CAST(N'2024-05-26T19:36:52.3733333' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'700709dd-f98a-46f5-c9b6-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 5, 9, 0, CAST(N'2024-05-26T19:36:52.3033333' AS DateTime2), CAST(N'2024-05-26T19:36:52.3033333' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'c2268e56-eced-47e4-c9b7-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 5, 10, 0, CAST(N'2024-05-26T19:36:52.3733333' AS DateTime2), CAST(N'2024-05-26T19:36:52.3733333' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'89bd012f-5be9-4f38-c9b8-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 5, 11, 0, CAST(N'2024-05-26T19:36:52.3033333' AS DateTime2), CAST(N'2024-05-26T19:36:52.3033333' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'8be96d89-5006-4d31-c9b9-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 5, 12, 0, CAST(N'2024-05-26T19:36:52.3266667' AS DateTime2), CAST(N'2024-05-26T19:36:52.3266667' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'd44329fd-1b2d-4dd0-c9ba-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 5, 13, 0, CAST(N'2024-05-26T19:36:52.3733333' AS DateTime2), CAST(N'2024-05-26T19:36:52.3733333' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'998c51ca-48ae-4bb3-c9bb-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 5, 14, 0, CAST(N'2024-05-26T19:36:52.3266667' AS DateTime2), CAST(N'2024-05-26T19:36:52.3266667' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'fdf8969e-ac0b-48ae-c9bc-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 5, 15, 0, CAST(N'2024-05-26T19:36:52.4333333' AS DateTime2), CAST(N'2024-05-26T19:36:52.4333333' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'e53a1501-6417-4364-c9bd-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 5, 16, 0, CAST(N'2024-05-26T19:36:52.4033333' AS DateTime2), CAST(N'2024-05-26T19:36:52.4033333' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'c80d6856-889a-4f47-c9be-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 5, 17, 0, CAST(N'2024-05-26T19:36:52.3733333' AS DateTime2), CAST(N'2024-05-26T19:36:52.3733333' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'06323d4f-724b-4ee8-c9bf-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 5, 18, 0, CAST(N'2024-05-26T19:36:52.2033333' AS DateTime2), CAST(N'2024-05-26T19:36:52.2033333' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'2b8eb902-a604-45ff-c9c0-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 5, 19, 0, CAST(N'2024-05-26T19:36:52.2400000' AS DateTime2), CAST(N'2024-05-26T19:36:52.2400000' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'3af1590f-2135-4a62-c9c1-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 6, 0, 0, CAST(N'2024-05-26T19:36:52.2600000' AS DateTime2), CAST(N'2024-05-26T19:36:52.2600000' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'4a95fadd-d5a5-4cf5-c9c2-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 6, 1, 0, CAST(N'2024-05-26T19:36:52.2600000' AS DateTime2), CAST(N'2024-05-26T19:36:52.2600000' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'c137339f-3ac2-4815-c9c3-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 6, 2, 0, CAST(N'2024-05-26T19:36:52.3733333' AS DateTime2), CAST(N'2024-05-26T19:36:52.3733333' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'f47f6f7b-b577-4df1-c9c4-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 6, 3, 0, CAST(N'2024-05-26T19:36:52.4333333' AS DateTime2), CAST(N'2024-05-26T19:36:52.4333333' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'9b28fa9d-206c-4b68-c9c5-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 0, 6, 4, 0, CAST(N'2024-05-26T19:36:52.3266667' AS DateTime2), CAST(N'2024-05-26T19:51:02.3455936' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'b426c78d-8f12-4f1e-c9c6-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 6, 5, 0, CAST(N'2024-05-26T19:36:52.3500000' AS DateTime2), CAST(N'2024-05-26T19:36:52.3500000' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'd4d79052-ae80-4a25-c9c7-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 6, 6, 0, CAST(N'2024-05-26T19:36:52.3733333' AS DateTime2), CAST(N'2024-05-26T19:36:52.3733333' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'0647f136-b7ce-44ba-c9c8-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 6, 7, 0, CAST(N'2024-05-26T19:36:52.2033333' AS DateTime2), CAST(N'2024-05-26T19:36:52.2033333' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'17639fb5-4ef8-48f1-c9c9-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 6, 8, 0, CAST(N'2024-05-26T19:36:52.2400000' AS DateTime2), CAST(N'2024-05-26T19:36:52.2400000' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'5fee92c5-b71e-4050-c9ca-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 6, 9, 0, CAST(N'2024-05-26T19:36:52.2833333' AS DateTime2), CAST(N'2024-05-26T19:36:52.2833333' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'4119ceaf-efbd-47b5-c9cb-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 6, 10, 0, CAST(N'2024-05-26T19:36:52.2600000' AS DateTime2), CAST(N'2024-05-26T19:36:52.2600000' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'f34cab4a-1e93-4672-c9cc-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 6, 11, 0, CAST(N'2024-05-26T19:36:52.4033333' AS DateTime2), CAST(N'2024-05-26T19:36:52.4033333' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'7365fce2-5580-4281-c9cd-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 6, 12, 0, CAST(N'2024-05-26T19:36:52.3033333' AS DateTime2), CAST(N'2024-05-26T19:36:52.3033333' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'b3ddc9ed-0824-4bc9-c9ce-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 6, 13, 0, CAST(N'2024-05-26T19:36:52.3500000' AS DateTime2), CAST(N'2024-05-26T19:36:52.3500000' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'b53a53f0-e2e0-49e5-c9cf-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 6, 14, 0, CAST(N'2024-05-26T19:36:52.3500000' AS DateTime2), CAST(N'2024-05-26T19:36:52.3500000' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'd6c4cff6-1667-460b-c9d0-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 6, 15, 0, CAST(N'2024-05-26T19:36:52.3733333' AS DateTime2), CAST(N'2024-05-26T19:36:52.3733333' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'a8656855-673f-41bb-c9d1-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 6, 16, 0, CAST(N'2024-05-26T19:36:52.3500000' AS DateTime2), CAST(N'2024-05-26T19:36:52.3500000' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'11b410ac-d101-40b4-c9d2-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 6, 17, 0, CAST(N'2024-05-26T19:36:52.2033333' AS DateTime2), CAST(N'2024-05-26T19:36:52.2033333' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'c6c0174b-120d-4e73-c9d3-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 6, 18, 0, CAST(N'2024-05-26T19:36:52.3733333' AS DateTime2), CAST(N'2024-05-26T19:36:52.3733333' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'4fa328fe-d984-4f0f-c9d4-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 6, 19, 0, CAST(N'2024-05-26T19:36:52.2600000' AS DateTime2), CAST(N'2024-05-26T19:36:52.2600000' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'08808aed-980e-4313-c9d5-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 7, 0, 0, CAST(N'2024-05-26T19:36:52.2033333' AS DateTime2), CAST(N'2024-05-26T19:36:52.2033333' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'3fedb218-1fca-4b08-c9d6-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 7, 1, 0, CAST(N'2024-05-26T19:36:52.2600000' AS DateTime2), CAST(N'2024-05-26T19:36:52.2600000' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'bef7a9a0-eee1-4fde-c9d7-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 7, 2, 0, CAST(N'2024-05-26T19:36:52.3500000' AS DateTime2), CAST(N'2024-05-26T19:36:52.3500000' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'3e4f56ad-a230-4494-c9d8-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 7, 3, 0, CAST(N'2024-05-26T19:36:52.2600000' AS DateTime2), CAST(N'2024-05-26T19:36:52.2600000' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'029ad715-18a9-4ec8-c9d9-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 7, 4, 0, CAST(N'2024-05-26T19:36:52.2033333' AS DateTime2), CAST(N'2024-05-26T19:36:52.2033333' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'07b75113-07f7-4e9e-c9da-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 7, 5, 0, CAST(N'2024-05-26T19:36:52.2033333' AS DateTime2), CAST(N'2024-05-26T19:36:52.2033333' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'27aa4e4c-5592-4916-c9db-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 7, 6, 0, CAST(N'2024-05-26T19:36:52.2400000' AS DateTime2), CAST(N'2024-05-26T19:36:52.2400000' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'a134e542-03af-48fd-c9dc-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 7, 7, 0, CAST(N'2024-05-26T19:36:52.3266667' AS DateTime2), CAST(N'2024-05-26T19:36:52.3266667' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'b09404c7-17e8-4035-c9dd-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 7, 8, 0, CAST(N'2024-05-26T19:36:52.3500000' AS DateTime2), CAST(N'2024-05-26T19:36:52.3500000' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'18885174-eb2a-4a6b-c9de-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 7, 9, 0, CAST(N'2024-05-26T19:36:52.2400000' AS DateTime2), CAST(N'2024-05-26T19:36:52.2400000' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'f63f42b9-3d72-406c-c9df-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 7, 10, 0, CAST(N'2024-05-26T19:36:52.4333333' AS DateTime2), CAST(N'2024-05-26T19:36:52.4333333' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'57ea5120-65d5-4374-c9e0-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 7, 11, 0, CAST(N'2024-05-26T19:36:52.2833333' AS DateTime2), CAST(N'2024-05-26T19:36:52.2833333' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'595060a0-8161-4657-c9e1-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 7, 12, 0, CAST(N'2024-05-26T19:36:52.2833333' AS DateTime2), CAST(N'2024-05-26T19:36:52.2833333' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'dd2ba0f8-acf8-456d-c9e2-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 7, 13, 0, CAST(N'2024-05-26T19:36:52.4033333' AS DateTime2), CAST(N'2024-05-26T19:36:52.4033333' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'cdf044df-d2f8-4f3d-c9e3-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 7, 14, 0, CAST(N'2024-05-26T19:36:52.3733333' AS DateTime2), CAST(N'2024-05-26T19:36:52.3733333' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'4e22a712-5f4a-408d-c9e4-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 7, 15, 0, CAST(N'2024-05-26T19:36:52.2600000' AS DateTime2), CAST(N'2024-05-26T19:36:52.2600000' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'cfa8f468-66b0-4459-c9e5-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 7, 16, 0, CAST(N'2024-05-26T19:36:52.3733333' AS DateTime2), CAST(N'2024-05-26T19:36:52.3733333' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'088114c9-b031-4c3f-c9e6-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 7, 17, 0, CAST(N'2024-05-26T19:36:52.2033333' AS DateTime2), CAST(N'2024-05-26T19:36:52.2033333' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'4e5a834d-d115-484d-c9e7-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 7, 18, 0, CAST(N'2024-05-26T19:36:52.2600000' AS DateTime2), CAST(N'2024-05-26T19:36:52.2600000' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'31ef162c-9434-4c2c-c9e8-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 7, 19, 0, CAST(N'2024-05-26T19:36:52.2400000' AS DateTime2), CAST(N'2024-05-26T19:36:52.2400000' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'e2431f82-fab7-4050-c9e9-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 8, 0, 0, CAST(N'2024-05-26T19:36:52.4033333' AS DateTime2), CAST(N'2024-05-26T19:36:52.4033333' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'64fc6f4c-c674-43c3-c9ea-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 8, 1, 0, CAST(N'2024-05-26T19:36:52.2833333' AS DateTime2), CAST(N'2024-05-26T19:36:52.2833333' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'6a664e13-5e1d-4c37-c9eb-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 6, 8, 2, 0, CAST(N'2024-05-26T19:36:52.2833333' AS DateTime2), CAST(N'2024-05-26T19:56:03.4104641' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'c4c2d445-7f0e-4db5-c9ec-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 8, 3, 0, CAST(N'2024-05-26T19:36:52.3733333' AS DateTime2), CAST(N'2024-05-26T19:36:52.3733333' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'964f4d06-f886-4372-c9ed-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 8, 4, 0, CAST(N'2024-05-26T19:36:52.3266667' AS DateTime2), CAST(N'2024-05-26T19:36:52.3266667' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'df621f2c-68ab-4c33-c9ee-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 8, 5, 0, CAST(N'2024-05-26T19:36:52.4033333' AS DateTime2), CAST(N'2024-05-26T19:36:52.4033333' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'bb7e09e2-2fc2-4948-c9ef-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 8, 6, 0, CAST(N'2024-05-26T19:36:52.3500000' AS DateTime2), CAST(N'2024-05-26T19:36:52.3500000' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'afb63a6a-fed7-4644-c9f0-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 8, 7, 0, CAST(N'2024-05-26T19:36:52.3500000' AS DateTime2), CAST(N'2024-05-26T19:36:52.3500000' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'7f539410-d8ef-486f-c9f1-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 8, 8, 0, CAST(N'2024-05-26T19:36:52.3033333' AS DateTime2), CAST(N'2024-05-26T19:36:52.3033333' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'9cab2a25-0ea3-4966-c9f2-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 8, 9, 0, CAST(N'2024-05-26T19:36:52.3266667' AS DateTime2), CAST(N'2024-05-26T19:36:52.3266667' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'86cb540d-12a5-4758-c9f3-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 8, 10, 0, CAST(N'2024-05-26T19:36:52.3033333' AS DateTime2), CAST(N'2024-05-26T19:36:52.3033333' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'0a38704e-9d50-419f-c9f4-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 8, 11, 0, CAST(N'2024-05-26T19:36:52.2033333' AS DateTime2), CAST(N'2024-05-26T19:36:52.2033333' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'532417da-af37-48b3-c9f5-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 8, 12, 0, CAST(N'2024-05-26T19:36:52.2833333' AS DateTime2), CAST(N'2024-05-26T19:36:52.2833333' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'cf3376ff-3461-4c92-c9f6-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 8, 13, 0, CAST(N'2024-05-26T19:36:52.3733333' AS DateTime2), CAST(N'2024-05-26T19:36:52.3733333' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'dea7d08a-86c0-4370-c9f7-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 8, 14, 0, CAST(N'2024-05-26T19:36:52.4033333' AS DateTime2), CAST(N'2024-05-26T19:36:52.4033333' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'af281de6-9450-4aa9-c9f8-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 8, 15, 0, CAST(N'2024-05-26T19:36:52.3500000' AS DateTime2), CAST(N'2024-05-26T19:36:52.3500000' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'c0ba7056-1b7a-4eac-c9f9-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 8, 16, 0, CAST(N'2024-05-26T19:36:52.3500000' AS DateTime2), CAST(N'2024-05-26T19:36:52.3500000' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'6f12ff2a-f9c3-489d-c9fa-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 8, 17, 0, CAST(N'2024-05-26T19:36:52.2833333' AS DateTime2), CAST(N'2024-05-26T19:36:52.2833333' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'd261d591-9f0b-4798-c9fb-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 8, 18, 0, CAST(N'2024-05-26T19:36:52.3733333' AS DateTime2), CAST(N'2024-05-26T19:36:52.3733333' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'8b410834-3499-489e-c9fc-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 8, 19, 0, CAST(N'2024-05-26T19:36:52.3033333' AS DateTime2), CAST(N'2024-05-26T19:36:52.3033333' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'0961b1c9-f964-43ff-c9fd-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 6, 9, 0, 0, CAST(N'2024-05-26T19:36:52.2033333' AS DateTime2), CAST(N'2024-05-26T19:56:32.9668556' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'79807813-e2f4-4270-c9fe-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 9, 1, 0, CAST(N'2024-05-26T19:36:52.3033333' AS DateTime2), CAST(N'2024-05-26T19:36:52.3033333' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'f0151dbe-9294-4f92-c9ff-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 9, 2, 0, CAST(N'2024-05-26T19:36:52.4033333' AS DateTime2), CAST(N'2024-05-26T19:36:52.4033333' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'355fae27-8055-4355-ca00-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 9, 3, 0, CAST(N'2024-05-26T19:36:52.2400000' AS DateTime2), CAST(N'2024-05-26T19:36:52.2400000' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'ea49204d-4476-437e-ca01-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 9, 4, 0, CAST(N'2024-05-26T19:36:52.4033333' AS DateTime2), CAST(N'2024-05-26T19:36:52.4033333' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'be1c9d39-894a-4077-ca02-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 9, 5, 0, CAST(N'2024-05-26T19:36:52.3500000' AS DateTime2), CAST(N'2024-05-26T19:36:52.3500000' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'8385c61c-a867-4350-ca03-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 9, 6, 0, CAST(N'2024-05-26T19:36:52.3033333' AS DateTime2), CAST(N'2024-05-26T19:36:52.3033333' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'fef90221-c761-456a-ca04-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 9, 7, 0, CAST(N'2024-05-26T19:36:52.4333333' AS DateTime2), CAST(N'2024-05-26T19:36:52.4333333' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'fc7ea985-168e-4515-ca05-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 9, 8, 0, CAST(N'2024-05-26T19:36:52.4333333' AS DateTime2), CAST(N'2024-05-26T19:36:52.4333333' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'03ba8204-cfde-4e2d-ca06-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 9, 9, 0, CAST(N'2024-05-26T19:36:52.2033333' AS DateTime2), CAST(N'2024-05-26T19:36:52.2033333' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'e3a0d587-f6a8-475f-ca07-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 9, 10, 0, CAST(N'2024-05-26T19:36:52.4033333' AS DateTime2), CAST(N'2024-05-26T19:36:52.4033333' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'793481d7-ccce-444c-ca08-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 9, 11, 0, CAST(N'2024-05-26T19:36:52.3033333' AS DateTime2), CAST(N'2024-05-26T19:36:52.3033333' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'213dab65-80ba-46e6-ca09-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 9, 12, 0, CAST(N'2024-05-26T19:36:52.2400000' AS DateTime2), CAST(N'2024-05-26T19:36:52.2400000' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'3c61fcc0-9da3-422a-ca0a-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 9, 13, 0, CAST(N'2024-05-26T19:36:52.2600000' AS DateTime2), CAST(N'2024-05-26T19:36:52.2600000' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'69660d96-f2dc-40ab-ca0b-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 9, 14, 0, CAST(N'2024-05-26T19:36:52.2833333' AS DateTime2), CAST(N'2024-05-26T19:36:52.2833333' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'baebb2d2-1efd-4b5c-ca0c-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 9, 15, 0, CAST(N'2024-05-26T19:36:52.3500000' AS DateTime2), CAST(N'2024-05-26T19:36:52.3500000' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'49b59649-9537-43d1-ca0d-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 9, 16, 0, CAST(N'2024-05-26T19:36:52.2600000' AS DateTime2), CAST(N'2024-05-26T19:36:52.2600000' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'50129dd3-dfe6-4554-ca0e-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 9, 17, 0, CAST(N'2024-05-26T19:36:52.2600000' AS DateTime2), CAST(N'2024-05-26T19:36:52.2600000' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'f7aded97-de8d-44b8-ca0f-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 9, 18, 0, CAST(N'2024-05-26T19:36:52.4333333' AS DateTime2), CAST(N'2024-05-26T19:36:52.4333333' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'025fbc9b-0990-49df-ca10-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 9, 19, 0, CAST(N'2024-05-26T19:36:52.2033333' AS DateTime2), CAST(N'2024-05-26T19:36:52.2033333' AS DateTime2))
GO
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'c178a042-7e7f-4130-ca11-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 10, 0, 0, CAST(N'2024-05-26T19:36:52.3733333' AS DateTime2), CAST(N'2024-05-26T19:36:52.3733333' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'eaef7686-c181-4268-ca12-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 10, 1, 0, CAST(N'2024-05-26T19:36:52.4033333' AS DateTime2), CAST(N'2024-05-26T19:36:52.4033333' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'f9e912f4-a8f6-4b00-ca13-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 10, 2, 0, CAST(N'2024-05-26T19:36:52.4333333' AS DateTime2), CAST(N'2024-05-26T19:36:52.4333333' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'939a3450-041f-43f2-ca14-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 10, 3, 0, CAST(N'2024-05-26T19:36:52.3266667' AS DateTime2), CAST(N'2024-05-26T19:36:52.3266667' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'f7ae29ac-c29f-4973-ca15-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 10, 4, 0, CAST(N'2024-05-26T19:36:52.4333333' AS DateTime2), CAST(N'2024-05-26T19:36:52.4333333' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'a2373489-6963-4bc1-ca16-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 10, 5, 0, CAST(N'2024-05-26T19:36:52.3266667' AS DateTime2), CAST(N'2024-05-26T19:36:52.3266667' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'a875eb4c-0cff-4261-ca17-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 10, 6, 0, CAST(N'2024-05-26T19:36:52.3500000' AS DateTime2), CAST(N'2024-05-26T19:36:52.3500000' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'ad9dadb9-8431-4dac-ca18-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 10, 7, 0, CAST(N'2024-05-26T19:36:52.3500000' AS DateTime2), CAST(N'2024-05-26T19:36:52.3500000' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'45cc9ca6-ecb9-4e61-ca19-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 10, 8, 0, CAST(N'2024-05-26T19:36:52.2600000' AS DateTime2), CAST(N'2024-05-26T19:36:52.2600000' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'951b2d8c-0efd-42c4-ca1a-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 10, 9, 0, CAST(N'2024-05-26T19:36:52.3266667' AS DateTime2), CAST(N'2024-05-26T19:36:52.3266667' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'9a48dafa-2a2e-4334-ca1b-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 10, 10, 0, CAST(N'2024-05-26T19:36:52.3266667' AS DateTime2), CAST(N'2024-05-26T19:36:52.3266667' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'3444c5da-e997-4e5b-ca1c-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 10, 11, 0, CAST(N'2024-05-26T19:36:52.2400000' AS DateTime2), CAST(N'2024-05-26T19:36:52.2400000' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'3ce2ef95-18ca-47d9-ca1d-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 10, 12, 0, CAST(N'2024-05-26T19:36:52.2600000' AS DateTime2), CAST(N'2024-05-26T19:36:52.2600000' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'22da20bc-3d32-4300-ca1e-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 10, 13, 0, CAST(N'2024-05-26T19:36:52.2400000' AS DateTime2), CAST(N'2024-05-26T19:36:52.2400000' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'eed307f6-407a-4157-ca1f-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 10, 14, 0, CAST(N'2024-05-26T19:36:52.4033333' AS DateTime2), CAST(N'2024-05-26T19:36:52.4033333' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'507b5ba8-50f0-4792-ca20-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 10, 15, 0, CAST(N'2024-05-26T19:36:52.2833333' AS DateTime2), CAST(N'2024-05-26T19:36:52.2833333' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'2c6b5eae-6006-4343-ca21-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 10, 16, 0, CAST(N'2024-05-26T19:36:52.2400000' AS DateTime2), CAST(N'2024-05-26T19:36:52.2400000' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'e124bf6e-f010-4021-ca22-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 10, 17, 0, CAST(N'2024-05-26T19:36:52.4033333' AS DateTime2), CAST(N'2024-05-26T19:36:52.4033333' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'1da79cc5-77a9-4a40-ca23-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 10, 18, 0, CAST(N'2024-05-26T19:36:52.2400000' AS DateTime2), CAST(N'2024-05-26T19:36:52.2400000' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'982f4f68-8027-4c95-ca24-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 10, 19, 0, CAST(N'2024-05-26T19:36:52.3266667' AS DateTime2), CAST(N'2024-05-26T19:36:52.3266667' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'f38d5f91-1eb4-4938-ca25-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 11, 0, 0, CAST(N'2024-05-26T19:36:52.4333333' AS DateTime2), CAST(N'2024-05-26T19:36:52.4333333' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'09c3912d-ef67-4123-ca26-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 11, 1, 0, CAST(N'2024-05-26T19:36:52.2033333' AS DateTime2), CAST(N'2024-05-26T19:36:52.2033333' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'03c8797b-d732-42d1-ca27-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 11, 2, 0, CAST(N'2024-05-26T19:36:52.2033333' AS DateTime2), CAST(N'2024-05-26T19:36:52.2033333' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'3b1cd7ed-2635-4344-ca28-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 11, 3, 0, CAST(N'2024-05-26T19:36:52.2600000' AS DateTime2), CAST(N'2024-05-26T19:36:52.2600000' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'6086c1d9-7213-4722-ca29-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 11, 4, 0, CAST(N'2024-05-26T19:36:52.2833333' AS DateTime2), CAST(N'2024-05-26T19:36:52.2833333' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'742eabf9-e6c6-4b54-ca2a-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 11, 5, 0, CAST(N'2024-05-26T19:36:52.3033333' AS DateTime2), CAST(N'2024-05-26T19:36:52.3033333' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'fe28f32d-ed95-4fad-ca2b-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 11, 6, 0, CAST(N'2024-05-26T19:36:52.4333333' AS DateTime2), CAST(N'2024-05-26T19:36:52.4333333' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'29da1f23-f4a1-4daf-ca2c-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 11, 7, 0, CAST(N'2024-05-26T19:36:52.2400000' AS DateTime2), CAST(N'2024-05-26T19:36:52.2400000' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'167a4500-fac3-47a9-ca2d-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 11, 8, 0, CAST(N'2024-05-26T19:36:52.2400000' AS DateTime2), CAST(N'2024-05-26T19:36:52.2400000' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'a1bb3903-a80c-4a6b-ca2e-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 11, 9, 0, CAST(N'2024-05-26T19:36:52.3266667' AS DateTime2), CAST(N'2024-05-26T19:36:52.3266667' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'48bac8b3-f74f-4e32-ca2f-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 11, 10, 0, CAST(N'2024-05-26T19:36:52.2600000' AS DateTime2), CAST(N'2024-05-26T19:36:52.2600000' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'6876f117-3713-4089-ca30-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 11, 11, 0, CAST(N'2024-05-26T19:36:52.2833333' AS DateTime2), CAST(N'2024-05-26T19:36:52.2833333' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'8bad7170-77c9-4fc3-ca31-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 11, 12, 0, CAST(N'2024-05-26T19:36:52.3033333' AS DateTime2), CAST(N'2024-05-26T19:36:52.3033333' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'0db89e8d-ca11-439f-ca32-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 11, 13, 0, CAST(N'2024-05-26T19:36:52.2033333' AS DateTime2), CAST(N'2024-05-26T19:36:52.2033333' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'28b3f649-9d62-425e-ca33-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 11, 14, 0, CAST(N'2024-05-26T19:36:52.2400000' AS DateTime2), CAST(N'2024-05-26T19:36:52.2400000' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'e02b4694-8abe-43a1-ca34-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 11, 15, 0, CAST(N'2024-05-26T19:36:52.4033333' AS DateTime2), CAST(N'2024-05-26T19:36:52.4033333' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'1907e99d-8f3b-46a5-ca35-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 11, 16, 0, CAST(N'2024-05-26T19:36:52.2400000' AS DateTime2), CAST(N'2024-05-26T19:36:52.2400000' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'a3a13aaf-c80a-42dd-ca36-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 11, 17, 0, CAST(N'2024-05-26T19:36:52.3266667' AS DateTime2), CAST(N'2024-05-26T19:36:52.3266667' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'c89de8ac-55eb-47d0-ca37-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 11, 18, 0, CAST(N'2024-05-26T19:36:52.3733333' AS DateTime2), CAST(N'2024-05-26T19:36:52.3733333' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'92a67f1d-1a07-412a-ca38-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 11, 19, 0, CAST(N'2024-05-26T19:36:52.3266667' AS DateTime2), CAST(N'2024-05-26T19:36:52.3266667' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'ed2554ff-b68d-4028-ca39-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 12, 0, 0, CAST(N'2024-05-26T19:36:52.4033333' AS DateTime2), CAST(N'2024-05-26T19:36:52.4033333' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'ca8b338b-97a8-403d-ca3a-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 12, 1, 0, CAST(N'2024-05-26T19:36:52.3733333' AS DateTime2), CAST(N'2024-05-26T19:36:52.3733333' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'49cb50e0-8584-45d2-ca3b-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 12, 2, 0, CAST(N'2024-05-26T19:36:52.2600000' AS DateTime2), CAST(N'2024-05-26T19:36:52.2600000' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'b0e10ded-a79b-434b-ca3c-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 12, 3, 0, CAST(N'2024-05-26T19:36:52.3500000' AS DateTime2), CAST(N'2024-05-26T19:36:52.3500000' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'e753b6e9-ba9b-4713-ca3d-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 1, 12, 4, 0, CAST(N'2024-05-26T19:36:52.4033333' AS DateTime2), CAST(N'2024-05-26T19:56:30.1236245' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'ebb8ea25-461d-42db-ca3e-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 12, 5, 0, CAST(N'2024-05-26T19:36:52.4033333' AS DateTime2), CAST(N'2024-05-26T19:36:52.4033333' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'c7088524-3a3d-46e1-ca3f-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 12, 6, 0, CAST(N'2024-05-26T19:36:52.3733333' AS DateTime2), CAST(N'2024-05-26T19:36:52.3733333' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'db9caf34-95d7-4194-ca40-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 12, 7, 0, CAST(N'2024-05-26T19:36:52.4033333' AS DateTime2), CAST(N'2024-05-26T19:36:52.4033333' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'5fc693dd-dd27-4a67-ca41-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 12, 8, 0, CAST(N'2024-05-26T19:36:52.2833333' AS DateTime2), CAST(N'2024-05-26T19:36:52.2833333' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'84fac54e-f392-442d-ca42-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 12, 9, 0, CAST(N'2024-05-26T19:36:52.3033333' AS DateTime2), CAST(N'2024-05-26T19:36:52.3033333' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'8a6d7f80-f473-4153-ca43-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 12, 10, 0, CAST(N'2024-05-26T19:36:52.3033333' AS DateTime2), CAST(N'2024-05-26T19:36:52.3033333' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'd968f07d-82cf-4790-ca44-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 12, 11, 0, CAST(N'2024-05-26T19:36:52.3733333' AS DateTime2), CAST(N'2024-05-26T19:36:52.3733333' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'dc896b9b-958f-4eb2-ca45-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 12, 12, 0, CAST(N'2024-05-26T19:36:52.4033333' AS DateTime2), CAST(N'2024-05-26T19:36:52.4033333' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'116aed3f-b1de-4dca-ca46-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 12, 13, 0, CAST(N'2024-05-26T19:36:52.2033333' AS DateTime2), CAST(N'2024-05-26T19:36:52.2033333' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'c3f974ca-8308-45dc-ca47-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 12, 14, 0, CAST(N'2024-05-26T19:36:52.3733333' AS DateTime2), CAST(N'2024-05-26T19:36:52.3733333' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'e58205db-2586-44fd-ca48-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 12, 15, 0, CAST(N'2024-05-26T19:36:52.4033333' AS DateTime2), CAST(N'2024-05-26T19:36:52.4033333' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'40437443-32c9-4032-ca49-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 12, 16, 0, CAST(N'2024-05-26T19:36:52.2600000' AS DateTime2), CAST(N'2024-05-26T19:36:52.2600000' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'a5ea6e1a-793f-43ed-ca4a-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 12, 17, 0, CAST(N'2024-05-26T19:36:52.3500000' AS DateTime2), CAST(N'2024-05-26T19:36:52.3500000' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'7238eabd-d0c0-4f8d-ca4b-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 12, 18, 0, CAST(N'2024-05-26T19:36:52.3033333' AS DateTime2), CAST(N'2024-05-26T19:36:52.3033333' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'dd917bd7-df81-4e7f-ca4c-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 12, 19, 0, CAST(N'2024-05-26T19:36:52.4033333' AS DateTime2), CAST(N'2024-05-26T19:36:52.4033333' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'27105baa-01b5-4216-ca4d-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 13, 0, 0, CAST(N'2024-05-26T19:36:52.2400000' AS DateTime2), CAST(N'2024-05-26T19:36:52.2400000' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'0e5ca3d6-489a-473a-ca4e-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 13, 1, 0, CAST(N'2024-05-26T19:36:52.2033333' AS DateTime2), CAST(N'2024-05-26T19:36:52.2033333' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'1f8cd544-a8b1-4616-ca4f-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 0, 13, 2, 0, CAST(N'2024-05-26T19:36:52.2400000' AS DateTime2), CAST(N'2024-05-26T19:51:05.8056225' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'f0e42da7-b6f8-4e3c-ca50-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 13, 3, 0, CAST(N'2024-05-26T19:36:52.4033333' AS DateTime2), CAST(N'2024-05-26T19:36:52.4033333' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'97c25fab-cab7-4788-ca51-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 13, 4, 0, CAST(N'2024-05-26T19:36:52.3266667' AS DateTime2), CAST(N'2024-05-26T19:36:52.3266667' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'f87fbf1a-74c6-4749-ca52-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 13, 5, 0, CAST(N'2024-05-26T19:36:52.4333333' AS DateTime2), CAST(N'2024-05-26T19:36:52.4333333' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'a918f902-5e63-4f2b-ca53-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 13, 6, 0, CAST(N'2024-05-26T19:36:52.3500000' AS DateTime2), CAST(N'2024-05-26T19:36:52.3500000' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'f0b8559c-ff65-4922-ca54-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 13, 7, 0, CAST(N'2024-05-26T19:36:52.4033333' AS DateTime2), CAST(N'2024-05-26T19:36:52.4033333' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'20973ee2-c646-4dc5-ca55-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 13, 8, 0, CAST(N'2024-05-26T19:36:52.2400000' AS DateTime2), CAST(N'2024-05-26T19:36:52.2400000' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'10852a1b-5cd5-4e7c-ca56-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 13, 9, 0, CAST(N'2024-05-26T19:36:52.2033333' AS DateTime2), CAST(N'2024-05-26T19:36:52.2033333' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'aa098ceb-482f-45ac-ca57-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 13, 10, 0, CAST(N'2024-05-26T19:36:52.3500000' AS DateTime2), CAST(N'2024-05-26T19:36:52.3500000' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'37fddbb6-4e8a-4b18-ca58-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 13, 11, 0, CAST(N'2024-05-26T19:36:52.2600000' AS DateTime2), CAST(N'2024-05-26T19:36:52.2600000' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'eef477ed-35eb-447d-ca59-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 13, 12, 0, CAST(N'2024-05-26T19:36:52.4033333' AS DateTime2), CAST(N'2024-05-26T19:36:52.4033333' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'bc661c58-91b8-47a5-ca5a-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 13, 13, 0, CAST(N'2024-05-26T19:36:52.3500000' AS DateTime2), CAST(N'2024-05-26T19:36:52.3500000' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'cd70e790-8fbe-4b56-ca5b-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 13, 14, 0, CAST(N'2024-05-26T19:36:52.3733333' AS DateTime2), CAST(N'2024-05-26T19:36:52.3733333' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'493f1479-e83c-4060-ca5c-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 13, 15, 0, CAST(N'2024-05-26T19:36:52.2600000' AS DateTime2), CAST(N'2024-05-26T19:36:52.2600000' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'f629c2a4-3cc6-4e08-ca5d-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 13, 16, 0, CAST(N'2024-05-26T19:36:52.4333333' AS DateTime2), CAST(N'2024-05-26T19:36:52.4333333' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'8f556bea-e221-4c69-ca5e-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 13, 17, 0, CAST(N'2024-05-26T19:36:52.3266667' AS DateTime2), CAST(N'2024-05-26T19:36:52.3266667' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'993b6842-9c91-4541-ca5f-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 13, 18, 0, CAST(N'2024-05-26T19:36:52.3266667' AS DateTime2), CAST(N'2024-05-26T19:36:52.3266667' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'cacfc22a-f0bc-473e-ca60-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 13, 19, 0, CAST(N'2024-05-26T19:36:52.3733333' AS DateTime2), CAST(N'2024-05-26T19:36:52.3733333' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'b83f8b2e-be84-4cf5-ca61-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 14, 0, 0, CAST(N'2024-05-26T19:36:52.3500000' AS DateTime2), CAST(N'2024-05-26T19:36:52.3500000' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'081d0bee-0ab7-4b2a-ca62-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 14, 1, 0, CAST(N'2024-05-26T19:36:52.2033333' AS DateTime2), CAST(N'2024-05-26T19:36:52.2033333' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'e403813d-e974-4059-ca63-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 14, 2, 0, CAST(N'2024-05-26T19:36:52.4033333' AS DateTime2), CAST(N'2024-05-26T19:36:52.4033333' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'984660d3-2d62-499e-ca64-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 14, 3, 0, CAST(N'2024-05-26T19:36:52.3266667' AS DateTime2), CAST(N'2024-05-26T19:36:52.3266667' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'cc61835b-9cad-4d6e-ca65-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 14, 4, 0, CAST(N'2024-05-26T19:36:52.3733333' AS DateTime2), CAST(N'2024-05-26T19:36:52.3733333' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'40d97f7b-c66f-4fcd-ca66-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 14, 5, 0, CAST(N'2024-05-26T19:36:52.2600000' AS DateTime2), CAST(N'2024-05-26T19:36:52.2600000' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'839f36a6-26ee-43a6-ca67-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 14, 6, 0, CAST(N'2024-05-26T19:36:52.3033333' AS DateTime2), CAST(N'2024-05-26T19:36:52.3033333' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'14b7300d-d0ae-4308-ca68-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 14, 7, 0, CAST(N'2024-05-26T19:36:52.2033333' AS DateTime2), CAST(N'2024-05-26T19:36:52.2033333' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'3747715f-ada9-4d23-ca69-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 14, 8, 0, CAST(N'2024-05-26T19:36:52.2600000' AS DateTime2), CAST(N'2024-05-26T19:36:52.2600000' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'dd28bc92-49be-4bde-ca6a-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 14, 9, 0, CAST(N'2024-05-26T19:36:52.4033333' AS DateTime2), CAST(N'2024-05-26T19:36:52.4033333' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'68ef7d52-4164-42fa-ca6b-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 14, 10, 0, CAST(N'2024-05-26T19:36:52.2833333' AS DateTime2), CAST(N'2024-05-26T19:36:52.2833333' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'284c82ce-482c-475c-ca6c-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 14, 11, 0, CAST(N'2024-05-26T19:36:52.2400000' AS DateTime2), CAST(N'2024-05-26T19:36:52.2400000' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'5f5122ae-cf8c-4065-ca6d-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 14, 12, 0, CAST(N'2024-05-26T19:36:52.2833333' AS DateTime2), CAST(N'2024-05-26T19:36:52.2833333' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'54165e39-1da0-4e0f-ca6e-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 14, 13, 0, CAST(N'2024-05-26T19:36:52.2833333' AS DateTime2), CAST(N'2024-05-26T19:36:52.2833333' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'4dffa11f-7f4b-4a4c-ca6f-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 14, 14, 0, CAST(N'2024-05-26T19:36:52.2600000' AS DateTime2), CAST(N'2024-05-26T19:36:52.2600000' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'94e123f1-9ef9-403f-ca70-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 14, 15, 0, CAST(N'2024-05-26T19:36:52.3266667' AS DateTime2), CAST(N'2024-05-26T19:36:52.3266667' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'342b3733-df75-43ba-ca71-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 14, 16, 0, CAST(N'2024-05-26T19:36:52.2400000' AS DateTime2), CAST(N'2024-05-26T19:36:52.2400000' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'94fa1c0a-d12b-4e57-ca72-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 14, 17, 0, CAST(N'2024-05-26T19:36:52.3266667' AS DateTime2), CAST(N'2024-05-26T19:36:52.3266667' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'1342d48d-c2e6-443f-ca73-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 14, 18, 0, CAST(N'2024-05-26T19:36:52.2033333' AS DateTime2), CAST(N'2024-05-26T19:36:52.2033333' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'0f020480-bf4d-4b36-ca74-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 14, 19, 0, CAST(N'2024-05-26T19:36:52.2033333' AS DateTime2), CAST(N'2024-05-26T19:36:52.2033333' AS DateTime2))
GO
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'8c1bfff7-4654-42e5-ca75-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 15, 0, 0, CAST(N'2024-05-26T19:36:52.3266667' AS DateTime2), CAST(N'2024-05-26T19:36:52.3266667' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'fce403bb-8da0-4dd5-ca76-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 15, 1, 0, CAST(N'2024-05-26T19:36:52.4333333' AS DateTime2), CAST(N'2024-05-26T19:36:52.4333333' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'bc09ad10-d275-4486-ca77-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 15, 2, 0, CAST(N'2024-05-26T19:36:52.3500000' AS DateTime2), CAST(N'2024-05-26T19:36:52.3500000' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'3241a9f6-acc1-46ef-ca78-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 15, 3, 0, CAST(N'2024-05-26T19:36:52.2400000' AS DateTime2), CAST(N'2024-05-26T19:36:52.2400000' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'7cef68a3-4880-47f8-ca79-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 15, 4, 0, CAST(N'2024-05-26T19:36:52.3033333' AS DateTime2), CAST(N'2024-05-26T19:36:52.3033333' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'408b8757-fc64-4b2b-ca7a-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 15, 5, 0, CAST(N'2024-05-26T19:36:52.2600000' AS DateTime2), CAST(N'2024-05-26T19:36:52.2600000' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'0cbbab6c-a262-414e-ca7b-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 15, 6, 0, CAST(N'2024-05-26T19:36:52.2033333' AS DateTime2), CAST(N'2024-05-26T19:36:52.2033333' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'7619e3b0-92ce-4719-ca7c-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 15, 7, 0, CAST(N'2024-05-26T19:36:52.3033333' AS DateTime2), CAST(N'2024-05-26T19:36:52.3033333' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'8d1ffa97-b8a8-44a4-ca7d-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 15, 8, 0, CAST(N'2024-05-26T19:36:52.3266667' AS DateTime2), CAST(N'2024-05-26T19:36:52.3266667' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'05db3772-ff76-4c35-ca7e-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 15, 9, 0, CAST(N'2024-05-26T19:36:52.2033333' AS DateTime2), CAST(N'2024-05-26T19:36:52.2033333' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'a53f4c89-89e5-44ea-ca7f-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 15, 10, 0, CAST(N'2024-05-26T19:36:52.3500000' AS DateTime2), CAST(N'2024-05-26T19:36:52.3500000' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'9fe17df5-f718-4501-ca80-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 15, 11, 0, CAST(N'2024-05-26T19:36:52.3266667' AS DateTime2), CAST(N'2024-05-26T19:36:52.3266667' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'25eaac5c-6bfa-4cc5-ca81-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 15, 12, 0, CAST(N'2024-05-26T19:36:52.2400000' AS DateTime2), CAST(N'2024-05-26T19:36:52.2400000' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'6e603a20-564c-4a08-ca82-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 15, 13, 0, CAST(N'2024-05-26T19:36:52.2833333' AS DateTime2), CAST(N'2024-05-26T19:36:52.2833333' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'6f8e6c1b-82bb-4706-ca83-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 15, 14, 0, CAST(N'2024-05-26T19:36:52.3033333' AS DateTime2), CAST(N'2024-05-26T19:36:52.3033333' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'32454761-0b2f-4567-ca84-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 15, 15, 0, CAST(N'2024-05-26T19:36:52.2400000' AS DateTime2), CAST(N'2024-05-26T19:36:52.2400000' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'23719c87-aa5a-43f0-ca85-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 15, 16, 0, CAST(N'2024-05-26T19:36:52.2400000' AS DateTime2), CAST(N'2024-05-26T19:36:52.2400000' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'9fceb2c9-02ba-41ed-ca86-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 15, 17, 0, CAST(N'2024-05-26T19:36:52.3266667' AS DateTime2), CAST(N'2024-05-26T19:36:52.3266667' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'799e273d-50ee-489e-ca87-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 15, 18, 0, CAST(N'2024-05-26T19:36:52.3033333' AS DateTime2), CAST(N'2024-05-26T19:36:52.3033333' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'0be8ab8b-2f19-4340-ca88-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 15, 19, 0, CAST(N'2024-05-26T19:36:52.2033333' AS DateTime2), CAST(N'2024-05-26T19:36:52.2033333' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'9bba8ca5-3ceb-48b5-ca89-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 16, 0, 0, CAST(N'2024-05-26T19:36:52.3266667' AS DateTime2), CAST(N'2024-05-26T19:36:52.3266667' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'19b247ad-0617-42fa-ca8a-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 16, 1, 0, CAST(N'2024-05-26T19:36:52.2400000' AS DateTime2), CAST(N'2024-05-26T19:36:52.2400000' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'781e03e2-fe76-4b22-ca8b-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 16, 2, 0, CAST(N'2024-05-26T19:36:52.3033333' AS DateTime2), CAST(N'2024-05-26T19:36:52.3033333' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'c980d142-932f-43cb-ca8c-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 16, 3, 0, CAST(N'2024-05-26T19:36:52.3733333' AS DateTime2), CAST(N'2024-05-26T19:36:52.3733333' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'dbe407f3-1a95-4be8-ca8d-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 16, 4, 0, CAST(N'2024-05-26T19:36:52.4033333' AS DateTime2), CAST(N'2024-05-26T19:36:52.4033333' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'99d0ff72-c560-4b99-ca8e-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 16, 5, 0, CAST(N'2024-05-26T19:36:52.3266667' AS DateTime2), CAST(N'2024-05-26T19:36:52.3266667' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'8c74c716-a777-48db-ca8f-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 16, 6, 0, CAST(N'2024-05-26T19:36:52.3266667' AS DateTime2), CAST(N'2024-05-26T19:36:52.3266667' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'641fa020-b299-4fbf-ca90-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 16, 7, 0, CAST(N'2024-05-26T19:36:52.2833333' AS DateTime2), CAST(N'2024-05-26T19:36:52.2833333' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'55f5ee3e-f6d8-4470-ca91-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 16, 8, 0, CAST(N'2024-05-26T19:36:52.2833333' AS DateTime2), CAST(N'2024-05-26T19:36:52.2833333' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'f9bb99ea-4c3c-4896-ca92-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 16, 9, 0, CAST(N'2024-05-26T19:36:52.4333333' AS DateTime2), CAST(N'2024-05-26T19:36:52.4333333' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'ba24306f-149e-4717-ca93-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 16, 10, 0, CAST(N'2024-05-26T19:36:52.3500000' AS DateTime2), CAST(N'2024-05-26T19:36:52.3500000' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'f3653fd1-b371-4dd9-ca94-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 16, 11, 0, CAST(N'2024-05-26T19:36:52.4333333' AS DateTime2), CAST(N'2024-05-26T19:36:52.4333333' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'e9b92a91-0b35-4eaf-ca95-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 16, 12, 0, CAST(N'2024-05-26T19:36:52.4033333' AS DateTime2), CAST(N'2024-05-26T19:36:52.4033333' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'd6d5a910-a972-412c-ca96-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 16, 13, 0, CAST(N'2024-05-26T19:36:52.3733333' AS DateTime2), CAST(N'2024-05-26T19:36:52.3733333' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'5a80fbf0-84e5-49db-ca97-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 16, 14, 0, CAST(N'2024-05-26T19:36:52.2833333' AS DateTime2), CAST(N'2024-05-26T19:36:52.2833333' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'ffb727fa-bef0-4ed5-ca98-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 16, 15, 0, CAST(N'2024-05-26T19:36:52.4333333' AS DateTime2), CAST(N'2024-05-26T19:36:52.4333333' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'8fa497d2-28e0-47e4-ca99-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 16, 16, 0, CAST(N'2024-05-26T19:36:52.3266667' AS DateTime2), CAST(N'2024-05-26T19:36:52.3266667' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'9530f1f9-28cd-493c-ca9a-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 16, 17, 0, CAST(N'2024-05-26T19:36:52.3266667' AS DateTime2), CAST(N'2024-05-26T19:36:52.3266667' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'1f1d017e-4e65-42c6-ca9b-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 16, 18, 0, CAST(N'2024-05-26T19:36:52.2400000' AS DateTime2), CAST(N'2024-05-26T19:36:52.2400000' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'6ebdea88-9c2a-4030-ca9c-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 16, 19, 0, CAST(N'2024-05-26T19:36:52.2833333' AS DateTime2), CAST(N'2024-05-26T19:36:52.2833333' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'9f14f24f-5bbe-44f6-ca9d-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 17, 0, 0, CAST(N'2024-05-26T19:36:52.3266667' AS DateTime2), CAST(N'2024-05-26T19:36:52.3266667' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'02143f33-78b6-455b-ca9e-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 17, 1, 0, CAST(N'2024-05-26T19:36:52.2033333' AS DateTime2), CAST(N'2024-05-26T19:36:52.2033333' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'bd388fd0-20f4-4f48-ca9f-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 17, 2, 0, CAST(N'2024-05-26T19:36:52.3500000' AS DateTime2), CAST(N'2024-05-26T19:36:52.3500000' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'59c488da-fe1f-4b64-caa0-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 17, 3, 0, CAST(N'2024-05-26T19:36:52.2833333' AS DateTime2), CAST(N'2024-05-26T19:36:52.2833333' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'668fdbcc-a713-413a-caa1-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 17, 4, 0, CAST(N'2024-05-26T19:36:52.2833333' AS DateTime2), CAST(N'2024-05-26T19:36:52.2833333' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'8a0f035d-7717-4b20-caa2-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 17, 5, 0, CAST(N'2024-05-26T19:36:52.3033333' AS DateTime2), CAST(N'2024-05-26T19:36:52.3033333' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'636440c6-203d-48b9-caa3-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 17, 6, 0, CAST(N'2024-05-26T19:36:52.2833333' AS DateTime2), CAST(N'2024-05-26T19:36:52.2833333' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'657f1172-139d-496a-caa4-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 17, 7, 0, CAST(N'2024-05-26T19:36:52.2833333' AS DateTime2), CAST(N'2024-05-26T19:36:52.2833333' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'38e4b955-2dfd-48c3-caa5-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 17, 8, 0, CAST(N'2024-05-26T19:36:52.2600000' AS DateTime2), CAST(N'2024-05-26T19:36:52.2600000' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'b5385b75-332d-4da9-caa6-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 17, 9, 0, CAST(N'2024-05-26T19:36:52.3500000' AS DateTime2), CAST(N'2024-05-26T19:36:52.3500000' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'eb11a601-a00e-4bf0-caa7-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 17, 10, 0, CAST(N'2024-05-26T19:36:52.4033333' AS DateTime2), CAST(N'2024-05-26T19:36:52.4033333' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'0d4ad8c0-3ffc-4579-caa8-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 17, 11, 0, CAST(N'2024-05-26T19:36:52.2033333' AS DateTime2), CAST(N'2024-05-26T19:36:52.2033333' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'a9fe781c-3fed-4cd6-caa9-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 17, 12, 0, CAST(N'2024-05-26T19:36:52.3500000' AS DateTime2), CAST(N'2024-05-26T19:36:52.3500000' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'b2dc3288-82bf-4923-caaa-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 17, 13, 0, CAST(N'2024-05-26T19:36:52.3500000' AS DateTime2), CAST(N'2024-05-26T19:36:52.3500000' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'e8dde0dd-9fbc-444c-caab-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 17, 14, 0, CAST(N'2024-05-26T19:36:52.4033333' AS DateTime2), CAST(N'2024-05-26T19:36:52.4033333' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'98b8292d-c14a-4ab5-caac-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 17, 15, 0, CAST(N'2024-05-26T19:36:52.3266667' AS DateTime2), CAST(N'2024-05-26T19:36:52.3266667' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'2b92c798-6377-42fa-caad-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 17, 16, 0, CAST(N'2024-05-26T19:36:52.2400000' AS DateTime2), CAST(N'2024-05-26T19:36:52.2400000' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'e41f7452-7eae-4869-caae-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 17, 17, 0, CAST(N'2024-05-26T19:36:52.4033333' AS DateTime2), CAST(N'2024-05-26T19:36:52.4033333' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'f6bead14-4419-41e3-caaf-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 17, 18, 0, CAST(N'2024-05-26T19:36:52.4333333' AS DateTime2), CAST(N'2024-05-26T19:36:52.4333333' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'1ceaf554-732d-4870-cab0-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 17, 19, 0, CAST(N'2024-05-26T19:36:52.2400000' AS DateTime2), CAST(N'2024-05-26T19:36:52.2400000' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'106cac69-1000-434d-cab1-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 18, 0, 0, CAST(N'2024-05-26T19:36:52.2033333' AS DateTime2), CAST(N'2024-05-26T19:36:52.2033333' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'04356a8c-9a14-41b5-cab2-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 18, 1, 0, CAST(N'2024-05-26T19:36:52.2033333' AS DateTime2), CAST(N'2024-05-26T19:36:52.2033333' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'49ea4df2-0a6f-4e9c-cab3-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 18, 2, 0, CAST(N'2024-05-26T19:36:52.2600000' AS DateTime2), CAST(N'2024-05-26T19:36:52.2600000' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'dd0ffa8d-47aa-4625-cab4-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 18, 3, 0, CAST(N'2024-05-26T19:36:52.4033333' AS DateTime2), CAST(N'2024-05-26T19:36:52.4033333' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'7ee24cfa-fe46-4752-cab5-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 18, 4, 0, CAST(N'2024-05-26T19:36:52.3033333' AS DateTime2), CAST(N'2024-05-26T19:36:52.3033333' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'a827d2c4-f40c-4e43-cab6-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 18, 5, 0, CAST(N'2024-05-26T19:36:52.3500000' AS DateTime2), CAST(N'2024-05-26T19:36:52.3500000' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'610df042-659c-4dac-cab7-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 18, 6, 0, CAST(N'2024-05-26T19:36:52.2833333' AS DateTime2), CAST(N'2024-05-26T19:36:52.2833333' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'd2b5b2e8-797b-42c0-cab8-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 18, 7, 0, CAST(N'2024-05-26T19:36:52.3733333' AS DateTime2), CAST(N'2024-05-26T19:36:52.3733333' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'3652e318-f7b6-443f-cab9-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 18, 8, 0, CAST(N'2024-05-26T19:36:52.2600000' AS DateTime2), CAST(N'2024-05-26T19:36:52.2600000' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'8ea9dbe2-ee7d-4a12-caba-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 18, 9, 0, CAST(N'2024-05-26T19:36:52.3266667' AS DateTime2), CAST(N'2024-05-26T19:36:52.3266667' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'a60d8f0b-d630-4400-cabb-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 18, 10, 0, CAST(N'2024-05-26T19:36:52.3500000' AS DateTime2), CAST(N'2024-05-26T19:36:52.3500000' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'832aebc9-df2a-4ebf-cabc-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 18, 11, 0, CAST(N'2024-05-26T19:36:52.3033333' AS DateTime2), CAST(N'2024-05-26T19:36:52.3033333' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'151cb314-a84b-42fd-cabd-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 18, 12, 0, CAST(N'2024-05-26T19:36:52.2033333' AS DateTime2), CAST(N'2024-05-26T19:36:52.2033333' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'd1f11791-08e8-4bf0-cabe-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 18, 13, 0, CAST(N'2024-05-26T19:36:52.3733333' AS DateTime2), CAST(N'2024-05-26T19:36:52.3733333' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'c9ad6d7a-0f4d-4128-cabf-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 18, 14, 0, CAST(N'2024-05-26T19:36:52.3733333' AS DateTime2), CAST(N'2024-05-26T19:36:52.3733333' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'2e879c6a-212d-4a23-cac0-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 18, 15, 0, CAST(N'2024-05-26T19:36:52.2400000' AS DateTime2), CAST(N'2024-05-26T19:36:52.2400000' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'7ae85d97-700d-47bb-cac1-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 18, 16, 0, CAST(N'2024-05-26T19:36:52.3033333' AS DateTime2), CAST(N'2024-05-26T19:36:52.3033333' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'363a4304-e21a-4752-cac2-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 18, 17, 0, CAST(N'2024-05-26T19:36:52.2600000' AS DateTime2), CAST(N'2024-05-26T19:36:52.2600000' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'3fb7bdb3-bdd3-4fdb-cac3-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 18, 18, 0, CAST(N'2024-05-26T19:36:52.2600000' AS DateTime2), CAST(N'2024-05-26T19:36:52.2600000' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'72b10c12-5cd4-4234-cac4-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 18, 19, 0, CAST(N'2024-05-26T19:36:52.3033333' AS DateTime2), CAST(N'2024-05-26T19:36:52.3033333' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'c2196f14-8fce-4a3f-cac5-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 19, 0, 0, CAST(N'2024-05-26T19:36:52.3733333' AS DateTime2), CAST(N'2024-05-26T19:36:52.3733333' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'3bbf095d-b75f-4078-cac6-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 19, 1, 0, CAST(N'2024-05-26T19:36:52.2600000' AS DateTime2), CAST(N'2024-05-26T19:36:52.2600000' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'657b10be-7a30-40b3-cac7-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 19, 2, 0, CAST(N'2024-05-26T19:36:52.2833333' AS DateTime2), CAST(N'2024-05-26T19:36:52.2833333' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'1378a9dc-028b-4b65-cac8-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 19, 3, 0, CAST(N'2024-05-26T19:36:52.2033333' AS DateTime2), CAST(N'2024-05-26T19:36:52.2033333' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'53b71c36-fc4e-4fe9-cac9-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 19, 4, 0, CAST(N'2024-05-26T19:36:52.2833333' AS DateTime2), CAST(N'2024-05-26T19:36:52.2833333' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'35470059-f020-4969-caca-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 19, 5, 0, CAST(N'2024-05-26T19:36:52.2400000' AS DateTime2), CAST(N'2024-05-26T19:36:52.2400000' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'e733f81f-f125-4ac2-cacb-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 19, 6, 0, CAST(N'2024-05-26T19:36:52.4033333' AS DateTime2), CAST(N'2024-05-26T19:36:52.4033333' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'b445f0f8-89f2-4571-cacc-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 19, 7, 0, CAST(N'2024-05-26T19:36:52.3500000' AS DateTime2), CAST(N'2024-05-26T19:36:52.3500000' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'd3e539c2-0d29-43e5-cacd-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 19, 8, 0, CAST(N'2024-05-26T19:36:52.3733333' AS DateTime2), CAST(N'2024-05-26T19:36:52.3733333' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'2e85352a-85b5-4b1f-cace-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 19, 9, 0, CAST(N'2024-05-26T19:36:52.2400000' AS DateTime2), CAST(N'2024-05-26T19:36:52.2400000' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'e3e8a488-9b7a-48b3-cacf-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 19, 10, 0, CAST(N'2024-05-26T19:36:52.4033333' AS DateTime2), CAST(N'2024-05-26T19:36:52.4033333' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'd23f10aa-6204-416b-cad0-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 19, 11, 0, CAST(N'2024-05-26T19:36:52.3733333' AS DateTime2), CAST(N'2024-05-26T19:36:52.3733333' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'12b45578-d4b9-4235-cad1-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 19, 12, 0, CAST(N'2024-05-26T19:36:52.2033333' AS DateTime2), CAST(N'2024-05-26T19:36:52.2033333' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'2c51b74e-72a1-4033-cad2-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 19, 13, 0, CAST(N'2024-05-26T19:36:52.2400000' AS DateTime2), CAST(N'2024-05-26T19:36:52.2400000' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'646fc913-533a-43ec-cad3-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 19, 14, 0, CAST(N'2024-05-26T19:36:52.2833333' AS DateTime2), CAST(N'2024-05-26T19:36:52.2833333' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'6138c892-462c-4a44-cad4-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 19, 15, 0, CAST(N'2024-05-26T19:36:52.2833333' AS DateTime2), CAST(N'2024-05-26T19:36:52.2833333' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'1e098da4-8361-433e-cad5-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 19, 16, 0, CAST(N'2024-05-26T19:36:52.2400000' AS DateTime2), CAST(N'2024-05-26T19:36:52.2400000' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'39e98dfb-2a25-43df-cad6-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 19, 17, 0, CAST(N'2024-05-26T19:36:52.2600000' AS DateTime2), CAST(N'2024-05-26T19:36:52.2600000' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'4dd2fda6-9dc8-4f14-cad7-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 19, 18, 0, CAST(N'2024-05-26T19:36:52.2600000' AS DateTime2), CAST(N'2024-05-26T19:36:52.2600000' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'6d0ffefe-00ef-4736-cad8-08dc7dbb3119', N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', 5, 19, 19, 0, CAST(N'2024-05-26T19:36:52.2833333' AS DateTime2), CAST(N'2024-05-26T19:36:52.2833333' AS DateTime2))
GO
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'8f693a04-a7d5-49ea-0e51-08dc9822af0c', N'3637e78e-7a24-45f8-ef77-08dc9822af07', 0, 0, 0, 0, CAST(N'2024-06-29T10:03:11.8366667' AS DateTime2), CAST(N'2024-06-29T10:03:43.2804256' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'3c9d086a-76c3-4a06-0e52-08dc9822af0c', N'3637e78e-7a24-45f8-ef77-08dc9822af07', 5, 0, 1, 0, CAST(N'2024-06-29T10:03:11.8366667' AS DateTime2), CAST(N'2024-06-29T10:03:11.8366667' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'7753f8dd-3f68-4aa9-0e53-08dc9822af0c', N'3637e78e-7a24-45f8-ef77-08dc9822af07', 1, 0, 2, 0, CAST(N'2024-06-29T10:03:11.8366667' AS DateTime2), CAST(N'2024-06-29T10:04:09.6498110' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'9775b4e4-44dc-45a7-0e54-08dc9822af0c', N'3637e78e-7a24-45f8-ef77-08dc9822af07', 1, 0, 3, 0, CAST(N'2024-06-29T10:03:11.8366667' AS DateTime2), CAST(N'2024-06-29T10:04:06.8880800' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'2f7c1980-0654-4c4c-0e55-08dc9822af0c', N'3637e78e-7a24-45f8-ef77-08dc9822af07', 5, 0, 4, 0, CAST(N'2024-06-29T10:03:11.8366667' AS DateTime2), CAST(N'2024-06-29T10:03:11.8366667' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'1df7c439-44eb-44e4-0e56-08dc9822af0c', N'3637e78e-7a24-45f8-ef77-08dc9822af07', 0, 1, 0, 0, CAST(N'2024-06-29T10:03:11.8366667' AS DateTime2), CAST(N'2024-06-29T10:03:40.5746076' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'e2d47425-8750-4214-0e57-08dc9822af0c', N'3637e78e-7a24-45f8-ef77-08dc9822af07', 5, 1, 1, 0, CAST(N'2024-06-29T10:03:11.8366667' AS DateTime2), CAST(N'2024-06-29T10:03:11.8366667' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'359fef35-5a4e-4fe1-0e58-08dc9822af0c', N'3637e78e-7a24-45f8-ef77-08dc9822af07', 5, 1, 2, 0, CAST(N'2024-06-29T10:03:11.8366667' AS DateTime2), CAST(N'2024-06-29T10:03:11.8366667' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'fc7c94af-59a0-4fc7-0e59-08dc9822af0c', N'3637e78e-7a24-45f8-ef77-08dc9822af07', 5, 1, 3, 0, CAST(N'2024-06-29T10:03:11.8366667' AS DateTime2), CAST(N'2024-06-29T10:03:11.8366667' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'005a3ec3-89d2-4125-0e5a-08dc9822af0c', N'3637e78e-7a24-45f8-ef77-08dc9822af07', 5, 1, 4, 0, CAST(N'2024-06-29T10:03:11.8366667' AS DateTime2), CAST(N'2024-06-29T10:03:11.8366667' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'4ae9106d-82e1-45eb-0e5b-08dc9822af0c', N'3637e78e-7a24-45f8-ef77-08dc9822af07', 0, 2, 0, 0, CAST(N'2024-06-29T10:03:11.8366667' AS DateTime2), CAST(N'2024-06-29T10:03:45.5923469' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'877d3fb2-b742-4a1b-0e5c-08dc9822af0c', N'3637e78e-7a24-45f8-ef77-08dc9822af07', 5, 2, 1, 0, CAST(N'2024-06-29T10:03:11.8366667' AS DateTime2), CAST(N'2024-06-29T10:03:11.8366667' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'ab63b73c-9960-487e-0e5d-08dc9822af0c', N'3637e78e-7a24-45f8-ef77-08dc9822af07', 0, 2, 2, 0, CAST(N'2024-06-29T10:03:11.8366667' AS DateTime2), CAST(N'2024-06-29T10:03:55.4144076' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'b70a170a-c3f3-4f0f-0e5e-08dc9822af0c', N'3637e78e-7a24-45f8-ef77-08dc9822af07', 5, 2, 3, 0, CAST(N'2024-06-29T10:03:11.8366667' AS DateTime2), CAST(N'2024-06-29T10:03:11.8366667' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'76b90f75-718e-455a-0e5f-08dc9822af0c', N'3637e78e-7a24-45f8-ef77-08dc9822af07', 5, 2, 4, 0, CAST(N'2024-06-29T10:03:11.8366667' AS DateTime2), CAST(N'2024-06-29T10:03:11.8366667' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'3dc4ecf5-44e1-4179-0e60-08dc9822af0c', N'3637e78e-7a24-45f8-ef77-08dc9822af07', 0, 3, 0, 0, CAST(N'2024-06-29T10:03:11.8366667' AS DateTime2), CAST(N'2024-06-29T10:03:52.4362063' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'348f1b24-fbea-4919-0e61-08dc9822af0c', N'3637e78e-7a24-45f8-ef77-08dc9822af07', 5, 3, 1, 0, CAST(N'2024-06-29T10:03:11.8366667' AS DateTime2), CAST(N'2024-06-29T10:03:11.8366667' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'c673be8a-b064-4943-0e62-08dc9822af0c', N'3637e78e-7a24-45f8-ef77-08dc9822af07', 0, 3, 2, 0, CAST(N'2024-06-29T10:03:11.8366667' AS DateTime2), CAST(N'2024-06-29T10:03:57.4451848' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'1f296fcf-8830-4b07-0e63-08dc9822af0c', N'3637e78e-7a24-45f8-ef77-08dc9822af07', 0, 3, 3, 0, CAST(N'2024-06-29T10:03:11.8366667' AS DateTime2), CAST(N'2024-06-29T10:04:00.0312772' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'4899e127-9953-42cf-0e64-08dc9822af0c', N'3637e78e-7a24-45f8-ef77-08dc9822af07', 5, 3, 4, 0, CAST(N'2024-06-29T10:03:11.8366667' AS DateTime2), CAST(N'2024-06-29T10:03:11.8366667' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'ce6cbf53-3bf4-4489-0e65-08dc9822af0c', N'3637e78e-7a24-45f8-ef77-08dc9822af07', 5, 4, 0, 0, CAST(N'2024-06-29T10:03:11.8366667' AS DateTime2), CAST(N'2024-06-29T10:03:11.8366667' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'47172049-21eb-4b91-0e66-08dc9822af0c', N'3637e78e-7a24-45f8-ef77-08dc9822af07', 5, 4, 1, 0, CAST(N'2024-06-29T10:03:11.8366667' AS DateTime2), CAST(N'2024-06-29T10:03:11.8366667' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'c6418380-8eb3-40bb-0e67-08dc9822af0c', N'3637e78e-7a24-45f8-ef77-08dc9822af07', 5, 4, 2, 0, CAST(N'2024-06-29T10:03:11.8366667' AS DateTime2), CAST(N'2024-06-29T10:03:11.8366667' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'e7c74a5f-95b6-4922-0e68-08dc9822af0c', N'3637e78e-7a24-45f8-ef77-08dc9822af07', 5, 4, 3, 0, CAST(N'2024-06-29T10:03:11.8366667' AS DateTime2), CAST(N'2024-06-29T10:03:11.8366667' AS DateTime2))
INSERT [dbo].[Tiles] ([Id], [Zone_Id], [Type], [X_Position], [Y_Position], [Deleted], [Created_At], [Updated_At]) VALUES (N'b53f8675-da91-44c8-0e69-08dc9822af0c', N'3637e78e-7a24-45f8-ef77-08dc9822af07', 5, 4, 4, 0, CAST(N'2024-06-29T10:03:11.8366667' AS DateTime2), CAST(N'2024-06-29T10:03:11.8366667' AS DateTime2))
GO
INSERT [dbo].[Users] ([Id], [Team_Id], [Photo_Id], [Email], [First_Name], [Last_Name], [Is_Admin], [Deleted], [Created_At], [Updated_At]) VALUES (N'6ac0b948-243e-4d8e-9fef-12d2fb9c473c', N'2112f055-7a92-47b1-528b-08dc2af355e1', NULL, N'mirel.ion@example.com', N'Mirel', N'Ion', 0, 0, CAST(N'2024-06-29T09:59:39.7266667' AS DateTime2), CAST(N'2024-06-29T09:59:39.7266667' AS DateTime2))
INSERT [dbo].[Users] ([Id], [Team_Id], [Photo_Id], [Email], [First_Name], [Last_Name], [Is_Admin], [Deleted], [Created_At], [Updated_At]) VALUES (N'6f3b0e9e-1744-4551-ad7c-56880ae07a78', N'701c15ba-8338-4b9a-823f-08dc9823e4dd', NULL, N'Florin.Fratila@example.com', N'Florin', N'Fratila', 0, 0, CAST(N'2024-06-29T10:14:36.0966667' AS DateTime2), CAST(N'2024-06-29T10:14:36.0966667' AS DateTime2))
INSERT [dbo].[Users] ([Id], [Team_Id], [Photo_Id], [Email], [First_Name], [Last_Name], [Is_Admin], [Deleted], [Created_At], [Updated_At]) VALUES (N'26012643-8c96-49c1-8337-5ba4887f8830', N'701c15ba-8338-4b9a-823f-08dc9823e4dd', NULL, N'Andreea.Dorin@example.com', N'Andreea', N'Dorin', 0, 0, CAST(N'2024-06-29T10:14:55.5700000' AS DateTime2), CAST(N'2024-06-29T10:14:55.5700000' AS DateTime2))
INSERT [dbo].[Users] ([Id], [Team_Id], [Photo_Id], [Email], [First_Name], [Last_Name], [Is_Admin], [Deleted], [Created_At], [Updated_At]) VALUES (N'91b88619-2e71-4f6e-b95b-77f13464c6e1', N'2112f055-7a92-47b1-528b-08dc2af355e1', NULL, N'string', N'Bogdan', N'Popescu', 0, 0, CAST(N'2024-02-11T11:20:16.6766667' AS DateTime2), CAST(N'2024-02-11T11:20:16.6766667' AS DateTime2))
INSERT [dbo].[Users] ([Id], [Team_Id], [Photo_Id], [Email], [First_Name], [Last_Name], [Is_Admin], [Deleted], [Created_At], [Updated_At]) VALUES (N'a7304e9a-f5d6-4463-a7fe-aaecc2249788', N'2112f055-7a92-47b1-528b-08dc2af355e1', NULL, N'andrei.danila@example.com', N'Andrei', N'Danila', 1, 0, CAST(N'2024-02-20T13:16:13.5566667' AS DateTime2), CAST(N'2024-02-20T13:16:13.5566667' AS DateTime2))
INSERT [dbo].[Users] ([Id], [Team_Id], [Photo_Id], [Email], [First_Name], [Last_Name], [Is_Admin], [Deleted], [Created_At], [Updated_At]) VALUES (N'7db97e6a-457e-4c91-b2d8-c0b6c38bb643', N'39f2d3c5-4f31-4182-823e-08dc9823e4dd', NULL, N'Marcel.Cazan@example.com', N'Marcel', N'Cazan', 0, 0, CAST(N'2024-06-29T10:12:56.2933333' AS DateTime2), CAST(N'2024-06-29T10:12:56.2933333' AS DateTime2))
INSERT [dbo].[Users] ([Id], [Team_Id], [Photo_Id], [Email], [First_Name], [Last_Name], [Is_Admin], [Deleted], [Created_At], [Updated_At]) VALUES (N'd82a2a87-36bc-4622-b83e-db1677b6ced5', N'2112f055-7a92-47b1-528b-08dc2af355e1', NULL, N'Mihaela.Vancea@example.com', N'Mihaela', N'Vancea', 0, 0, CAST(N'2024-06-29T10:00:01.1466667' AS DateTime2), CAST(N'2024-06-29T10:00:01.1466667' AS DateTime2))
INSERT [dbo].[Users] ([Id], [Team_Id], [Photo_Id], [Email], [First_Name], [Last_Name], [Is_Admin], [Deleted], [Created_At], [Updated_At]) VALUES (N'7dd91432-eb5d-40b7-bc24-fe963a43d819', N'39f2d3c5-4f31-4182-823e-08dc9823e4dd', NULL, N'Mirela.Frone@example.com', N'Mirela', N'Frone', 0, 0, CAST(N'2024-06-29T10:12:33.6900000' AS DateTime2), CAST(N'2024-06-29T10:12:33.6900000' AS DateTime2))
GO
INSERT [dbo].[Zones] ([Id], [Floor_Id], [Name], [Size_X], [Size_Y], [Deleted], [Created_At], [Updated_At]) VALUES (N'b7a33eb9-2d28-4ccc-a33b-08dc7dbb3115', N'e4f79a51-7c6c-4729-9e33-08dc2af3c352', N'C', 20, 20, 0, CAST(N'2024-05-26T19:36:52.2000000' AS DateTime2), CAST(N'2024-05-26T19:36:52.2000000' AS DateTime2))
INSERT [dbo].[Zones] ([Id], [Floor_Id], [Name], [Size_X], [Size_Y], [Deleted], [Created_At], [Updated_At]) VALUES (N'3637e78e-7a24-45f8-ef77-08dc9822af07', N'e4f79a51-7c6c-4729-9e33-08dc2af3c352', N'D', 5, 5, 0, CAST(N'2024-06-29T10:03:11.8066667' AS DateTime2), CAST(N'2024-06-29T10:03:11.8066667' AS DateTime2))
GO
/****** Object:  Index [IX_Credentials_User_Id]    Script Date: 6/30/2024 12:36:20 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Credentials_User_Id] ON [dbo].[Credentials]
(
	[User_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Floors_Building_Id]    Script Date: 6/30/2024 12:36:20 PM ******/
CREATE NONCLUSTERED INDEX [IX_Floors_Building_Id] ON [dbo].[Floors]
(
	[Building_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Reservations_Desk_Id]    Script Date: 6/30/2024 12:36:20 PM ******/
CREATE NONCLUSTERED INDEX [IX_Reservations_Desk_Id] ON [dbo].[Reservations]
(
	[Desk_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Reservations_User_Id]    Script Date: 6/30/2024 12:36:20 PM ******/
CREATE NONCLUSTERED INDEX [IX_Reservations_User_Id] ON [dbo].[Reservations]
(
	[User_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Tiles_Zone_Id]    Script Date: 6/30/2024 12:36:20 PM ******/
CREATE NONCLUSTERED INDEX [IX_Tiles_Zone_Id] ON [dbo].[Tiles]
(
	[Zone_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Users_Team_Id]    Script Date: 6/30/2024 12:36:20 PM ******/
CREATE NONCLUSTERED INDEX [IX_Users_Team_Id] ON [dbo].[Users]
(
	[Team_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Zones_Floor_Id]    Script Date: 6/30/2024 12:36:20 PM ******/
CREATE NONCLUSTERED INDEX [IX_Zones_Floor_Id] ON [dbo].[Zones]
(
	[Floor_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Buildings] ADD  DEFAULT (CONVERT([bit],(0))) FOR [Deleted]
GO
ALTER TABLE [dbo].[Buildings] ADD  DEFAULT (getdate()) FOR [Created_At]
GO
ALTER TABLE [dbo].[Buildings] ADD  DEFAULT (getdate()) FOR [Updated_At]
GO
ALTER TABLE [dbo].[Credentials] ADD  DEFAULT ((0)) FOR [Number_Of_Tries]
GO
ALTER TABLE [dbo].[Credentials] ADD  DEFAULT (CONVERT([bit],(1))) FOR [Is_Active]
GO
ALTER TABLE [dbo].[Credentials] ADD  DEFAULT (N'') FOR [TOTP]
GO
ALTER TABLE [dbo].[Credentials] ADD  DEFAULT (getdate()) FOR [Updated_At]
GO
ALTER TABLE [dbo].[Floors] ADD  DEFAULT (CONVERT([bit],(0))) FOR [Deleted]
GO
ALTER TABLE [dbo].[Floors] ADD  DEFAULT (getdate()) FOR [Created_At]
GO
ALTER TABLE [dbo].[Floors] ADD  DEFAULT (getdate()) FOR [Updated_At]
GO
ALTER TABLE [dbo].[Photos] ADD  DEFAULT (getdate()) FOR [Updated_At]
GO
ALTER TABLE [dbo].[Reservations] ADD  DEFAULT (CONVERT([bit],(0))) FOR [Deleted]
GO
ALTER TABLE [dbo].[Reservations] ADD  DEFAULT (getdate()) FOR [Created_At]
GO
ALTER TABLE [dbo].[Reservations] ADD  DEFAULT (getdate()) FOR [Updated_At]
GO
ALTER TABLE [dbo].[Teams] ADD  DEFAULT (getdate()) FOR [Created_At]
GO
ALTER TABLE [dbo].[Teams] ADD  DEFAULT (getdate()) FOR [Updated_At]
GO
ALTER TABLE [dbo].[Teams] ADD  DEFAULT (CONVERT([bit],(0))) FOR [Deleted]
GO
ALTER TABLE [dbo].[Tiles] ADD  DEFAULT (CONVERT([bit],(0))) FOR [Deleted]
GO
ALTER TABLE [dbo].[Tiles] ADD  DEFAULT (getdate()) FOR [Created_At]
GO
ALTER TABLE [dbo].[Tiles] ADD  DEFAULT (getdate()) FOR [Updated_At]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (CONVERT([bit],(0))) FOR [Is_Admin]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (CONVERT([bit],(0))) FOR [Deleted]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (getdate()) FOR [Created_At]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (getdate()) FOR [Updated_At]
GO
ALTER TABLE [dbo].[Zones] ADD  DEFAULT (CONVERT([bit],(0))) FOR [Deleted]
GO
ALTER TABLE [dbo].[Zones] ADD  DEFAULT (getdate()) FOR [Created_At]
GO
ALTER TABLE [dbo].[Zones] ADD  DEFAULT (getdate()) FOR [Updated_At]
GO
ALTER TABLE [dbo].[Credentials]  WITH CHECK ADD  CONSTRAINT [FK_Credentials_Users_User_Id] FOREIGN KEY([User_Id])
REFERENCES [dbo].[Users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Credentials] CHECK CONSTRAINT [FK_Credentials_Users_User_Id]
GO
ALTER TABLE [dbo].[Floors]  WITH CHECK ADD  CONSTRAINT [FK_Floors_Buildings_Building_Id] FOREIGN KEY([Building_Id])
REFERENCES [dbo].[Buildings] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Floors] CHECK CONSTRAINT [FK_Floors_Buildings_Building_Id]
GO
ALTER TABLE [dbo].[Photos]  WITH CHECK ADD  CONSTRAINT [FK_Photos_Users_User_Id] FOREIGN KEY([User_Id])
REFERENCES [dbo].[Users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Photos] CHECK CONSTRAINT [FK_Photos_Users_User_Id]
GO
ALTER TABLE [dbo].[Reservations]  WITH CHECK ADD  CONSTRAINT [FK_Reservations_Tiles_Desk_Id] FOREIGN KEY([Desk_Id])
REFERENCES [dbo].[Tiles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Reservations] CHECK CONSTRAINT [FK_Reservations_Tiles_Desk_Id]
GO
ALTER TABLE [dbo].[Reservations]  WITH CHECK ADD  CONSTRAINT [FK_Reservations_Users_User_Id] FOREIGN KEY([User_Id])
REFERENCES [dbo].[Users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Reservations] CHECK CONSTRAINT [FK_Reservations_Users_User_Id]
GO
ALTER TABLE [dbo].[Tiles]  WITH CHECK ADD  CONSTRAINT [FK_Tiles_Zones_Zone_Id] FOREIGN KEY([Zone_Id])
REFERENCES [dbo].[Zones] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Tiles] CHECK CONSTRAINT [FK_Tiles_Zones_Zone_Id]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Teams_Team_Id] FOREIGN KEY([Team_Id])
REFERENCES [dbo].[Teams] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Teams_Team_Id]
GO
ALTER TABLE [dbo].[Zones]  WITH CHECK ADD  CONSTRAINT [FK_Zones_Floors_Floor_Id] FOREIGN KEY([Floor_Id])
REFERENCES [dbo].[Floors] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Zones] CHECK CONSTRAINT [FK_Zones_Floors_Floor_Id]
GO
USE [master]
GO
ALTER DATABASE [MyDesk] SET  READ_WRITE 
GO
