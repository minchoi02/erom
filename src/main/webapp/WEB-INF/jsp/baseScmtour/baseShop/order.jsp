<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="doURI" value="${requestScope['javax.servlet.forward.servlet_path']}" /> 
<c:set var="qsURI" value="${pageContext.request.queryString}" /> 
<c:set var="URI" value="${doURI }"/>
<c:if test="${not empty qsURI}">
	<c:set var="URI" value="${doURI }?${qsURI }"/>
</c:if>

<c:import url="/Api/IncludeTop.do"/>

<c:if test="${empty user_id }">
<script>
$(window).bind("pageshow", function (event) {
getLogin('<c:out value="${URI }"/>');
});
</script>
</c:if>

<input type="hidden" id="store_id" value="<c:out value="${prodInfo.store_id }"/>" />
<input type="hidden" id="store_nm" value="<c:out value="${prodInfo.store_nm }"/>" />
<input type="hidden" id="prod_nm" value="<c:out value="${prodInfo.prod_nm }"/>" />

<%-- 여행 --%>
<c:if test="${store_category eq 'CD002001' }">
	<c:set var="infoName" value="관광지정보" />
	<c:set var="prod_price" value="${prodInfo.prod_price}" />
</c:if>

<%-- 숙박 --%>
<c:if test="${store_category eq 'CD002002' }">
	<c:set var="infoName" value="관광지정보" />
	
	<c:if test="${empty prod_room_seq}">
	<script>alert("필수값이 없습니다(0)."); location.href="/shop/itemView.do?store_category=<c:out value="${store_category}"/>&prod_id=<c:out value="${prodInfo.prod_id}"/>";</script>
	</c:if>
	<c:if test="${empty reserve_st_dt}">
	<script>alert("필수값이 없습니다(1)."); location.href="/shop/itemView.do?store_category=<c:out value="${store_category}"/>&prod_id=<c:out value="${prodInfo.prod_id}"/>";</script>
	</c:if>
	<c:if test="${empty reserve_ed_dt}">
	<script>alert("필수값이 없습니다(2)."); location.href="/shop/itemView.do?store_category=<c:out value="${store_category}"/>&prod_id=<c:out value="${prodInfo.prod_id}"/>";</script>
	</c:if>

	<c:set var="prod_price_n_n" value="${roomInfo.prod_room_normal_normal_sale_price * normal_normal }"/>
	<c:set var="prod_price_n_h" value="${roomInfo.prod_room_normal_holiday_sale_price * normal_holiday }"/>
	<c:set var="prod_price_r_n" value="${roomInfo.prod_room_ready_normal_sale_price * ready_normal }"/>
	<c:set var="prod_price_r_h" value="${roomInfo.prod_room_ready_holiday_sale_price * ready_holiday }"/>
	<c:set var="prod_price_r2_n" value="${roomInfo.prod_room_ready2_normal_sale_price * ready2_normal }"/>
	<c:set var="prod_price_r2_h" value="${roomInfo.prod_room_ready2_holiday_sale_price * ready2_holiday }"/>
	<c:set var="prod_price_b_n" value="${roomInfo.prod_room_busy_normal_sale_price * busy_normal }"/>
	<c:set var="prod_price_b_h" value="${roomInfo.prod_room_busy_holiday_sale_price * busy_holiday }"/>
	<c:set var="prod_price" value="${prod_price_n_n + prod_price_n_h + prod_price_r_n + prod_price_r_h + prod_price_r2_n + prod_price_r2_h + prod_price_b_n + prod_price_b_h}" />
	
</c:if>

<%-- 맛집 --%>
<c:if test="${store_category eq 'CD002003' }">
	<c:set var="infoName" value="음식점정보" />
	<c:set var="prod_price" value="${prodInfo.prod_price}" />
</c:if>

<%-- 장터 --%>
<c:if test="${store_category eq 'CD002004' }">
	<c:set var="infoName" value="판매자상품" />
	<c:set var="prod_price" value="${prodINfo.prod_price}" />
	<script>alet('해당카테고리는 지원하지 않습니다.'); history.back();</script>
