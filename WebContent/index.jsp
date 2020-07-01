<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>로그인</title>
<link href="css/styles.css" rel="stylesheet" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/js/all.min.js"
	crossorigin="anonymous"></script>
<style>
.bgss-primary {
	background-color: #70bfe4;
}

.btnss-primary {
	color: #fff;
	background-color: #70bfe4;
	border-color: #70bfe4;
}
</style>
</head>
<body class="bgss-primary">

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
	<div id="layoutAuthentication">
		<div id="layoutAuthentication_content">
			<main>
				<div class="container">
					<div class="row justify-content-center">
						<div class="col-lg-5">
							<div class="card shadow-lg border-0 rounded-lg mt-5">
								<div class="card-header">
									<h3 class="text-center font-weight-light my-4">Login</h3>
								</div>
								<div class="card-body">
									<form name="loginservice"
										action="/AutomobileAccountBook/LoginAction" method="post"
										onsubmit="return inputBoxCheck()">
										<div class="form-group">
											<label class="small mb-1" for="inputEmailAddress">Id</label><input
												class="form-control py-4" id="inputEmailAddress" type="text"
												placeholder="Enter id" name="user_id" />
										</div>
										<div class="form-group">
											<label class="small mb-1" for="inputPassword">Password</label><input
												class="form-control py-4" id="inputPassword" type="password"
												placeholder="Enter password" name="user_pw" />
										</div>


										<div
											class="form-group d-flex align-items-center justify-content-between mt-4 mb-0">
											<a class="small" href="FindId.jsp">Forgot ID?</a><a
												class="small" href="FindPw.jsp">Forgot Password?</a> <input
												class="btn btnss-primary" type="submit" value="Login">
										</div>

									</form>
								</div>
								<div class="card-footer text-center">
									<div class="small">
										<a href="Register.jsp">Need an account? Sign up!</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</main>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script src="js/scripts.js"></script>
</body>
</html>
