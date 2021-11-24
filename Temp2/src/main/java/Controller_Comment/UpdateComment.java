package Controller_Comment;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model_Comment.CommentDAO;

@WebServlet("/UpdateComment")
public class UpdateComment extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/plain; charset=utf-8");
		
		int comm_seq = Integer.parseInt(request.getParameter("comm_seq"));
		String comm_content = request.getParameter("comm_content");
		
		System.out.println(comm_seq);
		System.out.println(comm_content);
		
		
		CommentDAO dao = new CommentDAO();
		
		
		
		int cnt = dao.updateComment(comm_seq, comm_content);
		
		if(cnt>0) {
			System.out.println("댓글 업데이트 완료!");
		}else {
			System.out.println("댓글 업데이트 실패!");
		}

		
		
	}

}
