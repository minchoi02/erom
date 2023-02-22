<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%--뷰페이지 상단 상품정보패이지 --%>
<% 
response.setHeader("pragma", "no-cache");              
response.setHeader("Cache-control", "no-cache, no-store, must-revalidate");             
response.setHeader("Expires", "0"); 

// url을 읽어와서 파일을 추출한다.
String fullUrl = request.getServletPath();
String checkUrl = fullUrl.replace("/WEB-INF/jsp/baseScmtour/","");
String[] url_arr = checkUrl.split("/");
String this_uri = url_arr[0].replace(".jsp","");
String left_uri = "";
if(url_arr.length > 1) { //서브디렉토리일때..  왼쪽 메뉴를 잡는다.
	left_uri = url_arr[1].replace(".jsp","");
}
%>
<c:set var="OrgFullUrl" value="<%= request.getRequestURL() %>" />
<c:set var="this_url" value="<%=this_uri%>" />
<c:set var="left_uri" value="<%=left_uri%>" />
<c:set var="prod_category_uri" value=""/>
<c:if test="${not empty prod_category }">
	<c:set var="prod_category_uri" value="&prod_category=${prod_category}" />
</c:if>

<%-- 여행 --%>
<c:if test="${store_category eq 'CD002001' }">
	<c:set var="infoName" value="체험지정보" />
</c:if>

<%-- 숙박 --%>
<c:if test="${store_category eq 'CD002002' }">
	<c:set var="infoName" value="숙박정보" />
</c:if>

<%-- 맛집 --%>
<c:if test="${store_category eq 'CD002003' }">
	<c:set var="infoName" value="음식점정보" />
</c:if>

<%-- 장터 --%>
<c:if test="${store_category eq 'CD002004' }">
	<c:set var="infoName" value="판매자상품" />
</c:if>

<%-- 추천여행 --%>
<c:if test="${store_category eq 'CD002005' }">
	<c:set var="infoName" value="" />
