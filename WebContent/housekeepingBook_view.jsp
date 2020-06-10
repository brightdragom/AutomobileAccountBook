<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="model.AutoAccountList"%>
<%@ page import="java.util.List"%>
<%@ page import="DAO.DBConnection"%>
<%@ page import="model.User"%>
<!DOCTYPE html>
<html>
<%
	User user = (User)session.getAttribute("user");
	if(user == null){
		out.println("<script>alert('로그인을 먼저 해주세요'); history.back();</script>");
		response.sendRedirect("index.jsp");
	}else{
		out.println("<script>alert('환영합니다.');</script>");
	}
%>
<head>
<meta charset="UTF-8">
<title>HousekeepingBook_view_page</title>
<!-- 
<script type="text/javascript">
	function add_list_line(){
		var inputStr = prompt('추가할 항목을 입력하시오.','날짜','사용내역','비용','현재KM');
		alert(inputStr);
	}
</script>
 -->
 
 <script type="text/javascript">
	function add_list_line(){
		location.href="/AutomobileAccountBook/add_list_line.jsp";
	}
	function logout(){
		location.href="/AutomobileAccountBook/logout.jsp"
	}
</script>
</head>
<body>
	<div align="center">
		<span> 가계부 <%= user.getId() %></span>
	</div>

	<table width="500" border="0" align="center" cellpadding="0" cellspacing="1" >
		<tr align="center" >
			<td></td>
			<td></td>
			<td><span> Line </span></td>
			<td><span> 날짜 </span></td>
			<td><span> 사용내역 </span></td>
			<td><span> 비용 </span></td>
			<td><span> 현재Km </span></td>
		</tr>
	</table>
	<form action="/AutomobileAccountBook/TestServlet" method="post">
	<div style="max-height:500px; width:100%; overflow-x:hidden; overflow-y:scroll;">
	<table width="500" border="0" align="center" left_padding="50" cellpadding="0" cellspacing="1" >
		<!-- 가계부 정보 -->
		<%
			int cnt = 0;
		%>
		<c:forEach items="${ item_list }" var="item_list" varStatus="count">
			<% 
				cnt ++;
			%>
			<tr>
				<td align="center"> <input type="checkbox" name="item_list" value="${item_list.line_no}"> </td>
				<td align="center"><% out.println(cnt); %></td>
				<!-- <td align="center"> <input actionfocus name="item_list.todate" type="text" value="${ item_list.todate}"> </td>
				<td align="center"> <input actionfocus name="item_list.content" type="text" value="${ item_list.content}"></td>
				<td align="center"> <input actionfocus name="item_list.cost" type="text" value="${ item_list.cost}"></td>
				<td align="center"> <input actionfocus name="item_list.mileage" type="text" value="${ item_list.mileage}"></td> -->
				<td align="center"> <span>${ item_list.todate}</span></td>
				<td align="center"> <span>${ item_list.content}</span></td>
				<td align="center"> <span>${ item_list.cost}</span></td>
				<td align="center"> <span>${ item_list.mileage}</span></td>
				<!-- <td align="center"><a href="/AutomobileAccountBook/TestServlet?item_list=${ item_list.line_no}">수정</a></td> -->
				
			</tr>		
		</c:forEach>
		<!-- 가계부 정보 -->
		
		<tr>
		<!-- 장식 -->
			<!--  <td align="center" colspan="6"><input type="submit" value="SAVE" onClick="true"></td>-->
			<!--  <td align="center" colspan="6"><a href="/AutomobileAccountBook/TestServlet?item_list=1">123</a></td>-->
			<!-- <td align="center" colspan="7"> <a href="/AutomobileAccountBook/TestServlet">save</a> </td>  -->
			<!-- <td align="center" colspan="7"> <input type="submit"></td>-->
			
		</tr>
	</table>
	</div>
	<div align="center"><input type="submit" value ="Edit"/></div>
	</form>
	<!-- <div align="center"><input type="button" value="add_list_line" onclick="add_list_line()"></div> -->
	<div align="center"> <input type="button" name="add_list_line" value="add_list_line" onclick="add_list_line()"></div>
	<div align="center"> <input type="button" name="logout" value="logout" onclick="logout()"></div>
</body>
</html>