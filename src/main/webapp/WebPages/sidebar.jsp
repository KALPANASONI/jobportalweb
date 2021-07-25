<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home</title>
 <!-- All Plugin Css --> 
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/plugins.css">
		
		<!-- Style & Common Css --> 
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main.css">

</head>
<body>
	
		<!-- Navigation Start  -->
		<nav class="navbar navbar-default navbar-sticky bootsnav">

			<div class="container">      
				<!-- Start Header Navigation -->
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-menu">
						<i class="fa fa-bars"></i>
					</button>
					<a class="navbar-brand" href="index.html"><img src="img/logo.png" class="logo" alt=""></a>
				</div>
				<!-- End Header Navigation -->

				<!-- Collect the nav links, forms, and other content for toggling -->
				<div class="collapse navbar-collapse" id="navbar-menu">
					<ul class="nav navbar-nav navbar-right" data-in="fadeInDown" data-out="fadeOutUp">
							<li><a href="${pageContext.servletContext.contextPath}/addjob">Add Jobs</a></li> 
							<li><a href="${pageContext.servletContext.contextPath}/Jobs">Job List</a></li>
							<li><a href="${pageContext.servletContext.contextPath}/applied">Applied</a></li>
							
						</ul>
				</div><!-- /.navbar-collapse -->
			</div>   
		</nav>
		<!-- Navigation End  -->
		<script type="${pageContext.request.contextPath}/resources/text/javascript" src="js/jquery.min.js"></script>
		<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
		<script type="${pageContext.request.contextPath}/resources/text/javascript" src="js/owl.carousel.min.js"></script>
		<script src="${pageContext.request.contextPath}/resources/js/bootsnav.js"></script>
		<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
</body>
</html>