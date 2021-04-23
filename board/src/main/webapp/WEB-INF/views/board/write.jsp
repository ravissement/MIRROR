<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<title>게시물 작성</title>
</head>
<body>
<style>
	.titleInput {border:none; height:100px; width:100%; font-size: 3em; background-color:transparent;}
	.titleInput:focus {outline:none; }
	.subTitleInput {border:none; width:100%; font-size: 1em; font-size: 1.5em; background-color:transparent;}
	.subTitleInput:focus {outline:none; }
	.writeContent {width:99%; overflow:hidden; border:none; font-size: 1.3em; background-color:transparent;}
	.writeContent:focus {outline:none; }
	.btnSort-set{ text-align:right; font-weight:bold; line-height: 2em; font-size: 1em;}
	.imgThumb { position: absolute; opacity: 0.6; position:absolute; top:0; left:0; width: 100%; height:100%; z-index: -100;}
	.imgThumb_in {width:100%; height:100%; object-fit: cover; border-radius: 50%;}
	
</style>

<div class="imgThumb">
		<img onerror="style.display='none'" class="imgThumb_in" />
</div>	

<%@ include file="../include/header.jsp" %>

	<c:if test="${!empty writeMessage}">
		<script>
			alert('${writeMessage}');
			location.href="/";
		</script>
	</c:if>
	<div class="container">
		<form method="POST" name="testForm" id="testForm" style="margin-top:50px;" enctype="multipart/form-data">
			<input type="hidden" name="writer" value="${member.user_id}" />
			<div class="btnSort-set" style="line-height: 2em; font-size: 2em;">
				<a href="#" id="thumbWriteFileTest_click"><i class="far fa-image"></i></a>
				 <input type="file" name="boardThumbnailTest" id="boardThumbnailTest" style="display: none;"/>
				 
			</div>
		</form>
		<form name="wform" id="wform" method="post" class="form-signin">
			<input type="hidden" name="writer" value="${member.user_id}" />
			<input type="hidden" name="bno"/>
			<div>
				<input type="text" name="title" placeholder="제목을 입력하세요." class="titleInput" maxlength="49">
			</div>
			<div>
				<input type="text" name="subTitle" placeholder="소제목을 입력하세요." class="subTitleInput" maxlength="49">
			</div>
			<div class="btnSort-set">
				 	<a href="#" id="writeBtn">저장</a>
			</div>
			<hr/>
			<div style="margin-top:3%;">
				<textarea style="width:100%; height:100%;" rows="30" name="content" class="writeContent" id="content" class="form-control" placeholder="It's your mirror.." maxlength="10000000"></textarea>
			</div>
		</form>
	</div>

</body>

<script type="text/javascript">

/* 게시글 작성 */
$('#writeBtn').click(function(){
	var myform = document.forms["wform"];
	myform.action = "/board/write";
	myform.submit();
});


/*파일 업로드 CSS Cover*/
$('#thumbWriteFileTest_click').click(function (e) {
	e.preventDefault();
	$('#boardThumbnailTest').click();
});


/*ajax 이미지 업로드*/
function ajaxThumbnail() {
 	var form = $('#testForm')[0];
  var data = new FormData(form);
	
  if($('input[name=bno]').val()){
	  /*
	  var input1 = document.createElement('input');
	  input1.setAttribute("type", "hidden");
	  input1.setAttribute("name", "bno"); 
	  input1.setAttribute("value", $('input[name=bno]').val());
	  */
	  data.append("bno", $('input[name=bno]').val());
	}
  
	$.ajax({
        type: 'POST',
        url: '/board/ajaxThumbnailTest',
        data: data,
        contentType : false,
        processData : false,
        success: function(data){
            $('input[name=bno]').val(data.bno);
        },
				error:function(request,status,error){
					alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
    });
};

/*파일 선택 이벤트*/
$(function() {
    $("#boardThumbnailTest").on('change', function(){
    	ajaxThumbnail();
    	readURL(this);
    });
});

/*이미지 미리보기*/
function readURL(input) {
    if (input.files && input.files[0]) {
       var reader = new FileReader();
      
       reader.onload = function (e) {
      	 $('.imgThumb_in').attr("src",e.target.result);
       }
       
       reader.readAsDataURL(input.files[0]);
    }
}

</script>
</html>