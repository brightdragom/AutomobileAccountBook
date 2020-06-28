<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="model.User"%>
<!DOCTYPE html>
<html>
<% User user = (User) session.getAttribute("user");
   boolean isRight = user.getCareer().equals("T") ? true : false;
   if(isRight){
      out.println("<script>alert('정비 현황 리스트입니다.');</script>");
   }else{
      out.println("<script>alert('이용권한이 없습니다.'); history.back();</script>");
   }
%>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
   function add_repair(){
      location.href="/AutomobileAccountBook/main/RepairAdd.jsp"
   }
</script>
</head>
<body>
	<div align="center">Repair List Page</div>

	<table align="center">
		<tr>
			<td>
				<div align="center">
					<label>정비 번호</label>
				</div>
			</td>
			<td>
				<div align="center">
					<label>운전자 ID</label>
				</div>
			</td>
			<td>
				<div align="center">
					<label>운전자 이름</label>
				</div>
			</td>
			<td>
				<div align="center">
					<label>정비사 ID</label>
				</div>
			</td>
			<td>
				<div align="center">
					<label>정비사 </label>
				</div>
			</td>
			<td>
				<div align="center">
					<label>수리 및 정비</label>
				</div>
			</td>
			<td>
				<div align="center">
					<label>시작일</label>
				</div>
			</td>
			<td>
				<div align="center">
					<label>예상 완료일</label>
				</div>
			</td>
			<td>
				<div align="center">
					<label>종료일</label>
				</div>
			</td>
			<td>
				<div align="center">
					<label>비용</label>
				</div>
			</td>
		</tr>
		<c:forEach items="${item }" var="item">
			<tr align="center">
				<td><label>${ item.repair_no }</label></td>
				<td><label>${ item.driver_id }</label></td>
				<td><label>${ item.driver_name }</label></td>
				<td><label>${ item.technician_id }</label></td>
				<td><label>${ item.technician_name }</label></td>
				<td><label>${ item.contents }</label></td>
				<td><label>${ item.start_date }</label></td>
				<td><label>${ item.expect_date }</label></td>
				<td><label>${ item.finish_date }</label></td>
				<td><label>${ item.cost }</label></td>
				<td><a
					href="/AutomobileAccountBook/RepairProgress?item=${ item.repair_no}">into</a>
				</td>
			</tr>
		</c:forEach>
	</table>
	<div align="center">
		<input type="button" name="add_repair" value="add_repair"
			onclick="add_repair()">
	</div>
</body>
</html>