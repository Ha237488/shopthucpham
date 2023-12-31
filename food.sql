USE [ShopThucPham]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 08/10/2023 10:00:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](256) NULL,
	[IsActive] [bit] NULL,
	[Image] [nvarchar](256) NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Message]    Script Date: 08/10/2023 10:00:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Message](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FromUserID] [int] NULL,
	[ToUserID] [int] NULL,
	[Content] [nvarchar](500) NULL,
	[CreatedDate] [datetime] NULL,
	[Send] [bit] NULL,
 CONSTRAINT [PK_Message] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 08/10/2023 10:00:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NULL,
	[ProductName] [nvarchar](50) NULL,
	[ProductPrice] [int] NULL,
	[Quantity] [int] NULL,
	[OrderID] [int] NULL,
	[ProductImage] [nvarchar](500) NULL,
 CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 08/10/2023 10:00:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[Status] [nvarchar](50) NULL,
	[DateOrder] [datetime] NULL,
	[DateShip] [datetime] NULL,
	[IsPaid] [bit] NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 08/10/2023 10:00:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](256) NULL,
	[Price] [int] NULL,
	[Image1] [nvarchar](500) NULL,
	[Quantity] [int] NULL,
	[PurchasedCount] [int] NULL,
	[Description] [nvarchar](max) NULL,
	[IsActive] [bit] NULL,
	[CategoryID] [int] NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 08/10/2023 10:00:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[username] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NULL,
	[password] [nvarchar](50) NULL,
	[isAdmin] [bit] NULL,
 CONSTRAINT [PK_Users_1] PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([ID], [Name], [IsActive], [Image]) VALUES (1006, N'Trứng Gia Cầm', 1, N'cat-7.jpg')
INSERT [dbo].[Categories] ([ID], [Name], [IsActive], [Image]) VALUES (1007, N'Rau Củ Quả', 1, N'cat-3.jpg')
INSERT [dbo].[Categories] ([ID], [Name], [IsActive], [Image]) VALUES (1008, N'Thịt Tươi Sống', 1, N'cat-5.jpg')
INSERT [dbo].[Categories] ([ID], [Name], [IsActive], [Image]) VALUES (1009, N'Nước Trái Cây', 1, N'cat-4.jpg')
INSERT [dbo].[Categories] ([ID], [Name], [IsActive], [Image]) VALUES (1010, N'Đồ Ăn Vặt', 1, N'cat-2.jpg')
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Message] ON 

