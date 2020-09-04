<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="User.MemberUserDB"  %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="member" class="User.MemberUser"/>
<jsp:setProperty property="*" name="member"/>

<%
	MemberUserDB mud = new MemberUserDB();
	if(mud.idCheck(member.getId())==1){
%>
		<script type="text/javascript">
			alert("중복되는 아이디가 존재합니다.");
			history.back();
		</script>
<%
	}
	else{
		int re=mud.insertMember(member);
		if(re==1){
%>
			<script type="text/javascript">
				alert("회원가입을 축하드립니다. 로그인 후 이용부탁드립니다");
				history.back();
			</script>
<%
		}
		else{
%>
			<script type="text/javascript">
				alert("회원가입 실패");
				history.back();	
			</script>
<%
		}
	}
%>