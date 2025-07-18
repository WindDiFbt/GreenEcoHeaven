USE [master]
GO
/****** Object:  Database [FoodStoreDB5]    Script Date: 6/13/2025 12:05:41 AM ******/
CREATE DATABASE [FoodStoreDB4]
GO

USE [FoodStoreDB4]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 6/13/2025 12:05:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[category_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](200) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Deleted_Category]    Script Date: 6/13/2025 12:05:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Deleted_Category](
	[id] [int] NOT NULL,
	[name] [nvarchar](200) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 6/13/2025 12:05:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[order_id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NULL,
	[fullname] [nvarchar](100) NULL,
	[email] [nvarchar](150) NULL,
	[phone_number] [nvarchar](20) NULL,
	[address] [nvarchar](255) NULL,
	[note] [nvarchar](1000) NULL,
	[order_date] [datetime] NULL,
	[status] [int] NULL,
	[total_money] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders_Details]    Script Date: 6/13/2025 12:05:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders_Details](
	[order_id] [int] NULL,
	[product_id] [int] NULL,
	[price] [int] NULL,
	[amount] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 6/13/2025 12:05:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[product_id] [int] IDENTITY(1,1) NOT NULL,
	[category_id] [int] NULL,
	[name] [nvarchar](350) NULL,
	[discount] [int] NULL,
	[image] [nvarchar](500) NULL,
	[ingredient] [nvarchar](max) NULL,
	[user_manual] [nvarchar](max) NULL,
	[more_info] [nvarchar](max) NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
	[deleted] [int] NULL,
	[price] [int] NULL,
	[weight] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 6/13/2025 12:05:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[user_id] [int] IDENTITY(1,1) NOT NULL,
	[roleNo] [int] NULL,
	[fullname] [nvarchar](100) NULL,
	[email] [nvarchar](255) NULL,
	[phone_number] [nvarchar](20) NULL,
	[address] [nvarchar](255) NULL,
	[account_name] [nvarchar](32) NULL,
	[password] [nvarchar](32) NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
	[deleted] [int] NULL,
	[date_of_birth] [date] NULL,
	[gender] [int] NULL,
	[avatar] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([category_id], [name]) VALUES (1, N'Rau củ')
INSERT [dbo].[Category] ([category_id], [name]) VALUES (2, N'Trái cây')
INSERT [dbo].[Category] ([category_id], [name]) VALUES (3, N'Gạo, ngũ cốc')
INSERT [dbo].[Category] ([category_id], [name]) VALUES (4, N'Đậu')
INSERT [dbo].[Category] ([category_id], [name]) VALUES (5, N'Hạt')
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([product_id], [category_id], [name], [discount], [image], [ingredient], [user_manual], [more_info], [created_at], [updated_at], [deleted], [price], [weight]) VALUES (1, 1, N'Bắp cải hữu cơ', 0, N'https://res.cloudinary.com/dbnqy4pmh/image/upload/v1749744807/bap_m0rkxx.png', NULL, NULL, N'Bắp cải được trồng theo phương pháp hữu cơ, không sử dụng thuốc trừ sâu hay phân bón hóa học. Lá giòn, tươi xanh, thích hợp cho các món xào, luộc hoặc muối chua. Đảm bảo an toàn cho sức khỏe người dùng.', CAST(N'2025-06-12T23:38:12.637' AS DateTime), NULL, 0, 85000, NULL)
INSERT [dbo].[Product] ([product_id], [category_id], [name], [discount], [image], [ingredient], [user_manual], [more_info], [created_at], [updated_at], [deleted], [price], [weight]) VALUES (2, 1, N'Bí đỏ', 0, N'https://res.cloudinary.com/dbnqy4pmh/image/upload/v1749744897/bido_qomnth.png', NULL, NULL, N'Bí đỏ giàu vitamin A và chất chống oxy hóa, tốt cho mắt và hệ miễn dịch. Thịt bí mềm, ngọt bùi, dùng chế biến súp, nấu canh hoặc làm bánh.', CAST(N'2025-06-12T23:38:12.637' AS DateTime), NULL, 0, 105000, NULL)
INSERT [dbo].[Product] ([product_id], [category_id], [name], [discount], [image], [ingredient], [user_manual], [more_info], [created_at], [updated_at], [deleted], [price], [weight]) VALUES (3, 1, N'Bầu hữu cơ', 0, N'https://res.cloudinary.com/dbnqy4pmh/image/upload/v1749744898/bau_pzukx1.png', NULL, NULL, N'Bầu tươi được canh tác theo tiêu chuẩn hữu cơ, không chất bảo quản. Có vị thanh mát, rất thích hợp để nấu canh, luộc hoặc làm món hấp.', CAST(N'2025-06-12T23:38:12.637' AS DateTime), NULL, 0, 85000, NULL)
INSERT [dbo].[Product] ([product_id], [category_id], [name], [discount], [image], [ingredient], [user_manual], [more_info], [created_at], [updated_at], [deleted], [price], [weight]) VALUES (4, 1, N'Bó xôi hữu cơ', 0, N'https://res.cloudinary.com/dbnqy4pmh/image/upload/v1749744898/boxoi_o7vsm4.png', NULL, NULL, N'Bó xôi là loại rau chứa nhiều sắt, canxi và vitamin K. Được trồng hữu cơ, đảm bảo an toàn, thích hợp cho người ăn chay hoặc ăn kiêng. Dùng để xào, luộc hoặc làm sinh tố.', CAST(N'2025-06-12T23:38:12.637' AS DateTime), NULL, 0, 90000, NULL)
INSERT [dbo].[Product] ([product_id], [category_id], [name], [discount], [image], [ingredient], [user_manual], [more_info], [created_at], [updated_at], [deleted], [price], [weight]) VALUES (5, 1, N'Bông cải xanh', 0, N'https://res.cloudinary.com/dbnqy4pmh/image/upload/v1749744898/caixanh_ljzkyt.png', NULL, NULL, N'Giàu chất xơ, vitamin C và các chất chống ung thư. Bông cải xanh giòn, xanh tươi, thích hợp cho các món hấp, luộc, xào hoặc ăn sống cùng salad.', CAST(N'2025-06-12T23:38:12.637' AS DateTime), NULL, 0, 150000, NULL)
INSERT [dbo].[Product] ([product_id], [category_id], [name], [discount], [image], [ingredient], [user_manual], [more_info], [created_at], [updated_at], [deleted], [price], [weight]) VALUES (6, 1, N'Cải ngọt hữu cơ', 0, N'https://res.cloudinary.com/dbnqy4pmh/image/upload/v1749744897/caingot_rerloc.png', NULL, NULL, N'Cải ngọt trồng theo phương pháp hữu cơ, vị thanh, dễ ăn. Phù hợp với các món luộc, xào hoặc nấu canh. Đặc biệt tốt cho người lớn tuổi và trẻ nhỏ.', CAST(N'2025-06-12T23:38:12.637' AS DateTime), NULL, 0, 75000, NULL)
INSERT [dbo].[Product] ([product_id], [category_id], [name], [discount], [image], [ingredient], [user_manual], [more_info], [created_at], [updated_at], [deleted], [price], [weight]) VALUES (7, 1, N'Cà chua cherry socola', 0, N'https://res.cloudinary.com/dbnqy4pmh/image/upload/v1749744896/cachua_bk2ysq.png', NULL, NULL, N'Loại cà chua mini có vỏ màu nâu đỏ đặc trưng như socola. Vị ngọt dịu, mọng nước, giàu lycopene. Dùng để ăn sống, làm salad hoặc trang trí món ăn.', CAST(N'2025-06-12T23:38:12.637' AS DateTime), NULL, 0, 150000, NULL)
INSERT [dbo].[Product] ([product_id], [category_id], [name], [discount], [image], [ingredient], [user_manual], [more_info], [created_at], [updated_at], [deleted], [price], [weight]) VALUES (8, 1, N'Cải thìa', 0, N'https://res.cloudinary.com/dbnqy4pmh/image/upload/v1749744895/caithia_qgf9j4.png', NULL, NULL, N'Cải thìa có vị ngọt nhẹ, lá non, giòn. Dùng nhiều trong các món xào, nấu canh hoặc ăn kèm lẩu. Giàu vitamin A, C và chất xơ.', CAST(N'2025-06-12T23:38:12.637' AS DateTime), NULL, 0, 85000, NULL)
INSERT [dbo].[Product] ([product_id], [category_id], [name], [discount], [image], [ingredient], [user_manual], [more_info], [created_at], [updated_at], [deleted], [price], [weight]) VALUES (10, 2, N'Bơ 034', 0, N'https://res.cloudinary.com/dbnqy4pmh/image/upload/v1749746514/bo_fhnuma.png', NULL, NULL, N'Bơ 034 là giống bơ nổi tiếng của Lâm Đồng, có hình dáng thon dài, cơm vàng mịn, béo ngậy và hương thơm đặc trưng. Loại bơ này không bị xơ, vỏ mỏng, dễ bóc. Thích hợp để ăn tươi, làm sinh tố hoặc salad. Cung cấp nguồn vitamin E và chất béo tốt cho tim mạch.', CAST(N'2025-06-12T23:45:22.760' AS DateTime), NULL, 0, 115000, NULL)
INSERT [dbo].[Product] ([product_id], [category_id], [name], [discount], [image], [ingredient], [user_manual], [more_info], [created_at], [updated_at], [deleted], [price], [weight]) VALUES (11, 2, N'Bưởi da xanh', 0, N'https://res.cloudinary.com/dbnqy4pmh/image/upload/v1749746513/buoi_dyi2bu.png', NULL, NULL, N'Bưởi da xanh có lớp vỏ dày màu xanh lá, ruột hồng, mọng nước và có vị ngọt dịu xen chút chua thanh. Không chỉ ngon mà còn giàu vitamin C, chất chống oxy hóa và hỗ trợ giảm cân. Thường dùng để tráng miệng, ép nước hoặc làm gỏi.', CAST(N'2025-06-12T23:45:22.760' AS DateTime), NULL, 0, 85000, NULL)
INSERT [dbo].[Product] ([product_id], [category_id], [name], [discount], [image], [ingredient], [user_manual], [more_info], [created_at], [updated_at], [deleted], [price], [weight]) VALUES (12, 2, N'Cam sành', 0, N'https://res.cloudinary.com/dbnqy4pmh/image/upload/v1749746511/cam_k4mxva.png', NULL, NULL, N'Cam sành giàu vitamin C, vitamin A, canxi, chất xơ… rất bổ dưỡng cho cơ thể phụ nữ mang thai. Vitamin B9 (axit folic) có trong cam sành vô cùng quan trọng, đặc biệt đối với bà bầu hoặc những người đang cố gắng thụ thai.', CAST(N'2025-06-12T23:45:22.760' AS DateTime), NULL, 0, 75000, NULL)
INSERT [dbo].[Product] ([product_id], [category_id], [name], [discount], [image], [ingredient], [user_manual], [more_info], [created_at], [updated_at], [deleted], [price], [weight]) VALUES (13, 2, N'Chuối già hữu cơ', 0, N'https://res.cloudinary.com/dbnqy4pmh/image/upload/v1749746510/chuoi_uhxm6p.png', NULL, NULL, N'Chuối già được trồng theo phương pháp hữu cơ, không hóa chất độc hại. Trái chín đều, vỏ vàng đậm, thịt mềm dẻo, vị ngọt tự nhiên và thơm đặc trưng. Cung cấp năng lượng nhanh chóng và nhiều kali, rất tốt cho tiêu hóa và tim mạch.', CAST(N'2025-06-12T23:45:22.760' AS DateTime), NULL, 0, 65000, NULL)
INSERT [dbo].[Product] ([product_id], [category_id], [name], [discount], [image], [ingredient], [user_manual], [more_info], [created_at], [updated_at], [deleted], [price], [weight]) VALUES (14, 2, N'Đu đủ hữu cơ', 0, N'https://res.cloudinary.com/dbnqy4pmh/image/upload/v1749746511/dudu_napifk.png', NULL, NULL, N'Đu đủ hữu cơ chín cây, có ruột cam đỏ đẹp mắt, mềm và ngọt thanh. Giàu enzyme papain, vitamin A và C, giúp hỗ trợ tiêu hóa, làm đẹp da và tăng cường hệ miễn dịch. Có thể ăn trực tiếp hoặc xay sinh tố, làm món tráng miệng.', CAST(N'2025-06-12T23:45:22.760' AS DateTime), NULL, 0, 70000, NULL)
INSERT [dbo].[Product] ([product_id], [category_id], [name], [discount], [image], [ingredient], [user_manual], [more_info], [created_at], [updated_at], [deleted], [price], [weight]) VALUES (15, 2, N'Dưa lưới hữu cơ', 0, N'https://res.cloudinary.com/dbnqy4pmh/image/upload/v1749746510/dualuoi_huld8h.png', NULL, NULL, N'Dưa lưới được canh tác hữu cơ, có vỏ lưới đặc trưng, ruột màu cam sáng, thịt giòn ngọt và thơm. Là loại trái cây giàu nước, vitamin C và khoáng chất, thích hợp giải nhiệt và bổ sung năng lượng. Dùng ăn tươi hoặc làm salad hoa quả.', CAST(N'2025-06-12T23:45:22.760' AS DateTime), NULL, 0, 155000, NULL)
INSERT [dbo].[Product] ([product_id], [category_id], [name], [discount], [image], [ingredient], [user_manual], [more_info], [created_at], [updated_at], [deleted], [price], [weight]) VALUES (16, 2, N'Dưa bở hữu cơ', 0, N'https://res.cloudinary.com/dbnqy4pmh/image/upload/v1749746510/duabo_k7srwm.png', NULL, NULL, N'Dưa bở có vỏ xanh nhạt, ruột trắng hoặc vàng, mùi thơm nhẹ, thịt xốp và vị ngọt mát. Trồng theo phương pháp hữu cơ, an toàn cho sức khỏe. Dưa thường được dùng để ăn tươi hoặc nấu chè, giúp thanh nhiệt và hỗ trợ tiêu hóa.', CAST(N'2025-06-12T23:45:22.760' AS DateTime), NULL, 0, 85000, NULL)
INSERT [dbo].[Product] ([product_id], [category_id], [name], [discount], [image], [ingredient], [user_manual], [more_info], [created_at], [updated_at], [deleted], [price], [weight]) VALUES (17, 2, N'Thanh long ruột đỏ', 0, N'https://res.cloudinary.com/dbnqy4pmh/image/upload/v1749746510/thanhl_harvsm.png', NULL, NULL, N'Trái thanh long có thể được chế biến thành nhiều món ăn đa dạng như: sinh tố, làm cocktail, làm rau câu trái cây… ngoài việc dùng tươi như những loại trái cây khác. Trong tiết hè nóng bức, khát nước, ăn một trái thanh long mát lạnh không những làm cho chúng ta có cảm giác mát mẻ, sảng khoái vì được giải khát, mà chúng ta còn đang làm đẹp cho làn da của mình.', CAST(N'2025-06-12T23:45:22.760' AS DateTime), NULL, 0, 99000, NULL)
INSERT [dbo].[Product] ([product_id], [category_id], [name], [discount], [image], [ingredient], [user_manual], [more_info], [created_at], [updated_at], [deleted], [price], [weight]) VALUES (18, 2, N'Táo Juliet hữu cơ', 0, N'https://res.cloudinary.com/dbnqy4pmh/image/upload/v1749746510/tao_utkyh0.png', NULL, NULL, N'Táo Juliet hữu cơ được trồng duy nhất tại Pháp, là loại táo được trồng hoàn toàn theo cách tự nhiên, không sử dụng bất kỳ thuốc trừ sâu hay phân bón hóa học nào trong quá trình canh tác, đạt chứng nhận hữu cơ tiêu chuẩn EU của châu Âu và chứng nhận hữu cơ AB của Pháp. Đây là loại táo được yêu thích không chỉ ở Pháp mà còn ở các nước khác vì độ giòn, ngọt và hương thơm đặc trưng. Ăn cả vỏ táo sẽ càng cảm nhận độ giòn giòn rõ hơn. Gợi ý sử dụng: Dùng trực tiếp cả vỏ mà không cần gọt. Là nguyên liệu thích hợp cho các món ăn từ ngọt đến mặn, đơn giản đến phức tạp như salad, bỏ lò nướng hay chiên trên chảo, làm sốt hay sinh tố, trang trí hay làm nhân bánh...', CAST(N'2025-06-12T23:45:22.760' AS DateTime), NULL, 0, 220000, NULL)
INSERT [dbo].[Product] ([product_id], [category_id], [name], [discount], [image], [ingredient], [user_manual], [more_info], [created_at], [updated_at], [deleted], [price], [weight]) VALUES (19, 2, N'Thơm/Dứa', 0, N'https://res.cloudinary.com/dbnqy4pmh/image/upload/v1749746509/thom_nvsppc.png', NULL, NULL, N'Dứa (thơm) có hương vị đặc trưng, ngọt dịu và hơi chua nhẹ. Giàu vitamin C, bromelain giúp tiêu hóa tốt, giảm viêm và tăng sức đề kháng. Dùng để ăn tươi, làm nước ép, nấu món mặn như dứa xào, canh chua hoặc tráng miệng.', CAST(N'2025-06-12T23:45:22.760' AS DateTime), NULL, 0, 85000, NULL)
INSERT [dbo].[Product] ([product_id], [category_id], [name], [discount], [image], [ingredient], [user_manual], [more_info], [created_at], [updated_at], [deleted], [price], [weight]) VALUES (20, 3, N'Bột gạo lứt hữu cơ Mùa 300gr', 0, N'https://res.cloudinary.com/dbnqy4pmh/image/upload/v1749747024/gaolut_lcot4w.png', NULL, NULL, N'Sản phẩm bột gạo lứt hữu cơ, đóng gói 300g, tốt cho sức khỏe.', CAST(N'2025-06-12T23:53:44.320' AS DateTime), CAST(N'2025-06-12T23:53:44.320' AS DateTime), 0, 120000, 300)
INSERT [dbo].[Product] ([product_id], [category_id], [name], [discount], [image], [ingredient], [user_manual], [more_info], [created_at], [updated_at], [deleted], [price], [weight]) VALUES (21, 3, N'Bột yến mạch hữu cơ Health Paradise 500g', 0, N'https://res.cloudinary.com/dbnqy4pmh/image/upload/v1749747023/yenmach_botjzf.png', N'Bột yến mạch, sữa đậu nành hữu cơ, maltodextrin, inulin, lecithin, vitamin B', NULL, N'Chứng nhận hữu cơ NASAA. Xuất xứ: Malaysia.', CAST(N'2025-06-12T23:53:44.320' AS DateTime), CAST(N'2025-06-12T23:53:44.320' AS DateTime), 0, 415000, 500)
INSERT [dbo].[Product] ([product_id], [category_id], [name], [discount], [image], [ingredient], [user_manual], [more_info], [created_at], [updated_at], [deleted], [price], [weight]) VALUES (22, 3, N'Bún tươi sấy khô gạo huyết rồng Mekong River 300g', 0, N'https://res.cloudinary.com/dbnqy4pmh/image/upload/v1749747023/buntuoi_bd5iaj.png', N'Gạo thường (54%), gạo huyết rồng (30%)', NULL, N'Làm món xào hoặc món nước. Xuất xứ: Việt Nam.', CAST(N'2025-06-12T23:53:44.320' AS DateTime), CAST(N'2025-06-12T23:53:44.320' AS DateTime), 0, 45000, 300)
INSERT [dbo].[Product] ([product_id], [category_id], [name], [discount], [image], [ingredient], [user_manual], [more_info], [created_at], [updated_at], [deleted], [price], [weight]) VALUES (23, 3, N'Gạo Lứt Đỏ hữu cơ Mùa 2kg', 0, N'https://res.cloudinary.com/dbnqy4pmh/image/upload/v1749747022/gaolutdo_qnxy9z.png', NULL, NULL, N'Canh tác tại Vĩnh Long, đạt chuẩn USDA, EU, JAS. Không hóa chất, không tẩy trắng.', CAST(N'2025-06-12T23:53:44.320' AS DateTime), CAST(N'2025-06-12T23:53:44.320' AS DateTime), 0, 199000, 2000)
INSERT [dbo].[Product] ([product_id], [category_id], [name], [discount], [image], [ingredient], [user_manual], [more_info], [created_at], [updated_at], [deleted], [price], [weight]) VALUES (24, 3, N'Gạo ST25 hữu cơ Mùa 2kg', 0, N'https://res.cloudinary.com/dbnqy4pmh/image/upload/v1749747020/gaolutst25_pyqxnj.png', NULL, NULL, N'Gạo ST25 hữu cơ từ Vĩnh Long, đạt chứng nhận hữu cơ Mỹ, EU, Nhật. Không GMO, không chất bảo quản.', CAST(N'2025-06-12T23:53:44.320' AS DateTime), CAST(N'2025-06-12T23:53:44.320' AS DateTime), 0, 169000, 2000)
INSERT [dbo].[Product] ([product_id], [category_id], [name], [discount], [image], [ingredient], [user_manual], [more_info], [created_at], [updated_at], [deleted], [price], [weight]) VALUES (25, 3, N'Gạo nếp cái hoa vàng Mùa 1kg', 0, N'https://res.cloudinary.com/dbnqy4pmh/image/upload/v1749747019/gaonep_py7pur.png', NULL, NULL, N'Gạo nếp truyền thống nổi tiếng miền Bắc. Hạt tròn, thơm, mềm dẻo khi nấu chín. Dùng nấu chè, xôi, cơm rượu.', CAST(N'2025-06-12T23:53:44.320' AS DateTime), CAST(N'2025-06-12T23:53:44.320' AS DateTime), 0, 99000, 1000)
INSERT [dbo].[Product] ([product_id], [category_id], [name], [discount], [image], [ingredient], [user_manual], [more_info], [created_at], [updated_at], [deleted], [price], [weight]) VALUES (26, 3, N'Gạo tấm ST25 hữu cơ Mùa 2kg', 0, N'https://res.cloudinary.com/dbnqy4pmh/image/upload/v1749747020/gaotam_eutzhw.png', NULL, NULL, N'Gạo tấm ST25 hữu cơ trồng tại Vĩnh Long. Đảm bảo không hóa chất, đạt chuẩn hữu cơ USDA/EU/JAS.', CAST(N'2025-06-12T23:53:44.320' AS DateTime), CAST(N'2025-06-12T23:53:44.320' AS DateTime), 0, 169000, 2000)
INSERT [dbo].[Product] ([product_id], [category_id], [name], [discount], [image], [ingredient], [user_manual], [more_info], [created_at], [updated_at], [deleted], [price], [weight]) VALUES (27, 3, N'Gạo Tím Thảo Dược hữu cơ Mùa 2kg', 0, N'https://res.cloudinary.com/dbnqy4pmh/image/upload/v1749747019/gaotim_sgvfty.png', NULL, NULL, N'Gạo tím hữu cơ thảo dược, giàu chất chống oxy hóa. Canh tác không hóa chất tại Vĩnh Long, đạt tiêu chuẩn quốc tế.', CAST(N'2025-06-12T23:53:44.320' AS DateTime), CAST(N'2025-06-12T23:53:44.320' AS DateTime), 0, 219000, 2000)
INSERT [dbo].[Product] ([product_id], [category_id], [name], [discount], [image], [ingredient], [user_manual], [more_info], [created_at], [updated_at], [deleted], [price], [weight]) VALUES (28, 3, N'Ngũ cốc giòn hạnh nhân dừa hữu cơ Muehle 400gr', 0, N'https://res.cloudinary.com/dbnqy4pmh/image/upload/v1749747019/ngucoc_tuti9j.png', N'Hạnh nhân, hạt phỉ, dừa nướng, yến mạch', NULL, N'Ngũ cốc hữu cơ chuẩn Bioland Đức. Ăn kèm sữa, sữa chua.', CAST(N'2025-06-12T23:53:44.320' AS DateTime), CAST(N'2025-06-12T23:53:44.320' AS DateTime), 0, 195000, 400)
INSERT [dbo].[Product] ([product_id], [category_id], [name], [discount], [image], [ingredient], [user_manual], [more_info], [created_at], [updated_at], [deleted], [price], [weight]) VALUES (29, 3, N'Ngũ cốc giòn vị sữa chua chanh hữu cơ Muehle 400gr', 0, N'https://res.cloudinary.com/dbnqy4pmh/image/upload/v1749747018/ngucocsuachua_m8uzsm.png', N'Sữa chua, chanh, dừa nướng, yến mạch', NULL, N'Ngũ cốc hữu cơ từ Đức, kết hợp sữa chua, chanh, dừa nướng. Dùng với sữa hoặc trái cây tươi.', CAST(N'2025-06-12T23:53:44.320' AS DateTime), CAST(N'2025-06-12T23:53:44.320' AS DateTime), 0, 195000, 400)
INSERT [dbo].[Product] ([product_id], [category_id], [name], [discount], [image], [ingredient], [user_manual], [more_info], [created_at], [updated_at], [deleted], [price], [weight]) VALUES (30, 3, N'Yến mạch cán mỏng hữu cơ Health Paradise 500g', 0, N'https://res.cloudinary.com/dbnqy4pmh/image/upload/v1749747018/yenmachhcan_ezhycf.png', N'Yến mạch cán mỏng hữu cơ', NULL, N'Yến mạch cán mỏng hữu cơ từ Malaysia. Chứng nhận NASAA. Kết cấu mềm, thơm, phù hợp cho cả em bé.', CAST(N'2025-06-12T23:53:44.320' AS DateTime), CAST(N'2025-06-12T23:53:44.320' AS DateTime), 0, 135000, 500)
INSERT [dbo].[Product] ([product_id], [category_id], [name], [discount], [image], [ingredient], [user_manual], [more_info], [created_at], [updated_at], [deleted], [price], [weight]) VALUES (31, 4, N'Đậu đen xanh lòng hữu cơ Mùa 500g', 0, N'https://res.cloudinary.com/dbnqy4pmh/image/upload/v1749747345/dauden_tc4vnv.png', N'100% Đậu đen', N'Dùng để chế biến các món ăn như salad, súp, món hầm, món tráng miệng', N'Chứng nhận hữu cơ tiêu chuẩn USDA và EU. Đóng gói tại Việt Nam.', CAST(N'2025-06-12T23:57:11.360' AS DateTime), CAST(N'2025-06-12T23:57:11.360' AS DateTime), 0, 140000, 500)
INSERT [dbo].[Product] ([product_id], [category_id], [name], [discount], [image], [ingredient], [user_manual], [more_info], [created_at], [updated_at], [deleted], [price], [weight]) VALUES (32, 4, N'Đậu đỏ hữu cơ Mùa 500g', 0, N'https://res.cloudinary.com/dbnqy4pmh/image/upload/v1749747345/daudo_ygeozs.png', N'100% Đậu đỏ', NULL, N'Chống oxy hóa cao, hỗ trợ huyết áp, tiêu hóa, và giàu vitamin A, C, B1, B2.', CAST(N'2025-06-12T23:57:11.360' AS DateTime), CAST(N'2025-06-12T23:57:11.360' AS DateTime), 0, 140000, 500)
INSERT [dbo].[Product] ([product_id], [category_id], [name], [discount], [image], [ingredient], [user_manual], [more_info], [created_at], [updated_at], [deleted], [price], [weight]) VALUES (33, 4, N'Đậu gà hữu cơ Health Paradise 500g', 0, N'https://res.cloudinary.com/dbnqy4pmh/image/upload/v1749747345/dauga_qa8x6b.png', N'100% Đậu gà hữu cơ', N'Ngâm nước hoặc đun sôi 2 phút rồi ủ 2 giờ', N'Sản phẩm giàu protein, dùng chế biến món ăn, xuất xứ Malaysia.', CAST(N'2025-06-12T23:57:11.360' AS DateTime), CAST(N'2025-06-12T23:57:11.360' AS DateTime), 0, 205000, 500)
INSERT [dbo].[Product] ([product_id], [category_id], [name], [discount], [image], [ingredient], [user_manual], [more_info], [created_at], [updated_at], [deleted], [price], [weight]) VALUES (34, 4, N'Đậu nành hữu cơ Mùa 1kg', 0, N'https://res.cloudinary.com/dbnqy4pmh/image/upload/v1749747345/daunnh_puv7ty.png', N'100% Đậu nành hữu cơ', NULL, N'Giàu đạm, isoflavones, chất xơ. Dùng làm đậu phụ, sữa, tào phớ, cháo...', CAST(N'2025-06-12T23:57:11.360' AS DateTime), CAST(N'2025-06-12T23:57:11.360' AS DateTime), 0, 165000, 1000)
INSERT [dbo].[Product] ([product_id], [category_id], [name], [discount], [image], [ingredient], [user_manual], [more_info], [created_at], [updated_at], [deleted], [price], [weight]) VALUES (35, 4, N'Đậu xanh hữu cơ Mùa 500g', 0, N'https://res.cloudinary.com/dbnqy4pmh/image/upload/v1749747344/dauxanh_f1lxrm.png', N'100% Đậu xanh', NULL, N'Giàu protein, vitamin nhóm B, chất chống oxy hóa, axit amin thiết yếu.', CAST(N'2025-06-12T23:57:11.360' AS DateTime), CAST(N'2025-06-12T23:57:11.360' AS DateTime), 0, 140000, 500)
INSERT [dbo].[Product] ([product_id], [category_id], [name], [discount], [image], [ingredient], [user_manual], [more_info], [created_at], [updated_at], [deleted], [price], [weight]) VALUES (36, 4, N'Đậu phộng Mùa 250g', 0, N'https://res.cloudinary.com/dbnqy4pmh/image/upload/v1749747344/dauphong_ndgghr.png', N'100% Đậu phộng', NULL, N'Chứa vitamin E, mangan, hỗ trợ hấp thu canxi, ổn định đường huyết.', CAST(N'2025-06-12T23:57:11.360' AS DateTime), CAST(N'2025-06-12T23:57:11.360' AS DateTime), 0, 99000, 250)
INSERT [dbo].[Product] ([product_id], [category_id], [name], [discount], [image], [ingredient], [user_manual], [more_info], [created_at], [updated_at], [deleted], [price], [weight]) VALUES (37, 5, N'Hạt kê hữu cơ Health Paradise 500gr', 0, N'https://res.cloudinary.com/dbnqy4pmh/image/upload/v1749747528/hatke_vrd9hz.png', N'100% hạt kê hữu cơ', NULL, N'Chứng nhận hữu cơ tiêu chuẩn NASSA của Úc. Xuất xứ: Malaysia. Hạt kê giàu vitamin B1, B2, A, E, protein và khoáng chất.', CAST(N'2025-06-12T23:59:33.290' AS DateTime), CAST(N'2025-06-12T23:59:33.290' AS DateTime), 0, 150000, 500)
INSERT [dbo].[Product] ([product_id], [category_id], [name], [discount], [image], [ingredient], [user_manual], [more_info], [created_at], [updated_at], [deleted], [price], [weight]) VALUES (38, 5, N'Hạt Mắc Ca sấy nứt vỏ Mùa 400gr', 0, N'https://res.cloudinary.com/dbnqy4pmh/image/upload/v1749747527/hatmacca_lnr2e6.png', NULL, NULL, N'Canh tác theo hướng hữu cơ tại Kon Chư Răng, Gia Lai. Không phân bón hóa học hay thuốc trừ sâu. Hạt thơm, béo, tốt cho sức khỏe.', CAST(N'2025-06-12T23:59:33.290' AS DateTime), CAST(N'2025-06-12T23:59:33.290' AS DateTime), 0, 175000, 400)
INSERT [dbo].[Product] ([product_id], [category_id], [name], [discount], [image], [ingredient], [user_manual], [more_info], [created_at], [updated_at], [deleted], [price], [weight]) VALUES (39, 5, N'Hạt Quinoa hữu cơ Health Paradise 500g', 0, N'https://res.cloudinary.com/dbnqy4pmh/image/upload/v1749747527/hatqui_cx2zwz.png', N'100% hạt Quinoa hữu cơ', NULL, N'Chứng nhận hữu cơ EU (Châu Âu) và NASSA (Úc). Xuất xứ: Malaysia. Là loại ngũ cốc giàu dinh dưỡng, tốt cho sức khỏe.', CAST(N'2025-06-12T23:59:33.290' AS DateTime), CAST(N'2025-06-12T23:59:33.290' AS DateTime), 0, 270000, 500)
INSERT [dbo].[Product] ([product_id], [category_id], [name], [discount], [image], [ingredient], [user_manual], [more_info], [created_at], [updated_at], [deleted], [price], [weight]) VALUES (40, 5, N'Ngô nếp bung sấy Napro 500gr', 0, N'https://res.cloudinary.com/dbnqy4pmh/image/upload/v1749747527/ngonep_rzg40q.png', NULL, N'Ngâm với nước 2–4 tiếng trước khi chế biến.', N'Ngô nếp cổ, hạt bé, vị dẻo bùi truyền thống. Dùng để nấu xôi, chè, bỏng ngô, hấp, xào. Mang hương vị tuổi thơ.', CAST(N'2025-06-12T23:59:33.290' AS DateTime), CAST(N'2025-06-12T23:59:33.290' AS DateTime), 0, 160000, 500)
INSERT [dbo].[Product] ([product_id], [category_id], [name], [discount], [image], [ingredient], [user_manual], [more_info], [created_at], [updated_at], [deleted], [price], [weight]) VALUES (41, 5, N'Mè đen hữu cơ Mùa 200g', 0, N'https://res.cloudinary.com/dbnqy4pmh/image/upload/v1749747526/meden_oe8mty.png', N'100% mè đen hữu cơ', NULL, N'Chứng nhận hữu cơ USDA (Mỹ) và EU (Châu Âu). Cung cấp vitamin E, B, kẽm, sắt, canxi. Ít carbs, giàu protein và chất béo lành mạnh.', CAST(N'2025-06-12T23:59:33.290' AS DateTime), CAST(N'2025-06-12T23:59:33.290' AS DateTime), 0, 99000, 200)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([user_id], [roleNo], [fullname], [email], [phone_number], [address], [account_name], [password], [created_at], [updated_at], [deleted], [date_of_birth], [gender], [avatar]) VALUES (1, 1, NULL, NULL, NULL, NULL, N'admin', N'admin', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([user_id], [roleNo], [fullname], [email], [phone_number], [address], [account_name], [password], [created_at], [updated_at], [deleted], [date_of_birth], [gender], [avatar]) VALUES (2, 0, N'Nguyễn Thế Phong', N'phongghast@gmail.com', N'0363418999', N'Hanoi', N'phong', N'123456', CAST(N'2024-03-01T20:31:37.803' AS DateTime), CAST(N'2024-03-07T02:04:59.467' AS DateTime), 0, CAST(N'2003-09-07' AS Date), 1, N'images/271837283_3289726151273645_1969370421537872590_n.jpg')
INSERT [dbo].[User] ([user_id], [roleNo], [fullname], [email], [phone_number], [address], [account_name], [password], [created_at], [updated_at], [deleted], [date_of_birth], [gender], [avatar]) VALUES (3, 0, N'Nguyễn Meo Meo', N'phong@gmail.com', N'0999192319', N'Lao Cai', N'bemeone', N'123456', CAST(N'2024-03-01T21:24:39.660' AS DateTime), CAST(N'2024-03-01T21:24:39.660' AS DateTime), 0, CAST(N'2003-12-11' AS Date), 1, N'images/account.png')
INSERT [dbo].[User] ([user_id], [roleNo], [fullname], [email], [phone_number], [address], [account_name], [password], [created_at], [updated_at], [deleted], [date_of_birth], [gender], [avatar]) VALUES (4, 0, N'Nguyễn Cá', N'ccaa@gmail.com', N'0123199011', N'vịnh biển lào cai', N'concasieuto', N'12345', CAST(N'2024-03-01T22:09:46.863' AS DateTime), CAST(N'2024-03-01T22:09:46.863' AS DateTime), 0, CAST(N'2024-03-06' AS Date), 1, N'images/account.png')
INSERT [dbo].[User] ([user_id], [roleNo], [fullname], [email], [phone_number], [address], [account_name], [password], [created_at], [updated_at], [deleted], [date_of_birth], [gender], [avatar]) VALUES (5, 0, N'Nguyễn Cá', N'ccaa@gmail.com', N'0123199011', N'vịnh biển lào cai', N'concasieu', N'123', CAST(N'2024-03-01T22:30:11.437' AS DateTime), CAST(N'2024-03-01T22:30:11.437' AS DateTime), 0, CAST(N'2024-03-06' AS Date), 1, N'images/account.png')
INSERT [dbo].[User] ([user_id], [roleNo], [fullname], [email], [phone_number], [address], [account_name], [password], [created_at], [updated_at], [deleted], [date_of_birth], [gender], [avatar]) VALUES (6, 0, N'Nguyễn Văn A', N'aaaaa@gmai.com', N'0987782133', N'quần đảo sapa', N'anhlaconca', N'123456', CAST(N'2024-03-01T23:44:34.490' AS DateTime), CAST(N'2024-03-01T23:44:34.490' AS DateTime), 0, CAST(N'2000-03-03' AS Date), 0, N'images/account.png')
INSERT [dbo].[User] ([user_id], [roleNo], [fullname], [email], [phone_number], [address], [account_name], [password], [created_at], [updated_at], [deleted], [date_of_birth], [gender], [avatar]) VALUES (7, 0, N'Nguyễn Văn An', N'andeaaa@gmai.com', N'0987782133', N'biển đảo thạch thấy', N'anhyeuemvl', N'hellocungnha', CAST(N'2024-03-01T23:46:33.327' AS DateTime), CAST(N'2024-03-01T23:46:33.327' AS DateTime), 0, CAST(N'2001-12-03' AS Date), 1, N'images/account.png')
INSERT [dbo].[User] ([user_id], [roleNo], [fullname], [email], [phone_number], [address], [account_name], [password], [created_at], [updated_at], [deleted], [date_of_birth], [gender], [avatar]) VALUES (8, 0, N'Nguyễn Thị Khạc', N'phongcaccac@gmail.com', N'099999999999', N'Sơn tây, Hà nội', N'conca', N'123456', CAST(N'2024-03-07T11:38:08.207' AS DateTime), CAST(N'2024-03-07T11:38:08.207' AS DateTime), 0, CAST(N'2004-02-05' AS Date), 0, N'images/account.png')
INSERT [dbo].[User] ([user_id], [roleNo], [fullname], [email], [phone_number], [address], [account_name], [password], [created_at], [updated_at], [deleted], [date_of_birth], [gender], [avatar]) VALUES (9, 0, N'Nguyễn Meo Chó', N'phgaagg@gmail.com', N'0363418999', N'Móng cái', N'conmeo', N'123456', CAST(N'2024-03-07T11:44:09.483' AS DateTime), CAST(N'2024-03-07T11:44:09.483' AS DateTime), 0, CAST(N'2003-01-01' AS Date), 0, N'images/account.png')
INSERT [dbo].[User] ([user_id], [roleNo], [fullname], [email], [phone_number], [address], [account_name], [password], [created_at], [updated_at], [deleted], [date_of_birth], [gender], [avatar]) VALUES (10, 0, N'Nguyễn thị B', N'phong@gmail.com', N'0958715611', N'Xã đoàn Mộc châu', N'cuccuucu', N'123456', CAST(N'2024-03-07T11:47:17.363' AS DateTime), CAST(N'2024-03-07T11:47:17.363' AS DateTime), 0, CAST(N'2024-03-28' AS Date), 0, N'images/account.png')
INSERT [dbo].[User] ([user_id], [roleNo], [fullname], [email], [phone_number], [address], [account_name], [password], [created_at], [updated_at], [deleted], [date_of_birth], [gender], [avatar]) VALUES (11, 0, N'Nguyễn Ha ha', N'phg1123g@gmail.com', N'0363418321', N'Cà chảy máu', N'chimchim', N'123456', CAST(N'2024-03-07T11:48:12.097' AS DateTime), CAST(N'2024-03-07T11:48:12.097' AS DateTime), 0, CAST(N'2014-10-15' AS Date), 0, N'images/account.png')
INSERT [dbo].[User] ([user_id], [roleNo], [fullname], [email], [phone_number], [address], [account_name], [password], [created_at], [updated_at], [deleted], [date_of_birth], [gender], [avatar]) VALUES (12, 0, N'Nguyễn Cá Meo', N'aaa1234aa@gmai.com', N'0999192319', N'quần đảo sapa', N'aaaa123', N'123456', CAST(N'2024-03-07T11:49:12.277' AS DateTime), CAST(N'2024-03-07T11:49:12.277' AS DateTime), 0, CAST(N'2024-03-09' AS Date), 0, N'images/account.png')
INSERT [dbo].[User] ([user_id], [roleNo], [fullname], [email], [phone_number], [address], [account_name], [password], [created_at], [updated_at], [deleted], [date_of_birth], [gender], [avatar]) VALUES (13, 0, N'Phạm thị hòe', N'hoeeee@gmail.com', N'0363418999', N'đà điểu', N'hoehoahong', N'hoahoe', CAST(N'2024-03-07T11:51:51.877' AS DateTime), CAST(N'2024-03-07T11:51:51.877' AS DateTime), 0, CAST(N'2002-02-01' AS Date), 0, N'images/account.png')
SET IDENTITY_INSERT [dbo].[User] OFF
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[User] ([user_id])
GO
ALTER TABLE [dbo].[Orders_Details]  WITH CHECK ADD FOREIGN KEY([order_id])
REFERENCES [dbo].[Orders] ([order_id])
GO
ALTER TABLE [dbo].[Orders_Details]  WITH CHECK ADD FOREIGN KEY([product_id])
REFERENCES [dbo].[Product] ([product_id])
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD FOREIGN KEY([category_id])
REFERENCES [dbo].[Category] ([category_id])
GO
USE [master]
GO
ALTER DATABASE [FoodStoreDB5] SET  READ_WRITE 
GO
