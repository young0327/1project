package Controller_Comment;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import Model_User.ReviewDAO;
import Model_User.ratingVO;

@WebServlet("/loadReviewCon")
public class loadReviewCon extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		int cnum  = Integer.parseInt(request.getParameter("cnum"));
		response.setCharacterEncoding("utf-8");
		ReviewDAO dao = new ReviewDAO();
		ArrayList<ratingVO> al =dao.showreview(cnum);
		
		PrintWriter out = response.getWriter();
		
		Gson gson = new Gson();
		
		out.print(gson.toJson(al));
		// DAO -> select 해당 페이지의 review만  ArrayList로
		
		// Gson의 toJson() <--- ArrayList가 들어갈 수있음
	
		// out.print(json)
	}

}
