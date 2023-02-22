<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<% 
pageContext.setAttribute("CR", "\r"); 
pageContext.setAttribute("LF", "\n"); 
pageContext.setAttribute("CRLF", "\r\n"); 
pageContext.setAttribute("BR", "<br/>");
%>

<c:set var="doURI" value="${requestScope['javax.servlet.forward.servlet_path']}" /> 
<c:set var="qsURI" value="${pageContext.request.queryString}" /> 
<c:set var="URI" value="${doURI }"/>
<c:if test="${not empty qsURI}">
	<c:set var="URI" value="${doURI }?${qsURI }"/>
</c:if>

<c:choose>
	<c:when test="${not empty user_id }">
		<c:set var="func_pick" value="prod_pick('${prod_id }')" />
	</c:when>
	<c:otherwise>
		<c:set var="func_pick" value="getLogin('${URI }')"/>
	</c:otherwise>
</c:choose>

<c:import url="/Api/IncludeTop.do"/>


<%-- 여행 --%>
<c:if test="${store_category eq 'CD002001' }">
	<!-- 관광/체험 뷰페이지 { -->
	<section id="travelView" class="productview">
		
		<c:import url="commonItemInfomation.jsp"/>
		
		<!-- 기본정보 { -->
		<article id="viewBasicInfo">
			<div class="subject_price">
				<h2 class="viewh2"><c:out value="${prodInfo.prod_nm }"/></h2>
				<c:choose>
				<c:when test="${prodInfo.prod_market_price > 0 }">
				<div class="pricebox"><strong class="colorOrange"><fmt:formatNumber value="${prodInfo.prod_market_price}" type="number"/></strong> <small>원 부터</small></div>
				</c:when>
				<c:otherwise>
				<div class="pricebox"><strong class="colorOrange">무료</div>
				</c:otherwise>
				</c:choose>		
				<div class="jjimbox"><a href="#;" class="jjimbtn <c:if test="${isProdFav eq 'Y' }">active</c:if>" onclick="<c:out value="${func_pick}"/>"><span><i class="fal fa-plus"></i></span> 찜하기</a></div>
			</div>
			<c:if test="${not empty prod_comment_str }">
			<p>
				<c:out value="${prod_comment_str }"  escapeXml="false" />
			</p>
			</c:if>
		</article>
		<!-- } 기본정보 -->
		
		<!-- 옵션 메뉴 { -->
		<article id="viewFoodMnu" class="bgs">
			<h3><c:out value="${prodInfo.prod_nm}"/> 메뉴</h3>
			<c:forEach var="optionList" items="${optionList}" varStatus="status">
			<dl class="nopm"><dt><c:out value="${optionList.opt_nm }"/></dt><dd><fmt:formatNumber value="${optionList.opt_price}" type="number"/> <small>원</small></dd></dl>
			</c:forEach>
		</article>
		<!-- } 옵션 메뉴 -->

		<!-- 뷰 콘텐츠 { -->
		<article id="viewContent">
			<c:out value="${prodInfo.prod_content}"  escapeXml="false"/>
		
			<!-- 뷰 동영상 { -->
			<c:if test="${not empty prodInfo.prod_movie }">
			<div class="view_mov">
				<video src="/cmm/fms/getImage.do?atchFileId=<c:out value="${prodInfo.prod_movie }"/>&amp;fileSn=0" width="100%" controls=""></video>
			</div>
			</c:if>
			<!-- } 뷰 동영상 -->
		</article>
		<!-- } 뷰 콘텐츠 -->

		<!-- 상품 설명 { -->
		<article id="viewInfo">
			<c:if test="
				${storeInfo.store_travel_return_day_7 ne 0 ||
				storeInfo.store_travel_return_day_5 ne 0 ||
				storeInfo.store_travel_return_day_3 ne 0 ||
				storeInfo.store_travel_return_day_2 ne 0 ||
				storeInfo.store_travel_return_day_1 ne 0 ||
				storeInfo.store_travel_return_day_0 ne 0
				}">
			<dl class="nopm">
				<dt>예약취소 공제율</dt>
				<dd>
					<c:if test="${storeInfo.store_travel_return_day_7 > 0}">
					7일전 : <c:out value="${storeInfo.store_travel_return_day_7 }"/>%,
					</c:if> 
					<c:if test="${storeInfo.store_travel_return_day_5 > 0}">
					5일전 : <c:out value="${storeInfo.store_travel_return_day_5 }"/>%, 
					</c:if> 
					<c:if test="${storeInfo.store_travel_return_day_3 > 0}">
					3일전 : <c:out value="${storeInfo.store_travel_return_day_3 }"/>%, 
					</c:if> 
					<c:if test="${storeInfo.store_travel_return_day_2 > 0}">
					2일전 : <c:out value="${storeInfo.store_travel_return_day_2 }"/>%, 
					</c:if> 
					<c:if test="${storeInfo.store_travel_return_day_1 > 0}">
					1일전 : <c:out value="${storeInfo.store_travel_return_day_1 }"/>%, 
					</c:if> 
					<c:if test="${storeInfo.store_travel_return_day_0 > 0}">
					예약당일 : <c:out value="${storeInfo.store_travel_return_day_0 }"/>% 
					</c:if> 
				</dd>
			</dl>
			</c:if>
			
			<c:if test="${not empty prod_content_precautions_str }">
			<dl class="nopm">
				<dt>주의사항</dt>
				<dd>
					<c:out value="${prod_content_precautions_str}" escapeXml="false"/>
				</dd>
			</dl>
			</c:if>
			
			<c:if test="${not empty prod_content_time_str }">
			<dl class="nopm">
				<dt>운영시간</dt>
				<dd>
					<c:out value="${prod_content_time_str }" escapeXml = "false"/>
				</dd>
			</dl>
			</c:if>
			
			<c:if test="${not empty prod_content_pay_str }">
			<dl class="nopm">
				<dt>이용요금</dt>
				<dd>
					<c:out value="${prod_content_pay_str }" escapeXml = "false"/>
				</dd>
			</dl>
			</c:if>
			
			<c:if test="${not empty storeInfo.store_url_naver_blog || not empty storeInfo.store_url_facebook || not empty storeInfo.store_url_twitter || not empty storeInfo.store_url_youtube || not empty storeInfo.store_url_instagram  }">
			<dl class="nopm socialbtnarea">
				<dt>SNS</dt>
				<dd>
					<ul class="nopm floats">
						<c:if test="${not empty storeInfo.store_url_naver_blog}">
						<li><a href="<c:out value="${not empty storeInfo.store_url_naver_blog}"/>" target="new"  class="socialbtn"><img src="/images/baseScmtour/social_ico_naverblog.png" alt="네이버 블로그" /></a></li>
						</c:if>
						<c:if test="${not empty storeInfo.store_url_instagram}">
						<li><a href="<c:out value="${not empty storeInfo.store_url_instagram}"/>" target="new"  class="socialbtn"><img src="/images/baseScmtour/social_ico_insta.png" alt="인스타그램" /></a></li>
						</c:if>
						<c:if test="${not empty storeInfo.store_url_facebook}">
						<li><a href="<c:out value="${not empty storeInfo.store_url_facebook}"/>" target="new"  class="socialbtn"><img src="/images/baseScmtour/social_ico_facebook.png" alt="페이스북" /></a></li>
						</c:if>
						<c:if test="${not empty storeInfo.store_url_twitter}">
						<li><a href="<c:out value="${not empty storeInfo.store_url_twitter}"/>" target="new"  class="socialbtn"><img src="/images/baseScmtour/social_ico_twitter.png" alt="트위터" /></a></li>
						</c:if>
						<c:if test="${not empty storeInfo.store_url_youtube}">
						<li><a href="<c:out value="${not empty storeInfo.store_url_youtube}"/>" target="new" class="socialbtn"><img src="/images/baseScmtour/social_ico_youtube.png" alt="유튜브" /></a></li>
						</c:if>
					</ul>
				</dd>
			</dl>
			</c:if>
		</article>
		<!-- } 상품 설명 -->

		<c:import url="commonRecom.jsp"/>
		
	</section>
	<!-- } 관광/체험 뷰페이지 -->

</c:if>

