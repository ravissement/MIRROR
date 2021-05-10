<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<style>
html.open {
  overflow: hidden;
}

.btn {
  width: 50px;
  height: 50px;
  position: absolute;
  left: 0px;
  top: 0px;
  z-index: 1;
  background-image: url("/resources/images/menu.png");
  background-size: 50%;
  background-repeat: no-repeat;
  background-position: center;
  cursor: pointer;
}

.close {
  width: 50px;
  height: 50px;
  position: absolute;
  left: 0px;
  top: 0px;
  background-image: url("/resources/images/close.png");
  background-size: 50%;
  background-repeat: no-repeat;
  background-position: center;
  cursor: pointer;
}

#menu {
  width: 250px;
  height: 100%;
  position: fixed;
  top: 0px;
  left: -252px;
  z-index: 10;
  border: 1px solid #c9c9c9;
  background-color: white;
  text-align: center;
  transition: All 0.2s ease;
  -webkit-transition: All 0.2s ease;
  -moz-transition: All 0.2s ease;
  -o-transition: All 0.2s ease;
}

#menu.open {
  left: 0px;
}

.page_cover.open {
  display: block;
}

.page_cover {
  width: 100%;
  height: 100%;
  position: fixed;
  top: 0px;
  left: 0px;
  background-color: rgba(0, 0, 0, 0.4);
  z-index: 4;
  display: none;
}
.userThumbnailMain { border-radius: 40%; width:150px;}
#thumbnail_file{ display: none; }
#buttonThumnArea {padding: 5px;;}
</style>

<div>
	
	<div class="btn">
		<div style="cursor:pointer; margin-left: 100%; font-size:1.5em; line-height:1.8em; " >&nbsp;MIRROR</div>
	</div>
	<div onclick="history.back();" class="page_cover">
	</div>
	<div id="menu">
	  <div onclick="history.back();" class="close"></div>
	  <div style="margin-top: 50%;">
	  <c:if test="${!empty member}">
	  <div>
	  	
	  		
	  	
	  	<!-- 
	  	<c:if test="${!empty member_thumb}"> 
	  		<a href="#" id="thumbfile"><img src="${member_thumb.user_thumbnail}" class="userThumbnailMain" /></a>
	  	</c:if>
	  	<c:if test="${empty member_thumb}">
				<a href="#" id="thumbfile"><img src="${member.user_thumbnail}" class="userThumbnailMain"/></a>  	
	  	</c:if>
	  	 -->
	  	 
  	 	<c:if test="${!empty member.user_thumbnail}">
  			<a href="#" id="thumbfile"><img src="${member.user_thumbnail}" class="userThumbnailMain" /></a>
  		</c:if>
	  	 
	  	<c:if test="${empty member.user_thumbnail}">
	  		<a href="#" id="thumbfile"><img src="" class="userThumbnailMain" onerror="this.style.display='none'"/><i class="fas fa-user-plus" style="font-size:2em;" id="uploadIcon"></i></a>
	  	</c:if>
	  	
	  	 
	  	<c:if test="${empty member.user_thumbnail}">
		  	<div>
		  		<form name="thumbnailForm"  action="/user/thumbnail" method="POST"  enctype="multipart/form-data">
		  				 <input type="hidden" name="user_id" value="${member.user_id}"/>
	             <input type="file" name="thumbnail_file" id="thumbnail_file"/>
	             <img onerror="style.display='none'" class="header_imgThumb_in" />
	             
	             <div id="buttonThumnArea">
	             	<a href='#' id='thumbnailBtn'>썸네일을 올려보세요.</a>
	             </div>
	
	         </form>
		  	</div>
	  	</c:if>
	  	<c:if test="${!empty member_thumb || !empty member.user_thumbnail}">
	  		<form name="thumbnailForm"  action="/user/thumbnail" method="POST"  enctype="multipart/form-data">
		  				 <input type="hidden" name="user_id" value="${member.user_id}"/>
	             <input type="file" name="thumbnail_file" id="thumbnail_file"/>
         </form>
          <div id="buttonThumnArea">
           	<a href='#' id='thumbnailBtn'></a>
           </div>
	  	</c:if>
	  	
	  	
	  	<br/>
	  	<div style="margin-bottom:10%;">${member.user_email}</div>
	  	<a href="/user/logout">Logout</a>
	 
	  </div>
	  </c:if>
	  <c:if test="${empty member}">
	  <div>
	  	<a href="/user/login">Login</a> &nbsp;&nbsp;&nbsp;
	  	<a href="/user/write">Sign Up</a>
	  </div>
	  </c:if>
		<div style="margin-top:40%;">
	  </div>
	  <c:if test="${!empty member}">
	  <ul class="nav nav-sidebar">
	    <li class="active"><a href="/board/write">글쓰기 <span class="sr-only">(current)</span></a></li>
	    <li><a href="/board/list?num=1&user_id=${member.user_id}">기록함</a></li>
	    <li><a href="">한줄 일기</a></li>
	  </ul>
	  </c:if>
	  <div style="margin:20%;">
	  <hr />
	  </div>
	  <ul class="nav nav-sidebar">
	    <li><a href="/">미러 홈</a></li>
	    <li><a href="/board/homeList?num=1">새 기록들</a></li>
	    <li><a href="/board/boardBest?num=1">베스트</a></li>
	  </ul>
	 
	  </div>
	</div>
	<c:if test="${nav ne 'noSearch'}">
		<div style="margin-left:40%; line-height:1.8em; padding:10px 20px 0 0;">
			<div class="col-xs-4">
				<form name="searchForm">
					<input type="text" name="keyword" class="form-control"/></div><input  TYPE="IMAGE" alt="ss" src="/resources/images/search.png" style="opacity: 0.5;" id="searchBtnGo" >
				</form>
		</div>
	</c:if>

	<div style="margin: 5%;"></div>