</c:if>

		<article id="viewSlide" class="swiper-container">
			<ul class="nopm swiper-wrapper">
				<c:if test="${not empty prodInfo.prod_img_1 }">
				<li class="swiper-slide"><img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${prodInfo.prod_img_1}"/>&fileSn=0" style="width: 100%;" onerror="this.src='/images/baseScmtour/_noImage.png';"/></li>
				</c:if>
				<c:if test="${not empty prodInfo.prod_img_2 }">
				<li class="swiper-slide"><img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${prodInfo.prod_img_2}"/>&fileSn=0" style="width: 100%;" onerror="this.src='/images/baseScmtour/_noImage.png';"/></li>
				</c:if>
				<c:if test="${not empty prodInfo.prod_img_3 }">
				<li class="swiper-slide"><img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${prodInfo.prod_img_3}"/>&fileSn=0" style="width: 100%;" onerror="this.src='/images/baseScmtour/_noImage.png';"/></li>
				</c:if>
				<c:if test="${not empty prodInfo.prod_img_4 }">
				<li class="swiper-slide"><img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${prodInfo.prod_img_4}"/>&fileSn=0" style="width: 100%;" onerror="this.src='/images/baseScmtour/_noImage.png';"/></li>
				</c:if>
				<c:if test="${not empty prodInfo.prod_img_5 }">
				<li class="swiper-slide"><img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${prodInfo.prod_img_5}"/>&fileSn=0" style="width: 100%;" onerror="this.src='/images/baseScmtour/_noImage.png';"/></li>
				</c:if>
				<c:if test="${not empty prodInfo.prod_img_6 }">
				<li class="swiper-slide"><img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${prodInfo.prod_img_6}"/>&fileSn=0" style="width: 100%;" onerror="this.src='/images/baseScmtour/_noImage.png';"/></li>
				</c:if>
				<c:if test="${not empty prodInfo.prod_img_7 }">
				<li class="swiper-slide"><img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${prodInfo.prod_img_7}"/>&fileSn=0" style="width: 100%;" onerror="this.src='/images/baseScmtour/_noImage.png';"/></li>
				</c:if>
				<c:if test="${not empty prodInfo.prod_img_8 }">
				<li class="swiper-slide"><img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${prodInfo.prod_img_8}"/>&fileSn=0" style="width: 100%;" onerror="this.src='/images/baseScmtour/_noImage.png';"/></li>
				</c:if>
				<c:if test="${not empty prodInfo.prod_img_9 }">
				<li class="swiper-slide"><img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${prodInfo.prod_img_9}"/>&fileSn=0" style="width: 100%;" onerror="this.src='/images/baseScmtour/_noImage.png';"/></li>
				</c:if>
				<c:if test="${not empty prodInfo.prod_img_10 }">
				<li class="swiper-slide"><img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${prodInfo.prod_img_10}"/>&fileSn=0" style="width: 100%;" onerror="this.src='/images/baseScmtour/_noImage.png';"/></li>
				</c:if>
			</ul>
			<div class="swiper-pagination"></div>
			<script>
				// 상단 슬라이드 이미지
				var swiper = new Swiper('#viewSlide', {
					slidesPerView: 'auto',
					centeredSlides: true,
					spaceBetween: 0,
					autoplay: {
						delay: 4000,
					},
					pagination: {
						el: '.swiper-pagination',
						dynamicBullets: true,
					},
				});
			</script>
		</article>
		<!-- } 상단 슬라이드 이미지 -->

		<!-- 상단 아이콘 정보 { -->
		<article id="viewTopIco">
			<ul class="nopm floats">
				<li><span class="icobox"><i class="fas fa-heart"></i></span> <small id="pick_cnt"><fmt:formatNumber value="${prodInfo.prod_pick_cnt}" type="number"/></small></li><input type="hidden" id="prod_pick_cnt" value="${prodInfo.prod_pick_cnt}" />
				<li><span class="icobox"><i class="far fa-comment-dots"></i></span> <small id="review_cnt"><fmt:formatNumber value="${prodInfo.prod_review_cnt}" type="number"/></small></li>
				<li><a href="#;" class="sharebtn"><span class="icobox"><i class="far fa-share-alt"></i></span></a></li>
				<c:choose>
					<c:when test="${not empty storeInfo.store_url }">
					<li><a href="<c:out value="${storeInfo.store_url }"/>" target="_blank"><span class="icobox"><i class="fas fa-home"></i></span></a></li>
					</c:when>
					<c:otherwise>
					<%--<a href="#;"><span class="icobox"><i class="far fa-home"></i></span></a> --%>
					</c:otherwise>
				</c:choose>
			</ul>
			<c:if test="${store_category ne 'CD002004' && store_category ne 'CD002002' }">
			<c:choose>
				<c:when test="${prodInfo.prod_use_pay_st eq'Y' }">
				<c:choose>
					<c:when test="${not empty user_id }">
					<a href="/shop/order.do?store_category=<c:out value="${store_category}"/>&prod_id=<c:out value="${prodInfo.prod_id }"/>" class="orderbtn bgOrangeGra"><i class="fal fa-credit-card"></i> 구매하기</a>
					</c:when>
					<c:otherwise>
					<a href="javascript:getLogin('/shop/order.do?store_category=<c:out value="${store_category}"/>&prod_id=<c:out value="${prodInfo.prod_id }"/>');" class="orderbtn bgOrangeGra"><i class="fal fa-credit-card"></i> 구매하기</a>
					</c:otherwise>
				</c:choose>
				</c:when>
				<c:otherwise>
				</c:otherwise>
			</c:choose>
			</c:if>
			
		</article>
		<!-- } 상단 아이콘 정보 -->

		<!-- 뷰페이지 탭 메뉴 { -->
		<article id="viewMnu">
			<a href="/shop/itemView.do?store_category=<c:out value="${store_category}"/><c:out value="${prod_category_uri }"/>&prod_id=<c:out value="${prodInfo.prod_id }"/>" <c:if test="${left_uri eq 'itemView' }">class="active"</c:if> >기본정보</a>
			<a href="/shop/itemReView.do?store_category=<c:out value="${store_category}"/><c:out value="${prod_category_uri }"/>&prod_id=<c:out value="${prodInfo.prod_id }"/>" <c:if test="${left_uri eq 'itemReView' }">class="active"</c:if>>리뷰 <small>(<fmt:formatNumber value="${prodInfo.prod_review_cnt}" type="number"/>)</small></a>
			<a href="/shop/itemQna.do?store_category=<c:out value="${store_category}"/><c:out value="${prod_category_uri }"/>&prod_id=<c:out value="${prodInfo.prod_id }"/>" <c:if test="${left_uri eq 'itemQnA' }">class="active"</c:if>>Q&A <small>(<fmt:formatNumber value="${prodInfo.prod_qna_cnt}" type="number"/>)</small></a>
			<a href="/shop/itemInfo.do?store_category=<c:out value="${store_category}"/><c:out value="${prod_category_uri }"/>&prod_id=<c:out value="${prodInfo.prod_id }"/>" <c:if test="${left_uri eq 'itemInfo' }">class="active"</c:if>><c:out value="${infoName }"/></a>
		</article>
		<!-- } 뷰페이지 탭 메뉴 -->
		
		