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
<title>회원 가입</title>
</head>
<body>
<style>
/* 중복아이디 존재하지 않는경우 */
.id_input_re_1{
	color : green;
	display : none;
}
/* 중복아이디 존재하는 경우 */
.id_input_re_2{
	color : red;
	display : none;
}
.buttonJoinCustom {
		width:100px;
    background-color: #646496;
    border: none;
    color:#fff;
    padding: 15px 0;
    text-decoration: none;
    display: inline-block;
    font-size: 15px;
    cursor: pointer;
		border-radius:10px;
		margin-bottom: 5px;
}
.buttonJoinCustom:hover {
    background-color: #14148C;
}

</style>
<%@ include file="../include/header.jsp" %>
<div class="container">
	<div style="width: 60%; margin-left: 20%;">
	<input type="hidden" id="idck" name="idck" value=""/><!--중복id 체크결과-->
	<form name="memberJoin" method="post" class="form-signin" action="/user/join" style="margin-top:50px;">
			<p style="line-height:1em;">
			ID : <span class="id_input_re_1">사용 가능한 아이디입니다.</span>
				<span class="id_input_re_2">아이디가 이미 존재합니다.</span><input type="button" name="id_double_check" id="id_double_check" value="중복확인" class="buttonJoinCustom"  style="float: right; height:10px; line-height: 0.3em;" />
			</p>
			<input type="text" name="user_id" class="form-control" placeholder="As your ID" maxlength="12"/> <br/>
			<p>
			PW :  <a href="#"><i class="fa fa-eye fa-lg" id="eye1"></i></a>
			</p>
			<input type="password" name="user_pw" class="form-control" placeholder="As your password" maxlength="16"/> <br/>
			<p>
			PW CHECK : <!--<a href="#"><i class="fa fa-eye fa-lg" id="eye2"></i></a>-->
			</p>
			<input type="password" name="user_pwc" class="form-control" placeholder="As your password" maxlength="16"/> <br/>
			<p>
			NAME :
			</p> 
			<input type="text" name="user_name" class="form-control" placeholder="As your name" maxlength="20"/> <br/>
			<p>
			PHONE :
			</p> 
			<input type="text" name="user_phone" class="form-control" placeholder="Only number" maxlength="13"/> <br/>
			<p>EMAIL : </p>
			<input type="text" name="user_email" class="form-control" placeholder="As your email" maxlength="40"/> <br/>
			<p style="text-align: center;"><input type="button" id="submitBtn" class="buttonJoinCustom" style="width: 20%; margin: auto;" value="apply"/></p>
	</form>
	</div>
	<%@ include file="../include/footer.jsp" %>
</div>


<script>

//입력제한
$('input[name=user_phone]').on("keyup", function() {
	$(this).val($(this).val().replace(/[^0-9]/g,""));
});


// id중복체크
$('input[name=id_double_check]').click(function(){
	var str= $('input[name=user_id]').val();
	var len =str.length;

	if (!str){
		alert("아이디를 입력하십시오.");
		$('input[name=user_id]').focus();
		$('.id_input_re_1').css("display","none");
		$('.id_input_re_2').css("display", "none");
		return false;
	}

	//id 영어와 숫자만 입력가능
	var idRule= /^[a-zA-Z0-9]{4,12}$/;
	if (!idRule.test(str)) {
		alert("영어와 숫자 4~12자리만 입력가능합니다.");
		$('.id_input_re_1').css("display","none");
		$('.id_input_re_2').css("display", "none");
		$('input[name=user_id]').focus();
		return false;
	}
	
	
    $.ajax({
        url: "idCheck",
        type: "POST",
        data: {"user_id" : str},
        success: function(data){
        	if(data == "Y") {
        		$('.id_input_re_1').css("display","inline-block");
						$('.id_input_re_2').css("display", "none");
						$('input[name=idck]').val("1");
        	}else {
        		$('.id_input_re_2').css("display","inline-block");
						$('.id_input_re_1').css("display", "none");
						$('input[name=idck]').val("");
        	}
        },
        error: function(){
            alert("simpleWithObject err");
        }
    });

	

});


//중복등록 방지
var chk_submit = 0

