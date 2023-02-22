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
					상품관련 통계입니다.
					<br>
					주문자체수량이 아닌, 상품개별 수량을 기준으로 합니다.
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
							<a href="#;" class="month btns h30px <c:if test="${month eq i }">aquabtn</c:if>" onclick="set_sale_month('<c:out value="${i }"/>')"> <c:out value="${i}"/>월</a>
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
				  max-width: 800px;
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
				
				<div style="width: 99%; padding: 20px 0;">
					<span style="width: 49%; display:inline-block; border: solid 4px #f57d21; border-radius: 5px;">
					<figure class="highcharts-figure">
					    <div id="chart1"></div>
					    <p class="highcharts-description alignCenter colorOrange">
					        이롬스토어 판매현황입니다.
					    </p>
					</figure>
					</span>
					
					<span style="width: 49%; margin-left: 20px; display:inline-block; border: solid 4px #f57d21; border-radius:">
					<figure class="highcharts-figure">
					    <div id="chart2"></div>
					    <p class="highcharts-description alignCenter colorOrange">
					        판매 베스트 10
					    </p>
					</figure>
					</span>
				</div>
				<%-- 
				<div style="width: 99%; padding: 20px 0;">
					<span style="width: 49%; display:inline-block; border: solid 4px #f57d21; border-radius:">
					<figure class="highcharts-figure">
					    <div id="chart3"></div>
					    <p class="highcharts-description alignCenter colorOrange">
					   	관광/체험 판매 베스트 10
					    </p>
					</figure>
					</span>
					<span style="width: 49%; margin-left: 20px; display:inline-block; border: solid 4px #f57d21; border-radius:">
					<figure class="highcharts-figure">
					    <div id="chart4"></div>
					    <p class="highcharts-description alignCenter colorOrange">
					        숙박 판매 베스트 10
					    </p>
					</figure>
					</span>
				</div>
				--%>
				
				<div style="width: 99%; padding: 20px 0;">
				<%-- 	<span style="width: 49%; display:inline-block; border: solid 4px #f57d21; border-radius:">
					<figure class="highcharts-figure">
					    <div id="chart5"></div>
					    <p class="highcharts-description alignCenter colorOrange">
					        맛집 판매 베스트 10
					    </p>
					</figure>
					</span>
				--%>	
					<span style="width: 49%; margin-left: 20px; display:inline-block; border: solid 4px #f57d21; border-radius:">
					<figure class="highcharts-figure">
					    <div id="chart6"></div>
					    <p class="highcharts-description alignCenter colorOrange">
					        이롬스토어 베스트 10
					    </p>
					</figure>
					</span>
				</div>
				
				<script>
				Highcharts.chart('chart1', {
				  color: ['#ff6600'],
				  chart: {
				    type: 'column'
				  },
				  title: {
				    text: '이롬스토어 판매현황 - <c:out value="${thisYm}"/>'
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
				      text: '주문건수'
				    }
				  },
				  
				  legend: {
				    enabled: false
				  },
				  tooltip: {
				    pointFormat: '<b>{point.y:.0f} 건</b>'
				  },
				  series: [{
				    name: '카테고리별 판매현황',
				    color: '#f57d21',
				    data: [
				      
				      ['이롬스토어', <c:out value="${ListCnt4}"/>],
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
					    text: '판매 베스트 10 - <c:out value="${thisYm}"/>'
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
					      text: '주문건수'
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
				    	<c:forEach var="BestList10" items="${BestList10}" varStatus="status">
					      ['<c:out value="${BestList10.od_prod_nm}"/>', <c:out value="${BestList10.cnt}"/>],
					    </c:forEach>
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
				
				
				/*Highcharts.chart('chart3', {
					  chart: {
					    type: 'column'
					  },
					  title: {
					    text: '관광/체험 베스트 10 - <c:out value="${thisYm}"/>'
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
					      text: '주문건수'
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
					    	<c:forEach var="BestList101" items="${bestList101}" varStatus="status">
						      ['<c:out value="${BestList101.od_prod_nm}"/>', <c:out value="${BestList101.cnt}"/>],
						    </c:forEach>
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
				*/
				/*
				Highcharts.chart('chart4', {
					  chart: {
					    type: 'column'
					  },
					  title: {
					    text: '숙박 베스트 10 - <c:out value="${thisYm}"/>'
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
					      text: '주문건수'
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
					    	<c:forEach var="BestList102" items="${bestList102}" varStatus="status">
						      ['<c:out value="${BestList102.od_prod_nm}"/>', <c:out value="${BestList102.cnt}"/>],
						    </c:forEach>
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
				*/
				/*
				Highcharts.chart('chart5', {
					  chart: {
					    type: 'column'
					  },
					  title: {
					    text: '맛집 베스트 10 - <c:out value="${thisYm}"/>'
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
					      text: '주문건수'
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
					    	<c:forEach var="BestList103" items="${bestList103}" varStatus="status">
						      ['<c:out value="${BestList103.od_prod_nm}"/>', <c:out value="${BestList103.cnt}"/>],
						    </c:forEach>
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
				*/
				
				Highcharts.chart('chart6', {
					  chart: {
					    type: 'column'
					  },
					  title: {
					    text: '이롬스토어 베스트 10 - <c:out value="${thisYm}"/>'
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
					      text: '주문건수'
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
					    	<c:forEach var="BestList104" items="${bestList104}" varStatus="status">
						      ['<c:out value="${BestList104.od_prod_nm}"/>', <c:out value="${BestList104.cnt}"/>],
						    </c:forEach>
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