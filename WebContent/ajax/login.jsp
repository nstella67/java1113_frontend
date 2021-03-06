<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="ko" >
<head>
   <meta charset="utf-8" />
   <title>CSS3 Modal</title>
   <link href="css/layout.css" rel="stylesheet" type="text/css" />
	<style>
	.panel {
	    background-color: #444;
	    height: 34px;
	    padding: 10px;
	}
	.panel a#login_pop, .panel a#join_pop {
	    border: 2px solid #aaa;
	    color: #fff;
	    display: block;
	    float: left;
	    margin-left: 10px;
	    padding: 5px 10px;
	    text-decoration: none;
	    text-shadow: 1px 1px #000;
	
	    -webkit-border-radius: 10px;
	    -moz-border-radius: 10px;
	    -ms-border-radius: 10px;
	    -o-border-radius: 10px;
	    border-radius: 10px;
		font-family:'dotum';
	}
	a#login_pop:hover, a#join_pop:hover {
	    border-color: #eee;
	}
	.overlay {
	    background-color: rgba(0, 0, 0, 0.6);
	    bottom: 0;
	    cursor: default;
	    left: 0;
	    opacity: 0;
	    position: fixed;
	    right: 0;
	    top: 0;
	    visibility: hidden;
	    z-index: 1;
	
	    -webkit-transition: opacity .5s;
	    -moz-transition: opacity .5s;
	    -ms-transition: opacity .5s;
	    -o-transition: opacity .5s;
	    transition: opacity .5s;
	}
	.overlay:target {
	    visibility: visible;
	    opacity: 1;
	}
	.popup {
	    background-color: #fff;
	    border: 3px solid #fff;
	    display: inline-block;
	    left: 50%;
	    opacity: 0;
	    padding: 15px;
	    position: fixed;
	    text-align: justify;
	    top: 40%;
	    visibility: hidden;
	    z-index: 10;
	
	    -webkit-transform: translate(-50%, -50%);
	    -moz-transform: translate(-50%, -50%);
	    -ms-transform: translate(-50%, -50%);
	    -o-transform: translate(-50%, -50%);
	    transform: translate(-50%, -50%);
	
	    -webkit-border-radius: 10px;
	    -moz-border-radius: 10px;
	    -ms-border-radius: 10px;
	    -o-border-radius: 10px;
	    border-radius: 10px;
	
	    -webkit-box-shadow: 0 1px 1px 2px rgba(0, 0, 0, 0.4) inset;
	    -moz-box-shadow: 0 1px 1px 2px rgba(0, 0, 0, 0.4) inset;
	    -ms-box-shadow: 0 1px 1px 2px rgba(0, 0, 0, 0.4) inset;
	    -o-box-shadow: 0 1px 1px 2px rgba(0, 0, 0, 0.4) inset;
	    box-shadow: 0 1px 1px 2px rgba(0, 0, 0, 0.4) inset;
	
	    -webkit-transition: opacity .5s, top .5s;
	    -moz-transition: opacity .5s, top .5s;
	    -ms-transition: opacity .5s, top .5s;
	    -o-transition: opacity .5s, top .5s;
	    transition: opacity .5s, top .5s;
	}
	.overlay:target+.popup {
	    top: 50%;
	    opacity: 1;
	    visibility: visible;
	}
	.close {
	    background-color: rgba(0, 0, 0, 0.8);
	    height: 30px;
	    line-height: 30px;
	    position: absolute;
	    right: 0;
	    text-align: center;
	    text-decoration: none;
	    top: -15px;
	    width: 30px;
	
	    -webkit-border-radius: 15px;
	    -moz-border-radius: 15px;
	    -ms-border-radius: 15px;
	    -o-border-radius: 15px;
	    border-radius: 15px;
	}
	.close:before {
	    color: rgba(255, 255, 255, 0.9);
	    content: "X";
	    font-size: 24px;
	    text-shadow: 0 -1px rgba(0, 0, 0, 0.9);
	}
	.close:hover {
	    background-color: rgba(64, 128, 128, 0.8);
	}
	.popup p, .popup div {
	    margin-bottom: 10px;
	}
	.popup label {
	    display: inline-block;
	    text-align: left;
	    width: 120px;
	}
	.popup input[type="text"], .popup input[type="password"] {
	    border: 1px solid;
	    border-color: #999 #ccc #ccc;
	    margin: 0;
	    padding: 2px;
	
	    -webkit-border-radius: 2px;
	    -moz-border-radius: 2px;
	    -ms-border-radius: 2px;
	    -o-border-radius: 2px;
	    border-radius: 2px;
	}
	.popup input[type="text"]:hover, .popup input[type="password"]:hover {
	    border-color: #555 #888 #888;
	}
	</style>
</head>
<body>
    <!-- panel with buttons -->
    <div class="panel">
        <a href="#login_form" id="login_pop">로그인</a>
    </div>
    <span id="panel_id"></span>

    <!-- popup form #1 -->
    <a href="#x" class="overlay" id="login_form"></a>
    <div class="popup">
		<h2>로/그/인</h2>
		<form id="loginfrm">
        <div>
            <label for="id">아이디</label>
            <input type="text" id="id" name="id" value="" />
        </div>
        <div>
            <label for="password">비밀번호</label>
            <input type="password" id="password" name="password" value="" />
        </div>
        <input type="button" id="loginBtn" value="Log In" />
		</form>
        <a class="close" href="#close"></a>
    </div>

<script src="js/jquery.js"></script>
<script>
	$.ajaxSetup({dataType:"text"});
	$("#loginBtn").click(function(){
		//alert("test");
		//?변수=값&변수=값~~
		//var params="id="+$("#id").val()+"&password="+$("#password").val();
		var params=$("#loginfrm").serialize();
		//alert(params);
		$.post("/frontend/login.do", params, responseProc);
	});	//click end

	function responseProc(result){
		$("#panel_id").text(result);	//회원등급 출력
		$(".popup").hide();	//모달창 숨기기
		$(".overlay").hide();
	}//responseProc() end	
	
</script>

</body>
</html>