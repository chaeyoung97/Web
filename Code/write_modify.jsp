<%@ page language="java" contentType="text/html; charset=UTF-8"
	import = "com.oreilly.servlet.*, com.oreilly.servlet.multipart.*"
	import ="java.sql.*, java.io.*" import = "java.util.*"
    pageEncoding="UTF-8"%>
   
 <%
request.setCharacterEncoding("utf-8");

int no = Integer.parseInt(request.getParameter("no"));
String url = request.getParameter("curURI");
ResultSet rs =null;
try{
	Class.forName("org.mariadb.jdbc.Driver");

	String DB_URL ="jdbc:mariadb://localhost:3306/snsboard?useSSL=false";

	Connection con =  DriverManager.getConnection(DB_URL, "admin", "1234");

	String sql = "SELECT * FROM board WHERE no=?";
	
	PreparedStatement pstmt = con.prepareStatement(sql);
	
	pstmt.setInt(1, no);
	
	rs = pstmt.executeQuery();
	rs.next();
	String title = rs.getString("title");
	String content = rs.getString("content");
	int boardNum = Integer.parseInt(rs.getString("boardNum"));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 작성 페이지</title>
<script>

//게시판 selected시키기
window.onload = function(){
	obj = document.getElementById("sel");
	a = <%=boardNum%>
	obj.options[a-1].selected =true;	//게시판이 1,2 니까 option index는 -1 해줘야함
}
</script>
<style>
body{
	margin: 0 auto ;
	font-family: Arial, "Trebuchet MS", sans-serif;
	background-color: #efe5d0;
	height: 100%;
	width: 100%;
	max-width: 1200px;
}
#wrapper{
	height: 100%;
	padding-bottom : 30px; /*footer의 높이 만큼 패딩을 주어서 덮어 버리지 않게 함*/
	text-align: center;
}
footer{
	background-color: #333;
	color: #efe5d0;
	text-align:center;
	padding: 10px;
	margin: 0px 0px 0px 0px;
	font-size:90%;
	width:100%;
}

div, ul, li{
	margin:0;
	padding: 0;
}
#header ul, div{
	width: 100%;
}
#header{
	float:right;
	font-size:20px;
	height: 80px;
	font-weight: bold;
	padding-top: 30px;
	padding-bottom: 0px;

}
#header ul li{
	float: left;
	list-style-type:none;
}
#header li{
	width: 15%;
}
#header a{
	color :#ffff;
	text-decoration: none;
}
#header a:hover{
	color:yellow; 
}
#header input{
	text-align: center;
	position: center;
}
#header ul ul{	/*ul 안의 ul 인 서브메뉴 안보이겠다.*/
	background-color :#333;
	display: none;
	position: absolute;
	width: 9.9%;
}
#header ul li:hover ul{	/*서브메뉴 마우스 가져다 대면 보임.*/
	display: block;
}
#header input{
	display: inline-block;
}
#header ul ul li{
	float: none;	/*서브메뉴는 inlinblock처럼 이어서 말고 block해서 한줄로 
	출력.*/
	width: 100%;
}

====
#nav ul, div{
	width: 100%;
}
#nav{
	float:right;
	width: 100%;
	font-size:20px;
	height: 40px;
	font-weight: bold;
	padding-top: 15px;

}
#nav ul li{
	float: left;
	list-style-type:none;
}
#nav li{
	width: 50%;
}
#nav a{
	color :#333;
	text-decoration: none;
}
#nav a:hover{
	color:yellow; 
}

</style>
</head>
<body>
<div id = "wrapper">
<div id = header style = "background-color :#333;">	<!--헤더겸 네이게인션 역할도 함-->
	<ul>
		<li><a href = "main.jsp">홈</a></li>
		<li style = "width: 40%">
			<form action = "search.jsp" method = "post">
				<input name = "search"  type= "text" size = 50 placeholder = "검색어 입력" style = "width:25%">
				<input type="submit" value ="검색">
			</form>
		</li>
		<li>
			<a href= "#">게시판</a>
			<ul id = "subheader">
				<li  style="display: block"><a href = "board1.jsp">자유게시판</a></li>
				<li  style="display: block"><a href = "board2.jsp">정보게시판</a></li>
			</ul>
		</li>
		<li>
			<a href = "#">쪽지함</a>
			<ul id ="submheader">
				<li  style="display: block"><a href = "send.jsp">쪽지보내기</a></li>
				<li  style="display: block"><a href = "receive.jsp">받은 쪽지함</a></li>
			</ul>
		</li>
		<li>
			<a href = "#">회원관리</a>
			<ul class= "subheader">
				<li  style="display: block"><a href="user_info.jsp">회원정보</a></li>
				<li  style="display: block"><a href="user_write.jsp">내가쓴글</a></li>
				<li  style="display: block"><a href ="logout.jsp">로그아웃</a></li>
			</ul>
		</li>
	</ul>
</div>
<div id = nav style="background-color: oldlace" style ="float:none">
	<ul>
		<li><a href = "main.jsp">전체글</a></li>
		<li><a href = "write_page.jsp">글쓰기</a></li>
	</ul>
</div>
<input type="text" style="visibility:hidden; height:10px">
<div id = "content">
	<form action = "write_modify_do.jsp?no=<%=no %>&curURI=<%=url %>" method = "post" enctype = "multipart/form-data">
		<div>
				<span style="width:10%; font-weight:bold">게시판 선택: </span>
				<select name = "sel" id="sel" style = " height:40px; width:90%" >
					<option value="1">자유게시판</option>
					<option value="2" >정보게시판</option>
				</select>
		</div>	
		<br>

		<div>
			<input type = "text" value = "<%=title%>"name = "title" id = "title"  placeholder="제목을 입력해 주세요(최대 50자)." style = "height:30px;width: 100%" size ="105" maxlength="50" required autofocus>
		</div>
		<br>
		<div>
			<textarea name="content"id ="document" style ="resize: none; width: 100%" 
			placeholder="내용을 입력해 주세요.(최대 1024자)" cols= "95" rows = "30" maxlength="2048" required><%=content %></textarea>
		</div>
		<div>
			<input type="file" name = "file1"  accept=".jpg,.png,.gif,.jepg" style = "display :block; position : right"><br>
			<input type="file" name = "file2"  accept=".jpg,.png,.gif,.jepg" style = "display :block; position : right"><br>
			<input type="file" name = "file3"  accept=".jpg,.png,.gif,.jepg" style = "display :block; position : right"><br>
			<input type="file" name = "file4"  accept=".jpg,.png,.gif,.jepg" style = "display :block; position : right"><br>
			<input type="file" name = "file5"  accept=".jpg,.png,.gif,.jepg" style = "display :block; position : right"><br>
			현재 이미지 미리보기:<br><%
			sql = "SELECT fileName FROM file where no=?";		
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, rs.getInt("no"));
			rs = pstmt.executeQuery();
			while(rs.next())
			{%>
				<img src = './upload/<%=rs.getString("fileName")%>' width = "100px" height = "100px">
		   <%}%>
		</div>
		<div>
		<br><Br>
			<input style = "position :center; width:100px;height:30px" type="submit" value = "제출">
		</div>
</div>
</div>
<FOOTER>	
Copyright &copy; 2020 CHAEYOUNG LEE | All Rights Reserved.
</FOOTER>
</body>
</html>
<%pstmt.close();
	con.close();
	rs.close();
}catch(SQLException e)
{
	out.print(e);
	return;
}%>