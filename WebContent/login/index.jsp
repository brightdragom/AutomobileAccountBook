<%--  <%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link rel="stylesheet" href="../css/styles.css">
<title>로그인</title>
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
	

	<%
		if (("1").equals(request.getParameter("error"))) {
	%>

	<SCRIPT LANGUAGE='JavaScript'>

		alert('잘못 입력하셨습니다!');
		
		location.href="<%=request.getRequestURI()%>";
	</SCRIPT>

	<%
		}
	%>
	<video autoplay loop id="bgvid">
		<source src="img/test.mp4" type="video/mp4">
	</video>

	<div id="main">
		<h1 style="text-transform: uppercase;">Login</h1>
		<form name="loginservice" action="/AutomobileAccountBook/LoginAction" method="post"
			onsubmit="return inputBoxCheck()">
			<div class="InputBox">
				<p class="PrintMSG">Please enter your login imformation.</p>
				<div class="PrintMSG2">ID</div>
				<div>
					<input actionfocus name="user_id" type="text">
				</div>
				<div class="PrintMSG2">PW</div>
				<div>
					<input actionfocus name="user_pw" type="password">
				</div>
			</div>
			<input class="loginButton" id="loginb" value="login" type="submit"
				style="width: 100%;" />
		</form>
		<div style="text-align: center;">
			<a href="Register.jsp">회원가입</a> / 
			<a href="FindPw.jsp">아이디찾기</a> /
			<a href="FindPw.jsp">비번찾기</a>
		</div>
		<small>© 20200527 Sunmoon OSSPTeam7</small>
		</p>
	</div>
</body>
</html>  --%>

 <%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
 <!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>로그인</title>
        <link href="../css/styles.css" rel="stylesheet" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/js/all.min.js" crossorigin="anonymous"></script>
    </head>
    <body class="bg-primary">
    
	<%
		if (("1").equals(request.getParameter("error"))) {
	%>

	<SCRIPT LANGUAGE='JavaScript'>

		alert('잘못 입력하셨습니다!');
		
		location.href="<%=request.getRequestURI()%>";
	</SCRIPT>

	<%
		}
	%>
	<video autoplay loop id="bgvid">
		<source src="img/test.mp4" type="video/mp4">
	</video>
    
    
        <div id="layoutAuthentication">
            <div id="layoutAuthentication_content">
                <main>
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-lg-5">
                                <div class="card shadow-lg border-0 rounded-lg mt-5">
                                    <div class="card-header"><h3 class="text-center font-weight-light my-4">Login</h3></div>
                                    <div class="card-body">
                                        		<form name="loginservice" action="/AutomobileAccountBook/LoginAction" method="post"
			onsubmit="return inputBoxCheck()">
                                            <div class="form-group"><label class="small mb-1" for="inputEmailAddress">Id</label><input class="form-control py-4" id="inputEmailAddress" type="text" placeholder="Enter id" name="user_id"/></div>
                                            <div class="form-group"><label class="small mb-1" for="inputPassword">Password</label><input class="form-control py-4" id="inputPassword" type="password" placeholder="Enter password" name="user_pw"/></div>
                                           
                                           
                                            <div class="form-group d-flex align-items-center justify-content-between mt-4 mb-0"><a class="small" href="FindId.jsp">Forgot ID?</a><a class="small" href="FindPw.jsp">Forgot Password?</a>
                                            <input class="btn btn-primary" type="submit" value="Login"></div>
                                        
                                        </form>
                                    </div>
                                    <div class="card-footer text-center">
                                        <div class="small"><a href="Register.jsp">Need an account? Sign up!</a></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </main>
            </div>
        </div>
        <script src="https://code.jquery.com/jquery-3.4.1.min.js" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/scripts.js"></script>
    </body>
</html> 