INSERT [dbo].[Message] ([ID], [FromUserID], [ToUserID], [Content], [CreatedDate], [Send]) VALUES (29, 2, 1, N'hi shop', CAST(N'2022-07-26T15:08:39.133' AS DateTime), 1)
INSERT [dbo].[Message] ([ID], [FromUserID], [ToUserID], [Content], [CreatedDate], [Send]) VALUES (30, 2, 1, N'ấd', CAST(N'2022-07-26T15:08:49.193' AS DateTime), 1)
INSERT [dbo].[Message] ([ID], [FromUserID], [ToUserID], [Content], [CreatedDate], [Send]) VALUES (31, 4, 1, N'hi shop', CAST(N'2022-07-28T20:57:06.260' AS DateTime), 1)
INSERT [dbo].[Message] ([ID], [FromUserID], [ToUserID], [Content], [CreatedDate], [Send]) VALUES (32, 1, 4, N'chào bạn', CAST(N'2022-07-28T20:57:21.300' AS DateTime), 1)
INSERT [dbo].[Message] ([ID], [FromUserID], [ToUserID], [Content], [CreatedDate], [Send]) VALUES (33, 4, 1, N'aaaaaaaaaaa', CAST(N'2022-07-28T20:57:27.650' AS DateTime), 1)
INSERT [dbo].[Message] ([ID], [FromUserID], [ToUserID], [Content], [CreatedDate], [Send]) VALUES (34, 3, 1, N'ryut', CAST(N'2022-08-16T21:06:29.320' AS DateTime), 1)
INSERT [dbo].[Message] ([ID], [FromUserID], [ToUserID], [Content], [CreatedDate], [Send]) VALUES (35, 3, 1, N'fgedfg', CAST(N'2022-08-16T21:06:35.967' AS DateTime), 1)
INSERT [dbo].[Message] ([ID], [FromUserID], [ToUserID], [Content], [CreatedDate], [Send]) VALUES (36, 3, 1, N'asdasd', CAST(N'2022-08-16T21:06:38.037' AS DateTime), 1)
INSERT [dbo].[Message] ([ID], [FromUserID], [ToUserID], [Content], [CreatedDate], [Send]) VALUES (37, 3, 1, N'dd', CAST(N'2022-08-16T21:07:04.450' AS DateTime), 1)
INSERT [dbo].[Message] ([ID], [FromUserID], [ToUserID], [Content], [CreatedDate], [Send]) VALUES (38, 3, 1, N'oo', CAST(N'2022-08-16T21:09:04.690' AS DateTime), 1)
INSERT [dbo].[Message] ([ID], [FromUserID], [ToUserID], [Content], [CreatedDate], [Send]) VALUES (39, 2, 1, N'dsa', CAST(N'2022-08-26T09:52:39.307' AS DateTime), 1)
INSERT [dbo].[Message] ([ID], [FromUserID], [ToUserID], [Content], [CreatedDate], [Send]) VALUES (40, 2, 1, N'fdbdbf', CAST(N'2022-08-26T09:52:43.117' AS DateTime), 1)
INSERT [dbo].[Message] ([ID], [FromUserID], [ToUserID], [Content], [CreatedDate], [Send]) VALUES (41, 2, 1, N'ewr', CAST(N'2022-08-26T09:52:46.790' AS DateTime), 1)
INSERT [dbo].[Message] ([ID], [FromUserID], [ToUserID], [Content], [CreatedDate], [Send]) VALUES (42, 3, 1, N'htrh', CAST(N'2022-09-17T19:00:29.157' AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[Message] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderDetails] ON 

INSERT [dbo].[OrderDetails] ([ID], [ProductID], [ProductName], [ProductPrice], [Quantity], [OrderID], [ProductImage]) VALUES (9, 1, N'Face Jack Black Double-Duty Face', 28, 1, 9, N'71bJ8sbepzL._SX522_.jpg')
INSERT [dbo].[OrderDetails] ([ID], [ProductID], [ProductName], [ProductPrice], [Quantity], [OrderID], [ProductImage]) VALUES (10, 2, N'PCA SKIN Purifying Skin Care Face Mask', 50, 1, 10, N'61-cF2l6m2L._SY679_.jpg')
INSERT [dbo].[OrderDetails] ([ID], [ProductID], [ProductName], [ProductPrice], [Quantity], [OrderID], [ProductImage]) VALUES (12, 1, N'Face Jack Black Double-Duty Face', 28, 1, 12, N'71bJ8sbepzL._SX522_.jpg')
INSERT [dbo].[OrderDetails] ([ID], [ProductID], [ProductName], [ProductPrice], [Quantity], [OrderID], [ProductImage]) VALUES (13, 1, N'Face Jack Black Double-Duty Face', 28, 1, 13, N'71bJ8sbepzL._SX522_.jpg')
INSERT [dbo].[OrderDetails] ([ID], [ProductID], [ProductName], [ProductPrice], [Quantity], [OrderID], [ProductImage]) VALUES (14, 4, N'Cam sành (1Kg)', 28000, 2, 14, N'cam-sanh-loai-1kg.jpg')
SET IDENTITY_INSERT [dbo].[OrderDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([ID], [UserID], [Status], [DateOrder], [DateShip], [IsPaid]) VALUES (7, 3, N'Complete', CAST(N'2022-09-18T17:59:08.713' AS DateTime), CAST(N'2022-09-22T16:40:15.837' AS DateTime), 0)
INSERT [dbo].[Orders] ([ID], [UserID], [Status], [DateOrder], [DateShip], [IsPaid]) VALUES (8, 3, N'Complete', CAST(N'2022-09-18T17:59:12.723' AS DateTime), CAST(N'2022-09-22T16:40:17.763' AS DateTime), 0)
INSERT [dbo].[Orders] ([ID], [UserID], [Status], [DateOrder], [DateShip], [IsPaid]) VALUES (9, 3, N'Complete', CAST(N'2022-09-18T18:01:04.527' AS DateTime), CAST(N'2022-09-22T16:40:18.913' AS DateTime), 0)
INSERT [dbo].[Orders] ([ID], [UserID], [Status], [DateOrder], [DateShip], [IsPaid]) VALUES (10, 3, N'Complete', CAST(N'2022-09-18T18:05:00.083' AS DateTime), CAST(N'2022-09-22T16:40:20.010' AS DateTime), 0)
INSERT [dbo].[Orders] ([ID], [UserID], [Status], [DateOrder], [DateShip], [IsPaid]) VALUES (11, 3, N'Complete', CAST(N'2022-09-18T18:06:48.697' AS DateTime), CAST(N'2022-09-22T16:40:21.067' AS DateTime), 0)
INSERT [dbo].[Orders] ([ID], [UserID], [Status], [DateOrder], [DateShip], [IsPaid]) VALUES (12, 3, N'Complete', CAST(N'2022-09-18T18:10:25.793' AS DateTime), CAST(N'2022-09-22T16:40:22.113' AS DateTime), 0)
INSERT [dbo].[Orders] ([ID], [UserID], [Status], [DateOrder], [DateShip], [IsPaid]) VALUES (13, 3, N'Complete', CAST(N'2022-09-18T18:11:39.153' AS DateTime), CAST(N'2022-09-22T16:40:23.257' AS DateTime), 1)
INSERT [dbo].[Orders] ([ID], [UserID], [Status], [DateOrder], [DateShip], [IsPaid]) VALUES (14, 3, N'Processing', CAST(N'2022-12-04T20:43:06.443' AS DateTime), CAST(N'2022-12-07T20:43:06.443' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([ID], [Name], [Price], [Image1], [Quantity], [PurchasedCount], [Description], [IsActive], [CategoryID]) VALUES (1, N'Trứng gà CP loại 2', 36000, N'trung-ga-cp-loai-2-hop-10-trung.jpg', 100, 10, N'Sỉ lẻ trứng gà CP loại 2 khay 10 trứng cam kết chất lượng trứng gà tươi 100%, an toàn kiểm định GMP
– Trứng gà CP loại 2 khay 10 trứng do Thực Phẩm Nhanh phân phối được lựa chọn từ những quả trứng gà tươi ngon, từ cơ sở trứng gia cầm sạch. Sản phẩm có nguồn gốc rõ ràng nên người tiêu dùng có thể hoàn toàn yên tâm khi sử dụng. Thực Phẩm Nhanh chuyên cung cấp các mặt hàng rau củ quả, trái cây tươi, thực phẩm tươi sống cùng các loại gia vị phụ gia cho các hộ gia đình, nhà hàng, khách sạn, bếp ăn công nghiệp trong TP. Hồ Chí Minh và các Tỉnh lân cận.', 1, 1006)
INSERT [dbo].[Products] ([ID], [Name], [Price], [Image1], [Quantity], [PurchasedCount], [Description], [IsActive], [CategoryID]) VALUES (2, N'Bắp cải trắng - 1kg', 24000, N'bap-cai-trang.jpg', 50, 3, N'Lợi ích cho sức khỏe của Bắp cải trắng
+ Giảm các dấu hiệu lão hóa
+ Chống lại các gốc tự do
+ Chữa lành vết thương
+ Tốt cho làn da
+ Chống viêm, giảm dị ứng
+ Ngăn ngừa ung thư
+ Tốt cho hệ tiêu hóa
+ Hỗ trợ giảm cân
+ Bảo vệ mắt
+ Tốt cho tóc
+ Cải thiện sức khỏe tim mạch
+ Tốt cho não
+ Giúp xương chắc khỏe
+ Điều hòa huyết áp
+ Tốt cho người bị đái tháo đường
+ Tốt cho người bị đái tháo đường
+ Tăng cường miễn dịch
+ Điều trị viêm loét dạ dày', 1, 1007)
INSERT [dbo].[Products] ([ID], [Name], [Price], [Image1], [Quantity], [PurchasedCount], [Description], [IsActive], [CategoryID]) VALUES (3, N'Thịt heo xay CP – 300g', 34000, N'thit-heo-xay-cp-khay-300g.jpg', 200, 3, N'Lợi ích cho sức khỏe của Thịt heo xay CP
+ Tăng cường hệ miễn dịch
+ Cải thiện trí tuệ
+ Chống trầm cảm
+ Chống ung thư
+ Giảm ho và việc chữa trị táo bón
+ Duy trì cơ bắp', 1, 1008)
INSERT [dbo].[Products] ([ID], [Name], [Price], [Image1], [Quantity], [PurchasedCount], [Description], [IsActive], [CategoryID]) VALUES (4, N'Cam sành (1Kg)', 28000, N'cam-sanh-loai-1kg.jpg', 100, 5, N' Lợi ích cho sức khỏe của Cam sành
+ Tăng sức đề kháng cho cơ thể
+ Giúp cân bằng huyết áp
+ Điều hòa mức cholesterol và đường huyết cho cơ thể
+ Phòng chống ung thư
+ Trị chứng táo bón
+ Chữa lành các vết thương', 1, 1007)
INSERT [dbo].[Products] ([ID], [Name], [Price], [Image1], [Quantity], [PurchasedCount], [Description], [IsActive], [CategoryID]) VALUES (5, N'Cải ngọt – Loại 1kg', 21000, N'cai-ngot.jpg', 10, 1, N'Lợi ích cho sức khỏe của Cải ngọt
+ Hỗ trợ điều trị bệnh Gout
+ Cung cấp khoáng chất cho người bị loãng xương
+ Ngăn ngừa ung thư hiệu quả', 1, 1007)
INSERT [dbo].[Products] ([ID], [Name], [Price], [Image1], [Quantity], [PurchasedCount], [Description], [IsActive], [CategoryID]) VALUES (17, N'Rau nhút – Loại 1kg', 84000, N'rau-nhut-loai-1kg.jpg', 200, 1, N'Lợi ích cho sức khỏe của Rau nhút
+ Giàu chất chống oxy hóa
+ Ngăn ngừa tổn thương gan
+ Làm lành da
+ Kháng khuẩn và tiêu diệt các loại nấm có hại', 1, 1007)
INSERT [dbo].[Products] ([ID], [Name], [Price], [Image1], [Quantity], [PurchasedCount], [Description], [IsActive], [CategoryID]) VALUES (18, N'Thịt bò xuất khẩu', 80000, N'bo1.jpg', 25, 3, N'mo ta', 1, 1008)
INSERT [dbo].[Products] ([ID], [Name], [Price], [Image1], [Quantity], [PurchasedCount], [Description], [IsActive], [CategoryID]) VALUES (19, N'Thịt bò cobe', 200000, N'bo4.jpg', 20, 3, N'mo ta', 1, 1008)
INSERT [dbo].[Products] ([ID], [Name], [Price], [Image1], [Quantity], [PurchasedCount], [Description], [IsActive], [CategoryID]) VALUES (20, N'Bơ Tây Nguyên', 25000, N'b1.jpg', 12, 3, N'mo ta', 1, 1007)
INSERT [dbo].[Products] ([ID], [Name], [Price], [Image1], [Quantity], [PurchasedCount], [Description], [IsActive], [CategoryID]) VALUES (21, N'Rau muống xanh', 17000, N'm1.jpg', 23, 3, N'mo ta', 1, 1007)
INSERT [dbo].[Products] ([ID], [Name], [Price], [Image1], [Quantity], [PurchasedCount], [Description], [IsActive], [CategoryID]) VALUES (22, N'Gan heo', 35000, N'gan1.jpg', 23, 6, N'mo ta', 1, 1008)
INSERT [dbo].[Products] ([ID], [Name], [Price], [Image1], [Quantity], [PurchasedCount], [Description], [IsActive], [CategoryID]) VALUES (23, N'Nho Ninh Thuận', 90000, N'nho1.jpg', 12, 5, N'mo ta', 1, 1007)
INSERT [dbo].[Products] ([ID], [Name], [Price], [Image1], [Quantity], [PurchasedCount], [Description], [IsActive], [CategoryID]) VALUES (24, N'Thanh Long ', 45000, N'tl1.jpg', 22, 5, N'mo ta', 1, 1007)
INSERT [dbo].[Products] ([ID], [Name], [Price], [Image1], [Quantity], [PurchasedCount], [Description], [IsActive], [CategoryID]) VALUES (25, N'Trứng gà con so', 30000, N'trung1.jpg', 11, 4, N'mo ta', 1, 1006)
INSERT [dbo].[Products] ([ID], [Name], [Price], [Image1], [Quantity], [PurchasedCount], [Description], [IsActive], [CategoryID]) VALUES (26, N'Táo Mĩ', 450000, N'tao1.jpg', 2, 2, N'mo ta', 1, 1007)
INSERT [dbo].[Products] ([ID], [Name], [Price], [Image1], [Quantity], [PurchasedCount], [Description], [IsActive], [CategoryID]) VALUES (27, N'Chuối ', 12000, N'chuoi1.jpg', 12, 2, N'mo ta', 1, 1007)
INSERT [dbo].[Products] ([ID], [Name], [Price], [Image1], [Quantity], [PurchasedCount], [Description], [IsActive], [CategoryID]) VALUES (28, N'Cải xanh', 7000, N'c1.jpg', 33, 2, N'mo ta', 1, 1007)
INSERT [dbo].[Products] ([ID], [Name], [Price], [Image1], [Quantity], [PurchasedCount], [Description], [IsActive], [CategoryID]) VALUES (29, N'Trứng Vịt ', 8000, N't1.jpg', 100, 10, N'mo ta', 1, 1006)
INSERT [dbo].[Products] ([ID], [Name], [Price], [Image1], [Quantity], [PurchasedCount], [Description], [IsActive], [CategoryID]) VALUES (30, N'Trứng Cút', 500, N't2.jpg', 200, 50, N'mo ta', 1, 1006)
INSERT [dbo].[Products] ([ID], [Name], [Price], [Image1], [Quantity], [PurchasedCount], [Description], [IsActive], [CategoryID]) VALUES (31, N'Nước Dừa', 9000, N'n1.webp', 50, 10, N'mo ta', 1, 1009)
INSERT [dbo].[Products] ([ID], [Name], [Price], [Image1], [Quantity], [PurchasedCount], [Description], [IsActive], [CategoryID]) VALUES (32, N'Nước Cam', 15000, N'n2.jfif', 75, 35, N'mo ta', 1, 1009)
INSERT [dbo].[Products] ([ID], [Name], [Price], [Image1], [Quantity], [PurchasedCount], [Description], [IsActive], [CategoryID]) VALUES (33, N'Nước Ổi', 17000, N'n3.png', 90, 15, N'mo ta', 1, 1009)
INSERT [dbo].[Products] ([ID], [Name], [Price], [Image1], [Quantity], [PurchasedCount], [Description], [IsActive], [CategoryID]) VALUES (34, N'Nước Táo', 20000, N'n4.jpg', 63, 20, N'mo ta', 1, 1009)
INSERT [dbo].[Products] ([ID], [Name], [Price], [Image1], [Quantity], [PurchasedCount], [Description], [IsActive], [CategoryID]) VALUES (35, N'Kẹo bạc hà', 3000, N'k1.jpg', 50, 10, N'mo ta', 1, 1010)
INSERT [dbo].[Products] ([ID], [Name], [Price], [Image1], [Quantity], [PurchasedCount], [Description], [IsActive], [CategoryID]) VALUES (36, N'Kẹo singum Cool Air', 5000, N'k2.jpg', 72, 13, N'mo ta ', 1, 1010)
INSERT [dbo].[Products] ([ID], [Name], [Price], [Image1], [Quantity], [PurchasedCount], [Description], [IsActive], [CategoryID]) VALUES (37, N'Kẹo Mút', 7500, N'k3.jfif', 62, 18, N'mo ta ', 1, 1010)
INSERT [dbo].[Products] ([ID], [Name], [Price], [Image1], [Quantity], [PurchasedCount], [Description], [IsActive], [CategoryID]) VALUES (38, N'Bánh macaron', 65000, N'a1.jpg', 69, 26, N'mo ta', 1, 1010)
INSERT [dbo].[Products] ([ID], [Name], [Price], [Image1], [Quantity], [PurchasedCount], [Description], [IsActive], [CategoryID]) VALUES (39, N'Bánh trung thu', 49000, N'a2.jpg', 64, 20, N'mo ta ', 1, 1010)
INSERT [dbo].[Products] ([ID], [Name], [Price], [Image1], [Quantity], [PurchasedCount], [Description], [IsActive], [CategoryID]) VALUES (40, N'Bánh rán Doremon', 90000, N'a3.jpg', 67, 30, N'mo ta', 1, 1010)
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
INSERT [dbo].[Users] ([username], [Email], [password], [isAdmin]) VALUES (N'Admin', N'admin@gmail.com', N'123456', 1)
INSERT [dbo].[Users] ([username], [Email], [password], [isAdmin]) VALUES (N'dsfsf', N'nlkhuong1800120@student.ctuet.edu.vn', N'123', 0)
INSERT [dbo].[Users] ([username], [Email], [password], [isAdmin]) VALUES (N'ha123', N'ha@gmail.com', N'123', 1)
INSERT [dbo].[Users] ([username], [Email], [password], [isAdmin]) VALUES (N'Nguyen Nguyen', N'nguyen@gmail.com', N'123456', 0)
INSERT [dbo].[Users] ([username], [Email], [password], [isAdmin]) VALUES (N'Nguyen Van A', N'nva@gmail.com', N'123456', 0)
INSERT [dbo].[Users] ([username], [Email], [password], [isAdmin]) VALUES (N'Nguyễn Văn B', N'nvb@gmail.com', N'123456', 0)
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK__OrderDeta__Order__25869641] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders] ([ID])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK__OrderDeta__Order__25869641]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK__OrderDeta__Produ__24927208] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ID])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK__OrderDeta__Produ__24927208]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK__Products__Catego__239E4DCF] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Categories] ([ID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK__Products__Catego__239E4DCF]
GO
