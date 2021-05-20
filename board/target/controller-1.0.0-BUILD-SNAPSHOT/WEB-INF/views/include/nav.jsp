<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<style>
.onClass {
	background-color: #ebe9e9;
}

</style>

<!--<c:url var="string1" value="${pageContext.request.requestURL}"/>
<c:set var="length1" value="${fn:length(string1)}" />
<c:set var="chkString" value="${fn:substring(string1, length1-5, length1-4) }" />-->
	  
<nav>
	<ul class="nav nav-pills pull-right"> 
	 <li role="presentation">
	  <a href="/board/list" <c:if test="${nav eq 'list' }">class="onClass"</c:if> >List normal</a> 
	 </li>
	 
	 <li role="presentation">
	  <a href="/board/listPage?num=1" <c:if test="${nav eq 'listPage' }">class="onClass"</c:if> >List + Paging</a> 
	 </li>
	 
	 <li role="presentation">
	  <a href="/board/listPageSearch?num=1" <c:if test="${nav eq 'listPageSearch' }">class="onClass"</c:if> >List + Paging + Search</a> 
	 </li>
	 
	 <li role="presentation">
	  <a href="/board/write" <c:if test="${nav eq 'write' }">class="onClass"</c:if> >write</a> 
	 </li> 
	</ul>
</nav>
<h3 class="text-muted"><a href="/"> HOME </a></h3>
<div class="jumbotron">
	<h2>Safari exhibits a bug</h2>
	<p>As of v8.0, Safari exhibits a bug in which resizing your browser horizontally causes rendering errors in the justified nav that are cleared upon refreshing.</p>
  		<p>Donec id elit non mi porta gravida at eget metus.</p>
</div>
	
<!--<c:remove var="string1" />
<c:remove var="length1" />
<c:remove var="chkString" />-->