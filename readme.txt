流浪书店使用须知

项目使用Asp.net+Bootstrap+jsp+三层架构与项目实体类。

DataBase文件夹下有“bookShop.sql”的SqlServer脚本文件。
在SqlServer里新建名为“bookShop”的数据库，新建查询执行脚本文件，执行成功后，bookShop数据库会有5张表。
点击LiuLangBookShop.sln打开项目，修改web.config下的connectstring,将DataSource=“”，修改为数据库的服务器名称。

在ContentPage里打开Main.aspx，以浏览器方式打开可进入流浪书店主页界面。
在Admin文件夹下的pages文件夹打开Login.aspx，可进入管理员登录界面。