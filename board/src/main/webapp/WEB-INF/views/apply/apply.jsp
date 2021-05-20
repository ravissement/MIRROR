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
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Myeongjo&display=swap" rel="stylesheet">
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
	.google-nanum {font-family: 'Nanum Myeongjo', serif; font-weight: bold;}
</style>

<head>
<meta charset="UTF-8">
<title>apply</title>
</head>
<body>

<%@ include file="../include/header.jsp" %>


<div class="container">
	
	<h1 class="google-nanum">It's your MIRROR</h1>
	<p class="google-nanum">당신의 거울, MIRROR</p>
	<br />
	<p class="google-nanum">여러분의 참여를 기대합니다.</p>
	<br />
	<p class="google-nanum">미러는 이용자분들께 정보와 해답을 제공해주는 곳이 아닌 여러분 모두에게 질문을 던지는 곳이였으면 합니다.</p>
	<p class="google-nanum">대답에 선결되는 질문의 중요도를 저는 오래전부터 고심해왔습니다.</p>
	<p class="google-nanum">섣불리 해답을 내놓을 수 있는 능력은 없지만, 속으로 천천히 삭힌 질문들은 책속의 글귀보다, 과학의 법칙보다 중요할 때가 종종 있는 것 같습니다.</p> 
	<p class="google-nanum">각자가 갇고 있는 소중한 혹은 단순한 그 질문들을 미러는 기다리고 있습니다.</p> 
	<p class="google-nanum">짧지만 많은 생각을 불러일으키는 질문들을 던져주시면 감사하겠습니다.</p>
	<br />
	<p class="google-nanum">P.S. 참여한 질문은 확인 후 한줄일기의 질문으로 등록됩니다.</p>
	<br/>
	<p style="text-align: right;"><a>Prod. By ravissement55@gmail.com</a></p>
	
	<div style="height:20%;"></div>
	<p class="diaryQuestionEng">ex)</p>
	<p class="diaryQuestion"><a>진실을 쫓는가? 사실을 쫓는가?</a></p>
	<p class="diaryQuestionEng">Are you after the truth? Are you chasing the facts?</p>
	<br>
	<p class="diaryQuestion"><a>나에게 시간은 .....다</a></p>
	<p class="diaryQuestionEng">Time is ..... for me</p>
	<hr>
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
	
	<div style="height:10%;"></div>
	
	<a class="diaryQuestion">[올려주신 질문들]</a>
	<table class="table" style="margin-top:50px;" id="userListViewTable">
		<tbody id="ele">
			<c:forEach items="${applyList}" var="applyList">
				<tr>
					<td style="text-align: left; height:150px;">
						<a class="diaryQuestion" href="/apply/view?ano=${applyList.ano}">${applyList.diaryQuestion}</a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [${applyList.cnt}] <br>
						<span class="diaryQuestionEng">${applyList.diaryQuestionEng}</span> <br>
						${applyList.user_id} /
						<span style="font-size:0.6em;"><fmt:formatDate value="${applyList.regDate}" pattern="yyyy-MM-dd" /></span> <br />
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	
	
	<div style="text-align:center;">
		<c:if test="${page.prev}">
			<span>[ <a href="/apply/apply?num=${page.startPageNum - 1}${page.searchTypeKeyword}">이전</a> ]</span>
		</c:if>
		
		<c:forEach begin="${page.startPageNum}" end="${page.endPageNum}" var="num">
			<span>
				<c:if test="${select != num}">
					<a href="/apply/apply?num=${num}${page.searchTypeKeyword}">${num}</a>
				</c:if>    
				
				<c:if test="${select == num}">
					<b>${num}</b>
				</c:if>
				   
			</span>
		</c:forEach>
				
		<c:if test="${page.next}">
			<span>[ <a href="/apply/apply?num=${page.endPageNum + 1}${page.searchTypeKeyword}">다음</a> ]</span>
		</c:if>
	</div>	
	
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