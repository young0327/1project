<%@page import="Model_User.UserDAO"%>
<%@page import="Model_User.*"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="EUC-KR">
<meta name="description" content="Ogani Template">
<meta name="keywords" content="Ogani, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link rel="sortcut icon" type="image/x-icon"
	href="img/new/titleLogo.png">
<title>G-CAP</title>

<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap"
	rel="stylesheet">

<!-- Css Styles -->
<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
<link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
<link rel="stylesheet" href="css/nice-select.css" type="text/css">
<link rel="stylesheet" href="css/jquery-ui.min.css" type="text/css">
<link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
<link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
<link rel="stylesheet" href="css/style.css" type="text/css">
    <link rel="stylesheet" href="css/TestModal.css" type="text/css">
    <link rel="stylesheet" href="css/qna.css" type="text/css">
    <link rel="stylesheet" href="css/TestResult.css" type="text/css">
    
<style>
.a_margin {
	margin-left: 1rem;
	margin-right: 0;
}

#divLogin {
	text-align: right;
}
.test{
	float: left;
	display:inline_block;
}
</style>

</head>

<body>

<%

UserVO vo = (UserVO)session.getAttribute("user");
UserDAO dao = new UserDAO();


%>
	<!-- Page Preloder -->
	<div id="preloder">
		<div class="loader"></div>
	</div>

	<!-- Humberger Begin -->
	<div class="humberger__menu__overlay"></div>
	<div class="humberger__menu__wrapper">
		<div class="humberger__menu__logo">
			<a href="index.jsp"><img src="img/logo.png" alt=""></a>
		</div>
		<!--  
        <div class="humberger__menu__cart">
            <ul>
                <li><a href="#"><i class="fa fa-heart"></i> <span>1</span></a></li>
                <li><a href="#"><i class="fa fa-shopping-bag"></i> <span>3</span></a></li>
            </ul>
            <div class="header__cart__price">item: <span>$150.00</span></div>
        </div>
        <div class="humberger__menu__widget">
            <div class="header__top__right__language">
                <img src="img/language.png" alt="">
                <div>English</div>
                <span class="arrow_carrot-down"></span>
                <ul>
                    <li><a href="#">Spanis</a></li>
                    <li><a href="#">English</a></li>
                </ul>
            </div>
        -->
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
	<!-- 
        <nav class="humberger__menu__nav mobile-menu">
            모바일 메뉴
            <ul>
                <li class="active"><a href="./index.html">Home</a></li>
                <li><a href="./shop-grid.html">내 근처 강의</a></li>
                <li><a href="#">관심성향테스트</a>
                    <ul class="header__menu__dropdown">
                        <li><a href="./shop-details.html">Shop Details</a></li>
                        <li><a href="./shoping-cart.html">Shoping Cart</a></li>
                        <li><a href="./checkout.html">Check Out</a></li>
                        <li><a href="./blog-details.html">Blog Details</a></li>
                    </ul>
                </li>
                <li><a href="./blog.html">강의 수요조사</a></li>
                <li><a href="./contact.html">커뮤니티</a></li>
            </ul>
        </nav> -->
	<!-- <div id="mobile-menu-wrap"></div> 
        <div class="header__top__right__social">
            <a href="#"><i class="fa fa-facebook"></i></a>
            <a href="#"><i class="fa fa-twitter"></i></a>
            <a href="#"><i class="fa fa-linkedin"></i></a>
            <a href="#"><i class="fa fa-pinterest-p"></i></a>
        </div>-->
	<!--
        <div class="humberger__menu__contact">
            <ul>
                <li><i class="fa fa-envelope"></i> hello@colorlib.com</li>
                <li>Free Shipping for all Order of $99</li>
            </ul>
        </div>-->
	</div>
	<!-- Humberger End -->

	<!-- Header Section Begin -->
	<header class="header">
		<div class="header__top">
			<div class="container">
				<div class="row">
					<!--
                    <div class="col-lg-6 col-md-6">
                        <div class="header__top__left">
                            <ul>
                                <li><i class="fa fa-envelope"></i> hello@colorlib.com</li>
                                <li>Free Shipping for all Order of $99</li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6">
                        <div class="header__top__right">
                            <div class="header__top__right__social">
                                <a href="#"><i class="fa fa-facebook"></i></a>
                                <a href="#"><i class="fa fa-twitter"></i></a>
                                <a href="#"><i class="fa fa-linkedin"></i></a>
                                <a href="#"><i class="fa fa-pinterest-p"></i></a>
                            </div>
                            <div class="header__top__right__language">
                                <img src="img/language.png" alt="">
                                <div>English</div>
                                <span class="arrow_carrot-down"></span>
                                <ul>
                                    <li><a href="#">Spanis</a></li>
                                    <li><a href="#">English</a></li>
                                </ul>
                            </div>
                            <div class="header__top__right__auth">
                                <a href="#"><i class="fa fa-user"></i> Login</a>
                            </div>
                        </div>
                    </div>-->
				</div>
			</div>
		</div>
		<div class="container">
			<div class="row">
				<div class="col-lg-3">
					<div class="header__logo">
						<a href="./index.jsp"><img src="img/index/logooo.png" alt=""></a>
					</div>
				</div>
				<div class="col-lg-6">
					<nav class="header__menu">
						<ul style="text-align: center;">
							<li><a href="./shop.jsp">내 근처 강의</a></li>
							<li><a href="#" id ="modal-open">관심성향테스트</a>
								<!-- <ul class="header__menu__dropdown">
									<li><a href="./shop-details.html">Shop Details</a></li>
									<li><a href="./shoping-cart.html">Shoping Cart</a></li>
									<li><a href="./checkout.html">Check Out</a></li>
									<li><a href="./blog-details.html">Blog Details</a></li>
								</ul></li> -->
							<li><a href="MainSearchClass.jsp">전체클래스</a></li>
							<li><a href="./Board/BoardList.jsp">커뮤니티</a></li>
						</ul>
					</nav>

				</div>
				<div class="col-lg-3" style="width: 270px; padding-left: 35px;">
					<div class="header__cart" id="divLogin">
					<%if(vo==null){ %>
						<div class="header__top__right__auth">
							<a href="Login.html" class="a_margin"> Login</a>
						</div>
						<div class="header__top__right__auth">
							<a href="join/join.html" class="a_margin"> 회원가입</a>
						</div>
					<%}else { %>
						<%if(vo.getId().equals("admin")){ %>
							<div class="header__top__right__auth">
							<span><a href="userList.jsp" class="a_margin"> 회원리스트보기</a></span>
							</div>
							<div class="header__top__right__auth">
								<a href="LogoutService" class="a_margin"> Logout</a>
							</div>
						<%}else{ %>

							<div class="header__top__right__auth">
								<a href="join/updateUser.jsp" class="a_margin"> 회원정보수정</a>
							</div>
							<div class="header__top__right__auth">
								<a href="LogoutService" class="a_margin"> Logout</a>
							</div>
						<%} %>
					<%} %>
					</div>
				</div>

				<!--
                    하트, 장바구니 메뉴 오른쪽
                    
                        <ul>
                            <li><a href="#"><i class="fa fa-heart"></i> <span>1</span></a></li>
                            <li><a href="#"><i class="fa fa-shopping-bag"></i> <span>3</span></a></li>
                        </ul>
                        <div class="header__cart__price">item: <span>$150.00</span></div>
                    </div>
                </div>-->
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
							<i class="fa fa-bars"></i> <span>강의 목록</span>
						</div>
						<ul>
							<li><a href="ClassList.jsp?cate=건강">건강</a></li>
							<li><a href="ClassList.jsp?cate=미술">미술</a></li>
							<li><a href="ClassList.jsp?cate=음악">음악</a></li>
							<li><a href="ClassList.jsp?cate=요리">요리</a></li>
							<li><a href="ClassList.jsp?cate=공예">공예</a></li>
							<li><a href="ClassList.jsp?cate=육아">육아</a></li>
							<li><a href="ClassList.jsp?cate=어학">어학</a></li>
							<li><a href="ClassList.jsp?cate=문화">문화</a></li>
							<li><a href="ClassList.jsp?cate=문학">문학</a></li>
							<li><a href="ClassList.jsp?cate=컴퓨터ㆍIT">컴퓨터ㆍIT</a></li>
						</ul>
					</div>
				</div>
				<div class="col-lg-9" style="height: 60px;">
					<div class="hero__search">
						<div class="hero__search__form">
							<form action="MainSearchClass.jsp">
								<!-- <div class="hero__search__categories"> 
                                    카테고리
                                    <span class="arrow_carrot-down"></span>
                                </div>-->
								<input type="text" placeholder="찾으시는 취미가 있으신가요?" name= Searchs>
								<button type="submit" class="site-btn">SEARCH</button>
							</form>
						</div>
						<!-- <a href="URL" onclick="window.open(this.href, '_blank', 'width=300px,height=300px,toolbars=no,scrollbars=no'); return false;"> -->
						<div class="hero__search__phone">
							<div class="hero__search__phone__icon">
								<i class="fa fa-phone"></i>
							</div>
							<div class="hero__search__phone__text">
								<h5>062-655-3509</h5>
								<span>AM 09:00 ~ PM 06:00</span>
							</div>
						</div>
						<!-- </a> -->
					</div>
				</div>
			</div>
			<!--  -->
			<div class="row">
				<div class="col-lg-12 ">
					<div>
						<div type="button" class="hero__item set-bg"
							style="position: relative; z-index: 1;"
							data-setbg="img/bnn.jpg"
							onclick="location.href='GPSClass.html'">
							<div type="button" class="hero__item set-bg"
								style="position: relative; z-index: 1;"
								data-setbg="img/new/ezgif-3-de97db19cb70.gif"
								onclick="location.href='GPSClass.html'"></div>
							<div class="hero__text">
								<span>G-CAP</span>
								<h2>
									올해 가장 잘 나가는 <br />클래스를 0원에 <br />만날 수 있는 기회
								</h2>
								<p>30초안에 댓글달고 2021인기 클래스 무료로 듣자~!</p>
								<!-- <a href="#" class="primary-btn">클래스 보러가기</a> -->
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="ttt" style="text-align: center; left:50%">
					<div class="ttt" style="text-align: center;">
						<div class="ttt" style="text-align: center; position:relative; top:-100px; z-index:1; left:250px">
							<div class="categories__item set-bg test"
								data-setbg="img/categories/class2.png">
								<!-- <h5><a href="#">강의 목록</a></h5> -->
							</div>
							<div class="categories__item set-bg test"
								data-setbg="img/categories/location8.png" >
								<h5>
									<!-- <a href="#">내 근처 강의</a> -->
								</h5>
							</div>
							<div class="categories__item set-bg test" 
								data-setbg="img/categories/file2.png" >
								<h5>
									<!-- <a href="#">관심 성향 테스트</a> -->
								</h5>
							</div>
							<div class="categories__item set-bg test"
								data-setbg="img/categories/call5.png" >
								<h5>
									<!-- <a href="#">전화</a> -->
								</h5>
							</div>
						</div>
					</div>
				</div>
	</section>
	<!-- Hero Section End -->


	<!-- Categories Section Begin -->
	<!-- this -->
	<!-- <section class="test" > -->

	<!--  </section> -->
	<!-- Categories Section End -->




	<!-- Featured Section Begin -->
	<section class="featured spad">
	<!-- 부모 -->
		<div class="container" style="text-align: center; position:relative;">
			<div class="row">
				<div class="col-lg-12" style="position : relative; /*right:9.2cm;*/">
					<div class="section-title">
						<h2>클래스</h2>
					</div>
					<div class="featured__controls">
						<ul>
							<li class="active" data-filter="*">전체</li>
							<li data-filter=".oranges">이벤트</li>
							<li data-filter=".fresh-meat">인기강의</li>
							<li data-filter=".vegetables">오픈 클래스</li>
							<li data-filter=".fastfood">오픈 예정 클래스</li>
						</ul>
					</div>
				</div>
			</div>
			<div class="row featured__filter">
				<div class="col-lg-3 col-md-4 col-sm-6 mix oranges fresh-meat">
					<div class="featured__item">
						<div class="featured__item__pic set-bg"
							data-setbg="img/index/picic.png">
							<ul class="featured__item__pic__hover">
								
							</ul>
						</div>
						<div class="featured__item__text">
							<h6>
								<a href="#">이벤트 강의/인기강의</a>
							</h6>
							<h5>$30.00</h5>
						</div>
					</div>
				</div>
				<div class="col-lg-3 col-md-4 col-sm-6 mix vegetables fastfood">
					<div class="featured__item">
						<div class="featured__item__pic set-bg"
							data-setbg="img/index/a1.jpg">
							<ul class="featured__item__pic__hover">
								
							</ul>
						</div>
						<div class="featured__item__text">
							<h6>
								<a href="#">오픈클래스/오픈예정클래스</a>
							</h6>
							<h5>$30.00</h5>
						</div>
					</div>
				</div>
				<div class="col-lg-3 col-md-4 col-sm-6 mix vegetables fresh-meat">
					<div class="featured__item">
						<div class="featured__item__pic set-bg"
							data-setbg="img/index/eng1.jpg">
							<ul class="featured__item__pic__hover">
								
						</div>
						<div class="featured__item__text">
							<h6>
								<a href="#">인기강의/오픈클래스</a>
							</h6>
							<h5>$30.00</h5>
						</div>
					</div>
				</div>
				<div class="col-lg-3 col-md-4 col-sm-6 mix fastfood oranges">
					<div class="featured__item">
						<div class="featured__item__pic set-bg"
							data-setbg="img/index/han.jpg">
							<ul class="featured__item__pic__hover">
								
							</ul>
						</div>
						<div class="featured__item__text">
							<h6>
								<a href="#">이벤트강의/오픈예정클래스 </a>
							</h6>
							<h5>$30.00</h5>
						</div>
					</div>
				</div>
				<div class="col-lg-3 col-md-4 col-sm-6 mix fresh-meat vegetables">
					<div class="featured__item">
						<div class="featured__item__pic set-bg"
							data-setbg="img/index/cr3.jpg">
							<ul class="featured__item__pic__hover">
								
							</ul>
						</div>
						<div class="featured__item__text">
							<h6>
								<a href="#">인기강의/오픈클래스</a>
							</h6>
							<h5>$30.00</h5>
						</div>
					</div>
				</div>
				<div class="col-lg-3 col-md-4 col-sm-6 mix oranges fastfood">
					<div class="featured__item">
						<div class="featured__item__pic set-bg"
							data-setbg="img/index/nail.png">
							<ul class="featured__item__pic__hover">
								
							</ul>
						</div>
						<div class="featured__item__text">
							<h6>
								<a href="#">이벤트강의/오픈예정클래스</a>
							</h6>
							<h5>$30.00</h5>
						</div>
					</div>
				</div>
				<div class="col-lg-3 col-md-4 col-sm-6 mix fresh-meat vegetables">
					<div class="featured__item">
						<div class="featured__item__pic set-bg"
							data-setbg="img/index/bubu.png">
							<ul class="featured__item__pic__hover">
								
							</ul>
						</div>
						<div class="featured__item__text">
							<h6>
								<a href="#">인기강의/오픈클래스</a>
							</h6>
							<h5>$30.00</h5>
						</div>
					</div>
				</div>
				<div class="col-lg-3 col-md-4 col-sm-6 mix fastfood vegetables">
					<div class="featured__item">
						<div class="featured__item__pic set-bg"
							data-setbg="img/index/c00k.jpg">
							<ul class="featured__item__pic__hover">
								
							</ul>
						</div>
						<div class="featured__item__text">
							<h6>
								<a href="#">오픈클래스/오픈예정클래스</a>
							</h6>
							<h5>$30.00</h5>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Featured Section End -->

	<!-- Banner Begin -->
	<div class="banner">
		<div class="container">
			<div class="row">
			</div>
		</div>
	</div>
	<!-- Banner End -->

	<!-- Latest Product Section Begin -->
	<section class="latest-product spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-4 col-md-6">
					<div class="latest-product__text" style="position: relative; left: 20px;">
						<h4>신규강의</h4>
						<div class="latest-product__slider owl-carousel">
							<div class="latest-prdouct__slider__item">
								<a href="#" class="latest-product__item">
									<div class="latest-product__item__pic">
										<img src="img/new/ajaja.jpg" alt="">
									</div>
									<div class="latest-product__item__text">
										<h6>공예</h6>
										<br> <span>11월 19일 OPEN</span>
									</div>
								</a> <a href="#" class="latest-product__item">
									<div class="latest-product__item__pic">
										<img src="img/new/kids.jpg" alt="">
									</div>
									<div class="latest-product__item__text">
										<h6>즐거운 그림책 읽기</h6>
										<span>11월 25일 OPEN</span>
									</div>
								</a> <a href="#" class="latest-product__item">
									<div class="latest-product__item__pic">
										<img src="img/new/sou.png" alt="">
									</div>
									<div class="latest-product__item__text">
										<h6>음치 벗어나기</h6>
										<span>11월 30일 OPEN</span>
									</div>
								</a>
							</div>
							<div class="latest-prdouct__slider__item">
								<a href="#" class="latest-product__item">
									<div class="latest-product__item__pic">
										<img src="img/new/photo.jpg" alt="">
									</div>
									<div class="latest-product__item__text">
										<h6>나만의 인생샷 건지기</h6>
										<span>12월 5일 OPEN</span>
									</div>
								</a> <a href="#" class="latest-product__item">
									<div class="latest-product__item__pic">
										<img src="img/new/youtube.jpg" alt="">
									</div>
									<div class="latest-product__item__text">
										<h6>유튜브 컨텐츠 제작</h6>
										<span>12월 11일 OPEN</span>
									</div>
								</a> <a href="#" class="latest-product__item">
									<div class="latest-product__item__pic">
										<img src="img/new/TES.png" alt="">
									</div>
									<div class="latest-product__item__text">
										<h6>나는야 맛감별사</h6>
										<span>12월 25일 OPEN</span>
									</div>
								</a>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-md-6">
					<div class="latest-product__text">
						<h4>인기강의</h4>
						<div class="latest-product__slider owl-carousel">
							<div class="latest-prdouct__slider__item">
								<a href="#" class="latest-product__item">
									<div class="latest-product__item__pic">
										<img src="img/new/toget.jpg" alt="">
									</div>
									<div class="latest-product__item__text">
										<h6>부모님과 같이하는 요리시간</h6>
										<span>20명 수강중!</span>
									</div>
								</a> <a href="#" class="latest-product__item">
									<div class="latest-product__item__pic">
										<img src="img/new/lag.jpg" alt="">
									</div>
									<div class="latest-product__item__text">
										<h6>서예로 역사에 빠져들기</h6>
										<span>18명 수강중!</span>
									</div>
								</a> <a href="#" class="latest-product__item">
									<div class="latest-product__item__pic">
										<img src="img/new/babyy.jpg" alt="">
									</div>
									<div class="latest-product__item__text">
										<h6>태교시간</h6>
										<span>10명 수강중!</span>
									</div>
								</a>
							</div>
							<div class="latest-prdouct__slider__item">
								<a href="#" class="latest-product__item">
									<div class="latest-product__item__pic">
										<img src="img/new/web.jpg" alt="">
									</div>
									<div class="latest-product__item__text">
										<h6>웹 디자인 마스터</h6>
										<span>9명 수강중!</span>
									</div>
								</a> <a href="#" class="latest-product__item">
									<div class="latest-product__item__pic">
										<img src="img/new/drum.jpg" alt="">
									</div>
									<div class="latest-product__item__text">
										<h6>우당탕탕 챙~ 드러머되기</h6>
										<span>9명 수강중!</span>
									</div>
								</a> <a href="#" class="latest-product__item">
									<div class="latest-product__item__pic">
										<img src="img/new/yoyo.png" alt="">
									</div>
									<div class="latest-product__item__text">
										<h6>필라테스 중급반</h6>
										<span>6명 수강중!</span>
									</div>
								</a>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-md-6">
					<div class="latest-product__text">
						<h4>종료 임박 강의</h4>
						<div class="latest-product__slider owl-carousel">
							<div class="latest-prdouct__slider__item">
								<a href="#" class="latest-product__item">
									<div class="latest-product__item__pic">
										<img src="img/new/des.jpg" alt="">
									</div>
									<div class="latest-product__item__text">
										<h6>색 감별사 자격증 과정</h6>
										<span>D-7day!</span>
									</div>
								</a> <a href="#" class="latest-product__item">
									<div class="latest-product__item__pic">
										<img src="img/new/piano.jpg" alt="">
									</div>
									<div class="latest-product__item__text">
										<h6>모자르트 배우기</h6>
										<span>D-5day!</span>
									</div>
								</a> <a href="#" class="latest-product__item">
									<div class="latest-product__item__pic">
										<img src="img/new/si.jpg" alt="">
									</div>
									<div class="latest-product__item__text">
										<h6>한국어 배우기</h6>
										<span>D-4day!</span>
									</div>
								</a>
							</div>
							<div class="latest-prdouct__slider__item">
								<a href="#" class="latest-product__item">
									<div class="latest-product__item__pic">
										<img src="img/new/yoyo.png" alt="">
									</div>
									<div class="latest-product__item__text">
										<h6>필라테스 초급반</h6>
										<span>D-2day!</span>
									</div>
								</a> <a href="#" class="latest-product__item">
									<div class="latest-product__item__pic">
										<img src="img/new/hair.jpg" alt="">
									</div>
									<div class="latest-product__item__text">
										<h6>헤어디자이너</h6>
										<span>D-1day!</span>
									</div>
								</a> <a href="#" class="latest-product__item">
									<div class="latest-product__item__pic">
										<img src="img/new/dog.jpg" alt="">
									</div>
									<div class="latest-product__item__text">
										<h6>강아지랑 소통하기</h6>
										<span>D-DAY!</span>
									</div>
								</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Latest Product Section End -->

	<!-- Blog Section Begin -->
	<!-- <section class="from-blog spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="section-title from-blog__title">
						<h2>수강후기</h2>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-4 col-md-4 col-sm-6">
					<div class="blog__item">
						<div class="blog__item__pic">
							<img src="img/blog/blog-1.jpg" alt="">
						</div>
						<div class="blog__item__text">
							<ul>
								<li><i class="fa fa-calendar-o"></i> May 4,2019</li>
								<li><i class="fa fa-comment-o"></i> 5</li>
							</ul>
							<h5>
								<a href="#">Cooking tips make cooking simple</a>
							</h5>
							<p>Sed quia non numquam modi tempora indunt ut labore et
								dolore magnam aliquam quaerat</p>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-md-4 col-sm-6">
					<div class="blog__item">
						<div class="blog__item__pic">
							<img src="img/blog/blog-2.jpg" alt="">
						</div>
						<div class="blog__item__text">
							<ul>
								<li><i class="fa fa-calendar-o"></i> May 4,2019</li>
								<li><i class="fa fa-comment-o"></i> 5</li>
							</ul>
							<h5>
								<a href="#">6 ways to prepare breakfast for 30</a>
							</h5>
							<p>Sed quia non numquam modi tempora indunt ut labore et
								dolore magnam aliquam quaerat</p>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-md-4 col-sm-6">
					<div class="blog__item">
						<div class="blog__item__pic">
							<img src="img/blog/blog-3.jpg" alt="">
						</div>
						<div class="blog__item__text">
							<ul>
								<li><i class="fa fa-calendar-o"></i> May 4,2019</li>
								<li><i class="fa fa-comment-o"></i> 5</li>
							</ul>
							<h5>
								<a href="#">Visit the clean farm in the US</a>
							</h5>
							<p>Sed quia non numquam modi tempora indunt ut labore et
								dolore magnam aliquam quaerat</p>
						</div>
					</div>
				</div>
			</div>
		</div> -->
	</section>
	<!-- Blog Section End -->

	<!-- Footer Section Begin -->
	<footer class="footer spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-3 col-md-6 col-sm-6" style="position: relative; right: -88px;">
					<div class="footer__about" style="width: 320px;">
						<div class="footer__about__logo">
							<a href="./index.html"><img src="img/index/lastlo.png" alt=""></a>
						</div>
						<ul>
							<!-- <li>팀명 : NEXT LEVEL</li>
							<li>팀원 : 서정현 김대우 김영웅 박민 이다연 정유진</li> -->
							<li>주소 : 광주 남구 송암로 60 광주CGI센터 2층</li>
							<li>전화번호 : 062-655-3509</li>
							<li>Email: smhrd@smhrd.or.kr</li>
						</ul>
					</div>
				</div>
				<!-- <div class="col-lg-4 col-md-6 col-sm-6 offset-lg-1">
                    <div class="footer__widget">
                        <h6>Useful Links</h6>
                        <ul>
                            <li><a href="#">About Us</a></li>
                            <li><a href="#">About Our Shop</a></li>
                            <li><a href="#">Secure Shopping</a></li>
                            <li><a href="#">Delivery infomation</a></li>
                            <li><a href="#">Privacy Policy</a></li>
                            <li><a href="#">Our Sitemap</a></li>
                        </ul>
                        <ul>
                            <li><a href="#">Who We Are</a></li>
                            <li><a href="#">Our Services</a></li>
                            <li><a href="#">Projects</a></li>
                            <li><a href="#">Contact</a></li>
                            <li><a href="#">Innovation</a></li>
                            <li><a href="#">Testimonials</a></li>
                        </ul>
                    </div>
                </div> -->
				<div class="col-lg-4 col-md-12">
					<div class="footer__widget" style="position: relative; left: 447px;">
						<h6>Join Our Newsletter Now</h6>
						<p>Get E-mail updates about our latest shop and special
							offers.</p>
						<form action="#">
							<input type="text" placeholder="Enter your mail">
							<button type="submit" class="site-btn">Subscribe</button>
						</form>
						<div class="footer__widget__social">
							<a href="#"><i class="fa fa-facebook"></i></a> <a href="#"><i
								class="fa fa-instagram"></i></a> <a href="#"><i
								class="fa fa-twitter"></i></a> <a href="#"><i
								class="fa fa-pinterest"></i></a>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12">
					<div class="footer__copyright" style="position: relative; left: 454px;">
						<div class="footer__copyright__text">
							<ul style="text-align: center;">
								<li>팀명 : NEXT LEVEL</li>
								<li>팀원 : 서정현 김대우 김영웅 박민 이다연 정유진</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<!-- <div class="row">
                <div class="col-lg-12">
                    <div class="footer__copyright">
                        <div class="footer__copyright__text">
                            <p> -->
			<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
			<!-- Copyright &copy;<script>
                                    document.write(new Date().getFullYear());

                                </script> All rights reserved | This template is made with <i class="fa fa-heart" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a> -->
			<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
			<!-- </p>
                        </div>
                        <div class="footer__copyright__payment"><img src="img/payment-item.png" alt=""></div>
                    </div>
                </div>
            </div> -->
		</div>
	</footer>
	<!-- Footer Section End -->

