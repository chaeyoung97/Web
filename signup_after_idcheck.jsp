<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
String id = request.getParameter("id");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 페이지</title>
<style>
body, html{
	margin: 0 auto ;
	width:100%;
	height:100%;
	font-family: Arial, "Trebuchet MS", sans-serif;
	background-color: #efe5d0;
}
#wrapper{
	height:80%;
	min-height :80%;
	padding-bottom : 30px; /*footer의 높이 만큼 패딩을 주어서 덮어 버리지 않게 함*/
}
footer{
	background-color: #333;
	color: #FFFFFF;
	text-align: center;
	height: 30px;
	padding:35px 0;
	bottom:0;
	width:100%;
	left:0;
	position : relative;/*fixed로 해버리면 페이지 안에 내용이 많아 지면 footer가 내용위에?덮어져 버려서 wrapper에 웹페이지 height 100%를 다 주고 footer는 상대위치로 해주면 된다.*/
	margin: 0 0 ;
}
p{
	font-weight: bold;
	font-size: 70px;
	text-align: center;
	color: #333;
	width:100%;
	
}
div{
	text-align: center;
	margin : 20px;
	width: 100%;

}
input{
height:35px;}
</style>
<script>
//아이디 중복체크할 함수
function check(){
	idcheck = document.getElementById("id").value;
	if(idcheck==null|| idcheck.length<1)
		{
			alert("중복체크할 아이디를 입력해주세요.");
			return false;
		}
	location.href = "id_check.jsp?id="+idcheck;
}
function idChange()
{
	alert("아이디 변경이 감지되었습니다. 중복체크를 다시 해주세요.")
	idcheck = document.getElementById("id").value;
	location.href = "signup_before_idcheck.jsp?id="+idcheck;
}

</script>
</head>
<body>
<div id ="wrapper">
<p>회 원 가 입</p><br><br>

<form action = "signup_do.jsp" method="post">
<div >
<input type = "text" name = "id" id="id" placeholder="아이디를 입력해주세요." maxlength ="10px" value ="<%=id %>" size = "39px" autofocus required  onkeyup = "idChange()"> <input type="button" value="중복확인" onclick="check()">
</div>
<div>
<input type = "password" name = "pwd" placeholder="비밀번호를 입력해주세요(영문자, 숫자로 이루어진 4~10길이)." maxlength ="10px" size = "50px" required title="비밀번호를 입력해주세요(영문자,숫자로 이루어진 4~10길이)." pattern = "^[a-zA-Z0-9]{4,10}$">
</div>
<div>
<input type = "text" name = "email" placeholder="이메일을 입력해주세요." maxlength ="50px" size = "50px" required  pattern = "[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-z]{2,3}$" > 
</div>
<div>
<input type = "submit" value = "확인" style= "text-align: center; width:360px" onclick = "isChange()">
</div>
</form>
</div>
<FOOTER>	
Copyright &copy; 2020 CHAEYOUNG LEE | All Rights Reserved.
</FOOTER>
</body>
</html>