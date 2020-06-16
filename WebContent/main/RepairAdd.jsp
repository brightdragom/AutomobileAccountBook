<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="model.User"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% User user = (User) session.getAttribute("user"); %>
	<div align="center">
		<span> 등록할 정비 정보 </span>
	</div>

	<table width="500" border="1" align="center" cellpadding="0"
		cellspacing="1">
		<tr align="center">
			<td><span> 운전자 ID </span></td>
			<td><span> 정비 및 수리 내용 </span></td>
			<td><span> 시작일 </span></td>
			<td><span> 예상 종료일 </span></td>
		</tr>
	</table>
	<form action="/AutomobileAccountBook/AddRepair" method="post">
		<div
			style="max-height: 500px; width: 100%; overflow-x: hidden; overflow-y: scroll;">
			<table width="500" border="0" align="center" left_padding="50"
				cellpadding="0" cellspacing="1">
				<!-- 가계부 정보 -->

				<tr>
					<td align="center"><input actionfocus
						name="item_list.driver_id" type="text"
						value="${ item_list.driver_id}"></td>
					<td align="center"><input actionfocus
						name="item_list.contents" type="text"
						value="${ item_list.contents}"></td>
					<td align="center"><input actionfocus
						name="item_list.start_time" type="date"
						value="${ item_list.start_time}"></td>
					<td align="center"><input actionfocus
						name="item_list.expect_time" type="date"
						value="${ item_list.expect_time}"></td>

				</tr>

			</table>
		</div>
		<div align="center">
			<input type="submit" value="item_list">
		</div>
	</form>
</body>
</html>