package Controller_User;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import Model_User.UserDAO;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

@WebServlet("/AdminUpdate")
public class AdminUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("euc-kr");
		response.setContentType("text/html;charset=euc-kr");

		String status = request.getParameter("data");
		JSONParser parser = new JSONParser();

		UserDAO dao = new UserDAO();
		JSONArray arr = null;

		try {
			arr = (JSONArray) parser.parse(status);
			
			for (int i = 0; i < arr.size(); i++) {
				JSONObject obj = (JSONObject) arr.get(i);
				String id = (String) obj.get("id");
				String get_status = (String) obj.get("status");
				dao.statusUpdate(id, get_status);
			}
			
			
		} catch (ParseException e) {
			e.printStackTrace();
		}



	}
}
