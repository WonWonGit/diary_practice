<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="UserDiary.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		DiaryListDB dld = DiaryListDB.getinstance();
		String id = request.getParameter("id");
		int d_id = Integer.parseInt(id);
		
		int re = dld.deletediary(d_id);
		if(re==1){
			
	%>
			<script>
			alert("삭제 성공");
			javascript:window.location='main_diary.jsp'
			</script>
	<% 		
		}else{
	%>
			<script>
			alert("삭제 실패");
			javascript:window.location='update.jsp'
			</script>
	<% 		
		}
	%>		
</body>
</html>