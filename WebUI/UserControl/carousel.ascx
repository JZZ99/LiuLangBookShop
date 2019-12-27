<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="carousel.ascx.cs" Inherits="LiuLangBookShop.WebUI.UserControl.carousel" %>

<!DOCTYPE html>


<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- 引入 Bootstrap -->
    <link href="../css/bootstrap.min.css" rel="stylesheet">


    <style type="text/css">
        
            /*广告轮播*/
        .carousel{
            width:100%;
            height: 500px;
            margin-bottom: 60px;
            background-color: #000;
        
        } 
        .carousel .item{
            width:100%;
            height: 500px;
            background-color: #000;
        }
        .carousel .item img{
            width: 100%;
        }
        .carousel-caption{
            z-index: 10;
        }
        .carousel-caption p{
            margin-bottom: 20px;
            font-size: 20px;
            line-height: 1.8;
        }


    </style>

</head>

     <script src="../js/jQuery-1.11.3.js"></script>
    <script src="../js/bootstrap.min.js"></script>


       <!-- ---------------------------------轮播图------------------------- -->
       <!-- data-ride="carousel"自动播 -->
       <div id="myCarousel" class="carousel slide" data-ride="carousel">

         <ol class="carousel-indicators">
            <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
            <li data-target="#myCarousel" data-slide-to="1"></li>
            <li data-target="#myCarousel" data-slide-to="2" ></li>
         </ol>
          

          <!-- 轮播项目，轮播图片播放区 -->

          <div class="carousel-inner">

            <!-- ================================================ -->
            <div class="item active" ">
               <!-- 轮播图包括的图片 -->
               <img src="../images/book1.jpg">

               <!-- 轮播图包括的内容 -->
               <div class="carousel-caption">
                    <h1>天猫读书日</h1>
                    <p>阅读是心灵的旅行，期待你的参与</p>  
                   
                </div>

            </div>
            <!-- ================================================ -->
             <div class="item">
                <!-- 轮播图包括的图片 -->
               <img src="../images/book2.jpg" class="img-responsive" style="height:800px;">

               <!-- 轮播图包括的内容 -->
               <div class="carousel-caption">
                    <h1>线下读书会</h1>
                    <p>一杯茶，一本书，还需一知己</p>
                    
                </div>
            </div>
             <!-- ================================================ -->
               <div class="item">
                <!-- 轮播图包括的图片 -->
               <img src="../images/book3.jpg">

               <!-- 轮播图包括的内容 -->
               <div class="carousel-caption">
                   <h1>学无止境</h1>
                    <p>学无止境，知识改变命运</p>
                
                </div>
            </div>
          

          </div>

          <!-- 轮播导航，控制左右翻效果 -->
          <a class="carousel-control left" href="#myCarousel" data-slide="prev"> <span _ngcontent-c3="true" class="glyphicon glyphicon-chevron-left"></span></a>

           <a class="carousel-control right" href="#myCarousel" data-slide="next"> <span _ngcontent-c3="true" class="glyphicon glyphicon-chevron-right"></span></a>
       </div>




       <!-- ---------------------------------轮播图------------------------- -->


