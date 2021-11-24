<%@page import="Model_Comment.*"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model_Comment.CommentDAO"%>
<%@page import="java.net.URLDecoder"%>
<%@page import="Model_User.UserVO"%>
<%@page import="Model_Board.BoardVO"%>
<%@page import="Model_Board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/paginationjs/2.1.4/pagination.css"/>
<style>
	button.confirm{
		
		width : 45px;
		height : 26px;
	
	}


</style>
</head>
<body>

<% 
	String num = request.getParameter("num");
	int seq_num = Integer.parseInt(num);
	BoardDAO dao = new BoardDAO();
	BoardVO vo = dao.showOneArticle(seq_num);
	
	UserVO vo2 = (UserVO)session.getAttribute("user");
	String currentUser = vo2.getId();
	String writer = vo.getU_id();
	
	String file1 = vo.getFile1();
	String file2 = vo.getFile2();
	String file1Name = null;
	String file2Name = null;
	if(file1 != null){
		file1Name = URLDecoder.decode(file1, "euc-kr");
	}else{
		file1Name = "파일없음";
	}
	
	if(file2 != null){
		file2Name = URLDecoder.decode(file2, "euc-kr");
	}else{
		file2Name = "파일없음";
	}
	
	CommentDAO daoComment = new CommentDAO();
	ArrayList<CommentVO> al = daoComment.showComment(seq_num);
	
	
%>

         <div id = "board">
            <table id="list">
               <tr>
                  <td>제목</td>
                  <td><%=vo.getArticle_subject() %></td>
               </tr>
               <tr>
                  <td>작성자</td>
                  <td><%=vo.getNick() %></td>
               </tr>
               <tr>
                  <td colspan="2">내용</td>
               </tr>
               <tr>
				<%if(file1 != null){ %>
                  <td colspan="2"><a href="fileUpload/<%=vo.getFile1()%>" download><button>다운로드1</button></a><span>  <%=file1Name %></span></td>
                  <%}else{ %>
                  <td colspan="2"><button>다운로드1</button><span>  <%=file1Name %></span></td>
                  <%} %>
 				<%if(file2 != null){ %>
                  <td colspan="2"><a href="fileUpload/<%=vo.getFile2()%>" download><button>다운로드2</button></a><span>  <%=file2Name %></span></td>
                  <%}else{ %>
                  <td colspan="2"><button>다운로드2</button><span>  <%=file2Name %></span></td>
                  <%} %>


               </tr>
               <tr>
                  <td colspan="2">
                  	<%=vo.getArticle_content() %>
                  </td>
               </tr>
               <tr>
                  <td colspan="2"><a href="boardMain.jsp"><button>뒤로가기</button></a></td>
                  <%if(currentUser.equals(writer) || currentUser.equals("admin")){ %>
                  <td colspan="2"><button id="update" class=<%=vo.getArticle_seq() %>>수정하기</button></td>
                  <td colspan="2"><button id="delete" class=<%=vo.getArticle_seq() %>>삭제하기</button></td>
                  <%} %>
               </tr>
            </table>
            
         <%if(vo2 != null){  %>
         	<input type="hidden" id="comment_id" value="<%=currentUser%>">
         	<input type="hidden" id="article_seq" value="<%=vo.getArticle_seq()%>">
         	<table>
         	<tr>
         	<td width="150">
	         	<div>
	         		작성자 : <%=currentUser%>
	         	</div>
	         </td>
	         <td width="550">
	         	<div>
	         		<textarea id="comment_content" placeholder="댓글을 작성하세요" rows= "4" cols="70"></textarea>
	         	</div>
	         </td>
	         <td width="100">
	         	<input type = "button" id="comment_submit" value="등록하기">
         	</td>
         	</tr>
         	</table>
         
         <%} %>   
         </div>
    <section>
	    <div id="data-container" visibility="hidden">
	    	<table>
				<tr>
					<th>작성자</th>
					<th>내용</th>
					<th>작성일자</th>
					<th></th>
					<th></th>
				</tr>
				<%for(CommentVO voComment : al){ %>
				<tr class="comment">
					<td id="comment_seq"><%=voComment.getComm_seq() %></td>
					<td id="commentWriter_id"><%=voComment.getU_id() %></td>
					<td id="comment_content"><%=voComment.getComm_content() %></td>
					<td id="comment_date"><%=voComment.getReg_date() %></td>
				</tr>
				<%} %>
			</table>
		</div>
		<div id="pagination"></div>
	</section>
	 

         
