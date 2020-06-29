 <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="model.User"%>
<!DOCTYPE html>
<html>
<head>
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
<title>추가</title>
<link href="<%=request.getContextPath()%>/css/styles.css" rel="stylesheet" />
 <style>
 .sb-sidenav-dark{
 background-color:#369bc9;
 }
 .bg-dark{
 background-color:#70bfe4;
 } 
 .add-list{
 margin-left:30px;
 margin-right:30px;
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
		<a href="/AutomobileAccountBook/LoginAction"> <img
			class="top-icon" src="/AutomobileAccountBook/img/pickup-car.png"></a>
		<a class="navbar-brand" href="/AutomobileAccountBook/LoginAction">Automobile Account Book</a>
		<button class="btn btn-link btn-sm order-1 order-lg-0"
			id="sidebarToggle" href="#">
			<i class="fas fa-bars"></i>
		</button>
		<!-- Navbar Search-->
		 <form
			class="d-none d-md-inline-block form-inline ml-auto mr-0 mr-md-3 my-2 my-md-0">
			
			<!-- <div class="input-group">
				<input class="form-control" type="text" placeholder="Search for..."
					aria-label="Search" aria-describedby="basic-addon2" /> -->
				<!-- <div class="input-group-append">
					<button class="btn btn-primary" type="button">
						<i class="fas fa-search"></i>
					</button>
				</div> -->
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
					<a class="dropdown-item"
						href="/AutomobileAccountBook/main/myPages.jsp">My Pages</a>
					<div class="dropdown-divider"></div>
					<a class="dropdown-item"
						href="/AutomobileAccountBook/login/logout.jsp">Logout</a>
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
							aria-controls="collapseLayouts"><div class="sb-nav-link-icon">
								<i class="fas fa-columns"></i>
							</div> Management
							<div class="sb-sidenav-collapse-arrow">
								<i class="fas fa-angle-down"></i>
							</div></a>
						<div class="collapse" id="collapseLayouts"
							aria-labelledby="headingOne" data-parent="#sidenavAccordion">
							<nav class="sb-sidenav-menu-nested nav">
								<!-- <a class="nav-link" href="/AutomobileAccountBook/main/housekeepingBook_view.jsp">CarkeepingBook</a> -->
								<a class="nav-link" href="/AutomobileAccountBook/LoginAction">CarkeepingBook</a>
								<a class="nav-link" href="/AutomobileAccountBook/RepairList">RepairingBook</a>
							</nav>
						</div>

						<div class="sb-sidenav-menu-heading">Views</div>
						<a class="nav-link"
							href="/AutomobileAccountBook/main/housekeepingBook_charts.jsp"><div
								class="sb-nav-link-icon">
								<i class="fas fa-chart-area"></i>
							</div> Charts</a><a class="nav-link"
							href="/AutomobileAccountBook/main/housekeepingBook_word.jsp"><div
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
                        <h1 class="mt-4">작성하기</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active"></li>
                        </ol>
                         </div>
	<% User user = (User) session.getAttribute("user"); %>
<!-- 	<div align="center">
		<span> 가계부</span>
	</div>

	<table width="500" border="1" align="center" cellpadding="0"
		cellspacing="1">
		<tr align="center">
			<td><span> 날짜 </span></td>
			<td><span> 사용내역 </span></td>
			<td><span> 비용 </span></td>
			<td><span> 현재Km </span></td>
		</tr>
	</table> -->
	<form action="/AutomobileAccountBook/AddList" method="post">
	<div class="add-list">
	            <div class="mb-3">
                <label for="date">날짜</label>
                <input type="date" class="form-control" name="item_list.todate">
            </div>
            <div class="mb-3">
                <label for="content">사용 내역</label>
                <input type="text" class="form-control" name="item_list.content"  placeholder="사용 내역을 입력해 주세요">
            </div>
            <div class="mb-3">
                <label for="content">내역</label>
                <input type="text" placeholder="내역을 입력해 주세요. " name="item_list.cost"  class="form-control"/>
            </div>
                        <div class="mb-3">
                <label for="content">현재 km</label>
                <input type="text" placeholder="현재 km을 입력해 주세요. " name="item_list.mileage"  class="form-control"/>
            </div>
            <div align="right">
            <button class="btn btnss-primary"  type="submit" >작성</button>
            </div>
	</div>
		<div
			style="max-height: 500px; width: 100%; overflow-x: hidden; overflow-y: scroll;">
			<table width="500" border="0" align="center" left_padding="50"
				cellpadding="0" cellspacing="1">
				<!-- 가계부 정보 -->

				<%-- <tr>
					<td align="center"><input actionfocus name="item_list.todate" type="date" value="${ item_list.todate}"></td>
					<td align="center"><input actionfocus name="item_list.content" type="text" value="${ item_list.content}"></td>
					<td align="center"><input actionfocus name="item_list.cost" type="text" value="${ item_list.cost}"></td>
					<td align="center"><input actionfocus name="item_list.mileage" type="text" value="${ item_list.mileage}"></td>
					
				</tr> --%>
				
			</table>
		</div>
		<!-- <div align="center"><input type="submit" value="add_list_line"></div> -->
	</form>
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"
		crossorigin="anonymous"></script>
        <script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
        <script src="js/bootstrap.js"></script>
        <script
		src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"
		crossorigin="anonymous"></script>
        <script src="assets/demo/chart-area-demo.js"></script>
        <script src="assets/demo/chart-bar-demo.js"></script>
        <script
		src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"
		crossorigin="anonymous"></script>
        <script
		src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js"
		crossorigin="anonymous"></script>
        <script src="assets/demo/datatables-demo.js"></script>
    
</body>
</html>

