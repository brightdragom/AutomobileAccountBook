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
			<td align="center"> <label actionfocus name="hkb.line_no" type="text" value="${ hkb.line_no }"> </td>
			<td align="center"> <input actionfocus name="hkb.todate" type="text" value="${ hkb.todate }"> </td>
			<td align="center"> <input actionfocus name="hkb.content" type="text" value="${ hkb.content }"></td>
			<td align="center"> <input actionfocus name="hkb.cost" type="text" value="${ hkb.cost }"></td>
			<td align="center"> <input actionfocus name="hkb.mileage" type="text" value="${ hkb.mileage }"></td>
			<td align="center"> <input actionfocus name="hkb.writer" type="text" value="${ hkb.writer }"> </td>
			
			
		</tr>	
	</table>
</body>
</html>