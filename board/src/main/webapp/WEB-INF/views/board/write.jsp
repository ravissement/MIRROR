<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 작성</title>
</head>
<body>

<style>
	.titleInput {border:none; height:100px; width:100%; font-size: 3em;}
	.titleInput:focus {outline:none; }
	.subTitleInput {border:none; width:100%; font-size: 1em;}
	.subTitleInput:focus {outline:none; }
	.writeContent {width:99%; overflow:hidden; border:none;}
	.writeContent:focus {outline:none; }
	.btnSort-set{ text-align:right; font-weight:bold; }
</style>

<%@ include file="../include/header.jsp" %>

<c:if test="${!empty writeMessage}">
	<script>
		alert('${writeMessage}');
		location.href="/";
	</script>
</c:if>

<div class="container">
	<form name="wform" method="post" class="form-signin" style="margin-top:50px;">
	<input type="hidden" name="writer" value="${member.user_id}" />
	<div>
		<input type="text" name="title" placeholder="제목을 입력하세요." class="titleInput" maxlength="49">
	</div>
	<div>
		<input type="text" name="subTitle" placeholder="소제목을 입력하세요." class="subTitleInput" maxlength="49">
	</div>
	<div class="btnSort-set">
		<a href="#" id="writeBtn">저장</a>
	</div>
	<hr/>
	<div style="margin-top:3%;">
		<textarea style="width:100%; height:100%;" rows="30" name="content" class="writeContent" id="content" class="form-control" placeholder="It's your mirror.." maxlength="10000000"></textarea>
	</div>
	
	</form>
</div>

<script type="text/javascript">


//var textEle = $('textarea');

//adjustHeight();
/*
textEle.on('keyup', function() {
  adjustHeight();
});

function adjustHeight() {
  var textEle = $('textarea');
  textEle[0].style.height = 'auto';
  var textEleHeight = textEle.prop('scrollHeight');
  textEle.css('height', textEleHeight);
};
*/
$('#writeBtn').click(function(){
	
	var myform = document.forms["wform"];
	myform.action = "/board/write";
	myform.submit();
});

</script>


</body>
</html>