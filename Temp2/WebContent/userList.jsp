<%@page import="Model_User.*"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model_User.UserDAO"%>
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
	UserDAO dao = new UserDAO();
	ArrayList<UserVO> al = dao.selectAll();
	
%>
<h1>마이페이지</h1>

	<form action = "#" method ="post">
	<table>
	<tr>
		<th>아이디</th>
		<th>이름</th>
		<th>닉네임</th>
		<th>전화번호</th>
		<th>email</th>
		<th>주소</th>
		<th>가입일자</th>
		<th>포인트</th>
		<th>회원상태</th>
	</tr>
	<%for(UserVO vo : al){ %>
	<%String totalAddr = "("+vo.getPostcd()+")"+vo.getAddr()+" "+vo.getAddrdtl1()+vo.getAddrdtl2(); %>
	<tr>
		<td><%=vo.getId() %></td>
		<td><%=vo.getName() %></td>
		<td><%=vo.getNick() %></td>
		<td><%=vo.getPhone() %></td>
		<td><%=vo.getEmail() %></td>
		<td><%=totalAddr %></td>
		<td><%=vo.getJoinDt() %></td>
		<td><%=vo.getPoint() %></td>
		<%if(vo.getStatus().equals("Y")){ %>
		<td>
        <select name="status" class="status" id =<%=vo.getId() %>>
        <option value="Y" selected>활성</option>
        <option value="N">비활성</option>
        <option value="S">중지</option>
        </select>
        </td>
        <%}else if(vo.getStatus().equals("N")){ %>
        <td>
        <select name="status" class="status" id =<%=vo.getId() %>>
        <option value="Y">활성</option>
        <option value="N" selected>비활성</option>
        <option value="S">중지</option>
        </select>
        </td>
        <%}else { %>
        <td>
        <select name="status" class="status" id =<%=vo.getId() %>>
        <option value="Y">활성</option>
        <option value="N">비활성</option>
        <option value="S" selected>중지</option>
        </select>
        </td>
        <%} %>
	</tr>
	<%} %>
	</table>
	<input id = "statusSubmit" type="button" value="수정하기">
	</form>
	
	<script src="/GCAP/ogani-master/js/jquery-3.3.1.min.js"></script>
	<script>
			
		
		$('#statusSubmit').on('click',function(){
	
		let status = $('.status')
		let statusList = new Array()
		
		for(let i = 0; i < status.length; i++){
			
			let data = new Object()
			data.id = $(status[i]).attr('id')
			data.status = $(status[i]).val()
			statusList.push(data)
		
		}
		
		console.log(statusList)
		
		let statusJson = JSON.stringify(statusList)
		
		console.log(statusJson)
		
		
		$.ajax({
		
			url : "AdminUpdate",
			data : {data : statusJson},
			success : function(){
				window.location.href = "index.jsp";
			},
			error : function(){
				console.log("데이터전송 실패")
			}
			
		})
		})
		
		
		
	
	
	
	
	</script>


</body>
</html>