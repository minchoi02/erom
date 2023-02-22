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

	<!-- 뷰페이지 { -->
	<section id="travelView" class="productview">
		
		<c:import url="commonItemInfomation.jsp"/>

		<!-- 기본정보 { -->
		<article id="viewBasicInfo">
		<c:choose>
			<c:when test="${store_category eq 'CD002001' }">
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
				<div class="jjimbox"><a href="#;" class="jjimbtn  <c:if test="${isProdFav eq 'Y' }">active</c:if>" onclick="<c:out value="${func_pick}"/>"><span><i class="fal fa-plus"></i></span> 찜하기</a></div>
			</div>
			</c:when>
			<c:when test="${store_category eq 'CD002002' }">
			<div class="subject_price">
				<h2 class="viewh2"><c:out value="${prodInfo.prod_nm }"/></h2>
				<div class="addr"><c:out value="${storeInfo.store_addr_1}"/> <c:out value="${storeInfo.store_addr_2 }"/></div>
				<div class="jjimbox"><a href="#;" class="jjimbtn  <c:if test="${isProdFav eq 'Y' }">active</c:if>" onclick="<c:out value="${func_pick}"/>"><span><i class="fal fa-plus"></i></span> 찜하기</a></div>
			</div>
			</c:when>
			<c:when test="${store_category eq 'CD002003' }">
			<div class="subject_price">
				<h2 class="viewh2"><c:out value="${prodInfo.prod_nm }"/></h2>
				<div class="addr"><c:out value="${storeInfo.store_addr_1}"/> <c:out value="${storeInfo.store_addr_2 }"/></div>
				<div class="jjimbox"><a href="#;" class="jjimbtn  <c:if test="${isProdFav eq 'Y' }">active</c:if>" onclick="<c:out value="${func_pick}"/>"><span><i class="fal fa-plus"></i></span> 찜하기</a></div>
			</div>
			</c:when>
			<c:when test="${store_category eq 'CD002004' }">
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
			</c:when>
		</c:choose>
		</article>
		<!-- } 기본정보 -->

		<c:import url="commonItemReview.jsp"/>
		
	</section>
	<!-- }  뷰페이지 -->

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
<c:import url="commonNav.jsp"/>
</c:if>
<c:import url="commonItemModal.jsp"/>
<c:import url="/Api/IncludeBottom.do?lat=${storeInfo.store_lat}&lng=${storeInfo.store_lng }"/>