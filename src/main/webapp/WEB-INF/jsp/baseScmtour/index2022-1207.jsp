<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:import url="/Api/IncludeTop.do"/>

	<div id="mainContainer">
		<!-- 메인 상단 슬라이드 { -->
		<section id="mainSlide">
			<div class="loading_dom" style="display: block;">
				<div class="loadingico_dom"><i class="fad fa-spinner fa-spin"></i></div>
			</div>
		</section>
		<!-- } 메인 상단 슬라이드 -->

		<!-- 메인 네비 플랙킹 { -->
		<nav id="mainNavWrap" class="main_navi_wrap">
			<ul class="nopm swiper-wrapper">
				<li class="swiper-slide"><a href="#;">금주의서천</a></li>
				<li class="swiper-slide"><a href="#;">관광/체험</a></li>
				<li class="swiper-slide"><a href="#;">숙박</a></li>
				<li class="swiper-slide"><a href="#;">맛집</a></li>
				<li class="swiper-slide"><a href="#;">서천장터</a></li>
			</ul>
		</nav>
		<!-- } 메인 네비 플랙킹 -->

		<div id="mainContent" class="swiper-container main_contents">
			<div class="swiper-wrapper" id="content_main">
				<!-- 금주의 서천 { -->
				<section id="mainContent1" class="swiper-slide main_content_box">
					<article id="mainWeekscCourse"  style="height: 404px;">
						<h2 class="mainTit alignCenter"><em>금주의 서천코스</em></h2>
						<div class="recommendlist bestslide swiper-container" id="mainWeekscCourse_content">
						<div class="loading_dom" style="display: block;">
							<div class="loadingico_dom"><i class="fad fa-spinner fa-spin"></i></div>
						</div>
						</div>
					</article>

					<!-- 금주의 서천 :: 프로모션 { -->
					<c:if test="${promotionList_cnt > 0}">
					<article id="mainPromotion" style="height: 322px;">
						
						<div class="loading_dom" style="display: block;">
							<div class="loadingico_dom"><i class="fad fa-spinner fa-spin"></i></div>
						</div>
					</article>
					</c:if>
					<!-- } 금주의 서천 :: 프로모션 -->

					<!-- 금주의 서천 :: 배너1 { -->
					<c:if test="${ not empty banner1List}">
					<article id="mainBanner">
						<c:forEach var="banner1List" items="${banner1List}" varStatus="status">
						<c:if test="${not empty banner1List.banner_link}">
						<a href="<c:out value="${banner1List.banner_link}"/>" target="<c:out value="${banner1List.banner_target}"/>">
						</c:if>
						<img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${banner1List.banner_img}"/>&fileSn=0" style="width: 100%;" onerror="this.src='/images/baseScmtour/noimg_400.png';"/>
						<c:if test="${not empty banner1List.banner_link}">
						</a>
						</c:if>
						</c:forEach>
					</article>
					</c:if>
					<!-- } 금주의 서천 :: 배너1 -->

					<!-- 금주의 서천 :: 추천 관광/체험 { -->
					<article id="mainProduct" style="height: 320px;">
						<h2 class="mainTit">
							<em>추천 관광/체험</em>
							<a href="/shop/itemList.do?store_category=CD002001" class="more"><i class="fal fa-plus"></i> 더보기</a>
						</h2>
						<div class="main-product main-slide3 swiper-container" id="mainProduct_001">
						<div class="loading_dom" style="display: block; ">
							<div class="loadingico_dom"><i class="fad fa-spinner fa-spin"></i></div>
						</div>
						</div>
					</article>
					<!-- } 금주의 서천 :: 추천 관광/체험 -->

					<!-- 금주의 서천 :: 추천 숙박 { -->
					<article id="mainProduct" class="bgs"  style="height: 320px;">
						<h2 class="mainTit">
							<em>추천 숙박</em>
							<a href="/shop/itemList.do?store_category=CD002002" class="more"><i class="fal fa-plus"></i> 더보기</a>
						</h2>
						<div class="main-product main-slide5 swiper-container" id="mainProduct_002">
						<div class="loading_dom" style="display: block;">
							<div class="loadingico_dom"><i class="fad fa-spinner fa-spin"></i></div>
						</div>
						</div>
					</article>
					<!-- } 금주의 서천 :: 숙박 -->

					<!-- 금주의 서천 :: 추천 맛집 { -->
					<article id="mainProduct"  style="height: 320px;">
						<h2 class="mainTit">
							<em>추천 맛집</em>
							<a href="/shop/itemList.do?store_category=CD002003" class="more"><i class="fal fa-plus"></i> 더보기</a>
						</h2>
						<div class="main-product main-slide4 swiper-container" id="mainProduct_003">
						<div class="loading_dom" style="display: block;">
							<div class="loadingico_dom"><i class="fad fa-spinner fa-spin"></i></div>
						</div>
						</div>
					</article>
					<!-- } 금주의 서천 :: 추천 맛집 -->

					<!-- 금주의 서천 :: 배너2 { -->
					<c:if test="${ not empty banner2List}">
					<article id="mainBanner">
						<c:forEach var="banner2List" items="${banner2List}" varStatus="status">
						<c:if test="${not empty banner2List.banner_link}">
						<a href="<c:out value="${banner2List.banner_link}"/>" target="<c:out value="${banner2List.banner_target}"/>">
						</c:if>
						<img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${banner2List.banner_img}"/>&fileSn=0" style="width: 100%;" onerror="this.src='/images/baseScmtour/noimg_400.png';"/>
						<c:if test="${not empty banner2List.banner_link}">
						</a>
						</c:if>
						</c:forEach>
					</article>
					</c:if>

					<!-- } 금주의 서천 :: 배너2 -->

					<!-- 금주의 서천 :: 추천 특산품 { -->
					<article id="mainMarket">
						<h2 class="mainTit">
							<em>추천 특산품</em>
							<a href="/shop/itemList.do?store_category=CD002004" class="more"><i class="fal fa-plus"></i> 더보기</a>
						</h2>
						<div class="marketlist" id="mainProduct_004">
						<ul class="nopm floats">
								<c:forEach var="weekList4" items="${weekList4}" varStatus="status">
								<li>
									<a href="/shop/itemView.do?store_category=CD002004&prod_category=<c:out value="${weekList4.prod_category}"/>&prod_id=<c:out value="${weekList4.prod_id}"/>" class="pic"><img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${weekList4.prod_img_1}"/>&fileSn=0" style="width: 100%;" onerror="this.src='/images/baseScmtour/noimg_615.png';"/></a>
									<a href="/shop/itemView.do?store_category=CD002004&prod_category=<c:out value="${weekList4.prod_category}"/>&prod_id=<c:out value="${weekList4.prod_id}"/>" class="txt">
										<span class="store">[<c:out value="${weekList4.store_nm}"/>]</span>
										<em class="subject"><c:out value="${weekList4.prod_nm}"/></em>
										<span class="price"><fmt:formatNumber value="${weekList4.prod_price}" type="number"/> <small>원</small></span>
									</a>
								</li>
								</c:forEach>
							</ul>
						</div>
					</article>
					<!-- } 금주의 서천 :: 추천 특산품 -->
				</section>
				<!-- } 금주의 서천 -->

				<!-- 관광/체험 { -->
				<section id="mainContent2" class="swiper-slide main_content_box" >
					<article id="mainTravelProduct" class="trf_list">
						<div class="loading_dom" style="display: block; height: 322px;">
							<div class="loadingico_dom"><i class="fad fa-spinner fa-spin"></i></div>
						</div>
					</article>
				</section>
				<!-- } 관광/체험 -->

				<!-- 숙박 { -->
				<section id="mainContent3" class="swiper-slide main_content_box" >
					<article id="mainRoomProduct" class="trf_list">
						<div class="loading_dom" style="display: block;">
							<div class="loadingico_dom"><i class="fad fa-spinner fa-spin"></i></div>
						</div>
					</article>
				</section>
				<!-- } 숙박 -->

				<!-- 맛집 { -->
				<section id="mainContent4" class="swiper-slide main_content_box" >
					<article id="mainFoodProduct" class="trf_list">
						<div class="loading_dom" style="display: block;" >
							<div class="loadingico_dom"><i class="fad fa-spinner fa-spin"></i></div>
						</div>
					</article>
				</section>
				<!-- } 맛집 -->

				<!-- 서천장터 { -->
				<section id="mainContent5" class="swiper-slide main_content_box bgs" style="">
					<article id="mainMarketProduct" class="marketlist">
						<div class="loading_dom" style="display: block;">
							<div class="loadingico_dom"><i class="fad fa-spinner fa-spin"></i></div>
						</div>
					</article>
				</section>
				<!-- } 서천장터 -->
			</div>
		</div>
	</div>

	<script>
		// 메인 트래킹 메뉴와 콘텐츠
		var mainMenus = new Swiper('.main_navi_wrap', {
			spaceBetween: 0,
			slidesPerView: 'auto',
			freeMode: true,
			watchSlidesVisibility: true,
			watchSlidesProgress: true,
		});
		var mainContent = new Swiper('.main_contents', {
			allowTouchMove: false,
			autoHeight: true,
			spaceBetween: 0,
			navigation: {
				nextEl: '.swiper-button-next',
				prevEl: '.swiper-button-prev',
			},
			thumbs: {
				swiper: mainMenus
			}
		});
	</script>
	<script>
	indexAjaxLoad('mainSlide');
	indexAjaxLoad('mainWeekscCourse_content');
	indexAjaxLoad('mainPromotion');

	indexAjaxLoad('mainProduct_001');
	indexAjaxLoad('mainProduct_002');
	indexAjaxLoad('mainProduct_003');
	//indexAjaxLoad('mainProduct_004');
	
	indexAjaxLoad('mainTravelProduct');
	indexAjaxLoad('mainRoomProduct');
	indexAjaxLoad('mainFoodProduct');
	indexAjaxLoad('mainMarketProduct');
	
	</script>

<c:import url="/Api/IncludeBottom.do"/>
