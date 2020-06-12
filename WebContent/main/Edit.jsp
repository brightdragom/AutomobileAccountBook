<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="model.AutoAccountList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
		<span> 라인 정보 </span>
	</div>
	<form action="/AutomobileAccountBook/Edit" method="post">
	<table width="500" border="0" align="center" cellpadding="0" cellspacing="1" >
		<tr align="center">
			<td><span> 고유번호 </span></td>
			<td><span> 날짜 </span></td>
			<td><span> 사용내역 </span></td>
			<td><span> 비용 </span></td>
			<td><span> 현재Km </span></td>
			<td><span> 작성자 </span></td>
		</tr>
		<tr>
			<td align="center"> <input actionfocus name="item.line_no" type="text" value="${ item.line_no }"> </td>
			<td align="center"> <input actionfocus name="item.todate" type="date" value="${ item.todate }"> </td>
			<td align="center"> <input actionfocus name="item.content" type="text" value="${ item.content }"></td>
			<td align="center"> <input actionfocus name="item.cost" type="text" value="${ item.cost }"></td>
			<td align="center"> <input actionfocus name="item.mileage" type="text" value="${ item.mileage }"></td>
			<td align="center"> <input actionfocus name="item.writer" type="text" value="${ item.writer }"> </td>
		</tr>
	</table>
	<input type="subit" value="submit">
	</form>
</body>
</html>