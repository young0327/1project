package ClassControllor;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import ClassModel.ClassDAO;
import ClassModel.ClassVO;

@WebServlet("/CateCon")
public class CateCon extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		request.setCharacterEncoding("EUC-KR");
		String location[] = request.getParameterValues("location");
		String time[] = request.getParameterValues("time");
		String type[] = request.getParameterValues("type");
		String cate = (String) session.getAttribute("cate");
		
		ClassDAO dao = new ClassDAO();
		ArrayList<ClassVO> al = dao.cateSearch(location, time, type, cate);
		session.setAttribute("location", location);
		session.setAttribute("time", time);
		session.setAttribute("type", type );
		

		response.sendRedirect("ClassListCate.jsp");
	}
}
