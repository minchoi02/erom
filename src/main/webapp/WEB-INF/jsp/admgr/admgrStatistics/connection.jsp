<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:import url="/Api/admgrIncludeTop.do"/>
<c:import url="/Api/admgrIncludeLeftMenu.do"/>

		<!-- 콘텐츠 영역 { -->
		<div id="content">
			<h1 class="bigTit">인기검색어</h1>
			<div class="pageComment">
				<div class="comment_ico"><i class="fad fa-comment-alt-smile"></i></div>
				<p>
					상품관련 통계입니다. ${lastday }
				</p>
			</div>
			
			<!-- 상점관리 > 상점정산 > 리스트 { -->
			<section id="storeCalculateList" class="page_content">
			
				<!-- 리스트 검색 { -->
				<div class="list_search_box">
					<ul class="nopm floats">
						<li>
							<select class="basic_select search_select" id="this_year" name="this_year">
								<c:forEach var="i" begin="2020" end="${thisY }">  
								<option value="<c:out value="${i }"/>" <c:if test="${thisY eq i }">selected</c:if> ><c:out value="${i }"/>년</option>
								</c:forEach>
							</select>
						</li>
						<li>
						<c:set var="this_ym_arr" value="${fn:split(thisYm,'-') }"/>
						<c:set var="month" value="${this_ym_arr[1] }"/>
						<c:forEach var="i" begin="01" end="12">  
							<a href="#;" class="month btns h30px <c:if test="${month eq i }">aquabtn</c:if>" onclick="set_conn_month('<c:out value="${i }"/>')"> <c:out value="${i}"/>월</a>
						</c:forEach>
						</li>
					</ul>
				</div>
				<!-- } 리스트 검색 -->
				
				<script src="https://code.highcharts.com/highcharts.js"></script>
				<script src="https://code.highcharts.com/modules/exporting.js"></script>
				<script src="https://code.highcharts.com/modules/export-data.js"></script>
				<script src="https://code.highcharts.com/modules/accessibility.js"></script>
				
				<style>
				#chart1 #chart2 #chart3 #chart4 #chart5 #chart6 {
				  height: 400px; 
				}
				
				.highcharts-figure, .highcharts-data-table table {
				  min-width: 310px; 
				  max-width: 95%;
				  margin: 1em auto;
				}
				
				.highcharts-data-table table {
				  font-family: Verdana, sans-serif;
				  border-collapse: collapse;
				  /*border: 1px solid #EBEBEB;*/
				  margin: 10px auto;
				  text-align: center;
				  width: 100%;
				  max-width: 500px;
				}
				.highcharts-data-table caption {
				  /*padding: 1em 0;*/
				  font-size: 1.2em;
				  color: #555;
				}
				.highcharts-data-table th {
					font-weight: 200;
				  padding: 0.5em;
				}
				.highcharts-data-table td, .highcharts-data-table th, .highcharts-data-table caption {
				  padding: 0.5em;
				}
				.highcharts-data-table thead tr, .highcharts-data-table tr:nth-child(even) {
				  background: #f8f8f8;
				}
				.highcharts-data-table tr:hover {
				  background: #f1f7ff;
				}
				</style>
				<br>
				<br>
				<div style="width: 99%; padding: 20px 0;">
					<span style="width: 49%; display:inline-block; border: solid 4px #f57d21; border-radius: 5px;">
					<figure class="highcharts-figure">
					    <div id="chart1"></div>
					    <p class="highcharts-description alignCenter colorOrange">
					        년도별 접속현황입니다.
					    </p>
					</figure>
					</span>
					
					<span style="width: 49%; margin-left: 25px; display:inline-block; border: solid 4px #f57d21; border-radius: 5px;">
					<figure class="highcharts-figure">
					    <div id="chart2"></div>
					    <p class="highcharts-description alignCenter colorOrange">
					        월별 접속현황입니다.
					    </p>
					</figure>
					</span>
				</div>
				
				<div style="width: 99%; padding: 20px 0; display:inline-block; border: solid 4px #f57d21; border-radius:">
					<figure class="highcharts-figure">
					    <div id="chart3"></div>
					    <p class="highcharts-description alignCenter colorOrange">
					        일별 접속현황입니다.
					    </p>
					</figure>
				</div>
				
				<script>
				Highcharts.chart('chart1', {
				  color: ['#ff6600'],
				  chart: {
				    type: 'column'
				  },
				  title: {
				    text: '년도별 - <c:out value="${thisY}"/>'
				  },
				  subtitle: {
				    //text: 'Source: <a href="http://en.wikipedia.org/wiki/List_of_cities_proper_by_population">Wikipedia</a>'
				  },
				  xAxis: {
				    type: 'category',
				    labels: {
				      rotation: 0,
				      style: {
				        fontSize: '13px',
				        fontFamily: 'Verdana, sans-serif'
				      }
				    }
				  },
				  yAxis: {
				    min: 0,
				    title: {
				      text: '접속자수'
				    }
				  },
				  
				  legend: {
				    enabled: false
				  },
				  tooltip: {
				    pointFormat: '<b>{point.y:.0f} 건</b>'
				  },
				  series: [{
				    name: '연도별 접속현황',
				    color: '#f57d21',
				    data: [
				      ['2020', <c:out value="${Cnt2020}"/>],
				      ['2021', <c:out value="${Cnt2021}"/>],
				      ['2022', <c:out value="${Cnt2022}"/>],
				      ['2023', <c:out value="${Cnt2023}"/>],
				      ['2024', <c:out value="${Cnt2024}"/>],
				      ['2025', <c:out value="${Cnt2025}"/>],
				      ['2026', <c:out value="${Cnt2026}"/>],
				      ['2027', <c:out value="${Cnt2027}"/>],
				      ['2028', <c:out value="${Cnt2028}"/>],
				      ['2029', <c:out value="${Cnt2029}"/>],
				      ['2030', <c:out value="${Cnt2030}"/>],
				    ],
				    dataLabels: {
				      enabled: true,
				      rotation: 0,
				      color: '#000',
				      align: 'center',
				      format: '{point.y:.0f}건', // one decimal
				      y: 5, // 10 pixels down from the top
				      style: {
				        fontSize: '13px',
				        fontFamily: 'Verdana, sans-serif'
				      }
				    }
				  }]
				});
			
				
				Highcharts.chart('chart2', {
					  chart: {
					    type: 'column'
					  },
					  title: {
					    text: '월별 - <c:out value="${thisYm}"/>'
					  },
					  subtitle: {
					    //text: 'Source: <a href="http://en.wikipedia.org/wiki/List_of_cities_proper_by_population">Wikipedia</a>'
					  },
					  xAxis: {
					    type: 'category',
					    labels: {
					      rotation: -45,
					      style: {
					        fontSize: '12px',
					        fontFamily: 'Verdana, sans-serif'
					      }
					    }
					  },
					  yAxis: {
					    min: 0,
					    title: {
					      text: '접속자수'
					    }
					  },
					  legend: {
					    enabled: false
					  },
					  tooltip: {
					    pointFormat: '<b>{point.y:.0f} 건</b>'
					  },
					  series: [{
					    name: 'Population',
					    color: '#f57d21',
					    data: [
					    	['<c:out value="${thisY}"/>-01', <c:out value="${Cnt01}"/>],
							['<c:out value="${thisY}"/>-02', <c:out value="${Cnt02}"/>],
							['<c:out value="${thisY}"/>-03', <c:out value="${Cnt03}"/>],
							['<c:out value="${thisY}"/>-04', <c:out value="${Cnt04}"/>],
							['<c:out value="${thisY}"/>-05', <c:out value="${Cnt05}"/>],
							['<c:out value="${thisY}"/>-06', <c:out value="${Cnt06}"/>],
							['<c:out value="${thisY}"/>-07', <c:out value="${Cnt07}"/>],
							['<c:out value="${thisY}"/>-08', <c:out value="${Cnt08}"/>],
							['<c:out value="${thisY}"/>-09', <c:out value="${Cnt09}"/>],
							['<c:out value="${thisY}"/>-10', <c:out value="${Cnt10}"/>],
							['<c:out value="${thisY}"/>-11', <c:out value="${Cnt11}"/>],
							['<c:out value="${thisY}"/>-12', <c:out value="${Cnt12}"/>],
					    ],
					    dataLabels: {
					      enabled: true,
					      rotation: 0,
					      color: '#000',
					      align: 'center',
					      format: '{point.y:.0f}건', // one decimal
					      y: 5, // 10 pixels down from the top
					      style: {
					        fontSize: '13px',
					        fontFamily: 'Verdana, sans-serif'
					      }
					    }
					  }]
					});
				
				
				Highcharts.chart('chart3', {
					  chart: {
					    type: 'column'
					  },
					  title: {
					    text: '일별 - <c:out value="${thisYm}"/>'
					  },
					  subtitle: {
					    //text: 'Source: <a href="http://en.wikipedia.org/wiki/List_of_cities_proper_by_population">Wikipedia</a>'
					  },
					  xAxis: {
					    type: 'category',
					    labels: {
					      rotation: -45,
					      style: {
					        fontSize: '12px',
					        fontFamily: 'Verdana, sans-serif'
					      }
					    }
					  },
					  yAxis: {
					    min: 0,
					    title: {
					      text: '접속자수'
					    }
					  },
					  legend: {
					    enabled: false
					  },
					  tooltip: {
					    pointFormat: '<b>{point.y:.0f} 건</b>'
					  },
					  series: [{
					    name: 'Population',
					    color: '#f57d21',
					    data: [
					    	['<c:out value="${thisYm}"/>-01', <c:out value="${CntD01}"/>],
					    	['<c:out value="${thisYm}"/>-02', <c:out value="${CntD02}"/>],
					    	['<c:out value="${thisYm}"/>-03', <c:out value="${CntD03}"/>],
					    	['<c:out value="${thisYm}"/>-04', <c:out value="${CntD04}"/>],
					    	['<c:out value="${thisYm}"/>-05', <c:out value="${CntD05}"/>],
					    	['<c:out value="${thisYm}"/>-06', <c:out value="${CntD06}"/>],
					    	['<c:out value="${thisYm}"/>-07', <c:out value="${CntD07}"/>],
					    	['<c:out value="${thisYm}"/>-08', <c:out value="${CntD08}"/>],
					    	['<c:out value="${thisYm}"/>-09', <c:out value="${CntD09}"/>],
					    	['<c:out value="${thisYm}"/>-10', <c:out value="${CntD10}"/>],
					    	['<c:out value="${thisYm}"/>-11', <c:out value="${CntD11}"/>],
					    	['<c:out value="${thisYm}"/>-12', <c:out value="${CntD12}"/>],
					    	['<c:out value="${thisYm}"/>-13', <c:out value="${CntD13}"/>],
					    	['<c:out value="${thisYm}"/>-14', <c:out value="${CntD14}"/>],
					    	['<c:out value="${thisYm}"/>-15', <c:out value="${CntD15}"/>],
					    	['<c:out value="${thisYm}"/>-16', <c:out value="${CntD16}"/>],
					    	['<c:out value="${thisYm}"/>-17', <c:out value="${CntD17}"/>],
					    	['<c:out value="${thisYm}"/>-18', <c:out value="${CntD18}"/>],
					    	['<c:out value="${thisYm}"/>-19', <c:out value="${CntD19}"/>],
					    	['<c:out value="${thisYm}"/>-20', <c:out value="${CntD20}"/>],
					    	['<c:out value="${thisYm}"/>-21', <c:out value="${CntD21}"/>],
					    	['<c:out value="${thisYm}"/>-22', <c:out value="${CntD22}"/>],
					    	['<c:out value="${thisYm}"/>-23', <c:out value="${CntD23}"/>],
					    	['<c:out value="${thisYm}"/>-24', <c:out value="${CntD24}"/>],
					    	['<c:out value="${thisYm}"/>-25', <c:out value="${CntD25}"/>],
					    	['<c:out value="${thisYm}"/>-26', <c:out value="${CntD26}"/>],
					    	['<c:out value="${thisYm}"/>-27', <c:out value="${CntD27}"/>],
					    	['<c:out value="${thisYm}"/>-28', <c:out value="${CntD28}"/>],
					    	['<c:out value="${thisYm}"/>-29', <c:out value="${CntD29}"/>],
					    	['<c:out value="${thisYm}"/>-30', <c:out value="${CntD30}"/>],
					    	['<c:out value="${thisYm}"/>-31', <c:out value="${CntD31}"/>],
					    ],
					    dataLabels: {
					      enabled: true,
					      rotation: 0,
					      color: '#000',
					      align: 'center',
					      format: '{point.y:.0f}건', // one decimal
					      y: 5, // 10 pixels down from the top
					      style: {
					        fontSize: '13px',
					        fontFamily: 'Verdana, sans-serif'
					      }
					    }
					  }]
					});
				</script>
				
			</section>
			<!-- } 상점관리 > 상점정산 > 리스트 -->
		</div>

<c:import url="/Api/admgrIncludeBottom.do"/>