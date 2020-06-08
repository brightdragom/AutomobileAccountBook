<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="model.HousekeepingBook" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HousekeepingBook_view_page</title>
</head>
<body>
	<div align="center">
		<span> 가계부</span>
	</div>
	<div style="width:850px; height:400px; overflow:auto">
	<table width="500" border="0" align="center" cellpadding="0" cellspacing="1" >
		<tr align="center">
			<td><span> Line </span></td>
			<td><span> 날짜 </span></td>
			<td><span> 사용내역 </span></td>
			<td><span> 비용 </span></td>
			<td><span> 현재Km </span></td>
		</tr>
		<!-- 가계부 정보 -->
		<% int cnt = 0; %>
		<c:forEach items="${ item_list }" var="item_list" varStatus="count">
			<% cnt ++; %>
			<tr>
				<td align="center"><% out.println(cnt); %></td>
				<td align="center"> <input actionfocus name="item_list.todate" type="text" value="${ item_list.todate }"> </td>
				<td align="center"> <input actionfocus name="item_list.content" type="text" value="${ item_list.content }"></td>
				<td align="center"> <input actionfocus name="item_list.cost" type="text" value="${ item_list.cost }"></td>
				<td align="center"> <input actionfocus name="item_list.mileage" type="text" value="${ item_list.mileage }"></td>
			</tr>		
		</c:forEach>
		<!-- 가계부 정보 -->
		<tr>
		<tr height="5">
			<td></td>
			<td></td>
		</tr>
		<tr>
		<!-- 장식 -->
			<td align="center" colspan="6"><input type="submit"value="SAVE" onClick="true"></td>
		</tr>
	</table>
	</div>
</body>
</html>