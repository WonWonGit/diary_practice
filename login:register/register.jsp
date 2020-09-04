<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>document</title>
	<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
<h2>Diary</h2>
<section class="bg">
<div class="container" id="container">
<div class="form-container sign-up-container">
<!-- 회원가입 -->
<form name="reg" action="registerOk.jsp" method="post">
	<h1>Create Account</h1>
    <input type="text" name="name" placeholder="Name">
    <input type="email" name="email" placeholder="Email">
    <input type="text" name="id" placeholder="ID">
	<input type="password" name="password" placeholder="Password">
	<input type="password" name="passwordcheck" placeholder="Password Check">
	<input type="button" onclick="check()" class="button" value="회원가입">
</form>
</div>
<!-- 로그인 --> 
<div class="form-container sign-in-container">
	<form action="loginOk.jsp" action="post">
		<h1>Sign In</h1>
    <input type="text" name="id" placeholder="ID">
	<input type="password" name="password" placeholder="Password">
	<a href="#">Forgot Your Password</a>
	<input type="submit" value="Sign in"class="button">
	</form>
<!-- 로그인 끝 --> 
</div>
<div class="overlay-container">
	<div class="overlay">
		<div class="overlay-panel overlay-left">
			<h1>Welcome Back!</h1>
			<p>로그인 부탁드립니다!</p>
			<button class="ghost" id="signIn">Sign in</button>
		</div>
		<div class="overlay-panel overlay-right">
			<h1><span>Hello</span> Friend!</h1>
			<p>회원가입 후 이용해 보세요!</p>
			<button class="ghost" id="signUp">Sign up</button>
		</div>
	</div>
</div>
</div>
</section>
<!-- alert 자바스크립트 -->
<script type ="text/javascript" src="script.js"> </script>
<!--파넬 애니메이션 효과 -->
<script type ="text/javascript" src="script_02.js" defer> </script>
</body>
</html>