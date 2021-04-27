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
<style>
.imgThumb {height: 300px;}
.imgThumb_in {width:90%; height:90%; object-fit: cover;}
.text-space-use {text-overflow: display: inline-block; width: 200px; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;}

</style>
<%@ include file="include/header.jsp" %>

<div class="container" >
	
  <c:if test="${homeList ne null}">
	<div class="row" style="height:500px;">
	  <c:forEach items="${homeList}" var="homeList">
		  <div class="col-lg-4 imgThumb">
		    <h2 class="text-space-use">${homeList.title}</h2>
		    <br />
		    <p class="text-danger text-space-use">
		    	${homeList.content}
		    </p>
		    <p><a href="/board/view?bno=${homeList.bno}">View details »</a></p>
		    <img src="/resources/${homeList.boardThumbnail}" class="imgThumb_in"/>
		  </div>
		  <script>
				console.log("${homeList.title}");
			</script>
	  </c:forEach>
	</div>
  </c:if>
	 
		<h1>It's your MIRROR</h1>
		<p>Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui.</p>
		<p>Safari exhibits a bug in which resizing your browser horizontally causes rendering errors in the justified nav that are cleared upon</p>
		<p>is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been</p>
		<p>Contrary to popular belief, Lorem Ipsum is not simply random text.</p>
		<c:if test="${userJoinName != null}">
			<script>
				alert("가입을 축하드립니다.")
			</script>
		</c:if>
	
	<div style="margin: 5%;"></div>
	
	<div style=" width:100%;">
		<div id="carousel-example-generic" class="carousel slide" >
			<ol class="carousel-indicators">
				<li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
				<li data-target="#carousel-example-generic" data-slide-to="1"></li>
				<li data-target="#carousel-example-generic" data-slide-to="2"></li>
			</ol>
			<div class="carousel-inner" role="listbox">
				<div class="item active">
					<img src="https://images.unsplash.com/photo-1549122728-f519709caa9c?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1225&q=80" style="width:100%; height:700px;  object-fit: cover;">
					<div class="carousel-caption" style="color:black;">
					</div>
				</div>
				<div class="item">
					<img src="https://images.unsplash.com/photo-1510172951991-856a654063f9?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80" style="width:100%; height:700px; object-fit: cover;">
					<div class="carousel-caption" style="color:black;">
					</div>
				</div>
				<div class="item">
					<img src="https://images.unsplash.com/photo-1598618443855-232ee0f819f6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=667&q=80" style="width:100%; height:700px; object-fit: cover;">
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
