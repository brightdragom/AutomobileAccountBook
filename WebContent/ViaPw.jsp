<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="DAO.*"%>



<!DOCTYPE html>

<html>

<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>아이디 찾기</title>

</head>

<%
	request.setCharacterEncoding("UTF-8");

	String id = request.getParameter("id");

	String phone = request.getParameter("phone");

	DBConnection db = new DBConnection();

	String pw = db.findPw(id, phone);
%>

<body>

<div class="container" style="padding-top: 2.5%; margin-top: 5%">

	<div class="col-lg-4"></div>
	<div class="col-lg-4">


		<div class="jumbotron" style="padding-top: 17%;">
			<div class="form-group" style="text-align: center;">


				<h3><%=id%>님의 비밀번호<span class="label label-default"></span></h3>

			</div>
			<div class="form-group" style="text-align: center;">


				<h4><%=pw%></h4>

			</div>
			<div class="form-group" style="text-align: center;">
				<button id="idChkBtn" class="btn btn-primary"
					onclick="location.href='index.jsp'">확인</button>
			</div>
		</div>
	</div>
</div>

</body>

</html>

