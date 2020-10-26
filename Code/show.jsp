<%@ page language="java" contentType="text/html; charset=UTF-8"  import ="java.sql.* ,java.io.*"
    pageEncoding="UTF-8"%>
 <%
request.setCharacterEncoding("utf-8");

int no = Integer.parseInt(request.getParameter("no"));
String url = request.getRequestURI().toString();
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
	String id = rs.getString("id");
	int boardNum = Integer.parseInt(rs.getString("boardNum"));
	int view = rs.getInt("view");
	int comment = rs.getInt("comment");
	String now = (String)session.getAttribute("id");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 작성 페이지</title>
<script>
function modify(i)
{
	window.open(i,"address","width=300,height=200");
}
</script>
<style>
th,td{
border: 1px solid #333;
}
table{
	width:100%;
	border: 1px solid #333;
	border-collapse: collapse;
	background-color:white;
}
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
				<input  name = "search"  type= "text" size = 50 placeholder = "검색어 입력" style = "width:25%">
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
		<br>
		<%String boardname="";if(boardNum==1){boardname="자유게시판";}else{boardname= "정보게시판";} %>
		<h2><%=boardname %></h2>
		<div>
		
		</div>
		<%
		sql = "SELECT fileName FROM file where no=?";		
		pstmt = con.prepareStatement(sql);
		
		pstmt.setInt(1, rs.getInt("no"));
		rs = pstmt.executeQuery();
		while(rs.next())
		{%>
			<img src = './upload/<%=rs.getString("fileName")%>' width = "200px" height = "200px">
	   <%}%>
		<div>
			<input type = "text" readonly value = "<%=title%>"name = "title" id = "title"  placeholder="제목을 입력해 주세요(최대 50자)." style = "height:30px;width: 100%" size ="105" maxlength="50" required autofocus>
		</div>
		<br>
		<div>
			<textarea name="content" readonly id ="document" style ="resize: none; width: 100%" 
			placeholder="내용을 입력해 주세요." cols= "95" rows = "30" maxlength="2048" required><%=content %></textarea>
		</div>
		<Br>
		<table border ="1" style = "border-collapse:collapse; background-color:#333">
			 <tr>
		   		<th style ="width:100%; height:50px;"  ><a style="color:white"href = "good.jsp?no=<%=no%>">추천하기</a></th>
		   </tr>
		   
		</table>
		<form action = "comment.jsp?no=<%=no%>&uri=<%=url %>&id=<%=now %>&ment=<%=comment %>" method ="post">
		<div>
			<br><input type = "text"  name = "comment"   placeholder="댓글을 입력해주세요(최대 50자)." style = "height:40px;width: 90%" size ="90" maxlength="1000" required autofocus>
			<input type = "submit" value = "글 입력" style = "height:40px;width:8%">
		</div>
		</form>
		<br>
		<%
		ResultSet rs2 = null;
		sql = "SELECT * FROM comment where no=? order by date desc";		
		pstmt = con.prepareStatement(sql);
		
		pstmt.setInt(1, no);
		rs2 = pstmt.executeQuery();
		while(rs2.next()){
			int i = rs2.getInt("idx");
		
		%>
	
		<table  border="1 solid" style="width:100%; border-collapse:collapse">
			<tr>
				<td style ="width:20%; height:25px;text-align:center;">작성자:<%=rs2.getString("id") %></td>
				<td style ="width:60%; height:25px;text-align:center;"><%=rs2.getString("date") %></td>
				<td style ="width:20%; height:25px;text-align:center;">
				<%if(now.equals(rs2.getString("id")))//작성자 같으면 수정삭제 가능
				{%>
					<a href ="#" onclick = 'modify("comment_modify.jsp?idx=<%=i%>&uri=<%=url%>&no=<%=no%>")' >수정</a>
					<a href = "comment_del.jsp?idx=<%=i%>&uri=<%=url%>&no=<%=no%>&comment=<%=comment%>">삭제</a>
					<%} %>
				</td>
			<tr>
				<th colspan ="3" style =" height:30px;text-align:center;font-wight:bold"><%=rs2.getString("ment") %></td>
			</tr>
		</table>
		<br>
		<%}%>
</div>
</div>
<FOOTER>	
Copyright &copy; 2020 CHAEYOUNG LEE | All Rights Reserved.
</FOOTER>
</body>
</html>
<%	
	rs2.close();
	rs.close();
	pstmt.close();
	con.close();

}catch(SQLException e)
{
	out.print(e);
	return;
}%>