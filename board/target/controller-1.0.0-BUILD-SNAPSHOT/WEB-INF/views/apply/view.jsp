<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<% pageContext.setAttribute("replaceChar", "\n"); %>
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
<title>게시물 조회</title>
</head>
<body>
<style>
.tableComment {
	border-right:none;
	border-left:none;
	border-top:none;
	border-bottom:none;
}
.tableComment tr {
	height:4em;
}

.titleInput {border:none; height:80px; width:100%; font-size: 3em;}
.subTitleInput {border:none; width:100%; font-size: 1.5em;}
.btnSort-set{ text-align:right; font-weight:bold; }
.writerSide {padding: 10px 5px 0 5px;;}
.imgThumb { position: absolute; opacity: 0.4; position:absolute; top:0; left:0; width: 100%; height:100%; z-index: -100;}
.imgThumb_in {width:100%; height:100%; object-fit: cover; border-radius: 50%;}
.fontString {font-weight: bold;}
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


<%@ include file="../include/header.jsp" %>
	
	
<div class="container">
	
	
	<table class="table" style="margin-top:50px;" id="userListViewTable">
		<tbody id="ele">
				<tr>
					<td style="text-align: left; height:150px;">
						<a class="diaryQuestion">${view.diaryQuestion}</a> <br>
						<span class="diaryQuestionEng">${view.diaryQuestionEng}</span> <br>
						${view.user_id} /
						<span style="font-size:0.6em;"><fmt:formatDate value="${view.regDate}" pattern="yyyy-MM-dd" /></span> <br />
					</td>
				</tr>
		</tbody>
	</table>
	<br>
	<!-- 댓글 시작 -->
	<hr/>
	<br>
	<br>
	<c:forEach items="${reply}" var="reply" varStatus="status">
		<li id="replyBoard${reply.rno}" style="list-style:none;">
			<div>
				<p style="font-weight:bold;">${reply.writer} / <fmt:formatDate value="${reply.regDate}" pattern="yyyy-MM-dd"/></p>
				<p>${reply.content}</p>
			</div>
			
			<c:if test="${member.user_id eq 'ravissement'}">		
				<a href="/reply/applyDelete?ano=${view.ano}&rno=${reply.rno}" onclick="return confirm('Are you sure?')" class="fontString">삭제</a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="#" onclick="checkModify(${view.ano}, ${reply.rno}, '${reply.writer}', '${reply.content}')" class="fontString">댓글 수정</a>
			</c:if>
		</li>
		<br />
	
	</c:forEach>
	<hr/>
		<form name="rform" method="post" action="/reply/applyWrite">
			<input type="hidden" name="ano" value="${view.ano}">
			<table class="tableComment" style="width:95%;">
			<tr>
				<th style="width:7%;">작성자</th> 
				<td style="width:15%;"><input type="text" name="writer" id="rwriter" class="form-control" /></td>
				<td style="text-align:right;"><a href="#" id="submitBtn" class="fontString">댓글 작성</a></td>
			</tr>
			<tr>
				<td colspan="3"><textarea rows="5" cols="50" name="content" id="rcontent" class="form-control"></textarea></td>
			</tr>
			</table>
		</form>
	<!-- 댓글 끝 -->
	
</div>
<script>
function checkModify(ano, rno, writer, content) {
	var cell = document.getElementById("replyBoard"+rno);
	var stringTags;
	
	stringTags = "<form name='mform' method='post' action='/reply/applyModify'>";
	//stringTsgs += "<input type='hidden' name='bno' value='"+bno+"' />";
	//stringTsgs += "<input type='text' name='rno' value='"+rno+"' />";
	stringTags += "<div style='width:50%;'><p><input type='text' name='writer' id='mwriter' class='form-control' value='"+writer+"' style='width:30%;'/> <input type='hidden' name='ano' value='"+ano+"' /> </p>";
	stringTags += "<p><textarea name='content' id='mcontent' class='form-control'>"+content+"</textarea> <input type='hidden' name='rno' value='"+rno+"' />  </p>";
	stringTags += "<a href='#' onclick='window.location.reload();'>취소</a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
	stringTags += "<a href='#' onclick='modify();'>확인</a>";
	stringTags += "</div>";
	stringTags += "</form>";
	
	cell.innerHTML = stringTags 
}


document.getElementById("submitBtn").onclick = function () {
	
	if (!$('#rwriter').val()){
		alert("작성자를 입력해주세요.");
		$('#rwriter').focus();
		return false;
	}

	if (!$('#rcontent').val()){
		alert("내용을 입력해주세요.");
		$('#rcontent').focus();
		return false;
	}
	
	var myform = document.forms["rform"];
	myform.action = "/reply/applyWrite";
	myform.submit();
};


function modify() {
	
	if (!$('#mwriter').val()){
		alert("작성자를 입력해주세요.");
		$('#mwriter').focus();
		return false;
	}

	if (!$('#mcontent').val()){
		alert("내용을 입력해주세요.");
		$('#mcontent').focus();
		return false;
	}
	
	var myform2 = document.forms["mform"];
	myform2.action = "/reply/applyModify";
	myform2.submit();
	//alert("ok");
};



/*
$('#likeExpress').click(function() {
	var bno = "${view.ano}"; 	
	var user_id = "${member.user_id}";
	$.ajax({
		
        url: '/board/boardLike?bno='+bno+'&user_id='+user_id,
        type: 'POST',
        dataType : 'json',
        success: function(data){
        		if(data == 1) {
	            $('#likeExpress').removeClass( 'far fa-heart' );
	            $('#likeExpress').addClass( 'fas fa-heart' );
        		}else {
	            $('#likeExpress').removeClass( 'fas fa-heart' );
	            $('#likeExpress').addClass( 'far fa-heart' );
        		}
            
        },
				error:function(request,status,error){
					alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				
				}
    })	
	
});
*/


</script>

</body>
</html>