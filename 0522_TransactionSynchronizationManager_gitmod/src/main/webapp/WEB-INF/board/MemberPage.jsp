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

<title>회원현황</title>

<link href="/css/member.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="/js/Member.js"></script>
<script type="text/javascript">
var frmContent = null;
	
	$(document).ready(function() {
		Fn_init();
	});
	
	function Fn_init(){
		frmContent = document.content;
		frmContent.action = "/project/MemberActive.do";
	}
	
	//엑셀 다운로드 1. 엑셀다운로드 버튼은 type 을 submit이 아닌 button으로 하고 아래처럼 처리해야함
	function Fn_userExl(){
		frmContent.action = "/project/ExcelPage1.do";
		frmContent.submit();
		
		/* 엑셀 창이 2개 열리는 경우 처리방법
		엑셀 상단 메뉴왼쪽에서 파일 - 옵션 - 리본 사용자지정 - 화면 우측 '개발도구' 체크 - 확인 ==> 화면 우측에 '개발도구' 없는경우 화면 좌측에서 선택 후 우측영역으로 추가
		엑셀 상단 메뉴바에 개발도구 클릭 - COM 추가기능 클릭 - 체크되어있는 항목 모두 체크해제 - 확인
		*/
	}
	


</script> 
</head>

<body>
	<form:form commandName="MemberVO" name="content" method="post" onsubmit="return false;">
		<!-- container-fluid 시작 -->
		<div class="container-fluid">

			<!-- Gnb 시작 -->
			<jsp:include page="/project/GnbActive.do" />
			<!--// Gnb 끝 -->

				<!-- 본문 시작 -->
	<div class="pc-user" style="margin-top:100px"></div>
	<div class="mobile-user" style="margin-top:80px"></div>

		 
	<div class="row">
		<div class="col-md-12">
			<div class="col-md-4 pc-user line_01"></div>
			<div class="col-md-4 text-center">
				<label class="control-label"><span style="font-size:25px">회원현황</span></label>
			</div>
			<div class="col-md-4 pc-user line_01"></div>
			<div class="mobile-user line_03">&nbsp;</div>
		</div>
	</div>
		
	<div class="row">
		<div class="col-md-4">
			<label style="font-size:17px">총&nbsp;<fmt:formatNumber value="${fn:length(userList)}" pattern="###,###,###,###" />건</label>
		</div>
		
		<div class="col-md-4">
			<div class="input-group" style="margin-bottom:15px">
				<input id="searchMember" name="searchMember" value="${MemberVO.searchMember}" type="text" class="form-control" placeholder='아이디 또는 성명 검색' onkeydown="javascript:if (event.keyCode == 13) { Fn_memberActive(); return false;}" />
				<span class="input-group-btn">
					<button type="submit" class="btn btn-primary text_color_white_bold" onclick="Fn_memberActive()" title="검색">검색</button>
				</span>
			</div>
		</div>
		
			<div class="col-md-4">
			<div class="form-group text-right" style="width:100%">
				<button type="submit" class="btn btn-primary text_color_white_bold" onclick="Fn_userExl()" title="엑셀로 내보내기">엑셀로 내보내기</button>
				 
			</div>
		</div>
	</div>
			<div class="row">
		<div class="col-md-12">
			
			<!--  PC용 목록 시작 -->
			<div class="pc-user">
				<table class="table">
					<colgroup> 
						<col width="5%" />
						<col width="30%" />
						<col width="30%" />
						<col width="15%" />
						<col width="10%" />
						<col width="10%" />
					</colgroup>
	
					<c:choose>
						<c:when test="${fn:length(memberList) > 0}">		
							<tr style="background:#AEB2BC;color:#FFFFFF">
								<td class="text-center" style="border-right:1px solid #dcdcdc"><b>순번</b></td>
								<td class="text-center" style="border-right:1px solid #dcdcdc"><b>아이디</b></td>
								<td class="text-center" style="border-right:1px solid #dcdcdc"><b>성명</b></td>
								<td class="text-center" style="border-right:1px solid #dcdcdc"><b>핸드폰</b></td>
								<td class="text-center" style="border-right:1px solid #dcdcdc"><b>등록일자</b></td>
								<td class="text-center" style="border-right:1px solid #dcdcdc"><b>유형</b></td>
							</tr>	
							
							
