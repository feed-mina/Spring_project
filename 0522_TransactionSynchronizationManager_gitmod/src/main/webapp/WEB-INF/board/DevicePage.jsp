<%@ page contentType="text/html; charset=utf-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1" />

<!-- S :: 공통 INCLUDE -->

<jsp:include page="/project/LodVariablePage.do" flush="false">
	<jsp:param name="locale" value="ko"/>
</jsp:include>

<title>장비관리</title>
<link href="/css/device.css" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="/js/Device.js"></script>
<script type="text/javascript">
	var frmContent = null;

	$(document).ready(function() {
		Fn_init();
	});

	function Fn_init() {
		frmContent = document.content;
		frmContent.action = "/project/DeviceActive.do";
	}
</script> 

</head>
<body>
<form:form commandName="DeviceVO" name="content" method="post"
		onsubmit="return false;">
		<!-- container-fluid 시작 -->
		<div class="container-fluid">

			<!-- Gnb 시작 -->
			<jsp:include page="/project/GnbActive.do" />
			<!--// Gnb 끝 -->
	<!-- 본문 시작 -->
			<div class="pc-dem" style="margin-top: 100px"></div>
			<div class="mobile-dem" style="margin-top: 80px"></div>

			<div class="row">
				<div class="col-md-12">
					<div class="col-md-4 pc-dem line_01"></div>
					<div class="col-md-4 text-center">
						<label class="control-label"><span style="font-size: 25px">장비관리</span></label>
					</div>
					<div class="col-md-4 pc-dem line_01"></div>
					<div class="mobile-dem line_03">&nbsp;</div>
				</div>
			</div>

			<div style="margin-top: 30px"></div>

			<div class="row">
				<div class="col-md-4">
					<label style="font-size: 17px">총&nbsp;<fmt:formatNumber
							value="${fn:length(deviceList)}" pattern="###,###,###,###" />건
					</label>
				</div>

				<div class="col-md-4">
					<div class="input-group" style="margin-bottom: 15px">
						<input id="searchDevice" name="searchDevice"
							value="${DeviceVO.searchDevice}" type="text" class="form-control"
							placeholder='장비명 또는 모델명 또는 센서 검색'
							onkeydown="javascript:if (event.keyCode == 13) { Fn_deviceActive(); return false;}" />
						<span class="input-group-btn">
							<button type="submit"
								class="btn btn-primary text_color_white_bold"
								onclick="Fn_deviceActive()" title="중복체크">검색</button>
						</span>
					</div>
				</div>

				<div class="col-md-4">
					<div class="form-group text-right" style="width: 100%">
						<button type="submit"
							class="btn btn-primary text_color_white_bold"
							onclick="Fn_DeviceWrtPopPage()" title="장비추가">장비추가</button>
					</div>
				</div>
			</div>

			<div class="row">
				<div class="col-md-12">


					<!--  PC용 목록 시작 -->
					<div class="pc-dem">
						<table class="table">
							<colgroup>
								<col width="5%" />
								<col width="20%" />
								<col width="20%" />
								<col width="11%" />
								<col width="11%" />
								<col width="11%" />
								<col width="11%" />
								<col width="11%" />
							</colgroup>

							<c:choose>
								<c:when test="${fn:length(deviceList) > 0}">
									<tr style="background: #AEB2BC; color: #FFFFFF">
										<td class="text-center"
											style="border-right: 1px solid #dcdcdc"><b>순번</b></td>
										<td class="text-center"
											style="border-right: 1px solid #dcdcdc"><b>장비명</b></td>
										<td class="text-center"
											style="border-right: 1px solid #dcdcdc"><b>모델명</b></td>
										<td class="text-center"
											style="border-right: 1px solid #dcdcdc"><b>센서</b></td>
										<td class="text-center"
											style="border-right: 1px solid #dcdcdc"><b>단위</b></td>
										<td class="text-center"
											style="border-right: 1px solid #dcdcdc"><b>관리기준 상한 값</b></td>
										<td class="text-center"
											style="border-right: 1px solid #dcdcdc"><b>관리기준 하한 값</b></td>
										<td class="text-center"></td>
									</tr>
									<c:forEach var="device" items="${deviceList}"
										varStatus="status">
										<tr
											<c:if test="${status.last}">style="border-bottom:1px solid #dcdcdc"</c:if>>
											<td class="text-center"><fmt:formatNumber
													value="${status.index+1}" pattern="###,###,###,###" /></td>
											<td class="text-left">${device.deviceNm}</td>
											<td class="text-left">${device.modelNm}</td>
											<td class="text-center">${device.sensorNm}</td>
											<td class="text-center">${device.sensorUn}</td>
											<td class="text-center">${device.maxStd}</td>
											<td class="text-center">${device.minStd}</td>
											<td class="text-center">
												<button type="submit"
													style="margin-left: 5px; margin-right: 5px"
													class="btn btn-primary btn-xs"
													onclick="Fn_DeviceMdfPopPage('${device.deviceId}')"
													title="수정">수정</button>
											</td>
										</tr>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<tr>
										<td colspan="8" class="text-center"
											style="font-size: 20px; border-bottom: 1px solid #dcdcdc; background: #AEB2BC; color: #FFFFFF">
											등록된 장비가 없습니다</td>
									</tr>
								</c:otherwise>
							</c:choose>
						</table>
					</div>
					<!--// PC용 목록 끝 -->



					<!-- 모바일용 목록 시작 -->
					<div class="mobile-dem">
						<table class="table">
							<colgroup>
								<col width="10%" />
								<col width="80%" />
								<col width="10%" />
							</colgroup>

							<c:choose>
								<c:when test="${fn:length(deviceList) > 0}">
									<tr style="background: #AEB2BC; color: #FFFFFF">
										<td class="text-center"
											style="border-right: 1px solid #dcdcdc"><b>순번</b></td>
										<td class="text-center" colspan="2"
											style="border-right: 1px solid #dcdcdc"><b>장비</b></td>
									</tr>
									<c:forEach var="device" items="${deviceList}"
										varStatus="status">
										<tr
											<c:if test="${status.last}">style="border-bottom:1px solid #dcdcdc"</c:if>>
											<td class="text-center"><fmt:formatNumber
													value="${status.index+1}" pattern="###,###,###,###" /></td>

											<td class="text-left">
												<ul>
													<li><label class="control-label">장비명 :</label>
														${device.deviceNm}</li>
													<li><label class="control-label">모델명 :</label>
														${device.modelNm}</li>
													<li><label class="control-label">센서 :</label>
														${device.sensorNm}(${device.sensorUn})</li>
													<li><label class="control-label">관리기준 상/하한 값 :</label>
														${device.maxStd} / ${device.minStd}</li>
												</ul>
											</td>

											<td class="text-center">
												<button type="submit"
													style="margin-left: 5px; margin-right: 5px"
													class="btn btn-primary btn-xs"
													onclick="Fn_DeviceMdfPopPage('${device.deviceId}')"
													title="수정">수정</button>
											</td>
										</tr>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<tr>
										<td colspan="3" class="text-center"
											style="font-size: 20px; border-bottom: 1px solid #dcdcdc; background: #AEB2BC; color: #FFFFFF">
											등록된 장비가 없습니다</td>
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
			<div class="pc-dem">
				<jsp:include page="/project/FooterPage.do" />
			</div>

			<div class="mobile-dem" style="margin-top: 30%">
				<jsp:include page="/project/FooterPage.do" />
			</div>
			<!--// Footer 끝 -->

		</div>
		<!--// container-fluid 끝 -->
	</form:form>






</body>
</html>