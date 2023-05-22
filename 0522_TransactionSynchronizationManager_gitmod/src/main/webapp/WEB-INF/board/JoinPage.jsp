<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1" />

<!-- S :: 공통 INCLUDE -->

<jsp:include page="project/LodVariablePage.do" flush="false">
	<jsp:param name="locale" value="ko"/>
</jsp:include>

<title>회원가입</title>

<link href="/css/join.css" rel="stylesheet" type="text/css"/>
<link href="/css/join.css" rel="stylesheet" type="text/css" />

<style>
body {
	width: 100%;
	height: 100%;
	margin: 0;
	padding-top: 160px;
	padding-bottom: 40px;
	background-repeat: no-repeat;
}

.join_box {
	margin: 0 auto;
	float: none;
	margin-bottom: 10px;
	border-radius: 20px;
	border: 1px solid #0098FF;
	background: #FFFFFF;
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0
		rgba(0, 0, 0, 0.19);
}
</style>

<script type="text/javascript" src="/js/Join.js"></script>
<script type="text/javascript">
	var frmContent = null
	$(document).ready(function(){
	
	// 핸드폰 번호 숫자 + 특수문자 (-)dlqfur
	$('input[id=memberPhone]').on('keyup keypress', function(){
		$(this).val($(this).val().replace(/[^0-9\-]/g, ""));
		});
		
		
	$('input[id=smsNumInput]').on('keyup keypress', function(){$(this).val($(this).val().replace(/[^0-9]/g, ""));
	});
	
	Fn_init();
	});
	
	function Fn_init(){
		frmContent = document.content;
		frmContent.action = "/project/JoinPage.do";
		
		$("#bidbutton").attr("disabled", true);
	}
	
	function Fn_getCheckId(){
		if(!Fn_formCheck("memberId", "아이디"))
		return;
		if(!Fn_checkEmail("memberId", "아이디"))
		return; 
		
		$('#memberId").focus();
		
		$.ajax({
			url : "/project/CheckId2.do",
			type : "post",
			data : {
				"memberId" : $("#memberId").val()
			},
			async : false,
			contentType : "application/x-www-form-urlencoded; charset=utf-8",
			success : function(data){
				var result = $.parseJSON(data);
				
				if (result.message == ""){
				alert("사용가능한 아이디입니다.");
				$('#chkId').val('Y');
				} else {
				alert("이미 등록된 아이디입니다.");
					$("#chkId").val('N');
					$("#chkId").focus();
				}
			},
			error : function(result){
				errorback(result);
			}
		});
	}
	
	function Fn_getWrtJoin(){
		if(!Fn_formCheck("memberId", "아이디"))
		return;
		if($("#chkId").val() != 'Y'){
			alert('아이디 중복체크 하셔야합니다.");
			return;
		}
		
		if(!Fn_formCheck("memberPw", "비밀번호"))
		return;
		if (!Fn_checkMixStr("memberPw", "비밀번호"))
		return;
		if (!Fn_checkStr("memberPw", "비밀번호"))
		return;
		if($("#chkCert").val() != 'Y'){
			alert("본인확인 하셔야합니다.");
			
			return;
		}
		
		alertify.confirm("가입 하시겠습니까?", function(e){
			if(e){
			goJquery("","Write","/project/WrtJoinActive.do");
			} else {
			return;
			}
		});
	}
	
	function FN_formcheck(valobj, valTitle){
	var docCheck = null;
	var docMessage = null;
	docCheck = $('#'+valobj);
	if (docCheck.length < 0){
		if("" == docCheck.val()){
			alert(docMessage + "필수입니다.");
			docCheck.focus();
			
			return false;
			
		}
	}
	
	return true;
	}
	
	function Fn_getAjaxSuccess(method, data){
		var resultMessage = data.message;
		if( null == resultMessage || "" == resultMessage){
		if(method == "CheckId"){
			alert("사용가능한 아이디입니다.");
			$("#chkId").val('Y');
		} else if (method == "SendMail"){
			Fn_showSmsInputBox();
			$("smsNum").val(data.memberkey);
		} else if (method == "Write"){
			alert("회원가입되었습니다.");
			Fn_genTopMenu("1001");
			}
		} else {
			if("인증번호가 맞지않습니다." == resultMessage){
			alert("인증번호가 맞지않습니다. 인증번호 확인을 다시 하세요.")'
			$("$smsNumInput").val("");
			Fn_showSmsset();
		} else if("이미 등록된 아이디입니다." == resultMessage){
			alert(("이미 등록된 아이디입니다.");
			#("#chkId").val('N');
			#("#chkId").focus();
		} else if ("가입되지 않았습니다." == resultMessage){
			alert("가입되지 않았습니다. 관리자에게 문의하세요.");
			$("#chkId").val('N');
			$("#chkId").focus();
		}
		return;
		}
	}
	
	function Fn_getWrtSmsSet(){
		if(!Fn_formCheck("memberId","아이디"))
		return;
		if($("#chkId").val() != 'Y'){
			alert("아이디 중복체크 하셔야 합니다.");
			return;
		}
		
		if (!Fn_formCheck("memberPw", "비밀번호"))
		return;
		if(!Fn_checkMixStr("memberPw", "비밀번호"))
		return;
		if(!Fn_checkStr("memberPw", "비밀번호"))
		if(!Fn_formCheck("memberNm", "성명"))
		return;
		if(!Fn_formCheck("memberPhone","핸드폰 번호"))
		return;
		
		goJquery("","sendMail","/project/SendSms.do");
		
		}
		
	//본인확인 인증번호를 입력할 입력박스 활성화
	function Fn_showSmsInputBox(){
		$('#smsnatchup").show();
		$('#smsset").hide();
		$("#chkCert").val("N");//본인확인 여부
		$("#chkSert").hide();//본인확인 완료 문구
	}
			
	//인증번호 받기버튼 활성화
			function Fn_showSmsset() {
		//$("#smsNumInput").hide();//인증번호 입력 박스
		$("#smsmatchup").hide();//인증번호 확인 버튼	
		$("#smsset").show();//인증번호 받기 버튼

		$("#chkCert").val("N");//본인확인 여부
		$("#chkSert").hide();//본인확인 완료 문구
	}
	//인증번호 비교
	function Fn_getWrtSmsMatchUp() {
		if ($("#smsNumInput").val() != "") {
			if ($("#smsNumInput").val() == $("#smsNum").val()) {
				Fn_setResetActive();
			} else {
				alert("인증번호가 맞지않습니다");
			}
		} else {
			alert("인증번호를 입력하세요");
		}
	}
	//인증번호 비교한 값이 맞다면 인증번호 관련 모두 원위치

	function Fn_setResetActive() {
		$("#smsNumInput").val("");//인증번호 입력 값
		$("#smsNumInput").hide();//인증번호 입력 박스
		$("#smsmatchup").hide();//인증번호 확인 버튼
		$("#smsNum").val("");//sms 인증번호 값
		$("#chkCert").val("Y");//본인확인 여부
		$("#chkSert").show();//본인확인 완료 문구

		$("#bidbutton").attr("disabled", false);//가입하기 버튼
	}
</script>
</head>

<body>
	<form:form commandName="JoinVO" name="content" method="post" onsubmit="return false;">
	<form:hidden path="chkId" />
		<%-- 아이디 중복체크 여부 --%>
		<form:hidden path="chkCert" />
		<%-- 본인확인 여부 --%>
		<form:hidden path="smsNum" />
		<%-- 본인확인용 번호 --%>

		<!-- container-fluid 시작 -->
		<div class="container-fluid">

			<!-- Gnb 시작 -->
			<jsp:include page="/project/GnbActive.do" />
			<!--// Gnb 끝 -->

			<!-- container 시작 -->
			<div class="container">
				<div class="row">
					<div class="col-md-4"></div>

					<div class="col-md-4 join_box">
						<div class="text-center"
							style="margin-top: 15px; margin-bottom: 30px">
							<label class="control-label"><span
								style="font-size: 25px">회원가입</span></label>
						</div>

						<h5>&bull;&nbsp;아이디</h5>
						<div class="input-group" style="margin-bottom: 15px">
							<input id="memberId" name="memberId" type="text" class="form-control"
								maxlength="70" placeholder="이메일입력" /> <span
								class="input-group-btn">
								<button type="submit"
									class="btn btn-primary text_color_white_bold"
									onclick="Fn_getCheckId()" title="중복체크">중복체크</button>
							</span>
						</div>


						<h5>&bull;&nbsp;비밀번호</h5>
						<input id="memberPw" name="memberPw" type="password"
							class="form-control" maxlength="10"
							placeholder="영문/숫자 조합 4~10 자리" />

						<h5>&bull;&nbsp;성명</h5>
						<input id="memberNm" name="memberNm" type="text" class="form-control"
							style="margin-bottom: 15px" />

						<h5>&bull;&nbsp;핸드폰 번호</h5>
						<input id="memberPhone" name="memberPhone" type="text"
							class="form-control" maxlength="13" placeholder="- 으로 구분해서 입력하세요"
							style="margin-bottom: 15px" />

						<h5>&bull;&nbsp;본인확인</h5>
						<div class="input-group" style="margin-bottom: 15px">
							<span id="chkSert"
								style="display: none; color: red; font-size: 15px; font-weight: bold">본인확인
								되었습니다. 가입하기 버튼을 클릭하세요.</span> <input id="smsNumInput"
								name="smsNumInput" type="text" class="form-control"
								maxlength="6" placeholder="인증번호 입력하세요"
								style="ime-mode: disabled" /> <span class="input-group-btn">
								<button id="smsset" type="submit"
									class="btn btn-primary text_color_white_bold"
									onclick="Fn_getWrtSmsSet()" title="인증번호 요청">인증번호 요청</button>
								<button id="smsmatchup" type="submit"
									class="btn btn-danger text_color_white_bold"
									onclick="Fn_getWrtSmsMatchUp()" title="인증번호 확인"
									style="display: none">인증번호 확인</button>
							</span>
						</div>


						<button id="bidbutton" class="btn btn-primary btn-lg"
							onclick="Fn_getWrtJoin()" title="가입하기"
							style="width: 100%; margin-top: 10px; margin-bottom: 20px; font-size: 20px; font-weight: bold">가입하기</button>
					</div>

					<div class="col-md-4"></div>
				</div>

			</div>
			<!--// container 끝 -->

			<!-- Footer 시작 -->
			<div class="pc-join">
				<jsp:include page="/project/FooterPage.do" />
			</div>

			<div class="mobile-join" style="margin-top: 30%">
				<jsp:include page="/project/FooterPage.do" />
			</div>
			<!--// Footer 끝 -->

		</div>
		<!--// container-fluid 끝 -->

	</form:form>
</body>
</html>





















