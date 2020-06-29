<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="DAO.*"%>



<!DOCTYPE html>

<html>

<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="css/bootstrap.min.css">

<title>아이디 찾기</title>
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

<%
	request.setCharacterEncoding("UTF-8");

	String name = request.getParameter("name");

	String phone = request.getParameter("phone");

	DBConnection db = new DBConnection();

	String id = db.findId(name, phone);
%>
<body>

	<!-- 로그인 폼 -->
	<div class="container" style="padding-top: 2.5%; margin-top: 5%">
		<div class="col-lg-4"></div>
		<div class="col-lg-4">
			<div class="jumbotron" style="padding-top: 17%;">
				<div class="form-group" style="text-align: center;">
					<%
						if (id != null) {
					%>
					<h3><%=name%>님의 아이디<span class="label label-default"></span>
					</h3>
				</div>
				<div class="form-group" style="text-align: center;">
					<h4><%=id%></h4>
					<%
						} else {
					%>
					<h3><%=name%>님의 아이디<span class="label label-default"></span>
					</h3>
				</div>
				<div class="form-group" style="text-align: center;">
					<h4>가입 정보가 없습니다.</h4>
				</div>
				<div class="form-group" style="text-align: center;">
					<button id="idChkBtn" class="btn btn-primary"
						style="color: #fff; background-color: #70bfe4; border-color: #70bfe4;"
						onclick="location.href='index.jsp'">확인</button>
				</div>
				<div class="card-footer text-center">
					<div class="small">
						<a href="Register.jsp">Need an account? Sign up!</a>
					</div>
					<div
						class="form-group d-flex align-items-center justify-content-between mt-4 mb-0">
						<a class="small" href="FindId.jsp">Forgot ID?</a> <a class="small"
							href="FindPw.jsp">Forgot Password?</a>
					</div>
				</div>
				<%
					}
				%>
			</div>
		</div>
	</div>

</body>

</html>