<%-- 숙박 --%>
<c:if test="${store_category eq 'CD002002' }">
	<!-- 숙박 뷰페이지 { -->
	<section id="roomView" class="productview">
		
		<c:import url="commonItemInfomation.jsp"/>

		<!-- 기본정보 { -->
		<article id="viewBasicInfo">
			<div class="subject_price">
				<h2 class="viewh2"><c:out value="${prodInfo.prod_nm }"/></h2>
				<div class="addr"><c:out value="${storeInfo.store_addr_1}"/> <c:out value="${storeInfo.store_addr_2 }"/></div>
				<div class="jjimbox"><a href="#;" class="jjimbtn  <c:if test="${isProdFav eq 'Y' }">active</c:if>" onclick="<c:out value="${func_pick}"/>"><span><i class="fal fa-plus"></i></span> 찜하기</a></div>
			</div>
			<c:if test="${not empty prod_comment_str }">
			<p>
				<c:out value="${prod_comment_str }"  escapeXml="false" />
			</p>
			</c:if>
		</article>
		<!-- } 기본정보 -->

		<!-- 예약일 { -->
		<%--
		<article id="viewRoomDate">
			<dl class="nopm">
				<dt>예약일</dt>
				<dd class="date">
					입실 : 2020년 12월 12일(월)<br />
					퇴실 : 2020년 12월 14일(수) / 2박
					<a href="#;" class="btns bluebtn" data-toggle="modal" data-target="#calendarChoice">날짜 변경</a>
				</dd>
			</dl>
		</article>
		 --%>
		<article id="viewRoomDate">
		<c:choose>
		<c:when test="${prodInfo.prod_use_pay_st eq 'Y'}">
			<dl class="nopm">
				<dt>예약일</dt>
				<dd class="date">
					<input type="hidden" id="set_store_category" name="set_store_category" value="<c:out value="${store_category }"/>" />
					<input type="hidden" id="set_prod_id" name="set_prod_id" value="<c:out value="${prod_id }"/>" />
					입실 : <input type="text" id="reserve_st_dt" name="reserve_st_dt" class="input_text w100px readonly  " readonly value="<c:out value="${reserve_st_dt }"/>" /> ~ 
					퇴실 : <input type="text" id="reserve_ed_dt" name="reserve_ed_dt" class="input_text w100px readonly  " readonly value="<c:out value="${reserve_ed_dt }"/>" />
					<button type="button" class="btns bluebtn" onclick="reserveDateStEdCheck('reserve_st_dt','reserve_ed_dt'); " >검색</button>
				</dd>
				<script>
				setdatepicker('reserve_st_dt', '+2', '+<c:out value="${prodInfo.prod_reserve_limit}"/>');
				setdatepicker('reserve_ed_dt', '+3', '+3<c:out value="${prodInfo.prod_reserve_limit}"/>');
				</script>
			</dl>
		</c:when>
		<c:otherwise>
			<dl class="nopm">
			문의(예약)전화 : <c:out value="${storeInfo.store_tel }"/> &nbsp; <a href="tel:<c:out value="${storeInfo.store_tel}"/>" class="btns h24px"><span class="colorRed"><i class="fas fa-phone-square"></i></span> 전화걸기</a>
			</dl>
		</c:otherwise>
		</c:choose>
		</article>
		<!-- } 예약일 -->

		<!-- 뷰 콘텐츠 { -->
		<article id="viewContent" class="bgs">
			<!-- 숙박 객실 정보 { -->
			<div class="room_list">
			
				<c:set var="cnt" value="0"/>
				<c:forEach var="roomList" items="${roomList}" varStatus="status">
				<div class="room_con">
					<div class="room_slide room_slide<c:out value="${cnt}"/> swiper-container">
						<ul class="nopm swiper-wrapper">
							<c:if test="${not empty roomList.prod_room_img_1 }">
							<li class="swiper-slide"><img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${roomList.prod_room_img_1}"/>&fileSn=0" style="width: 100%;" onerror="this.src='/images/baseScmtour/_noImage.png';"/></li>
							</c:if>
							<c:if test="${not empty roomList.prod_room_img_2 }">
							<li class="swiper-slide"><img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${roomList.prod_room_img_2}"/>&fileSn=0" style="width: 100%;" onerror="this.src='/images/baseScmtour/_noImage.png';"/></li>
							</c:if>
							<c:if test="${not empty roomList.prod_room_img_3 }">
							<li class="swiper-slide"><img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${roomList.prod_room_img_3}"/>&fileSn=0" style="width: 100%;" onerror="this.src='/images/baseScmtour/_noImage.png';"/></li>
							</c:if>
							<c:if test="${not empty roomList.prod_room_img_4 }">
							<li class="swiper-slide"><img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${roomList.prod_room_img_4}"/>&fileSn=0" style="width: 100%;" onerror="this.src='/images/baseScmtour/_noImage.png';"/></li>
							</c:if>
							<c:if test="${not empty roomList.prod_room_img_5 }">
							<li class="swiper-slide"><img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${roomList.prod_room_img_5}"/>&fileSn=0" style="width: 100%;" onerror="this.src='/images/baseScmtour/_noImage.png';"/></li>
							</c:if>
							<c:if test="${not empty roomList.prod_room_img_6 }">
							<li class="swiper-slide"><img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${roomList.prod_room_img_6}"/>&fileSn=0" style="width: 100%;" onerror="this.src='/images/baseScmtour/_noImage.png';"/></li>
							</c:if>
							<c:if test="${not empty roomList.prod_room_img_7 }">
							<li class="swiper-slide"><img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${roomList.prod_room_img_7}"/>&fileSn=0" style="width: 100%;" onerror="this.src='/images/baseScmtour/_noImage.png';"/></li>
							</c:if>
							<c:if test="${not empty roomList.prod_room_img_8 }">
							<li class="swiper-slide"><img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${roomList.prod_room_img_8}"/>&fileSn=0" style="width: 100%;" onerror="this.src='/images/baseScmtour/_noImage.png';"/></li>
							</c:if>
							<c:if test="${not empty roomList.prod_room_img_9 }">
							<li class="swiper-slide"><img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${roomList.prod_room_img_9}"/>&fileSn=0" style="width: 100%;" onerror="this.src='/images/baseScmtour/_noImage.png';"/></li>
							</c:if>
							<c:if test="${not empty roomList.prod_room_img_10 }">
							<li class="swiper-slide"><img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${roomList.prod_room_img_10}"/>&fileSn=0" style="width: 100%;" onerror="this.src='/images/baseScmtour/_noImage.png';"/></li>
							</c:if>
						</ul>
						<div class="swiper-pagination"></div>
						<script>
							// 상단 슬라이드 이미지
							var swiper<c:out value="${cnt}"/> = new Swiper('.room_slide<c:out value="${cnt}"/>', {
								slidesPerView: 'auto',
								centeredSlides: true,
								spaceBetween: 0,
								pagination: {
									el: '.swiper-pagination',
									dynamicBullets: true,
								},
							});
						</script>
					</div>
					<div class="room_info">
						<div class="subject"><c:out value="${roomList.prod_room_nm }"/></div>
						<div class="member">(기본 <c:out value="${roomList.prod_room_default_cnt }"/>명 / 최대 <c:out value="${roomList.prod_room_max_cnt }"/>명)</div>
						<div class="pricebox"><strong class="colorOrange"><fmt:formatNumber value="${roomList.prod_room_normal_normal_sale_price}" type="number"/></strong> <small>원 ~</small></div>
						<div class="btnbox">
							<%--
							<a href="#;" class="btns graybtn" data-toggle="modal" data-target="#roomInfo">객실안내</a><a href="/shop/order.do?store_category=<c:out value="${store_category}"/>" class="btns bgOrangeGra">예약</a>
							 --%>
							<button type="button" class="btns graybtn" onclick="roomDetailInfo('<c:out value="${prodInfo.store_id}"/>','<c:out value="${roomList.prod_room_seq }"/>');">객실안내</button>
							<c:if test="${prodInfo.prod_use_pay_st eq 'Y'}">
							
							<c:if test="${not empty user_id }">
							<button type="button" class="btns bgOrangeGra" onclick="roomReserve('<c:out value="${reserve_st_dt }"/>','<c:out value="${reserve_ed_dt }"/>','<c:out value="${store_category}"/>','<c:out value="${prod_id}"/>','<c:out value="${roomList.prod_room_seq }"/>')">예약</a>
							</c:if>
							<c:if test="${empty user_id }">
							<button type="button" class="btns bgOrangeGra" onclick="getLogin('<c:out value="${URI }"/>');">예약</a>
							</c:if>
							
							</c:if>
							<form action="/shop/order.do?store_category=<c:out value="${store_category }"/>&prod_id=<c:out value="${prod_id }"/>" id="roomReserveForm_<c:out value="${roomList.prod_room_seq }"/>" method="post">
								<input type="hidden" name="reserve_st_dt" value="<c:out value="${reserve_st_dt }"/>" />
								<input type="hidden" name="reserve_ed_dt" value="<c:out value="${reserve_ed_dt }"/>" />
								<input type="hidden" name="prod_room_seq" value="<c:out value="${roomList.prod_room_seq }"/>" />
							</form>
						</div>
					</div>
				</div>
				</c:forEach>
				
			</div>
			<!-- } 숙박 객실 정보 -->
		
			<!-- 뷰 동영상 { -->
			<c:if test="${not empty prodInfo.prod_movie }">
			<div class="view_mov">
				<video src="/cmm/fms/getImage.do?atchFileId=<c:out value="${prodInfo.prod_movie }"/>&amp;fileSn=0" width="100%" controls=""></video>
			</div>
			</c:if>
			<!-- } 뷰 동영상 -->
		</article>
		<!-- } 뷰 콘텐츠 -->

		<!-- 상품 설명 { -->
		<article id="viewInfo">
			<c:if test="
				${storeInfo.store_travel_return_day_7 ne 0 ||
				storeInfo.store_travel_return_day_5 ne 0 ||
				storeInfo.store_travel_return_day_3 ne 0 ||
				storeInfo.store_travel_return_day_2 ne 0 ||
				storeInfo.store_travel_return_day_1 ne 0 ||
				storeInfo.store_travel_return_day_0 ne 0
				}">
			<dl class="nopm">
				<dt>예약취소 공제율</dt>
				<dd>
					<c:if test="${storeInfo.store_travel_return_day_7 > 0}">
					7일전 : <c:out value="${storeInfo.store_travel_return_day_7 }"/>%,
					</c:if> 
					<c:if test="${storeInfo.store_travel_return_day_5 > 0}">
					5일전 : <c:out value="${storeInfo.store_travel_return_day_5 }"/>%, 
					</c:if> 
					<c:if test="${storeInfo.store_travel_return_day_3 > 0}">
					3일전 : <c:out value="${storeInfo.store_travel_return_day_3 }"/>%, 
					</c:if> 
					<c:if test="${storeInfo.store_travel_return_day_2 > 0}">
					2일전 : <c:out value="${storeInfo.store_travel_return_day_2 }"/>%, 
					</c:if> 
					<c:if test="${storeInfo.store_travel_return_day_1 > 0}">
					1일전 : <c:out value="${storeInfo.store_travel_return_day_1 }"/>%, 
					</c:if> 
					<c:if test="${storeInfo.store_travel_return_day_0 > 0}">
					예약당일 : <c:out value="${storeInfo.store_travel_return_day_0 }"/>% 
					</c:if> 
				</dd>
			</dl>
			</c:if>
			
			<c:if test="${not empty prod_content_precautions_str }">
			<dl class="nopm">
				<dt>주의사항</dt>
				<dd>
					<c:out value="${prod_content_precautions_str}" escapeXml="false"/>
				</dd>
			</dl>
			</c:if>
			
			<c:if test="${not empty prod_content_time_str }">
			<dl class="nopm">
				<dt>운영시간</dt>
				<dd>
					<c:out value="${prod_content_time_str }" escapeXml = "false"/>
				</dd>
			</dl>
			</c:if>
			
			<c:if test="${not empty prod_content_pay_str }">
			<dl class="nopm">
				<dt>이용요금</dt>
				<dd>
					<c:out value="${prod_content_pay_str }" escapeXml = "false"/>
				</dd>
			</dl>
			</c:if>
			
			<c:if test="${not empty storeInfo.store_url_naver_blog || not empty storeInfo.store_url_facebook || not empty storeInfo.store_url_twitter || not empty storeInfo.store_url_youtube || not empty storeInfo.store_url_instagram  }">
			<dl class="nopm socialbtnarea">
				<dt>SNS</dt>
				<dd>
					<ul class="nopm floats">
						<c:if test="${not empty storeInfo.store_url_naver_blog}">
						<li><a href="<c:out value="${not empty storeInfo.store_url_naver_blog}"/>" target="new"  class="socialbtn"><img src="/images/baseScmtour/social_ico_naverblog.png" alt="네이버 블로그" /></a></li>
						</c:if>
						<c:if test="${not empty storeInfo.store_url_instagram}">
						<li><a href="<c:out value="${not empty storeInfo.store_url_instagram}"/>" target="new"  class="socialbtn"><img src="/images/baseScmtour/social_ico_insta.png" alt="인스타그램" /></a></li>
						</c:if>
						<c:if test="${not empty storeInfo.store_url_facebook}">
						<li><a href="<c:out value="${not empty storeInfo.store_url_facebook}"/>" target="new"  class="socialbtn"><img src="/images/baseScmtour/social_ico_facebook.png" alt="페이스북" /></a></li>
						</c:if>
						<c:if test="${not empty storeInfo.store_url_twitter}">
						<li><a href="<c:out value="${not empty storeInfo.store_url_twitter}"/>" target="new"  class="socialbtn"><img src="/images/baseScmtour/social_ico_twitter.png" alt="트위터" /></a></li>
						</c:if>
						<c:if test="${not empty storeInfo.store_url_youtube}">
						<li><a href="<c:out value="${not empty storeInfo.store_url_youtube}"/>" target="new" class="socialbtn"><img src="/images/baseScmtour/social_ico_youtube.png" alt="유튜브" /></a></li>
						</c:if>
					</ul>
				</dd>
			</dl>
			</c:if>
		</article>
		<!-- } 상품 설명 -->

		<c:import url="commonRecom.jsp"/>
		
	</section>
	<!-- } 숙박 뷰페이지 -->


</c:if>