<script src="js/jquery-3.3.1.min.js"></script>
<script src="js/pagination.js"></script>
<script>

	let comment_nums = $('.comment > #comment_seq')
	let comment_ids = $('.comment > #commentWriter_id')
	let comment_contents = $('.comment > #comment_content')
	let comment_dates = $('.comment > #comment_date')
	
	let commentList = new Array();
	
	
	
	for(let i = 0; i < comment_ids.length; i++){
		
		let data = new Object()
		data.seq = $(comment_nums[i]).text()
		data.id = $(comment_ids[i]).text()
		data.content = $(comment_contents[i]).text()
		data.date = $(comment_dates[i]).text()
		commentList.push(data)
	
	}
	
	console.log(commentList)


$(function () {
    let container = $('#pagination');
    container.pagination({
        dataSource: commentList,
        pageSize : 10,
        showPrevious: false,
        showNext: false,
    
    
        callback: function (data, pagination) {
            var dataHtml = 	    	
            '<table><tr><th>작성자</th>'+'<th>내용</th>'+'<th>작성일자</th><th></th><th></th></tr>'
			
            $.each(data, function (index, item) {
                dataHtml += '<tr><td>'+item.id +'</td><td class = '+item.seq+'>'+item.content+'</td><td>'+item.date+'</td>';
                if($('#comment_id').val() == item.id || $('#comment_id').val() == "admin"){
                	dataHtml += '<td class="button"><input type="button" onclick = "updateComment()" class= "'+item.seq+'" value="수정"></td>'
                	+'<td class="button"><input type="button" value= "삭제" onclick = "deleteComment()" class= '+item.seq+'></td>'
                	+'<td><button id = '+item.seq+' class="confirm" style ="display : none; " onclick = "confirmUpdate()">확인</button></td></tr>'
                			
                }else{
                	dataHtml += '<td><td><td></a></td></tr>'
                }
            });

            dataHtml += '</table>';

            $("#data-container").html(dataHtml);
        }
    })
})
	
	
	function deleteComment(){


		
		let num = event.target.className
	
	
		
		$.ajax({
			
			url : "DeleteComment",
			data : { comm_seq : num },
			success : function(){
				alert("댓글삭제 완료")
				location.reload();
			},
			error : function(){
				alert("댓글삭제 실패")
				
			}
			
			
			
		})
	

		
	}
	
	function updateComment(){
		
		let num = event.target.className
		
		
		let contents = $('td.'+num).text()

		
		$('td.'+num).contents().unwrap().wrap( '<input id = "updatedContent" type="text" value="'+contents+'">');
		


		$('td.button').attr('style', "display:none;");
		
		
		$('button#'+num).attr('style', "display:;");

	}
		
	function confirmUpdate(){
		
		let num = event.target.id
		
		let updatedContent = $('input#updatedContent').val()
		
		$('input.updatedContent').contents().unwrap().wrap( '<td class = '+num+'>'+updatedContent+'</td>');
		
		$('td.button').attr('style', "display:;");
		
		$('button#'+num).attr('style', "display:none;");
		
		$.ajax({
			
			type : "post",
			url : "UpdateComment",
			data : { comm_seq : num, comm_content : updatedContent },
			success : function(){
				alert("댓글수정 완료")
				location.reload();
			},
			error : function(){
				alert("댓글수정 실패")
				
			}
				
		})
		
	}	
		


	


</script>

<script>
	
	let updateBtn = document.getElementById("update")
	
	
	if(document.getElementById('update') != null){
	updateBtn.onclick = function(){
		
		let num = updateBtn.classList.item(0)
		
		location.href = "updateBoard.jsp?num="+num
		

	}
	}
	
	
	

</script>
<script>


	
	$("#delete").on('click',function(){
	
		let seq = $('#delete').attr('class')
		
		
		let obj = {
			num : seq
		}
		console.log(obj);
		
		$.ajax({
			url : '/GCAP/DeleteBoard_Temp',
			data : obj,
			success : function(){
				window.location.href = "boardMain.jsp"
			},
			error : function(){
				
			}
			
			
		})
		
	})
	

	
		$('#comment_submit').on('click', function(){
			console.log("testtest");
			let article_num = $('#article_seq').val();
			let comm_content = $('#comment_content').val();
			let comm_id = $('#comment_id').val();
			

			if(comm_content == ""){
				alert("내용을 입력하세요.");
			}
			
			let obj = new Object();
			obj.num = article_num;
			obj.content = comm_content;
			obj.id = comm_id;
			/* {
					num : article_num,
					content : comm_content,
					id : comm_id
			} */
			
			$.ajax({
				type : "post",
				url : 'WriteComment',
				//contentType : "utf-8",
				data : {
					jsonData : JSON.stringify(obj)	
				},
				success : function(){
					alert("작성완료");
				},
				error : function(){

				}
				
				
			});
			
			
			location.reload();
			
		
			
		})
		


</script>
<script>




</script>

</body>
</html>