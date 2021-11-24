<%@page import="Model_Board.*"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
	BoardDAO dao = new BoardDAO();
	ArrayList<BoardVO> al = dao.showArticle();

	
%>
<h1>게시판 페이지</h1>


	<table>
	<tr>
		<th>순번</th>
		<th>제목</th>
		<th>작성자</th>
		<th>작성일자</th>
		<th>조회수</th>
	</tr>
	<%for(BoardVO vo : al){ %>

	<tr>
		<td><%=vo.getArticle_seq() %></td>
		<td><a href="HitCountBoard?num=<%=vo.getArticle_seq()%>"><%=vo.getArticle_subject() %></a></td>
		<td><%=vo.getNick() %></td>
		<td><%=vo.getReg_date() %></td>
		<td><%=vo.getCnt() %></td>
	</tr>
	<%} %>
	</table>

	<input id = "create" type="button" value="작성하기">

	
	<script src="js/jquery-3.3.1.min.js"></script>
	<script>
	document.getElementById("create").onclick = function(){
		
		window.location.href = "writeBoard.jsp"
	}
	
	</script>
	<script>


		

	
	
	</script>






</body>
</html>