package Controller_Comment;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model_Comment.CommentDAO;

@WebServlet("/DeleteComment")
public class DeleteComment extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("euc-kr");

		
		int comm_seq = Integer.parseInt(request.getParameter("comm_seq"));
		System.out.println(comm_seq);
		
		CommentDAO dao = new CommentDAO();
		
		int cnt = dao.deleteComment(comm_seq);
		
		if(cnt>0) {
			System.out.println("댓글 삭제 성공");

		}else {
			System.out.println("댓글 삭제 실패");
		}
		
		
	}

}
