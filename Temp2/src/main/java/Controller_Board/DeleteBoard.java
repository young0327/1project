package Controller_Board;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model_Board.BoardDAO;
import Model_Comment.CommentDAO;

@WebServlet("/DeleteBoard")
public class DeleteBoard extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("euc-kr");
		
		int num = Integer.parseInt(request.getParameter("num"));
		
		CommentDAO daoComment = new CommentDAO(); 
		
		int cnt2 = daoComment.deleteAllComment(num);
		
		if(cnt2>0) {
			System.out.println("해당글 댓글 전부 삭제 성공");
			
		}else{
			System.out.println("해당글 댓글 전부 삭제 실패");
		}		
		
		BoardDAO dao = new BoardDAO();
		
		int cnt = dao.deleteArticle(num);
		
		if(cnt>0) {
			System.out.println("글 삭제 성공");
			
		}else{
			System.out.println("글 삭제 실패");
		}
		
		
	}

}
