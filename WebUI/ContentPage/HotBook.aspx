﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Master/MasterPage.Master" AutoEventWireup="true" CodeBehind="HotBook.aspx.cs" Inherits="LiuLangBookShop.WebUI.ContentPage.HotBook" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="page_main">
        <div class="row">
            <div >
                <div id="main_hot" class="text-center">
                    <h2 class="text-primary">畅销图书</h2>
                    <%=BestSaleBook %>
                </div>               
            </div>
        </div>
    </div>
</asp:Content>
