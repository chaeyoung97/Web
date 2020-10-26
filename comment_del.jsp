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
int ment = Integer.parseInt(request.getParameter("comment"));
try {
		con = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
		String sql = "delete from comment where idx =? ";
		 	
		 	pstmt = con.prepareStatement(sql);
		 	
		 	pstmt.setInt(1, idx);
	
		 	pstmt.executeUpdate();
		 	
		 	sql = "update board set comment =? where no =?";
		 	pstmt.setInt(1, ment);
		 	pstmt.setInt(2, no);
		 	pstmt.executeUpdate();
		pstmt.close();
		con.close();
	}catch(SQLException e) {
		out.println(e);
	}

response.sendRedirect(uri+"?no="+no);%>

	%> 