<%-- 맛집 --%>
<c:if test="${store_category eq 'CD002003' }">
	<!-- 맛집 뷰페이지 { -->
	<section id="foodView" class="productview">
		
		<c:import url="commonItemInfomation.jsp"/>

		<!-- 기본정보 { -->
		<article id="viewBasicInfo">
			<div class="subject_price">
				<h2 class="viewh2"><c:out value="${prodInfo.prod_nm }"/></h2>
				<div class="addr"><c:out value="${storeInfo.store_addr_1}"/> <c:out value="${storeInfo.store_addr_2 }"/></div>
				<div class="jjimbox"><a href="#;" class="jjimbtn  <c:if test="${isProdFav eq 'Y' }">active</c:if>" onclick="<c:out value="${func_pick}"/>"><span><i class="fal fa-plus"></i></span> 찜하기</a></div>
			</div>
			<c:if test="${not empty prod_comment_str }">
			<p>
				<c:out value="${prod_comment_str }"  escapeXml="false" />
			</p>
			</c:if>
		</article>
		<!-- } 기본정보 -->

		<!-- 음식 메뉴 { -->
		<article id="viewFoodMnu" class="bgs">
			<h3><c:out value="${prodInfo.prod_nm}"/> 메뉴</h3>
			<c:forEach var="optionList" items="${optionList}" varStatus="status">
			<dl class="nopm"><dt><c:out value="${optionList.opt_nm }"/></dt><dd><fmt:formatNumber value="${optionList.opt_price}" type="number"/> <small>원</small></dd></dl>
			</c:forEach>
		</article>
		<!-- } 음식 메뉴 -->

		<!-- 뷰 콘텐츠 { -->
		<article id="viewContent">
			<c:out value="${prodInfo.prod_content}"  escapeXml="false"/>
		
			<!-- 뷰 동영상 { -->
			<c:if test="${not empty prodInfo.prod_movie }">
			<div class="view_mov">
				<video src="/cmm/fms/getImage.do?atchFileId=<c:out value="${prodInfo.prod_movie }"/>&amp;fileSn=0" width="100%" controls=""></video>
			</div>
			</c:if>
			<!-- } 뷰 동영상 -->
		</article>
		<!-- } 뷰 콘텐츠 -->

		<!-- 상품 설명 { -->
		<article id="viewInfo">
			<c:if test="
				${storeInfo.store_travel_return_day_7 ne 0 ||
				storeInfo.store_travel_return_day_5 ne 0 ||
				storeInfo.store_travel_return_day_3 ne 0 ||
				storeInfo.store_travel_return_day_2 ne 0 ||
				storeInfo.store_travel_return_day_1 ne 0 ||
				storeInfo.store_travel_return_day_0 ne 0
				}">
			<dl class="nopm">
				<dt>예약취소 공제율</dt>
				<dd>
					<c:if test="${storeInfo.store_travel_return_day_7 > 0}">
					7일전 : <c:out value="${storeInfo.store_travel_return_day_7 }"/>%,
					</c:if> 
					<c:if test="${storeInfo.store_travel_return_day_5 > 0}">
					5일전 : <c:out value="${storeInfo.store_travel_return_day_5 }"/>%, 
					</c:if> 
					<c:if test="${storeInfo.store_travel_return_day_3 > 0}">
					3일전 : <c:out value="${storeInfo.store_travel_return_day_3 }"/>%, 
					</c:if> 
					<c:if test="${storeInfo.store_travel_return_day_2 > 0}">
					2일전 : <c:out value="${storeInfo.store_travel_return_day_2 }"/>%, 
					</c:if> 
					<c:if test="${storeInfo.store_travel_return_day_1 > 0}">
					1일전 : <c:out value="${storeInfo.store_travel_return_day_1 }"/>%, 
					</c:if> 
					<c:if test="${storeInfo.store_travel_return_day_0 > 0}">
					예약당일 : <c:out value="${storeInfo.store_travel_return_day_0 }"/>% 
					</c:if> 
				</dd>
			</dl>
			</c:if>
			
			<c:if test="${not empty prod_content_precautions_str }">
			<dl class="nopm">
				<dt>주의사항</dt>
				<dd>
					<c:out value="${prod_content_precautions_str}" escapeXml="false"/>
				</dd>
			</dl>
			</c:if>
			
			<c:if test="${not empty prod_content_time_str }">
			<dl class="nopm">
				<dt>운영시간</dt>
				<dd>
					<c:out value="${prod_content_time_str }" escapeXml = "false"/>
				</dd>
			</dl>
			</c:if>
			
			<c:if test="${not empty prod_content_pay_str }">
			<dl class="nopm">
				<dt>이용요금</dt>
				<dd>
					<c:out value="${prod_content_pay_str }" escapeXml = "false"/>
				</dd>
			</dl>
			</c:if>
			
			<c:if test="${not empty storeInfo.store_url_naver_blog || not empty storeInfo.store_url_facebook || not empty storeInfo.store_url_twitter || not empty storeInfo.store_url_youtube || not empty storeInfo.store_url_instagram  }">
			<dl class="nopm socialbtnarea">
				<dt>SNS</dt>
				<dd>
					<ul class="nopm floats">
						<c:if test="${not empty storeInfo.store_url_naver_blog}">
						<li><a href="<c:out value="${not empty storeInfo.store_url_naver_blog}"/>" target="new"  class="socialbtn"><img src="/images/baseScmtour/social_ico_naverblog.png" alt="네이버 블로그" /></a></li>
						</c:if>
						<c:if test="${not empty storeInfo.store_url_instagram}">
						<li><a href="<c:out value="${not empty storeInfo.store_url_instagram}"/>" target="new"  class="socialbtn"><img src="/images/baseScmtour/social_ico_insta.png" alt="인스타그램" /></a></li>
						</c:if>
						<c:if test="${not empty storeInfo.store_url_facebook}">
						<li><a href="<c:out value="${not empty storeInfo.store_url_facebook}"/>" target="new"  class="socialbtn"><img src="/images/baseScmtour/social_ico_facebook.png" alt="페이스북" /></a></li>
						</c:if>
						<c:if test="${not empty storeInfo.store_url_twitter}">
						<li><a href="<c:out value="${not empty storeInfo.store_url_twitter}"/>" target="new"  class="socialbtn"><img src="/images/baseScmtour/social_ico_twitter.png" alt="트위터" /></a></li>
						</c:if>
						<c:if test="${not empty storeInfo.store_url_youtube}">
						<li><a href="<c:out value="${not empty storeInfo.store_url_youtube}"/>" target="new" class="socialbtn"><img src="/images/baseScmtour/social_ico_youtube.png" alt="유튜브" /></a></li>
						</c:if>
					</ul>
				</dd>
			</dl>
			</c:if>
		</article>
		<!-- } 상품 설명 -->

		<c:import url="commonRecom.jsp"/>
				
	</section>
	<!-- } 맛집 뷰페이지 -->

</c:if>

<%-- 장터 --%>
<c:if test="${store_category eq 'CD002004' }">
<input type="hidden" id="store_category" name="store_category" value="<c:out value="${store_category }"/>" />
<input type="hidden" id="prod_category" name="prod_category" value="<c:out value="${prod_category }"/>" />
<input type="hidden" id="prod_id" name="prod_id" value="<c:out value="${prod_id }"/>" />
<input type="hidden" id="prod_price" name="prod_price" value="0" />
<input type="hidden" id="def_delivery_price" name="opt_cnt" value="<c:out value="${storeInfo.store_market_default_delivery_price }"/>" />
<input type="hidden" id="free_delivery_price" name="opt_cnt" value="<c:out value="${storeInfo.store_market_free_delivery_price }"/>" />
<input type="hidden" id="jeju_delivery_price" name="opt_cnt" value="<c:out value="${storeInfo.store_market_jeju_delivery_price }"/>" />

