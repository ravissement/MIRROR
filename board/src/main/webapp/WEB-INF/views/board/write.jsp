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
        background-image: url('\thumbnail\2021\04\20\unnamed.jpg');
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

	<form method="POST" name="testForm" id="testForm" style="margin-top:50px;" enctype="multipart/form-data">
		<input type="hidden" name="writer" value="${member.user_id}" />
		<div class="btnSort-set" style="line-height: 2em; font-size: 2em;">
			<a href="#" id="thumbWriteFileTest_click"><i class="far fa-image"></i></a>
			 <input type="file" name="boardThumbnailTest" id="boardThumbnailTest" style="display: none;"/>
		</div>
	</form>

	<form name="wform" id="wform" method="post" class="form-signin">
		<input type="hidden" name="writer" value="${member.user_id}" />
		<input type="hidden" name="bno" />
		<div>
			<input type="text" name="title" placeholder="제목을 입력하세요." class="titleInput" maxlength="49">
		</div>
		<div>
			<input type="text" name="subTitle" placeholder="소제목을 입력하세요." class="subTitleInput" maxlength="49">
		</div>
		<div class="btnSort-set" style="line-height: 2em; font-size: 1em;">
			 	<a href="#" id="writeBtn">저장</a>
		</div>
		<hr/>
		<div style="margin-top:3%;">
			<textarea style="width:100%; height:100%;" rows="30" name="content" class="writeContent" id="content" class="form-control" placeholder="It's your mirror.." maxlength="10000000"></textarea>
		</div>
	</form>
<img alt="" src="/resources/boardThumbnail/unnamed.jpg" style="width:400px;">
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

/*파일 업로드 CSS 우회*/
$('#thumbWriteFileTest_click').click(function (e) {
	e.preventDefault();
	$('#boardThumbnailTest').click();
});

$('#boardThumbnailTest').change(function() {
	if(!$('input[name=boardThumbnailTest]')) {
		alert("파일을 선택하지 않았습니다.2");
		return false;		
	}else{
		alert("파일 선택2");
		ajaxThumbnail();
	}
});

/*
const imageTag = document.getElementById("boardThumbnailImg");
imageTag.addEventListener('change', function() {
	document.querySelector(".lst_thumb").querySelector("li").style.display = "block";
	loadImg(this);
});

function loadImg(value) {
	if(value.files && value.files[0]) {
		var reader = new FileReader();
		
		reader.onload = function (e) {
			document.querySelector(".lst_thumb").querySelector("img").setAttribute('src', e.target.result);
		}
		reader.readAsDataURL(value.files[0]);
	}
}
*/

function ajaxThumbnail() {
	//var formData = new FormData(document.getElementById('wform'));
	//var fileData = $('input[name=boardThumbnail]')[0].files;
 	var form = $('#testForm')[0];
  // Create an FormData object 
  var data = new FormData(form);
	if($('input[name=bno]').val()){
		data.append("bno",$('input[name=bno]').val());
		
	}
  
  
	$.ajax({
        type: 'POST',
        url: '/board/ajaxThumbnailTest',
        data: data,
        contentType : false,
        processData : false,
        success: function(data){
            console.log(data);
            $('input[name=bno]').val(data.bno);
            //$(body).css('background-image': 'url('+data.boardThumbnail+')');
            var imgUrl = "/resources/" + data.ori_boardThumbnail.replace("\\", "/");
           $('body').css({"background":"url("+imgUrl+")"}); 
        	 $('body').css({"background-repeat" : "no-repeat;"});
        	 $('body').css({"background-size" : "100% 23%;"});
           
        },
				error:function(request,status,error){
					alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
    });
};




</script>


</body>
</html>