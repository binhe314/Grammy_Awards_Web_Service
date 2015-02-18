<!DOCTYPE HTML>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@taglib prefix="tag" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>All about the 57th Grammy's</title>
<link href="./css/bootstrap.css" rel='stylesheet' type='text/css' />
<link href="./css/style.css" rel='stylesheet' type='text/css' />
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="./js/jquery.min.js"></script>
<!-- Custom Theme files -->
<!-- Custom Theme files -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="application/x-javascript">
	
	
	

	 addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } 




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
						<%-- <li><a href="#">${twitter.screenName}</a></li> --%>
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
	<div class="categories">
		<div class="container">
			<div class="categories-left">
				<ul class="options">
					<p>
						Trending :
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
				<div onclick="location.href='#';" class="artical">
					<div class="col-md-8 artical-right">
						<div class="artical-head">
							<a href="best_new_artist.jsp"><h2>BEST NEW ARTIST</h2>(click
								to read more)</a> <br>
							<h3>
								<a href="search.do?celebrity=sam_smith">Sam Smith</a>
							</h3>
							<div class="clearfix"></div>
						</div>
						<div class="clearfix"></div>
						<!-- artical-info -->
						<div class="artical-info">
							<p>Label: Capitol Records</p>
						</div>
						<!-- artical-info -->
					</div>
					<div class="clearfix"></div>
				</div>
				<!-- artical-end -->
				<div onclick="location.href='#';" class="artical">
					<div class="col-md-8 artical-right">
						<div class="artical-head">
							<h2>Record of the Year</h2>
							<br>
							<h3>
								Stay With Me - <a href="search.do?celebrity=sam_smith">Sam
									Smith</a>
							</h3>
							<div class="clearfix"></div>
						</div>
						<div class="clearfix"></div>
						<!-- artical-info -->
						<div class="artical-info">
							<p>Steve Fitzmaurice, Rodney Jerkins &amp; Jimmy Napes,
								producers; Steve Fitzmaurice, Jimmy Napes &amp; Steve Price,
								engineers/mixers; Tom Coyne, mastering engineer</p>
						</div>
						<!-- artical-info -->
					</div>
					<div class="clearfix"></div>
				</div>
				<!-- artical-end -->
				<div onclick="location.href='#';" class="artical">
					<div class="col-md-8 artical-right">
						<div class="artical-head">
							<h2>ALBUM OF THE YEAR</h2>
							<br>
							<h3>
								Morning Phase - <a href="search.do?celebrity=beck">Beck</a>
							</h3>
							<div class="clearfix"></div>
						</div>
						<div class="clearfix"></div>
						<!-- artical-info -->
						<div class="artical-info">
							<p>Beck Hansen, producer; Tom Elmhirst, David Greenbaum,
								Florian Lagatta, Cole Marsden Greif-Neill, Robbie Nelson,
								Darrell Thorp, Cassidy Turbin & Joe Visciano, engineers/mixers;
								Bob Ludwig, mastering engineer</p>
						</div>
						<!-- artical-info -->
					</div>
					<div class="clearfix"></div>
				</div>
				<!-- artical-end -->
				<div onclick="location.href='#';" class="artical">
					<div class="col-md-8 artical-right">
						<div class="artical-head">
							<h2>BEST POP SOLO PERFORMANCE</h2>
							<br>
							<h3>
								Happy (Live) - <a href="search.do?celebrity=pharrell_williams">Pharrell
									Williams</a>
							</h3>
							<div class="clearfix"></div>
						</div>
						<div class="clearfix"></div>
						<!-- artical-info -->
						<div class="artical-info">
							<p>Label: Columbia Records</p>
						</div>
						<!-- artical-info -->
					</div>
					<div class="clearfix"></div>
				</div>
				<!-- artical-end -->
				<div onclick="location.href='#';" class="artical">
					<div class="col-md-8 artical-right">
						<div class="artical-head">
							<h2>BEST POP DUO PERFORMANCE</h2>
							<br>
							<h3>
								Say Something - <a href="Detail.do?name=a_great_big_world">A
									Great Big World</a> With <a
									href="search.do?celebrity=Christina_Aguilera">Christina
									Aguilera</a>
							</h3>
							<div class="clearfix"></div>
						</div>
						<div class="clearfix"></div>
						<!-- artical-info -->
						<div class="artical-info">
							<p>Label: Epic Records</p>
						</div>
						<!-- artical-info -->
					</div>
					<div class="clearfix"></div>
				</div>
				<!-- artical-end -->
				<div onclick="location.href='#';" class="artical">
					<div class="col-md-8 artical-right">
						<div class="artical-head">
							<h2>BEST R&amp;B SONG</h2>
							<br>
							<h3>
								Drunk In Love - <a href="search.do?celebrity=beyonce">Beyonce</a>
							</h3>
							<div class="clearfix"></div>
						</div>
						<div class="clearfix"></div>
						<!-- artical-info -->
						<div class="artical-info">
							<p>Label: Columbia Records</p>
						</div>
						<!-- artical-info -->
					</div>
					<div class="clearfix"></div>
				</div>
				<!-- artical-end -->
				<div onclick="location.href='#';" class="artical">
					<div class="col-md-8 artical-right">
						<div class="artical-head">
							<h2>BEST RAP/SUNG COLLABORATION</h2>
							<br>
							<h3>
								The Monster - <a href="search.do?celebrity=eminem">Eminem</a>
								Featuring <a href="search.do?celebrity=rihanna">Rihanna</a>
							</h3>
							<div class="clearfix"></div>
						</div>
						<div class="clearfix"></div>
						<!-- artical-info -->
						<div class="artical-info">
							<p>Track from: The Marshall Mathers LP2</p>
							<p>Label: Aftermath</p>
						</div>
						<!-- artical-info -->
					</div>
					<div class="clearfix"></div>
				</div>
				<!-- artical-end -->
				<div onclick="location.href='#';" class="artical">
					<div class="col-md-8 artical-right">
						<div class="artical-head">
							<h2>BEST COUNTRY ALBUM</h2>
							<br>
							<h3>
								Platinum - <a href="search.do?celebrity=miranda_lambert">Miranda
									Lambert</a>
							</h3>
							<div class="clearfix"></div>
						</div>
						<div class="clearfix"></div>
						<!-- artical-info -->
						<div class="artical-info">
							<p>Label: RCA Nashville</p>
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
				<div class="owl-wrapper-outer">
					<a class="twitter-timeline"
						href="https://twitter.com/AllAboutGrammy"
						data-widget-id="566328412265283584"
						data-screen-name="AllAboutGrammy" data-theme="dark"></a>
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