<input type="hidden" id="opt_seq" name="opt_seq" value="" />
<input type="hidden" id="opt_nm" name="opt_nm" value="" />
<input type="hidden" id="opt_price" name="opt_price" value="" />
<input type="hidden" id="opt_cnt" name="opt_cnt" value="" />
<input type="hidden" id="opt_total_sum_price" name="opt_total_sum_price" value="0" />	

	<!-- 서천장터 뷰페이지 { -->
	<section id="marketView" class="productview">
		
		<c:import url="commonItemInfomation.jsp"/>
		
		<!-- 기본정보 { -->
		<article id="viewBasicInfo">
			<div class="subject_price">
				<h2 class="viewh2"><c:out value="${prodInfo.prod_nm }"/></h2>
				<div class="pricebox"><strong class="colorOrange"><fmt:formatNumber value="${prodInfo.prod_price}" type="number"/></strong> <small>원</small></div>
				<div class="delivery">
					배송비 : <fmt:formatNumber value="${storeInfo.store_market_default_delivery_price}" type="number"/>원 
					(<c:if test="${storeInfo.store_market_jeju_delivery_price > 0}">
					제주: <fmt:formatNumber value="${storeInfo.store_market_jeju_delivery_price}" type="number"/>원
					</c:if>)
					<br>무료배송: <fmt:formatNumber value="${storeInfo.store_market_free_delivery_price}" type="number"/>원 이상
				</div>
				<div class="jjimbox"><a href="#;" class="jjimbtn  <c:if test="${isProdFav eq 'Y' }">active</c:if>" onclick="<c:out value="${func_pick}"/>"><span><i class="fal fa-plus"></i></span> 찜하기</a></div>
			</div>
			<c:if test="${not empty prod_comment_str }">
			<p>
				<c:out value="${prod_comment_str }"  escapeXml="false" />
			</p>
			</c:if>
		</article>
		<!-- } 기본정보 -->

		<!-- 뷰 콘텐츠 { -->
		<article id="viewContent">
			<c:out value="${prodInfo.prod_content}"  escapeXml="false"/>
		</article>
		<!-- } 뷰 콘텐츠 -->
		
		<c:if test="${not empty prod_content_precautions_str}">
		<article id="viewInfo">
			<dl class="nopm">
				<dt>주의사항</dt>
				<dd><c:out value="${prod_content_precautions_str}" escapeXml="false"/> </dd>
			</dl>
		</article>
		</c:if>

		<!-- 상품 설명 { -->
		<article id="viewInfo">
			<c:if test="${not empty storeInfo.prod_maker }">
			<dl class="nopm">
				<dt>제조사/원산지</dt>
				<dd><c:out value="${prodInfo.prod_maker}"/> / <c:out value="${prodInfo.prod_country}"/></dd>
			</dl>
			</c:if>
			
			<c:if test="${not empty store_market_delivery_str }">
			<dl class="nopm">
				<dt>기본배송안내</dt>
				<dd>
					<c:out value="${store_market_delivery_str}" escapeXml = "false" />
				</dd>
			</dl>
			</c:if>
			
			<dl class="nopm">
				<dt>전자상거래 등에서 상품제공 고시</dt>
				<dd>
				<c:if test="${prodInfo.prod_category_cd eq '1'}">
					<dl>
					<dt>포장단위별 용량(중량), 수량, 크기</dt>
						<dd><c:out value="${prodInfo.prod_info_1 }"/></dd>
					</dl>
					<dl>
						<dt>생산자</dt>
						<dd><c:out value="${prodInfo.prod_info_2 }"/></dd>
					</dl>
					<dl>
						<dt>원산지</dt>
						<dd<c:out value="${prodInfo.prod_info_3 }"/></dd>
					</dl>
					<dl>
						<dt>제조연월일(조장일 또는 생산연도), 유통기한 또는 품질유지기한</dt>
						<dd><c:out value="${prodInfo.prod_info_4 }"/></dd>
					</dl>
					<dl>
						<dt>농산물-농산물품질관리 법사 유전자 변형 농산물 표시, 지리적 표시</dt>
						<dd><c:out value="${prodInfo.prod_info_5 }"/></dd>
					</dl>
					<dl>
						<dt>축산물-축산법에 따른 등급표시, 쇠고기의 경우 이력관리에 따른 표시 유무</dt>
						<dd><c:out value="${prodInfo.prod_info_6 }"/></dd>
					</dl>
					<dl>
						<dt>수산물-수산물품질관리법상 유전자변형수산물 표시, 지리적 표시</dt>
						<dd><c:out value="${prodInfo.prod_info_7 }"/></dd>
					</dl>
					<dl>
						<dt>수입식품에 해당하는 경우 식품위생법에 따른 수입신고를 필함의 문구</dt>
						<dd><c:out value="${prodInfo.prod_info_8 }"/></dd>
					</dl>
					<dl>
						<dt>상품구성</dt>
						<dd><c:out value="${prodInfo.prod_info_9 }"/></dd>
					</dl>
					<dl>
						<dt>보관방법 또는 취급방법</dt>
						<dd><c:out value="${prodInfo.prod_info_10 }"/></dd>
					</dl>
					<dl>
						<dt>소비자상담 관련 전화번호</dt>
						<dd><c:out value="${prodInfo.prod_info_11 }"/></dd>
					</dl>
				</c:if>
				<c:if test="${prodInfo.prod_category_cd eq '2'}">
					<dl>
						<dt>식품의 유형</dt>
						<dd><c:out value="${prodInfo.prod_info_1 }"/></dd>
					</dl>
					<dl>
						<dt>생산자, 수입품의 경우 수입자를 함께 표기</dt>
						<dd><c:out value="${prodInfo.prod_info_2 }"/></dd>
					</dl>
					<dl>
						<dt>제조연월일, 유통기한 또는 품질유지기한</dt>
						<dd><c:out value="${prodInfo.prod_info_3 }"/></dd>
					</dl>
					<dl>
						<dt>포장단위별 용량(중량), 수량</dt>
						<dd><c:out value="${prodInfo.prod_info_4 }"/></dd>
					</dl>
					<dl>
						<dt>원재료명 및 함량</dt>
						<dd><c:out value="${prodInfo.prod_info_5 }"/></dd>
					</dl>
					<dl>
						<dt>영양성분</dt>
						<dd><c:out value="${prodInfo.prod_info_6 }"/></dd>
					</dl>
					<dl>
						<dt>유전자재조합식품에 해당하는 경우의 표시</dt>
						<dd><c:out value="${prodInfo.prod_info_7 }"/></dd>
					</dl>
					<dl>
						<dt>영유아식 또는 체중조절식품 등에 해당하는 경우 표시광고 사전심의필</dt>
						<dd><c:out value="${prodInfo.prod_info_8 }"/></dd>
					</dl>
					<dl>
						<dt>수입식품에 해당하는 경우 식품위생법에 따른 수입신고를 필함의 문구</dt>
						<dd><c:out value="${prodInfo.prod_info_9 }"/></dd>
					</dl>
					<dl>
						<dt>소비자상담 관련 전화번호</dt>
						<dd><c:out value="${prodInfo.prod_info_10 }"/></dd>
					</dl>
				</c:if>
				<c:if test="${prodInfo.prod_category_cd eq '3'}">
					<dl>
						<dl>식품의 유형</dl>
						<dd><c:out value="${prodInfo.prod_info_1 }"/></dd>
					</dl>
					<dl>
						<dl>제조업소의 명칭과 소재지(수입품의 경우 수입업소명, 제조업소명 및 수출국명)</dl>
						<dd><c:out value="${prodInfo.prod_info_2 }"/></dd>
					</dl>
					<dl>
						<dl>제조연월일, 유통기한 또는 품질유지기한</dl>
						<dd><c:out value="${prodInfo.prod_info_3 }"/></dd>
					</dl>
					<dl>
						<dl>포장단위별 용량(중량), 수량</dl>
						<dd><c:out value="${prodInfo.prod_info_4 }"/></dd>
					</dl>
					<dl>
						<dl>원재료명 및 함량(농수산물의 원산지 표시에 관한 법률에 따른 원산지 표시 포함)</dl>
						<dd><c:out value="${prodInfo.prod_info_5 }"/></dd>
					</dl>
					<dl>
						<dl>영양정보</dl>
						<dd><c:out value="${prodInfo.prod_info_6 }"/></dd>
					</dl>
					<dl>
						<dl>기능정보</dl>
						<dd><c:out value="${prodInfo.prod_info_7 }"/></dd>
					</dl>
					<dl>
						<dl>섭취량, 섭취방법 및 섭취 시 주의사항 및 부작용 가능성</dl>
						<dd><c:out value="${prodInfo.prod_info_8 }"/></dd>
					</dl>
					<dl>
						<dl>질병의 예방 및 치료를 위한 의약품이 아니라는 내용의 표현</dl>
						<dd><c:out value="${prodInfo.prod_info_9 }"/></dd>
					</dl>
					<dl>
						<dl>유전자재조합식품에 해당하는 경우의 표시</dl>
						<dd><c:out value="${prodInfo.prod_info_10 }"/></dd>
					</dl>
					<dl>
						<dl>표시광고 사전심의필</dl>
						<dd><c:out value="${prodInfo.prod_info_11 }"/></dd>
					</dl>
					<dl>
						<dl>수입식품에 해당하는 경우 “건강기능식품에 관한 법률에 따른 수입신고를 필함”의 문구</dl>
						<dd><c:out value="${prodInfo.prod_info_12 }"/></dd>
					</dl>
					<dl>
						<dl>소비자상담 관련 전화번호</dl>
						<dd><c:out value="${prodInfo.prod_info_13 }"/></dd>
					</dl>
				</c:if>
				<c:if test="${prodInfo.prod_category_cd eq '4'}">
					<dl>
						<dt>용량 또는 중량</dt>
						<dd><c:out value="${prodInfo.prod_info_1 }"/></dd>
					</dl>
					<dl>
						<dt>제품 주요 사양</dt>
						<dd><c:out value="${prodInfo.prod_info_2 }"/></dd>
					</dl>
					<dl>
						<dt>사용기한 또는 개봉 후 사용기간</dt>
						<dd><c:out value="${prodInfo.prod_info_3 }"/></dd>
					</dl>
					<dl>
						<dt>사용방법</dt>
						<dd><c:out value="${prodInfo.prod_info_4 }"/></dd>
					</dl>
					<dl>
						<dt>제조업자 및 제조판매업자</dt>
						<dd><c:out value="${prodInfo.prod_info_5 }"/></dd>
					</dl>
					<dl>
						<dt>제조국</dt>
						<dd><c:out value="${prodInfo.prod_info_6 }"/></dd>
					</dl>
					<dl>
						<dt>화장품법에 따라 기재/표시하여야 하는 모든 성분</dt>
						<dd><c:out value="${prodInfo.prod_info_7 }"/></dd>
					</dl>
					<dl>
						<dt>기능성 화장품 심사 필 유무</dt>
						<dd><c:out value="${prodInfo.prod_info_8 }"/></dd>
					</dl>
					<dl>
						<dt>사용할 때 주의사항</dt>
						<dd><c:out value="${prodInfo.prod_info_9 }"/></dd>
					</dl>
					<dl>
						<dt>품질보증기준</dt>
						<dd><c:out value="${prodInfo.prod_info_10 }"/></dd>
					</dl>
					<dl>
						<dt>소비자상담 관련 전화번호</dt>
						<dd><c:out value="${prodInfo.prod_info_11 }"/></dd>
					</dl>
				</c:if>
				<c:if test="${prodInfo.prod_category_cd eq '5'}">
					<dl>
						<dt>품명 및 모델명</dt>
						<dd><c:out value="${prodInfo.prod_info_1 }"/></dd>
					</dl>
					<dl>
						<dt>제조자 또는 수입자(수입품의 경우 수입자를 함께 표기)</dt>
						<dd><c:out value="${prodInfo.prod_info_2 }"/></dd>
					</dl>
					<dl>
						<dt>제조국 또는 원산지</dt>
						<dd><c:out value="${prodInfo.prod_info_3 }"/></dd>
					</dl>
					<dl>
						<dt>법에 의한 인증ㆍ허가 등을 받았음을 확인할 수 있는 경우 그에 대한 사항</dt>
						<dd><c:out value="${prodInfo.prod_info_4 }"/></dd>
					</dl>
					<dl>
						<dt>A/S 책임자와 전화번호 또는 소비자상담 관련 전화번호</dt>
						<dd><c:out value="${prodInfo.prod_info_5 }"/></dd>
					</dl>
				</c:if>
				</dd>
			</dl>
			<c:import url="commonItemInfomationTrade.jsp"/>

		</article>
		<!-- } 상품 설명 -->
	</section>
	<!-- } 서천장터 뷰페이지 -->

</c:if>

