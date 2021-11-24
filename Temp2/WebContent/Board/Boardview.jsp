
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
%>


<!-- 답글 버튼, 로그인한 사용자만 답글쓰기 열어줌 -->
<div class="container my-3">
	<div class="row">
		<div class="col"></div>
		<div class="col-md-auto">
			<%-- 답글작성 요청 시 가질 값을 미리 셋팅해서 요청(그룹은 같게, order와 Indent는 1증가) --%>
			<form action="boardWriter" method="post">
				<input type="hidden" name="bdGroup">
				<input type="hidden" name="bdOrder">
				<input type="hidden" name="bdIndent">
				<button type="submit" class="btn btn-secondary">답글쓰기</button>
			</form>

		</div>
	</div>
</div>


<!-- 게시물 내용 출력 -->
<div class="container my-1">
	<div class="row">
		<table class="table">
			<thead>
				<tr class="table-active">
					<th scope="col" style="width: 60%"><br></th>
					<th scope="col" style="width: 40%" class="text-right">조회 :
						<br></th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td><pre></pre></td>
				</tr>
			</tbody>
		</table>
	</div>
</div>


<%-- 게시물이 없을 경우 메세지 출력 (없거나 삭제된 게시물) --%>

<div class="container">
	<div class="row">
		<div class="col"></div>
		<div class="col-md-auto"></div>
		<div class="col"></div>
	</div>
</div>



