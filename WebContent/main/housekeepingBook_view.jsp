<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("euc-kr");
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="model.AutoAccountList"%>
<%@ page import="java.util.List"%>
<%@ page import="DAO.DBConnection"%>
<%@ page import="model.User"%>
<!DOCTYPE html>
<html>
<%
	User user = null;
	if (session.getAttribute("user") == null) {
		out.println("<script>alert('로그인을 먼저 해주세요'); history.back();</script>");
		response.sendRedirect("/AutomobileAccountBook/login/index.jsp");
	} else {
		user = (User) session.getAttribute("user");
		out.println("<script>alert('환영합니다.');</script>");
	}
%>
<head>
<meta charset="UTF-8">
<title>HousekeepingBook_view_page</title>
<script type="text/javascript">
	function add_list_line() {
		location.href = "/AutomobileAccountBook/main/add_list_line.jsp"
	}
	function logout() {
		location.href = "/AutomobileAccountBook/login/logout.jsp"
	}
	function myPages(){
		location.href="/AutomobileAccountBook/main/myPages.jsp"
	}
</script>
</head>
<body>
	<div align="center">
		<span> 가계부 <%=user.getName()%>
		</span>
	</div>

	<table width="500" border="0" align="center" cellpadding="0"
		cellspacing="1">
		<tr align="center">
			<td></td>
			<td></td>
			<td><span> Line </span></td>
			<td><span> 날짜 </span></td>
			<td><span> 사용내역 </span></td>
			<td><span> 비용 </span></td>
			<td><span> 현재Km </span></td>
		</tr>
	</table>
	<form action="/AutomobileAccountBook/Delete" method="post">
		<div
			style="max-height: 500px; width: 100%; overflow-x: hidden; overflow-y: scroll;">
			<table width="500" border="0" align="center" left_padding="50" cellpadding="0" cellspacing="1">
				<!-- 가계부 정보 -->
				<%
					int cnt = 0;
				%>
				<c:forEach items="${ item_list }" var="item_list" varStatus="count">
					<%
						cnt++;
					%>
					<tr>
						<td align="center"><input type="checkbox" name="item_list"
							value="${item_list.line_no}"></td>
						<td align="center">
							<%
								out.println(cnt);
							%>
						</td>
						<td align="center"><span>${ item_list.todate}</span></td>
						<td align="center"><span>${ item_list.content}</span></td>
						<td align="center"><span>${ item_list.cost}</span></td>
						<td align="center"><span>${ item_list.mileage}</span></td>
						<td align="center"><a href="/AutomobileAccountBook/Edit?item_list=${ item_list.line_no}">수정</a></td>

					</tr>
				</c:forEach>
				<tr>
				</tr>
			</table>
		</div>
		<div align="center">
			<input type="submit" name="delete_line2" value="delete!">
		</div>
	</form>
		<div align="center">
			<input type="button" name="add_list_line" value="add_list_line"
				onclick="add_list_line()">
		</div>
		<div align="center">
			<input type="button" name="logout" value="logout" onclick="logout()">
		</div>
		<div align="center">
			<input type="button" name="myPages" value="myPages" onclick="myPages()">
		</div>

</body>
</html>