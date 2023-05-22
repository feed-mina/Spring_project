<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<jsp:include page="/project/ComLodVariablePage.do" flush="alse">
<jsp:program name="locale" value="ko"/>
</jsp:include>

<title> 장비 구매</title>

<link href="/css/sensor.css" rel="stylesheet" type="text/css"/>

<script type="text/javascript" src="/js/Sensor.js"></script>
<script type="text/javascript">
var frmContent = null;
$(document).ready(function(){
Fn_init();
});

function Fn_init(){
frmContent = document.content;
frmContent.action = "/project/SensorActive.do";
}
</script>
</head>
<body>
<form:form commandName="SensorVo" name="content" method="post" onsubmit="return false;">


<!-- container-fluid 시작 -->
<div class="container-fluid">

	<!-- Gnb 시작 -->	
	<jsp:include page="/project/GnbActive.do" />
	<!--// Gnb 끝 -->
	
	<!-- 본문 시작 -->
	<div class="pc-pur" style="margin-top:100px"></div>
	<div class="mobile-pur" style="margin-top:80px"></div>

	<div class="row">
		<div class="col-md-12">
			<div class="col-md-4 pc-pur line_01"></div>
			<div class="col-md-4 text-center">
				<label class="control-label"><span style="font-size:25px">장비구매</span></label>
			</div>
			<div class="col-md-4 pc-pur line_01"></div>
			<div class="mobile-pur line_03">&nbsp;</div>
		</div>
	</div>
	
	<div style="margin-top:30px"></div>
		
	<div class="row">
		<div class="col-md-4">
			<label style="font-size:17px">총&nbsp;<fmt:formatNumber value="${fn:length(sensorList)}" pattern="###,###,###,###" />건</label>
		</div>
		
		<div class="col-md-4">
			<div class="input-group" style="margin-bottom:15px">
				<input id="searchSensor" name="searchSensor" value="${SensorVO.searchSensor}" type="text" class="form-control" placeholder='장비명 또는 센서 검색' onkeydown="javascript:if (event.keyCode == 13) { Fn_sensorActive(); return false;}" />
				<span class="input-group-btn">
					<button type="submit" class="btn btn-primary text_color_white_bold" onclick="Fn_sensorActive()" title="검색">검색</button>
				</span>
			</div>
		</div>
		
		<div class="col-md-4">
			<div class="form-group text-right" style="width:100%">
				<button type="submit" class="btn btn-primary text_color_white_bold" onclick="Fn_sensorWrtPopPage()" title="구매요청">구매요청</button>
			</div>
		</div>
	</div>
			
	<div class="row">
		<div class="col-md-12">
			
			<!--  PC용 목록 시작 -->
			<div class="pc-pur">
				<table class="table">
					<colgroup>
						<col width="5%" />
						<col width="18%" />
						<col width="18%" />
						<col width="14%" />
						<col width="9%" />
						<col width="10%" />
						<col width="10%" />
						<col width="8%" />
						<col width="8%" />
					</colgroup>
	
					<c:choose>
						<c:when test="${fn:length(sensorList) > 0}">
							<tr style="background:#AEB2BC;color:#FFFFFF">
								<td class="text-center" style="border-right:1px solid #dcdcdc"><b>순번</b></td>
								<td class="text-center" style="border-right:1px solid #dcdcdc"><b>하우스명</b></td>
								<td class="text-center" style="border-right:1px solid #dcdcdc"><b>장비명</b></td>
								<td class="text-center" style="border-right:1px solid #dcdcdc"><b>센서</b></td>
								<td class="text-center" style="border-right:1px solid #dcdcdc"><b>단위</b></td>
								<td class="text-center" style="border-right:1px solid #dcdcdc"><b>관리기준 상한 값</b></td>
								<td class="text-center" style="border-right:1px solid #dcdcdc"><b>관리기준 하한 값</b></td>
								<td class="text-center" style="border-right:1px solid #dcdcdc"><b>요청일자</b></td>
								<td class="text-center" style="border-right:1px solid #dcdcdc"><b>승인일자</b></td>
							</tr>
							<c:forEach var="sensor" items="${sensorList}" varStatus="status">
								<tr <c:if test="${status.last}">style="border-bottom:1px solid #dcdcdc"</c:if> >  
									<td class="text-center"><fmt:formatNumber value="${status.index+1}" pattern="###,###,###,###" /></td>
									<td class="text-center">${sensor.houseNm}</td>
									<td class="text-center">${sensor.deviceNm}</td>
									<td class="text-center">${sensor.sensorNm}</td>
									<td class="text-center">${sensor.sensorUn}</td>
									<td class="text-center">${sensor.maxStd}</td>
									<td class="text-center">${sensor.minStd}</td>
									<td class="text-center">${sensor.insDt}</td>
									<td class="text-center">
										<c:choose>
											<c:when test="${!empty sensor.setDt}">
												${sensor.setDt}
											</c:when>
											<c:otherwise>
												<span class="text_color_red_bold">미승인</span>
											</c:otherwise>
										</c:choose>	
									</td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr>
								<td colspan="9" class="text-center" style="font-size:20px;border-bottom:1px solid #dcdcdc;background:#AEB2BC;color:#FFFFFF">
									등록된 구매정보가 없습니다
								</td>
							</tr>
						</c:otherwise>
					</c:choose>
				</table>
			</div>
			<!--// PC용 목록 끝 -->
			
			<!-- 모바일용 목록 시작 -->
			<div class="mobile-pur">
				<table class="table">
					<colgroup>
						<col width="10%" />
						<col width="60%" />
						<col width="30%" />
					</colgroup>
	
					<c:choose>
						<c:when test="${fn:length(sensorList) > 0}">		
							<tr style="background:#AEB2BC;color:#FFFFFF">
								<td class="text-center" style="border-right:1px solid #dcdcdc"><b>순번</b></td>
								<td class="text-center" style="border-right:1px solid #dcdcdc"><b>하우스/장비</b></td>
								<td class="text-center" style="border-right:1px solid #dcdcdc"><b>요청/승인일</b></td>
							</tr>
							<c:forEach var="pur" items="${purList}" varStatus="status">
								<tr <c:if test="${status.last}">style="border-bottom:1px solid #dcdcdc"</c:if> >
									<td class="text-center"><fmt:formatNumber value="${status.index+1}" pattern="###,###,###,###" /></td>
									
									<td class="text-left">
										<ul>
											<li><label class="control-label">하우스 :</label> ${sensor.houseNm}</li>
											<li><label class="control-label">장비명 :</label> ${sensor.deviceNm}(${sensor.sensorNm})</li>
											<li><label class="control-label">구매자 :</label> ${sensor.memberNm}</li>
										</ul>
									</td>
									
									<td class="text-left">
										<ul class="list-unstyled">
											<li><label class="control-label">&bull;&nbsp;&nbsp;요청 :</label> ${pur.insDt}</li>
											<li><label class="control-label">&bull;&nbsp;&nbsp;승인 :</label> 
												<c:choose>
													<c:when test="${!empty pur.setDt}">
														${pur.setDt}
													</c:when>
													<c:otherwise>
														<span class="text_color_red_bold">미승인</span>
													</c:otherwise>
												</c:choose>	
											</li>
										</ul>
									</td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr>
								<td colspan="3" class="text-center" style="font-size:20px;border-bottom:1px solid #dcdcdc;background:#AEB2BC;color:#FFFFFF">
									등록된 구매정보가 없습니다
								</td>
							</tr>
						</c:otherwise>
					</c:choose>
				</table>
			</div>
			<!--// 모바일용 목록 끝 -->
			
		</div>
	</div>
	<!--// 본문 끝 -->
	
	<!-- Footer 시작 -->
	<div class="pc-pur">
		<jsp:include page="/project/FooterPage.do" />
	</div>
	
	<div class="mobile-pur" style="margin-top:30%">
		<jsp:include page="/project/FooterPage.do" />
	</div>
	<!--// Footer 끝 -->

</div>
<!--// container-fluid 끝 -->
</form:form>

</body>
</html>