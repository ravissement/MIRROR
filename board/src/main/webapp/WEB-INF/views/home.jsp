<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<html>
<head>
	<title>Home</title>
</head>
<body>

<%@ include file="include/header.jsp" %>

<div class="container" >
	
	<div class="jumbotron" >
		<h1 style="color:white;">It's your MIRROR</h1>
		<p>Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui.</p>
		<p>Safari exhibits a bug in which resizing your browser horizontally causes rendering errors in the justified nav that are cleared upon</p>
		<c:if test="${userJoinName != null}">
			<script>
				alert("가입을 축하드립니다.")
			</script>
		</c:if>
	</div>
	
	<div style="margin: 5%;"></div>	
	
	<div class="row">
	  <div class="col-lg-4">
	    <h2>Safari bug warning!</h2>
	    <br />
	    <p class="text-danger">As of v8.0, Safari exhibits a bug in which resizing your browser horizontally causes rendering errors in the justified nav that are cleared upon refreshing.</p>
	    <p>Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui. </p>
	    <p><a>View details »</a></p>
	  </div>
	  <div class="col-lg-4">
	    <h2>close</h2>
	    <p>Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui. </p>
	    <p><a>View details »</a></p>
	 </div>
	  <div class="col-lg-4">
	    <h2>Heading</h2>
	    <p>Donec sed odio dui. Cras justo odio, dapibus ac facilisis in, egestas eget quam. Vestibulum id ligula porta felis euismod semper. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa.</p>
	    <p><a>View details »</a></p>
	  </div>
	</div>
	
	
	<div style=" width:100%; margin: 10px;">
		<div id="carousel-example-generic" class="carousel slide" >
			<ol class="carousel-indicators">
				<li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
				<li data-target="#carousel-example-generic" data-slide-to="1"></li>
				<li data-target="#carousel-example-generic" data-slide-to="2"></li>
			</ol>
			<div class="carousel-inner" role="listbox">
				<div class="item active">
					<img src="https://images.unsplash.com/photo-1507835661088-ac1e84fe645f?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1429&q=80" style="width:100%; height:700px;  object-fit: cover;">
					<div class="carousel-caption" style="color:black;">
					</div>
				</div>
				<div class="item">
					<img src="https://images.unsplash.com/photo-1612537784037-898eb4583c35?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1267&q=80" style="width:100%; height:700px; object-fit: cover;">
					<div class="carousel-caption" style="color:black;">
					</div>
				</div>
				<div class="item">
					<img src="https://images.unsplash.com/photo-1469334031218-e382a71b716b?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1950&q=80" style="width:100%; height:700px; object-fit: cover;">
					<div class="carousel-caption" style="color:black;">
					</div>
				</div>
			</div>
			<!-- 왼쪽 화살표 버튼 -->
			<!-- href는 carousel의 id를 가르킨다. -->
			<a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
			<!-- 왼쪽 화살표 -->
				<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
			</a>
			<!-- 오른쪽 화살표 버튼 -->
			<!-- href는 carousel의 id를 가르킨다. -->
			<a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
			<!-- 오른쪽 화살표 -->
				<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
			</a>
		</div>
	</div>

 <%@ include file="include/footer.jsp" %>

</div>



</body>
</html>
