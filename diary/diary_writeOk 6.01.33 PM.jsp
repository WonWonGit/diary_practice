<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>    
<%@ page import="UserDiary.*" %>
<jsp:useBean id="diary" class="UserDiary.DiaryList" scope="request"/>
<jsp:setProperty property="*" name="diary"/>

<%

	DiaryListDB dld = DiaryListDB.getinstance();
	DiaryList dl = new DiaryList();
	
	int re = dld.insertDiary(diary);
	
	if(re==1){
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
			javascript:window.location='main_diary.jsp?page=1'
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