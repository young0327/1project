<%@page import="Model_Class.*"%>
<%@page import="Model_User.UserVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model_User.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>

<style>

	.chkbox{

		visibility : hidden;


	}
	
	#allChk{

		visibility : hidden;


	}


</style>
</head>
<body>
<%
ClassDAO2 dao = new ClassDAO2();
	ArrayList<ClassVO2> al = dao.selectAll();
%>
<h1>강의관리 페이지</h1>


	<input id="modify" type="button" value="수정"><input id="cancel" type="button" value="취소">
	<table>
	<tr>
		<th><input type="checkbox" id="allChk"></th>
		<th>수업 순번</th>
		<th>교육기관 순번</th>
		<th>수업 이름</th>
		<th>수업 카테고리1</th>
		<th>수업 카테고리2</th>
		<th>수업 카테고리3</th>
		<th>수업 장소</th>
		<th>수업 시간</th>
		<th>수업 시작 날짜</th>
		<th>수업 종료 날짜</th>
		<th>수업 인원</th>
		<th>수강료</th>
		<th>상태</th>
	</tr>
	<%
	for(ClassVO2 vo : al){
	%>
	
	<tr>
		<td><input type="checkbox" class="chkbox" id=<%=vo.getC_seq() %>></td>
		<td><%=vo.getC_seq() %></td>
		<td><%=vo.getEdu_seq() %></td>
		<td><%=vo.getC_name() %></td>
		<td><%=vo.getC_category1() %></td>
		<td><%=vo.getC_category2() %></td>
		<td><%=vo.getC_category3() %></td>
		<td><%=vo.getC_location() %></td>
		<td><%=vo.getC_time() %></td>
		<td><%=vo.getC_start_dt() %></td>
		<td><%=vo.getC_end_dt() %></td>
		<td><%=vo.getC_count() %></td>
		<td><%=vo.getC_pay() %></td>
	</tr>
	<%} %>
	</table>
	<input id = "statusSubmit" type="button" value="완료">

	
	<script src="js/jquery-3.3.1.min.js"></script>
	<script>
	
	
	
		$("#modify").on('click',function(){
			$('.chkbox, #allChk').css('visibility','visible');
			
			
		})
		
		$("#cancel").on('click',function(){
			$('.chkbox, #allChk').css('visibility','hidden');
			
			
		})
		
		$("#allChk").on('click',function(){
		    if($('#allChk').is(':checked')){
		    	
		       $('.chkbox').prop('checked',true);
		       
		    }else{
		    	
		       $('.chkbox').prop('checked',false);
		       
		    }
		})
		
		$("#statusSubmit").on('click', function(){
			
			let arr = $(".chkbox")
			let nums = new Array()
			

			for(let i = 0; i < arr.length; i++){
				
				if($(arr[i]).prop("checked")){
					nums.push($(arr[i]).attr("id"))
					
				}
			}
			
			let obj = {"num" : nums}
			
			$.ajax({
				
				url : "AdminClassUpdate",
				data : obj,
				success : function(){
					alert("삭제 성공")
					
				},
				error : function(){
					alert("삭제 실패")
				}
				
				
				
			})
			
			
		})
		
		

		
		
	
	
	
	
	
	</script>
	


</body>
</html>