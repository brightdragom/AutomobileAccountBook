<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="model.User"%>
<!DOCTYPE html>
<html>
<head>

<% User user = (User) session.getAttribute("user");
   boolean isRight = user.getCareer().equals("T") ? true : false;
   if(isRight){
      out.println("<script>alert('정비 현황 리스트입니다.');</script>");
   }else{
      out.println("<script>alert('이용권한이 없습니다.'); history.back();</script>");
   }
%>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div align="center">
		<span> 등록할 정비 정보 </span>
	</div>

	<table width="500" border="1" align="center" cellpadding="0"
		cellspacing="1">
		<tr align="center">
			<td><span> 정비 및 수리 내용 </span></td>
			<td><span> 정비 및 수리 일 </span></td>
			<td><span> 정비 및 수리 사진 </span></td>
		</tr>
	</table>
	<form action="/AutomobileAccountBook/RepairProgress" method="post" enctype="multipart/form-data">
		<div
			style="max-height: 500px; width: 100%; overflow-x: hidden; overflow-y: scroll;">
			<table width="500" border="0" align="center" left_padding="50"
				cellpadding="0" cellspacing="1">
				<!-- 수리 진행 상황 -->

				<tr>
					<td align="center"><input actionfocus name="item.contents"
						type="text" value="${ item.contents}"></td>
					<td align="center"><input actionfocus name="item.doday"
						type="date" value="${ item.doday}"></td>
					<td align="center"><input type="file" name="uploadFile"
						id="uploadFile"></td>
				</tr>

			</table>
		</div>
		<div align="center">
			<input type="submit" value="추가">
		</div>
	</form>
</body>
</html>