<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="UserDiary.*" %> 
<%@ page import="java.sql.*" %>  
<% request.setCharacterEncoding("UTF-8"); %>

	<%	
		DiaryListDB dld = DiaryListDB.getinstance();
		String para_id = request.getParameter("id");
		int d_id =  Integer.parseInt(para_id);
		String writer = (String)session.getAttribute("userid");
		ResultSet rs = dld.showcontent(d_id);
		
		while(rs.next()){
			
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://kit.fontawesome.com/9db93bd103.js" crossorigin="anonymous"></script>
<link rel="stylesheet" type="text/css" href="style02.css">
<link rel="stylesheet" type="text/css" href="s_u_diary.css">
</head>
<body>	

	<div id="nav" style="clear:both">
        <ul class="main">
          <li>
            <a href="#" style="color: #fff" ><%= writer %> 님 안녕하세요 !</a>
            <ul class="sub">
              <li><a href="logout.jsp">로그아웃</a></li>
              <li><a href="info.jsp">회원정보 변경</a></li>
            </ul>
          </li>
      </ul>
    <div id="table" style="clear:both">
	<table>
		<tr align="center">
			<td>날짜 </td>
			<td><%= rs.getString("date") %></td>
		</tr>
		<tr align="center">
			<td>제목 </td>
			<td><%= rs.getString("title") %></td>
		</tr>
		<tr>
			<td colspan="2" align="left"><pre><%= rs.getString("dia_con") %></pre></td>
		</tr>
	</table>	
	<table id="button">
		<tr align="center">
			<td>
			<a class="back"
			href="main_diary.jsp?writer=<%= writer %>">
			<i class="fas fa-arrow-circle-left" id="back"></i></a>
			</td>
			<td>
			<a class="update"
			href="updatediary.jsp?id=<%= d_id %>" >
			<i class="fas fa-tools"></i></a>
			</td>
			<td>
			<a class="delete" 
			href="delete.jsp?id=<%= d_id %>" >
			<i class="fas fa-trash-alt"></i></a>
			</td>
		</tr>
	</table>
	</div>
	 </div>
	<%  
	}
	%>	 
</body>
</html>
