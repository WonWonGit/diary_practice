<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="User.*"  %>
<%@ page import="myUtil.HanConv" %>
<%@ page import="java.util.ArrayList"%>
<%@ page import="UserDiary.*"  %>
<%@ page import = "java.sql.*" %>
<%
	request.setCharacterEncoding("UTF-8");
	String writer = (String)session.getAttribute("userid");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="style02.css">
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
<!-- 탭 슬라이드 -->
	<div class="hero">
		<div class="btn-box">
			<button id="btn1" onclick="openMENU1()">menu1</button>
			<button id="btn2" onclick="openMENU2()" >menu2</button>
			<button id="btn3" onclick="openMENU3()">menu3</button>
		</div>
<div id = "content1" class="content">
	<% 
			DiaryListDB ddb = DiaryListDB.getinstance();
			DiaryList dl = new DiaryList();
			ResultSet rs = ddb.selectRow(writer);
			
	//페이징 처리하기
			String tempPage = request.getParameter("page");
			int cPage;
			int totalPages;
			int pageLength = 5;
			int totalRows = ddb.getPage(writer);
			
			if(tempPage==null||tempPage.length()==0){
				cPage=1;
			}try{
				cPage=Integer.parseInt(tempPage);
			}catch(NumberFormatException e){
				cPage=1;
			}
			
			int currentBlock = cPage%pageLength==0?cPage/pageLength:(cPage/pageLength)+1;
			int startPage = (currentBlock-1)*pageLength+1;
			int endPage=startPage+pageLength-1;
			
			totalPages = totalRows%5==0?totalRows/5:(totalRows/5)+1;
			if(totalPages==0){
				totalPages=1;
			}if(endPage>totalPages){
				endPage=totalPages;
			}
			int start = (cPage -1)*5;
			//페이징 처리위한 변수 설정
			
			ArrayList<DiaryList> diarylist = ddb.getAll(writer, start);
		%>	
				<table>
				<tr id="write"><td colspan="3" align="right">
				<a href='diary_write.jsp'>글쓰기</a></td></tr>

				<tr><td width="10%" id="table_top">No</td>

				<td width="70%" id="table_top">Title</td>

				<td id="table_top">Date</td></tr>		
	<% 
				
			for(int i=0;i<diarylist.size();i++){
				if(rs.next()){
					dl.setRn(1, i);
					//page 1(1-5까지 출력)
					if(cPage>1){ //페이지 1이상일 경우 6부터 일씩 증가하도록 해줌
						dl.setRn((cPage-1)*5+1, i);
					}
	%>
					<tr id="table_bottom">
					<td ><%= dl.getRn() %></td>
					<!-- 개인용 다이어리이므로 글머리처리 따로 해줌  -->
					<td align="left">
					<a href="showcontent.jsp?id=<%=rs.getInt("id")%>&writer=<%=rs.getString("writer")%>&page=<%=cPage%>">
					<%= diarylist.get(i).getTitle() %></a></td>
					<td > <%= diarylist.get(i).getDate() %> </td>
					</tr>
	<% 
					}
			}
	%>	
					<tr height="100px">
						<td colspan="3">
						<ul class="pagination justyfy-content-center">
					<%
						if(startPage==1){
					%>
						<li class="page-item disabled"><a class="page-link" href="#"
							tabindex="-1" aria-disabled="true">Previous</a></li>	
					<% 		
						}else{
					%>
						<li class="page-item"><a class="page-link" href="main_diary.jsp?page=<%=startPage-1 %>" 
							tabindex="-1" aria-disabled="true">Previous</a></li>
					<% 		
						}
					%>
					<%
						for(int i=startPage;i<=endPage;i++){
					%>
						<li class="page-item">
						<a class="page-link" href="main_diary.jsp?page=<%=i %>">
						<%= i %></a></li>
					<% 		
						}
					%>
					<%
						if(totalPages==endPage){
					%>
						<li class="page-item disabled">
						<a class="page-link" href="#">Next</a></li>
					<% 		
						}else{
					%>
						<li class="page-item">
						<a class="page-link" href="main_diary.jsp?page=<%= endPage+1 %>">Next</a></li>
					<% 		
						}
					%>
				</ul>
					</td>
					</tr>
			</table>
		</div>
			<!--다이어리 테이블 출력하기 끝 -->
			<div id="content2" class="content">
			content02
			</div>
			<div id="content3" class="content">
			content03
			</div>
		</div>
	</div>
<script type ="text/javascript" src="script_03.js" defer> </script>
</body>
</html>