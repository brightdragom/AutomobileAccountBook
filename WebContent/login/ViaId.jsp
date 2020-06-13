<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="DAO.*"%>



<!DOCTYPE html>

<html>

<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width">

<title>아이디 찾기</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.1.1min.js"></script>
<script src="js/bootstrap.js"></script>


</head>

<%
	request.setCharacterEncoding("UTF-8");

	String name = request.getParameter("name");

	String phone = request.getParameter("phone");

	DBConnection db = new DBConnection();

	String id = db.findId(name, phone);
%>
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
				<%
					}
				%>
				<div class="form-group" style="text-align: center;">
					<button id="idChkBtn" class="btn btn-primary"
						onclick="location.href='index.jsp'">확인</button>
				</div>
			</div>
		</div>
	</div>

</body>

</html>

