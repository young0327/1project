<%@page import="Model_User.UserVO"%>
<%@page import="Model_User.*"%>
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
 

 
</style>
</head>
<body>
<%
	UserDAO dao = new UserDAO();
	UserVO vo = (UserVO)session.getAttribute("user");
	String id = vo.getId();

%>

<form action="WriteBoard" method="post" enctype="multipart/form-data">

	<div class="title-wrapper">
		<input name= "id" class="writer" type="text" value=<%=id %>>
		<div class="title-wrapper">제목 : </div>
		<input type = "text" name= "title" class="board_title" ></div>
    <input class= "files" name="file1" type="file">
    <input class= "files" name="file2" type="file">

<!-- 
  <div style="background-color:#CCFFFF; width:390px; padding: 10px;">

    <button id="selectAll">전체선택</button>

    <button id="bold">굵게</button>

    <button id="italic">기울임</button>

    <button id="underLine">밑줄</button>
 





    <br/>

    <button id="justifyLeft">왼쪽정렬</button>

    <button id="justifyCenter">가운데정렬</button>

    <button id="justifyRight">오른쪽정렬</button>
    
    

    <br/>



    <select id="fontName" width="50px">

        <option value="">글꼴 선택</option>

        <option value="돋움">돋움</option>

        <option value="굴림">굴림</option>

        <option value="궁서">궁서</option>

        <option value="바탕">바탕</option>

        <option value="맑은 고딕">맑은 고딕</option>

    </select>

    <select id="fontSize" width="50px">

        <option value="">글자 크기</option>

        <option value="1">4px</option>

        <option value="2">8px</option>

        <option value="3">10px</option>

        <option value="4">12px</option>

        <option value="5">16px</option>

        <option value="6">20px</option>

        <option value="7">30px</option>

    </select>

    <select id="foreColor" width="50px">

        <option value="">글자 색깔</option>

        <option value="#f00">빨강</option>

        <option value="#00f">파랑</option>

        <option value="#0f0">초록</option>

        <option value="#ffff00">노랑</option>

        <option value="#000">검정</option>

    </select>

    <select id="hiliteColor" width="50px">

        <option value="">글자 배경색</option>

        <option value="#f00">빨강</option>

        <option value="#00f">파랑</option>

        <option value="#0f0">초록</option>

        <option value="#ffff00">노랑</option>

        <option value="#000">검정</option>

    </select>

  </div>
  <div id="content" contenteditable="true" style="width:400px; height:400px;">
 -->
  
  <textarea name="content">텍스트 편집기</textarea>
 <br>


<input type="submit" id="apply" value="등록하기">
</form>
</body>
<script src="js/jquery-3.3.1.min.js"></script>


<script>
/*
	$('button').click(function(){
	
	    document.execCommand($(this).attr('id'), false, true);
	});
	
	$('select').change(function(){
	
	    document.execCommand($(this).attr('id'), false, $(this).val());
	});
	
*/	
	
/*
	
	
	
	$('#apply').on('click',function(){
		
		
		let formData = new FormData();
		
		let data = {
				
				"id" : $('.writer').val(),
				"title" : $(".board_title").text(),
				"content" : $("#content").html()
		}
		
		
		
		let fileInput = $(".files");
		
		for (let i = 0; i < fileInput.length; i++){
			
			if(fileInput[i].files.length > 0){
				
				for(let j =0; j< fileInput[i].files.length; j++){
					
					console.log("fileInput[i].files[j] :::"+fileInput[i].files[j]);
					
					console.log(fileInput[i].files[j]);
					
					console.log($('.files')[i].files[j]);
					
					formData["file"+(i+1)] = $('.files')[i].files[j];
					
					
				}
				
			}
			
		}
		
		formData['key'] = new Blob([JSON.stringify(data)], {type: "application/json"});
		

		
		
		
		
		
		
		$.ajax({
			
	        type : 'POST',
			url : "/GCAP/WriteBoard_Temp",
			data : formData,
			contentType: false,
			processData: false,
			enctype: 'multipart/form-data',



			success : function(){
				
			},
			error : function(){
				
			}
			
			
		})
		
		
		
		
		
	})
	*/
</script>
</html>