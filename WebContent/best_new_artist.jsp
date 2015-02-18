<!DOCTYPE HTML>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@taglib prefix="tag" tagdir="/WEB-INF/tags"%>
<%@ page import ="controller.DetailAction" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<html>
<head>
<title>All about the 57th Grammy's</title>
<link href="./css/bootstrap.css" rel='stylesheet' type='text/css' />
<link href="./css/style.css" rel='stylesheet' type='text/css' />
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="./js/jquery.min.js"></script>
<!--Load the AJAX API-->
<script type="text/javascript"
	src="https://www.google.com/jsapi?autoload={'modules':[{'name':'visualization','version':'1','packages':['corechart']}]}"></script>

<!-- Custom Theme files -->
<!-- Custom Theme files -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="application/x-javascript">
	

	 addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } 


</script>

<!-- draw chart to show change of follower number -->
<script type="text/javascript">

      // Load the Visualization API and the piechart package.
      google.load('visualization', '1.0', {'packages':['corechart']});

      // Set a callback to run when the Google Visualization API is loaded.
      google.setOnLoadCallback(drawChart);

      // Callback that creates and populates a data table,
      // instantiates the pie chart, passes in the data and
      // draws it.
      function drawChart() {

    	  var data = google.visualization.arrayToDataTable([
    	  	['Best New Artists', 'Number of Followers', { role: 'style' }],
    	  	['Sam Smith',<%= DetailAction.getFollowers(request,"Sam Smith")%>,'gold'],
		    ['Iggy Azalea', <%= DetailAction.getFollowers(request,"Iggy Azalea")%>,'color: gray'],
		    ['Bastille', <%= DetailAction.getFollowers(request,"Bastille")%>,'color: gray'],
		    ['Brandy Clark', <%= DetailAction.getFollowers(request,"Brandy Clark")%>,'color: gray'],
		    ['HAIM', <%= DetailAction.getFollowers(request,"HAIM")%>,'color: gray'],
    	  ]);
  
          var options = {
            width: 700,
            height: 400,
            hAxis: {
              title: 'Best New Artists Nominees',
            },
            vAxis: {
              title: 'Number of Followers'
            },
            legend: 'none',
            colors:['gold', 'gray']
          };

          var chart = new google.visualization.ColumnChart(
            document.getElementById('chart1'));

          chart.draw(data, options);
      }
</script>


</script>
<!----webfonts--->
<link
	href='http://fonts.googleapis.com/css?family=Open+Sans:300,700,800,400,600'
	rel='stylesheet' type='text/css'>
