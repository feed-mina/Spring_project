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

<title>모니터링</title>
    
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.bundle.min.js"></script>
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"></script>
	


<link href="/css/monitor.css" rel="stylesheet" type="text/css" />
	<style>
	   /*화면 좌측 장비와 센서 전체 틀*/
	   .myTree {
	        height:147px;
	        overflow-y:auto;
	    }
	    
	    /*화면 촤측 장비*/
		.du{
			line-height:30px;
			border-bottom:1px solid #e5e5e5;
			background:#EBEBEB
		}
		
		/*화면 촤측 센서*/
		.se{
			line-height:30px;
			border-bottom:1px solid #e5e5e5;
		}
	</style>

<script type="text/javascript" src="/js/Monitor.js"></script>
<script type="text/javascript">
	var frmContent = null;

	$(document).ready(function() {
		Fn_init();
	});

	function Fn_init() {
		frmContent = document.content;
		frmContent.action = "/project/MonitorActive.do";
		
		initCal({id:"searchDtFrom",type:"day",today:"y"});
		initCal({id:"searchDtTo",type:"day",today:"y"});
	}
	
	
	//하우스 선택시 처리
	function Fn_setHouseActive(val){
		if(val == ""){
			alert("하우스를 선택하세요");
		}else{
			frmContent.action = "/project/MonitorActive.do";
			frmContent.submit();
		}
	}
	
</script> 

</head>
<body>
 <form:form commandName="MonitorVO" name="content" method="post" onsubmit="return false;">
 
