<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="User.*"  %>
<%@ page import="java.util.*"%>
<%@ page import="java.util.Date" %>
<%@page import="java.text.SimpleDateFormat" %>
<%@ page import="UserDiary.*"  %>
<%@ page import="UserTodo.*"  %>
<%@ page import = "java.sql.*" %>    
<%
		request.setCharacterEncoding("UTF-8");
		String writer = (String)session.getAttribute("userid");
		Timestamp today = new Timestamp(System.currentTimeMillis());       
		SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd");
		String toDay = date.format(today);
		String todo_con = request.getParameter("todo"); 
				
		TodoListDB tld = TodoListDB.getinstance();
		TodoList todolist = new TodoList();
		todolist.setDate(today);
		todolist.setTodo_con(todo_con);
		todolist.setWriter(writer);
				
		int re = tld.insertTodo(todolist);
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