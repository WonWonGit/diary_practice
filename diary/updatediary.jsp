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
<link rel="stylesheet" type="text/css" href="style02.css">
<link rel="stylesheet" type="text/css" href="s_u_diary.css">
<script src="https://kit.fontawesome.com/9db93bd103.js" crossorigin="anonymous"></script>
</head>
<body>
<% 
		DiaryListDB dld = DiaryListDB.getinstance();
		String writer = (String)session.getAttribute("userid");
		String para_id = request.getParameter("id");
		int d_id =  Integer.parseInt(para_id);
		ResultSet rs = dld.showcontent(d_id);
		
		while(rs.next()){
		
%>
	<div id="nav">
        <ul class="main">
          <li>
            <a href="#" style="color: #fff" ><%= writer %> 님 안녕하세요 !</a>
            <ul class="sub">
              <li><a href="logout.jsp">로그아웃</a></li>
              <li><a href="info.jsp">회원정보 변경</a></li>
            </ul>
          </li>
      </ul>
		<form method="post" action="updatediaryOk.jsp">
		<p><input id="diary_title" type="text" name="title" value="<%= rs.getString("title") %>"></p>
		<p><input id="date" type="text" name="date" readonly value="<%= rs.getString("date") %>"></p>
		<p><textarea id="diary_write" name="content" rows="10" cols="50"><%= rs.getString("dia_con") %>
		</textarea></p>
		<p><input type="hidden" name="id" value="<%= rs.getInt("id") %>"></p>
		<p>
		<input type="submit" name="update" value="수정하기">
		<input type="reset" value="지우기" name="delete">
		</p>
	</form>
	</div>
<%
		}
%>	
</body>
</html>