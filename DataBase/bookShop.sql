USE [master]
GO
/****** Object:  Database [bookShop]    Script Date: 2019/12/27 20:37:11 ******/
CREATE DATABASE [bookShop]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'bookShop', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\bookShop.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'bookShop_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\bookShop_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [bookShop] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [bookShop].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [bookShop] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [bookShop] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [bookShop] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [bookShop] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [bookShop] SET ARITHABORT OFF 
GO
ALTER DATABASE [bookShop] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [bookShop] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [bookShop] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [bookShop] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [bookShop] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [bookShop] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [bookShop] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [bookShop] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [bookShop] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [bookShop] SET  DISABLE_BROKER 
GO
ALTER DATABASE [bookShop] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [bookShop] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [bookShop] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [bookShop] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [bookShop] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [bookShop] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [bookShop] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [bookShop] SET RECOVERY FULL 
GO
ALTER DATABASE [bookShop] SET  MULTI_USER 
GO
ALTER DATABASE [bookShop] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [bookShop] SET DB_CHAINING OFF 
GO
ALTER DATABASE [bookShop] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [bookShop] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [bookShop] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'bookShop', N'ON'
GO
ALTER DATABASE [bookShop] SET QUERY_STORE = OFF
GO
USE [bookShop]
GO
/****** Object:  Table [dbo].[account]    Script Date: 2019/12/27 20:37:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[account](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](50) NOT NULL,
	[password] [varchar](50) NOT NULL,
	[question] [varchar](200) NOT NULL,
	[answer] [varchar](200) NOT NULL,
	[mail] [varchar](50) NOT NULL,
	[registertime] [datetime] NOT NULL,
 CONSTRAINT [PK_account] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[admin]    Script Date: 2019/12/27 20:37:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[admin](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](50) NOT NULL,
	[password] [varchar](50) NOT NULL,
	[mail] [varchar](50) NOT NULL,
	[registertime] [datetime] NOT NULL,
 CONSTRAINT [PK_admin] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[bookInfo]    Script Date: 2019/12/27 20:37:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bookInfo](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](200) NOT NULL,
	[author] [varchar](200) NOT NULL,
	[type] [int] NOT NULL,
	[price] [float] NOT NULL,
	[image] [varchar](200) NOT NULL,
	[description] [varchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[bookType]    Script Date: 2019/12/27 20:37:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bookType](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[typeName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_bookType] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[orderForm]    Script Date: 2019/12/27 20:37:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orderForm](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[accountId] [int] NOT NULL,
	[bookId] [int] NOT NULL,
	[count] [int] NOT NULL,
	[orderTime] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[account] ON 

INSERT [dbo].[account] ([id], [username], [password], [question], [answer], [mail], [registertime]) VALUES (1, N'ld', N'123456', N'what is your name?', N'ld', N'lbbjzz@gmail.com', CAST(N'2019-12-23T19:27:12.307' AS DateTime))
SET IDENTITY_INSERT [dbo].[account] OFF
SET IDENTITY_INSERT [dbo].[admin] ON 

INSERT [dbo].[admin] ([id], [username], [password], [mail], [registertime]) VALUES (1, N'admin', N'admin', N'admin@qq.com', CAST(N'2019-12-23T17:52:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[admin] OFF
SET IDENTITY_INSERT [dbo].[bookInfo] ON 

INSERT [dbo].[bookInfo] ([Id], [name], [author], [type], [price], [image], [description]) VALUES (3, N'我与世界只差一个你（精装版）', N'张皓宸', 1, 38.7, N'http://img3x7.ddimg.cn/49/11/24157237-1_b_9.jpg', N'张皓宸现象级畅销书百万纪念精装版。全新修订，新增暖心情话全彩拉页！')
INSERT [dbo].[bookInfo] ([Id], [name], [author], [type], [price], [image], [description]) VALUES (4, N'我的职业是小说家', N'（日）村上春树 ', 3, 35.5, N'http://img3x9.ddimg.cn/67/31/24157849-1_b_8.jpg', N'村上春树前所未有的自传性作品，真挚讲述追逐梦想与幸福的人生故事')
INSERT [dbo].[bookInfo] ([Id], [name], [author], [type], [price], [image], [description]) VALUES (5, N'腾讯传1998-2016 中国互联网公司进化论', N'吴晓波', 15, 39.9, N'http://img3x2.ddimg.cn/31/26/24145042-1_l_10.jpg', N'腾讯官方授权，吴晓波五年磨砺大作，随书免费附赠3天吴晓波频道音频会员！全景式记录腾讯成长轨迹，回望一代人的互联网情怀，解读中国互联网企业领先全球的真正秘密。')
INSERT [dbo].[bookInfo] ([Id], [name], [author], [type], [price], [image], [description]) VALUES (6, N'数字化生存', N'尼古拉?尼葛洛庞帝 ', 15, 51, N'http://img3x3.ddimg.cn/53/5/24168923-1_l_2.jpg', N'一本影响千百万人的互联网启蒙经典著作。一本关于“智能时代”的“说明书”。预言帝尼葛洛庞帝坦率回应“我有什么地方搞错了吗？”尼葛洛庞帝、胡泳、刘九如、段永朝、吴伯凡等全新解读 ')
INSERT [dbo].[bookInfo] ([Id], [name], [author], [type], [price], [image], [description]) VALUES (8, N'第一行代码 Android 第2版', N'郭霖', 15, 62.4, N'http://img3x6.ddimg.cn/46/1/24144166-1_l_2.jpg', N'Android APP开发从入门到精通 新手零起点高手进阶书的第二行代码 基于Android Studio全新升级更新 基于Android 7.0的开发入门讲义 11月23日17点后下单的获得非签名版 ')
INSERT [dbo].[bookInfo] ([Id], [name], [author], [type], [price], [image], [description]) VALUES (10, N'虚拟现实：引领未来的人机交互革命 ', N'王寒 王赵翔 蓝天', 15, 45, N'http://img3x7.ddimg.cn/63/10/23995287-1_l_6.jpg', N'来自中国和美国硅谷的资深VR/AR技术派专家撰写，从现实、科幻、技术、产品、商业、生态6个维度全方位为你展现一个立体的VR世界 ')
INSERT [dbo].[bookInfo] ([Id], [name], [author], [type], [price], [image], [description]) VALUES (12, N'Python高级编程', N'[美] Luke ', 15, 49.8, N'http://img3x7.ddimg.cn/58/28/24104677-1_l_6.jpg', N'Python进阶必备，python效率手册，wrox精品红皮书，畅销经典，源代码免费提供，动手指南将教会你设计更好的架构编写更加高效代码 ')
INSERT [dbo].[bookInfo] ([Id], [name], [author], [type], [price], [image], [description]) VALUES (16, N'阿部智幸的水彩笔记:如何表现光的氛围 水彩画静かな光を求めて ―あべとしゆき制作ノート', N'阿部智幸', 12, 51, N'http://img3x1.ddimg.cn/79/16/24160831-1_l.jpg', N'水彩大师阿部智幸首本中文简体版水彩教程 用水彩表现光影风景，呈现大自然的美丽瞬间')
INSERT [dbo].[bookInfo] ([Id], [name], [author], [type], [price], [image], [description]) VALUES (17, N'中国国家地理 旅游指南期刊2017年全年杂志订阅新刊预订1年共12期2月起订 包邮', N'-', 16, 215, N'http://img53.ddimg.cn/104880027878323_y.jpg', N'中国国家地理中国旅游权威介绍探险自然人文')
INSERT [dbo].[bookInfo] ([Id], [name], [author], [type], [price], [image], [description]) VALUES (18, N'2017年幼儿画报&Ladybug合订本套装杂志订阅 内含幼儿画报36本+ladybug专刊12本 全年6次配送', N'-', 16, 288, N'http://img50.ddimg.cn/104880029167330_y.jpg', N'幼儿画报全年36本+幼儿画报ladybug专刊全年12本')
INSERT [dbo].[bookInfo] ([Id], [name], [author], [type], [price], [image], [description]) VALUES (19, N'七堂极简物理课：意大利疯卖，打败情色小说《五十度灰》的优美科普', N'卡洛·罗韦利', 15, 23.4, N'http://img3x9.ddimg.cn/18/28/23948019-1_l_11.jpg', N'当当网专享特制精美折页！《时间简史》后现象级畅销科普读物。李淼诚意推荐！黄磊倾情献声喜马拉雅有声版。')
INSERT [dbo].[bookInfo] ([Id], [name], [author], [type], [price], [image], [description]) VALUES (20, N'我们的中国（精装全四册）', N'[中国当代]李零 著', 5, 212, N'http://img3x6.ddimg.cn/11/31/23980286-1_l_8.jpg', N'什么是中国？怎么理解中国？李零告诉我们：中国是一个历史过程，是一个文明的漩涡，要从历史到地理认知五千年来的中国，从思想到情感热爱我们的中国。《我们的中国》是继《我们的经典》之后，又一部研究中国的巨制。 20万图书5折封顶，点此查看社科专场>>>')
INSERT [dbo].[bookInfo] ([Id], [name], [author], [type], [price], [image], [description]) VALUES (24, N'丝绸之路：一部全新的世界史（关心国家战略，一带一路必读书）', N'[英]彼得.弗兰科潘 (Peter Frankopan) 著', 5, 88.3, N'http://img3x0.ddimg.cn/32/5/24017630-1_l_12.jpg', N'轰动世界的现象级畅销书，横扫英国、美国、德国、意大利、土耳其、印度等23个国家。《人民日报》19天内罕见两度推荐。牛津大学资深历史学家全新视角解读世界史，理清“一带一路”的前世今生！读客出品 20万图书5折封顶，点此查看社科专场>>>')
INSERT [dbo].[bookInfo] ([Id], [name], [author], [type], [price], [image], [description]) VALUES (25, N'罗马帝国衰亡史（修订版全6册）', N'[英]爱德华·吉本　著，席代岳　译', 5, 184, N'http://img3x0.ddimg.cn/47/6/23577590-1_l_1.jpg', N'汉译全本，修订版新增四百余条注释，改动达上万处 20万图书5折封顶，点此查看社科专场>>>')
INSERT [dbo].[bookInfo] ([Id], [name], [author], [type], [price], [image], [description]) VALUES (26, N'鬼吹灯全集（套装共8册）', N'天下霸唱　著', 2, 135.5, N'http://img3x4.ddimg.cn/7/17/23808814-1_l_7.jpg', N'天下霸唱原著，足本无删节！盗墓小说开山之作，摸金校尉寻宝历险记，引领南派三叔《盗墓笔记》等书热销！同名网剧腾讯视频全网独播，靳东、陈乔恩、赵达领衔主演，《琅琊榜》《欢乐颂》总导演、制片人年度力作。')
INSERT [dbo].[bookInfo] ([Id], [name], [author], [type], [price], [image], [description]) VALUES (27, N'知更鸟女孩（媲美《偷影子的人》《忽然七日》，2016年感动全美的悬爱力作，她的灵魂之上，凿刻着每个人的死亡之期，包括，她所深爱的人……）', N'（美）查克·温迪格', 2, 15.3, N'http://img3x5.ddimg.cn/66/9/23924505-1_l_6.jpg', N'我是人们生命尽头的旁观者，只能看着他们走完*后一程。白马时光')
INSERT [dbo].[bookInfo] ([Id], [name], [author], [type], [price], [image], [description]) VALUES (28, N'边城（最新修订纪念典藏版）', N'沈从文 著', 2, 21.9, N'http://img3x9.ddimg.cn/22/36/23311849-1_l_2.jpg', N'边城（最新修订纪念典藏版）')
INSERT [dbo].[bookInfo] ([Id], [name], [author], [type], [price], [image], [description]) VALUES (29, N'狼图腾(修订版)（一部描绘、研究蒙古草原狼的“旷世奇书”）', N'姜戎　著', 2, 21, N'http://img3x2.ddimg.cn/48/24/23597292-1_l_1.jpg', N'正版原著小说，十年经典，完美修订！')
INSERT [dbo].[bookInfo] ([Id], [name], [author], [type], [price], [image], [description]) VALUES (30, N'三体：全三册（刘慈欣代表作，亚洲首部“雨果奖”获奖作品！）', N'刘慈欣', 2, 59.3, N'http://img3x4.ddimg.cn/32/35/23579654-1_l_2.jpg', N'预售商品')
INSERT [dbo].[bookInfo] ([Id], [name], [author], [type], [price], [image], [description]) VALUES (31, N'完美胎教枕边书（套装共3册）', N'艾贝母婴研究中心', 4, 49.2, N'http://img3x1.ddimg.cn/4/6/24033541-1_l_5.jpg', N'胎教音乐108首+睡前胎教小故事+胎教故事爸爸读 附赠胎教音乐光盘 心动音乐+暖心故事，让妈妈的梦开心，让宝宝的梦甜美 2017心阅读，新动力 生活好书5折封顶，点击进入>>')
INSERT [dbo].[bookInfo] ([Id], [name], [author], [type], [price], [image], [description]) VALUES (32, N'胎教音乐100首必听(含光盘）（汉竹）（音符跳动每一页好看，好听）', N'汉竹　编著', 4, 24.9, N'http://img3x3.ddimg.cn/88/26/22520113-1_l_11.jpg', N'2017心阅读，新动力 生活好书5折封顶，点击进入>>')
INSERT [dbo].[bookInfo] ([Id], [name], [author], [type], [price], [image], [description]) VALUES (33, N'此刻花开（一本精美绝伦的手工纸雕书）', N'徐静', 4, 34, N'http://img3x1.ddimg.cn/78/2/24134991-1_l_6.jpg', N'一场轻松自由的创作体验！风靡全球的纸雕艺术，比《秘密花园》更给力的减压新玩法。虽然我们不断被这个世界雕刻着，但我们亦可以雕刻出一个世界！随书附赠手工刻刀和雕刻垫板。酷威文化 2017心阅读，新动力 生活好书5折封顶，点击进入>>')
INSERT [dbo].[bookInfo] ([Id], [name], [author], [type], [price], [image], [description]) VALUES (34, N'服装制作基础事典（打版、缝制技巧全图解，做衣服一本就够！将打版流程完全拆解的基础教学书）', N'郑淑玲 著', 4, 31.2, N'http://img3x7.ddimg.cn/55/34/23374747-1_l_3.jpg', N'（热销当当3年、读者口碑爆棚的的布艺图书，《服装制作基础事典2》荣耀上市，敬请关注） 2017心阅读，新动力 生活好书5折封顶，点击进入>>')
INSERT [dbo].[bookInfo] ([Id], [name], [author], [type], [price], [image], [description]) VALUES (35, N'最详尽的手工皂DIY教科书', N'〔韩〕金永花', 4, 29, N'http://img3x8.ddimg.cn/38/6/23719448-1_l_1.jpg', N'（韩国首代芳疗师金永花的纯天然制香配方首次大公开，50款手工皂，29款芳香化妆品，13款芳香家居用品的纯天然配方超值组合，配方之精良，同类书罕见） 2017心阅读，新动力 生活好书5折封顶，点击进入>>')
INSERT [dbo].[bookInfo] ([Id], [name], [author], [type], [price], [image], [description]) VALUES (38, N'细节 如何轻松影响他人（影响力作者新作）', N'[美] 罗伯特·西奥迪尼', 14, 37.9, N'http://img3x1.ddimg.cn/6/29/24102051-1_l_6.jpg', N'《影响力》作者罗伯特·西奥迪尼全新力作，打造个人影响力的52个实操训练 20万图书5折封顶 点击查看详情>>>')
INSERT [dbo].[bookInfo] ([Id], [name], [author], [type], [price], [image], [description]) VALUES (39, N'领导力21法则：追随这些法则，人们就会追随你', N'(美)约翰C.麦克斯维尔', 1, 22.5, N'http://img3x5.ddimg.cn/7/17/23834455-1_l_8.jpg', N'领导力经典必读书,领导力大师Dr. John Maxwell 40年集大成之作。一切组织和个人的兴衰都源自领导力！《福布斯》《纽约时报》《商业周刊》《华尔街日报》、美国Amazon经典畅销书。读客出品 20万图书5折封顶 点击查看详情>>>')
SET IDENTITY_INSERT [dbo].[bookInfo] OFF
SET IDENTITY_INSERT [dbo].[bookType] ON 

INSERT [dbo].[bookType] ([id], [typeName]) VALUES (1, N'其他')
INSERT [dbo].[bookType] ([id], [typeName]) VALUES (2, N'小说')
INSERT [dbo].[bookType] ([id], [typeName]) VALUES (3, N'文学')
INSERT [dbo].[bookType] ([id], [typeName]) VALUES (4, N'生活')
INSERT [dbo].[bookType] ([id], [typeName]) VALUES (5, N'人文社会')
INSERT [dbo].[bookType] ([id], [typeName]) VALUES (7, N'励志')
INSERT [dbo].[bookType] ([id], [typeName]) VALUES (12, N'艺术')
INSERT [dbo].[bookType] ([id], [typeName]) VALUES (13, N'童书')
INSERT [dbo].[bookType] ([id], [typeName]) VALUES (14, N'经管')
INSERT [dbo].[bookType] ([id], [typeName]) VALUES (15, N'科技')
INSERT [dbo].[bookType] ([id], [typeName]) VALUES (16, N'期刊')
SET IDENTITY_INSERT [dbo].[bookType] OFF
SET IDENTITY_INSERT [dbo].[orderForm] ON 

INSERT [dbo].[orderForm] ([Id], [accountId], [bookId], [count], [orderTime]) VALUES (1, 1, 0, 1, CAST(N'2019-12-20T22:08:43.690' AS DateTime))
INSERT [dbo].[orderForm] ([Id], [accountId], [bookId], [count], [orderTime]) VALUES (2, 1, 0, 1, CAST(N'2019-12-20T22:10:38.600' AS DateTime))
INSERT [dbo].[orderForm] ([Id], [accountId], [bookId], [count], [orderTime]) VALUES (14, 4, 27, 1, CAST(N'2019-12-21T10:52:08.110' AS DateTime))
INSERT [dbo].[orderForm] ([Id], [accountId], [bookId], [count], [orderTime]) VALUES (15, 4, 29, 1, CAST(N'2019-12-21T10:52:35.143' AS DateTime))
INSERT [dbo].[orderForm] ([Id], [accountId], [bookId], [count], [orderTime]) VALUES (16, 4, 24, 1, CAST(N'2019-12-22T10:54:19.070' AS DateTime))
INSERT [dbo].[orderForm] ([Id], [accountId], [bookId], [count], [orderTime]) VALUES (17, 9, 39, 2, CAST(N'2019-12-23T10:59:51.063' AS DateTime))
SET IDENTITY_INSERT [dbo].[orderForm] OFF
ALTER TABLE [dbo].[bookInfo] ADD  DEFAULT ((1)) FOR [type]
GO
USE [master]
GO
ALTER DATABASE [bookShop] SET  READ_WRITE 
GO