<!-- container-fluid 시작 -->
<div class="container-fluid">

	<!-- Gnb 시작 -->	
	<jsp:include page="/project/GnbActive.do" />
	<!--// Gnb 끝 -->
	
	<!-- 본문 시작 -->
	<div class="pc-mot" style="margin-top:100px"></div>
	<div class="mobile-mot" style="margin-top:80px"></div>
 <div class="row">
		<div class="col-md-12">
			<div class="col-md-4 pc-mot line_01"></div>
			<div class="col-md-4 text-center">
				<label class="control-label"><span style="font-size:25px">모니터링</span></label>
			</div>
			<div class="col-md-4 pc-mot line_01"></div>
			<div class="mobile-mot line_03">&nbsp;</div>
		</div>
	</div>
	
	<div style="margin-top:30px"></div>
		
 
	<div class="row">
		
		<!-- 트리 시작  -->
		<div class="col-md-3">

			<div class="row">
				<div class="col-md-12">
					<ul class="list-unstyled">
						<li style="float:left;width:100%">
							<select class="form-control" id="searchHouseNm" name="searchHouseNm" onChange="Fn_setHouseActive(this.value)">
								<option value="">- 하우스 선택 -</option>
								<c:choose>
									<c:when test="${fn:length(houseList) > 0}">
										<c:forEach var="house" items="${houseList}" varStatus="status">
											<option value="${house.houseNm}" <c:if test="${house.houseNm == EgovMotVO.searchHouseNm}"> selected</c:if> >${house.houseNm}</option>
										</c:forEach>
									</c:when>
									<c:otherwise>
										<option value="">정보가 없습니다</option>
									</c:otherwise>
								</c:choose>
							</select>
						</li>
					</ul>
				</div>
			</div>
	
			</div>
	
			<div style="margin-top:10px"></div>
			
			<div class="row">
				<div class="col-md-12">
					<ul class="list-unstyled">
						<li style="float:left">
							<form:input path="searchDtFrom" class="form-control" placeholder="검색 일자(From)" style="width:128px;text-align:center;IME-Mode:disabled" maxlength="10" onkeypress="return Fn_setOnlyNumberActive(event)" />
						</li>
						
						<li style="float:left;margin-top:7px">&nbsp;&nbsp;~&nbsp;&nbsp;</li>
						
						<li style="float:left">
							<form:input path="searchDtTo" class="form-control" placeholder="검색 일자(To)" style="width:128px;text-align:center;IME-Mode:disabled" maxlength="10" onkeypress="return Fn_setOnlyNumberActive(event)" />
						</li>
						
						<li id="tot" style="float:right;font-weight:bold;margin-top:7px">
							<span></span>
						</li>
					</ul>
				</div>
			</div>

			<div style="margin-top:20px"></div>

			<div class="row">
				<div class="col-md-12">
					<div class="myTree4" style="border:1px solid #e5e5e5">
						<c:choose>
							<c:when test="${fn:length(deviceList) > 0}">
								<c:forEach var="dev" items="${deviceList}" varStatus="status">
									
									<div class="du" style="padding-top:2px;background:#4CAF50;color:#FFFFFF;font-weight:bold"><span style="margin-left:10px">${dev.deviceNm}</span></div>
										
										<c:if test="${fn:length(sensorList) > 0}">
											<c:forEach var="sen" items="${sensorList}" varStatus="status">
												<c:if test="${dev.sensorId eq sen.sensorId}">
													<div id="${dev.deviceId}_${sen.sensorId}" class="se pointer" style="padding-left:20px;font-weight:bold" onclick="Fn_monitorValue('${sen.deviceId}', '${sen.sensorId}')">
														${sen.sensorNm}
													</div>
												</c:if>	
											</c:forEach>
										</c:if>
										
								</c:forEach>
							</c:when>
							<c:otherwise>
								등록된 센서정보가 없습니다
							</c:otherwise>
						</c:choose>
					</div>
				</div>
			</div>
		</div>			
		<!-- 트리 끝  -->
			 
 	<!-- 차트 시작  -->
		<div class="col-md-9">
			<%-- 처음에 보여줄 가짜 차트 --%>
			<div class="mobile-mot"><div style="margin-top:30px"></div></div>
			<div id="dchart" style="border:1px solid #e5e5e5;min-height:400px;width:100%;background:#FFFFFF">
				<canvas id="myChart2"></canvas>
			</div>
			
			<%-- 진행바 --%>
			<div id="loading" style="position:absolute;top:20%;left:40%;display:none">
				<img src="/images/common/loading_sm.gif" />
			</div>
			
			<%-- 진짜 차트 --%>
			<div class="mobile-mot"><div style="margin-top:30px"></div></div>
			<div id="rchart" style="border:1px solid #e5e5e5;height:55vh;width:100%;background:#FFFFFF;display:none">
				<canvas id="myChart"></canvas>
			</div>
			


			<script>
				//처음에 보여줄 가짜 차트
				var ctx = document.getElementById('myChart2');

				var config = {
					type: 'line',
					data: {
						labels: [ 'data1', 'data2', 'data3', 'data4', 'data5', 'data6', 'data7' ]
					},
					options: {
						maintainAspectRatio: false
					}
				};
				var myChart2 = new Chart(ctx, config);
				//처음에 보여줄 가짜 차트
				
		        var oldCssId;
		        var count = 0;//측정기 항목 선택한 배경색 처리용
		        var myChart;
		        var valueTot = 0;//계측값 수
				
				//데이터 변경
				function Fn_monitorValuetValue(deviceId, sensorId){
					if($("#searchHouseNm").val() == ""){
						alert("하우스를 선택하세요");
						$("#searchHouseNm").focus();
						
						return;
					}
					
					if($("#searchDtFrom").val() == ""){
						alert("검색 일자(From)를 입력하세요");
						$("#searchDtFrom").focus();
						
						return;
					}
					
					if($("#searchDtTo").val() == ""){
						alert("검색 일자(To)를 입력하세요");
						$("#searchDtTo").focus();
						
						return;
					}					
					
					$("#deviceId").val(deviceId);
					$("#sensorId").val(sensorId);
    				$("#loading").show(); //진행 중 시작
					
		            $.ajax({
		    			url: "/project/MonitorGetValueActive.do",
		    			type: "post",
		    			data: {"deviceId" : deviceId, "sensorId" : sensorId, "searchDtFrom" : $("#searchDtFrom").val(), "searchDtTo" : $("#searchDtTo").val(), "searchHouseNm" : $("#searchHouseNm").val()},
		    			//async:false, //이걸 쓰면 동기식(디폴트로 비동기식 : async:true, 동기식 : 서버응답을 모두 완료후 다음로직 수행 )으로 사용한다는 뜻인데, 그렇게 되면 "진행 중" 작동안함
		    			contentType: "application/x-www-form-urlencoded; charset=utf-8",
		    			success: function(data){
		    				var result = $.parseJSON(data);
		    				valueTot = result.valueTot;//계측값 수

		    				//차트 시작(센서를 선택할때마다 차트를 새로그림)
							var ctx = document.getElementById('myChart');

							if(valueTot == ""){//계측값 없는 경우
						        if(myChart != undefined){
						        	myChart.destroy();
						        }
								
						        $("#rchart").hide();//진짜 차트 숨김	
							}else{
			    				myChart2.destroy();//가짜 차트 파괴
			    				$("#dchart").hide();//가짜 차트 숨김	
			    				$("#noDate *").remove();//계측값 없습니다 제거

			    				var htm = "<span>총 " + valueTot.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + " 건</span>";
								$("#tot *").remove();
								$("#tot").append(htm);
								
			    				//좌측 트리 목록. 선택한 목록 배경색 변경 시작
			    				count++;
			    				var cssId = deviceId+"_"+sensorId;
			    				$("#"+cssId).css("color","#FFFFFF");
			    				$("#"+cssId).css("background-color","#6D8FF3");
			    				
			    				if(count == 1){//첫번째는 아무것도 할게 없음
			    					oldCssId = cssId;
			    				}else{
			    					if(oldCssId != cssId){//다른 항목선택시 기존 선택된 항목 배경색 원위치
				    					$("#"+oldCssId).css("color","");
				    					$("#"+oldCssId).css("background-color","");
				    					
				    					oldCssId = cssId;
			    					}
			    				}
			    				//좌측 트리 목록. 선택한 목록 배경색 변경
			    				
								//가로 선 넣기. 상/하한선
								var horizonalLinePlugin = {
									afterDraw: function(chartInstance) {
										var yScale = chartInstance.scales["y-axis-0"];
										var canvas = chartInstance.chart;
										var ctx = canvas.ctx;
										var index;
										var line;
										var style;
										if (chartInstance.options.horizontalLine) {
											for (index = 0; index < chartInstance.options.horizontalLine.length; index++) {
												line = chartInstance.options.horizontalLine[index];
												if (!line.style) {
													style = "rgba(169,169,169, .6)";
										        } else {
										          style = line.style;
										        }
										        if (line.y) {
										          yValue = yScale.getPixelForValue(line.y);
										        } else {
										          yValue = 0;
										        }
										        ctx.lineWidth = 0.5;
										        if (yValue) {
										          ctx.beginPath();
										          ctx.moveTo(0, yValue);
										          ctx.lineTo(canvas.width, yValue);
										          ctx.strokeStyle = style;
										          ctx.stroke();
										        }
										        if (line.text) {
										          ctx.fillStyle = style;
										          ctx.fillText(line.text, 0, yValue + ctx.lineWidth);
										        }
											}
											return;
										};
									}
								};
								Chart.pluginService.register(horizonalLinePlugin);
								
								var chartData = {
									labels: ["", "", "", "", "", "", ""],//가로값(조회일자)
									datasets: [ {backgroundColor: 'rgb(109, 143, 243)',borderColor: 'rgb(109, 143, 243)',fill: false, data: [] }]//세로값(계측데이터)
								};
		
			    				//가로값(조회일자) 값넣기
			    				var labels = chartData.labels;
								for(var i=0; i<result.valueList.length; i++){
									labels[i] = result.valueList[i].ssvDt;
								}
								
								//세로값(계측데이터) 값넣기
								var data = chartData.datasets[0].data;    
								for(var j=0; j<result.valueList.length; j++){
									data[j] = result.valueList[j].cValue;//계측데이터
								}
								
								//범례 값 처리(선택한 센서명) 값넣기
								chartData.datasets[0].label = result.sensorNm;
			    				
								//관리기준 상/하한 값
								var maxStd = result.maxStd;//상한
								var minStd = result.minStd;//하한
								
								var config = {
									type: 'line',
									data: chartData,
									options: {
										responsive: true,
										maintainAspectRatio: false,
										tooltips: { enabled: false }, //툴팁 제거
										scales: {
											yAxes: [{
												beginAtZero : true, //Y축 값이 0부터 시작
												scaleLabel: { display: true, labelString: '' },
												gridLines:{ lineWidth: 0.5 }, //가로선 굵기
												ticks: { max: 100, min: 0 }
											}],
											xAxes: [{
												gridLines:{ lineWidth: 0.5 } //세로선 굵기
											}]
										},
										"horizontalLine": 
										[
									    	{ "y": maxStd,"style": "rgb(255, 0, 0)" }, { "y": minStd,"style": "rgb(255, 0, 0)" }//관리기준상/하한 값 지정
									    ]
									}
								};
									
								
								//y축 라벨값 변경은 아래처럼하면됨
								if(result.valueList[0].sensorUn != null){
									config.options.scales.yAxes[0].scaleLabel.labelString = result.valueList[0].sensorUn;//측정값 단위 녛기
								}
								
								//y축 최소값, 최대값 처리
								var Ymax = 100;
								var Ymin = 0;
								config.options.scales.yAxes[0].ticks.max = parseInt(Ymax);//실수값이므로 실수형으로 형변환함. 안하면 오류남.
								config.options.scales.yAxes[0].ticks.min = parseInt(Ymin);//실수값이므로 실수형으로 형변환함. 안하면 오류남.
								
						        //mychart.js 오류 중 마우스를 차트위에 가져가면 차트가 틀어짐(이전 데이터 보여주면서)... 이 현상은 아래 if 3줄 넣어주면됨
						        if(myChart != undefined){
						        	myChart.destroy();
						        }
								myChart = new Chart(ctx, config);//차트 그리기
								
								myChart.update();//차트 업데이트
								$("#rchart").show();//진짜 차트 보이게 처리
							}
							//차트 끝
		    			},
		    			complete : function (){//ajax 기본 함수. 종료 후 자동실행.
							$("#loading").hide();//진행 중 끝
		    			},
		    			error: function(result){
		    				errorback(result);
		    			}
		    		});
				}
			</script>
		
		</div>
		<!-- 차트 끝  -->
		
	</div>
	<!--// 본문 끝 -->
		

	<!-- Footer 시작. 모바일인 경우 차트위로 올라가는 현상이 있어서 마진값 주었음 -->
	<div class="pc-mot">
		<jsp:include page="/project/FooterPage.do" />
	</div>
	
	<div class="mobile-mot row" style="margin-top:30%">
		<div class="col-md-12">
			<jsp:include page="/project/FooterPage.do" />
		</div>
	</div>
	<!--// Footer 끝 -->

</div>
<!--// container-fluid 끝 -->

<form:hidden path="deviceId" />
<form:hidden path="sensorId" />

</form:form>




</body>
</html>