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
<%@ page import="java.util.Calendar"%>
<!DOCTYPE html>
<html>
<%
	User user = null;
	if (session.getAttribute("user") == null) {
		out.println("<script>alert('로그인을 먼저 해주세요'); history.back();</script>");
		response.sendRedirect("/AutomobileAccountBook/login/index.jsp");
	} else {
		user = (User) session.getAttribute("user");
	}
%>
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
<title>HousekeepingBook</title>
<link href="<%=request.getContextPath()%>/css/styles.css"
	rel="stylesheet" />

<style>
.sb-sidenav-dark {
	background-color: #369bc9;
}

.bg-dark {
	background-color: #70bfe4;
}

.top-icon {
	margin-left: 15px;
	width: 30px;
	height: 30px;
}
</style>
<script type="text/javascript">
	function logout() {
		location.href = "/AutomobileAccountBook/login/logout.jsp"
	}
	function myPages() {
		location.href = "/AutomobileAccountBook/main/myPages.jsp"
	}
	function repair() {
		location.href = "/AutomobileAccountBook/RepairList"
	}
</script>

<%
		DBConnection db = (DBConnection) session.getAttribute("db");
		String text = db.findData(user.getId());
		System.out.println("text >>" + text);
		int total_cost = db.findDataCost(user.getId());
		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		int month = cal.get(Calendar.MONTH)+1;
		int monthCost[] = db.findDataCostChart(user.getId(), year+"", month+"");
	%>

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
					<h1 class="mt-4">Housekeepingbook</h1>
					<ol class="breadcrumb mb-4">
						<li class="breadcrumb-item active"></li>
					</ol>
				</div>
				<div class="row">
					<div class="col-xl-6">
						<div class="card mb-4">
							<div class="card-header">
								<i class="fas fa-chart-area mr-1"></i>Area Chart Example
							</div>
							<div class="card-body">
								<div id="chartdiv2" align="center"></div>
								<!-- 챁 -->
							</div>

						</div>
					</div>
					<div class="col-xl-6">
						<div class="card mb-4">
							<div class="card-header">
								<i class="fas fa-chart-bar mr-1"></i>Bar Chart Example
							</div>
							<div class="card-body">
								<canvas id="myBarChart" width="100%" height="40"></canvas>
							</div>
							<div id="chartdiv" align="center"></div>
							<!-- 워드ㅋ라욷 -->
						</div>
					</div>
				</div>
				<div class="card mb-4">
					<div class="card-header">
						<i class="fas fa-table mr-1"></i>
						<%=user.getName()%>님의 차량 가계부 사용내역
					</div>
					<div class="card-body">
						<div class="table-responsive">
<form action="/AutomobileAccountBook/Delete" method="post" style="display: inline;">
							<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
								<thead>
									<tr>
										<th></th>
										<th>Line</th>
										<th>Date</th>
										<th>Memo</th>
										<th>Cost</th>
										<th>Distance</th>
										<th>Modify</th>
									</tr>
									<tbody>
		<div style="max-height: 500px; width: 100%; overflow-x: hidden; overflow-y: scroll;">
