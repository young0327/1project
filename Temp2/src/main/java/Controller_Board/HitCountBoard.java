package Controller_Board;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model_Board.BoardDAO;
import Model_Board.BoardVO;

@WebServlet("/HitCountBoard")
public class HitCountBoard extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("euc-kr");
		
		int seq_num = Integer.parseInt(request.getParameter("num"));
		
		BoardDAO dao = new BoardDAO();
		
		BoardVO vo = dao.showOneArticle(seq_num);
		
		int hitCnt = vo.getCnt();
		
		hitCnt++;
		
		int cnt = dao.HitCountBoard(seq_num, hitCnt);
		
		if(cnt>0) {
			System.out.println("조회수 + 성공");
			response.sendRedirect("viewBoard.jsp?num="+seq_num);
			
		}else {
			System.out.println("조회수 + 실패");
		}
			
	}

}