</c:if>

<%-- 추천여행 --%>
<c:if test="${store_category eq 'CD002005' }">
	<c:set var="infoName" value="" />
	<c:set var="prod_price" value="0" />
	<script>alet('해당카테고리는 지원하지 않습니다.'); history.back();</script>
</c:if>


<form actrion="" id="orderForm" name="orderForm" onsubmit="return orderFormCheck(); ">
<input type="hidden" id="store_category" name="store_category" value="<c:out value="${store_category }"/>" />
<input type="hidden" id="prod_category" name="prod_category" value="<c:out value="${prod_category }"/>" />
<input type="hidden" id="prod_id" name="prod_id" value="<c:out value="${prod_id }"/>" />
<input type="hidden" id="prod_price" name="prod_price" value="<c:out value="${prod_price }"/>" />

<input type="hidden" id="opt_seq" name="opt_seq" value="" />
<input type="hidden" id="opt_nm" name="opt_nm" value="" />
<input type="hidden" id="opt_price" name="opt_price" value="" />
<input type="hidden" id="opt_cnt" name="opt_cnt" value="" />


<%-- 여행 --%>
<c:if test="${store_category eq 'CD002001' }">
	<!-- 관광/체험 구매하기 { -->
	<section id="order">
		<div class="backarea"><a href="/shop/itemView.do?store_category=<c:out value="${store_category}"/><c:if test="${store_category eq 'CD002004' }">&prod_category=<c:out value="${prod_category}"/></c:if>&prod_id=<c:out value="${prod_id }"/>" class="backbtn"><i class="fal fa-arrow-left"></i><span class="sound_only">뒤로가기</span></a></div>

		<h1><em>예약하기</em></h1>

		<!-- 구매 상품 정보 { -->
		<article id="orderProduct">
			<div class="op_list">
				<em class="pic"><img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${prodInfo.prod_img_1}"/>&fileSn=0" onerror="this.src='/images/baseScmtour/noimg_615.png';"/></em>
				<em class="txt w100">
					<span class="subject"><c:out value="${prodInfo.prod_nm }"/></span>
					<span class="subcon">
						<c:out value="${prod_comment }" escapeXml="false"/>
					</span>
				</em>
			</div>
		</article>
		<%-- 빈값 undefined 방지 { --%>
		<input type="hidden" id="prod_room_seq" name="prod_room_seq" value="" />
		<input type="hidden" id="opt_add_adult" name="opt_add_adult" value="0" />
		<input type="hidden" id="opt_add_child" name="opt_add_child" value="0" />
		<%-- } 빈값 undefined 방지 --%>
		<!-- } 구매 상품 정보 -->
		
	<!-- } 관광/체험 구매하기 -->

</c:if>

