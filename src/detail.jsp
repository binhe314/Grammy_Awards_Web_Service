<!DOCTYPE HTML>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="tag" tagdir="/WEB-INF/tags"%>
<html>
<head>
<title>All about the 57th Grammy's</title>
<link href="./css/bootstrap.css" rel='stylesheet' type='text/css' />
		<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
		<script src="./js/jquery.min.js"></script>
		 <!-- Custom Theme files -->
		<link href="./css/style.css" rel='stylesheet' type='text/css' />
   		 <!-- Custom Theme files -->
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
	
		<!----webfonts--->
		<link href='http://fonts.googleapis.com/css?family=Open+Sans:300,700,800,400,600' rel='stylesheet' type='text/css'>
		<!---//webfonts--->
		</head>
	<body>
		<!-- container -->
		<div class="header top-header">
		<div class="container">
			<!-- header -->
				<!-- logo -->
				<div class="logo">
					<a href="index.html"><img src="./images/logo.png" title="musicz" /></a>
				</div>
				<!-- logo -->
				<!-- top-nav -->
				<div class="top-nav">
					<span class="menu"> </span>
					<ul>
                        <li><a href="index.html">Home<span> </span></a></li>
                        <li class="active"><a href="nominees.html">Nominees</a></li>
                        <li><a href="#">News</a></li>
                        <li><a href="#">Photos</a></li>
                        <li><a href="social.html">Contact Us</a></li>
                        <div class="clearfix"> </div>
                    </ul>
				</div>
				<div class="clearfix"> </div>
				<!-- top-nav -->
				<!-- script-for-menu -->
				<script>
					$(document).ready(function(){
						$("span.menu").click(function(){
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
						<li><a href="#">Bruno Mars</a></li>
                        <li><a href="#">Taylor Swift</a></li>
                        <li><a href="#">Katy Perry</a></li>
                        <li><a href="#">Iggy Azalea</a></li>
                        <li><a href="#">Sam Smith</a></li>
					</ul>
			</div>
				<div class="categories-right">
				//colin*********************************************
					<form action="flickr.do" method="POST">
						<table>
							<tr>
								<td style="font-size: x-large">Search Celebrity:</td>
								<td><input type="text" name="name" value="${form.name}" /></td>
							</tr>
							
							<tr>
								<td colspan="2" align="center"><input type="submit"
									name="action" value="Search" /></td>
							</tr>
						</table>
					</form>
				</div>
				<div class="clearfix"> </div>
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
				//Colin***************************************************************
					<h2><a href="#">${ userInput }</a></h2>
					<!-- artical-details-info -->
					<div class="artical-details-info">
						<div class="artical-details-info-left">
							<a href="#"><img src="./images/post1.jpg" title="name" /></a>
						</div>
						<div class="artical-details-info-right">
							<p><strong>Born:</strong> June,7,1990</p>
                            <p><strong>Origin:</strong>Australia</p>
                            <p><strong>Genre:</strong>Hip hop</p>
                            <p><strong>Occupation(s):</strong>Rapper songwriter model</p>
                            <p><strong>Years active:</strong> 2011 - present</p>
							<div class="dicription">
								<p><strong>Description :</strong>Amethyst Amelia Kelly (born 7 June 1990), better known by her stage name Iggy Azalea, is an Australian rapper, songwriter, and model from Mullumbimby, New South Wales. Her "Fancy" went on to reach number one on the U.S. Billboard Hot 100 chart, with Azalea becoming only the fourth solo female rapper ever to top the Hot 100.</p>
							</div>
						</div>
						<div class="clearfix"> </div>
						
					</div>
					<!-- artical-details-info -->
				</div>
				<!-- related-articals -->
				<div class="related-articals">
					<h2>Tweets about her</h2>
					<!-- related-albums -->
					<div class="related-albums">
						<div id="owl-demo1" style="border: 1px solid #fff; text-align: center; border-collapse: collapse;">
							<p> Who is talking about her </p>
							<img src="img/map.png" width=600px >
							<img src="img/pie.jpg" width=600px>
							<p></p>
						  	<p> How do they feel about her </p>
						  	<img src="img/pie.jpg" width=600px>
						  	<img src="img/iggy.png" width=600px>
						</div>
								 </div>
					          </div>
				<div class="related-articals">
					<h2>Her Pictures</h2>
					<div class="related-albums" >
						<div id="owl-demo1" style="border: 1px solid #fff; text-align: center; border-collapse: collapse;">
						  <a href="img/iggy3.png" target="_blank"><img src="img/iggy2.png" width=600px;></a>
						</div>
								 </div>
					          </div>
					   </div>
						
					</div>
					<!-- related-albums -->
				</div>
				<!-- related-articals -->
				<!-- artical-single-page -->
		</div>
		<!-- content -->
		<!-- footer -->
		<div class="footer">
						<div class="container">
							<div class="footer-grids">
								<div class="col-md-3">
									<div class="footer-grid">
										<h5>About musicz</h5>
										<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis lobortis, urna a aliquam rhoncus,</p>
										<p> Ut ultrices diam enim, eget consectetur elit iaculis eu</p>
									</div>
								</div>
								<div class="col-md-3">
									<div class="footer-grid f-blog">
										<h5>Form the Blog</h5>
										<div class="f-blog-artical">
											<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
											<span>March 20,2014</span>
										</div>
										<div class="f-blog-artical f-blog-artical1">
											<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
											<span>March 20,2014</span>
										</div>
									</div>
								</div>
								<div class="col-md-3">
									<div class="footer-grid site-map">
										<h5>Site Map</h5>
										<ul>
											<li><a href="index.html"><span> </span>Home</a></li>
											<li><a href="404.html"><span> </span>News</a></li>
											<li><a href="albums.html"><span> </span>albums</a></li>
											<li><a href="404.html"><span> </span>portfolio</a></li>
											<li><a href="contact.html"><span> </span>Contact</a></li>
										</ul>
									</div>
								</div>
								<div class="col-md-3">
									<div class="footer-grid f-gallery">
										<h5>Form the portfolio</h5>
										<div class="f-gallery-grids">
											<div class="f-gallery-grid">
												<ul>
													<li><a href="#"><img src="./images/post1.jpg" title="name"></a></li>
													<li><a href="#"><img src="./images/post2.jpg" title="name"></a></li>
													<li><a href="#"><img src="./images/post3.jpg" title="name"></a></li>
													<li><a href="#"><img src="./images/post4.jpg" title="name"></a></li>
													<li><a href="#"><img src="./images/post5.jpg" title="name"></a></li>
													<li><a href="#"><img src="./images/post6.jpg" title="name"></a></li>
													<div class="clearfix"> 
												</div></ul>
											</div>
										</div>
									</div>
								</div>
								<div class="clearfix"> </div>
							</div>
						</div>
					</div>
		<!-- footer -->
		<!-- copy-right -->
		<div class="copy-right">
			<div class="container">
				<p>Design by <a href="http://w3layouts.com/">W3layouts</a></p>
			</div>
		</div>
		<!-- copy-right -->
		<!-- container -->
	</body>
</html>