<c:forEach var="member" items="${memberList}" varStatus="status">
								<tr <c:if test="${status.last}">style="border-bottom:1px solid #dcdcdc"</c:if> >  
									<td class="text-center"><fmt:formatNumber value="${status.index+1}" pattern="###,###,###,###" /></td>
									<td class="text-left">${member.memberId}</td>
									<td class="text-left">${member.memberNm}</td>
									<td class="text-center">${member.memberPhone}</td>
									<td class="text-center">${member.insDt}</td>
									<td class="text-center">${member.memberRole}</td>
								</tr>
							</c:forEach>
						</c:when>							
							
						<c:otherwise>
							<tr>
								<td colspan="6" class="text-center" style="font-size:20px;border-bottom:1px solid #dcdcdc;background:#AEB2BC;color:#FFFFFF">
									등록된 회원이 없습니다
								</td>
							</tr>
						</c:otherwise>							
					</c:choose>
				</table>
			</div>
			<!--// PC용 목록 끝 -->
								
			<!-- 모바일용 목록 시작 -->
			<div class="mobile-user">
				<table class="table">
					<colgroup>
						<col width="10%" />
						<col width="60%" />
						<col width="30%" />
					</colgroup>
							
							
				<c:choose>
						<c:when test="${fn:length(memberList) > 0}">		
							<tr style="background:#AEB2BC;color:#FFFFFF">
								<td class="text-center" style="border-right:1px solid #dcdcdc"><b>순번</b></td>
								<td class="text-center" style="border-right:1px solid #dcdcdc"><b>회원</b></td>
								<td class="text-center" style="border-right:1px solid #dcdcdc"><b>등록일</b></td>
							</tr>
							<c:forEach var="member" items="${memberList}" varStatus="status">
								<tr <c:if test="${status.last}">style="border-bottom:1px solid #dcdcdc"</c:if> >
									<td class="text-center"><fmt:formatNumber value="${status.index+1}" pattern="###,###,###,###" /></td>
									
									<td class="text-left">
										<ul>
											<li><label class="control-label">아이디 :</label> ${member.memberId}</li>
											<li><label class="control-label">성명 :</label> ${member.memberNm}</li>
											<li><label class="control-label">핸드폰 :</label> ${member.memberPhone}</li>
										</ul>
									</td>
																
								
									<td class="text-left">
										<ul class="list-unstyled">
											<li><label class="control-label">&bull;&nbsp;&nbsp;등록일 :</label></li>
											<li style="margin-left:10px;margin-top:-5px;margin-bottom:5px">${member.insDt}</li>
											<li><label class="control-label">&bull;&nbsp;&nbsp;유형 :</label> ${member.memberRole}</li>
										</ul>
									</td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>							
							
						<tr>
								<td colspan="3" class="text-center" style="font-size:20px;border-bottom:1px solid #dcdcdc;background:#AEB2BC;color:#FFFFFF">
									등록된 회원이 없습니다
								</td>
							</tr>
						</c:otherwise>
					</c:choose>
				</table>
			</div>
			<!--// 모바일용 목록 끝 -->
			
		</div>
	</div>							
		
	<!-- Footer 시작 -->
	<div class="pc-user">
		<jsp:include page="/project/FooterPage.do" />
	</div>
	
	<div class="mobile-user" style="margin-top:30%">
			<jsp:include page="/project/FooterPage.do" />
	</div>
	<!--// Footer 끝 -->

</div>
<!--// container-fluid 끝 -->
</form:form>

</body>
</html>





















