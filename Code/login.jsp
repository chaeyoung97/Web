<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지</title>
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
</head>
<body>
<div id = "wrapper">
<p>로 그 인</p><br><br>

<form action = "login_isMember.jsp" method = "post">
<div>
<input type = "text" name = "id" placeholder="아이디를 입력해주세요"  maxlength ="10px" size = "50px" autofocus required>
</div>
<div>
<input type = "password"  name = "pwd" placeholder="비밀번호를 입력해주세요" maxlength ="10px" size = "50px" required>
</div>
<div>
<input type = "submit" value = "로그인" style= "text-align: center; width:360px" >
</div>
</form>
<form action = "signup_before_idcheck.jsp" method = "post" >
<div>
<input type = "submit" value = "회원가입" style= "text-align: center;width:360px">
</div>
</form>
</div>
<footer>	
Copyright &copy; 2020 CHAEYOUNG LEE | All Rights Reserved.
</footer>
</body>
</html>