</div>


<script>

/* 이미지 슬라이드 이벤트 */
$(function(){
	// 이미지 슬라이드 컨트롤를 사용하기 위해서는 carousel를 실행해야한다.
	$('#carousel-example-generic').carousel({
		// 슬리아딩 자동 순환 지연 시간
		// false면 자동 순환하지 않는다.
		interval: 5000,
		// hover를 설정하면 마우스를 가져대면 자동 순환이 멈춘다.
		pause: "hover",
		// 순환 설정, true면 1 -> 2가면 다시 1로 돌아가서 반복
		wrap: true,
		// 키보드 이벤트 설정 여부(?)
		keyboard : true
	});
});



/* 네비 게이션 */
$(".btn").click(function() {
  $("#menu,.page_cover,html").addClass("open");
  window.location.hash = "#open";
});

window.onhashchange = function() {
  if (location.hash != "#open") {
    $("#menu,.page_cover,html").removeClass("open");
  }
};




/*썸네일 사진 저장 이벤트*/
$('#thumbnailBtn').click(function() {
	
	if(!$('input[name=thumbnail_file]').val()) {
		alert("아이콘을 눌러 파일을 선택해보세요.");
		return false;
	}
	$('form[name=thumbnailForm]').submit();
	
});


/*파일 업로드 CSS 우회*/
$('#thumbfile').click(function (e) {
	e.preventDefault();
	$('#thumbnail_file').click();
	
});


/*사진을 찾아오면 버튼 생성*/
$("#thumbnail_file").change(function(e){
	$("#thumbnailBtn").empty();
	$("#thumbnailBtn").append("저장하기");
 

});


//파일 선택 이벤트
$(function() {
    $("#thumbnail_file").on('change', function(){
    	//ajaxThumbnail();
    	//uploadIcon
	    	readURL(this);
    });
});

/*이미지 미리보기*/
function readURL(input) {
    if (input.files && input.files[0]) {
    	$("#uploadIcon").remove();
    	
    	var reader = new FileReader();
      
       reader.onload = function (e) {
    	   $('.userThumbnailMain').css("display", "inline")
    	   $('.userThumbnailMain').attr("src",e.target.result);
       }
       
       reader.readAsDataURL(input.files[0]);
    }
}







/*
$('#thumbPopBtn').on("click", function() {
    //var user_id = $("#make_date").val(); //화면의 파라미터 가져오기
    var popupWidth = 400;
		var popupHeight = 300;
		var popupX = (window.screen.width / 4) - (popupWidth / 2);
		// 만들 팝업창 width 크기의 1/2 만큼 보정값으로 빼주었음
		var popupY= (window.screen.height / 3) - (popupHeight / 2);
		// 만들 팝업창 height 크기의 1/2 만큼 보정값으로 빼주었음
		window.open("/user/thumbPop","_blank"
		,'toolbar=yes,menubar=yes,scrollbars=no,height=' + popupHeight  + ', width=' + popupWidth  + ', left='+ popupX + ', top='+ popupY).focus();

});
*/

</script>
