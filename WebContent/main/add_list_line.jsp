<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="model.User"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>add_list_line</title>
</head>
<body>
	<% User user = (User) session.getAttribute("user"); %>
	<div align="center">
		<span> 가계부</span>
	</div>

	<table width="500" border="1" align="center" cellpadding="0"
		cellspacing="1">
		<tr align="center">
			<td><span> 날짜 </span></td>
			<td><span> 사용내역 </span></td>
			<td><span> 비용 </span></td>
			<td><span> 현재Km </span></td>
		</tr>
	</table>
	<form action="/AutomobileAccountBook/AddList" method="post">
		<div
			style="max-height: 500px; width: 100%; overflow-x: hidden; overflow-y: scroll;">
			<table width="500" border="0" align="center" left_padding="50"
				cellpadding="0" cellspacing="1">
				<!-- 가계부 정보 -->

				<tr>
					<td align="center"><input actionfocus name="item_list.todate" type="date" value="${ item_list.todate}"></td>
					<td align="center"><input actionfocus name="item_list.content" type="text" value="${ item_list.content}"></td>
					<td align="center"><input actionfocus name="item_list.cost" type="text" value="${ item_list.cost}"></td>
					<td align="center"><input actionfocus name="item_list.mileage" type="text" value="${ item_list.mileage}"></td>
					
				</tr>
				
			</table>
		</div>
		<div align="center"><input type="submit" value="add_list_line"></div>
	</form>
</body>
</html> --%>

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
<title>데이터 생성</title>
<style>
.container {
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



				<h3 style="text-align: center;">데이터 생성</h3>


				<div class="form-group">


					<table width="500" border="1" align="center" cellpadding="0"
						cellspacing="1">
						<tr align="center">
							<td><span> 날짜 </span></td>
							<td><span> 사용내역 </span></td>
							<td><span> 비용 </span></td>
							<td><span> 현재Km </span></td>
						</tr>
					</table>

				</div>

				<div class="form-group">

					<form action="/AutomobileAccountBook/AddList" method="post">
						<div
							style="max-height: 500px; width: 100%; overflow-x: hidden; overflow-y: scroll;">
							<table width="500" border="0" align="center" left_padding="50"
								cellpadding="0" cellspacing="1">
								<!-- 가계부 정보 -->

								<tr>
									<td align="center"><input actionfocus
										name="item_list.todate" type="date"
										value="${ item_list.todate}"></td>
									<td align="center"><input actionfocus
										name="item_list.content" type="text"
										value="${ item_list.content}"></td>
									<td align="center"><input actionfocus
										name="item_list.cost" type="text" value="${ item_list.cost}"></td>
									<td align="center"><input actionfocus
										name="item_list.mileage" type="text"
										value="${ item_list.mileage}"></td>

								</tr>

							</table>
						</div>
						<div align="center">
							<input type="submit" value="add_list_line">
						</div>
					</form>


				</div>
			</form>
		</div>

	</div>
</div>


</html>

