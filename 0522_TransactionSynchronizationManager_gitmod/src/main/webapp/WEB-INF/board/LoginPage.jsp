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

<jsp:include page="/project/LodVariablePage.do" flush="false">
	<jsp:param name="locale" value="ko"/>
</jsp:include>

<title>로그인</title>

<link href="/css/login.css" rel="stylesheet" type="text/css"/>
<style>
body {
	width: 100%;
	height: 100%;
	margin: 0;
	padding-top: 160px;
	padding-bottom: 40px;
	background-repeat: no-repeat;
}

.login_box {
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
<script type="text/javascript" src="/js/Login.js"></script>
<script type="text/javascript">
var frmContent = null;
	
	$(document).ready(function() {
		Fn_init();
	});
	
	function Fn_init(){
		frmContent = document.content;
		frmContent.action = "/project/LoginPage.do";
	}
	
	//로그인 처리
	 function Fn_getLoginActive(){
		 if(!Fn_formcheck())
		 return;
		 
		 goJqury("","Login","/project/LoginActive.do");
	 }
	 
	//필수사항 체크
	function Fn_formCheck() {
		var docCheck = null;
	 
		docCheck = $("#memberId");
		if(""==docCheck.val()){
			alert("아이디를 입력하세요");
			docCheck.focus();
			return false;
		}
		
		docCheck = $("#memberPw");
		if(""==docCheck.val()){
				alert("비밀번호를 입력하세요");
				docCheck.focus();
				return false;
			}
			
			return true;
		} 
	
	function Fn_getAjaxSuccess(method, data){
		var resultMessage = data.message;
		if( null == resultMessage || "" == resultMessage){
		if(method == "Login"){
			if(data.role =="00"){ // 사용자권한(00: 관리자, 10:사용자)
				frmContent.action = "/project/SaleActive.do"; // 판매관리
			} else {
				frmContent.action = "/project/MonitorActive.do";//모니터링
			} 
				frmContent.submit();
			}
		} else { 
			if("회원정보를 찾을 수 없습니다." == resultMessage){
			alert("회원정보를 찾을 수 없습니다. 관리자에게 문의하세요.");
			Fn_reset();
			$("#memberId").focus();
		}  else {
			alert(resultMessage); 
		}
		return;
		}
	}
	</script>
</head>
	 

<body>
	<form:form commandName="LoginVO" name="content" method="post" onsubmit="return false;">
		<!-- container-fluid 시작 -->
		<div class="container-fluid">

			<!-- Gnb 시작 -->
			<jsp:include page="/project/GnbActive.do" />
			<!--// Gnb 끝 -->

	 <!-- container 시작 -->
			<div class="container">
				<div class="row">
					<div class="col-md-4"></div>

					<div class="col-md-4 login_box">
						<div class="text-center"
							style="margin-top: 15px; margin-bottom: 30px">
							<label class="control-label"><span
								style="font-size: 25px">로그인</span></label>
						</div>

						<input name="memberId" id="memberId" type="text" class="form-control"
							placeholder="아이디(이메일)" style="margin-bottom: 15px" /> <input
							name="memberPw" id="memberPw" type="password" class="form-control"
							placeholder="비밀번호" style="margin-bottom: 20px"
							onkeydown="javascript:if (event.keyCode == 13) { Fn_getLoginActive(); return false;}" />

						<button class="btn btn-primary btn-lg"
							style="width: 100%; margin-top: 10px; margin-bottom: 20px; font-size: 20px; font-weight: bold"
							onclick="Fn_getLoginActive()" title="로그인">로그인</button>
					</div>
					<div class="col-md-4"></div>
				</div>

			</div>
			<!--// container 끝 -->
	 
			<!-- Footer 시작 -->
			<div class="pc-login">
				<jsp:include page="/project/FooterPage.do" />
			</div>

			<div class="mobile-login" style="margin-top: 30%">
				<jsp:include page="/project/FooterPage.do" />
			</div>
			<!--// Footer 끝 -->			

		</div>
		<!--// container-fluid 끝 -->

	</form:form> 
</body>
</html>





















