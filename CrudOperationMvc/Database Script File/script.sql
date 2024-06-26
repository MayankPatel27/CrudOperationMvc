USE [master]
GO
/****** Object:  Database [DbPersonInfo]    Script Date: 27-05-24 19:02:57 ******/
CREATE DATABASE [DbPersonInfo]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DbPersonInfo', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\DbPersonInfo.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DbPersonInfo_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\DbPersonInfo_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [DbPersonInfo] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DbPersonInfo].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DbPersonInfo] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DbPersonInfo] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DbPersonInfo] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DbPersonInfo] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DbPersonInfo] SET ARITHABORT OFF 
GO
ALTER DATABASE [DbPersonInfo] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DbPersonInfo] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DbPersonInfo] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DbPersonInfo] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DbPersonInfo] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DbPersonInfo] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DbPersonInfo] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DbPersonInfo] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DbPersonInfo] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DbPersonInfo] SET  ENABLE_BROKER 
GO
ALTER DATABASE [DbPersonInfo] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DbPersonInfo] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DbPersonInfo] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DbPersonInfo] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DbPersonInfo] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DbPersonInfo] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DbPersonInfo] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DbPersonInfo] SET RECOVERY FULL 
GO
ALTER DATABASE [DbPersonInfo] SET  MULTI_USER 
GO
ALTER DATABASE [DbPersonInfo] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DbPersonInfo] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DbPersonInfo] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DbPersonInfo] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DbPersonInfo] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DbPersonInfo] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'DbPersonInfo', N'ON'
GO
ALTER DATABASE [DbPersonInfo] SET QUERY_STORE = ON
GO
ALTER DATABASE [DbPersonInfo] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [DbPersonInfo]
GO
/****** Object:  Table [dbo].[tblpersonInfo]    Script Date: 27-05-24 19:02:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblpersonInfo](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](200) NULL,
	[Email] [nvarchar](100) NULL,
	[Phone] [nvarchar](20) NULL,
	[Address] [nvarchar](3000) NULL,
	[State] [nvarchar](100) NULL,
	[City] [nvarchar](100) NULL,
	[Agree] [bit] NULL,
	[PersonInfoRemove] [int] NULL,
	[CreateDateTime] [datetime] NULL,
	[UpdateDateTime] [datetime] NULL,
	[DeleteDateTime] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tblpersonInfo] ON 

INSERT [dbo].[tblpersonInfo] ([Id], [Name], [Email], [Phone], [Address], [State], [City], [Agree], [PersonInfoRemove], [CreateDateTime], [UpdateDateTime], [DeleteDateTime]) VALUES (2009, N'mayankfinaltest', N'mayank@gmail.com', N'9546956548', N'test', N'gujarat', N'bardoli', 1, 0, CAST(N'2024-05-27T18:30:22.910' AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[tblpersonInfo] OFF
GO
/****** Object:  StoredProcedure [dbo].[AddPersonInfo]    Script Date: 27-05-24 19:02:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[AddPersonInfo]
(
@Name Nvarchar(200),
@Email Nvarchar(100),
@Phone Nvarchar(20),
@Address  Nvarchar(3000) = '',
@State Nvarchar(100),
@City Nvarchar(100),
@Agree bit
)
as
begin
DECLARE @InsertedID INT;
insert into tblpersonInfo(Name,Email,Phone,Address,State,City,Agree,CreateDateTime,PersonInfoRemove) 
values(@Name,@Email,@Phone,@Address,@State,@City ,@Agree,CURRENT_TIMESTAMP,0) 
SET @InsertedID = SCOPE_IDENTITY();

select * from tblpersonInfo with(nolock) where Id=@InsertedID;
end
GO
/****** Object:  StoredProcedure [dbo].[DeletePersonInfo]    Script Date: 27-05-24 19:02:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[DeletePersonInfo]
(
@Id int
)
as
begin
delete  from tblpersonInfo where Id=@Id
select * from tblpersonInfo where Id=@Id
end
GO
/****** Object:  StoredProcedure [dbo].[GetAllPersonDetails]    Script Date: 27-05-24 19:02:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[GetAllPersonDetails]

as
begin 
select * from tblpersonInfo with(nolock) where PersonInfoRemove =0
end
GO
/****** Object:  StoredProcedure [dbo].[UpdatePersonInfo]    Script Date: 27-05-24 19:02:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Procedure [dbo].[UpdatePersonInfo]
(
@Id int,
@Name Nvarchar(200),
@Email Nvarchar(100),
@Phone Nvarchar(20),
@Address  Nvarchar(3000) = '',
@State Nvarchar(100),
@City Nvarchar(100)
)
as
begin
update tblpersonInfo  
set Name=@Name,Email=@Email,Phone=@Phone,Address=@Address,State=@State,City=@City,UpdateDateTime=CURRENT_TIMESTAMP
where Id=@Id

select * from tblpersonInfo with(nolock) where Id=@Id
end
GO
USE [master]
GO
ALTER DATABASE [DbPersonInfo] SET  READ_WRITE 
GO
