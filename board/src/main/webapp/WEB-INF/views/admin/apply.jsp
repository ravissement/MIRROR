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
	.calendarTable
	{
	    border: none;
	    text-align:center;
	    width:80%;
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
<title>admin.apply</title>
</head>
<body onload="build();">

<%@ include file="../include/header.jsp" %>


<div class="container">
	
	<table class="table" style="margin-top:50px;" id="userListViewTable">
		<tbody id="ele">
			<c:forEach items="${applyList}" var="applyList">
				<tr>
					<td style="text-align: left; height:150px;">
						<a class="diaryQuestion">${applyList.diaryQuestion}</a> <br>
						<span class="diaryQuestionEng">${applyList.diaryQuestionEng}</span> <br>
						${applyList.user_id} /
						<span style="font-size:0.6em;"><fmt:formatDate value="${applyList.regDate}" pattern="yyyy-MM-dd" /></span> <br />
						<span>${applyList.user_email} / ${applyList.user_phone}</span>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	
	
	<div style="text-align:center;">
		<c:if test="${page.prev}">
			<span>[ <a href="/admin/apply?num=${page.startPageNum - 1}${page.searchTypeKeyword}">이전</a> ]</span>
		</c:if>
		
		<c:forEach begin="${page.startPageNum}" end="${page.endPageNum}" var="num">
			<span>
				<c:if test="${select != num}">
					<a href="/admin/apply?num=${num}${page.searchTypeKeyword}">${num}</a>
				</c:if>    
				
				<c:if test="${select == num}">
					<b>${num}</b>
				</c:if>
				   
			</span>
		</c:forEach>
				
		<c:if test="${page.next}">
			<span>[ <a href="/admin/apply?num=${page.endPageNum + 1}${page.searchTypeKeyword}">다음</a> ]</span>
		</c:if>
	</div>	
	
	
	
	<form name="aform" method="post" action="/admin/applyQuestion">
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
			<br />
			<input type="text" name="user_id" value="${member.user_id}" />
	</form>
	<br>
	<p style="text-align: center;"><input type="button" id="submitBtn" class="buttonJoinCustom" value="업로드"/></p>
	
	<hr />
	
	<table align="center" id="calendar" class="calendarTable">
        <tr height="30px;">
            <td><font size=4em; color="#B3B6B3" style="font-weight:bold;"><a href="#" onclick="beforem()" id="before" ><</a></font></td>
            <td colspan="5" align="center"><a id="yearmonth"></a></td>
            <td><font size=4em; color="#B3B6B3" style="font-weight:bold;"><a href="#" onclick="nextm()" id="next">></a></font></td>
        </tr>
        <tr>
            <td align="center"> <font color="#FF9090">Sun</font></td>
            <td align="center"> <a>Mon</a> </td>
            <td align="center"> <a>Tue</a> </td>
            <td align="center"> <a>Wed</a> </td>
            <td align="center"> <a>Thur</a> </td>
            <td align="center"> <a>Fri</a> </td>
            <td align="center"><font color=#7ED5E4>Sat</font></td>
        </tr>
    </table>

	<%@ include file="../include/footer.jsp" %>
</div>    
</body>

<script>

var today = new Date(); 
var date = new Date();

function beforem() { 
    today = new Date(today.getFullYear(), today.getMonth() - 1, today.getDate());
    build(); 
}

function nextm()  {
    today = new Date(today.getFullYear(), today.getMonth() + 1, today.getDate());
    build();
}

function build() {
		
		var jsonInfo;
		
		//질문이 들어있는 날짜 가져오기
		$.ajax({
	        url: '/admin/applyCalendar',
	        async:false,
	        type: 'POST',
	        data : {diaryMonth : today.getMonth()+1},
	        dataType : 'json',
	        success: function(data){
						//console.log(data);
	        	jsonInfo = data;
	        },
					error:function(request,status,error){
						alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					}
		});	
		
		//console.log(jsonInfo[0].diaryMonth);
		//console.log(jsonInfo[0].diaryDay);
		//console.log(jsonInfo.length);
		
		var nMonth = new Date(today.getFullYear(), today.getMonth(), 1); 
    var lastDate = new Date(today.getFullYear(), today.getMonth() + 1, 0); 
    var tbcal = document.getElementById("calendar"); 
    var yearmonth = document.getElementById("yearmonth"); 
    yearmonth.innerHTML = today.getFullYear() + " / "+ (today.getMonth() + 1); 
    
    /*
    if(today.getMonth()+1==12) {
        before.innerHTML=(today.getMonth());
        next.innerHTML="1";
    }
    else if(today.getMonth()+1==1) {
    before.innerHTML="12";
    next.innerHTML=(today.getMonth()+2);
    }
    else {
        before.innerHTML=(today.getMonth());
        next.innerHTML=(today.getMonth()+2);
    }
    */
   
    while (tbcal.rows.length > 2) {
        tbcal.deleteRow(tbcal.rows.length - 1);
    }
    var row = null;
    row = tbcal.insertRow();
    var cnt = 0;

    for (i = 0; i < nMonth.getDay(); i++) {
        cell = row.insertCell();
        cnt = cnt + 1;
    }
    
   	
    for (i = 1; i <= lastDate.getDate(); i++) { 
    		
    		cell = row.insertCell();
        cell.innerHTML = "<a href='#'>"+i+"</a>";
        cnt = cnt + 1;
        if (cnt % 7 == 1) {
            cell.innerHTML = "<font color=#FF9090><a href='#'>" + i
        }
        if (cnt % 7 == 0) { 
            cell.innerHTML = "<font color=#7ED5E4><a href='#'>" + i
            row = calendar.insertRow();
        }
        if(today.getFullYear()==date.getFullYear()&&today.getMonth()==date.getMonth()&&i==date.getDate()) {
            cell.bgColor = "#DCEBFF"; 
        }
        
        for(j=0; j <= jsonInfo.length-1; j++) {
	        if(i == jsonInfo[j].diaryDay){
						cell.bgColor = "#FFE1E6"; 
					}
        }
    
    }

}	

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
	
	var queryString = $('form[name=aform]').serialize();
	
	$.ajax({
        url: '/admin/applyQuestion',
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