<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="User.*" %>    
<%
	request.setCharacterEncoding("UTF-8");
	String writer = (String)session.getAttribute("userid");
	MemberUserDB member = MemberUserDB.getinstance();
	String password = request.getParameter("password");
	String email = request.getParameter("email");
	
	int re = member.updatemember(writer, password, email);
	
	if(re == 1){
%>
	<script>
		alert("수정 완료");
		location.href="main_diary.jsp";
	</script>
<%
	}else{
		%>
	<script>
		alert("수정 실패");
		history.back();
	</script>
	<%		
	}
	
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