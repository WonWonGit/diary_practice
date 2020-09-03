<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="UserDiary.*" %> 
<%@ page import="java.sql.*" %>  
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<%	
		DiaryListDB dld = DiaryListDB.getinstance();
		String para_id = request.getParameter("id");
		int d_id =  Integer.parseInt(para_id);
		
		ResultSet rs = dld.showcontent(d_id);
		
		while(rs.next()){
			
	%>
	<form method="post" action="updatediary.jsp">
		<p><input type="text" name="title" readonly value="<%= rs.getString("title") %>"></p>
		<p><input type="text" name="date" readonly value="<%= rs.getString("date") %>"></p>
		<p><textarea name="content" rows="10" cols="50"><%= rs.getString("dia_con") %>
		</textarea></p>
		<p><input type="hidden" name="id" value="<%= rs.getInt("id") %>"></p>
		<input type="submit" value="수정하기" name="update">
		<input type="button" value="삭제하기" name="delete" 
						onclick="location.href='delete.jsp?id=<%=rs.getInt("id") %>'" >
	</form>
	<% 
		}
	%>
			
</body>
</html>