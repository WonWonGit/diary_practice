<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="User.*"  %>
<jsp:useBean id="member" class="User.MemberUser"/>
<jsp:setProperty property="*" name="member"/>

<% 
	request.setCharacterEncoding("UTF-8");

	String user_id= request.getParameter("id");

	MemberUserDB mud = MemberUserDB.getinstance();
	
	
	
	if(mud.login(member.getId(), member.getPassword())==1){
		session.setAttribute("userid", user_id);
		response.sendRedirect("main_diary.jsp");
		}
	else if(mud.login(member.getId(), member.getPassword())==0){
%>
		<script>
			alert("아이디를 다시한번 확인 해 주세요.");
			history.back();
		</script>
<%
	 	}
	 else {
%>
		<script>
			alert("비밀번호가 일치하지 않습니다.");
			history.back();
		</script>
<%
	 	}
	
%>