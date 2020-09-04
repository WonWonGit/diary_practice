<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String writer = (String)session.getAttribute("userid");
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 네비바 스타일 적용 -->
<link rel="stylesheet" type="text/css" href="style02.css">
<!-- 글쓰기 폼 스타일 적용 -->
<link rel="stylesheet" type="text/css" href="write.css">
<title>Insert title here</title>
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
    <div id="body">   
	<form method="post" action = "diary_writeOk.jsp" >
		<p>&nbsp&nbsp제목</p>
		<p><input type="text" name="title" id="diary_title" size=45></p>
		<p>&nbsp&nbsp&nbsp날짜</p>
		<p><input type="text" name="year" size=4 id="year"> 년  
		   <select id="month" name="month" >
            <option value="1" selected="selected">01</option>
            <option value="2">02</option>
            <option value="3" >03</option>
            <option value="4">04</option>
            <option value="5">05</option>
            <option value="6">06</option>
            <option value="7">07</option>
            <option value="8">08</option>
            <option value="9">09</option>
            <option value="10">10</option>
            <option value="11">11</option>
            <option value="12">12</option>
            </select>
            월&nbsp&nbsp&nbsp<select id="day" name="day" >
            <option value="1" selected="selected">01</option>
            <option value="2">02</option>
            <option value="3" >03</option>
            <option value="4">04</option>
            <option value="5">05</option>
            <option value="6">06</option>
            <option value="7">07</option>
            <option value="8">08</option>
            <option value="9">09</option>
            <option value="10">10</option>
            <option value="11">11</option>
            <option value="12">12</option>
            <option value="13">13</option>
            <option value="14">14</option>
            <option value="15">15</option>
            <option value="16">16</option>
            <option value="17">17</option>
            <option value="18">18</option>
            <option value="19">19</option>
            <option value="20">20</option>
            <option value="21">21</option>
            <option value="22">22</option>
            <option value="23">23</option>
            <option value="24">24</option>
            <option value="25">25</option>
            <option value="26">26</option>
            <option value="27">27</option>
            <option value="28">28</option>
            <option value="29">29</option>
            <option value="30">30</option>
            <option value="31">31</option>
            </select>일</p>
            <p>&nbsp&nbsp&nbsp내용</p>
		<p><textarea name="content" id="diary_write" rows="20" cols="50"
					 text-align:left>
		</textarea></p>
		<p><input name="writer" type="hidden" value="<%= writer %>" >
		<p>
			<input type="button" value="뒤로가기" id="button"
				onclick="javascript:window.location='main_diary.jsp'">
			<input type="submit" id="button" value="저장">
		    <input type="reset" id="button" value="지우기">
		   
		</p>
	</form>
	</div>
	<div id="footer"></div> 
</body>
</html>