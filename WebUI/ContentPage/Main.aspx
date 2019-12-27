<%@ Page Title="" Language="C#" MasterPageFile="~/Master/MasterPage.Master" AutoEventWireup="true" CodeBehind="Main.aspx.cs" Inherits="LiuLangBookShop.WebUI.ContentPage.Main" %>

<%@ Register Src="~/UserControl/carousel.ascx" TagPrefix="uc1" TagName="carousel" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div id="lunbo" style="z-index:-20;">
    <uc1:carousel runat="server" id="carousel" />
    </div>
   
        <div id="page_main">
        <div class="row">
            <div class="col-md-2">
                <div id="main_type">
                    <br />
                    <%--带列表组的面板--%>
                    <div class="panel panel-warning">
                        <div class="panel-heading text-center">
                            <i class="fa fa-bell fa-fw"></i>图书分类
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div class="list-group">
                       <%--          <a href="#" class="list-group-item">锚标签代替列表项</a>
                                 <li class="list-group-item">其他</li>
                                 <li class="list-group-item">小说</li>
                                 <li class="list-group-item">文学</li>
                                 <li class="list-group-item">生活</li>
                                 <li class="list-group-item">人文社会</li>
                                 <li class="list-group-item">励志</li>
                                 <li class="list-group-item">艺术</li>
                                 <li class="list-group-item">童书</li>
                                 <li class="list-group-item">经管</li>
                                 <li class="list-group-item">科技</li>
                                 <li class="list-group-item">期刊</li>--%>


                                 <%=BookType %>
                            </div>
                            <!-- /.list-group列表组 -->
                            <a href="../ContentPage/Main.aspx" class="btn btn-default btn-block">全部分类</a>
                        </div>
                        <!-- /.panel-body -->
                    </div>
                </div>
            </div>

<%--            三.表达式标签<%= %>         
        用于在jsp页面显示（向页面输出，现在在页面上）某个变量值，或方法调用的返回值.--%>

            <div class="col-md-10">
                <div id="main_hot">

                    <h2 class="text-success">热搜图书</h2>
                    <%=HotSearch %>
                </div>
                <div id="main_new">
                    <h2 class="text-success">新书上架</h2>
                    <%=NewComing %>
                </div>
                <div id="recommend">
                    <h2 class="text-success">推荐图书</h2>
                     <%=RecommendBooks %>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
