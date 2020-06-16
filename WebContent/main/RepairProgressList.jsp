<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*, java.text.*"%>
<%@ page import="java.lang.String"%>
<%@ page import="model.User"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
   function add_repair(){
      location.href="/AutomobileAccountBook/main/RepairProgressAdd.jsp?item=${repair_no}"
   }
</script>
</head>
<body>
	<div align="center">Repair Progress List Page</div>
	<% 
   String no = (String)session.getAttribute("reno");
   System.out.println(no);%>
	<div align="center"></div>
	<table align="center">
		<tr>
			<td>
				<div align="center">
					<label>정비 번호</label>
				</div>
			</td>
			<td>
				<div align="center">
					<label>수리 및 정비</label>
				</div>
			</td>
			<td>
				<div align="center">
					<label>수리 및 정비 일</label>
				</div>
			</td>
			<td>
				<div align="center">
					<label>작성자</label>
				</div>
			</td>
		</tr>

		<!-- 여기부터 에러 -->
		<c:forEach items="${item }" var="item">
			<tr align="center">
				<td><label>${ item.repair_no }</label></td>
				<td><label>${ item.contents }</label></td>
				<td><label>${ item.doday }</label></td>
				<td><label>${ item.writer_id }</label></td>
			</tr>
		</c:forEach>
	</table>
	<div align="center">
		<input type="button" name="add_repair" value="add_repair"
			onclick="add_repair()">
	</div>

</body>
</html>