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
		String writer = (String)session.getAttribute("userid");
		String para_id = request.getParameter("id");
		String d_content = request.getParameter("content");
		String d_title = request.getParameter("title");
		int d_id =  Integer.parseInt(para_id);
		int re = dld.Updatediary(d_title, d_content, d_id);
		
		if(re == 1){
%>
		<script>
			alert("성공");
			javascript:window.location='main_diary.jsp?page=1'
		</script>
<% 			
		}else{
%>
		<script>
			alert("실패");
			javascript:window.location='updatediary.jsp'
		</script>

<% 			
			
		}
		
%>

</body>
</html>