<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Ogani Template">
    <meta name="keywords" content="Ogani, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="sortcut icon" type="image/x-icon" href="img/new/titleLogo.png">
    <title>header</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap" rel="stylesheet">

   

    <style>
        .a_margin {

            margin-left: 1rem;
            margin-right: 0;

        }

        #divLogin {
            text-align: right;
        }

    </style>

</head>

<body>
    <!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div>

    <!-- Humberger Begin -->
    <div class="humberger__menu__overlay"></div>
    <div class="humberger__menu__wrapper">
        <div class="humberger__menu__logo">
            <a href="#"><img src="img/logo.png" alt=""></a>
        </div>
        <div class="header__top__right__auth">
            <a href=""><i class="fa fa-user"></i> 로그인</a>
        </div>

        <br>
        <div class="header__top__right__auth">
            <a href="#"><i class="fa fa-user"></i> 내 근처 강의</a>
        </div>
        <br>
        <div class="header__top__right__auth">
            <a href="#"><i class="fa fa-user"></i> 관심 성향 테스트</a>
        </div>
        <br>
        <div class="header__top__right__auth">
            <a href="#"><i class="fa fa-user"></i> 강의 수요조사</a>
        </div>
        <br>
        <div class="header__top__right__auth">
            <a href="#"><i class="fa fa-user"></i> 커뮤니티</a>
        </div>
    </div>
   
    </div>
    <!-- Humberger End -->

    <!-- Header Section Begin -->
    <header class="header">
        <div class="header__top">
            <div class="container">
                <div class="row">
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    <div class="header__logo">
                        <a href="./index.html"><img src="img/logo.png" alt=""></a>
                    </div>
                </div>
                <div class="col-lg-6">
                    <nav class="header__menu">
                        <ul style="text-align:center;">
                            <!-- <li class="active"><a href="./index.html">HOME</a></li> -->
                            <li><a href="./GPSClass.html">내 근처 강의</a></li>
                            <li><a href="#">관심성향테스트</a>
                                <!--  <ul class="header__menu__dropdown">
                                    <li><a href="./shop-details.html">Shop Details</a></li>
                                    <li><a href="./shoping-cart.html">Shoping Cart</a></li>
                                    <li><a href="./checkout.html">Check Out</a></li>
                                    <li><a href="./blog-details.html">Blog Details</a></li>
                                </ul>-->
                            </li>
                            <li><a href="./blog.html">강의수요조사</a></li>
                            <li><a href="./contact.html">커뮤니티</a></li>
                        </ul>
                    </nav>

                    </div>
                    <!-- <div class="col-lg-3" style="width: 270px;">
                    <div class="header__cart" id="divLogin" style="width: 270px;">
                        <div class="header__top__right__auth">
                            <a href="Login.html" class="a_margin"> Login</a>
                        </div>
                        <div class="header__top__right__auth">
                            <a href="../join/join.html" class="a_margin"> 회원가입</a>
                        </div>
                    </div>
                    </div> -->

                    <!--
                    하트, 장바구니 메뉴 오른쪽-->
                    
                        <ul>
                            <li><a href="#"><i class="fa fa-heart"></i> <span>1</span></a></li>
                            <li><a href="#"><i class="fa fa-shopping-bag"></i> <span>3</span></a></li>
                        </ul>
                        <div class="header__cart__price">item: <span>$150.00</span></div>
                    </div>
                </div>
            </div>
            <div class="humberger__open">
                <i class="fa fa-bars"></i>

            </div>
        </div>
    </header>
    <!-- Header Section End -->

    <!-- Hero Section Begin -->
    <section class="hero">
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    <div class="hero__categories">
                        <div class="hero__categories__all">
                            <i class="fa fa-bars"></i>
                            <span>클래스</span>
                        </div>
                        <ul>
                            <li><a href="#">음악</a></li>
                            <li><a href="#">미술</a></li>
                            <li><a href="#">어학</a></li>
                            <li><a href="#">요리</a></li>
                            <li><a href="#">문학</a></li>
                            <li><a href="#">건강</a></li>
                            <li><a href="#">문화</a></li>
                            <li><a href="#">육아</a></li>
                            <li><a href="#">공예</a></li>
                            <li><a href="#">컴퓨터ㆍIT</a></li>
                            <!-- <li><a href="#">개발ㆍ데이터</a></li> -->
                        </ul>
                    </div>
                </div>
                <div class="col-lg-9" style="height: 60px;">
                    <div class="hero__search">
                        <div class="hero__search__form">
                            <form action="#">
                                <!-- <div class="hero__search__categories"> 
                                    카테고리
                                    <span class="arrow_carrot-down"></span>
                                </div>-->
                                <input type="text" placeholder="찾으시는 취미가 있으신가요?">
                                <button type="submit" class="site-btn">SEARCH</button>
                            </form>
                        </div>
                        <div class="hero__search__phone">
                            <div class="hero__search__phone__icon">
                                <i class="fa fa-phone"></i>
                            </div>
                            <div class="hero__search__phone__text">
                                <h5>062-655-3509</h5>
                                <span>AM 09:00 ~ PM 06:00</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
           
        </div>
    </section>
    <!-- Hero Section End -->
       
   
   
   
   </body>
   
   </html>
</body>
</html>