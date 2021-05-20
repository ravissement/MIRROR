<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 LIST</title>
</head>
<body>

<div class="container">
	<div class="header">
	 <%@ include file="../include/nav.jsp" %>
	</div>
	
	<table class="table" style="margin-top:50px;">
		<thead style="font-weight: bold;">
			<tr>
				<td style="width:8%">번호</td>
				<td style="text-align:center;">제목</td>
				<td style="width:10%; text-align: center;" >작성일</td>
				<td style="width:15%; text-align: center;">작성자</td>
				<td style="width:8%; text-align: center;">조회수</td>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${list}" var="list">
				<tr>
					<td>${list.bno}</td>
					<td><a href="/board/view?bno=${list.bno}">${list.title}</a> &nbsp;&nbsp;[${list.cnt}]</td>
					<td style="text-align: center;"><fmt:formatDate value="${list.regDate}" pattern="yyyy-MM-dd" /></td>
					<td style="text-align: center;">${list.writer}</td>
					<td style="text-align: center;">${list.viewCnt}</td>		
				</tr>
			</c:forEach>
		</tbody>
	</table>
	
	<div style="text-align:center;">
		<c:if test="${page.prev}">
			<span>[ <a href="/board/listPageSearch?num=${page.startPageNum - 1}${page.searchTypeKeyword}">이전</a> ]</span>
		</c:if>
		
		<c:forEach begin="${page.startPageNum}" end="${page.endPageNum}" var="num">
			<span>
				<c:if test="${select != num}">
					<a href="/board/listPageSearch?num=${num}${page.searchTypeKeyword}">${num}</a>
				</c:if>    
				
				<c:if test="${select == num}">
					<b>${num}</b>
				</c:if>
				   
			</span>
		</c:forEach>
				
		<c:if test="${page.next}">
			<span>[ <a href="/board/listPageSearch?num=${page.endPageNum + 1}${page.searchTypeKeyword}">다음</a> ]</span>
		</c:if>
	</div>
	
	<div style="text-align:center;">
		<select name="searchType">
			<option value="title" <c:if test="${page.searchType eq 'title'}">selected</c:if>>제목</option>
	        <option value="content" <c:if test="${page.searchType eq 'content'}">selected</c:if>>내용</option>
	     	<option value="title_content" <c:if test="${page.searchType eq 'title_content'}">selected</c:if>>제목+내용</option>
	     	<option value="writer" <c:if test="${page.searchType eq 'writer'}">selected</c:if>>작성자</option>
		</select>
	 
	 	<input type="text" name="keyword" value="${page.keyword}"/>
	 
	 	<button type="button" id="searchBtn">검색</button>
	 </div>
	 
	 <%@ include file="../include/footer.jsp" %>
</div>
<script>

document.getElementById("searchBtn").onclick = function () {
	let searchType = document.getElementsByName("searchType")[0].value;
	let keyword =  document.getElementsByName("keyword")[0].value;
	
	location.href = "/board/listPageSearch?num=1" + "&searchType="+ searchType +"&keyword=" + keyword;
};


</script>

</body>
</html>