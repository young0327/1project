<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>




<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">



<title>board</title>



<script>

	$(document).on('click', '#btnList', function(){

		location.href = "${pageContext.request.contextPath}/board/getBoardList";

	});

</script>





</head>

<body>

<div class="container col-md-6">
    <div class="card">
        <div class="card-body">
            <h4 class="card-title mb-3">${detail.TITLE }</h4>
            <h6 class="card-subtitle text-muted mb-4">
                <i class="far fa-user"></i> ${detail.CREA_ID }
                ·
                <i class="far fa-clock"></i> ${detail.CREA_DATE }
                ·
                <i class="fas fa-align-justify"></i> ${detail.HIT_CNT }
            </h6>
            <p class="card-text">${detail.CONTENTS }</p>
        </div>
        <div class="card-body">
            <a href="#" class="btn btn-outline-secondary btn-sm" role="button">수정</a>
            <a href="#" class="btn btn-outline-secondary btn-sm " role="button">삭제</a>
        </div>
        <div class="card-body">
            <a href='<c:url value='/board/boardList'/>' class="btn btn-info" role="button">목록으로</a>
        </div>
    </div>
</div>



</body>

</html>



