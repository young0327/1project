<%@page import="Model_Board.*"%>
<%@page import="Model_User.UserVO"%>
<%@page import="Model_User.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>

#text {

    -moz-appearance: textfield-multiline;

    -webkit-appearance: textarea;

    border: 1px solid gray;

    font: medium -moz-fixed;

    font: -webkit-small-control;

    overflow: auto;

    padding: 2px;

    resize: both;

  }
  .board_title{
 
	 width : 390px;
	 font-size : 20px;
	 border: 1px solid gray;
 
 }
 
 #content{
 
 	border: 1px solid gray;
 
 }
 
 .writer{
 
 	visibility : hidden;
 
 }
 
 .seq{
 
 	visibility : hidden;
 
 }
 
 
</style>
</head>
<body>
<%
	
	BoardDAO dao2 = new BoardDAO();
	int num = Integer.parseInt(request.getParameter("num"));
	BoardVO vo2 = dao2.showOneArticle(num);
	String id = vo2.getU_id();

%>

<form action="UpdateBoard" method="post" enctype="multipart/form-data">

	<div class="title-wrapper">
		<input name= "id" class="writer" type="text" value=<%=id %>>
		<input name= "num" class="seq" type="text" value=<%=num %>>
		<div class="title-wrapper">제목 : </div>
		<input type = "text" name= "title" class="board_title" value=<%=vo2.getArticle_subject() %>></div>
    <input class= "files" name="file1" type="file" value=<%=vo2.getFile1() %>>
    <input class= "files" name="file2" type="file" value=<%=vo2.getFile2() %>>


  
  <textarea name="content" ><%=vo2.getArticle_content() %></textarea>
 <br>


<input type="submit" id="apply" value="수정하기">
</form>
</body>
<script src="js/jquery-3.3.1.min.js"></script>
<script>





</script>


</html>