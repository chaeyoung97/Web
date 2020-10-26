<%@ page language="java" contentType="text/html; charset=UTF-8" import ="java.sql.* ,java.io.*"
    pageEncoding="UTF-8"%>
<%
//파일이랑 글이랑 다 지워야함 board file테이블 모두 지워줘야함
request.setCharacterEncoding("utf-8");

int no = Integer.parseInt(request.getParameter("no"));
String url = request.getParameter("curURI");
try{
	Class.forName("org.mariadb.jdbc.Driver");

	String DB_URL ="jdbc:mariadb://localhost:3306/snsboard?useSSL=false";

	Connection con =  DriverManager.getConnection(DB_URL, "admin", "1234");

	String sql = "DELETE FROM board WHERE no=?";
	
	PreparedStatement pstmt = con.prepareStatement(sql);
	
	pstmt.setInt(1, no);
	
	pstmt.executeQuery(); //board에서 삭제
	
	sql = "DELETE FROM file WHERE no=?";
	pstmt = con.prepareStatement(sql);
	pstmt.setInt(1, no);
	
	pstmt.executeQuery(); // file에서 삭제
	
	pstmt.close();
	con.close();

}catch(SQLException e)
{
	out.print(e);
	return;
}
response.sendRedirect(url);	//삭제를 누른 페이지로 돌아가기
%>