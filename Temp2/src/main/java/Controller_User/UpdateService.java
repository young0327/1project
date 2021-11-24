package Controller_User;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Model_User.UserDAO;
import Model_User.UserVO;

@WebServlet("/UpdateService")
public class UpdateService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("euc-kr");
		response.setContentType("text/html;charset=euc-kr");
		
		String name = request.getParameter("name");
		String nick = request.getParameter("nick");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		int postcd = Integer.parseInt(request.getParameter("postcd"));
		String addr = request.getParameter("addr");
		String addrdtl1 = request.getParameter("addrdtl1");
		String addrdtl2 = request.getParameter("addrdtl2");
		
		HttpSession session = request.getSession();
		
		UserVO vo = (UserVO)session.getAttribute("user");
		UserDAO dao = new UserDAO();
		
		String id = vo.getId();
		
		int cnt = dao.update(id, name, nick, phone, email, postcd, addr, addrdtl1, addrdtl2);
		
		RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
		
		if(cnt>0) {
			request.setAttribute("popup", "정보수정 성공");
			rd.forward(request, response);
			
		}else {			
			request.setAttribute("popup", "정보수정 실패");
			rd.forward(request, response);
	
		}
		
	}

}
