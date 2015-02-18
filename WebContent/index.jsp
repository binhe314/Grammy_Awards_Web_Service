<!DOCTYPE HTML>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@taglib prefix="tag" tagdir="/WEB-INF/tags"%>
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
					<li class="active"><a href>${message }</a><li>
					<li class="active"><a href="index.jsp">Home<span>
						</span></a></li>
					<li><a href="awards.jsp">Awards</a></li>
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
	<!-- banner -->
	<div class="banner">
		<!-- slider -->
		<!--- img-slider --->
		<div class="img-slider">
			<!----start-slider-script---->
			<script src="./js/responsiveslides.min.js"></script>
			<script>
				// You can also use "$(window).load(function() {"
				$(function() {
					// Slideshow 4
					$("#slider4").responsiveSlides(
							{
								auto : true,
								pager : true,
								nav : true,
								speed : 500,
								namespace : "callbacks",
								before : function() {
									$('.events').append(
											"<li>before event fired.</li>");
								},
								after : function() {
									$('.events').append(
											"<li>after event fired.</li>");
								}
							});

				});
			</script>
			<!----//End-slider-script---->
			<!-- Slideshow 4 -->
			<div id="top" class="callbacks_container">
				<ul class="rslides" id="slider4">
					<li><img class="img-responsive" src="./images/slide1.jpg"
						alt="">
						<div class="slider-caption">
							<div class="slider-caption-inner">
								<h1>
									the 57th <span>GRAMMY's</span>
								</h1>
								<p>Get interactive with this year's winners.</p>
								<a class="caption-btn" href="awards.jsp">ReadMore</a>
							</div>
						</div></li>
					<li><img src="./images/slide2.jpg" alt="">
						<div class="slider-caption">
							<div class="slider-caption-inner">
								<h1>
									the 57th <span>GRAMMY's </span>
								</h1>
								<p>Get interactive with this year's winners.</p>
								<a class="caption-btn" href="#">ReadMore</a>
							</div>
						</div></li>
					<li><img src="./images/slide3.jpg" alt="">
						<div class="slider-caption">
							<div class="slider-caption-inner">
								<h1>
									the 57th <span>GRAMMY's</span>
								</h1>
								<p>Winning four Grammys, the biggest winner this year - Sam Smith</p>
								<a class="caption-btn" href="#">ReadMore</a>
							</div>
						</div></li>
				</ul>
			</div>
			<div class="clearfix"></div>
		</div>
		<!-- slider -->
	</div>
	<!-- banner -->
	<!-- categories -->
	<div class="categories">
		<div class="container">
			<div class="categories-left">
				<ul class="options">
					
				</ul>
			</div>
			
			<div class="categories-right">
		
				<form action="search.do" method="POST">
				<input type="text" placeholder="Search here" name="celebrity" value="${form.celebrity}" required> 
				<input type="submit" name="action" value="Search" />
				</form>
			</div>
			<div class="clearfix"></div>
		</div>
	</div>
	<!-- categories -->
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