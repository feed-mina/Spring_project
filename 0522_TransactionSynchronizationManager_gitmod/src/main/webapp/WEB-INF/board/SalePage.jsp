<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<jsp:include page="project/ComLodVariablePage.do" flush="alse">
<jsp:program name="locale" value="ko"/>
</jsp:include>

<title> 장비관리</title>

<script type="text/javascript">
var frmContent = null;

$(document).ready(function(){
Fn_init();
})

function Fn_init(){
	frmContent = document.content;
	frmContent.action = "/project/SaleActive.do";
	
}


function Fn_saleSet(memberId, houseNm, no){
	alertify.confirm(" 승인 하겠습니까?" , function(e){
	if(e){
		$.ajax({
			url : "/project/SaleSet.do",
			type:"post",
			data: { "memberId" : memberId, "houseNm" : houseNm, "no" : no},
			async : false,
			contentType:"application/x-www-form-urlencoded; charset=utf-8",
			success : function(data){
				var result = $.parseJSON(data);
				
				if(result.message == "success"){
				Fn_saleActive(); // 목록갱신
				alert(" 승인하시겠습니까?");
			} else{
				alert("승인되지 않았습니다. 관리자에게 물어보십시오");
				}
			});
		} else {
			return;
			}
		});
	}
	
</script>


<body>
<form:form comandName="SaleVO" name="content" method="post"
onsubmit="return false;">

	<!-- 본문 시작 -->
	<div class="pc-sale" style="margin-top:100px"></div>
	<div class="mobile-sale" style="margin-top:80px"></div>

	<div class="row">
		<div class="col-md-12">
			<div class="col-md-4 pc-sale line_01"></div>
			<div class="col-md-4 text-center">
				<label class="control-label"><span style="font-size:25px">판매관리</span></label>
			</div>
			<div class="col-md-4 pc-sale line_01"></div>
			<div class="mobile-sale line_03">&nbsp;</div>
		</div>
	</div>
	
	<div style="margin-top:30px"></div>
		
	<div class="row">
		<div class="col-md-4">
			<label style="font-size:17px">총&nbsp;<fmt:formatNumber value="${fn:length(saleList)}" pattern="###,###,###,###" />건</label>
		</div>
		
		<div class="col-md-4">
			<div class="input-group" style="margin-bottom:15px">
				<input id="searchSale" name="searchSale" value="${SaleVO.searchSale}" type="text" class="form-control" placeholder='장비명 또는 구매자 검색' onkeydown="javascript:if (event.keyCode == 13) { Fn_saleActive(); return false;}" />
				<span class="input-group-btn">
					<button type="submit" class="btn btn-primary text_color_white_bold" onclick="Fn_saleActive()" title="검색">검색</button>
				</span>
			</div>
		</div>
		
		<div class="col-md-4" style="margin-bottom:29px">&nbsp;</div>
	</div>
			
	<div class="row">
		<div class="col-md-12">
			
			<!--  PC용 목록 시작 -->
			<div class="pc-sale">
				<table class="table">
					<colgroup>
						<col width="5%" />
						<col width="20%" />
						<col width="15%" />						
						<col width="20%" />
						<col width="20%" />
						<col width="10%" />
						<col width="10%" />
					</colgroup>
	
					<c:choose>
						<c:when test="${fn:length(saleList) > 0}">		
							<tr style="background:#AEB2BC;color:#FFFFFF">
								<td class="text-center" style="border-right:1px solid #dcdcdc"><b>순번</b></td>
								<td class="text-center" style="border-right:1px solid #dcdcdc"><b>장비명</b></td>
								<td class="text-center" style="border-right:1px solid #dcdcdc"><b>센서</b></td>
								<td class="text-center" style="border-right:1px solid #dcdcdc"><b>구매자</b></td>
								<td class="text-center" style="border-right:1px solid #dcdcdc"><b>하우스명</b></td>
								<td class="text-center" style="border-right:1px solid #dcdcdc"><b>요청일자</b></td>
								<td class="text-center" style="border-right:1px solid #dcdcdc"><b>승인일자</b></td>
							</tr>
							<c:forEach var="sale" items="${saleList}" varStatus="status">
								<tr <c:if test="${status.last}">style="border-bottom:1px solid #dcdcdc"</c:if> >  
									<td class="text-center"><fmt:formatNumber value="${status.index+1}" pattern="###,###,###,###" /></td>
									<td class="text-left">${sale.deviceNm}</td>
									<td class="text-left">${sale.sensorNm}</td>
									<td class="text-center">${sale.memberNm}</td>
									<td class="text-center">${sale.houseNm}</td>
									<td class="text-center">${sale.insDt}</td>
									<td class="text-center">
										<c:choose>
											<c:when test="${!empty sale.setDt}">
												${sale.setDt}
											</c:when>
											<c:otherwise>
												<button type="submit" style="margin-left:5px;margin-right:5px" class="btn btn-primary btn-xs" onclick="Fn_saleSet('${sale.memberId}', '${sale.houseNm}', '${sale.no}')" title="승인하기">승인하기</button>
											</c:otherwise>
										</c:choose>
									</td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr>
								<td colspan="7" class="text-center" style="font-size:20px;border-bottom:1px solid #dcdcdc;background:#AEB2BC;color:#FFFFFF">
									등록된 판매정보가 없습니다
								</td>
							</tr>
						</c:otherwise>
					</c:choose>
				</table>
			</div>
			<!--// PC용 목록 끝 -->
			
			<!-- 모바일용 목록 시작 -->
			<div class="mobile-sale">
				<table class="table">
					<colgroup>
						<col width="10%" />
						<col width="60%" />
						<col width="30%" />
					</colgroup>
	
					<c:choose>
						<c:when test="${fn:length(saleList) > 0}">		
							<tr style="background:#AEB2BC;color:#FFFFFF">
								<td class="text-center" style="border-right:1px solid #dcdcdc"><b>순번</b></td>
								<td class="text-center" style="border-right:1px solid #dcdcdc"><b>장비/구매자</b></td>
								<td class="text-center" style="border-right:1px solid #dcdcdc"><b>요청/승인일</b></td>
							</tr>
							<c:forEach var="sale" items="${saleList}" varStatus="status">
								<tr <c:if test="${status.last}">style="border-bottom:1px solid #dcdcdc"</c:if> >
									<td class="text-center"><fmt:formatNumber value="${status.index+1}" pattern="###,###,###,###" /></td>
									
									<td class="text-left">
										<ul>
											<li><label class="control-label">장비명 :</label> ${sale.deviceNm}</li>
											<li><label class="control-label">센서 :</label> ${sale.sensorNm}</li>
											<li><label class="control-label">구매자 :</label> ${sale.memberNm}</li>
											<li><label class="control-label">하우스명 :</label> ${sale.houseNm}</li>
										</ul>
									</td>
									
									<td class="text-left">
										<ul class="list-unstyled">
											<li><label class="control-label">요청 :</label> ${sale.insDt}</li>
											<li>
												<c:choose>
													<c:when test="${!empty sale.setDt}">
														<label class="control-label">승인 :</label> ${sale.setDt}
													</c:when>
													<c:otherwise>
														<button type="submit" style="margin-left:5px;margin-right:5px" class="btn btn-primary btn-xs" onclick="Fn_saleSet('${sale.memberId}', '${sale.houseNm}', '${sale.no}')" title="승인하기">승인하기</button>
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
									등록된 판매정보가 없습니다
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
	<div class="pc-sale">
		<jsp:include page="/project/FooterPage.do" />
	</div>
	
	<div class="mobile-sale" style="margin-top:30%">
			<jsp:include page="/project/FooterPage.do" />
	</div>
	<!--// Footer 끝 -->
<!--// container-fluid 끝 -->
</form:form>

</body>
</html><%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<jsp:include page="project/ComLodVariablePage.do" flush="alse">
<jsp:program name="locale" value="ko"/>
</jsp:include>

<title> 장비관리</title>

<script type="text/javascript">
var frmContent = null;

$(document).ready(function(){
Fn_init();
})

function Fn_init(){
	frmContent = document.content;
	frmContent.action = "/project/SaleActive.do";
	
}


function Fn_saleSet(memberId, houseNm, no){
	alertify.confirm(" 승인 하겠습니까?" , function(e){
	if(e){
		$.ajax({
			url : "/project/SaleSet.do",
			type:"post",
			data: { "memberId" : memberId, "houseNm" : houseNm, "no" : no},
			async : false,
			contentType:"application/x-www-form-urlencoded; charset=utf-8",
			success : function(data){
				var result = $.parseJSON(data);
				
				if(result.message == "success"){
				Fn_saleActive(); // 목록갱신
				alert(" 승인하시겠습니까?");
			} else{
				alert("승인되지 않았습니다. 관리자에게 물어보십시오");
				}
			});
		} else {
			return;
			}
		});
	}
	
</script>


<body>
<form:form comandName="SaleVO" name="content" method="post"
onsubmit="return false;">

	<!-- 본문 시작 -->
	<div class="pc-sale" style="margin-top:100px"></div>
	<div class="mobile-sale" style="margin-top:80px"></div>

	<div class="row">
		<div class="col-md-12">
			<div class="col-md-4 pc-sale line_01"></div>
			<div class="col-md-4 text-center">
				<label class="control-label"><span style="font-size:25px">판매관리</span></label>
			</div>
			<div class="col-md-4 pc-sale line_01"></div>
			<div class="mobile-sale line_03">&nbsp;</div>
		</div>
	</div>
	
	<div style="margin-top:30px"></div>
		
	<div class="row">
		<div class="col-md-4">
			<label style="font-size:17px">총&nbsp;<fmt:formatNumber value="${fn:length(saleList)}" pattern="###,###,###,###" />건</label>
		</div>
		
		<div class="col-md-4">
			<div class="input-group" style="margin-bottom:15px">
				<input id="searchSale" name="searchSale" value="${SaleVO.searchSale}" type="text" class="form-control" placeholder='장비명 또는 구매자 검색' onkeydown="javascript:if (event.keyCode == 13) { Fn_saleActive(); return false;}" />
				<span class="input-group-btn">
					<button type="submit" class="btn btn-primary text_color_white_bold" onclick="Fn_saleActive()" title="검색">검색</button>
				</span>
			</div>
		</div>
		
		<div class="col-md-4" style="margin-bottom:29px">&nbsp;</div>
	</div>
			
	<div class="row">
		<div class="col-md-12">
			
			<!--  PC용 목록 시작 -->
			<div class="pc-sale">
				<table class="table">
					<colgroup>
						<col width="5%" />
						<col width="20%" />
						<col width="15%" />						
						<col width="20%" />
						<col width="20%" />
						<col width="10%" />
						<col width="10%" />
					</colgroup>
	
					<c:choose>
						<c:when test="${fn:length(saleList) > 0}">		
							<tr style="background:#AEB2BC;color:#FFFFFF">
								<td class="text-center" style="border-right:1px solid #dcdcdc"><b>순번</b></td>
								<td class="text-center" style="border-right:1px solid #dcdcdc"><b>장비명</b></td>
								<td class="text-center" style="border-right:1px solid #dcdcdc"><b>센서</b></td>
								<td class="text-center" style="border-right:1px solid #dcdcdc"><b>구매자</b></td>
								<td class="text-center" style="border-right:1px solid #dcdcdc"><b>하우스명</b></td>
								<td class="text-center" style="border-right:1px solid #dcdcdc"><b>요청일자</b></td>
								<td class="text-center" style="border-right:1px solid #dcdcdc"><b>승인일자</b></td>
							</tr>
							<c:forEach var="sale" items="${saleList}" varStatus="status">
								<tr <c:if test="${status.last}">style="border-bottom:1px solid #dcdcdc"</c:if> >  
									<td class="text-center"><fmt:formatNumber value="${status.index+1}" pattern="###,###,###,###" /></td>
									<td class="text-left">${sale.deviceNm}</td>
									<td class="text-left">${sale.sensorNm}</td>
									<td class="text-center">${sale.memberNm}</td>
									<td class="text-center">${sale.houseNm}</td>
									<td class="text-center">${sale.insDt}</td>
									<td class="text-center">
										<c:choose>
											<c:when test="${!empty sale.setDt}">
												${sale.setDt}
											</c:when>
											<c:otherwise>
												<button type="submit" style="margin-left:5px;margin-right:5px" class="btn btn-primary btn-xs" onclick="Fn_saleSet('${sale.memberId}', '${sale.houseNm}', '${sale.no}')" title="승인하기">승인하기</button>
											</c:otherwise>
										</c:choose>
									</td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr>
								<td colspan="7" class="text-center" style="font-size:20px;border-bottom:1px solid #dcdcdc;background:#AEB2BC;color:#FFFFFF">
									등록된 판매정보가 없습니다
								</td>
							</tr>
						</c:otherwise>
					</c:choose>
				</table>
			</div>
			<!--// PC용 목록 끝 -->
			
			<!-- 모바일용 목록 시작 -->
			<div class="mobile-sale">
				<table class="table">
					<colgroup>
						<col width="10%" />
						<col width="60%" />
						<col width="30%" />
					</colgroup>
	
					<c:choose>
						<c:when test="${fn:length(saleList) > 0}">		
							<tr style="background:#AEB2BC;color:#FFFFFF">
								<td class="text-center" style="border-right:1px solid #dcdcdc"><b>순번</b></td>
								<td class="text-center" style="border-right:1px solid #dcdcdc"><b>장비/구매자</b></td>
								<td class="text-center" style="border-right:1px solid #dcdcdc"><b>요청/승인일</b></td>
							</tr>
							<c:forEach var="sale" items="${saleList}" varStatus="status">
								<tr <c:if test="${status.last}">style="border-bottom:1px solid #dcdcdc"</c:if> >
									<td class="text-center"><fmt:formatNumber value="${status.index+1}" pattern="###,###,###,###" /></td>
									
									<td class="text-left">
										<ul>
											<li><label class="control-label">장비명 :</label> ${sale.deviceNm}</li>
											<li><label class="control-label">센서 :</label> ${sale.sensorNm}</li>
											<li><label class="control-label">구매자 :</label> ${sale.memberNm}</li>
											<li><label class="control-label">하우스명 :</label> ${sale.houseNm}</li>
										</ul>
									</td>
									
									<td class="text-left">
										<ul class="list-unstyled">
											<li><label class="control-label">요청 :</label> ${sale.insDt}</li>
											<li>
												<c:choose>
													<c:when test="${!empty sale.setDt}">
														<label class="control-label">승인 :</label> ${sale.setDt}
													</c:when>
													<c:otherwise>
														<button type="submit" style="margin-left:5px;margin-right:5px" class="btn btn-primary btn-xs" onclick="Fn_saleSet('${sale.memberId}', '${sale.houseNm}', '${sale.no}')" title="승인하기">승인하기</button>
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
									등록된 판매정보가 없습니다
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
	<div class="pc-sale">
		<jsp:include page="/project/FooterPage.do" />
	</div>
	
	<div class="mobile-sale" style="margin-top:30%">
			<jsp:include page="/project/FooterPage.do" />
	</div>
	<!--// Footer 끝 -->
<!--// container-fluid 끝 -->
</form:form>

</body>
</html>