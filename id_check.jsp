<%@ page language="java" contentType="text/html; charset=UTF-8" import ="java.sql.*"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");

String id = request.getParameter("id");
ResultSet rs = null;
try{
	Class.forName("org.mariadb.jdbc.Driver");

	String DB_URL ="jdbc:mariadb://localhost:3306/snsboard?useSSL=false";

	Connection con =  DriverManager.getConnection(DB_URL, "admin", "1234");

	String sql = "SELECT * FROM member WHERE id=?";
	
	PreparedStatement pstmt = con.prepareStatement(sql);
	
	pstmt.setString(1, id);
	
	rs = pstmt.executeQuery();
	
	if(rs.next())
	{
		out.println("<script>alert('이미 사용중인 아이디 입니다. 다른 아이디를 입력해주세요.');</script>");
		rs.close();
		pstmt.close();
		con.close();%>
	
		<script>location.href="signup_before_idcheck.jsp"</script><%
	}
	else
	{
		out.println("<script>alert('사용가능한 아이디입니다.');</script>");
		rs.close();
		pstmt.close();
		con.close();%>
	
		<script>location.href="signup_after_idcheck.jsp?id="+'<%=id%>'</script><%
	}

}catch(SQLException e)
{
	out.print(e);
	return;
}
%>