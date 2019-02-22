package net.ajax;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/search.do")
public class SearchTest extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			resp.setCharacterEncoding("UTF-8");
			String keyWord=req.getParameter("keyWord").trim();
			String message="";//응답메세지
		//-----------------------------------------------------------------------------------------------------------------------------
			if(keyWord.length()>0) {	//검색어가 존재하는지?
				//예) 검색어 : 웹
				//		"웹프로그래밍" "웹마스터" 반환
				ArrayList<String> list=search(keyWord);
				
				//응답메세지 → 2 | 찾은문자열, 찾은문자열,~
				int size=list.size();
				int idx=0;
				if(size>0) {
					message+=size+"|";				//1)
					for(idx=0; idx<size; idx++) {
						String word=list.get(idx);
						message+=word;
						if(idx<size-1) {
							// 1) message+="<br>";
							message+=",";
						}//if end
					}//for end
				}//if end
			}//if end
		//-----------------------------------------------------------------------------------------------------------------------------	
			resp.setContentType("text/plain; charset=UTF-8");
			PrintWriter out=resp.getWriter();
			out.println(message);
			out.flush();
			out.close();
		}catch(Exception e) {
			System.out.println("ajax응답실패 : "+e);
		}//try end
	}//doPost end
	
	//검색하고자 하는 문자열 목록
	public ArrayList<String> search(String keyWord){
		String[] keyWords= {"Ajax", "Ajax 실전 프로그래밍", "자바", "웹프로그래밍", "웹마스터", "자바 프로그래밍", "JSP 프로그래밍", "졸려", "정신없다", "자전거", "잘타네"};
		
		//keyWord를 keyWords배열에서 첫글자부터 비교하고 같으면 ArrayList에 저장해서 리턴한다
		ArrayList<String> list=new ArrayList<>();
		for(String word : keyWords) {
			word=word.toUpperCase();
			if(word.startsWith(keyWord.toUpperCase())) {
				list.add(word);
			}//if end
		}//for end
		
		return list;	//"웹프로그래밍", "웹마스터"
	}//search() end
	
}//class end
