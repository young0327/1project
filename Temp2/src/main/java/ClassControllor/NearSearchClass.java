package ClassControllor;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import ClassModel.ClassDAO;
import ClassModel.ClassVO;



@WebServlet("/NearSearchClass")
public class NearSearchClass extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		response.setHeader("Content-Type", "application/xml");
		response.setContentType("text/html;charset=UTF-8");
		
		ClassDAO dao = new ClassDAO();
		ArrayList<ClassVO> al = dao.nearClassSearch();
		
		String str = "{}";
		
		try {
			JSONObject jsonObject = (JSONObject) new JSONParser().parse(str);
			
			for(ClassVO vo : al) {
				jsonObject.put(vo.getC_seq(),vo.getC_location());
			}



			
			PrintWriter out = response.getWriter();
			out.print(jsonObject);
			
			
		} catch (ParseException e) {
			e.printStackTrace();
		}


		
		
		
	}

}
