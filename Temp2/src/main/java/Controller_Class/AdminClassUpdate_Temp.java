package Controller_Class;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model_Class.ClassDAO;

@WebServlet("/AdminClassUpdate_Temp")
public class AdminClassUpdate_Temp extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		request.setCharacterEncoding("euc-kr");
		
		String[] arr = request.getParameterValues("num[]");
		
		ClassDAO dao = new ClassDAO();
		
		int cnt = 0;
		
		for(int i = 0; i < arr.length; i++) {
			cnt += dao.deleteClass(Integer.parseInt(arr[i]));
		}
			
		
		if(cnt>0) {
			System.out.println(cnt+"개의 강의 삭제 성공!");
		}else {
			System.out.println("삭제 실패!");
		}
	
	
	}

}
