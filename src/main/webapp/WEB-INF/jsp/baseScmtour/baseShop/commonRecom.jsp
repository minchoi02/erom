<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

		<!-- 주변관광지 { -->
		<c:if test="${not empty prodInfo.prod_recom_1 || not empty prodInfo.prod_recom_2 || not empty prodInfo.prod_recom_3 || not empty prodInfo.prod_recom_4 || not empty prodInfo.prod_recom_5  || not empty prodInfo.prod_recom_6  || not empty prodInfo.prod_recom_7  || not empty prodInfo.prod_recom_8  || not empty prodInfo.prod_recom_9 || not empty prodInfo.prod_recom_10  }">
		<article id="touristSpot" class="bgs">
			<h2 class="mainTit"><em>추천 관광/체험</em></h2>
			<div class="main-product touristspot swiper-container">
				<ul class="nopm swiper-wrapper">
					<c:if test="${not empty prodInfo.prod_recom_1}">
					<li class="swiper-slide">
						<a href="/shop/itemView.do?store_category=<c:out value="${prodInfo.recom_1_store_category }"/>&prod_id=<c:out value="${prodInfo.prod_recom_1 }"/>" class="pic"><img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${prodInfo.recom_1_img}"/>&fileSn=0" style="width: 100%;" onerror="this.src='/images/baseScmtour/noimg_615.png';"/></a>
						<a href="/shop/itemView.do?store_category=<c:out value="${prodInfo.recom_1_store_category }"/>&prod_id=<c:out value="${prodInfo.prod_recom_1 }"/>" class="txt">
							<em class="subject"><c:out value="${prodInfo.recom_1_prod_nm}"/></em>
							<span class="loca"><c:out value="${prodInfo.recom_1_store_nm}"/></span>
							<span class="goodnum"><b class="colorOrange"><i class="fas fa-heart"></i></b> <fmt:formatNumber value="${prodInfo.recom_1_pick_cnt}" type="number"/></span>
						</a>
					</li>
					</c:if>
					<c:if test="${not empty prodInfo.prod_recom_2}">
					<li class="swiper-slide">
						<a href="/shop/itemView.do?store_category=<c:out value="${prodInfo.recom_2_store_category }"/>&prod_id=<c:out value="${prodInfo.prod_recom_2 }"/>" class="pic"><img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${prodInfo.recom_2_img}"/>&fileSn=0" style="width: 100%;" onerror="this.src='/images/baseScmtour/noimg_615.png';"/></a>
						<a href="/shop/itemView.do?store_category=<c:out value="${prodInfo.recom_2_store_category }"/>&prod_id=<c:out value="${prodInfo.prod_recom_2 }"/>" class="txt">
							<em class="subject"><c:out value="${prodInfo.recom_2_prod_nm}"/></em>
							<span class="loca"><c:out value="${prodInfo.recom_2_store_nm}"/></span>
							<span class="goodnum"><b class="colorOrange"><i class="fas fa-heart"></i></b> <fmt:formatNumber value="${recom_2.recom_2_pick_cnt}" type="number"/></span>
						</a>
					</li>
					</c:if>
					<c:if test="${not empty prodInfo.prod_recom_3}">
					<li class="swiper-slide">
						<a href="/shop/itemView.do?store_category=<c:out value="${prodInfo.recom_3_store_category }"/>&prod_id=<c:out value="${prodInfo.prod_recom_3 }"/>" class="pic"><img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${prodInfo.recom_3_img}"/>&fileSn=0" style="width: 100%;" onerror="this.src='/images/baseScmtour/noimg_615.png';"/></a>
						<a href="/shop/itemView.do?store_category=<c:out value="${prodInfo.recom_3_store_category }"/>&prod_id=<c:out value="${prodInfo.prod_recom_3 }"/>" class="txt">
							<em class="subject"><c:out value="${prodInfo.recom_3_prod_nm}"/></em>
							<span class="loca"><c:out value="${prodInfo.recom_3_store_nm}"/></span>
							<span class="goodnum"><b class="colorOrange"><i class="fas fa-heart"></i></b> <fmt:formatNumber value="${prodInfo.recom_3_pick_cnt}" type="number"/></span>
						</a>
					</li>
					</c:if>
					<c:if test="${not empty prodInfo.prod_recom_4}">
					<li class="swiper-slide">
						<a href="/shop/itemView.do?store_category=<c:out value="${prodInfo.recom_4_store_category }"/>&prod_id=<c:out value="${prodInfo.prod_recom_4 }"/>" class="pic"><img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${prodInfo.recom_4_img}"/>&fileSn=0" style="width: 100%;" onerror="this.src='/images/baseScmtour/noimg_615.png';"/></a>
						<a href="/shop/itemView.do?store_category=<c:out value="${prodInfo.recom_4_store_category }"/>&prod_id=<c:out value="${prodInfo.prod_recom_4 }"/>" class="txt">
							<em class="subject"><c:out value="${prodInfo.recom_4_prod_nm}"/></em>
							<span class="loca"><c:out value="${prodInfo.recom_4_store_nm}"/></span>
							<span class="goodnum"><b class="colorOrange"><i class="fas fa-heart"></i></b> <fmt:formatNumber value="${prodInfo.recom_4_pick_cnt}" type="number"/></span>
						</a>
					</li>
					</c:if>
					<c:if test="${not empty prodInfo.prod_recom_5}">
					<li class="swiper-slide">
						<a href="/shop/itemView.do?store_category=<c:out value="${prodInfo.recom_5_store_category }"/>&prod_id=<c:out value="${prodInfo.prod_recom_5 }"/>" class="pic"><img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${prodInfo.recom_5_img}"/>&fileSn=0" style="width: 100%;" onerror="this.src='/images/baseScmtour/noimg_615.png';"/></a>
						<a href="/shop/itemView.do?store_category=<c:out value="${prodInfo.recom_5_store_category }"/>&prod_id=<c:out value="${prodInfo.prod_recom_5 }"/>" class="txt">
							<em class="subject"><c:out value="${prodInfo.recom_5_prod_nm}"/></em>
							<span class="loca"><c:out value="${prodInfo.recom_5_store_nm}"/></span>
							<span class="goodnum"><b class="colorOrange"><i class="fas fa-heart"></i></b> <fmt:formatNumber value="${prodInfo.recom_5_pick_cnt}" type="number"/></span>
						</a>
					</li>
					</c:if>
					<c:if test="${not empty prodInfo.prod_recom_6}">
					<li class="swiper-slide">
						<a href="/shop/itemView.do?store_category=<c:out value="${prodInfo.recom_6_store_category }"/>&prod_id=<c:out value="${prodInfo.prod_recom_6 }"/>" class="pic"><img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${prodInfo.recom_5_img}"/>&fileSn=0" style="width: 100%;" onerror="this.src='/images/baseScmtour/noimg_615.png';"/></a>
						<a href="/shop/itemView.do?store_category=<c:out value="${prodInfo.recom_6_store_category }"/>&prod_id=<c:out value="${prodInfo.prod_recom_6 }"/>" class="txt">
							<em class="subject"><c:out value="${prodInfo.recom_6_prod_nm}"/></em>
							<span class="loca"><c:out value="${prodInfo.recom_6_store_nm}"/></span>
							<span class="goodnum"><b class="colorOrange"><i class="fas fa-heart"></i></b> <fmt:formatNumber value="${prodInfo.recom_6_pick_cnt}" type="number"/></span>
						</a>
					</li>
					</c:if>
					<c:if test="${not empty prodInfo.prod_recom_7}">
					<li class="swiper-slide">
						<a href="/shop/itemView.do?store_category=<c:out value="${prodInfo.recom_7_store_category }"/>&prod_id=<c:out value="${prodInfo.prod_recom_7 }"/>" class="pic"><img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${prodInfo.recom_6_img}"/>&fileSn=0" style="width: 100%;" onerror="this.src='/images/baseScmtour/noimg_615.png';"/></a>
						<a href="/shop/itemView.do?store_category=<c:out value="${prodInfo.recom_7_store_category }"/>&prod_id=<c:out value="${prodInfo.prod_recom_7 }"/>" class="txt">
							<em class="subject"><c:out value="${prodInfo.recom_7_prod_nm}"/></em>
							<span class="loca"><c:out value="${prodInfo.recom_7_store_nm}"/></span>
							<span class="goodnum"><b class="colorOrange"><i class="fas fa-heart"></i></b> <fmt:formatNumber value="${prodInfo.recom_7_pick_cnt}" type="number"/></span>
						</a>
					</li>
					</c:if>
					<c:if test="${not empty prodInfo.prod_recom_8}">
					<li class="swiper-slide">
						<a href="/shop/itemView.do?store_category=<c:out value="${prodInfo.recom_8_store_category }"/>&prod_id=<c:out value="${prodInfo.prod_recom_8 }"/>" class="pic"><img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${prodInfo.recom_7_img}"/>&fileSn=0" style="width: 100%;" onerror="this.src='/images/baseScmtour/noimg_615.png';"/></a>
						<a href="/shop/itemView.do?store_category=<c:out value="${prodInfo.recom_8_store_category }"/>&prod_id=<c:out value="${prodInfo.prod_recom_8 }"/>" class="txt">
							<em class="subject"><c:out value="${prodInfo.recom_8_prod_nm}"/></em>
							<span class="loca"><c:out value="${prodInfo.recom_8_store_nm}"/></span>
							<span class="goodnum"><b class="colorOrange"><i class="fas fa-heart"></i></b> <fmt:formatNumber value="${prodInfo.recom_8_pick_cnt}" type="number"/></span>
						</a>
					</li>
					</c:if>
					<c:if test="${not empty prodInfo.prod_recom_9}">
					<li class="swiper-slide">
						<a href="/shop/itemView.do?store_category=<c:out value="${prodInfo.recom_9_store_category }"/>&prod_id=<c:out value="${prodInfo.prod_recom_9 }"/>" class="pic"><img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${prodInfo.recom_8_img}"/>&fileSn=0" style="width: 100%;" onerror="this.src='/images/baseScmtour/noimg_615.png';"/></a>
						<a href="/shop/itemView.do?store_category=<c:out value="${prodInfo.recom_9_store_category }"/>&prod_id=<c:out value="${prodInfo.prod_recom_9 }"/>" class="txt">
							<em class="subject"><c:out value="${prodInfo.recom_9_prod_nm}"/></em>
							<span class="loca"><c:out value="${prodInfo.recom_9_store_nm}"/></span>
							<span class="goodnum"><b class="colorOrange"><i class="fas fa-heart"></i></b> <fmt:formatNumber value="${prodInfo.recom_9_pick_cnt}" type="number"/></span>
						</a>
					</li>
					</c:if>
					<c:if test="${not empty prodInfo.prod_recom_10}">
					<li class="swiper-slide">
						<a href="/shop/itemView.do?store_category=<c:out value="${prodInfo.recom_10_store_category }"/>&prod_id=<c:out value="${prodInfo.prod_recom_10 }"/>" class="pic"><img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${prodInfo.recom_9_img}"/>&fileSn=0" style="width: 100%;" onerror="this.src='/images/baseScmtour/noimg_615.png';"/></a>
						<a href="/shop/itemView.do?store_category=<c:out value="${prodInfo.recom_10_store_category }"/>&prod_id=<c:out value="${prodInfo.prod_recom_10 }"/>" class="txt">
							<em class="subject"><c:out value="${prodInfo.recom_10_prod_nm}"/></em>
							<span class="loca"><c:out value="${prodInfo.recom_10_store_nm}"/></span>
							<span class="goodnum"><b class="colorOrange"><i class="fas fa-heart"></i></b> <fmt:formatNumber value="${prodInfo.recom_10_pick_cnt}" type="number"/></span>
						</a>
					</li>
					</c:if>
				</ul>
				<script>
					// 메인 슬라이드
					var swiper3 = new Swiper('.touristspot', {
						slidesPerView: 'auto',
						spaceBetween: 8,
					});
				</script>
			</div>
		</article>
		</c:if>
		<!-- } 주변관광지 -->