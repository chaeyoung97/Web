<%@ page language="java" contentType="text/html; charset=UTF-8"
	import = "com.oreilly.servlet.*, com.oreilly.servlet.multipart.*"
	import ="java.sql.*, java.io.*" import = "java.util.*"
    pageEncoding="UTF-8"%>
   
<%
request.setCharacterEncoding("utf-8");
String num ;

try{
	
	int maxsize =5*1024*1024;//최대 전송 파일 크기 5MB
	ServletContext context = getServletContext();
	String realFolder = context.getRealPath("upload");
	
	//이름 중복시 숫자증가시킬 policy적용
	MultipartRequest multi = new MultipartRequest(request, realFolder, maxsize, "utf-8", new DefaultFileRenamePolicy()) ;

	
	
	String title = multi.getParameter("title");
	String content = multi.getParameter("content");
	num =multi.getParameter("sel");
	String id = (String)session.getAttribute("id"); //사용자 아이디는 세션을 이용해서 얻어옴 세션은 obj라서 string으로 형변환 시킴
	Class.forName("org.mariadb.jdbc.Driver");

	String DB_URL ="jdbc:mariadb://localhost:3306/snsboard?useSSL=false";

	Connection con =  DriverManager.getConnection(DB_URL, "admin", "1234");
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = null;
	
	//일단은board테이블에 글을 저장하고  board테이블의 no으로 file 테이블에 파일들을 저장함
	sql = "SELECT NOW()";//현재시간 가져오기
	pstmt = con.prepareStatement(sql);
	rs = pstmt.executeQuery();
	rs.next();
	String date = rs.getString(1);
	//일단 여기까지 현재 시간 날짜 알아와서 board에 저장
	sql = "INSERT INTO board(id, date, title, content, boardNum) VALUES(?,?,?,?,?)";
	
	pstmt = con.prepareStatement(sql);
	
	pstmt.setString(1, id);
	pstmt.setString(2, date);
	pstmt.setString(3, title);
	pstmt.setString(4, content);
	pstmt.setString(5, num);
	
	pstmt.executeUpdate();
	//저장했으면 이제 no알아오기
	sql = "SELECT no from board where id=? and date=? and title=? and content=? and boardNum=?";
	
	pstmt = con.prepareStatement(sql);
	
	pstmt.setString(1, id);
	pstmt.setString(2, date);
	pstmt.setString(3, title);
	pstmt.setString(4, content);
	pstmt.setString(5, num);
	
	rs = pstmt.executeQuery();
	
	rs.next();
	int no = rs.getInt("no");
	rs.close();
	///여기까지가 일단 board 테이블에 글 저장 한 것 
	//여기서 부터 이제 파일읽어와서 file 테이블에 저장
	Enumeration files = multi.getFileNames();	//여러 파일을 이름으로 받음 enumerationt사용
	while(files.hasMoreElements())	// 파일이 존재하는 한 계속 반복
	{
		String name = (String)files.nextElement();	//입력된 input 태그의 name을 알아와서
		String fileName = multi.getFilesystemName(name);//그 name값으로 파일명을 알아냄
		
		if(fileName == null) 
		{
			continue; // 근데 모든 파일을 입력하지 않았을 수도 있으니까 입력하지 않은 input은 db에 저장하지 않음!
		}
		//파일이 입력된 거라면 file테이블에 upload를 완료하기
		sql = "INSERT INTO file(no, fileName) VALUES(? ,?)";
		pstmt = con.prepareStatement(sql);
		pstmt.setInt(1,no);
		pstmt.setString(2, fileName);
		pstmt.executeUpdate();
	}
	pstmt.close();
	con.close();
}catch(SQLException e)
{
	out.print(e);
	return;
}
response.sendRedirect("board"+num+".jsp");%>