<!-- 			<table width="500" border="0" align="center" left_padding="50"
				cellpadding="0" cellspacing="1"> -->
				<!-- 가계부 정보 -->
				   <tbody>
				<%
					int cnt = 0;
					int total_mileage = 0;
				%>
				<c:forEach items="${ item_list }" var="item_list">
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
						<td align="center">${ item_list.todate}</td>
						<td align="center">${ item_list.content}</td>
						<td align="center">${ item_list.cost}</td>
						<td align="center">${ item_list.mileage}</td>
						<td align="center">
						<a href="/AutomobileAccountBook/Edit?item_list=${ item_list.line_no}">수정</a>
													</td> 
					<!-- 	<a onclick = "edit_list_line()" >수정</a></td> -->
						<c:set var="c" value="${item_list.mileage }"></c:set>
					</tr>
				</c:forEach>
				</tbody>
			
							</table>
		<div style="display: flex; flex-direction: clumn; margin: 15px auto; width: 100%;">
			<label>Total Cost >></label> <label><%=total_cost%></label> <label>Total
				Mileage(KM) >></label> <label>"${c }"
						</label></div>
		<div align="right">
			<a class="btn btnss-primary" name="add_list_line2" value="추가하기" href="/AutomobileAccountBook/main/add_list_line.jsp">추가하기</a>
			<input class="btn btnss-primary" type="submit" name="delete_line2"
									value="삭제하기">
			
		</div>
			</form>
		</div>
	
	
	<!-- <div align="center">  
		<input type="button" name="logout" value="logout" onclick="logout()">
	</div>
	<div align="center">
		<input class="btn btn-primary" type="button" name="myPages" value="myPages"
			onclick="myPages()">
	</div> -->

                       
                                </div>
                            </div>
                        
		</div>
                    </div>
                </main>
                <footer class="py-4 bg-light mt-auto">
                    <div class="container-fluid">
                        <div
				class="d-flex align-items-center justify-content-between small">
                            <div class="text-muted">Copyright &copy; Your Website 2019</div>
                            <div>
                                <a href="#">Privacy Policy</a>
                                &middot;
                                <a href="#">Terms &amp; Conditions</a>
                            </div>
                        </div>
                    </div>
                </footer>
            </div>
        </div>

<!--         <script src="https://code.jquery.com/jquery-3.4.1.min.js" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="../js/scripts_.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <script src="assets/demo/chart-area-demo.js"></script>
        <script src="assets/demo/chart-bar-demo.js"></script>
        <script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js" crossorigin="anonymous"></script>
        <script src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js" crossorigin="anonymous"></script>
        <script src="assets/demo/datatables-demo.js"></script>
 -->
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
    
<script src="https://www.amcharts.com/lib/4/core.js"></script>
<script src="https://www.amcharts.com/lib/4/charts.js"></script>
<script src="https://www.amcharts.com/lib/4/themes/animated.js"></script>
<script src="https://www.amcharts.com/lib/4/plugins/wordCloud.js"></script>

	<%--   <%
		DBConnection db = (DBConnection) session.getAttribute("db");
		String text = db.findData(user.getId());
		System.out.println("text >>" + text);
		int total_cost = db.findDataCost(user.getId());
		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		int month = cal.get(Calendar.MONTH)+1;
		int monthCost[] = db.findDataCostChart(user.getId(), year+"", month+"");	
	%> --%>
	<script>
		var texts = "<%=text%>";
		am4core.useTheme(am4themes_animated);
		//Themes end

		var chart = am4core.create("chartdiv", am4plugins_wordCloud.WordCloud);
		var series = chart.series.push(new am4plugins_wordCloud.WordCloudSeries());

		series.accuracy = 4;
		series.step = 15;
		series.rotationThreshold = 0.7;
		series.maxCount = 200;
		series.minWordLength = 2;
		series.labels.template.tooltipText = "{word}: {value}";
		series.fontFamily = "Courier New";
		series.maxFontSize = am4core.percent(30);
		console.log(texts);
		series.text = texts;
	</script>
	<!-- Chart code -->
	<script>
		am4core.ready(function() { 
			var num = 1000;
			
			// Themes begin
			am4core.useTheme(am4themes_animated);
			// Themes end

			// Create chart instance
			var chart = am4core.create("chartdiv2", am4charts.XYChart);

			// Add data
			chart.data = [ {
				"month" : "Jan",
				"cost" : <%= monthCost[0]%>
			}, {
				"month" : "Feb",
				"cost" : <%= monthCost[1]%>
			}, {
				"month" : "Mar",
				"cost" : <%= monthCost[2]%>
			}, {
				"month" : "Apr",
				"cost" : <%= monthCost[3]%>
			}, {
				"month" : "May",
				"cost" : <%= monthCost[4]%>
			}, {
				"month" : "Jun",
				"cost" : <%= monthCost[5]%>
			}, {
				"month" : "Jul",
				"cost" : <%= monthCost[6]%>
			}, {
				"month" : "Aug",
				"cost" : <%= monthCost[7]%>
			}, {
				"month" : "Sept",
				"cost" : <%= monthCost[8]%>
			}, {
				"month" : "Oct",
				"cost" : <%= monthCost[9]%>
			}, {
				"month" : "Nov",
				"cost" : <%= monthCost[10]%>
			}, {
				"month" : "Dec",
				"cost" : <%= monthCost[11]%>
			}];

			// Create axes

			var categoryAxis = chart.xAxes
					.push(new am4charts.CategoryAxis());
			categoryAxis.dataFields.category = "month";
			categoryAxis.renderer.grid.template.location = 0;
			categoryAxis.renderer.minGridDistance = 30;

			categoryAxis.renderer.labels.template.adapter.add("dy",
					function(dy, target) {
						if (target.dataItem && target.dataItem.index
								& 2 == 2) {
							return dy + 25;
						}
						return dy;
					});

			var valueAxis = chart.yAxes.push(new am4charts.ValueAxis());

			// Create series
			var series = chart.series
					.push(new am4charts.ColumnSeries());
			series.dataFields.valueY = "cost";
			series.dataFields.categoryX = "month";
			series.name = "Cost";
			series.columns.template.tooltipText = "{categoryX}: [bold]{valueY}[/]";
			series.columns.template.fillOpacity = .8;

			var columnTemplate = series.columns.template;
			columnTemplate.strokeWidth = 2;
			columnTemplate.strokeOpacity = 1;

		}); // end am4core.ready()
	</script> 
	<div align="center">
		<span> 
		</span>
	</div>
