package ClassControllor;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ClassModel.ClassDAO;
import ClassModel.ClassVO;


@WebServlet("/DetailCon")
public class DetailCon extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html; charset=utf-8");
	int cnum = Integer.parseInt(request.getParameter("cnum"));
	
	ClassDAO dao = new ClassDAO();
	ClassVO vo =dao.show(cnum);
	ServletContext application = request.getServletContext();
	
	application.setAttribute("cnum", cnum);
	
	response.sendRedirect("DetailPage.jsp");
	
	
	}

}
