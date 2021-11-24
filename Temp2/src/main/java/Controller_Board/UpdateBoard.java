package Controller_Board;

import java.io.IOException;
import java.net.URLDecoder;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import Model_Board.BoardDAO;

@WebServlet("/UpdateBoard")
public class UpdateBoard extends HttpServlet {
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
		int num = Integer.parseInt(multi.getParameter("num"));
		// 이미지 태그에 경로를 작성할 때는 16진수로 작성해줘야한다.(나중에 HTML에서 사용할 때 대비)
		// 따라서 인코딩을 진행해야함! 인코딩(문자 -> 코드)
		// URLEncoder.encode(인코딩할 값, 인코딩 방식)
		String file1 = URLEncoder.encode(multi.getFilesystemName("file1"), "euc-kr");
		String file2 = URLEncoder.encode(multi.getFilesystemName("file2"), "euc-kr");
		String content = multi.getParameter("content");
		
		String file1Name = URLDecoder.decode(file1, "euc-kr");
		String file2Name = URLDecoder.decode(file2, "euc-kr");
		
		System.out.println("title : " + title);
		System.out.println("seq : " + num);
		System.out.println("file1 : " + file1Name);
		System.out.println("file2 : " + file2Name);
		System.out.println("content : " + content);
		
		BoardDAO dao = new BoardDAO();
		
		int cnt = dao.updateArticle(title, content, file1, file2, num);

		if(cnt > 0) {
			System.out.println("글 업데이트 성공!");
			response.sendRedirect("boardMain.jsp");
		}else {
			System.out.println("글 업데이트 실패!");
		}
		
		 }catch(Exception e){
	            e.printStackTrace();
	        }
	
	}

}
