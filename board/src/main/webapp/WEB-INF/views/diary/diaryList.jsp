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


<head>
<meta charset="UTF-8">
<title>userDiary</title>

<style>
.diaryQuestion { font-weight: bold; font-size: 2em;}
.diaryQuestionEng { font-weight: bold; font-size: 1em; color:#969696		}
.diaryAnswerP {width:100%; text-align: right; }
.writeContent {width:99%; height:200px; overflow:hidden; border:none; font-size: 1.3em; background-color:transparent;  resize: none;}
.writeContent:focus {outline:none; }
.answerBtn {font-weight: bold;}
</style>
</head>
<body>

<%@ include file="../include/header.jsp" %>

<div class="container">
	<br>
	<p><a class="diaryQuestion">${diaryQuestion.diaryQuestion}</a></p>
	<p class="diaryQuestionEng">| ${diaryQuestion.diaryQuestionEng}</p>
	<!-- <p class="diaryQuestionEng">By ${diaryQuestion.user_id}</p>  -->
	<hr>
	<form name="aform" method="post" action="/diary/diaryWrite">
		<input type="hidden" name="diaryYear" value="" />
		<input type="hidden" name="diaryMonth" value="${diaryQuestion.diaryMonth}" />
		<input type="hidden" name="diaryDay" value="${diaryQuestion.diaryDay}" />
		<input type="hidden" name="user_id" value="${member.user_id}" />
		<p><textarea class="writeContent" placeholder="Write this." name="diaryAnswer"></textarea></p>	
	</form>
	<p class="diaryAnswerP"><a class="answerBtn" href="#" id="answerBtn">저장</a></p>
	
	<table class="table" style="margin-top:50px;" id="userListViewTable">
		<tbody id="ele">
			<c:forEach items="${diaryList}" var="diaryList">
				<tr>
					<td style="line-height:1.5em;">
						<a href="#" style="font-size:1.5em;">${diaryList.diaryYear} | ${diaryList.diaryAnswer}</a> <br>
						<fmt:formatDate value="${diaryList.regDate}" pattern="yyyy-MM-dd HH:mm:ss" />
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	
</div>    

</body>
<script>

var today = new Date(); 
var date = new Date();

$('#answerBtn').click(function () {
	//alert("click");	
	if(!$('textarea[name=diaryAnswer]').val()) {
		alert("내용을 입력해주세요.");
		$('textarea[name=diaryAnswer]').focus();
		return false;
	}
	
	$('input[name=diaryYear]').val(today.getFullYear());
	var queryString = $('form[name=aform]').serialize();
	
	$.ajax({
        url: '/diary/diaryWrite',
        type: 'POST',
        data : queryString,
        dataType : 'json',
        success: function(data){
					if(data == 1) {
						alert("저장되었습니다.");
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