<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>05_idCheck.jsp</title>
</head>
<body>
<p>[회원가입]</p>
<form name="memfrm" id="memfrm" onsubmit="return send()">
<table>
<tr>
  <th>아이디</th>
  <td>
      <input type="text" name="uid" id="uid">
      <button type="button" id="checkId">중복확인</button>
  </td>
  <td>
      <span id="panel_id"></span> <!-- ID 중복 관련 메세지 -->
  </td>
</tr>  
<tr>
  <th>비밀번호</th>
  <td><input type="password" name="upw" id="upw"></td>
  <td>&nbsp;</td>
</tr>  
<tr>
  <td colspan="3"><input type="submit" value="가입"></td>
</tr>  
</table>    
</form>
    
<script src="js/jquery.js"></script>
<script src="js/jquery.cookie.js"></script>
<script>
	$.removeCookie("checkID"); 	//쿠키변수 삭제
		
	$("#checkId").click(function(){
		var params="uid="+$("#uid").val();
		//$.post(요청명령어, 전달값, 콜백함수, 응답받는 형식)
		//$.post("/frontend/idcheck2.do", params, checkID, "text");//post() end
		$.post("/frontend/idcheck2.do", params, checkID, "json");//post() end
	});	//click() end
		
	function checkID(result){	//callback함수
		//1) Text로 받을때
		//alert(result);
	
		//2) JSON으로 받을때
		//alert(result.count);
			
		//숫자형변환
		var count=eval(result.count);
		if(count==0){
			$("#panel_id").css("color", "blue");
			$("#panel_id").text("사용 가능한 아이디");
			//$.cookie("쿠키변수명", 값)
			$.cookie("checkID", "PASS");	//쿠키변수 생성
		}else{
			$("#panel_id").css("color", "red");
			$("#panel_id").text("중복된 아이디");
			$("#uid").focus();	//커서 생성
		}//if end
	}//checkID() end
		
	function send(){
		// 아이디 중복확인을 하지 않으면
		// id=panel_id에 "아이디 중복확인 해주세요"
		// 만일 중복확인을 했다면 회원가입폼을 서버로 전송
		var checkID=$.cookie("checkID");
		if(checkID=="PASS"){
			return true;
		}else{
			$("#panel_id").css("color", "greeng");
			$("#panel_id").text("아이디 중복확인 해주세요");
			$("#uid").focus();
		}//if end
	}//send() end
	
</script>
</body>
</html>



