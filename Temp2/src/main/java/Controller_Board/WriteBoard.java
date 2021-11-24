package Controller_Board;

import java.io.IOException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import Model_Board.BoardDAO;
import Model_User.UserDAO;
import Model_User.UserVO;

@WebServlet("/WriteBoard")
public class WriteBoard extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		try{
		// post방식 인코딩
		request.setCharacterEncoding("euc-kr");
		
		//1. request 객체
		//2. savePath(저장경로)
		// getServletContext : 서블릿 실행 환경에 대한 정보
		// getRealPath : 실제 절대 경로
		String savePath = request.getServletContext().getRealPath("fileUpload");
		
		
		//3. 파일의 크기 제한
		//1 mb = 1024 kb
		//1 kb = 1024 byte
		int maxSize = 10*1024*1024; // 10MB
		
		//4. 인코딩 방식
		String encoding = "euc-kr";
		
		//5. 파일이름중복제거 new DefaultFileRenamePolicy()
		//: 파일명이 겹칠 때 뒤에 숫자를 붙여서 중복제거해주는 역할
		
		
		MultipartRequest multi = new MultipartRequest(
				request, savePath, maxSize, encoding, new DefaultFileRenamePolicy());
		
		
		//DB에 저장하기 위해서 보낸 데이터 가지고 오기
		String title = multi.getParameter("title");
		String writer = multi.getParameter("id");
		// 이미지 태그에 경로를 작성할 때는 16진수로 작성해줘야한다.(나중에 HTML에서 사용할 때 대비)
		// 따라서 인코딩을 진행해야함! 인코딩(문자 -> 코드)
		// URLEncoder.encode(인코딩할 값, 인코딩 방식)
		String file1 = null;
		String file2 = null;
		if(multi.getFilesystemName("file1") !=null) {
			file1 = URLEncoder.encode(multi.getFilesystemName("file1"), "euc-kr");
		}
		if(multi.getFilesystemName("file2") !=null) {
			file2 = URLEncoder.encode(multi.getFilesystemName("file2"), "euc-kr");
		}
		String content = multi.getParameter("content");
		

		
		
		BoardDAO dao = new BoardDAO();
		
		int cnt = dao.writeArticle(title, content, file1, file2, writer);
		
		UserDAO dao2 = new UserDAO();
		
		UserVO vo2 = dao2.selectOne(writer);
		
		int point = vo2.getPoint();
		point += 100;
		
		int cnt2 = dao2.pointUpdate(point, writer);
		
		
		
		if(cnt2 > 0) {
			System.out.println("포인트 100점 부여 완료");
		}else {
			System.out.println("포인트 100점 부여 실패");
		}
		

		if(cnt > 0) {
			System.out.println("파일 업로드 성공!");
			response.sendRedirect("boardMain.jsp");
		}else {
			System.out.println("파일 업로드 실패!");
		}
		
		
		 }catch(Exception e){
	            e.printStackTrace();
	        }
		
		
	}

}
