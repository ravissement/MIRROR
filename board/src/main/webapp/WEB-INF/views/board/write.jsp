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
	.subTitleInput {border:none; width:100%; font-size: 1em; background-color:transparent;}
	.subTitleInput:focus {outline:none; }
	.writeContent {width:99%; overflow:hidden; border:none;}
	.writeContent:focus {outline:none; }
	.btnSort-set{ text-align:right; font-weight:bold; }
	body {
        background-image: url('');
        background-repeat : no-repeat;
        background-size : 100% 23%;
      }
</style>


<%@ include file="../include/header.jsp" %>

<c:if test="${!empty writeMessage}">
	<script>
		alert('${writeMessage}');
		location.href="/";
	</script>
</c:if>


<div class="container">
	<form name="wform" method="post" class="form-signin" style="margin-top:50px;" enctype="multipart/form-data">
	<input type="hidden" name="bno" value="" />
	<input type="hidden" name="writer" value="${member.user_id}" />
	<div>
		<input type="text" name="title" placeholder="제목을 입력하세요." class="titleInput" maxlength="49">
	</div>
	<div>
		<input type="text" name="subTitle" placeholder="소제목을 입력하세요." class="subTitleInput" maxlength="49">
	</div>
	<div class="btnSort-set" style="line-height: 2em; font-size: 1.5em;">
		<a href="#" id="thumbWriteFile_click"><i class="far fa-image"></i></a> &nbsp;&nbsp;&nbsp;&nbsp; <a href="#" id="writeBtn">저장</a>
		 <input type="file" name="boardThumbnail" id="boardThumbnail" style="display: none;"/>
	</div>
	<hr/>
	<div style="margin-top:3%;">
		<textarea style="width:100%; height:100%;" rows="30" name="content" class="writeContent" id="content" class="form-control" placeholder="It's your mirror.." maxlength="10000000"></textarea>
	</div>
	</form>
</div>

<script type="text/javascript">
//var textEle = $('textarea');

//adjustHeight();
/*
textEle.on('keyup', function() {
  adjustHeight();
});

function adjustHeight() {
  var textEle = $('textarea');
  textEle[0].style.height = 'auto';
  var textEleHeight = textEle.prop('scrollHeight');
  textEle.css('height', textEleHeight);
};
*/

$('#writeBtn').click(function(){
	var myform = document.forms["wform"];
	myform.action = "/board/write";
	myform.submit();

});

/*파일 업로드 CSS 우회*/
$('#thumbWriteFile_click').click(function (e) {
	e.preventDefault();
	$('#boardThumbnail').click();
	
});


$('#boardThumbnail').change(function() {
	if(!$('input[name=boardThumbnail]')) {
		alert("파일을 선택하지 않았습니다.");
		return false;		
	}else{
		alert("파일 선택");
		ajaxThumbnail();
	}
	
});

var filesTempArr = [];

function ajaxThumbnail() {
	var formData = new FormData();
	
	formData.append("writer","${member.user_id}");
	formData.append("boardThumbnail", $("form[name=wform]").files);

	//formData.attr('action', '/board/ajaxThumbnail').submit();
	$.ajax({
        url: '/board/ajaxThumbnail',
        type: 'POST',
        enctype: 'multipart/form-data',
        contentType : false,
        processData : false,
        data: formData,
        success: function(data){
            console.log(data.ori_boardThumbnail);
            $('input[name=bno]').val(data.bno);
            //$(body).css({"background":"url("+data.ori_boardThumbnail+")"}); 			
        },
				error:function(request,status,error){
					alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
    });
	
};




</script>


</body>
</html>