<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<style>
.onClass {
	background-color: #E6E6E6;
}
</style>
<nav>
	<ul class="nav nav-pills pull-right">
		<c:if test="${member != null }">
			<li role="presentation"><a href="return;">This is ${member.user_name}</a></li>
			<li role="presentation"><a href="/user/logout">logOut</a></li>
		</c:if>
		<c:if test="${member == null}">
			<li role="presentation"><a href="/user/write">Sign Up</a></li>
			<li role="presentation"><a href="/user/login">Login</a></li>		
		</c:if>
		<li role="presentation"><a href="/board/list">LIST</a></li>
		<li role="presentation"><a href="/board/write">WRITE</a></li>
	</ul>
	<h3 class="text-muted"><a href="/">HOME</a></h3>
</nav>
