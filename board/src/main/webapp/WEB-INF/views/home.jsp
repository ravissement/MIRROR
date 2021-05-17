<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Myeongjo&display=swap" rel="stylesheet">
<html>
<head>
	<title>Home</title>
</head>
<body>
<style>
.imgThumb {height: 300px;}
.imgThumb_in {width:90%; height:90%; object-fit: cover;}
.text-space-use {text-overflow: display: inline-block; width: 200px; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;}
.google-nanum {font-family: 'Nanum Myeongjo', serif; font-weight: bold;}
</style>
<%@ include file="include/header.jsp" %>

<div class="container" >
	
		<h1 class="google-nanum">It's your MIRROR</h1>
		<p class="google-nanum">당신의 거울, MIRROR</p>
		<br />
		<p class="google-nanum">소크라테스는 말했습니다. '검토하지 않는 삶은 살만한 가치가 없다.'</p>
		<p class="google-nanum">자신을 검토하는 쉽고, 훌륭한 방법에는 무엇이 있을까요?</p>
		<p class="google-nanum">스스로를 돌아보고, 그 생각들을 글로 옮겨 적어보는 것이라 생각합니다.</p>
		<p class="google-nanum">시끄러운 정보와 지식의 바다속에서 잠시 벗어나, 고요한 이곳에서 온전히 자신과 마주하세요.</p> 
		<p class="google-nanum">공리와 이념도 잠시 내려놓아 보세요. </p> 
		<p class="google-nanum">순수한 자신을 표현해 보세요.</p>
		<p class="google-nanum">적어 내려간 글들은 분명 자신을 비춰주는 무엇보다 근사한 거울이 되어있을 겁니다.</p> 
		<br />
		<p class="google-nanum">자, 이제 당신을 거울에 비춰보세요. 생각보다 괜찮은 사람일 것입니다.</p>
		<br />
		<p style="text-align: right;"> <a>Prod. By ravissement55@gmail.com</a></p>
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
	
	<br>
	<!-- 
	<hr>
	<c:if test="${homeList ne null}">
	<div class="row" style="height:500px;">
	  <c:forEach items="${homeList}" var="homeList">
		  <div class="col-lg-4 imgThumb">
		    <h2 class="text-space-use">${homeList.title}</h2>
		    <p class="text-danger text-space-use">
		    	${homeList.content}
		    </p>
		    <p><a href="/board/view?bno=${homeList.bno}">View details »</a> &nbsp;&nbsp;&nbsp; <a href="#"><span><i class="fas fa-heart" style="font-size: 1.0em;" id="likeExpress"></i>${homeList.likeCnt}</span></a> &nbsp;&nbsp; <a>[${homeList.cnt}]</a></p>
		    
		    <c:if test="${!empty homeList.boardThumbnail}">
		    	<c:if test="${!fn: contains(homeList.boardThumbnail, 'none.png')}">
		    		<img src="/resources/${homeList.boardThumbnail}" class="imgThumb_in"/>
		    	</c:if>		    
		    </c:if>
		  
		  </div>
		  <script>
				console.log("${homeList.title}");
			</script>
	  </c:forEach>
	</div>
  </c:if>
	 -->
 <%@ include file="include/footer.jsp" %>

</div>

<script>
/* 키워드 검색 */
$('#searchBtnGo').click(function () {
	var newForm = $('form[name=searchForm]');
	newForm.append($('<input/>', {type: 'hidden', name: 'user_id', value:'${member.user_id}' })); 
	newForm.append($('<input/>', {type: 'hidden', name: 'num', value:'1' }));
	newForm.appendTo('body');
	newForm.action = "/board/list";
	newForm.submit();	
	
});

</script>

</body>
</html>
