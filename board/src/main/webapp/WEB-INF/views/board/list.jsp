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
<title>게시물 LIST</title>
</head>
<body>
<style>
.txt_line {
	 width:700px;;
   padding:0 5px;
   overflow:hidden;
   text-overflow:ellipsis;
   white-space:nowrap;
} 

</style>


<%@ include file="../include/header.jsp" %>

<div class="container">

	
	<table class="table" style="margin-top:50px;">
		<tbody>
			<c:forEach items="${list}" var="list">
				<tr>
					<td style="line-height:1.5em;">
						<a href="/board/view?bno=${list.bno}" style="font-size:1.5em;">${list.title}</a> <br>
						<div class="txt_line">
						<c:if test="${!empty list.subTitle}">
						${list.subTitle} |
						</c:if>${list.content}
						</div><br/>
						<span style="font-size:0.6em;"><fmt:formatDate value="${list.regDate}" pattern="yyyy-MM-dd" /></span>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>
</body>
</html>