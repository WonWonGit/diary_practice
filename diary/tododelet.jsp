<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="UserTodo.*"  %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		int t_id=Integer.parseInt(request.getParameter("t_id"));
		TodoListDB tld = TodoListDB.getinstance();
		int re = tld.tododelete(t_id);
		if(re == 1){
	%>
			<script>
				alert("삭제 완료");
				javascript:window.location='main_diary.jsp?page=1'
			</script>
	<% 
		}else{
	%>
			<script>
				alert("삭제 실패");
				history.back();
			</script>
	<% 	
		}
	%>
</body>
</html>