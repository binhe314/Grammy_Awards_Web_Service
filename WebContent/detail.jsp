<!DOCTYPE HTML>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="twitter4j.Twitter"%>
<%@ page import="databeans.History" %>
<%@ page import="formbeans.SearchForm"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="tag" tagdir="/WEB-INF/tags"%>
<html>
<head>
<title>All about the 57th Grammy's</title>
<link href="./css/bootstrap.css" rel='stylesheet' type='text/css' />
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="./js/jquery.min.js"></script>
<!--Load the AJAX API-->
<script type="text/javascript"
	src="https://www.google.com/jsapi?autoload={'modules':[{'name':'visualization','version':'1','packages':['corechart']}]}"></script>
<script src="http://code.highcharts.com/highcharts.js"></script>
<script src="http://code.highcharts.com/modules/exporting.js"></script>

<!-- Custom Theme files -->
<link href="./css/style.css" rel='stylesheet' type='text/css' />
<!-- Custom Theme files -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="application/x-javascript">
	 addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } 
</script>
<!-- draw chart to show change of search number -->
<script type="text/javascript">
	// Load the Visualization API and the piechart package.
	google.load('visualization', '1.0', {
		'packages' : [ 'corechart' ]
	});

	// Set a callback to run when the Google Visualization API is loaded.
	google.setOnLoadCallback(drawChart);

	// Callback that creates and populates a data table,
	// instantiates the pie chart, passes in the data and
	// draws it.
	function drawChart() {

		var data = new google.visualization.DataTable();

		// Declare columns
	 	data.addColumn('string', 'Date');
		data.addColumn('number', 'Number of Search');
 
		// Add data.
		 data.addRows([
		<c:forEach var="history" items="${historyChart}" varStatus="status">
			 ['${history.stringDate}', ${history.searchNum}] ${status.last?'':', '}
		</c:forEach>
		]);
		 
		var options = {
			width : 700,
			height : 400,
			hAxis : {
				title : 'Date',
				gridlines : {
					count : 7
				}

			},
			vAxis : {
				title : 'Number of Search'
			}
		};

		var chart = new google.visualization.ColumnChart(document
				.getElementById('chart2'));

		chart.draw(data, options);
	}
</script>

<!-- draw hiChart -->
<script src="./js/dark-unica.js"></script>
<script type="text/javascript">
$(function () {
    $('#chart3').highcharts({
        chart: {
            type: 'column',
            width: 700,
            heigth: 400,
            spacingBottom: 15,
            spacingTop: 10,
            spacingLeft: 10,
            spacingRight: 10,

        },
        title: {
            text: 'Search number in past 7 days'
        },
        
        xAxis: {
        	
            categories: [
                         
               <c:forEach var="history" items="${historyChart}" varStatus="status">
               '${history.stringDate}' ${status.last?'':', '}
               </c:forEach>
            ]
        },
        yAxis: {
        	gridLineWidth: 0,
        	minorGridLineWidth: 0,
            min: 0,
            title: {
                text: 'Number of Search'
            }
        },
        
        tooltip: {
            headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
            pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
                '<td style="padding:0"><b>{point.y:.1f} mm</b></td></tr>',
            footerFormat: '</table>',
            shared: true,
            useHTML: true
        },
        plotOptions: {
            column: {
                pointPadding: 0.2,
                borderWidth: 0
            }
        },
        series: [{
            name: '${form.celebrity}',
            	
            data: [<c:forEach var="history" items="${historyChart}" varStatus="status">
			 ${history.searchNum} ${status.last?'':', '}
				</c:forEach>]

        }]
    });
});

</script>

<script type="text/javascript">
$(function () {

    $(document).ready(function () {

        // Build the chart
        $('#chart4').highcharts({
            chart: {
                plotBackgroundColor: null,
                plotBorderWidth: null,
                plotShadow: false,
                width: 700,
                spacingBottom: 15,
                spacingTop: 10,
                spacingLeft: 10,
                spacingRight: 10

            },
            title: {
                text: 'Search number percentage among all celebrities'
            },
            
            tooltip: {
                pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
            },
            plotOptions: {
                pie: {
                    allowPointSelect: true,
                    cursor: 'pointer',
                    dataLabels: {
                        enabled: false
                    },
                    showInLegend: true
                }
            },
            series: [{
                type: 'pie',
                name: 'Search number share',
                data: [
                    ['Other Celebrities',   ${otherNum}],
                    {
                        name: '${form.celebrity}',
                        y: ${tagTotal},
                        sliced: true,
                        selected: true
                    }
                ]
            }]
        });
    });

});

</script>


<!----webfonts--->
<link
	href='http://fonts.googleapis.com/css?family=Open+Sans:300,700,800,400,600'
	rel='stylesheet' type='text/css'>
