<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*, java.text.*"%>
<%@ page import="java.lang.String"%>
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
<title>RepairProgressList</title>
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
<script type="text/javascript">
	function add_repair() {
		location.href = "/AutomobileAccountBook/main/RepairProgressAdd.jsp?item=${repair_no}"
	}
	function returnpage() {
		location.href = "/AutomobileAccountBook/RepairList"
	}
</script>
</head>
<body class="sb-nav-fixed">
	<nav class="sb-topnav navbar navbar-expand navbar-dark bg-yellows">
	<a href="/AutomobileAccountBook/LoginAction">
	<img class="top-icon" src="/AutomobileAccountBook/img/pickup-car.png" ></a>
		<a class="navbar-brand" href="/AutomobileAccountBook/LoginAction">Automobile Account Book</a>
		<button class="btn btn-link btn-sm order-1 order-lg-0"
			id="sidebarToggle" href="#">
			<i class="fas fa-bars"></i>
		</button>
		<!-- Navbar Search-->
		 <form
			class="d-none d-md-inline-block form-inline ml-auto mr-0 mr-md-3 my-2 my-md-0">
			<%--  <a><%=user.getName()%>님 환영합니다</a> --%>
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
								<a class="nav-link" href="/AutomobileAccountBook/LoginAction">CarkeepingBook</a>
								<a class="nav-link" href="/AutomobileAccountBook/RepairList">RepairingBook</a>
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
					<h1 class="mt-4">정비상황</h1>
					<ol class="breadcrumb mb-4">
						<li class="breadcrumb-item active"></li>
					</ol>
					<div class="card mb-4">
						<div class="card-header">
							<i class="fas fa-table mr-1"></i>DataTable Example
						</div>
						
						<div class="card-body">
							<div class="table-responsive">
								<table class="table table-bordered" id="dataTable" width="100%"
									cellspacing="0">
									<thead>
										<tr>
											<th>정비번호</th>
											<th>수리 및 정비</th>
											<th>수리 및 정비 날짜</th>
											<th>작성자</th>
											<th>img</th>
										</tr>
									<tbody>
									<c:forEach items="${item }" var="item">
					<tr align="center">
						<td>${ item.repair_no }</td>
						<td>${ item.contents }</td>
						<td>${ item.doday }</td>
						<td>${ item.writer_id }</td>
						<td><img src="${ item.img }"></td>
					</tr>
				</c:forEach>
				</tbody>
					
								</table>
							</div>
						</div>
					<div align="right" style="margin-right:15px">
				<input class="btn btnss-primary"  type="button" name="add_repair" value="add_repair"
					onclick="add_repair()">
			
				<input class="btn btnss-primary"  type="button" name="returnpage" value="returnpage"
					onclick="returnpage()">
				
					</div>
						<br>
				</div>
			</main>
			<footer class="py-4 bg-light mt-auto">
				<div class="container-fluid">
					<div
						class="d-flex align-items-center justify-content-between small">
						<div class="text-muted">Copyright &copy; Your Website 2019</div>
						<div>
							<a href="#">Privacy Policy</a> &middot; <a href="#">Terms
								&amp; Conditions</a>
						</div>
					</div>
				</div>
			</footer>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script src="js/scripts.js"></script>
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
			<div align="center">Repair Progress List Page</div>
			<%
				String no = (String) session.getAttribute("reno");
			System.out.println(no);
			%>
			<%-- <div align="center"></div>
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
					<td>
						<div align="center">
							<label>image</label>
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
						<td><img src="${ item.img }"></td>
					</tr>
				</c:forEach>
			</table> --%>
		<!-- 	<div align="center">
				<input type="button" name="add_repair" value="add_repair"
					onclick="add_repair()">
			</div>
			<div align="center">
				<input type="button" name="returnpage" value="returnpage"
					onclick="returnpage()">
			</div> -->
</body>
</html>