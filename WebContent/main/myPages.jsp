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
<title>MyPages</title>
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
                        <h1 class="mt-4">My Page</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active"></li>
                        </ol>
                         </div>
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