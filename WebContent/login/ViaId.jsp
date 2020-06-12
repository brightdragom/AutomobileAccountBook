<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="DAO.*" %>



<!DOCTYPE html>

<html>

<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width">

<title>아이디 찾기</title>

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


				<h3><%=name%>님의 아이디<span class="label label-default"></span></h3>

			</div>
			<div class="form-group" style="text-align: center;">


				<h4><%=id%></h4>

			</div>
			<div class="form-group" style="text-align: center;">
				<button id="idChkBtn" class="btn btn-primary"
					onclick="location.href='login/index.jsp'">확인</button>
			</div>
		</div>
	</div>
</div>

</body>

</html>

