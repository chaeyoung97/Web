<%@ page language="java" contentType="text/html; charset=UTF-8"
	import = "com.oreilly.servlet.*, com.oreilly.servlet.multipart.*"
	import ="java.sql.*, java.io.*" import = "java.util.*"
    pageEncoding="UTF-8"%>
   
 <%
 request.setCharacterEncoding("utf-8");
 String num ;
 int no = Integer.parseInt(request.getParameter("no"));

 try{
 	
 	int maxsize =5*1024*1024;//최대 전송 파일 크기 5MB
 	ServletContext context = getServletContext();
 	String realFolder = context.getRealPath("upload");
 	
 	//이름 중복시 숫자증가시킬 policy적용
 	MultipartRequest multi = new MultipartRequest(request, realFolder, maxsize, "utf-8", new DefaultFileRenamePolicy()) ;

 	
 	
 	String title = multi.getParameter("title");
 	String content = multi.getParameter("content");
 	num =multi.getParameter("sel");
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
 	
 	sql = "update board set date=?, title=?, content=?, boardNum=? Where no =?";
 	
 	pstmt = con.prepareStatement(sql);
 	
 	pstmt.setString(1, date);
 	pstmt.setString(2, title);
 	pstmt.setString(3, content);
 	pstmt.setString(4, num);
 	pstmt.setInt(5, no);
 	
 	pstmt.executeUpdate();
 //여기까지 게시글 내용 변경한 것임 아래는 파일 변경 여부에따라 변경함
 //일단 파일변경여부 모르니까 모든 파일에 대한 고유 idx를 받아둠
//파일이 변경되었다면 새로 입력된 파일 일단 다 저장하고 예전파일 삭제 변경안되었으면 그대로 둠
 	sql = "select idx from file where no=?";
 	pstmt = con.prepareStatement(sql);
 	pstmt.setInt(1,no);
 	
 	rs = pstmt.executeQuery();
 	int filesNo[] = new int[5];
 	int chk =0;
 	if(rs!=null)
 	{
	 	while(rs.next())
	 	{
	 		filesNo[chk]= rs.getInt("idx");	//여기다가 파일 번호?저장해둠
	 		chk++;
	 	}
 	}
 	Enumeration files = multi.getFileNames();	//여러 파일을 이름으로 받음 enumerationt사용
 	
 	boolean isChange =false; //파일 변경했는지 여부를 나타내는 변수
 	while(files.hasMoreElements())	// 파일이 존재하는 한 계속 반복
 	{
 		String name = (String)files.nextElement();	//입력된 input 태그의 name을 알아와서
 		String fileName = multi.getFilesystemName(name);//그 name값으로 파일명을 알아냄
 		
 		if(fileName == null) 
 		{
 			isChange = true;
 			continue; // 근데 모든 파일을 입력하지 않았을 수도 있으니까 입력하지 않은 input은 db에 저장하지 않음!
 		}
 		//파일이 입력된 거라면 file테이블에 upload를 완료하기
 		sql = "INSERT INTO file(no, fileName) VALUES(? ,?)";
 		pstmt = con.prepareStatement(sql);
 		pstmt.setInt(1,no);
 		pstmt.setString(2, fileName);
 		pstmt.executeUpdate();
 	}
 	//여기까지  파일이 변경되었다면 file테이블에 저장하는 것임 이제는 파일 변경여부에 따라서 옛날 파일을 삭제함
 	if(isChange)
 	{
 		for(int i=0; i <chk;i++) //옛날 파일 삭제해줌
 		{
 			no = filesNo[i];
	 		sql = "DELETE FROM file WHERE idx=?";
	 		pstmt = con.prepareStatement(sql);
	 		pstmt.setInt(1,no);
	 		pstmt.executeUpdate();
 		}
 	}
 	rs.close();
 	pstmt.close();
 	con.close();
 }catch(SQLException e)
 {
 	out.print(e);
 	return;
 }
 response.sendRedirect("board"+num+".jsp");%>

 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>