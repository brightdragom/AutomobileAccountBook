<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.io.PrintWriter"%>


<!DOCTYPE html>

<html>

<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

뷰포트

<meta name="viewport" content="width=device-width" initial-scale="1">

스타일시트 참조 

<link rel="stylesheet" href="../css/styles.css">
<script src="../js/scripts_.js"></script>
<title>수리점검현황</title>

</head>

<body>
	네비게이션 

	<nav class="navbar navbar-default">
	
		<div class="navbar-header">

			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="bs-example-navbar-collapse-1"
				aria-expaned="false">

				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>

			</button>

			<a class="navbar-brand" href="/AutomobileAccountBook/main/housekeepingBook_view.jsp">부릉</a>

		</div>

		<div class="collapse navbar-collapse"id="#bs-example-navbar-collapse-1">

			<ul class="nav navbar-nav">

				<li><a href="/AutomobileAccountBook/main/housekeepingBook_view.jsp">가계부</a></li>

				<li class="active"><a href="/AutomobileAccountBook/main/RepairCheck.jsp">수리현황</a></li>

			</ul>

			수리현황

			<div class="container">

				<div class="row">

					<table class="table table-striped"
						style="text-align: center; border: 1px solid #dddddd">

						<thead>

							<tr>

								<th style="background-color: #eeeeee; text-align: center;">번호</th>

								<th style="background-color: #eeeeee; text-align: center;">제목</th>

								<th style="background-color: #eeeeee; text-align: center;">작성자</th>

								<th style="background-color: #eeeeee; text-align: center;">작성일</th>

							</tr>

						</thead>

						<tbody>

							<tr>

								<td>1</td>

								<td>타이어교체</td>

								<td>정비사</td>

								<td>2020-06-09</td>

							</tr>

						</tbody>

					</table>

					<a href="/AutomobileAccountBook/main/RepairCheckWrite.jsp" class="btn btn-primary pull-right">글쓰기</a>

				</div>

			</div>









			애니매이션 담당 JQUERY

			<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

			부트스트랩 JS 

			<script src="js/bootstrap.js"></script>
</body>

</html>
