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
.subTitleInput {border:none; width:100%; font-size: 1em;}
.btnSort-set{ text-align:right; font-weight:bold; }
.writerSide {padding: 5px;}
</style>


<%@ include file="../include/header.jsp" %>

	
	
	
<div class="container">
	
	<div  class="titleInput">
		${view.title}
	</div>
	<div  class="subTitleInput">
		${view.subTitle}
	</div>
	<div class="btnSort-set">
		<a href="/board/modify?bno=${view.bno}">수정</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="/board/delete?bno=${view.bno}" onclick="return confirm('Are you sure?')">삭제</a>
	</div>
	<div class="writerSide">
	By ${view.writer}
	</div>
	<hr/>
	<div style="margin:1%;">
		${fn:replace(view.content, replaceChar, "<br/>")}
	</div>
	
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
			<a href="/reply/delete?bno=${view.bno}&rno=${reply.rno}" onclick="return confirm('Are you sure?')">삭제</a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<a href="#" onclick="checkModify(${view.bno}, ${reply.rno}, '${reply.writer}', '${reply.content}')">댓글 수정</a>
		</li>
		<br />
	</c:forEach>
	<hr/>
		<form name="rform" method="post" action="/reply/write">
			<input type="hidden" name="bno" value="${view.bno}">
			<table class="tableComment" style="width:95%;">
			<tr>
				<th style="width:7%;">작성자</th> 
				<td style="width:15%;"><input type="text" name="writer" id="rwriter" class="form-control" /></td>
				<td style="text-align:right;"><a href="#" id="submitBtn">댓글 작성</a></td>
			</tr>
			<tr>
				<td colspan="3"><textarea rows="5" cols="50" name="content" id="rcontent" class="form-control"></textarea></td>
			</tr>
			</table>
		</form>
	<!-- 댓글 끝 -->
</div>
<script>

function checkModify(bno, rno, writer, content) {
	var cell = document.getElementById("replyBoard"+rno);
	var stringTags;
	
	stringTags = "<form name='mform' method='post' action='/reply/modify'>";
	//stringTsgs += "<input type='hidden' name='bno' value='"+bno+"' />";
	//stringTsgs += "<input type='text' name='rno' value='"+rno+"' />";
	stringTags += "<div style='width:50%;'><p><input type='text' name='writer' id='mwriter' class='form-control' value='"+writer+"' style='width:30%;'/> <input type='hidden' name='bno' value='"+bno+"' /> </p>";
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
	myform.action = "/reply/write";
	myform.submit();
};

//document.getElementById("modifyBtn").onclick = function () {
	//var myform2 = document.forms["mform"];
	//myform2.action = "/reply/modify";
	//myform2.submit();
	//alert("ok");
//};

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
	myform2.action = "/reply/modify";
	myform2.submit();
	//alert("ok");
};
</script>

</body>
</html>