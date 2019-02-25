package net.ajax;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/idcheck.do")
public class IdCheck extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//method=post 방식
		try {
			String uid=req.getParameter("uid").trim();
			String message="";
			
			if(uid.length()<5 || uid.length()>=11) {
				message="<span style='color:red; font-weight:bold'>아이디는 5~10글자 이내 입력해 주세요</span>";
			}else {
				MemberDAO dao=new MemberDAO();
				int cnt=dao.duplecateID(uid);	//아이디 중복확인
				if(cnt==0) {
					message="<span style='color:blue; font-weight:bold'>사용가능한 아이디입니다</span>";
				}else {
					message="<span style='color:green; font-weight:bold'>중복된 아이디입니다</span>";
				}//if end
			}//if end
			resp.setContentType("text/plain; charset=UTF-8");
			PrintWriter out=resp.getWriter();
			out.println(message);
			out.flush();
			out.close();
		}catch(Exception e) {
			System.out.println("ajax응답실패 : "+e);
		}
	}
}//class end
