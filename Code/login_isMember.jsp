<%@ page language="java" contentType="text/html; charset=UTF-8" import ="java.sql.*"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");

String id = request.getParameter("id");
String pwd = request.getParameter("pwd");
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
		if(!rs.getString("pwd").equals(pwd))
		{
			out.println("<script>alert('비밀번호가 일치하지 않습니다.');</script>");%>
			rs.close();
			pstmt.close();
			con.close();
			<script>history.back();</script><%
		}
		rs.close();
		pstmt.close();
		con.close();
		session.setAttribute("id", id);
		%>
		<script>location.href="main.jsp";</script><%
	}
	else
	{
		out.println("<script>alert('존재하지 않는 아이디입니다.');</script>");
		rs.close();
		pstmt.close();
		con.close();%>
	
		<script>history.back();</script><%
	}

}catch(SQLException e)
{
	out.print(e);
	return;
}

%>