<!---//webfonts--->
</head>
<body>
	<!-- container -->
	<div class="header top-header">
		<div class="container">
			<!-- header -->
			<!-- logo -->
			<div class="logo">
				<a href="index.jsp"><img src="./images/logo.png" title="musicz" /></a>
			</div>
			<!-- logo -->
			<!-- top-nav -->
			<div class="top-nav">
				<span class="menu"> </span>
				<ul>
					<li class="active"><a href="index.jsp">Home<span> </span></a></li>
					<li><a href="awards.jsp">Awards</a></li>
					<tag:notloggedin>
						<li><a href="signin"><img
								src="./images/Sign-in-with-Twitter-darker.png" /></a></li>
					</tag:notloggedin>
					<tag:loggedin>
						<li><a href="#">${name}</a></li>
						<li><a href="./logout">logout</a></li>
					</tag:loggedin>
					<div class="clearfix"></div>
				</ul>
			</div>
			<div class="clearfix"></div>
			<!-- top-nav -->
			<!-- script-for-menu -->
			<script>
				$(document).ready(function() {
					$("span.menu").click(function() {
						$(".top-nav ul").slideToggle(200);
					});
				});
			</script>
			<!-- script-for-menu -->
		</div>
		<!-- header -->
	</div>
	<!-- categories -->
	<div class="categories c-cate">
		<div class="container">
			<div class="categories-left">
				<ul class="options">
					<p>Trends : 
					<c:forEach items="${trends}" var="celebrity">
					<a href="search.do?celebrity=${celebrity.fullName }">#${celebrity.fullName}</a>&nbsp&nbsp&nbsp&nbsp&nbsp
					</c:forEach>
					</p>
				</ul>
			</div>
			<div class="categories-right">
				<form action="search.do" method="POST">
					<input type="text" placeholder="Search here" name="celebrity"
						value="${form.celebrity}" required> <input type="submit"
						name="action" value="Search" />
				</form>
			</div>
			<div class="clearfix"></div>
		</div>
	</div>
	<!-- categories -->
	<!-- content -->
	<div class="content">
		<div class="container">
			<!-- content-left -->
			<div class="col-md-8 content-left">
				<!-- artical-single-page -->
				<div class="artical-details">
					<h2>
						<a href="#">${form.celebrity }</a>
					</h2>
					<!-- artical-details-info -->
					<div class="artical-details-info">
						<div class="artical-details-info-left">

							<div class="grid">
								<div class="imgholder">
									<a href="${photo}"> <img src="${photo}"></a>
								</div>

							</div>

						</div>
						<div class="artical-details-info-right">

							<p>
								<strong> Twitter Followers: </strong><fmt:formatNumber type="number" pattern="###,###,###">${artist.followersCount }</fmt:formatNumber>
							</p>
							<p>
								<strong>Origin:</strong>${ artist.location}
							</p>
							<p>
								<strong>Years active on Twitter :  </strong><fmt:formatDate type="date" 
            value="${artist.createdAt }" /></p>
							</p>
							<div class="dicription">
								<p>
									<strong>Description :</strong>${artist.description }</p>
							</div>
						</div>
						<div class="clearfix"></div>

					</div>
					<!-- artical-details-info -->
				</div>
				<!-- related-articals -->
				<div class="related-articals">
					<h2>How popular among all celebrities?</h2>
					<!-- related-albums -->
					<div class="related-albums">
						<div id="owl-demo1"
							style="border: 1px solid #fff; text-align: center; border-collapse: collapse; text-align: center;">
							&nbsp&nbsp<div id="chart4"></div>
							&nbsp&nbsp<div id="chart3"></div> 
							
						</div>
<!-- 						<div id="chart3"></div>
 -->						
					</div>
				</div>
				<div class="related-articals">
					<h2>Pictures</h2>
					<div class="related-albums">
						<div id="owl-demo1"
							style="border: 1px solid #fff; text-align: center; border-collapse: collapse;">
							<c:forEach items="${flickrs}" var="flickr">
								<a href="${flickr}"> <img src="${flickr}"></a>
							</c:forEach>
						</div>

					</div>
				</div>
			</div>
			<div class="col-md-4 content-right">
				<div class="artical-details">
					<h3>Make your tweets and post photos to twitter!</h3>
						
						
						<a class="twitter-timeline"
							href="https://twitter.com/${twitterName}"
							data-widget-id="566328412265283584" data-screen-name="${twitterName }" data-theme="dark">Tweets
							by ${twitterName}</a>
						<script>
							!function(d, s, id) {
								var js, fjs = d.getElementsByTagName(s)[0], p = /^http:/
										.test(d.location) ? 'http' : 'https';
								if (!d.getElementById(id)) {
									js = d.createElement(s);
									js.id = id;
									js.src = p
											+ "://platform.twitter.com/widgets.js";
									fjs.parentNode.insertBefore(js, fjs);
								}
							}(document, "script", "twitter-wjs");
						</script>
						<br><br>
					
					<p style="color: #d7d7d7;"><li><a href="#">${name}</a></li>
							</p>
				<form action="./post" method="post" enctype="multipart/form-data">
						
						<textarea cols="40" rows="5" name="text"
							style="background-color: #d7d7d7"></textarea>
						<font color="white"> <span id='remainingC'></span></font>
						<script>$('textarea').keypress(function(){

							    if(this.value.length > 100){
							        return false;
							    }
							    $("#remainingC").html("<font color=\"white\"> Remaining characters : </font>" +(100 - this.value.length));
							});
							</script>
						<table>
							<tr>
								<td><font color="white">Image:</font></td>
								<td colspan="2">
								<input type="file" name="file"
									value="${filename}" /></td>
							</tr>
						</table>
						<br> <input type="submit" name="post" value="Post" /> <input
							type="hidden" name="celebrity" value="${form.celebrity}" />
					</form>
						<tag:notloggedin>
						<a href="signin"><img
							src="./images/Sign-in-with-Twitter-darker.png" /></a>
					</tag:notloggedin>
					<tag:loggedin>
						<a href="./logout">logout</a>
					</tag:loggedin>
					<br><br><p>Note: All tweets made will be prepended with the hashtag #AllAboutGrammmys and #ArtistName for whom you are posting</p>
					
					
				</div>
			</div>
		</div>
		<!-- related-albums -->
	</div>
	<!-- related-articals -->
	<!-- artical-single-page -->
	</div>
	<!-- content -->
	<!-- copy-right -->
	<div class="copy-right">
		<div class="container">
			<p>
				Design by <a href="#">Donuts</a>
			</p>
		</div>
	</div>
	<!-- copy-right -->
	<!-- container -->
</body>
</html>




