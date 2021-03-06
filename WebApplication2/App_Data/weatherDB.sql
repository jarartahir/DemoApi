USE [master]
GO
/****** Object:  Database [weather]    Script Date: 17/01/2022 3:48:09 am ******/
CREATE DATABASE [weather]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'weather', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\weather.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'weather_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\weather.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [weather] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [weather].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [weather] SET ANSI_NULL_DEFAULT ON 
GO
ALTER DATABASE [weather] SET ANSI_NULLS ON 
GO
ALTER DATABASE [weather] SET ANSI_PADDING ON 
GO
ALTER DATABASE [weather] SET ANSI_WARNINGS ON 
GO
ALTER DATABASE [weather] SET ARITHABORT ON 
GO
ALTER DATABASE [weather] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [weather] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [weather] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [weather] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [weather] SET CURSOR_DEFAULT  LOCAL 
GO
ALTER DATABASE [weather] SET CONCAT_NULL_YIELDS_NULL ON 
GO
ALTER DATABASE [weather] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [weather] SET QUOTED_IDENTIFIER ON 
GO
ALTER DATABASE [weather] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [weather] SET  DISABLE_BROKER 
GO
ALTER DATABASE [weather] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [weather] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [weather] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [weather] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [weather] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [weather] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [weather] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [weather] SET RECOVERY FULL 
GO
ALTER DATABASE [weather] SET  MULTI_USER 
GO
ALTER DATABASE [weather] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [weather] SET DB_CHAINING OFF 
GO
ALTER DATABASE [weather] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [weather] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [weather] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [weather] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'weather', N'ON'
GO
ALTER DATABASE [weather] SET QUERY_STORE = OFF
GO
USE [weather]
GO
/****** Object:  Table [dbo].[City]    Script Date: 17/01/2022 3:48:09 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[City](
	[Id] [int] NOT NULL,
	[City_Name] [nchar](50) NOT NULL,
	[lon] [float] NOT NULL,
	[lat] [float] NOT NULL,
	[Country_Id] [int] NOT NULL,
 CONSTRAINT [PK_City] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Country]    Script Date: 17/01/2022 3:48:09 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Country](
	[Id] [int] NOT NULL,
	[CountryName] [nchar](20) NULL,
	[CountryCode] [nchar](5) NULL,
 CONSTRAINT [PK_Country] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[weather_forecast]    Script Date: 17/01/2022 3:48:09 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[weather_forecast](
	[Id] [int] NOT NULL,
	[temperature] [float] NOT NULL,
	[max_temperature] [float] NOT NULL,
	[min_temperature] [float] NOT NULL,
	[humidity] [int] NOT NULL,
	[air_pressure] [int] NOT NULL,
	[wind_speed] [int] NOT NULL,
	[wind_direction] [int] NOT NULL,
	[icon] [nchar](10) NOT NULL,
	[main] [nchar](10) NOT NULL,
	[city_id] [int] NOT NULL,
 CONSTRAINT [PK_weather_forecast] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[City] ([Id], [City_Name], [lon], [lat], [Country_Id]) VALUES (1, N'Ilmenau                                           ', 10, 20, 1)
INSERT [dbo].[City] ([Id], [City_Name], [lon], [lat], [Country_Id]) VALUES (2, N'Hamburg                                           ', 11, 21, 1)
INSERT [dbo].[City] ([Id], [City_Name], [lon], [lat], [Country_Id]) VALUES (3, N'Berlin                                            ', 14, 15, 1)
INSERT [dbo].[City] ([Id], [City_Name], [lon], [lat], [Country_Id]) VALUES (4, N'Paris                                             ', 56, 68, 2)
INSERT [dbo].[City] ([Id], [City_Name], [lon], [lat], [Country_Id]) VALUES (5, N'Munich                                            ', 74, 85, 1)
INSERT [dbo].[City] ([Id], [City_Name], [lon], [lat], [Country_Id]) VALUES (6, N'Koln                                              ', 68, 26, 1)
INSERT [dbo].[City] ([Id], [City_Name], [lon], [lat], [Country_Id]) VALUES (7, N'Erfurt                                            ', 16, 85, 1)
INSERT [dbo].[City] ([Id], [City_Name], [lon], [lat], [Country_Id]) VALUES (8, N'Gotha                                             ', 46, 23, 1)
INSERT [dbo].[City] ([Id], [City_Name], [lon], [lat], [Country_Id]) VALUES (9, N'Leipzig                                           ', 8, 69, 1)
INSERT [dbo].[City] ([Id], [City_Name], [lon], [lat], [Country_Id]) VALUES (10, N'Kiel                                              ', 984, 465, 1)
GO
INSERT [dbo].[Country] ([Id], [CountryName], [CountryCode]) VALUES (1, N'Germany             ', N'DE   ')
INSERT [dbo].[Country] ([Id], [CountryName], [CountryCode]) VALUES (2, N'France              ', N'FR   ')
GO
INSERT [dbo].[weather_forecast] ([Id], [temperature], [max_temperature], [min_temperature], [humidity], [air_pressure], [wind_speed], [wind_direction], [icon], [main], [city_id]) VALUES (1, 1, 21, 12, 1, 12, 2, 3, N'12w       ', N'Snow      ', 1)
INSERT [dbo].[weather_forecast] ([Id], [temperature], [max_temperature], [min_temperature], [humidity], [air_pressure], [wind_speed], [wind_direction], [icon], [main], [city_id]) VALUES (2, 0, 10, 2, 22, 23, 32, 12, N'23e       ', N'Rain      ', 2)
INSERT [dbo].[weather_forecast] ([Id], [temperature], [max_temperature], [min_temperature], [humidity], [air_pressure], [wind_speed], [wind_direction], [icon], [main], [city_id]) VALUES (3, 68, 45, 45, 85, 63, 68, 13, N'58ds      ', N'Haze      ', 3)
INSERT [dbo].[weather_forecast] ([Id], [temperature], [max_temperature], [min_temperature], [humidity], [air_pressure], [wind_speed], [wind_direction], [icon], [main], [city_id]) VALUES (4, 54, 54, 54, 54, 54, 54, 54, N'54q       ', N'Rain      ', 4)
INSERT [dbo].[weather_forecast] ([Id], [temperature], [max_temperature], [min_temperature], [humidity], [air_pressure], [wind_speed], [wind_direction], [icon], [main], [city_id]) VALUES (5, 516, 64, 1, 68, 38, 1, 360, N'd2        ', N'Fog       ', 5)
INSERT [dbo].[weather_forecast] ([Id], [temperature], [max_temperature], [min_temperature], [humidity], [air_pressure], [wind_speed], [wind_direction], [icon], [main], [city_id]) VALUES (6, 77, 87, 78, 2, 5, 6, 7, N'9sd       ', N'Wind      ', 6)
INSERT [dbo].[weather_forecast] ([Id], [temperature], [max_temperature], [min_temperature], [humidity], [air_pressure], [wind_speed], [wind_direction], [icon], [main], [city_id]) VALUES (7, 48, 85, 62, 358, 15, 48, 62, N'85sd      ', N'Fog       ', 7)
INSERT [dbo].[weather_forecast] ([Id], [temperature], [max_temperature], [min_temperature], [humidity], [air_pressure], [wind_speed], [wind_direction], [icon], [main], [city_id]) VALUES (8, 46, 64, 12, 31, 17, 84, 21, N'35sd      ', N'Rain      ', 8)
INSERT [dbo].[weather_forecast] ([Id], [temperature], [max_temperature], [min_temperature], [humidity], [air_pressure], [wind_speed], [wind_direction], [icon], [main], [city_id]) VALUES (9, 33, 44, 55, 66, 77, 88, 79, N'2we       ', N'Fog       ', 9)
INSERT [dbo].[weather_forecast] ([Id], [temperature], [max_temperature], [min_temperature], [humidity], [air_pressure], [wind_speed], [wind_direction], [icon], [main], [city_id]) VALUES (10, 33, 11, 55, 99, 66, 44, 22, N'2w        ', N'Cloudy    ', 10)
GO
ALTER TABLE [dbo].[City]  WITH CHECK ADD  CONSTRAINT [FK_City_Country] FOREIGN KEY([Country_Id])
REFERENCES [dbo].[Country] ([Id])
GO
ALTER TABLE [dbo].[City] CHECK CONSTRAINT [FK_City_Country]
GO
ALTER TABLE [dbo].[weather_forecast]  WITH CHECK ADD  CONSTRAINT [FK_weather_forecast_City] FOREIGN KEY([city_id])
REFERENCES [dbo].[City] ([Id])
GO
ALTER TABLE [dbo].[weather_forecast] CHECK CONSTRAINT [FK_weather_forecast_City]
GO
USE [master]
GO
ALTER DATABASE [weather] SET  READ_WRITE 
GO
