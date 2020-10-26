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
 
int no = Integer.parseInt(request.getParameter("no"));


try {
		con = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
		String sql = "select * from board where no =? ";
		 	
		 	pstmt = con.prepareStatement(sql);
		 	
		 	pstmt.setInt(1, no);
	
		 	rs = pstmt.executeQuery();
		 	rs.next();
		 	int good = rs.getInt("good");

		 sql = "update board set good=? Where no =?";
	 	
	 	pstmt = con.prepareStatement(sql);
	 	
	 	pstmt.setInt(1, good+1);
	 	pstmt.setInt(2, no);
	 	
	 	
	 	pstmt.executeUpdate();

		rs.close();
		pstmt.close();
		con.close();
	}catch(SQLException e) {
		out.println(e);
	}

%>
<script>history.back();</script>
<%
	%> 