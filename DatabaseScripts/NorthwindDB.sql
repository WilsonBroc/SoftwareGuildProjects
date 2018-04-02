USE [master]
GO

/****** Object:  Database [Northwind]    Script Date: 7/8/2016 12:31:20 PM ******/
CREATE DATABASE [Northwind]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Northwind', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQL2014\MSSQL\DATA\northwnd.mdf' , SIZE = 5312KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Northwind_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQL2014\MSSQL\DATA\northwnd.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO

ALTER DATABASE [Northwind] SET COMPATIBILITY_LEVEL = 120
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Northwind].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO

ALTER DATABASE [Northwind] SET ANSI_NULL_DEFAULT OFF 
GO

ALTER DATABASE [Northwind] SET ANSI_NULLS OFF 
GO

ALTER DATABASE [Northwind] SET ANSI_PADDING OFF 
GO

ALTER DATABASE [Northwind] SET ANSI_WARNINGS OFF 
GO

ALTER DATABASE [Northwind] SET ARITHABORT OFF 
GO

ALTER DATABASE [Northwind] SET AUTO_CLOSE ON 
GO

ALTER DATABASE [Northwind] SET AUTO_SHRINK OFF 
GO

ALTER DATABASE [Northwind] SET AUTO_UPDATE_STATISTICS ON 
GO

ALTER DATABASE [Northwind] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO

ALTER DATABASE [Northwind] SET CURSOR_DEFAULT  GLOBAL 
GO

ALTER DATABASE [Northwind] SET CONCAT_NULL_YIELDS_NULL OFF 
GO

ALTER DATABASE [Northwind] SET NUMERIC_ROUNDABORT OFF 
GO

ALTER DATABASE [Northwind] SET QUOTED_IDENTIFIER OFF 
GO

ALTER DATABASE [Northwind] SET RECURSIVE_TRIGGERS OFF 
GO

ALTER DATABASE [Northwind] SET  ENABLE_BROKER 
GO

ALTER DATABASE [Northwind] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO

ALTER DATABASE [Northwind] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO

ALTER DATABASE [Northwind] SET TRUSTWORTHY OFF 
GO

ALTER DATABASE [Northwind] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO

ALTER DATABASE [Northwind] SET PARAMETERIZATION SIMPLE 
GO

ALTER DATABASE [Northwind] SET READ_COMMITTED_SNAPSHOT OFF 
GO

ALTER DATABASE [Northwind] SET HONOR_BROKER_PRIORITY OFF 
GO

ALTER DATABASE [Northwind] SET RECOVERY SIMPLE 
GO

ALTER DATABASE [Northwind] SET  MULTI_USER 
GO

ALTER DATABASE [Northwind] SET PAGE_VERIFY CHECKSUM  
GO

ALTER DATABASE [Northwind] SET DB_CHAINING OFF 
GO

ALTER DATABASE [Northwind] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO

ALTER DATABASE [Northwind] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO

ALTER DATABASE [Northwind] SET DELAYED_DURABILITY = DISABLED 
GO

ALTER DATABASE [Northwind] SET  READ_WRITE 
GO

