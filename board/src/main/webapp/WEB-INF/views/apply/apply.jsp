<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page session="true" %>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<!DOCTYPE html>
<html>
<style>
	table
	{
	    border: none;
	    text-align:center;
	    width:100%;
	    height: 70%;
	    font-size: 1.4em;
	}
  .diaryQuestion { font-weight: bold; font-size: 1.1em;}
	.diaryQuestionEng { font-weight: bold; font-size: 0.8em; color:#969696		}
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
</style>

<head>
<meta charset="UTF-8">
<title>apply</title>
</head>
<body>

<%@ include file="../include/header.jsp" %>


<div class="container">
	
	<h1>It's your MIRROR</h1>
	<p>Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui.</p>
	<p>Safari exhibits a bug in which resizing your browser horizontally causes rendering errors in the justified nav that are cleared upon</p>
	<p>is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been</p>
	<p>Contrary to popular belief, Lorem Ipsum is not simply random text.</p>
	<br/>
	<p style="text-align: right;"><a>Prod. By ravissement55@gmail.com</a></p>
	
	<div style="height:20%;"></div>
	<form name="uform" method="post" action="/diary/applyQuestion">
		<input type="hidden" name="user_id" value="${member.user_id}" />
		<p>
			Month : 
			<select name="diaryMonth" id="diaryMonth" class="selectpicker">
				<option value="">선택</option>
				<option value="1">1</option>
				<option value="2">2</option>
				<option value="3">3</option>
				<option value="4">4</option>
				<option value="5">5</option>
				<option value="6">6</option>
				<option value="7">7</option>
				<option value="8">8</option>
				<option value="9">9</option>
				<option value="10">10</option>
				<option value="11">11</option>
				<option value="12">12</option>
			</select>
			&nbsp;&nbsp;&nbsp;&nbsp;
			Day : 
			<select name="diaryDay" id="diaryDay">
				<option value="">선택</option>
			</select>
		</p>
			<br />
			<input type="text" name="diaryQuestion" id="diaryQuestion" class="form-control" placeholder="write Question" />
			<br />
			<input type="text" name="diaryQuestionEng" id="diaryQuestionEng" class="form-control" placeholder="write Question in English" />
	</form>
	<br>
	<p style="text-align: center;"><input type="button" id="submitBtn" class="buttonJoinCustom" value="참여하기"/></p>
	
	<div style="height:20%;"></div>



	<%@ include file="../include/footer.jsp" %>
</div>    
</body>

<script>

var today = new Date(); 
var date = new Date();

$('#diaryMonth').change(function() {
	$("#diaryDay").empty();
	var dateCnt = new Date(today.getMonth(), this.value, 0).getDate();
	for(var i=1; i<=dateCnt; i++) {
		  $("#diaryDay").append($("<option>"+i+"</option>"));
	}
	
});

$('#submitBtn').click(function() {
	
	if(!$('#diaryMonth').val()){
		alert("Month를 선택해주세요.");
		$('#diaryMonth').focus();
		return false;
	}
	
	if(!$('#diaryDay').val()){
		alert("Day를 선택해주세요.");
		$('#diaryDay').focus();
		return false;
	}
	
	if(!$('#diaryQuestion').val()){
		alert("Question을 적어주세요.");
		$('#diaryQuestion').focus();
		return false;
	}
	
	if(!$('#diaryQuestionEng').val()){
		alert("QuestionEng을 적어주세요.");
		$('#diaryQuestionEng').focus();
		return false;
	}
	
	var queryString = $('form[name=uform]').serialize();
	
	$.ajax({
        url: '/apply/applyQuestion',
        type: 'POST',
        data : queryString,
        dataType : 'json',
        success: function(data){
					if(data == 1) {
						alert("참여가 완료되었습니다.");
						location.reload();
					}else{
						alert("다시시도 하시기 바랍니다.")
						location.reload();
					}
        },
				error:function(request,status,error){
					alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
	});	
});

</script>

</html>