<%@ page language="java" contentType="text/html; charset=UTF-8" import ="java.sql.* ,java.io.*"
    pageEncoding="UTF-8"%>
<%
//파일이랑 글이랑 다 지워야함 board file테이블 모두 지워줘야함
request.setCharacterEncoding("utf-8");

int no = Integer.parseInt(request.getParameter("no"));
String uri = request.getParameter("uri");
String id = request.getParameter("id");
String ment = request.getParameter("comment");
int ment_num = Integer.parseInt(request.getParameter("ment"));
try{
	Class.forName("org.mariadb.jdbc.Driver");

	String DB_URL ="jdbc:mariadb://localhost:3306/snsboard?useSSL=false";

	Connection con =  DriverManager.getConnection(DB_URL, "admin", "1234");
	
	String sql = "insert into comment (no, id, ment) values(?,?,?)";
	
	PreparedStatement pstmt = con.prepareStatement(sql);
	
	pstmt.setInt(1, no);
	pstmt.setString(2, id);
	pstmt.setString(3, ment);
	pstmt.executeUpdate();
	
	sql = "update board set comment =? where no=?";
   pstmt = con.prepareStatement(sql);
	
	pstmt.setInt(1, ment_num+1);
	pstmt.setInt(2, no);
	pstmt.executeUpdate();
	
	pstmt.close();
	con.close();

}catch(SQLException e)
{
	out.print(e);
	return;
}
response.sendRedirect(uri+"?no="+no);	//삭제를 누른 페이지로 돌아가기
%>