<%@ page language="java" contentType="text/html; charset=utf-8" 
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>LoginTest+</title>
<style>
body {
	margin: 0;
	padding: 0;
	text-align: center;
	font-family: arial;
	font-size: 12px;
	color: white;
}

#main {
	padding: 3em 2em;
	background-color: #333;
	position: absolute;
	top: 50%;
	left: 50%;
	margin-top: -150px;
	margin-left: -150px;
	width: 340px;
	height: 370px;
	-moz-opacity: 0.7;
	-khtml-opacity: 0.7;
	opacity: 0.7;
}

form {
	margin: 2em 0;
}

h2 {
	margin: 0;
	padding: 0;
	font-size: 1.6em;
}

a:link, a:visited, #loginb {
	color: #fff;
	text-decoration: underline;
}

small a:link {
	text-decoration: none;
}

small a:link {
	text-decoration: none;
}

.InputBox {
	font-size: 10px;
	margin: 10px;
	margin-top: 20px;
	font-family: 'Open Sans', sans-serif;
	font-family: 'Bitter', serif;
	border: 1px;
	padding-left: 10%;
	padding-right: 10%;
}

.PrintMSG {
	font-size: 13px;
	margin: 2px;
	font-family: 'Open Sans', sans-serif;
	font-family: 'Bitter', serif;
	background-color: #d9edf7;
	border-color: #bce8f1;
	color: #31708f;
}

.PrintMSG2 {
	font-size: 3vh;
	margin: 2px;
	font-family: 'Open Sans', sans-serif;
	font-family: 'Bitter', serif;
	border: 1px;
}

.InputID_PWBox {
	
}

.loginButton {
	font-size: 2.5vh;
	margin: 2px;
	font-family: 'Open Sans', sans-serif;
	font-family: 'Bitter', serif;
	border: 1px;
	background-color: transparent;
}

video#bgvid {
	position: fixed;
	right: 0;
	bottom: 0;
	min-width: 100%;
	min-height: 100%;
	width: auto;
	height: auto;
	z-index: -100;
	background: url(resources/img/web_icon.jpg) no-repeat;
	background-size: cover;
}

video {
	position: fixed;
	top: 50%;
	left: 50%;
	min-width: 100%;
	min-height: 100%;
	width: auto;
	height: auto;
	z-index: -100;
	-webkit-transform: translateX(-50%) translateY(-50%);
	transform: translateX(-50%) translateY(-50%);
	background-size: cover;
	-webkit-transition: 1s opacity;
	transition: 1s opacity;
}
</style>
</head>
<body>
<h1> hello </h1>
<h1> hello </h1>
<h1> hello </h1>
<h1> hello </h1>
	<video autoplay loop id="bgvid">
		<source src="img/test.mp4" type="video/mp4">
	</video>
	
<div id="main">
		<h1 style="text-transform:uppercase;">Login</h1>
		<form name="loginservice" action="/login" method="post" onsubmit="return inputBoxCheck()">
			<div class="InputBox">
				<p class="PrintMSG">Please enter your login imformation.</p>
				<div class="PrintMSG2">ID</div>
				<div>
					<input actionfocus name="user_id" type="text">
				</div>
				<div class="PrintMSG2">PW</div>
				<div>
					<input actionfocus name="user_pw" type="text">
				</div>
			</div>
			<input class="loginButton" id="loginb" value="login" type="submit" style="width: 100%;" />
		</form>
		<div style="text-align: center;">
			<a href="/JoinMembership">회원가입</a> / <a href="/ForgetID">아이디찾기</a> / <a href="/ForgetPassword">비번찾기</a>
		</div>
		<small>© 20200527 Sunmoon OSSPTeam7</small>
		</p>
	</div>
</body>
</html>