<!-- modal -->
<div id="container">
 	<section id ="testMain">
  		<div class="popup-wrap"">
   		 <div class="popup">
    		<span class ="closeArea">X</span>
    		<div id = "testWrap">
     		<p id = "testTitle">관심 성향 테스트<p>
     		<img src="img/test/Researching-pana.png" alt ="이미지가 로드 되지 않음" id = "testImg">
     		<p id = "testMainMargin">어떤 강의를 들을지 고민이시라구요?!</p>
     		<p>간단한 테스트를 통해서 맞춤 강의를 추천 받아 보세요!!</p>
      		<div id = "testStart">시작하기</div>	
      		</div>
		</section>
	<section id ="testQNA">
		<div class="popup-wrap" >
			 <div class="popup">
    		<span class ="closeArea">X</span>
    		<div id = "testWrap">
	     			<div class="qBox">
	     			
	     			</div>
	     			
	     			<div class="answerBox">
	     			
	     			</div>
		</div>
	</section>
	
	<section id ="testResult" >
	<div class="popup-wrap"">
   		 <div class="popup">
    		<span class ="closeArea">X</span>
    		<div id = "testWrap">
     		<p id = "testTitle">당신의 결과는?!<p>
     		<div class="resultName">
     		
     		</div>
     		
			<div id = "resultImg">
			
			</div>
			<div class="resultDesc"> 
			
			</div>
			<div class="resultDesc2">
			
			</div>
			<button type = "button" class= "searchLink">관련 강의 보기</button>
      		</div>
	</section>
		</div>
	</div>
	</div>

	<!-- Js Plugins -->
	<script src="js/jquery-3.3.1.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.nice-select.min.js"></script>
	<script src="js/jquery-ui.min.js"></script>
	<script src="js/jquery.slicknav.js"></script>
	<script src="js/mixitup.min.js"></script>
	<script src="js/owl.carousel.min.js"></script>
	<script src="js/main.js"></script>
	<script src="js/TestList.js" charset="utf-8"></script>
	<script src="js/Start.js" charset="utf-8"></script>
	
	<script>
		
	 $('#community').on('click', function(){
		
		 if($('#id_check').val()==0){
			 alert('로그인 후 이용해주세요.')
		 }else{
			 window.location.href = "Board/BoardList.jsp"
		 }
		 
	 })
	
	</script>



</body>

</html>