<!-- <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                        <thead>
                                            <tr>
                                                <th>Line</th>
                                                <th>날짜</th>
                                                <th>사용내역</th>
                                                <th>비용</th>
                                                <th>현재Km</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>Tiger Nixon</td>
                                                <td>System Architect</td>
                                                <td>Edinburgh</td>
                                                <td>61</td>
                                                <td>2011/04/25</td>
                                                <td>$320,800</td>
                                            </tr>
                                            </tbody>
                                        </table> -->
	<!-- <table width="500" border="0" align="center" cellpadding="0"
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
	</table> -->
	<%-- <form action="/AutomobileAccountBook/Delete" method="post">
		<div
			style="max-height: 500px; width: 100%; overflow-x: hidden; overflow-y: scroll;">
			<table width="500" border="0" align="center" left_padding="50"
				cellpadding="0" cellspacing="1">
				<!-- 가계부 정보 -->
				<%
					int cnt = 0;
					int total_mileage = 0;
				%>
				<c:forEach items="${ item_list }" var="item_list">
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
						<td align="center"><a
							href="/AutomobileAccountBook/Edit?item_list=${ item_list.line_no}">수정</a></td>
						<c:set var="c" value="${item_list.mileage }"></c:set>
					</tr>
				</c:forEach>
			</table>
		</div>
		<div
			style="display: flex; flex-direction: clumn; margin: 15px auto; width: 100%;">
			<label>Total Cost >></label> <label><%=total_cost%></label> <label>Total
				Mileage(KM) >></label> <label>"${c }"</label>
		</div>
		<div align="center">
			<input type="submit" name="delete_line2" value="delete!">
		</div>
	</form> --%>
<!-- 	<div align="center">
		<input type="button" name="add_list_line" value="add_list_line"
			onclick="add_list_line()">
	</div>
	<div align="center">
		<input type="button" name="logout" value="logout" onclick="logout()">
	</div>
	<div align="center">
		<input type="button" name="myPages" value="myPages"
			onclick="myPages()">
	</div> -->
	<!-- <div align="center">
		<input type="button" name="repair" value="repair" onclick="repair()">
	</div> -->
<!-- 
	<div id="chartdiv" align="center"></div> 워드ㅋ라욷
	<div id="chartdiv2" align="center"></div>챁  -->
</body>
</html>