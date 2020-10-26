<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
   <%
   int no = Integer.parseInt(request.getParameter("no"));
   String uri = request.getParameter("uri");
   int idx = Integer.parseInt(request.getParameter("idx"));

   %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
수정할 댓글을 입력하세요:<br>
<form action ="comment_modify_do.jsp?no=<%=no %>&uri=<%=uri %>&idx=<%=idx %>" method = "post">
<input name = "comment" type= "text" maxlength="1000px" style ="height:200px;width :200px;">
<input type= "submit" value ="수정하기">
</form>
</body>
</html>