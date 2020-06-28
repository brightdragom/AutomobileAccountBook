 <%@ page language="java" contentType="text/html; charset=UTF-8"
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
</html>

