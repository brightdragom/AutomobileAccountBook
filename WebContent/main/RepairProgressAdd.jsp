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
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<link href="css/styles.css" rel="stylesheet" />
<link
	href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css"
	rel="stylesheet" crossorigin="anonymous" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/js/all.min.js"
	crossorigin="anonymous"></script>

<meta charset="UTF-8">
<title>RepairProgressAdd</title>
<link href="<%=request.getContextPath()%>/css/styles.css" rel="stylesheet" />
         
 <style>
 .sb-sidenav-dark{
 background-color:#369bc9;
 }
 .bg-dark{
 background-color:#70bfe4;
 } 
 .top-icon{
margin-left:15px;
width:30px;
height:30px;
 }
 </style>
</head>
<body class="sb-nav-fixed">
	<nav class="sb-topnav navbar navbar-expand navbar-dark bg-yellows">
	<a href="/AutomobileAccountBook/main/housekeepingBook_view.jsp">
	<img class="top-icon" src="/AutomobileAccountBook/img/pickup-car.png" ></a>
		<a class="navbar-brand" href="/AutomobileAccountBook/main/housekeepingBook_view.jsp">Automobile Account Book</a>
		<button class="btn btn-link btn-sm order-1 order-lg-0"
			id="sidebarToggle" href="#">
			<i class="fas fa-bars"></i>
		</button>
		<!-- Navbar Search-->
		<form
			class="d-none d-md-inline-block form-inline ml-auto mr-0 mr-md-3 my-2 my-md-0">
			<div class="input-group">
				<input class="form-control" type="text" placeholder="Search for..."
					aria-label="Search" aria-describedby="basic-addon2" />
				<div class="input-group-append">
					<button class="btn btn-primary" type="button">
						<i class="fas fa-search"></i>
					</button>
				</div>
			</div>
		</form>
		<!-- Navbar-->
		<ul class="navbar-nav ml-auto ml-md-0">
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" id="userDropdown" href="#"
				role="button" data-toggle="dropdown" aria-haspopup="true"
				aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
				<div class="dropdown-menu dropdown-menu-right"
					aria-labelledby="userDropdown">
					<a class="dropdown-item" href="/AutomobileAccountBook/main/myPages.jsp">My Pages</a>
					<div class="dropdown-divider"></div>
					<a class="dropdown-item" href="/AutomobileAccountBook/login/logout.jsp">Logout</a>
				</div></li>
		</ul>
	</nav>
	<div id="layoutSidenav">
		<div id="layoutSidenav_nav">
			<nav class="sb-sidenav accordion sb-sidenav-dark"
				id="sidenavAccordion">
				<div class="sb-sidenav-menu">
					<div class="nav">
						<div class="sb-sidenav-menu-heading">My Car</div>
						<a class="nav-link collapsed" href="#" data-toggle="collapse"
							data-target="#collapseLayouts" aria-expanded="false"
							aria-controls="collapseLayouts"><div
								class="sb-nav-link-icon">
								<i class="fas fa-columns"></i>
							</div> Management
							<div class="sb-sidenav-collapse-arrow">
								<i class="fas fa-angle-down"></i>
							</div></a>
						<div class="collapse" id="collapseLayouts"
							aria-labelledby="headingOne" data-parent="#sidenavAccordion">
							<nav class="sb-sidenav-menu-nested nav">
								 <a class="nav-link" href="/AutomobileAccountBook/main/housekeepingBook_view.jsp">CarkeepingBook</a>
								 <a class="nav-link" href="/AutomobileAccountBook/main/RepairList.jsp">RepairingBook</a>
							</nav>
						</div>
						
						<div class="sb-sidenav-menu-heading">Views</div>
						<a class="nav-link" href="/AutomobileAccountBook/main/housekeepingBook_charts.jsp"><div
								class="sb-nav-link-icon">
								<i class="fas fa-chart-area"></i>
							</div> Charts</a><a class="nav-link" href="/AutomobileAccountBook/main/housekeepingBook_word.jsp"><div
								class="sb-nav-link-icon">
								<i class="fas fa-table"></i>
							</div> WordCloud</a>
					</div>
				</div>
				<div class="sb-sidenav-footer">
					<div class="small">Logged in as:</div>
					AutomobileAccountBook
				</div>
			</nav>
		</div>
		<div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid">
                        <h1 class="mt-4">RepairProgressAdd</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active"></li>
                        </ol>
                         </div>
	<!-- <div align="center">
		<span> 등록할 정비 정보 </span>
	</div>

	<table width="500" border="1" align="center" cellpadding="0"
		cellspacing="1">
		<tr align="center">
			<td><span> 정비 및 수리 내용 </span></td>
			<td><span> 정비 및 수리 일 </span></td>
			<td><span> 정비 및 수리 사진 </span></td>
		</tr>
	</table> -->
	<form action="/AutomobileAccountBook/RepairProgress" method="post" enctype="multipart/form-data">
		<div class="add-list">
	            <div class="mb-3">
                <label for="content">정비 및 수리 내용</label>
                <input type="text" class="form-control" name="item.contents"  value="${ item.contents}">
            </div>
            <div class="mb-3">
                <label for="date">정비 및 수리 날짜</label>
                <input type="date" class="form-control" name="item.doday" value="${ item.doday}" >
            </div>
            <div class="mb-3">
                <label for="content">정비 및 수리 사진</label>
                <input type="file"  " name="uploadFile" class="form-control"/ id="uploadFile">
            </div>
            <div align="right">
            <button class="btn btnss-primary"  type="submit" >추가</button>
            </div>
	</div>
		<div
			style="max-height: 500px; width: 100%; overflow-x: hidden; overflow-y: scroll;">
			<table width="500" border="0" align="center" left_padding="50"
				cellpadding="0" cellspacing="1">
				<%-- <!-- 수리 진행 상황 -->

				<tr>
					<td align="center"><input actionfocus name="item.contents"
						type="text" value="${ item.contents}"></td>
					<td align="center"><input actionfocus name="item.doday"
						type="date" value="${ item.doday}"></td>
					<td align="center"><input type="file" name="uploadFile"
						id="uploadFile"></td>
				</tr>
 --%>
			</table>
		</div>
		<div align="center">
			<input type="submit" value="추가">
		</div>
	</form>
</body>
</html>