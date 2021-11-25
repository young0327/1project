<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 글 읽기</title>
<!-- Css Styles -->
<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
<link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
<link rel="stylesheet" href="css/nice-select.css" type="text/css">
<link rel="stylesheet" href="css/jquery-ui.min.css" type="text/css">
<link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
<link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
<link rel="stylesheet" href="css/style.css" type="text/css">
<script>

	$(document).on('click', '#btnList', function(){

		location.href = "${pageContext.request.contextPath}/board/getBoardList";

	});

</script>
<style>
body {

	padding-bottom: 50px;

}

.board_title {

	font-weight : 700;

	font-size : 22pt;

	margin : 10pt;

}

.board_info_box {

	color : #6B6B6B;

	margin : 10pt;

}

.board_author {

	font-size : 10pt;

	margin-right : 10pt;

}

.board_date {

	font-size : 10pt;

}

.board_content {

	color : #444343;

	font-size : 12pt;

	margin : 10pt;

}

.board_tag {

	font-size : 11pt;
	height: 340px;
	margin : 10pt;

	padding-bottom : 10pt;
}
.header{
	    padding-bottom: 0px;
}
span{
	margin-top: 10px;
}
p{
	margin-bottom: 10px;
}

</style>
</head>
<body>
<div>
        <jsp:include page="header.jsp" flush="true"></jsp:include>
    </div>
	<article>

		<div class="container" role="main">
			<h3>자유게시판</h3>
			
			<div class="bg-white rounded shadow-sm">
				<div class="board_title"> 제목</div>
				
				<div class="board_info_box">
					<span class="board_author">아이디</span><span class="board_date">2021-11-25</span>
				</div>
				<div class="board_content"></div>
				<div class="board_tag">내용 내용</div>
			</div>
			<div style="margin-top : 20px; float: right;">
				<button type="button" class="btn btn-sm btn-primary" id="btnUpdate">수정</button>
				<button type="button" class="btn btn-sm btn-primary" id="btnDelete">삭제</button>
				<button type="button" class="btn btn-sm btn-primary" id="btnList">목록</button>
			</div>
		</div>
<!-- Reply Form {s} -->
			<div class="container">
			<div class="my-3 p-3 bg-white rounded shadow-sm" style="padding-top: 10px">
				<form:form name="form" id="form" role="form" method="post">
				<form:hidden path="bid" id="bid"/>
				<div class="row">
					<div class="col-sm-10 border-bottom" style="padding-bottom:8px;">
						<strong class="pb-2 mb-0">닉네임</strong>
					</div>
					<div class="col-sm-10" style="padding-top:10px">
						<input type="text" path="content" id="content" class="form-control" rows="3" placeholder="댓글을 입력해 주세요"></input>
					</div>
					<div class="col-sm-2">
						
						<button type="button" class="btn btn-sm btn-primary" id="btnReplySave" style="width: 100%; margin-top: 10px"> 등록 </button>
					</div>
				</div>
				</form:form>
			</div>
			</div>
			<!-- Reply Form {e} -->
			
			<!-- 댓글 한마디-->
			<div class="container">
			<div class="my-3 p-3" style="padding-top: 10px">
				<h6 class="border-bottom pb-2 mb-0">댓글</h6>
				<div class="media text-muted">
        <p class="media-body small lh-125 border-bottom horder-gray" style="padding-bottom: 8px;">
                <span class="d-block">
            <strong class="text-gray-dark">아이디</strong><br>
            <span>내용내용내용나나나나나나나나나나나나나</span>
            <span style="font-size: 9pt; padding-left: 10px;">
            <a href="#">수정</a>
            <a href="#">삭제</a>
            <a href="#">관리</a>
        </span>
        </span>
        </p>
        <!-- 댓글 한마디 끝-->
        
        <!-- 댓글 한마디-->
    </div><div class="media text-muted">
        <p class="media-body small lh-125 border-bottom horder-gray" style="padding-bottom: 8px;">
                <span class="d-block">
            <strong class="text-gray-dark">아이디</strong><br>
            <span>내용내용내용나나나나나나나나나나나나ㅇㅇ나</span>
            <span style="font-size: 9pt; padding-left: 10px;">
            <a href="#">수정</a>
            <a href="#">삭제</a>
            <a href="#">관리</a>
        </span>
        </span>
        </p>
    </div>
<!-- 댓글 한마디 끝-->

				<div class="border-bottom">
				<span>나나나나나나나ㅏ나나나나나나ㅏ나나나ㅏ나나나나</span>
				<button type="button" class="btn btn-sm btn-primary" id="btnList" style="float: right;">수정</button>
				<button type="button" class="btn btn-sm btn-primary" id="btnList" style="float: right;">삭제</button>
				<button type="button" class="btn btn-sm btn-primary" id="btnList" style="float: right;">관리</button>
				</div>
				<div class="border-bottom">
				<span>이제 그만하자 집에 가고싶다</span>
				<button type="button" class="btn btn-sm btn-primary" id="btnList" style="float: right;">수정</button>
				<button type="button" class="btn btn-sm btn-primary" id="btnList" style="float: right;">삭제</button>
				<button type="button" class="btn btn-sm btn-primary" id="btnList" style="float: right;">관리</button>
				</div>
				<div class="border-bottom">
				<span>현재 시간 9시가 다 되어 갑니다</span>
				<button type="button" class="btn btn-sm btn-primary" id="btnList" style="float: right;">수정</button>
				<button type="button" class="btn btn-sm btn-primary" id="btnList" style="float: right;">삭제</button>
				<button type="button" class="btn btn-sm btn-primary" id="btnList" style="float: right;">관리</button>
				</div>
			</div> 
	</article>
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

</body>

</html>

