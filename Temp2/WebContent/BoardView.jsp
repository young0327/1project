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
			
			<!-- Reply List {s}-->
			<div class="container">
			<div class="my-3 p-3" style="padding-top: 10px">
				<h6 class="border-bottom pb-2 mb-0">댓글</h6>
				<div id="replyList"></div>
				
				
				<div>
				<span>1</span>
				<button type="button" class="btn btn-sm btn-primary" id="btnList" style="float: right;">수정</button>
				<button type="button" class="btn btn-sm btn-primary" id="btnList" style="float: right;">삭제</button>
				<button type="button" class="btn btn-sm btn-primary" id="btnList" style="float: right;">관리</button>
				</div>
				<div>
				<span>1</span>
				<button type="button" class="btn btn-sm btn-primary" id="btnList" style="float: right;">수정</button>
				<button type="button" class="btn btn-sm btn-primary" id="btnList" style="float: right;">삭제</button>
				<button type="button" class="btn btn-sm btn-primary" id="btnList" style="float: right;">관리</button>
				</div>
				<div>
				<span>1</span>
				<button type="button" class="btn btn-sm btn-primary" id="btnList" style="float: right;">수정</button>
				<button type="button" class="btn btn-sm btn-primary" id="btnList" style="float: right;">삭제</button>
				<button type="button" class="btn btn-sm btn-primary" id="btnList" style="float: right;">관리</button>
				</div>
			</div> 
	</article>
</div>
<div class="container">
<div class="media text-muted pt-3"></div>
		<svg class="bd-placeholder-img mr-2 rounded" width="32" height="32" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder:32x32">';
		<title>Placeholder</title>';
		<rect width="100%" height="100%" fill="#007bff"></rect>
		<text x="50%" fill="#007bff" dy=".3em">32x32</text>
		</svg>
		<p class="media-body pb-3 mb-0 small lh-125 border-bottom horder-gray">
		<span class="d-block">
		<strong class="text-gray-dark"></strong>
		<span style="padding-left: 7px; font-size: 9pt">
		<a href="javascript:void(0)"style="padding-right:5px">저장</a>
		<a href="javascript:void(0)" >취소<a>
		</span>
		</span>
		<input name="editContent" id="editContent" class="form-control" rows="3"></input>
		</p>
		</div>
</div>
<!-- 댓글 창 -->
	<div class="container">
	 <div class="media text-muted pt-3" id="rid' + this.rid + '">
           
        <p class="media-body pb-3 mb-0 small lh-125 border-bottom horder-gray">
                <span class="d-block">
            <strong class="text-gray-dark">여기가 아이디래</strong><br>
            <span>내용?</span>
            <span style="font-size: 9pt">
            <ahref="javascript:void(0)">수정</a>
            <a>삭제</a>
            <a>관리</a>
        </span>
        </span>
        </p>
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

</body>

</html>

