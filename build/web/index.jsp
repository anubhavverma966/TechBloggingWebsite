<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 <%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
	<!-- css -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<style>
		.banner-background{
			clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 93%, 65% 98%, 24% 94%, 0 98%, 0 0);
		}
	</style>
</head>
<body>
  
    
	<!-- navbar -->
	<%@include file="normal_navbar.jsp" %>
	
	<!-- banner -->
	<div class="container-fluid p-0 m-0">
		<div class="jumbotron primary-color text-white banner-background">
			<div class= "container">
				<h3 class= "display-3">Welcome to TechBloging</h3>
				<p>Welcome to world of technical blogs. A programming language is a system of notation for writing computer programs. Most programming languages are text-based formal languages, but they may also be graphical. They are a kind of computer language. </p>
				
				<a href= "register_page.jsp" class= "btn btn-outline-light btn-lg"><span class= "fa fa-user-plus"></span>  Start, It's Free</a>
				<a href="login_page.jsp" class= "btn btn-outline-light btn-lg"><span class= "fa fa-user-circle fa-spin"></span>  Login</a>
			</div>
		</div>
	</div>
	
	<br>
	
	<!-- cards -->
	<div class= "container">
		<div class= "row mb-2">
			<div class= "col-md-4 mb-4">
				<div class="card" >
				  
				  <div class="card-body">
				    <h5 class="card-title">Java Programming</h5>
				    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
				    <a href="#" class="btn primary-color text-white">Read More</a>
				  </div>
				</div>
			</div>
			<div class= "col-md-4 mb-4">
				<div class="card" >
				  
				  <div class="card-body">
				    <h5 class="card-title">Java Programming</h5>
				    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
				    <a href="#" class="btn primary-color text-white">Read More</a>
				  </div>
				</div>
			</div>
			<div class= "col-md-4 mb-4">
				<div class="card" >
				  
				  <div class="card-body">
				    <h5 class="card-title">Java Programming</h5>
				    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
				    <a href="#" class="btn primary-color text-white">Read More</a>
				  </div>
				</div>
			</div>
		</div>
		
		
		<div class= "row">
			<div class= "col-md-4 mb-4">
				<div class="card" >
				  
				  <div class="card-body">
				    <h5 class="card-title">Java Programming</h5>
				    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
				    <a href="#" class="btn primary-color text-white">Read More</a>
				  </div>
				</div>
			</div>
			<div class= "col-md-4 mb-4">
				<div class="card" >
				  
				  <div class="card-body">
				    <h5 class="card-title">Java Programming</h5>
				    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
				    <a href="#" class="btn primary-color text-white">Read More</a>
				  </div>
				</div>
			</div>
			<div class= "col-md-4 mb-4">
				<div class="card" >
				  
				  <div class="card-body">
				    <h5 class="card-title">Java Programming</h5>
				    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
				    <a href="#" class="btn primary-color text-white">Read More</a>
				  </div>
				</div>
			</div>
		</div>
		
	</div>
	
	<!-- javascripts -->
	<script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="js/myjs.js" type="text/javascript"></script>
</body>
</html>