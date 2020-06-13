<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="DAO.DBConnection"%>
<%@ page import="model.User"%>
<%
	User user = (User) session.getAttribute("user");
	DBConnection db = (DBConnection) session.getAttribute("db");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MyPages</title>
</head>
<body>
<table>
	<tr>
	
		<td> <label>Name</label>
		<td> <label>${user.getName() }</label>
	</tr>
	<tr>
		<td> <label>ID</label>
		<td> <label>${user.getId() }</label>
	</tr>
	<tr>
		<td> <label>Password</label>
		<td> <label>${user.getPw() }</label>
	</tr>
	<tr>
		<td> <label>Phone</label>
		<td> <label>${user.getPhone() }</label>
	</tr>
	<tr>
		<td> <label>Email</label>
		<td> <label>${user.getEmail() }</label>
	</tr>
	<tr>
		<td> <label>address</label>
		<td> <label>${user.getAddr() }</label>
	</tr>
</table>
</body>
</html>