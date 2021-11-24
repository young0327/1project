package Controller_Comment;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.json.simple.JSONValue;

import com.google.gson.JsonObject;

import Model_Comment.CommentDAO;
import Model_User.UserDAO;
import Model_User.UserVO;

@WebServlet("/WriteComment")
public class WriteComment extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/plain; charset=utf-8");
		
		String data = request.getParameter("jsonData");
		System.out.println("test"+data);
		//System.out.println(data.num);
		Object obj = JSONValue.parse(data);
		JSONObject json = (JSONObject)obj;
		
		System.out.println(json.get("content"));
		
		int article_num = Integer.parseInt((String) json.get("num"));
		
		String comm_content = (String)json.get("content");
		String comm_id = (String)json.get("id");
		
		System.out.println(article_num);
		System.out.println(comm_content);
		System.out.println(comm_id);
				
		
		CommentDAO dao = new CommentDAO();
		
		int cnt = dao.writeComment(article_num, comm_content, comm_id);
		
		UserDAO dao2 = new UserDAO();
		
		UserVO vo2 = dao2.selectOne(comm_id);
		
		int point = vo2.getPoint();
		point += 10;
		
		int cnt2 = dao2.pointUpdate(point, comm_id);
		
		if(cnt>0) {
			System.out.println("댓글작성 성공!");
		}else {
			System.out.println("댓글작성 실패!");
		}
		
		if(cnt2>0) {
			System.out.println("댓글포인트 부여 성공!");
		}else {
			System.out.println("댓글포인트 부여 실패!");
		}
	
	
	}

}
