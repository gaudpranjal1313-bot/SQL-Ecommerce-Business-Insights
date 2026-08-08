USE [master]
GO
/****** Object:  Database [EcommerceBusinessAnalysis]    Script Date: 08-08-2026 18:44:33 ******/
CREATE DATABASE [EcommerceBusinessAnalysis]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'EcommerceBusinessAnalysis', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL17.SQLEXPRESS\MSSQL\DATA\EcommerceBusinessAnalysis.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'EcommerceBusinessAnalysis_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL17.SQLEXPRESS\MSSQL\DATA\EcommerceBusinessAnalysis_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [EcommerceBusinessAnalysis] SET COMPATIBILITY_LEVEL = 170
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [EcommerceBusinessAnalysis].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [EcommerceBusinessAnalysis] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [EcommerceBusinessAnalysis] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [EcommerceBusinessAnalysis] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [EcommerceBusinessAnalysis] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [EcommerceBusinessAnalysis] SET ARITHABORT OFF 
GO
ALTER DATABASE [EcommerceBusinessAnalysis] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [EcommerceBusinessAnalysis] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [EcommerceBusinessAnalysis] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [EcommerceBusinessAnalysis] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [EcommerceBusinessAnalysis] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [EcommerceBusinessAnalysis] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [EcommerceBusinessAnalysis] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [EcommerceBusinessAnalysis] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [EcommerceBusinessAnalysis] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [EcommerceBusinessAnalysis] SET  ENABLE_BROKER 
GO
ALTER DATABASE [EcommerceBusinessAnalysis] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [EcommerceBusinessAnalysis] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [EcommerceBusinessAnalysis] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [EcommerceBusinessAnalysis] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [EcommerceBusinessAnalysis] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [EcommerceBusinessAnalysis] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [EcommerceBusinessAnalysis] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [EcommerceBusinessAnalysis] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [EcommerceBusinessAnalysis] SET  MULTI_USER 
GO
ALTER DATABASE [EcommerceBusinessAnalysis] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [EcommerceBusinessAnalysis] SET DB_CHAINING OFF 
GO
ALTER DATABASE [EcommerceBusinessAnalysis] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [EcommerceBusinessAnalysis] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [EcommerceBusinessAnalysis] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [EcommerceBusinessAnalysis] SET OPTIMIZED_LOCKING = OFF 
GO
ALTER DATABASE [EcommerceBusinessAnalysis] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [EcommerceBusinessAnalysis] SET QUERY_STORE = ON
GO
ALTER DATABASE [EcommerceBusinessAnalysis] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [EcommerceBusinessAnalysis]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 08-08-2026 18:44:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[Customer_ID] [int] NOT NULL,
	[Customer_Name] [varchar](100) NOT NULL,
	[City] [varchar](50) NULL,
	[Region] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Customer_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order_Details]    Script Date: 08-08-2026 18:44:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order_Details](
	[Order_Detail_ID] [int] NOT NULL,
	[Order_ID] [int] NOT NULL,
	[Product_ID] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Discount] [decimal](5, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[Order_Detail_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 08-08-2026 18:44:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[Order_ID] [int] NOT NULL,
	[Customer_ID] [int] NOT NULL,
	[Order_Date] [date] NULL,
	[Region] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Order_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 08-08-2026 18:44:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Product_ID] [int] NOT NULL,
	[Product_Name] [varchar](100) NOT NULL,
	[Category] [varchar](50) NULL,
	[Price] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[Product_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Customers] ([Customer_ID], [Customer_Name], [City], [Region]) VALUES (101, N'Aarav Sharma', N'Mumbai', N'West')
GO
INSERT [dbo].[Customers] ([Customer_ID], [Customer_Name], [City], [Region]) VALUES (102, N'Neha Verma', N'Delhi', N'North')
GO
INSERT [dbo].[Customers] ([Customer_ID], [Customer_Name], [City], [Region]) VALUES (103, N'Rahul Mehta', N'Pune', N'West')
GO
INSERT [dbo].[Customers] ([Customer_ID], [Customer_Name], [City], [Region]) VALUES (104, N'Sneha Iyer', N'Bengaluru', N'South')
GO
INSERT [dbo].[Customers] ([Customer_ID], [Customer_Name], [City], [Region]) VALUES (105, N'Karan Singh', N'Jaipur', N'North')
GO
INSERT [dbo].[Customers] ([Customer_ID], [Customer_Name], [City], [Region]) VALUES (106, N'Priya Nair', N'Kochi', N'South')
GO
INSERT [dbo].[Customers] ([Customer_ID], [Customer_Name], [City], [Region]) VALUES (107, N'Rohan Gupta', N'Kolkata', N'East')
GO
INSERT [dbo].[Customers] ([Customer_ID], [Customer_Name], [City], [Region]) VALUES (108, N'Ananya Das', N'Bhubaneswar', N'East')
GO
INSERT [dbo].[Customers] ([Customer_ID], [Customer_Name], [City], [Region]) VALUES (109, N'Vikram Patel', N'Ahmedabad', N'West')
GO
INSERT [dbo].[Customers] ([Customer_ID], [Customer_Name], [City], [Region]) VALUES (110, N'Ishita Kapoor', N'Chandigarh', N'North')
GO
INSERT [dbo].[Customers] ([Customer_ID], [Customer_Name], [City], [Region]) VALUES (111, N'Aditya Rao', N'Hyderabad', N'South')
GO
INSERT [dbo].[Customers] ([Customer_ID], [Customer_Name], [City], [Region]) VALUES (112, N'Pooja Sen', N'Kolkata', N'East')
GO
INSERT [dbo].[Customers] ([Customer_ID], [Customer_Name], [City], [Region]) VALUES (113, N'Arjun Joshi', N'Nagpur', N'West')
GO
INSERT [dbo].[Customers] ([Customer_ID], [Customer_Name], [City], [Region]) VALUES (114, N'Meera Malhotra', N'Delhi', N'North')
GO
INSERT [dbo].[Customers] ([Customer_ID], [Customer_Name], [City], [Region]) VALUES (115, N'Kabir Shah', N'Surat', N'West')
GO
INSERT [dbo].[Order_Details] ([Order_Detail_ID], [Order_ID], [Product_ID], [Quantity], [Discount]) VALUES (1, 1001, 201, 1, CAST(0.05 AS Decimal(5, 2)))
GO
INSERT [dbo].[Order_Details] ([Order_Detail_ID], [Order_ID], [Product_ID], [Quantity], [Discount]) VALUES (2, 1001, 203, 2, CAST(0.10 AS Decimal(5, 2)))
GO
INSERT [dbo].[Order_Details] ([Order_Detail_ID], [Order_ID], [Product_ID], [Quantity], [Discount]) VALUES (3, 1002, 202, 1, CAST(0.05 AS Decimal(5, 2)))
GO
INSERT [dbo].[Order_Details] ([Order_Detail_ID], [Order_ID], [Product_ID], [Quantity], [Discount]) VALUES (4, 1003, 207, 2, CAST(0.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Order_Details] ([Order_Detail_ID], [Order_ID], [Product_ID], [Quantity], [Discount]) VALUES (5, 1004, 204, 1, CAST(0.10 AS Decimal(5, 2)))
GO
INSERT [dbo].[Order_Details] ([Order_Detail_ID], [Order_ID], [Product_ID], [Quantity], [Discount]) VALUES (6, 1005, 205, 1, CAST(0.05 AS Decimal(5, 2)))
GO
INSERT [dbo].[Order_Details] ([Order_Detail_ID], [Order_ID], [Product_ID], [Quantity], [Discount]) VALUES (7, 1006, 210, 2, CAST(0.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Order_Details] ([Order_Detail_ID], [Order_ID], [Product_ID], [Quantity], [Discount]) VALUES (8, 1007, 208, 3, CAST(0.10 AS Decimal(5, 2)))
GO
INSERT [dbo].[Order_Details] ([Order_Detail_ID], [Order_ID], [Product_ID], [Quantity], [Discount]) VALUES (9, 1008, 211, 1, CAST(0.05 AS Decimal(5, 2)))
GO
INSERT [dbo].[Order_Details] ([Order_Detail_ID], [Order_ID], [Product_ID], [Quantity], [Discount]) VALUES (10, 1009, 209, 2, CAST(0.10 AS Decimal(5, 2)))
GO
INSERT [dbo].[Order_Details] ([Order_Detail_ID], [Order_ID], [Product_ID], [Quantity], [Discount]) VALUES (11, 1010, 206, 1, CAST(0.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Order_Details] ([Order_Detail_ID], [Order_ID], [Product_ID], [Quantity], [Discount]) VALUES (12, 1011, 212, 1, CAST(0.05 AS Decimal(5, 2)))
GO
INSERT [dbo].[Order_Details] ([Order_Detail_ID], [Order_ID], [Product_ID], [Quantity], [Discount]) VALUES (13, 1012, 202, 1, CAST(0.10 AS Decimal(5, 2)))
GO
INSERT [dbo].[Order_Details] ([Order_Detail_ID], [Order_ID], [Product_ID], [Quantity], [Discount]) VALUES (14, 1013, 203, 3, CAST(0.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Order_Details] ([Order_Detail_ID], [Order_ID], [Product_ID], [Quantity], [Discount]) VALUES (15, 1014, 204, 2, CAST(0.05 AS Decimal(5, 2)))
GO
INSERT [dbo].[Order_Details] ([Order_Detail_ID], [Order_ID], [Product_ID], [Quantity], [Discount]) VALUES (16, 1015, 207, 1, CAST(0.10 AS Decimal(5, 2)))
GO
INSERT [dbo].[Order_Details] ([Order_Detail_ID], [Order_ID], [Product_ID], [Quantity], [Discount]) VALUES (17, 1016, 201, 1, CAST(0.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Order_Details] ([Order_Detail_ID], [Order_ID], [Product_ID], [Quantity], [Discount]) VALUES (18, 1016, 210, 1, CAST(0.05 AS Decimal(5, 2)))
GO
INSERT [dbo].[Order_Details] ([Order_Detail_ID], [Order_ID], [Product_ID], [Quantity], [Discount]) VALUES (19, 1017, 202, 1, CAST(0.05 AS Decimal(5, 2)))
GO
INSERT [dbo].[Order_Details] ([Order_Detail_ID], [Order_ID], [Product_ID], [Quantity], [Discount]) VALUES (20, 1018, 211, 2, CAST(0.10 AS Decimal(5, 2)))
GO
INSERT [dbo].[Order_Details] ([Order_Detail_ID], [Order_ID], [Product_ID], [Quantity], [Discount]) VALUES (21, 1019, 208, 2, CAST(0.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[Order_Details] ([Order_Detail_ID], [Order_ID], [Product_ID], [Quantity], [Discount]) VALUES (22, 1020, 212, 1, CAST(0.05 AS Decimal(5, 2)))
GO
INSERT [dbo].[Orders] ([Order_ID], [Customer_ID], [Order_Date], [Region]) VALUES (1001, 101, CAST(N'2026-01-05' AS Date), N'West')
GO
INSERT [dbo].[Orders] ([Order_ID], [Customer_ID], [Order_Date], [Region]) VALUES (1002, 102, CAST(N'2026-01-12' AS Date), N'North')
GO
INSERT [dbo].[Orders] ([Order_ID], [Customer_ID], [Order_Date], [Region]) VALUES (1003, 103, CAST(N'2026-01-18' AS Date), N'West')
GO
INSERT [dbo].[Orders] ([Order_ID], [Customer_ID], [Order_Date], [Region]) VALUES (1004, 104, CAST(N'2026-02-02' AS Date), N'South')
GO
INSERT [dbo].[Orders] ([Order_ID], [Customer_ID], [Order_Date], [Region]) VALUES (1005, 105, CAST(N'2026-02-08' AS Date), N'North')
GO
INSERT [dbo].[Orders] ([Order_ID], [Customer_ID], [Order_Date], [Region]) VALUES (1006, 106, CAST(N'2026-02-15' AS Date), N'South')
GO
INSERT [dbo].[Orders] ([Order_ID], [Customer_ID], [Order_Date], [Region]) VALUES (1007, 107, CAST(N'2026-03-01' AS Date), N'East')
GO
INSERT [dbo].[Orders] ([Order_ID], [Customer_ID], [Order_Date], [Region]) VALUES (1008, 108, CAST(N'2026-03-06' AS Date), N'East')
GO
INSERT [dbo].[Orders] ([Order_ID], [Customer_ID], [Order_Date], [Region]) VALUES (1009, 109, CAST(N'2026-03-12' AS Date), N'West')
GO
INSERT [dbo].[Orders] ([Order_ID], [Customer_ID], [Order_Date], [Region]) VALUES (1010, 110, CAST(N'2026-03-18' AS Date), N'North')
GO
INSERT [dbo].[Orders] ([Order_ID], [Customer_ID], [Order_Date], [Region]) VALUES (1011, 111, CAST(N'2026-04-03' AS Date), N'South')
GO
INSERT [dbo].[Orders] ([Order_ID], [Customer_ID], [Order_Date], [Region]) VALUES (1012, 112, CAST(N'2026-04-10' AS Date), N'East')
GO
INSERT [dbo].[Orders] ([Order_ID], [Customer_ID], [Order_Date], [Region]) VALUES (1013, 113, CAST(N'2026-04-16' AS Date), N'West')
GO
INSERT [dbo].[Orders] ([Order_ID], [Customer_ID], [Order_Date], [Region]) VALUES (1014, 114, CAST(N'2026-05-02' AS Date), N'North')
GO
INSERT [dbo].[Orders] ([Order_ID], [Customer_ID], [Order_Date], [Region]) VALUES (1015, 115, CAST(N'2026-05-08' AS Date), N'West')
GO
INSERT [dbo].[Orders] ([Order_ID], [Customer_ID], [Order_Date], [Region]) VALUES (1016, 101, CAST(N'2026-05-14' AS Date), N'West')
GO
INSERT [dbo].[Orders] ([Order_ID], [Customer_ID], [Order_Date], [Region]) VALUES (1017, 103, CAST(N'2026-05-20' AS Date), N'West')
GO
INSERT [dbo].[Orders] ([Order_ID], [Customer_ID], [Order_Date], [Region]) VALUES (1018, 106, CAST(N'2026-06-01' AS Date), N'South')
GO
INSERT [dbo].[Orders] ([Order_ID], [Customer_ID], [Order_Date], [Region]) VALUES (1019, 108, CAST(N'2026-06-09' AS Date), N'East')
GO
INSERT [dbo].[Orders] ([Order_ID], [Customer_ID], [Order_Date], [Region]) VALUES (1020, 110, CAST(N'2026-06-15' AS Date), N'North')
GO
INSERT [dbo].[Products] ([Product_ID], [Product_Name], [Category], [Price]) VALUES (201, N'Laptop', N'Electronics', CAST(55000.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Products] ([Product_ID], [Product_Name], [Category], [Price]) VALUES (202, N'Smartphone', N'Electronics', CAST(30000.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Products] ([Product_ID], [Product_Name], [Category], [Price]) VALUES (203, N'Wireless Mouse', N'Electronics', CAST(1200.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Products] ([Product_ID], [Product_Name], [Category], [Price]) VALUES (204, N'Office Chair', N'Furniture', CAST(8500.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Products] ([Product_ID], [Product_Name], [Category], [Price]) VALUES (205, N'Study Table', N'Furniture', CAST(12000.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Products] ([Product_ID], [Product_Name], [Category], [Price]) VALUES (206, N'Bookshelf', N'Furniture', CAST(6500.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Products] ([Product_ID], [Product_Name], [Category], [Price]) VALUES (207, N'Running Shoes', N'Fashion', CAST(3500.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Products] ([Product_ID], [Product_Name], [Category], [Price]) VALUES (208, N'Backpack', N'Fashion', CAST(2200.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Products] ([Product_ID], [Product_Name], [Category], [Price]) VALUES (209, N'Jacket', N'Fashion', CAST(4500.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Products] ([Product_ID], [Product_Name], [Category], [Price]) VALUES (210, N'Coffee Maker', N'Home Appliances', CAST(5000.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Products] ([Product_ID], [Product_Name], [Category], [Price]) VALUES (211, N'Mixer Grinder', N'Home Appliances', CAST(4200.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Products] ([Product_ID], [Product_Name], [Category], [Price]) VALUES (212, N'Air Fryer', N'Home Appliances', CAST(7500.00 AS Decimal(10, 2)))
GO
ALTER TABLE [dbo].[Order_Details] ADD  DEFAULT ((0)) FOR [Discount]
GO
ALTER TABLE [dbo].[Order_Details]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Orders] FOREIGN KEY([Order_ID])
REFERENCES [dbo].[Orders] ([Order_ID])
GO
ALTER TABLE [dbo].[Order_Details] CHECK CONSTRAINT [FK_OrderDetails_Orders]
GO
ALTER TABLE [dbo].[Order_Details]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Products] FOREIGN KEY([Product_ID])
REFERENCES [dbo].[Products] ([Product_ID])
GO
ALTER TABLE [dbo].[Order_Details] CHECK CONSTRAINT [FK_OrderDetails_Products]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Customers] FOREIGN KEY([Customer_ID])
REFERENCES [dbo].[Customers] ([Customer_ID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Customers]
GO
USE [master]
GO
ALTER DATABASE [EcommerceBusinessAnalysis] SET  READ_WRITE 
GO
