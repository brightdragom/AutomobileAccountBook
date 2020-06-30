<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="css/bootstrap.min.css">
<title>비밀번호찾기</title>
<style>
body {
	background-color: #70bfe4;
}

.container {
	margin-top: 15%;
}

.container-fluid {
	padding-right: 15px;
	padding-left: 15px;
	margin-right: auto;
	margin-left: auto;
}
</style>
</head>
<!-- 로그인 폼 -->
<div class="container">
	<div class="col-lg-4"></div>
	<div class="col-lg-4">
		<div class="jumbotron" style="padding-top: 20px;">
			<form method="post" action="ViaPw.jsp">
				<!-- 로그인 정보를 숨기면서 전송post -->
				<h3 style="text-align: center;">비밀번호 찾기</h3>
				<div class="form-group">
					<input type="text" class="form-control" placeholder="아아디" name="id"
						maxlength="20">
				</div>
				<div class="form-group">
					<input type="text" class="form-control"
						placeholder="휴대폰 번호 ex)010-3887-9849" name="phone" maxlength="20">
				</div>
				<input type="submit" class="btn btn-primary form-control"
					style="color: #fff; background-color: #70bfe4; border-color: #70bfe4;"
					value="비밀번호찾기">
				<div class="card-footer text-center">
					<div class="small">
						<a href="Register.jsp">Need an account? Sign up!</a>
					</div>
					<div class="small">
						<br> <a href="index.jsp">Have an account? Go to login</a>
					</div>
					<div
						class="form-group d-flex align-items-center justify-content-between mt-4 mb-0">
						<a class="small" href="FindId.jsp">Forgot ID?</a>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>
</html>

