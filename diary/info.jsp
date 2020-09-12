<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="User.*" %>    
<%
	request.setCharacterEncoding("UTF-8");
	String writer = (String)session.getAttribute("userid");
	MemberUserDB member = MemberUserDB.getinstance();
	MemberUser mu = member.getmember(writer);
	
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type ="text/javascript" src="script_03.js" defer> </script>
<link rel="stylesheet" type="text/css" href="style02.css">
<link rel="stylesheet" type="text/css" href="info.css">
</head>
<body>
<!-- 네비바 -->
		<div id="nav">
        <ul class="main">
          <li>
            <a href="#" style="color: #fff"><%= writer %> 님 안녕하세요 !</a>
            <ul class="sub">
              <li><a href="logout.jsp">로그아웃</a></li>
              <li><a href="info.jsp">회원정보 변경</a></li>
            </ul>
          </li>
        </ul>
        <form method="post" action="infoOk.jsp" name="ifw">
        	<table style="margin:auto;, text-align:center;">
        		<tr height="20px">
        			<td width="150px" >
        				이름
        			</td>
        			<td><%= mu.getName() %></td>
        		</tr>
        		<tr height="20px">
        			<td width="150px">
        				아이디
        			</td>
        			<td>
        				<%= mu.getId() %>
        			</td>
        		</tr>
        		<tr height="20px">	
        			<td width="150px">
        				비밀번호
        			</td>
        			<td>
        				<input type="password" name="password" onchange="isSame()" id="pw" maxlength="12">
        			</td>
        		</tr>
        		<tr height="20px">	
        			<td width="150px">
        				비밀번호 확인
        			</td>
        			<td>
        				<input type="password" name="password2" onchange="isSame()" id="pwc">&nbsp;&nbsp;<span id="same"></span></td>
        		</tr>
        		<tr height="20px">
        			<td width="150px">
        				이메일
        			</td>
        			<td>
        				<input type="text" name="email" value="<%= mu.getEmail() %>">
        			</td>
        		</tr>
        		<tr height="20px" >
        			<td colspan="2" align="center"><input type="submit" value="변경하기">
        			<input type="button" onclick="location.href='main_diary.jsp'" value="되돌아가기"></td>
        		</tr>
        	</table>
        </form>
        
        </div>
</body>
</html>