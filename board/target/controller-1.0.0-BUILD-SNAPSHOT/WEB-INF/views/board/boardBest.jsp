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
.imgThumb {width: 150px; height:150px;}
.imgThumb_in {width:100%; height:100%; object-fit: cover;}
</style>

<%@ include file="../include/header.jsp" %>

<div class="container">
	
	<table class="table" style="margin-top:50px;" id="userListViewTable">
		<tbody id="ele">
			<c:forEach items="${bestList}" var="bestList">
				<tr>
					<td style="line-height:1.5em;">
						<a href="/board/view?bno=${bestList.bno}&user_id=${member.user_id}" style="font-size:1.5em;">${bestList.title}</a> <a href="#"><span><i class="fas fa-heart" style="font-size: 1.0em;" id="likeExpress"></i>${bestList.likeCnt}</span></a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a>[${bestList.cnt}]</a> <br>
						<div class="txt_line">
						<c:if test="${!empty bestList.subTitle}">
						${bestList.subTitle}
						</c:if> | ${bestList.content}
						</div><br/>
						<span style="font-size:0.8em;">${bestList.writer} / <fmt:formatDate value="${bestList.regDate}" pattern="yyyy-MM-dd" /></span>
					</td>
					<td class="imgThumb">
						<c:if test="${!empty bestList.boardThumbnail}">
							<c:if test="${!fn: contains(bestList.boardThumbnail, 'none.png')}">
								<img src="/resources/${bestList.boardThumbnail}" class="imgThumb_in" />
							</c:if>
						</c:if>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>

<div id="scrollEnd"></div>
</body>

<script type="text/javascript">

var listWritepage = 1;
var keyword = "";


//스크롤 감지 및 페이징 호출 
$(window).on('scroll', function(){
	
	var domHeight = $(document).height()-window.innerHeight;
	var scrollHeight = $(window).scrollTop()
	//console.log(domHeight);
	//console.log(scrollHeight);
	
	if ( domHeight <= scrollHeight ) {	
		
		listWritepage += 1;
    pagingAjax(listWritepage, keyword);
		
	}

});



/* timestamp Date-Format */
function getFormatDate(date){
    var year = date.getFullYear();              //yyyy
    var month = (1 + date.getMonth());          //M
    month = month >= 10 ? month : '0' + month;  //month 두자리로 저장
    var day = date.getDate();                   //d
    day = day >= 10 ? day : '0' + day;          //day 두자리로 저장
    return  year + '-' + month + '-' + day;
}

/* null 값 공백 치환 */
function isEmpty(value){
    if(value == null || value.length === 0) {
           return "";
     } else{
            return value;
     }
}

/* paging Ajax 처리 - 무한 스크롤  */
function pagingAjax(page, keywrod) {
	keyword = getParameterByName('keyword');
	$.ajax({
        url: '/board/bestListAjax?num='+page+'&user_id=${member.user_id}&keyword='+keyword,
        type: 'POST',
        dataType : 'json',
        success: function(data){
       	var str = "";     
            if (data != "") {
            	
            	for(i=0; i<data.length; i++){
            		//console.log(data[i]);
            		var timestamp = data[i].regDate
             	 	var date = new Date(timestamp);
								var noneImg = data[i].boardThumbnail.indexOf("none.png")
           			
            		formatReg = getFormatDate(date);
           			//console.log(data[i].boardThumbnail);
								//console.log(noneImg);
           			
								str += "<tr>"
						    str +=			"<td style='line-height:1.5em;'>"
								str	+=			"<a href='/board/view?bno="+data[i].bno+"&user_id=${member.user_id}' style='font-size:1.5em;'>"+data[i].title+"</a> <a href='#'><span><i class='fas fa-heart' style='font-size: 1.0em;' id='likeExpress'></i>"+data[i].likeCnt+"</span></a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a>["+data[i].cnt+"]</a> <br>"
								str	+=			"<div class='txt_line'>"
								str +=			isEmpty(data[i].subTitle)+" | "
								str	+=			data[i].content
								str +=			"</div><br/>"
								str +=			"<span style='font-size:0.6em;'>"+formatReg+"</span>"
								str +=			"</td>"
								str +=     	"<td class='imgThumb'>"
														if(noneImg < 0) {
								str +=			"<img src='/resources"+data[i].boardThumbnail+"' class='imgThumb_in' /> "
														};
								str +=			"</td>"
								str +=	"</tr>"
            		};
            		
            		$('#userListViewTable').append(str).hide().fadeIn(50);   								
						
	           
            }else {
            	//alert("마지막페이지입니다.")
            }
            
            
        },
					error:function(request,status,error){
						alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					}
    })	
	
}


/* 키워드 검색 */
$('#searchBtnGo').click(function () {
	
	var newForm = $('form[name=searchForm]');
	newForm.append($('<input/>', {type: 'hidden', name: 'user_id', value:'${member.user_id}' })); 
	newForm.append($('<input/>', {type: 'hidden', name: 'num', value:'1' }));
	newForm.appendTo('body');
	newForm.action = "/board/list";
	newForm.submit();	
	
});


//url parameter 가져오기
function getParameterByName(name) {
    name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
    var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
            results = regex.exec(location.search);
    return results == null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
}



</script>

</html>