<%-- 추천여행 --%>
<c:if test="${store_category eq 'CD002005' }">
	<!-- 추천여행상품 뷰 { -->
	<section id="recommendView" class="productview">
		<!-- 추천여행상품 뷰 상단 { -->
		<script>
		var course = new Array();
		</script>
		<article id="rcViewTop">
			<h2 class="tit"><c:out value="${prodInfo.prod_nm }"/></h2>
			<p class="subtxt"><c:out value="${prodInfo.prod_comment}"/></p>
			<c:set var="cnt" value="1"/>
			<c:set var="recom_start_id" value=""/>
			<c:set var="recom_start" value=""/>
			<c:set var="recom_end_id" value=""/>
			<c:set var="recom_end" value=""/>
			<c:set var="recom_cnt" value="0"/>
			<c:if test="${prodInfo.recom_1_use_st eq 'Y' }">
				<script>course.push('<c:out value="${prodInfo.recom_1_prod_nm}"/>')</script>
			 	<c:set var="recom_start" value="${prodInfo.recom_1_prod_nm }"/>
			 	<c:set var="recom_start_id" value="${prodInfo.prod_recom_1}"/>
			 	<c:set var="recom_end" value="${prodInfo.recom_1_prod_nm }"/>
			 	<c:set var="recom_end_id" value="${prodInfo.prod_recom_1}"/>
			 	<c:set var="recom_cnt" value="${recom_cnt+1}"/>
			 </c:if>
			 <c:if test="${prodInfo.recom_2_use_st eq 'Y' }">
			 	<script>course.push('<c:out value="${prodInfo.recom_2_prod_nm}"/>')</script>
			 	 <c:if test="${empty recom_start }">
			 	 	<c:set var="recom_start" value="${prodInfo.recom_2_prod_nm }"/>
			 		<c:set var="recom_start_id" value="${prodInfo.prod_recom_2}"/>
			 	 </c:if>
			 	<c:set var="recom_end" value="${prodInfo.recom_2_prod_nm }"/>
			 	<c:set var="recom_end_id" value="${prodInfo.prod_recom_1}"/>
			 	<c:set var="recom_cnt" value="${recom_cnt+1}"/>
			 </c:if>
			 <c:if test="${prodInfo.recom_3_use_st eq 'Y' }">
			 	<script>course.push('<c:out value="${prodInfo.recom_3_prod_nm}"/>')</script>
			 	 <c:if test="${empty recom_start }">
			 	 	<c:set var="recom_start" value="${prodInfo.recom_3_prod_nm }"/>
			 	 	<c:set var="recom_start_id" value="${prodInfo.prod_recom_3}"/>
			 	 </c:if>
			 	<c:set var="recom_end" value="${prodInfo.recom_3_prod_nm }"/>
			 	<c:set var="recom_end_id" value="${prodInfo.prod_recom_3}"/>
			 	<c:set var="recom_cnt" value="${recom_cnt+1}"/>
			 </c:if>
			 <c:if test="${prodInfo.recom_4_use_st eq 'Y' }">
			 	<script>course.push('<c:out value="${prodInfo.recom_4_prod_nm}"/>')</script>
			 	 <c:if test="${empty recom_start }">
			 	 	<c:set var="recom_start" value="${prodInfo.recom_4_prod_nm }"/>
			 	 	<c:set var="recom_start_id" value="${prodInfo.prod_recom_4}"/>
			 	 </c:if>
			 	<c:set var="recom_end" value="${prodInfo.recom_4_prod_nm }"/>
			 	<c:set var="recom_end_id" value="${prodInfo.prod_recom_4}"/>
			 	<c:set var="recom_cnt" value="${recom_cnt+1}"/>
			 </c:if>
			 <c:if test="${prodInfo.recom_5_use_st eq 'Y' }">
			 	<script>course.push('<c:out value="${prodInfo.recom_5_prod_nm}"/>')</script>
			 	 <c:if test="${empty recom_start }">
			 	 	<c:set var="recom_start" value="${prodInfo.recom_5_prod_nm }"/>
			 	 	<c:set var="recom_start_id" value="${prodInfo.prod_recom_5}"/>
			 	 </c:if>
			 	<c:set var="recom_end" value="${prodInfo.recom_5_prod_nm }"/>
			 	<c:set var="recom_end_id" value="${prodInfo.prod_recom_5}"/>
			 	<c:set var="recom_cnt" value="${recom_cnt+1}"/>
			 </c:if>
			 <c:if test="${prodInfo.recom_6_use_st eq 'Y' }">
			 	<script>course.push('<c:out value="${prodInfo.recom_6_prod_nm}"/>')</script>
			 	 <c:if test="${empty recom_start }">
			 	 	<c:set var="recom_start" value="${prodInfo.recom_6_prod_nm }"/>
			 	 	<c:set var="recom_start_id" value="${prodInfo.prod_recom_6}"/>
			 	 </c:if>
			 	<c:set var="recom_end" value="${prodInfo.recom_6_prod_nm }"/>
			 	<c:set var="recom_end_id" value="${prodInfo.prod_recom_6}"/>
			 	<c:set var="recom_cnt" value="${recom_cnt+1}"/>
			 </c:if>
			 <c:if test="${prodInfo.recom_7_use_st eq 'Y' }">
			 	<script>course.push('<c:out value="${prodInfo.recom_7_prod_nm}"/>')</script>
			 	 <c:if test="${empty recom_start }">
			 	 	<c:set var="recom_start" value="${prodInfo.recom_7_prod_nm }"/>
			 	 	<c:set var="recom_start_id" value="${prodInfo.prod_recom_7}"/>
			 	 </c:if>
			 	<c:set var="recom_end" value="${prodInfo.recom_7_prod_nm }"/>
			 	<c:set var="recom_end_id" value="${prodInfo.prod_recom_7}"/>
			 	<c:set var="recom_cnt" value="${recom_cnt+1}"/>
			 </c:if>
			 <c:if test="${prodInfo.recom_8_use_st eq 'Y' }">
			 	<script>course.push('<c:out value="${prodInfo.recom_8_prod_nm}"/>')</script>
			 	 <c:if test="${empty recom_start }">
			 	 	<c:set var="recom_start" value="${prodInfo.recom_8_prod_nm }"/>
			 	 	<c:set var="recom_start_id" value="${prodInfo.prod_recom_8}"/>
			 	 </c:if>
			 	<c:set var="recom_end" value="${prodInfo.recom_8_prod_nm }"/>
			 	<c:set var="recom_end_id" value="${prodInfo.prod_recom_8}"/>
			 	<c:set var="recom_cnt" value="${recom_cnt+1}"/>
			 </c:if>
			 <c:if test="${prodInfo.recom_9_use_st eq 'Y' }">
			 	<script>course.push('<c:out value="${prodInfo.recom_9_prod_nm}"/>')</script>
			 	 <c:if test="${empty recom_start }">
			 	 	<c:set var="recom_start" value="${prodInfo.recom_9_prod_nm }"/>
			 	 	<c:set var="recom_start_id" value="${prodInfo.prod_recom_9}"/>
			 	 </c:if>
			 	<c:set var="recom_end" value="${prodInfo.recom_9_prod_nm }"/>
			 	<c:set var="recom_end_id" value="${prodInfo.prod_recom_9}"/>
			 	<c:set var="recom_cnt" value="${recom_cnt+1}"/>
			 </c:if>
			 <c:if test="${prodInfo.recom_10_use_st eq 'Y' }">
			 	<script>course.push('<c:out value="${prodInfo.recom_10_prod_nm}"/>')</script>
			 	 <c:if test="${empty recom_start }">
			 	 	<c:set var="recom_start" value="${prodInfo.recom_10_prod_nm }"/>
			 	 	<c:set var="recom_start_id" value="${prodInfo.prod_recom_10}"/>
			 	 </c:if>
			 	<c:set var="recom_end" value="${prodInfo.recom_10_prod_nm }"/>
			 	<c:set var="recom_end_id" value="${prodInfo.prod_recom_10}"/>
			 	<c:set var="recom_cnt" value="${recom_cnt+1}"/>
			 </c:if>
			 
			<div class="tourgraph">
				<span class="won wonleft"><c:out value="${recom_start}"/></span>
				<span class="toursize">경유 <c:out value="${recom_cnt-2}"/>+</span>
				<span class="won wonright"><c:out value="${recom_end}"/></span>
			</div>
		</article>
		<!-- } 추천여행상품 뷰 상단 -->
		
		<article id="rcCourse">
			<h2>코스경유지</h2>
			<ul class="nopm" id="summary_course">
			<!-- 코스목록 요약 -->
			</ul>
		</article>
		<script>
		var shtml = "";
		for(i=0; i<course.length; i++) { 
			if(i == 0) {
				shtml += '<li><strong class="colorOrange">출발</strong> '+course[i]+'</li>';
			}
			else if(i == course.length-1) {
				shtml += '<li><strong class="colorOrange">도착</strong> '+course[i]+'</li>';
			}
			else {
				shtml += '<li>'+course[i]+'</li>';
			}
		}
		$("#summary_course").html(shtml);
		</script>

		<!-- 뷰 콘텐츠 { -->
		<article id="viewContent">
			<c:out value="${prodInfo.prod_content}" escapeXml = "false"/>
		</article>
		<!-- } 뷰 콘텐츠 -->

		<!-- 코스 상세 설명 { -->
		<article id="rcCourseDetail">
			
			<div class="rccd_area">
				
				<c:if test="${not empty prodInfo.prod_recom_1 && prodInfo.recom_1_use_st eq 'Y' }">
				<c:set var="prod_category_1" value=""/>
				<c:if test="${not empty prodInfo.prod_category }">
					<c:set var="prod_category_1" value="&prod_category=${prodInfo.prod_category}"/>
				</c:if>
				<div class="rccd_con">
					<a href="/shop/itemView.do?store_category=<c:out value="${prodInfo.recom_1_store_category}"/><c:out value="${prod_category_1 }"/>&prod_id=<c:out value="${prodInfo.prod_recom_1 }"/>" class="tit">
						<em><c:out value="${prodInfo.recom_1_prod_nm}"/></em>
						<span class="comment"><c:out value="${prodInfo.recom_1_prod_comment }" escapeXml = "false" /></span>
					</a>
					<div class="rccd_con_slide rrcdslide1 swiper-container">
						<ul class="nopm swiper-wrapper">
							<c:if test="${not empty prodInfo.recom_1_img }">
							<li class="swiper-slide"><a href="#;"><img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${prodInfo.recom_1_img}"/>&fileSn=0" style="width: 100%;" onerror="this.src='/images/baseScmtour/_noImage.png';"/></a></li>
							</c:if>
							<c:if test="${not empty prodInfo.recom_1_2_img }">
							<li class="swiper-slide"><a href="#;"><img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${prodInfo.recom_1_2_img}"/>&fileSn=0" style="width: 100%;" onerror="this.src='/images/baseScmtour/_noImage.png';"/></a></li>
							</c:if>
							<c:if test="${not empty prodInfo.recom_1_3_img }">
							<li class="swiper-slide"><a href="#;"><img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${prodInfo.recom_1_3_img}"/>&fileSn=0" style="width: 100%;" onerror="this.src='/images/baseScmtour/_noImage.png';"/></a></li>
							</c:if>
							<c:if test="${not empty prodInfo.recom_1_4_img }">
							<li class="swiper-slide"><a href="#;"><img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${prodInfo.recom_1_4_img}"/>&fileSn=0" style="width: 100%;" onerror="this.src='/images/baseScmtour/_noImage.png';"/></a></li>
							</c:if>
							<c:if test="${not empty prodInfo.recom_1_5_img }">
							<li class="swiper-slide"><a href="#;"><img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${prodInfo.recom_1_5_img}"/>&fileSn=0" style="width: 100%;" onerror="this.src='/images/baseScmtour/_noImage.png';"/></a></li>
							</c:if>
							<c:if test="${not empty prodInfo.recom_1_6_img }">
							<li class="swiper-slide"><a href="#;"><img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${prodInfo.recom_1_6_img}"/>&fileSn=0" style="width: 100%;" onerror="this.src='/images/baseScmtour/_noImage.png';"/></a></li>
							</c:if>
							<c:if test="${not empty prodInfo.recom_1_7_img }">
							<li class="swiper-slide"><a href="#;"><img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${prodInfo.recom_1_7_img}"/>&fileSn=0" style="width: 100%;" onerror="this.src='/images/baseScmtour/_noImage.png';"/></a></li>
							</c:if>
							<c:if test="${not empty prodInfo.recom_1_8_img }">
							<li class="swiper-slide"><a href="#;"><img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${prodInfo.recom_1_8_img}"/>&fileSn=0" style="width: 100%;" onerror="this.src='/images/baseScmtour/_noImage.png';"/></a></li>
							</c:if>
							<c:if test="${not empty prodInfo.recom_1_9_img }">
							<li class="swiper-slide"><a href="#;"><img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${prodInfo.recom_1_9_img}"/>&fileSn=0" style="width: 100%;" onerror="this.src='/images/baseScmtour/_noImage.png';"/></a></li>
							</c:if>
							<c:if test="${not empty prodInfo.recom_1_10_img }">
							<li class="swiper-slide"><a href="#;"><img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${prodInfo.recom_1_10_img}"/>&fileSn=0" style="width: 100%;" onerror="this.src='/images/baseScmtour/_noImage.png';"/></a></li>
							</c:if>
						</ul>
						<script>
							// 메인 슬라이드
							var swiper1 = new Swiper('.rrcdslide1', {
								slidesPerView: 'auto',
								spaceBetween: 5,
							});
						</script>
					</div>
				</div>
				</c:if>
				
				<c:if test="${not empty prodInfo.prod_recom_2 && prodInfo.recom_2_use_st eq 'Y' }">
				<c:set var="prod_category_1" value=""/>
				<c:if test="${not empty prodInfo.prod_category }">
					<c:set var="prod_category_1" value="&prod_category=${prodInfo.prod_category}"/>
				</c:if>
				<div class="rccd_con">
					<a href="/shop/itemView.do?store_category=<c:out value="${prodInfo.recom_2_store_category}"/><c:out value="${prod_category_1 }"/>&prod_id=<c:out value="${prodInfo.prod_recom_2 }"/>" class="tit">
						<em><c:out value="${prodInfo.recom_2_prod_nm}"/></em>
						<span class="comment"><c:out value="${prodInfo.recom_2_prod_comment }" escapeXml = "false" /></span>
					</a>
					<div class="rccd_con_slide rrcdslide2 swiper-container">
						<ul class="nopm swiper-wrapper">
							<c:if test="${not empty prodInfo.recom_2_img }">
							<li class="swiper-slide"><a href="#;"><img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${prodInfo.recom_2_img}"/>&fileSn=0" style="width: 100%;" onerror="this.src='/images/baseScmtour/_noImage.png';"/></a></li>
							</c:if>
							<c:if test="${not empty prodInfo.recom_2_2_img }">
							<li class="swiper-slide"><a href="#;"><img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${prodInfo.recom_2_2_img}"/>&fileSn=0" style="width: 100%;" onerror="this.src='/images/baseScmtour/_noImage.png';"/></a></li>
							</c:if>
							<c:if test="${not empty prodInfo.recom_2_3_img }">
							<li class="swiper-slide"><a href="#;"><img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${prodInfo.recom_2_3_img}"/>&fileSn=0" style="width: 100%;" onerror="this.src='/images/baseScmtour/_noImage.png';"/></a></li>
							</c:if>
							<c:if test="${not empty prodInfo.recom_2_4_img }">
							<li class="swiper-slide"><a href="#;"><img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${prodInfo.recom_2_4_img}"/>&fileSn=0" style="width: 100%;" onerror="this.src='/images/baseScmtour/_noImage.png';"/></a></li>
							</c:if>
							<c:if test="${not empty prodInfo.recom_2_5_img }">
							<li class="swiper-slide"><a href="#;"><img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${prodInfo.recom_2_5_img}"/>&fileSn=0" style="width: 100%;" onerror="this.src='/images/baseScmtour/_noImage.png';"/></a></li>
							</c:if>
							<c:if test="${not empty prodInfo.recom_2_6_img }">
							<li class="swiper-slide"><a href="#;"><img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${prodInfo.recom_2_6_img}"/>&fileSn=0" style="width: 100%;" onerror="this.src='/images/baseScmtour/_noImage.png';"/></a></li>
							</c:if>
							<c:if test="${not empty prodInfo.recom_2_7_img }">
							<li class="swiper-slide"><a href="#;"><img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${prodInfo.recom_2_7_img}"/>&fileSn=0" style="width: 100%;" onerror="this.src='/images/baseScmtour/_noImage.png';"/></a></li>
							</c:if>
							<c:if test="${not empty prodInfo.recom_2_8_img }">
							<li class="swiper-slide"><a href="#;"><img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${prodInfo.recom_2_8_img}"/>&fileSn=0" style="width: 100%;" onerror="this.src='/images/baseScmtour/_noImage.png';"/></a></li>
							</c:if>
							<c:if test="${not empty prodInfo.recom_2_9_img }">
							<li class="swiper-slide"><a href="#;"><img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${prodInfo.recom_2_9_img}"/>&fileSn=0" style="width: 100%;" onerror="this.src='/images/baseScmtour/_noImage.png';"/></a></li>
							</c:if>
							<c:if test="${not empty prodInfo.recom_2_10_img }">
							<li class="swiper-slide"><a href="#;"><img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${prodInfo.recom_2_10_img}"/>&fileSn=0" style="width: 100%;" onerror="this.src='/images/baseScmtour/_noImage.png';"/></a></li>
							</c:if>
						</ul>
						<script>
							// 메인 슬라이드
							var swiper2 = new Swiper('.rrcdslide2', {
								slidesPerView: 'auto',
								spaceBetween: 5,
							});
						</script>
					</div>
				</div>
				</c:if>

				<c:if test="${not empty prodInfo.prod_recom_3 && prodInfo.recom_3_use_st eq 'Y' }">
				<c:set var="prod_category_1" value=""/>
				<c:if test="${not empty prodInfo.prod_category }">
					<c:set var="prod_category_1" value="&prod_category=${prodInfo.prod_category}"/>
				</c:if>
				<div class="rccd_con">
					<a href="/shop/itemView.do?store_category=<c:out value="${prodInfo.recom_3_store_category}"/><c:out value="${prod_category_1 }"/>&prod_id=<c:out value="${prodInfo.prod_recom_3 }"/>" class="tit">
						<em><c:out value="${prodInfo.recom_3_prod_nm}"/></em>
						<span class="comment"><c:out value="${prodInfo.recom_3_prod_comment }" escapeXml = "false" /></span>
					</a>
					<div class="rccd_con_slide rrcdslide3 swiper-container">
						<ul class="nopm swiper-wrapper">
							<c:if test="${not empty prodInfo.recom_3_img }">
							<li class="swiper-slide"><a href="#;"><img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${prodInfo.recom_3_img}"/>&fileSn=0" style="width: 100%;" onerror="this.src='/images/baseScmtour/_noImage.png';"/></a></li>
							</c:if>
							<c:if test="${not empty prodInfo.recom_3_2_img }">
							<li class="swiper-slide"><a href="#;"><img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${prodInfo.recom_3_2_img}"/>&fileSn=0" style="width: 100%;" onerror="this.src='/images/baseScmtour/_noImage.png';"/></a></li>
							</c:if>
							<c:if test="${not empty prodInfo.recom_3_3_img }">
							<li class="swiper-slide"><a href="#;"><img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${prodInfo.recom_3_3_img}"/>&fileSn=0" style="width: 100%;" onerror="this.src='/images/baseScmtour/_noImage.png';"/></a></li>
							</c:if>
							<c:if test="${not empty prodInfo.recom_3_4_img }">
							<li class="swiper-slide"><a href="#;"><img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${prodInfo.recom_3_4_img}"/>&fileSn=0" style="width: 100%;" onerror="this.src='/images/baseScmtour/_noImage.png';"/></a></li>
							</c:if>
							<c:if test="${not empty prodInfo.recom_3_5_img }">
							<li class="swiper-slide"><a href="#;"><img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${prodInfo.recom_3_5_img}"/>&fileSn=0" style="width: 100%;" onerror="this.src='/images/baseScmtour/_noImage.png';"/></a></li>
							</c:if>
							<c:if test="${not empty prodInfo.recom_3_6_img }">
							<li class="swiper-slide"><a href="#;"><img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${prodInfo.recom_3_6_img}"/>&fileSn=0" style="width: 100%;" onerror="this.src='/images/baseScmtour/_noImage.png';"/></a></li>
							</c:if>
							<c:if test="${not empty prodInfo.recom_3_7_img }">
							<li class="swiper-slide"><a href="#;"><img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${prodInfo.recom_3_7_img}"/>&fileSn=0" style="width: 100%;" onerror="this.src='/images/baseScmtour/_noImage.png';"/></a></li>
							</c:if>
							<c:if test="${not empty prodInfo.recom_3_8_img }">
							<li class="swiper-slide"><a href="#;"><img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${prodInfo.recom_3_8_img}"/>&fileSn=0" style="width: 100%;" onerror="this.src='/images/baseScmtour/_noImage.png';"/></a></li>
							</c:if>
							<c:if test="${not empty prodInfo.recom_3_9_img }">
							<li class="swiper-slide"><a href="#;"><img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${prodInfo.recom_3_9_img}"/>&fileSn=0" style="width: 100%;" onerror="this.src='/images/baseScmtour/_noImage.png';"/></a></li>
							</c:if>
							<c:if test="${not empty prodInfo.recom_3_10_img }">
							<li class="swiper-slide"><a href="#;"><img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${prodInfo.recom_3_10_img}"/>&fileSn=0" style="width: 100%;" onerror="this.src='/images/baseScmtour/_noImage.png';"/></a></li>
							</c:if>
						</ul>
						<script>
							// 메인 슬라이드
							var swiper3 = new Swiper('.rrcdslide3', {
								slidesPerView: 'auto',
								spaceBetween: 5,
							});
						</script>
					</div>
				</div>
				</c:if>
				
				<c:if test="${not empty prodInfo.prod_recom_4 && prodInfo.recom_4_use_st eq 'Y' }">
				<c:set var="prod_category_1" value=""/>
				<c:if test="${not empty prodInfo.prod_category }">
					<c:set var="prod_category_1" value="&prod_category=${prodInfo.prod_category}"/>
				</c:if>
				<div class="rccd_con">
					<a href="/shop/itemView.do?store_category=<c:out value="${prodInfo.recom_4_store_category}"/><c:out value="${prod_category_1 }"/>&prod_id=<c:out value="${prodInfo.prod_recom_4 }"/>" class="tit">
						<em><c:out value="${prodInfo.recom_4_prod_nm}"/></em>
						<span class="comment"><c:out value="${prodInfo.recom_4_prod_comment }" escapeXml = "false" /></span>
					</a>
					<div class="rccd_con_slide rrcdslide4 swiper-container">
						<ul class="nopm swiper-wrapper">
							<c:if test="${not empty prodInfo.recom_4_img }">
							<li class="swiper-slide"><a href="#;"><img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${prodInfo.recom_4_img}"/>&fileSn=0" style="width: 100%;" onerror="this.src='/images/baseScmtour/_noImage.png';"/></a></li>
							</c:if>
							<c:if test="${not empty prodInfo.recom_4_2_img }">
							<li class="swiper-slide"><a href="#;"><img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${prodInfo.recom_4_2_img}"/>&fileSn=0" style="width: 100%;" onerror="this.src='/images/baseScmtour/_noImage.png';"/></a></li>
							</c:if>
							<c:if test="${not empty prodInfo.recom_4_3_img }">
							<li class="swiper-slide"><a href="#;"><img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${prodInfo.recom_4_3_img}"/>&fileSn=0" style="width: 100%;" onerror="this.src='/images/baseScmtour/_noImage.png';"/></a></li>
							</c:if>
							<c:if test="${not empty prodInfo.recom_4_4_img }">
							<li class="swiper-slide"><a href="#;"><img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${prodInfo.recom_4_4_img}"/>&fileSn=0" style="width: 100%;" onerror="this.src='/images/baseScmtour/_noImage.png';"/></a></li>
							</c:if>
							<c:if test="${not empty prodInfo.recom_4_5_img }">
							<li class="swiper-slide"><a href="#;"><img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${prodInfo.recom_4_5_img}"/>&fileSn=0" style="width: 100%;" onerror="this.src='/images/baseScmtour/_noImage.png';"/></a></li>
							</c:if>
							<c:if test="${not empty prodInfo.recom_4_6_img }">
							<li class="swiper-slide"><a href="#;"><img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${prodInfo.recom_4_6_img}"/>&fileSn=0" style="width: 100%;" onerror="this.src='/images/baseScmtour/_noImage.png';"/></a></li>
							</c:if>
							<c:if test="${not empty prodInfo.recom_4_7_img }">
							<li class="swiper-slide"><a href="#;"><img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${prodInfo.recom_4_7_img}"/>&fileSn=0" style="width: 100%;" onerror="this.src='/images/baseScmtour/_noImage.png';"/></a></li>
							</c:if>
							<c:if test="${not empty prodInfo.recom_4_8_img }">
							<li class="swiper-slide"><a href="#;"><img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${prodInfo.recom_4_8_img}"/>&fileSn=0" style="width: 100%;" onerror="this.src='/images/baseScmtour/_noImage.png';"/></a></li>
							</c:if>
							<c:if test="${not empty prodInfo.recom_4_9_img }">
							<li class="swiper-slide"><a href="#;"><img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${prodInfo.recom_4_9_img}"/>&fileSn=0" style="width: 100%;" onerror="this.src='/images/baseScmtour/_noImage.png';"/></a></li>
							</c:if>
							<c:if test="${not empty prodInfo.recom_4_10_img }">
							<li class="swiper-slide"><a href="#;"><img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${prodInfo.recom_4_10_img}"/>&fileSn=0" style="width: 100%;" onerror="this.src='/images/baseScmtour/_noImage.png';"/></a></li>
							</c:if>
						</ul>
						<script>
							// 메인 슬라이드
							var swiper4 = new Swiper('.rrcdslide4', {
								slidesPerView: 'auto',
								spaceBetween: 5,
							});
						</script>
					</div>
				</div>
				</c:if>
				
				<c:if test="${not empty prodInfo.prod_recom_5 && prodInfo.recom_5_use_st eq 'Y' }">
				<c:set var="prod_category_1" value=""/>
				<c:if test="${not empty prodInfo.prod_category }">
					<c:set var="prod_category_1" value="&prod_category=${prodInfo.prod_category}"/>
				</c:if>
				<div class="rccd_con">
					<a href="/shop/itemView.do?store_category=<c:out value="${prodInfo.recom_5_store_category}"/><c:out value="${prod_category_1 }"/>&prod_id=<c:out value="${prodInfo.prod_recom_5 }"/>" class="tit">
						<em><c:out value="${prodInfo.recom_5_prod_nm}"/></em>
						<span class="comment"><c:out value="${prodInfo.recom_5_prod_comment }" escapeXml = "false" /></span>
					</a>
					<div class="rccd_con_slide rrcdslide5 swiper-container">
						<ul class="nopm swiper-wrapper">
							<c:if test="${not empty prodInfo.recom_5_img }">
							<li class="swiper-slide"><a href="#;"><img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${prodInfo.recom_5_img}"/>&fileSn=0" style="width: 100%;" onerror="this.src='/images/baseScmtour/_noImage.png';"/></a></li>
							</c:if>
							<c:if test="${not empty prodInfo.recom_5_2_img }">
							<li class="swiper-slide"><a href="#;"><img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${prodInfo.recom_5_2_img}"/>&fileSn=0" style="width: 100%;" onerror="this.src='/images/baseScmtour/_noImage.png';"/></a></li>
							</c:if>
							<c:if test="${not empty prodInfo.recom_5_3_img }">
							<li class="swiper-slide"><a href="#;"><img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${prodInfo.recom_5_3_img}"/>&fileSn=0" style="width: 100%;" onerror="this.src='/images/baseScmtour/_noImage.png';"/></a></li>
							</c:if>
							<c:if test="${not empty prodInfo.recom_5_4_img }">
							<li class="swiper-slide"><a href="#;"><img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${prodInfo.recom_5_4_img}"/>&fileSn=0" style="width: 100%;" onerror="this.src='/images/baseScmtour/_noImage.png';"/></a></li>
							</c:if>
							<c:if test="${not empty prodInfo.recom_5_5_img }">
							<li class="swiper-slide"><a href="#;"><img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${prodInfo.recom_5_5_img}"/>&fileSn=0" style="width: 100%;" onerror="this.src='/images/baseScmtour/_noImage.png';"/></a></li>
							</c:if>
							<c:if test="${not empty prodInfo.recom_5_6_img }">
							<li class="swiper-slide"><a href="#;"><img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${prodInfo.recom_5_6_img}"/>&fileSn=0" style="width: 100%;" onerror="this.src='/images/baseScmtour/_noImage.png';"/></a></li>
							</c:if>
							<c:if test="${not empty prodInfo.recom_5_7_img }">
							<li class="swiper-slide"><a href="#;"><img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${prodInfo.recom_5_7_img}"/>&fileSn=0" style="width: 100%;" onerror="this.src='/images/baseScmtour/_noImage.png';"/></a></li>
							</c:if>
							<c:if test="${not empty prodInfo.recom_5_8_img }">
							<li class="swiper-slide"><a href="#;"><img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${prodInfo.recom_5_8_img}"/>&fileSn=0" style="width: 100%;" onerror="this.src='/images/baseScmtour/_noImage.png';"/></a></li>
							</c:if>
							<c:if test="${not empty prodInfo.recom_5_9_img }">
							<li class="swiper-slide"><a href="#;"><img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${prodInfo.recom_5_9_img}"/>&fileSn=0" style="width: 100%;" onerror="this.src='/images/baseScmtour/_noImage.png';"/></a></li>
							</c:if>
							<c:if test="${not empty prodInfo.recom_5_10_img }">
							<li class="swiper-slide"><a href="#;"><img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${prodInfo.recom_5_10_img}"/>&fileSn=0" style="width: 100%;" onerror="this.src='/images/baseScmtour/_noImage.png';"/></a></li>
							</c:if>
						</ul>
						<script>
							// 메인 슬라이드
							var swiper5 = new Swiper('.rrcdslide5', {
								slidesPerView: 'auto',
								spaceBetween: 5,
							});
						</script>
					</div>
				</div>
				</c:if>
				
				<c:if test="${not empty prodInfo.prod_recom_6 && prodInfo.recom_6_use_st eq 'Y' }">
				<c:set var="prod_category_1" value=""/>
				<c:if test="${not empty prodInfo.prod_category }">
					<c:set var="prod_category_1" value="&prod_category=${prodInfo.prod_category}"/>
				</c:if>
				<div class="rccd_con">
					<a href="/shop/itemView.do?store_category=<c:out value="${prodInfo.recom_6_store_category}"/><c:out value="${prod_category_1 }"/>&prod_id=<c:out value="${prodInfo.prod_recom_6 }"/>" class="tit">
						<em><c:out value="${prodInfo.recom_6_prod_nm}"/></em>
						<span class="comment"><c:out value="${prodInfo.recom_6_prod_comment }" escapeXml = "false" /></span>
					</a>
					<div class="rccd_con_slide rrcdslide6 swiper-container">
						<ul class="nopm swiper-wrapper">
							<c:if test="${not empty prodInfo.recom_6_img }">
							<li class="swiper-slide"><a href="#;"><img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${prodInfo.recom_6_img}"/>&fileSn=0" style="width: 100%;" onerror="this.src='/images/baseScmtour/_noImage.png';"/></a></li>
							</c:if>
							<c:if test="${not empty prodInfo.recom_6_2_img }">
							<li class="swiper-slide"><a href="#;"><img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${prodInfo.recom_6_2_img}"/>&fileSn=0" style="width: 100%;" onerror="this.src='/images/baseScmtour/_noImage.png';"/></a></li>
							</c:if>
							<c:if test="${not empty prodInfo.recom_6_3_img }">
							<li class="swiper-slide"><a href="#;"><img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${prodInfo.recom_6_3_img}"/>&fileSn=0" style="width: 100%;" onerror="this.src='/images/baseScmtour/_noImage.png';"/></a></li>
							</c:if>
							<c:if test="${not empty prodInfo.recom_6_4_img }">
							<li class="swiper-slide"><a href="#;"><img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${prodInfo.recom_6_4_img}"/>&fileSn=0" style="width: 100%;" onerror="this.src='/images/baseScmtour/_noImage.png';"/></a></li>
							</c:if>
							<c:if test="${not empty prodInfo.recom_6_5_img }">
							<li class="swiper-slide"><a href="#;"><img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${prodInfo.recom_6_5_img}"/>&fileSn=0" style="width: 100%;" onerror="this.src='/images/baseScmtour/_noImage.png';"/></a></li>
							</c:if>
							<c:if test="${not empty prodInfo.recom_6_6_img }">
							<li class="swiper-slide"><a href="#;"><img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${prodInfo.recom_6_6_img}"/>&fileSn=0" style="width: 100%;" onerror="this.src='/images/baseScmtour/_noImage.png';"/></a></li>
							</c:if>
							<c:if test="${not empty prodInfo.recom_6_7_img }">
							<li class="swiper-slide"><a href="#;"><img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${prodInfo.recom_6_7_img}"/>&fileSn=0" style="width: 100%;" onerror="this.src='/images/baseScmtour/_noImage.png';"/></a></li>
							</c:if>
							<c:if test="${not empty prodInfo.recom_6_8_img }">
							<li class="swiper-slide"><a href="#;"><img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${prodInfo.recom_6_8_img}"/>&fileSn=0" style="width: 100%;" onerror="this.src='/images/baseScmtour/_noImage.png';"/></a></li>
							</c:if>
							<c:if test="${not empty prodInfo.recom_6_9_img }">
							<li class="swiper-slide"><a href="#;"><img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${prodInfo.recom_6_9_img}"/>&fileSn=0" style="width: 100%;" onerror="this.src='/images/baseScmtour/_noImage.png';"/></a></li>
							</c:if>
							<c:if test="${not empty prodInfo.recom_6_10_img }">
							<li class="swiper-slide"><a href="#;"><img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${prodInfo.recom_6_10_img}"/>&fileSn=0" style="width: 100%;" onerror="this.src='/images/baseScmtour/_noImage.png';"/></a></li>
							</c:if>
						</ul>
						<script>
							// 메인 슬라이드
							var swiper6 = new Swiper('.rrcdslide6', {
								slidesPerView: 'auto',
								spaceBetween: 5,
							});
						</script>
					</div>
				</div>
				</c:if>
				
				<c:if test="${not empty prodInfo.prod_recom_7 && prodInfo.recom_7_use_st eq 'Y' }">
				<c:set var="prod_category_1" value=""/>
				<c:if test="${not empty prodInfo.prod_category }">
					<c:set var="prod_category_1" value="&prod_category=${prodInfo.prod_category}"/>
				</c:if>
				<div class="rccd_con">
					<a href="/shop/itemView.do?store_category=<c:out value="${prodInfo.recom_7_store_category}"/><c:out value="${prod_category_1 }"/>&prod_id=<c:out value="${prodInfo.prod_recom_7 }"/>" class="tit">
						<em><c:out value="${prodInfo.recom_7_prod_nm}"/></em>
						<span class="comment"><c:out value="${prodInfo.recom_7_prod_comment }" escapeXml = "false" /></span>
					</a>
					<div class="rccd_con_slide rrcdslide7 swiper-container">
						<ul class="nopm swiper-wrapper">
							<c:if test="${not empty prodInfo.recom_7_img }">
							<li class="swiper-slide"><a href="#;"><img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${prodInfo.recom_7_img}"/>&fileSn=0" style="width: 100%;" onerror="this.src='/images/baseScmtour/_noImage.png';"/></a></li>
							</c:if>
							<c:if test="${not empty prodInfo.recom_7_2_img }">
							<li class="swiper-slide"><a href="#;"><img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${prodInfo.recom_7_2_img}"/>&fileSn=0" style="width: 100%;" onerror="this.src='/images/baseScmtour/_noImage.png';"/></a></li>
							</c:if>
							<c:if test="${not empty prodInfo.recom_7_3_img }">
							<li class="swiper-slide"><a href="#;"><img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${prodInfo.recom_7_3_img}"/>&fileSn=0" style="width: 100%;" onerror="this.src='/images/baseScmtour/_noImage.png';"/></a></li>
							</c:if>
							<c:if test="${not empty prodInfo.recom_7_4_img }">
							<li class="swiper-slide"><a href="#;"><img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${prodInfo.recom_7_4_img}"/>&fileSn=0" style="width: 100%;" onerror="this.src='/images/baseScmtour/_noImage.png';"/></a></li>
							</c:if>
							<c:if test="${not empty prodInfo.recom_7_5_img }">
							<li class="swiper-slide"><a href="#;"><img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${prodInfo.recom_7_5_img}"/>&fileSn=0" style="width: 100%;" onerror="this.src='/images/baseScmtour/_noImage.png';"/></a></li>
							</c:if>
							<c:if test="${not empty prodInfo.recom_7_6_img }">
							<li class="swiper-slide"><a href="#;"><img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${prodInfo.recom_7_6_img}"/>&fileSn=0" style="width: 100%;" onerror="this.src='/images/baseScmtour/_noImage.png';"/></a></li>
							</c:if>
							<c:if test="${not empty prodInfo.recom_7_7_img }">
							<li class="swiper-slide"><a href="#;"><img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${prodInfo.recom_7_7_img}"/>&fileSn=0" style="width: 100%;" onerror="this.src='/images/baseScmtour/_noImage.png';"/></a></li>
							</c:if>
							<c:if test="${not empty prodInfo.recom_7_8_img }">
							<li class="swiper-slide"><a href="#;"><img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${prodInfo.recom_7_8_img}"/>&fileSn=0" style="width: 100%;" onerror="this.src='/images/baseScmtour/_noImage.png';"/></a></li>
							</c:if>
							<c:if test="${not empty prodInfo.recom_7_9_img }">
							<li class="swiper-slide"><a href="#;"><img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${prodInfo.recom_7_9_img}"/>&fileSn=0" style="width: 100%;" onerror="this.src='/images/baseScmtour/_noImage.png';"/></a></li>
							</c:if>
							<c:if test="${not empty prodInfo.recom_7_10_img }">
							<li class="swiper-slide"><a href="#;"><img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${prodInfo.recom_7_10_img}"/>&fileSn=0" style="width: 100%;" onerror="this.src='/images/baseScmtour/_noImage.png';"/></a></li>
							</c:if>
						</ul>
						<script>
							// 메인 슬라이드
							var swiper7 = new Swiper('.rrcdslide7', {
								slidesPerView: 'auto',
								spaceBetween: 5,
							});
						</script>
					</div>
				</div>
				</c:if><c:if test="${not empty prodInfo.prod_recom_8 && prodInfo.recom_8_use_st eq 'Y' }">
				<c:set var="prod_category_1" value=""/>
				<c:if test="${not empty prodInfo.prod_category }">
					<c:set var="prod_category_1" value="&prod_category=${prodInfo.prod_category}"/>
				</c:if>
				<div class="rccd_con">
					<a href="/shop/itemView.do?store_category=<c:out value="${prodInfo.recom_8_store_category}"/><c:out value="${prod_category_1 }"/>&prod_id=<c:out value="${prodInfo.prod_recom_8 }"/>" class="tit">
						<em><c:out value="${prodInfo.recom_8_prod_nm}"/></em>
						<span class="comment"><c:out value="${prodInfo.recom_8_prod_comment }" escapeXml = "false" /></span>
					</a>
					<div class="rccd_con_slide rrcdslide8 swiper-container">
						<ul class="nopm swiper-wrapper">
							<c:if test="${not empty prodInfo.recom_8_img }">
							<li class="swiper-slide"><a href="#;"><img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${prodInfo.recom_8_img}"/>&fileSn=0" style="width: 100%;" onerror="this.src='/images/baseScmtour/_noImage.png';"/></a></li>
							</c:if>
							<c:if test="${not empty prodInfo.recom_8_2_img }">
							<li class="swiper-slide"><a href="#;"><img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${prodInfo.recom_8_2_img}"/>&fileSn=0" style="width: 100%;" onerror="this.src='/images/baseScmtour/_noImage.png';"/></a></li>
							</c:if>
							<c:if test="${not empty prodInfo.recom_8_3_img }">
							<li class="swiper-slide"><a href="#;"><img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${prodInfo.recom_8_3_img}"/>&fileSn=0" style="width: 100%;" onerror="this.src='/images/baseScmtour/_noImage.png';"/></a></li>
							</c:if>
							<c:if test="${not empty prodInfo.recom_8_4_img }">
							<li class="swiper-slide"><a href="#;"><img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${prodInfo.recom_8_4_img}"/>&fileSn=0" style="width: 100%;" onerror="this.src='/images/baseScmtour/_noImage.png';"/></a></li>
							</c:if>
							<c:if test="${not empty prodInfo.recom_8_5_img }">
							<li class="swiper-slide"><a href="#;"><img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${prodInfo.recom_8_5_img}"/>&fileSn=0" style="width: 100%;" onerror="this.src='/images/baseScmtour/_noImage.png';"/></a></li>
							</c:if>
							<c:if test="${not empty prodInfo.recom_8_6_img }">
							<li class="swiper-slide"><a href="#;"><img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${prodInfo.recom_8_6_img}"/>&fileSn=0" style="width: 100%;" onerror="this.src='/images/baseScmtour/_noImage.png';"/></a></li>
							</c:if>
							<c:if test="${not empty prodInfo.recom_8_7_img }">
							<li class="swiper-slide"><a href="#;"><img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${prodInfo.recom_8_7_img}"/>&fileSn=0" style="width: 100%;" onerror="this.src='/images/baseScmtour/_noImage.png';"/></a></li>
							</c:if>
							<c:if test="${not empty prodInfo.recom_8_8_img }">
							<li class="swiper-slide"><a href="#;"><img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${prodInfo.recom_8_8_img}"/>&fileSn=0" style="width: 100%;" onerror="this.src='/images/baseScmtour/_noImage.png';"/></a></li>
							</c:if>
							<c:if test="${not empty prodInfo.recom_8_9_img }">
							<li class="swiper-slide"><a href="#;"><img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${prodInfo.recom_8_9_img}"/>&fileSn=0" style="width: 100%;" onerror="this.src='/images/baseScmtour/_noImage.png';"/></a></li>
							</c:if>
							<c:if test="${not empty prodInfo.recom_8_10_img }">
							<li class="swiper-slide"><a href="#;"><img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${prodInfo.recom_8_10_img}"/>&fileSn=0" style="width: 100%;" onerror="this.src='/images/baseScmtour/_noImage.png';"/></a></li>
							</c:if>
						</ul>
						<script>
							// 메인 슬라이드
							var swiper8 = new Swiper('.rrcdslide8', {
								slidesPerView: 'auto',
								spaceBetween: 5,
							});
						</script>
					</div>
				</div>
				</c:if>
				
				<c:if test="${not empty prodInfo.prod_recom_9 && prodInfo.recom_9_use_st eq 'Y' }">
				<c:set var="prod_category_1" value=""/>
				<c:if test="${not empty prodInfo.prod_category }">
					<c:set var="prod_category_1" value="&prod_category=${prodInfo.prod_category}"/>
				</c:if>
				<div class="rccd_con">
					<a href="/shop/itemView.do?store_category=<c:out value="${prodInfo.recom_9_store_category}"/><c:out value="${prod_category_1 }"/>&prod_id=<c:out value="${prodInfo.prod_recom_9 }"/>" class="tit">
						<em><c:out value="${prodInfo.recom_9_prod_nm}"/></em>
						<span class="comment"><c:out value="${prodInfo.recom_9_prod_comment }" escapeXml = "false" /></span>
					</a>
					<div class="rccd_con_slide rrcdslide9 swiper-container">
						<ul class="nopm swiper-wrapper">
							<c:if test="${not empty prodInfo.recom_9_img }">
							<li class="swiper-slide"><a href="#;"><img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${prodInfo.recom_9_img}"/>&fileSn=0" style="width: 100%;" onerror="this.src='/images/baseScmtour/_noImage.png';"/></a></li>
							</c:if>
							<c:if test="${not empty prodInfo.recom_9_2_img }">
							<li class="swiper-slide"><a href="#;"><img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${prodInfo.recom_9_2_img}"/>&fileSn=0" style="width: 100%;" onerror="this.src='/images/baseScmtour/_noImage.png';"/></a></li>
							</c:if>
							<c:if test="${not empty prodInfo.recom_9_3_img }">
							<li class="swiper-slide"><a href="#;"><img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${prodInfo.recom_9_3_img}"/>&fileSn=0" style="width: 100%;" onerror="this.src='/images/baseScmtour/_noImage.png';"/></a></li>
							</c:if>
							<c:if test="${not empty prodInfo.recom_9_4_img }">
							<li class="swiper-slide"><a href="#;"><img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${prodInfo.recom_9_4_img}"/>&fileSn=0" style="width: 100%;" onerror="this.src='/images/baseScmtour/_noImage.png';"/></a></li>
							</c:if>
							<c:if test="${not empty prodInfo.recom_9_5_img }">
							<li class="swiper-slide"><a href="#;"><img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${prodInfo.recom_9_5_img}"/>&fileSn=0" style="width: 100%;" onerror="this.src='/images/baseScmtour/_noImage.png';"/></a></li>
							</c:if>
							<c:if test="${not empty prodInfo.recom_9_6_img }">
							<li class="swiper-slide"><a href="#;"><img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${prodInfo.recom_9_6_img}"/>&fileSn=0" style="width: 100%;" onerror="this.src='/images/baseScmtour/_noImage.png';"/></a></li>
							</c:if>
							<c:if test="${not empty prodInfo.recom_9_7_img }">
							<li class="swiper-slide"><a href="#;"><img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${prodInfo.recom_9_7_img}"/>&fileSn=0" style="width: 100%;" onerror="this.src='/images/baseScmtour/_noImage.png';"/></a></li>
							</c:if>
							<c:if test="${not empty prodInfo.recom_9_8_img }">
							<li class="swiper-slide"><a href="#;"><img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${prodInfo.recom_9_8_img}"/>&fileSn=0" style="width: 100%;" onerror="this.src='/images/baseScmtour/_noImage.png';"/></a></li>
							</c:if>
							<c:if test="${not empty prodInfo.recom_9_9_img }">
							<li class="swiper-slide"><a href="#;"><img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${prodInfo.recom_9_9_img}"/>&fileSn=0" style="width: 100%;" onerror="this.src='/images/baseScmtour/_noImage.png';"/></a></li>
							</c:if>
							<c:if test="${not empty prodInfo.recom_9_10_img }">
							<li class="swiper-slide"><a href="#;"><img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${prodInfo.recom_9_10_img}"/>&fileSn=0" style="width: 100%;" onerror="this.src='/images/baseScmtour/_noImage.png';"/></a></li>
							</c:if>
						</ul>
						<script>
							// 메인 슬라이드
							var swiper9 = new Swiper('.rrcdslide9', {
								slidesPerView: 'auto',
								spaceBetween: 5,
							});
						</script>
					</div>
				</div>
				</c:if>
				
				<c:if test="${not empty prodInfo.prod_recom_10 && prodInfo.recom_10_use_st eq 'Y' }">
				<c:set var="prod_category_1" value=""/>
				<c:if test="${not empty prodInfo.prod_category }">
					<c:set var="prod_category_1" value="&prod_category=${prodInfo.prod_category}"/>
				</c:if>
				<div class="rccd_con">
					<a href="/shop/itemView.do?store_category=<c:out value="${prodInfo.recom_10_store_category}"/><c:out value="${prod_category_1 }"/>&prod_id=<c:out value="${prodInfo.prod_recom_10 }"/>" class="tit">
						<em><c:out value="${prodInfo.recom_10_prod_nm}"/></em>
						<span class="comment"><c:out value="${prodInfo.recom_10_prod_comment }" escapeXml = "false" /></span>
					</a>
					<div class="rccd_con_slide rrcdslide10 swiper-container">
						<ul class="nopm swiper-wrapper">
							<c:if test="${not empty prodInfo.recom_10_img }">
							<li class="swiper-slide"><a href="#;"><img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${prodInfo.recom_10_img}"/>&fileSn=0" style="width: 100%;" onerror="this.src='/images/baseScmtour/_noImage.png';"/></a></li>
							</c:if>
							<c:if test="${not empty prodInfo.recom_10_2_img }">
							<li class="swiper-slide"><a href="#;"><img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${prodInfo.recom_10_2_img}"/>&fileSn=0" style="width: 100%;" onerror="this.src='/images/baseScmtour/_noImage.png';"/></a></li>
							</c:if>
							<c:if test="${not empty prodInfo.recom_10_3_img }">
							<li class="swiper-slide"><a href="#;"><img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${prodInfo.recom_10_3_img}"/>&fileSn=0" style="width: 100%;" onerror="this.src='/images/baseScmtour/_noImage.png';"/></a></li>
							</c:if>
							<c:if test="${not empty prodInfo.recom_10_4_img }">
							<li class="swiper-slide"><a href="#;"><img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${prodInfo.recom_10_4_img}"/>&fileSn=0" style="width: 100%;" onerror="this.src='/images/baseScmtour/_noImage.png';"/></a></li>
							</c:if>
							<c:if test="${not empty prodInfo.recom_10_5_img }">
							<li class="swiper-slide"><a href="#;"><img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${prodInfo.recom_10_5_img}"/>&fileSn=0" style="width: 100%;" onerror="this.src='/images/baseScmtour/_noImage.png';"/></a></li>
							</c:if>
							<c:if test="${not empty prodInfo.recom_10_6_img }">
							<li class="swiper-slide"><a href="#;"><img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${prodInfo.recom_10_6_img}"/>&fileSn=0" style="width: 100%;" onerror="this.src='/images/baseScmtour/_noImage.png';"/></a></li>
							</c:if>
							<c:if test="${not empty prodInfo.recom_10_7_img }">
							<li class="swiper-slide"><a href="#;"><img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${prodInfo.recom_10_7_img}"/>&fileSn=0" style="width: 100%;" onerror="this.src='/images/baseScmtour/_noImage.png';"/></a></li>
							</c:if>
							<c:if test="${not empty prodInfo.recom_10_8_img }">
							<li class="swiper-slide"><a href="#;"><img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${prodInfo.recom_10_8_img}"/>&fileSn=0" style="width: 100%;" onerror="this.src='/images/baseScmtour/_noImage.png';"/></a></li>
							</c:if>
							<c:if test="${not empty prodInfo.recom_10_9_img }">
							<li class="swiper-slide"><a href="#;"><img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${prodInfo.recom_10_9_img}"/>&fileSn=0" style="width: 100%;" onerror="this.src='/images/baseScmtour/_noImage.png';"/></a></li>
							</c:if>
							<c:if test="${not empty prodInfo.recom_10_10_img }">
							<li class="swiper-slide"><a href="#;"><img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${prodInfo.recom_10_10_img}"/>&fileSn=0" style="width: 100%;" onerror="this.src='/images/baseScmtour/_noImage.png';"/></a></li>
							</c:if>
						</ul>
						<script>
							// 메인 슬라이드
							var swiper10 = new Swiper('.rrcdslide10', {
								slidesPerView: 'auto',
								spaceBetween: 5,
							});
						</script>
					</div>
				</div>
				</c:if>
			</div>
		</article>
		<!-- } 코스 상세 설명 -->

		<c:import url="commonItemReview.jsp"/>
		
	</section>
	<!-- } 추천여행상품 뷰 -->

</c:if>

<c:if test="${store_category eq 'CD002004' }">
<c:import url="commonNav.jsp"/>
</c:if>
<c:import url="commonItemModal.jsp"/>
<c:import url="/Api/IncludeBottom.do"/>

<!-- 상세페이지 지도보기 { -->
<div id="festFullMap">
	<h1 class="bgOrangeGra">
		<em><c:out value="${storeInfo.store_nm}"/> 주변</em>
		<a href="#;" class="fullmapbtn"><i class="fal fa-times"></i></a>
	</h1>
	<div class="maparea" id="maparea" >
	</div>
</div>
<!-- } 상세페이지 지도보기 -->
<script>
$(document).ready(function() {
	$("a.fullmapbtn").click(function() {
		if ($('#festFullMap').css('display') == "none") {
			$("#festFullMap").addClass('open');
			createkakaomap("<c:out value="${storeInfo.store_lat}"/>","<c:out value="${storeInfo.store_lng}"/>")
		} else {
			$("#festFullMap").removeClass('open');
		}
	});
});
</script>



