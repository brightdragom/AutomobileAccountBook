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
<%@ page import="java.util.Calendar" %>
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
	function myPages() {
		location.href = "/AutomobileAccountBook/main/myPages.jsp"
	}
	function repair() {
		location.href = "/AutomobileAccountBook/RepairList"
	}
</script>
</head>
<body>
	<script src="https://www.amcharts.com/lib/4/core.js"></script>
	<script src="https://www.amcharts.com/lib/4/charts.js"></script>
	<script src="https://www.amcharts.com/lib/4/plugins/wordCloud.js"></script>
	<script src="https://www.amcharts.com/lib/4/themes/animated.js"></script>
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
	</form>
	<div align="center">
		<input type="button" name="add_list_line" value="add_list_line"
			onclick="add_list_line()">
	</div>
	<div align="center">
		<input type="button" name="logout" value="logout" onclick="logout()">
	</div>
	<div align="center">
		<input type="button" name="myPages" value="myPages"
			onclick="myPages()">
	</div>
	<div align="center">
		<input type="button" name="repair" value="repair" onclick="repair()">
	</div>

	<div id="chartdiv" align="center"></div>
	<div id="chartdiv2" align="center"></div>
</body>
</html>