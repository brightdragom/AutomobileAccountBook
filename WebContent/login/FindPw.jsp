<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="css/bootstrap.min.css">
<script type="text/javascript">
</script>
<title>아이디찾기</title>
<style>
.container {
	padding-right: 15px;
	padding-left: 15px;
	margin-right: auto;
	margin-left: auto;
}
</style>
</head>


<nav class="navbar navbar-default">

	<div class="navbar-header">

		<button type="button" class="navbar-toggle collapsed"
			data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
			aria-expaned="false">

			<span class="icon-bar"></span> <span class="icon-bar"></span> <span
				class="icon-bar"></span>

		</button>

		<a class="navbar-brand" href="index.jsp">로그인</a>

	</div>

	<div class="collapse navbar-collapse"
		id="#bs-example-navbar-collapse-1">

		<ul class="nav navbar-nav">

			<li><a href="FindId.jsp">아이디찾기</a></li>

			<li><a href="FindPw.jsp">비밀번호찾기</a></li>

		</ul>
	</div>
</nav>




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
					value="아이디찾기">
			</form>
		</div>

	</div>
</div>


</html>

