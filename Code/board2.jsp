<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
 <%
 request.setCharacterEncoding("utf-8");
 String curURI = request.getRequestURI().toString(); //프로젝트경로부터 파일명?알아오기
 Connection con=null;
 int v=0; 	//view저장
 int n=0;	//no저장
  Class.forName("org.mariadb.jdbc.Driver");
 String DB_URL = "jdbc:mariadb://localhost:3306/snsboard?useSSL=false";
 String DB_USER = "admin";
 String DB_PASSWORD= "1234";


 PreparedStatement pstmt = null;
 ResultSet rs2 = null;
 ResultSet rs=null;
 String has100 ="";
 String idName ;
 int morechk =0; //더보기 div에서 id이름을 계속 바꿔줘야해서 사용하는 변수
 try {
		con = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
		String sql = "SELECT * FROM board WHERE boardNum=? ORDER BY date desc"; //시간순으로 내림차순 정렬해서 출력
		
		pstmt = con.prepareStatement(sql);
		pstmt.setInt(1,2);
		rs = pstmt.executeQuery();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 작성 페이지</title>
<script>

function bigImg(a,b, src)
{
	i = document.getElementById(b);
	i.getElementsByTagName("img")[0].src = src;
	if(i.style.display != "none")
	{
			i.style.display ="none";	//큰이미지를 누르면 다시 사라짐
	}
	else
	{
		i.style.display = "inline-block";
	}
}
function bigclose(a)	//큰이미지 사라지기
{
	document.getElementById(a).style.display = "none";
}
function more(id)	//100자 넘어가면 더보기
{
	v = document.getElementById(id); 
	if(v.style.display=="none" || v.style.display =="" )
	{
		v.style.display="block";

		//location.href = "addView.jsp?view="+a+"&no="+n+"&pos="+id+"&cur="+c; html처럼 북마크기능으로 원래 위치 돌아와 볼려 했지만 jsp에서는 안됨...
	}
	else
	{
		v.style.display = "none";
	}
}
function realDelete(no,curURI)	//글 삭제 여부를 확인하는 함수
{
	result = confirm("정말로 삭제하시겠습니까?");
	if(result)
	{
		location.href = "write_delete.jsp?no="+no+"&curURI="+curURI;
	}
	else
	{return false;}
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
	bottom:0px;
	background-color: #333;
	color: #efe5d0;
	text-align:center;
	padding: 20px 0;
	margin: 0px 0px 0px 0px;
	font-size:90%;
	width:100%;
	height:30px;
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
table{
	width:100%;
	border: 1px solid #333;
	border-collapse: collapse;
	background-color:white;
}
th,td{
border: 1px solid #333;
}

.fix{
width:100%;
max-width: 1200px;
position:fixed;
z-index:9;}

.morediv{
	display:none;
}

</style>
</head>
<body>
<div id = "wrapper">
<div class = "fix">
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
</div>
<div style = "position:relative; top:160px;"><!-- 위에 fixed해서 이렇게 해야 겹치지 않음 -->
<input type="text" style="visibility:hidden; height:10px">
<!-- 여기엔 이제 모든 게시글이 시간순으로 출력됨 -->
<%
		while(rs.next()) {
		morechk++;
		sql = "SELECT fileName FROM file where no=?";		
		pstmt = con.prepareStatement(sql);
		int view = rs.getInt("view");
		pstmt.setInt(1, rs.getInt("no"));
		rs2 = pstmt.executeQuery();
		int deleteNo = rs.getInt("no"); // 삭제시 사용할 게시글 no
	%>
		<div style = "position:relative;">
		<table>
			<tr><td colspan="3" style="height:25px;background-color:#3a3a35"></td><tr>
			<tr>
				<td style ="width:20%; height:25px;text-align:center;font-wight:bold">추천수: <%=rs.getInt("good") %>&nbsp;&nbsp;댓글수: <%=rs.getInt("comment") %></td>
				<td style ="width:70%; height:25px;font-wight:bold;text-align:center"><%=rs.getString("date") %></td>
				 <td style ="width:10%; height:25px;text-align:center;font-wight:bold">조회수: <%=rs.getInt("view") %></td>
			</tr>
			<tr>
				 <td style ="width:20%; height:25px;text-align:center;font-wight:bold">작성자: <%=rs.getString("id")%></td>
				 <td style ="width:70%; height:25px;text-align:left;font-wight:bold;font-size:20px">&nbsp;제목: <a  href = "addView2.jsp?no=<%=deleteNo%>&view=<%=view%>"><%=rs.getString("title") %></a></td>
				 <td style ="width:20%; height:25px;text-align:center;font-wight:bold">
					<%
					String userId = (String)session.getAttribute("id");
					String contentId = rs.getString("id");
					
					if(userId.equals(contentId))	//만약 현재 로그인한 사용자와 이글 쓴 사람이 일치하면 수정 삭제 버튼을 보여줌
					{%>
						<a href ="write_modify.jsp?no=<%=deleteNo%>&curURI=<%=curURI%>">수정</a>
						<a href = "javascript:realDelete('<%=deleteNo%>','<%=curURI%>')">삭제</a>
					<%}
					%>
				</td>
				
			</tr> 
			<tr>
				<td style ="width:70%; height:50px;font-wight:bold;text-align:left" colspan="3">
				<br>
				<div style ="text-align:center">
				<%
					int imgNum =0;
					String imgName="";
					while(rs2.next())
					{
						imgNum++;
						if(imgNum==3)
						{break;}//썸내일은 두개만 보여줌
						imgName = "img" + Integer.toString(morechk);
					%>
						
						<img id = '<%= imgName%>' src = './upload/<%=rs2.getString("fileName")%>' width = "200px" height = "200px" onclick="bigImg('<%= imgName%>','<%= imgName+1%>','./upload/<%=rs2.getString("fileName")%>')" >
						<div  id = '<%= imgName+1%>' style = " z-index :5; display:none; position: absolute; top:20px; left:5%; right:20%; maxwidth:1000px;text-align:center;width:100%"><img  src ="" width = "500px" height = "500px" onclick="bigclose('<%= imgName+1%>')"></div>
				   <%}%>
			</div>
				   <br><br>
			   <%
				
				has100 = rs.getString("content"); //글내용 변수에 저장한 다음
				v = rs.getInt("view");
				n = rs.getInt("no");
				if(has100.length() >= 100)
				{	//100자가 넘어가면 문자열을 잘라서 100글자만 출력하고 나머지는 더보기로 보여줌 //더보기 눌러도 조회수  1증가함
					String str = has100.substring(0,100);
					has100 = has100.substring(100, has100.length());//나머지 100글자이상인 부분 저장
					idName = "more" + Integer.toString(morechk);	//id이름 계속해서 바꿔줘야해서 이렇게 해서 div태그 계속 구분해줘야함
				%> 
				
					<%=str %><div  id = "<%=idName %>" class = "morediv"><%=has100%></div>	<a class = "moreDisplay" onclick = "more('<%=idName %>')"  target ="inner" href ="addView.jsp?no=<%=n%>&view=<%=v%>">...더보기</a>
						
						
			   <%}
				else{%>
						  <%=has100%>
				<%}%>
				
				
					
			 
			   </td>
		   </tr>
		   <tr>
		   <%int good = rs.getInt("good"); %>
		   		<th style ="width:100%; height:50px;" colspan = "3" ><a  href = "addView2.jsp?no=<%=deleteNo%>&view=<%=view%>">댓글달기</a></th>
		   </tr>
		   
		 </table>
		
		</div>
			<br>
	<%
		}
	
	%>
	<iframe name = "inner" style= "display:none" src = "addView.jsp"></iframe>
	<%
		
		rs.close();
		pstmt.close();
		con.close();
	}catch(SQLException e) {
		out.println(e);
	}
	%> <br><br>
		<FOOTER>	
		Copyright &copy; 2020 CHAEYOUNG LEE | All Rights Reserved.
		</FOOTER>

</div>
</div>


</body>
</html>