package net.ajax;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

@WebServlet("/login.do")
public class Login extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String id=req.getParameter("id").trim();
			String password=req.getParameter("password").trim();
			MemberDAO dao=new MemberDAO();
			String mlevel=dao.memRank(id, password);
			
			/*1) Text---------------------------------------------------------
			resp.setContentType("text/plain; charset=UTF-8");
			PrintWriter out=resp.getWriter();
			out.println(cnt);
			out.flush();
			out.close();
			*/
			
			//2) JSON-------------------------------------------------------
			JSONObject obj=new JSONObject();
			obj.put("회원등급", mlevel);	//key, value
			resp.setContentType("text/plain; charset=UTF-8");
			PrintWriter out=resp.getWriter();
			out.println(obj.toString());
			out.flush();
			out.close();
		}catch(Exception e) {
			System.out.println("ajax 응답실패 : "+e);
		}//try end
	}//doPost() end
	
}//class end