<!---//webfonts--->
</head>
<body>

	<!-- container -->
	<div class="header">
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
					<li><a href="index.jsp">Home<span> </span></a></li>
					<li class="active"><a href="awards.jsp">Awards</a></li>
					<tag:notloggedin>
						<li><a href="signin"><img
								src="./images/Sign-in-with-Twitter-darker.png" /></a></li>
					</tag:notloggedin>
					<tag:loggedin>
						<li><a href="#">${twitter.screenName}</a></li>
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
	<div class="categories">
		<div class="container">
			<div class="categories-left">
				<ul class="options">
					<a href="search.do?celebrity=bruno_mars">#Bruno Mars</a> &nbsp&nbsp&nbsp&nbsp&nbsp
					<a href="search.do?celebrity=taylor_swift">#Taylor
							Swift</a>&nbsp&nbsp&nbsp&nbsp&nbsp
					<a href="search.do?celebrity=iggy_azalea">#Iggy Azalea</a>&nbsp&nbsp&nbsp&nbsp&nbsp
					<a href="search.do?celebrity=sam_smith">#Sam Smith</a>
			
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
				<h1 style="color: #ecd5af;">Best New Artist</h1>
				<div onclick="location.href='#';" class="artical">
					<div class="col-md-8 artical-right">
						<div class="artical-head">
							<h2>Popularity in Twitter</h2>
							<div class="clearfix"></div>
						</div>
						<div class="clearfix"></div>
						<!-- artical-info -->
						<div class="artical-info">
						
						<!-- Div to show chart (Number of followers) -->
							<div id="chart1"></div>
							<p>Note: Gold = Winner. Gray = Nominees
						</div>
						<!-- artical-info -->
					</div>
					<div class="clearfix"></div>
				</div>
				<!-- artical-end -->
				<div onclick="location.href='#';" class="artical">
					<div class="col-md-4 artical-left">
						<a href="#"><img src="./images/post2.jpg" title="post-name" /></a>
					</div>
					<div class="col-md-8 artical-right">
						<div class="artical-head">
							<h2>
								<a href="search.do?celebrity=sam_smith">Sam Smith</a>
							</h2>
							<div class="clearfix"></div>
						</div>
						<div class="clearfix"></div>
						<!-- artical-info -->
						<div class="artical-info">
							<p>
								<strong>Born:</strong> May,19,1992
							</p>
							<p>
								<strong>Origin:</strong>UK
							</p>
							<p>
								<strong>Genre:</strong>pop, soul, R&B
							</p>
							<p>
								<strong>Occupation(s):</strong>Singer, Songwriter
							</p>
							<p>
								<strong>Years active:</strong> 2007 - present
							</p>
						</div>
						<!-- artical-info -->
					</div>
					<div class="clearfix"></div>
				</div>
				<!-- artical-end -->
				<div onclick="location.href='#';" class="artical">
					<div class="col-md-4 artical-left">
						<a href="#"><img src="./images/post1.jpg" title="post-name" /></a>
					</div>
					<div class="col-md-8 artical-right">
						<div class="artical-head">
							<h2>
								<a href="search.do?celebrity=iggy_azalea">Iggy Azalea</a>
							</h2>
							<div class="clearfix"></div>
						</div>
						<div class="clearfix"></div>
						<!-- artical-info -->
						<div class="artical-info">
							<p>
								<strong>Born:</strong> June,7,1990
							</p>
							<p>
								<strong>Origin:</strong>Australia
							</p>
							<p>
								<strong>Genre:</strong>Hip hop
							</p>
							<p>
								<strong>Occupation(s):</strong>Rapper songwriter model
							</p>
							<p>
								<strong>Years active:</strong> 2011 - present
							</p>
						</div>
						<!-- artical-info -->
					</div>
					<div class="clearfix"></div>
				</div>
				<!-- artical-end -->
				<div onclick="location.href='#';" class="artical">
					<div class="col-md-4 artical-left">
						<a href="#"><img src="./images/post4.jpg" title="post-name" /></a>
					</div>
					<div class="col-md-8 artical-right">
						<div class="artical-head">
							<h2>
								<a href="search.do?celebrity=bastille">Bastille</a>
							</h2>
							<div class="clearfix"></div>
						</div>
						<div class="clearfix"></div>
						<!-- artical-info -->
						<div class="artical-info">
							<p>
								<strong>Origin:</strong>UK
							</p>
							<p>
								<strong>Genre:</strong>Indie pop, indie rock
							</p>
							<p>
								<strong>Occupation(s):</strong>Rock band, Songwriter
							</p>
							<p>
								<strong>Years active:</strong> 2010 – present
							</p>
						</div>
						<!-- artical-info -->
					</div>
					<div class="clearfix"></div>
				</div>
				<!-- artical-end -->
				<div onclick="location.href='#';" class="artical">
					<div class="col-md-4 artical-left">
						<a href="#"><img src="./images/post7.jpg" title="post-name" /></a>
					</div>
					<div class="col-md-8 artical-right">
						<div class="artical-head">
							<h2>
								<a href="search.do?celebrity=brandy clark">Brandy Clark</a>
							</h2>
							<div class="clearfix"></div>
						</div>
						<div class="clearfix"></div>
						<!-- artical-info -->
						<div class="artical-info">
							<p>
								<strong>Born:</strong> 1977
							</p>
							<p>
								<strong>Origin:</strong>US
							</p>
							<p>
								<strong>Genre:</strong>Country
							</p>
							<p>
								<strong>Occupation(s):</strong>Singer, Songwriter
							</p>
							<p>
								<strong>Years active:</strong> 2005 - present
							</p>
						</div>
						<!-- artical-info -->
					</div>
					<div class="clearfix"></div>
				</div>
				<!-- artical-end -->
				<div onclick="location.href='#';" class="artical">
					<div class="col-md-4 artical-left">
						<a href="#"><img src="./images/post8.jpg" title="post-name" /></a>
					</div>
					<div class="col-md-8 artical-right">
						<div class="artical-head">
							<h2>
								<a href="search.do?celebrity=haim">Haim</a>
							</h2>
							<div class="clearfix"></div>
						</div>
						<div class="clearfix"></div>
						<!-- artical-info -->
						<div class="artical-info">
							<p>
								<strong>Origin:</strong>US
							</p>
							<p>
								<strong>Genre:</strong>Pop rock, soft rock, R&amp;B
							</p>
							<p>
								<strong>Occupation(s):</strong>Rock Band, Songwriter
							</p>
							<p>
								<strong>Years active:</strong> 2007 – present
							</p>
						</div>
						<!-- artical-info -->
					</div>
					<div class="clearfix"></div>
				</div>
				<!-- artical-end -->
				<div class="clearfix"></div>
			</div>
			<!-- content-left -->
			<!-- content-right -->
			<div class="col-md-4 content-right">
				<div class="recent-add">
					<!----sreen-gallery-cursual---->
					<div class="sreen-gallery-cursual">
						<!-- requried-jsfiles-for owl -->
						<link href="./css/owl.carousel.css" rel="stylesheet">
						<script src="./js/owl.carousel.js"></script>
						<script>
							$(document).ready(function() {
								$("#owl-demo").owlCarousel({
									items : 1,
									lazyLoad : true,
									autoPlay : true,
									navigation : true,
									navigationText : false,
									pagination : true,
								});
							});
						</script>
						<!-- //requried-jsfiles-for owl -->
						<!-- start content_slider -->
						<div id="owl-demo" class="owl-carousel text-center">
							<div class="item">
								<img class="lazyOwl" data-src="./images/post3.jpg" alt="name">
							</div>
							<div class="item">
								<img class="lazyOwl" data-src="./images/post5.jpg" alt="name">
							</div>
							<div class="item">
								<img class="lazyOwl" data-src="./images/post6.jpg" alt="name">
							</div>
						</div>
						<!--//sreen-gallery-cursual---->
					</div>
				</div>
			</div>
		</div>
		<!-- content -->
		<!-- copy-right -->
		<div class="copy-right">
			<div class="container">
				<p>
					Design by <a href="#">Stella</a>
				</p>
			</div>
		</div>
</body>
</html>