<%-- 숙박 --%>
<c:if test="${store_category eq 'CD002002' }">
	<!-- 숙박 구매하기 { -->
	<section id="order">
		<div class="backarea"><a href="javascript:history.back();" class="backbtn"><i class="fal fa-arrow-left"></i><span class="sound_only">뒤로가기</span></a></div>

		<h1><em>예약하기</em></h1>

		<!-- 구매 상품 정보 { -->
		<article id="orderProduct">
			<div class="op_list">
				<em class="pic"><img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${roomInfo.prod_room_img_1}"/>&fileSn=0" onerror="this.src='/images/baseScmtour/noimg_615.png';"/></em>
				<em class="txt w100">
					<span class="subject"><c:out value="${prodInfo.prod_nm }"/></span>
					<span class="roomnum"><c:out value="${roomInfo.prod_room_nm }"/> / <c:out value="${sleepDt}"/>박</span>
					<span class="checkinout">
						입실 : <span id="st_dt">-</span><br />
						퇴실 : <span id="ed_dt">-</span>
					</span>
				</em>
			</div>
		</article>
		<input type="hidden" id="prod_room_seq" value="<c:out value="${roomInfo.prod_room_seq}"/>" />
		
		<!-- } 구매 상품 정보 -->
	
</c:if>

<%-- 맛집 --%>
<c:if test="${store_category eq 'CD002003' }">
	<!-- 맛집 예약하기 { -->
	<section id="order">
		<div class="backarea"><a href="javascript:history.back();" class="backbtn"><i class="fal fa-arrow-left"></i><span class="sound_only">뒤로가기</span></a></div>

		<h1><em>예약하기</em></h1>

		<!-- 구매 상품 정보 { -->
		<article id="orderProduct">
			<div class="op_list">
				<em class="pic"><img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${prodInfo.prod_img_1}"/>&fileSn=0" onerror="this.src='/images/baseScmtour/noimg_615.png';"/></em>
				<em class="txt w100">
					<span class="subject"><c:out value="${prodInfo.prod_nm }"/></span>
					<span class="subcon">
						<c:out value="${prod_comment }" escapeXml="false"/>
					</span>
				</em>
			</div>
		</article>
		<input type="hidden" id="prod_room_seq" name="prod_room_seq" value="" />
		<!-- } 구매 상품 정보 -->
		

</c:if>

<%-- 장터 --%>
<c:if test="${store_category eq 'CD002004' }">
<%--
	<!-- 서천장터 구매하기 { -->
	<section id="order">
		<div class="backarea"><a href="javascript:history.back();" class="backbtn"><i class="fal fa-arrow-left"></i><span class="sound_only">뒤로가기</span></a></div>

		<h1><em>구매하기</em></h1>

		<!-- 구매 상품 정보 { -->
		<article id="orderProduct">
			<div class="op_list">
				<em class="pic"><img src="/images/baseScmtour/sample_product1.jpg" alt="" /></em>
				<em class="txt w100">
					<span class="subject">백제향한산소곡주</span>
					<span class="marketcon">
						백제향한산소곡주 700ml x 2 : <strong>98,000</strong><small>원</small><br />
						백제향한산소곡주 1,200ml x 1 : <strong>65,000</strong><small>원</small>
					</span>
				</em>
			</div>
		</article>
		<!-- } 구매 상품 정보 -->
		
		<article id="orderInfo" class="order_info">
			<!-- 배송 정보 { -->
			<div class="order_info_con order_member">
				<h2>구매자 정보 <div class="rightbox"><input type="checkbox" id="oldmem" name="oldmem" class="basic_check" /><label for="oldmem"><span></span>회원정보 가져오기</label></div></h2>
				<div class="con">
					<table class="option_tbl">
						<colgroup>
							<col style="width:70px" />
							<col />
						</colgroup>
						<tbody>
							<tr>
								<th>수령인</th>
								<td><input type="text" class="order_input w100" /></td>
							</tr>
							<tr>
								<th>연락처</th>
								<td><input type="tel" class="order_input w100 phoneNumber" /></td>
							</tr>
							<tr>
								<th>연락처2</th>
								<td><input type="tel" class="order_input w100 phoneNumber" /></td>
							</tr>
							<tr>
								<th rowspan="3">주소</th>
								<td><input type="text" class="order_input w100px readonly" readonly placeholder="우편번호" /><a href="#;" class="btns graybtn mgl5px">우편번호찾기</a></td>
							</tr>
							<tr>
								<td><input type="text" class="order_input w100 readonly" readonly placeholder="기본주소" /></td>
							</tr>
							<tr>
								<td><input type="text" class="order_input w100" placeholder="상세주소" /></td>
							</tr>
							<tr>
								<th>배송요청</th>
								<td>
									<select class="order_select w100">
										<option>부재시 경비실에 맡겨주세요.</option>
									</select>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			<!-- } 배송 정보 -->
 --%>
</c:if>

<%-- 추천여행 --%>
<c:if test="${store_category eq 'CD002005' }">
	<c:set var="infoName" value="" />
</c:if>

<%--------------------------------------------------------------------------------------------%>
<%------------------------------------ 공통영역  -------------------------------------------------%>
<%--------------------------------------------------------------------------------------------%>
<c:choose>
	<c:when test="${store_category eq 'CD002001' }">
		<c:set var="order_opt_title" value="구매인원"/>
		<c:set var="order_unit" value="명"/>
	</c:when>
	<c:when test="${store_category eq 'CD002002' }">
		<c:set var="order_opt_title" value="숙박옵션"/>
		<c:set var="order_unit" value="개"/>
	</c:when>
	<c:when test="${store_category eq 'CD002003' }">
		<c:set var="order_opt_title" value="예약메뉴"/>
		<c:set var="order_unit" value="개"/>
	</c:when>
	<c:when test="${store_category eq 'CD002004' }"></c:when>
	<c:when test="${store_category eq 'CD002005' }"></c:when>
</c:choose>	
		<article id="orderInfo" class="order_info">
			<!-- 예약날짜 { -->
		<c:choose>
			<c:when test="${store_category eq 'CD002001' }">
			<div class="order_info_con reservation_date">
				<h2>예약날짜</h2>
				<div class="con">
					<input type="text" id="reserve_st_dt" name="reserve_st_dt" class="order_input w150px readonly " readonly value="" onchange="reserve_date_view();" placeholder="날짜를 선택하세요."/> 
				</div>
				<script>
				setdatepicker('reserve_st_dt', '+2', '+<c:out value="${prodInfo.prod_reserve_limit}"/>');
				</script>
			</div>
			</c:when>
			<c:when test="${store_category eq 'CD002002' }">
			<input type="hidden" id="reserve_st_dt" name="reserve_st_dt" value="${reserve_st_dt }" />
			<input type="hidden" id="reserve_ed_dt" name="reserve_ed_dt" value="${reserve_ed_dt }" /> 
			</c:when>
			<c:when test="${store_category eq 'CD002003' }">
			<div class="order_info_con reservation_date">
				<h2>예약일시</h2>
				<div class="con">
					<ul class="nopm">
					<li>
						<input type="text" id="reserve_st_dt" name="reserve_st_dt" class="order_input w150px readonly " readonly value="" onchange="reserve_date_view();" placeholder="날짜를 선택하세요."/> 
					</li>
					<li>
						<select class="order_select w100" id="reserve_time" name="reserve_time" onchange="reserve_date_view()">
							<option value="">예약시간을 선택해주세요</option>
							<c:forEach items="${fn:split(storeInfo.store_food_reserve_time, ',') }" var="reserve_time">
							    <c:if test="${not empty reserve_time }">
							    <option value="<c:out value="${reserve_time}"/>"><c:out value="${fn:replace(reserve_time,':', '시 ')}"/>분</option>
							    </c:if>
							</c:forEach>

						</select>
					</li>
				</ul>
				</div>
				<script>
				setdatepicker('reserve_st_dt', '+2', '+<c:out value="${prodInfo.prod_reserve_limit}"/>');
				</script>
			</div>
			</c:when>
		</c:choose>
			<!-- } 예약날짜 -->
			
		<c:choose>
			<c:when test="${store_category eq 'CD002002' }">
			<input type="hidden" id="sleepdt" value="<c:out value="${sleepDt }"/>" />
			<input type="hidden" id="sleepdt_normal_noraml" value="<c:out value="${normal_normal }"/>" />
			<input type="hidden" id="sleepdt_normal_holiday" value="<c:out value="${normal_holiday }"/>" />
			<input type="hidden" id="sleepdt_ready_noraml" value="<c:out value="${ready_normal }"/>" />
			<input type="hidden" id="sleepdt_ready_holiday" value="<c:out value="${ready_holiday }"/>" />
			<input type="hidden" id="sleepdt_ready2_noraml" value="<c:out value="${ready2_normal }"/>" />
			<input type="hidden" id="sleepdt_ready2_holiday" value="<c:out value="${ready2_holiday }"/>" />
			<input type="hidden" id="sleepdt_busy_noraml" value="<c:out value="${busy_normal }"/>" />
			<input type="hidden" id="sleepdt_busy_holiday" value="<c:out value="${busy_holiday }"/>" />
			<div class="order_info_con option_choice">
				<h2>객실가격 (<c:out value="${roomInfo.prod_room_default_cnt }"/>명 기준)</h2>
				<div class="con">
					<table class="option_tbl">
						<colgroup>
							<col />
							<col style="width:150px" />
						</colgroup>
						<tbody>
							<tr>
								<th>준성수기</th>
								<td class="alignRight">
									<c:out value="${storeInfo.store_house_ready_date_st_dt}"/> ~ <c:out value="${storeInfo.store_house_ready_date_ed_dt}"/>  
								</td>
							</tr>
							<tr>
								<th>성수기</th>
								<td class="alignRight">
									<c:out value="${storeInfo.store_house_busy_date_st_dt}"/> ~ <c:out value="${storeInfo.store_house_busy_date_ed_dt}"/>  
								</td>
							</tr>
							<c:if test="${not empty storeInfo.store_house_ready2_date_st_dt && not empty storeInfo.store_house_ready2_date_ed_dt}">
							<tr>
								<th>성수기(성수기 후)</th>
								<td class="alignRight">
									<c:out value="${storeInfo.store_house_ready2_date_st_dt}"/> ~ <c:out value="${storeInfo.store_house_ready2_date_ed_dt}"/>  
								</td>
							</tr>
							</c:if>
						</tbody>
					</table>
					<table class="option_tbl mgt20px">
						<colgroup>
							<col />
							<col style="width:150px" />
						</colgroup>
						<tbody>
							<tr>
								<th>비수기  - 1일(평일/주말)</th>
								<td class="alignRight">
									<fmt:formatNumber value="${roomInfo.prod_room_normal_normal_sale_price }" type="number"/> 원 / <fmt:formatNumber value="${roomInfo.prod_room_normal_holiday_sale_price }" type="number"/> 원  
								</td>
							</tr>
							<tr>
								<th>준성수기 - 1일(평일/주말)</th>
								<td class="alignRight">
									<fmt:formatNumber value="${roomInfo.prod_room_ready_normal_sale_price }" type="number"/> 원 / <fmt:formatNumber value="${roomInfo.prod_room_ready_holiday_sale_price }" type="number"/> 원 
								</td>
							</tr>
							<tr>
								<th>성수기 - 1일(평일/주말)</th>
								<td class="alignRight">
									<fmt:formatNumber value="${roomInfo.prod_room_busy_normal_sale_price }" type="number"/> 원 / <fmt:formatNumber value="${roomInfo.prod_room_busy_holiday_sale_price }" type="number"/> 원
								</td>
							</tr>
							<c:if test="${not empty roomInfo.prod_room_ready2_normal_sale_price && not empty roomInfo.prod_room_ready2_holiday_sale_price}">
							<tr>
								<th>준성수기(성수기 후) - 1일(평일/주말)</th>
								<td class="alignRight">
									<fmt:formatNumber value="${roomInfo.prod_room_ready2_normal_sale_price }" type="number"/> 원 / <fmt:formatNumber value="${roomInfo.prod_room_ready2_holiday_sale_price }" type="number"/> 원 
								</td>
							</tr>
							</c:if>
						</tbody>
					</table>
				</div>
			</div>
			</c:when>
			<c:otherwise>
			<c:if test="${roomInfo.prod_price > 0}">
			<div class="order_info_con option_choice">
				<h2>기본가격</h2>
				<div class="con">
					<table class="option_tbl">
						<colgroup>
							<col />
							<col style="width:80px" />
						</colgroup>
						<tbody>
							<tr>
								<th>기본가격</th>
								<td class="alignRight">
									<fmt:formatNumber value="${prod_price }" type="number"/> 원
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			</c:if>
			</c:otherwise>
		</c:choose>
			
			
			<!-- 숙박 옵션 { -->
			<c:if test="${store_category eq 'CD002002' }">
			<input type="hidden" id="def_human" value="<c:out value="${roomInfo.prod_room_default_cnt }"/>"/>
			<input type="hidden" id="max_human" value="<c:out value="${roomInfo.prod_room_max_cnt }"/>"/>
			<c:set var="spare_human" value="${roomInfo.prod_room_max_cnt - roomInfo.prod_room_default_cnt }"/>
			<input type="hidden" id="spare_human" value="<c:out value="${spare_human }"/>" />
			<div class="order_info_con option_choice">
				<h2>숙박 옵션</h2>
				<div class="con">
					<table class="option_tbl">
						<colgroup>
							<col />
							<col style="width:80px" />
							<col style="width:80px" />
						</colgroup>
						<tbody>
						<input type="hidden" id="opt_adult_order_price" name="opt_adult_order_price" value="0" />
						<input type="hidden" id="opt_young_order_price" name="opt_young_order_price" value="0" />
						<c:choose>
							<c:when test="${spare_human > 0}">
								<tr>
									<input type="hidden" id="opt_adult_price" name="opt_adult_price" value="${roomInfo.prod_room_adult_price}" />
									<th>인원추가 - 성인 <small class="price">(<fmt:formatNumber value="${roomInfo.prod_room_adult_price}" type="number"/>원)</small></th>
									<td class="alignRight" colspan="2" >
										<select class="order_select w150px" id="opt_add_adult" name="opt_add_adult" onchange="opt_control('adult');">
											<option value="0">성인추가</option>
											<c:forEach var="i" begin="1" end="${spare_human }">
											<option value="<c:out value="${i }"/>"><c:out value="${i }"/> 명</option>
											</c:forEach>
										</select>
									</td>
								</tr>
								<tr>
									<input type="hidden" id="opt_young_price" name="opt_young_price" value="${roomInfo.prod_room_young_price}" />
									<th>인원추가 - 아동 <small class="price">(<fmt:formatNumber value="${roomInfo.prod_room_young_price}" type="number"/>원)</small></th>
									<td class="alignRight" colspan="2" >
										<select class="order_select w150px" id="opt_add_young" name="opt_add_young" onchange="opt_control('young');">
											<option value="0">아동추가</option>
											<c:forEach var="i" begin="1" end="${spare_human }">
											<option value="<c:out value="${i }"/>"><c:out value="${i }"/> 명</option>
											</c:forEach>
										</select>
									</td>
								</tr>
							</c:when>
							<c:otherwise>
								<input type="hidden" id="opt_add_adult" name="opt_add_adult" value="0" />
								<input type="hidden" id="opt_add_young" name="opt_add_young" value="0" />
							</c:otherwise>
						</c:choose>
							
							<c:set var="i" value="0"/>
							<c:forEach var="optList" items="${optList}" varStatus="status">
							<input type="hidden" id="opt_seq_<c:out value="${optList.opt_seq }"/>" class="order_seq" value="<c:out value="${optList.opt_seq }"/>" /> 
							<input type="hidden" id="opt_nm_<c:out value="${optList.opt_seq}"/>" class="order_nm" value="<c:out value="${optList.opt_nm }"/>" /> 
							<input type="hidden" id="opt_price_<c:out value="${optList.opt_seq}"/>" class="order_price" value="<c:out value="${optList.opt_price }"/>" /> 
							<input type="hidden" id="opt_order_price_<c:out value="${optList.opt_seq}"/>" class="order_order_price" value="0" /> 
							<tr>
								<th><c:out value="${optList.opt_nm }"/> <small class="price">(<fmt:formatNumber value="${optList.opt_price}" type="number"/>원)</small></th>
								<td><input type="text" id="order_cnt_<c:out value="${optList.opt_seq }"/>" name="order_cnt" class="order_input w50px alignRight readonly order_cnt" value="0" readonly /> <c:out value="${order_unit }"/></td>
								<td class="plusminus alignRight">
									<a href="javascript:plus_cnt('<c:out value="${optList.opt_seq }"/>'); " class="btns w30px"><i class="fal fa-plus"></i></a>
									<a href="javascript:minus_cnt('<c:out value="${optList.opt_seq }"/>'); " class="btns w30px"><i class="fal fa-minus"></i></a>
								</td>
							</tr>
							<c:set var="i" value="${i+1 }"/>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
			</c:if>
			
			<c:if test="${store_category ne 'CD002002' }">
			<div class="order_info_con option_choice">
				<h2><c:out value="${order_opt_title}"/></h2>
				<div class="con">
					<table class="option_tbl">
						<colgroup>
							<col />
							<col style="width:80px" />
							<col style="width:80px" />
						</colgroup>
						<tbody>
							<c:set var="i" value="0"/>
							<c:forEach var="optList" items="${optList}" varStatus="status">
							<input type="hidden" id="opt_seq_<c:out value="${optList.opt_seq }"/>" class="order_seq" value="<c:out value="${optList.opt_seq }"/>" /> 
							<input type="hidden" id="opt_nm_<c:out value="${optList.opt_seq}"/>" class="order_nm" value="<c:out value="${optList.opt_nm }"/>" /> 
							<input type="hidden" id="opt_price_<c:out value="${optList.opt_seq}"/>" class="order_price" value="<c:out value="${optList.opt_price }"/>" /> 
							<input type="hidden" id="opt_order_price_<c:out value="${optList.opt_seq}"/>" class="order_order_price" value="0" /> 
							<tr>
								<th><c:out value="${optList.opt_nm }"/> <small class="price">(<fmt:formatNumber value="${optList.opt_price}" type="number"/>원)</small></th>
								<td><input type="text" id="order_cnt_<c:out value="${optList.opt_seq }"/>" name="order_cnt" class="order_input w50px alignRight readonly order_cnt" value="0" readonly /> <c:out value="${order_unit }"/></td>
								<td class="plusminus alignRight">
									<a href="javascript:plus_cnt('<c:out value="${optList.opt_seq }"/>'); display_set_type1(); " class="btns w30px"><i class="fal fa-plus"></i></a>
									<a href="javascript:minus_cnt('<c:out value="${optList.opt_seq }"/>'); display_set_type1();" class="btns w30px"><i class="fal fa-minus"></i></a>
								</td>
							</tr>
							<c:set var="i" value="${i+1 }"/>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
			</c:if>
			<input type="hidden" id="opt_total_sum_price" name="opt_total_sum_price" value="<c:out value="${prod_price }"/>" />	
		</article>
		
		<article id="orderWriter" class="order_info">
			<!-- 구매자 정보 { -->
			<div class="order_info_con order_member">
				<h2>예약자 정보</h2>
				<div class="con">
					<table class="option_tbl">
						<colgroup>
							<col style="width:70px" />
							<col />
						</colgroup>
						<tbody>
							<tr>
								<input type="hidden" id="reserve_user_id" name="reserve_user_id" value="${user_id}"/>
								<th>예약자</th>
								<td><input type="text" id="reserve_user_name" name="reserve_user_name" class="order_input w100" value="${user_nm}"/></td>
							</tr>
							<tr>
								<th>연락처</th>
								<td><input type="tel" id="reserve_user_call" name="reserve_user_call" class="order_input w100 phoneNumber" value="${user_hp }" /></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			<!-- } 구매자 정보 -->

		</article>

		<!-- 주문정보 { -->
		<c:choose>
			<c:when test="${not empty prodInfo.prod_min_price && prodInfo.prod_min_price > 0 }">
				<c:set var="min_price" value="${prodInfo.prod_min_price}"/>
			</c:when>
			<c:otherwise>
				<c:set var="min_price" value="0"/>
			</c:otherwise>
		</c:choose>
		<input type="hidden" id="prod_min_price" value="${min_price }"/>
		<article id="orderPrice" class="order_info">
			<h2>주문정보</h2>
			<table class="order_tbl">
				<colgroup>
					<col />
					<col />
				</colgroup>
				<tbody>
				<c:choose>
					<c:when test="${store_category eq 'CD002001' }">
					<tr>
						<th><span class="btns h24px whitebtn">예약일</span></th>
						<td class="alignRight" id="display_reserve_date">-</td>
					</tr>
					<c:if test="${prod_price > 0 }">
					<tr>
						<th><span class="btns h24px whitebtn">기본금액</span></th>
						<td class="alignRight" id="display_reserve_def_data">0 원</td>
					</tr>
					</c:if>
					<tr>
						<th><span class="btns h24px whitebtn">구매인원</span></th>
						<td class="alignRight" id="display_reserve_data">-</td>
					</tr>
					<c:if test="${min_price > 0}">
					<tr>
						<th><span class="btns h24px whitebtn">최수주문금액</span></th>
						<td class="alignRight" id="display_reserve_data"><fmt:formatNumber value="${prodInfo.prod_min_price }" type="number"/> 원</td>
					</tr>
					</c:if>
					</c:when>
					<c:when test="${store_category eq 'CD002002' }">
					<tr>
						<th><span class="btns h24px whitebtn">예약일</span></th>
						<td class="alignRight" id="display_reserve_date">-</td>
					</tr>
					<tr>
						<th><span class="btns h24px whitebtn">기본금액</span></th>
						<td class="alignRight" id="display_reserve_def_data">0 원</td>
					</tr>
					<tr>
						<th><span class="btns h24px whitebtn">숙박옵션</span></th>
						<td class="alignRight" id="display_reserve_data">-</td>
					</tr>
					</c:when>
					<c:when test="${store_category eq 'CD002003' }">
					<tr>
						<th><span class="btns h24px whitebtn">예약일</span></th>
						<td class="alignRight" id="display_reserve_date">-</td>
					</tr>
					<tr>
						<th><span class="btns h24px whitebtn">구매메뉴</span></th>
						<td class="alignRight" id="display_reserve_data">-</td>
					</tr>
					<c:if test="${min_price > 0}">
					<tr>
						<th><span class="btns h24px whitebtn">최수주문금액</span></th>
						<td class="alignRight" id="display_reserve_data"><fmt:formatNumber value="${prodInfo.prod_min_price }" type="number"/> 원</td>
					</tr>
					</c:if>
					</c:when>
				</c:choose>					
				</tbody>
				<tfoot>
					<tr>
						<th>총 금액</th>
						<td class="alignRight" id="display_total_price">
						<c:choose>
							<c:when test="${prod_price > 0 }"><fmt:formatNumber value="${prod_price }" type="number"/> </c:when>
							<c:otherwise>0 </c:otherwise>
						</c:choose>
						<small>원</small>
						</td>
					</tr>
				</tfoot>
			</table>
		</article>
		<!-- } 주문정보 -->
		<script>
			// 기본값 세팅 부분
			if($("#reserve_st_dt").val()) {
				var st_dt_arr = $("#reserve_st_dt").val().split("-");
				var new_st_dt_str = st_dt_arr[0]+"년 "+st_dt_arr[1]+"월 "+st_dt_arr[2]+"일"+"(<c:out value="${reserve_st_dt_str}"/>)";
				$("#st_dt").text(new_st_dt_str);
			}
			if($("#reserve_ed_dt").val()) {
				var ed_dt_arr = $("#reserve_ed_dt").val().split("-");
				var new_ed_dt_str = ed_dt_arr[0]+"년 "+ed_dt_arr[1]+"월 "+ed_dt_arr[2]+"일"+"(<c:out value="${reserve_ed_dt_str}"/>)";
				$("#ed_dt").text(new_ed_dt_str);
			}
			if(new_st_dt_str && new_ed_dt_str) {
				$("#display_reserve_date").html("입실: "+new_st_dt_str+"<br>퇴실: "+new_ed_dt_str);
			} else {
				$("#display_reserve_date").html("-");
			}
			$("#display_reserve_def_data").html(number_format('<c:out value="${prod_price}"/>')+' 원');
			$("#display_total_price").html(number_format('<c:out value="${prod_price}"/>')+' <small>원</small>');
		</script>
		
		<div class="btnArea alignCenter">
			<a href="javascript:cart_add('cart');" class="btns h50px w40">장바구니</a>
			<a href="javascript:cart_add('order');" class="btns h50px orangebtn w40">결제하기</a>
		</div>
	</section>

</form>

<c:import url="/Api/IncludeBottom.do"/>