package ClassControllor;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import ClassModel.ClassDAO;
import Model_User.UserVO;
@WebServlet("/ApplyCon")
public class ApplyCon extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	request.setCharacterEncoding("EUC-KR");
	response.setContentType("text/plain; charset=utf-8");
	HttpSession session = request.getSession();
	int C_seq  = Integer.parseInt(request.getParameter("classnum"));
	UserVO vo= (UserVO) session.getAttribute("user"); 
	String id = vo.getId();
	System.out.println(id);
	ClassDAO dao = new ClassDAO();
	int cnt = dao.ApplyClass(C_seq, id);
	}
	}

