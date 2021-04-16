<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>

<style>
	body {
	    background-color: #eee;
	    font-family: "Helvetica Neue",Helvetica,Arial,sans-serif;
	    font-size: 14px;
	    line-height: 1.42857143;
	    color: #333;
	    margin: 0;
		display: block;
		
	}
	* {box-sizing: border-box;}
	:after, :before { box-sizing: border-box;}
	.buttonJoinCustom {
		width:100px;
    background-color: #646496;
    border: none;
    color:#fff;
    padding: 15px 0;
    text-decoration: none;
    display: inline-block;
    font-size: 15px;
    cursor: pointer;
		border-radius:10px;
		margin-bottom: 5px;
	}
	.buttonJoinCustom:hover {
	    background-color: #14148C;
	}
	.loginContainer{text-align: center; margin:20% 0 5% 0; }
</style>

<body>
<c:if test="${loginResult eq 'X'}">
	<script type="text/javascript">
		alert("해당하는 아이디가 없습니다.");
	</script>
</c:if>

<%@ include file="../include/header.jsp" %>
	
<div class="container">
	<form name="lform" method="post" action="/user/goLogin" class="form-signin">
		<div class="loginContainer">	
			<h2 class="form-signin-heading">Please Login</h2>
		</div>
			<input type="text" name="user_id" class="form-control" placeholder="ID" maxlength="12" style="width:40%; margin-left:30%;"/> <br/>
			<input type="password" name="user_pw" class="form-control" placeholder="Password" maxlength="16" style="width:40%; margin-left:30%;"/> <br/>
		<p style="text-align: center;"><input type="button" id="submitBtn" class="buttonJoinCustom" value="Login"/></p>
	</form>
</div>
<script>
$('#submitBtn').click(function(){

	var user_id=	$('input[name=user_id]').val();
	var user_pswd= $('input[name=user_pw]').val();

	if (!user_id){
		alert("아이디를 입력하십시오.");
		$('input[name=user_id]').focus();
		return false;
	}
	/*
	var idRule= /^[a-zA-Z0-9]{4,12}$/;
	if (!idRule.test(user_id)) {
		alert("아이디를 확인해 주십시오\n8-12자의 영문 대소문자와 숫자만 가능합니다2.");
		$('input[name=user_id]').focus();
		return false;
	}
	*/
	if (!user_pswd){
		alert("패스워드를 입력하십시오.");
		$('input[name=user_pw]').focus();
		return false;
	}

	var reg = /^(?=.*?[a-zA-Z])(?=.*?[0-9]).{8,16}$/;
	if( !reg.test(user_pswd)) {
		alert("비밀번호는 8자 이상이어야 하며, 영어와 숫자가 함께 포함되어야 합니다.");
		$('input[name=user_pw]').focus();
		return false;
	};

	$('form[name=lform]').submit();

});

</script>
</body>
</html>