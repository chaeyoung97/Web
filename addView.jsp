<%@ page language="java" contentType="text/html; charset=UTF-8"  import ="java.sql.* ,java.io.*"
    pageEncoding="UTF-8"%>
    <!DOCTYPE html>
<html>
<head>
<script>
window.onload = function()
{
	self.close();}
</script>
<meta charset="UTF-8">
<title>글 작성 페이지</title>
<body>
 <%
request.setCharacterEncoding("utf-8");

int no = Integer.parseInt(request.getParameter("no"));
int view = Integer.parseInt(request.getParameter("view"));
try{
	Class.forName("org.mariadb.jdbc.Driver");

	String DB_URL ="jdbc:mariadb://localhost:3306/snsboard?useSSL=false";

	Connection con =  DriverManager.getConnection(DB_URL, "admin", "1234");

	String sql = "update board set view=? Where no =?";
	
	PreparedStatement pstmt = con.prepareStatement(sql);

 	pstmt = con.prepareStatement(sql);
 	
 	pstmt.setInt(1, view+1);
 	pstmt.setInt(2,no);
 	pstmt.executeUpdate();
 	pstmt.close();
	con.close();
	%>
	<script>history.go(-1);</script>
	<%

}catch(SQLException e)
{
	out.print(e);
	return;
}%>
</body>
</html>