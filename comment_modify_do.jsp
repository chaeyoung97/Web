<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
 <%
 request.setCharacterEncoding("utf-8");

 Connection con=null;
 
  Class.forName("org.mariadb.jdbc.Driver");
 String DB_URL = "jdbc:mariadb://localhost:3306/snsboard?useSSL=false";
 String DB_USER = "admin";
 String DB_PASSWORD= "1234";


 PreparedStatement pstmt = null;
 ResultSet rs2 = null;
 ResultSet rs=null;
 
int idx = Integer.parseInt(request.getParameter("idx"));
String uri = request.getParameter("uri");
int no = Integer.parseInt(request.getParameter("no"));
String ment = request.getParameter("comment");
try {
		con = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
		String sql = "update comment set ment=?, date = now() where idx =? ";
		 	
		 	pstmt = con.prepareStatement(sql);
		 	

			pstmt.setString(1,ment);
			pstmt.setInt(2, idx);
		 	pstmt.executeUpdate();
		 	
			pstmt.close();
			con.close();
	}catch(SQLException e) {
		out.println(e);
	}

%>
<script>window.onload = function(){self.close();}</script>