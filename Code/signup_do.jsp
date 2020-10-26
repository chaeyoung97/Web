<%@ page language="java" contentType="text/html; charset=UTF-8" import ="java.sql.*"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");

String id = request.getParameter("id");
String pwd = request.getParameter("pwd");
String email = request.getParameter("email");

try{
	Class.forName("org.mariadb.jdbc.Driver");

	 
	String DB_URL ="jdbc:mariadb://localhost:3306/snsboard?useSSL=false";

	Connection con =  DriverManager.getConnection(DB_URL, "admin", "1234");

	String sql = "INSERT INTO member (id, pwd, email) VALUES(?,?,?)";
	
	PreparedStatement stmt = con.prepareStatement(sql);	
	
	stmt.setString(1,id);
	stmt.setString(2,pwd);
	stmt.setString(3,email);
	
	stmt.executeUpdate();
	
	stmt.close();
	con.close();
}
catch(SQLException e)
{
	out.print(e);
	return;
}
out.println("<script>alert('회원가입이 완료되었습니다. 다시 로그인 해주세요.');</script>");
out.println("<script>location.href = 'login.jsp';</script>");
%>