<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>01_ajaxTest.jsp</title>
</head>
<body>
    <button>* 서버에서 응답받기 *</button>
    <div id="panel"></div>
    
<script src="js/jquery.js"></script>
<script>
    $("button").click(function(){
    	/* 1)
        $.ajax({
            url:"/frontend/test.do",  //요청명령어
            method:"get", //method=get
            dataType:"text",
            error : function(xhr, status, error){   //callback
                alert("에러!!"+error);
            },
            success : function(result, status, xhr){
                //alert(result);
                //$("#panel").append(result);
                $("#panel").empty();
                $("#panel").text(result);
                
            }//success end
        });//ajax() end
        */
        
        /*2)
        //AJAX 객체의 기본값 지정
        $.ajaxSetup({dataType:"text"});
        
        //method=get 방식 요청
        //$.get("요청명령어", callback함수)
        $.get("/frontend/test.do", function(result, status, xhr){
        	//alert(result);
        	$("#panel").append(result);
        });//get() end
        */
        
        //3)
        $.get("/frontend/test.do", responseProc);//get
    });//click end
    
    function responseProc(result){
    	$("#panel").append(result);
    }//responseProc() end
</script>
</body>
</html>


