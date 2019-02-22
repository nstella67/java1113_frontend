package net.ajax;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/book.do")
public class bookTest extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//mothod=get방식
		try {
			int bookIndex=Integer.parseInt(req.getParameter("book"));
			String img[]= {"spring.jpg", "android.jpg", "jquery.jpg", "jsmasterbook.jpg"};
			
			resp.setContentType("text/plain; charset=UTF-8");
			PrintWriter out=resp.getWriter();
			out.println(img[bookIndex]);
			out.flush();
			out.close();
			
		}catch(Exception e) {
			System.out.println("ajax 응답 실패 : "+e);
		}//try end
	}//doPost end
	
}//class end
