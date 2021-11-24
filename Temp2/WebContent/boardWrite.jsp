<%@page import="Model_User.UserDAO"%>
<%@page import="Model_User.UserVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">



<!-- Bootstrap CSS -->

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">

<!-- common CSS -->





<title>board</title>


<style>

body {

  padding-top: 70px;

  padding-bottom: 30px;

}

.filebox .upload-name {
    display: inline-block;
    height: 30px;
    width : 500px;
    padding: 0 10px;
    vertical-align: middle;
    border: 1px solid #dddddd;
    width: 78%;
    color: #999999;
    font-size : .875rem;
    
}

.filebox label {
    display: inline-block;
    color: #fff;
    vertical-align: middle;
    background-color: #999999;
    cursor: pointer;
    height: 30px;
    
    padding: 0.25rem 0.5rem;
    font-size: .875rem;
   
    border-radius: 0.2rem;

    color: #fff;
    background-color: #007bff;
    border-color: #007bff;
    
}

.filebox input[type="file"] {
    position: absolute;
    width: 0;
    height: 0;
    padding: 0;
    overflow: hidden;
    border: 0;
}

</style>

</head>

<body>
<%
	UserDAO dao = new UserDAO();
	UserVO vo = (UserVO)session.getAttribute("user");
	String id = vo.getId();

%>

	<article>

		<div class="container" role="main">

			<h2>글 작성하기</h2>

			<form action="WriteBoard" method="post" enctype="multipart/form-data">
			
				<div>
					<input name="id" type="text" style="display:none;" value=<%=id %>>
				</div>
				
				<div class="mb-3">

					<label for="title">제목</label>

					<input type="text" class="form-control" name="title" id="title" placeholder="제목을 입력해 주세요">

				</div>
				
				
				<div class="mb-3">
   					<div class="filebox">
						
						<label for="file">파일찾기</label> 
						
						<input class="upload-name" type="file" name="file1" id="file">
						
						
						<div id="showFiles">
						
    					</div>
    					
					</div>
					
				</div>
				
				<div class="mb-3">

					<label for="content">내용</label>

					<textarea class="form-control" rows="5" name="content" id="content" placeholder="내용을 입력해 주세요" ></textarea>

				</div>


			

			

			<div>

								
				<input type="submit" class="btn btn-sm btn-primary" id="btnSave" value="저장">

				<a href="Board/BoardList.jsp"><button type="button" class="btn btn-sm btn-primary" id="btnList">목록</button></a>
				

			</div>
			</form>

		</div>

	</article>
	<script src="js/jquery-3.3.1.min.js"></script>
	
	<script>


	
	
		window.onload = function(){
	        target = document.getElementById('file');
	        target.addEventListener('change', function(){
	            fileList = "";
	            for(i = 0; i < target.files.length; i++){
	                fileList += target.files[i].name + '<br>';
	            }
	            target2 = document.getElementById('showFiles');
	            target2.innerHTML = fileList;
	        });
	    }



	
	</script>

</body>

</html>

