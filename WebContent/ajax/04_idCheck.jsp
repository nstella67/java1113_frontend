<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>04_idCheck.jsp</title>
</head>
<body>
<p>[회원가입]</p>
<form name="memfrm" id="memfrm">
<table>
<tr>
  <th>아이디</th>
  <td><input type="text" name="uid" id="uid"></td>
  <td><div id="demo" style="display:none"></div></td>
</tr>  
</table>    
</form>
    
<script src="js/jquery.js"></script>
<script>
	$("#uid").keyup(function(){
	//alert("test");
	$.post("/frontend/idcheck.do",		//요청명령어 
			 "uid="+$("#uid").val(),		//전달값
			 responseProc 	//callback함수
			 );//post() end
	}); //keyup() end

	function responseProc(result){
	  //alert(result);
		$("#demo").empty();
		$("#demo").html(result);
		$("#demo").show();
	}
  
</script>
</body>
</html>