$('#submitBtn').click(function(){
	chk_submit++;

	var user_name =			$('input[name=user_name]').val();
	var user_id =			$('input[name=user_id]').val();
	var idck =				$('input[name=idck]').val();
	var user_pw =			$('input[name=user_pw]').val();
	var user_pwc =			$('input[name=user_pwc]').val();
	var user_email =		$('input[name=user_email]').val();
	var user_phone =		$('input[name=user_phone]').val();

	if (chk_submit==1){
		
		//id 8-12자의 영어와 숫자만 입력가능
		var idRule= /^[a-zA-Z0-9]{4,12}$/;
		if (!idRule.test(user_id)) {
			alert("아이디를 확인해 주십시오\n4-12자의 영어와 숫자만 가능합니다.");
			$('input[name=user_id]').focus();
			chk_submit = 0
			return false;
		};

		//ID 중복확인
		if (!idck){
			alert("ID 중복확인을 해 주십시오.");
			$('input[name=user_id_check]').focus();
			chk_submit = 0
			return false;
		};

		//비밀번호확인 --길이 8~12자/숫자/대,소문자 포함
		var reg = /^(?=.*?[a-zA-Z])(?=.*?[0-9]).{8,16}$/;
		if( !reg.test(user_pw)) {
			alert("비밀번호는 8자~16자 이어야 하며, 영어와 숫자가 함께 포함되어야 합니다.");
			$('input[name=user_pw]').focus();
			chk_submit = 0
			return false;
		};

		if (!user_pwc){
			alert("비밀번호를 확인을 입력해 주십시오. ")
			$('input[name=user_pwc]').focus();
			chk_submit = 0
			return false;
		};

		if (user_pw != user_pwc){
			alert("비밀번호가 일치하지 않습니다. ")
			$('input[name=user_pwc').focus();
			chk_submit = 0
			return false;
		};

		//한글, 영어만 가능
		var nameRule= /[가-힣a-zA-Z]+$/;
		if (!nameRule.test(user_name)) {
			alert("이름을 확인해 주십시오\n한글, 영문만 사용가능합니다.");
			$('input[name=user_name]').focus();
			chk_submit = 0
			return false;
		};

		if(checkSpace(user_name)==true){
			alert("이름에 공백을 포함할 수 없습니다.");
			$('input[name=user_name]').focus();
			chk_submit = 0
			return false;
		};


		if (!user_phone){
			alert("핸드폰번호 입력해 주십시오. ")
			$('input[name=user_phone]').focus();
			chk_submit = 0
			return false;
		};
		
		if(!user_email) {
			alert("이메일을 입력해주세요.");
			$('input[name=user_email]').focus();
			chk_submit = 0
			return false;
		};

		var reg = /[a-z0-9]{2,}@[a-z0-9-]{2,}\.[a-z0-9]{2,}/i;
		if( !reg.test(user_email)) {
			alert("잘못된 이메일형식입니다. ");
			$('input[name=user_email]').focus();
			chk_submit = 0
			return false;
		};
		
		if(!confirm("회원가입을 진행하시겠습니까?")) {
			chk_submit = 0
			return false;
		};

		$('form[name=memberJoin').submit();
	}
	else {
		alert("진행중입니다.\n잠시 기다려 주십시오.")
		chk_submit = 0;
	}

});

//Password
$('#eye1').click(function(){
	$('input[name=user_pw]').toggleClass('active');

    if($('input').hasClass('active')){
        $('#eye1').attr('class',"fa fa-eye-slash fa-lg")
        $('input[name=user_pw]').prop('type','text');
    }else{
        $('#eye1').attr('class',"fa fa-eye fa-lg")
        $('input[name=user_pw]').prop('type','password');
    }
});
/*
$('#eye2').click(function(){
	$('input[name=user_pwc]').toggleClass('active');

    if($('input').hasClass('active')){
        $('#eye2').attr('class',"fa fa-eye-slash fa-lg")
        $('input[name=user_pwc]').prop('type','text');
    }else{
        $('#eye2'').attr('class',"fa fa-eye fa-lg")
        $('input[name=user_pwc]').prop('type','password');
    }
});
*/

//공백 확인
function checkSpace(str) { if(str.search(/\s/) != -1) { return true; } else { return false; } }



</script>

</body>
</html>