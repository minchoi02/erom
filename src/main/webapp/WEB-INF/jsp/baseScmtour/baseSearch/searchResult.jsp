<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:import url="/Api/IncludeTop.do"/>

	<!-- 전체검색 리스트 { -->
	<section id="searchView" class="search_page bgs">
		<article class="spheader">
			<div class="backarea"><a href="javascript:history.back();" class="backbtn"><i class="fal fa-arrow-left"></i><span class="sound_only">뒤로가기</span></a></div>
			<h2><em>Search</em></h2>
			<div class="search_userbox">
				<ul class="nopm floats">
					<!--<li><a href="./search_list.php" class="subtn searchbtn"><i class="far fa-search"></i><span class="sound_only">검색 버튼</span></a></li>-->
					<c:choose>
						<c:when test="${empty user_id }">
						<li><a href="javascript:getLogin('/search/search.do')" class="subtn userbtn"><i class="far fa-lock-alt"></i><span class="sound_only">로그인 버튼</span></a></li>
						</c:when>
						<c:otherwise>
						<li><a href="/shop/more.do" class="subtn userbtn"><i class="fas fa-sign-in-alt"></i> <i class="fas fa-sign-out-alt"></i><span class="sound_only">로그인 버튼</span></a></li>
						</c:otherwise>
					</c:choose>
				</ul>
			</div>
			<form method="get" action="/search/searchResult.do" id="searchForm" name="searchForm" onsubmit="return Fromsearch()" >
			<div class="searchbox">
				<input type="text"  id="searchKeyword" name="searchKeyword" class="search_input w100" placeholder="검색어를 입력해주세요" value="<c:out value="${searchKeyword }"/>" />
				<button type="submit" class="search_button"><i class="far fa-search"></i><span class="skip">검색</span></button>
			</div>
			</form>
		</article>
		<article class="search_result">
			<div class="search_tab">
				<ul class="nopm floats">
					<li><a href="/search/searchResult.do?&searchKeyword=<c:out value="${searchKeyword }"/>" <c:if test="${empty store_category }">class="active"</c:if> > 전체</a></li>
					<li><a href="/search/searchResult.do?store_category=CD002001&searchKeyword=<c:out value="${searchKeyword }"/>" <c:if test="${store_category eq 'CD002001'}">class="active"</c:if> >관광/체험</a></li>
					<li><a href="/search/searchResult.do?store_category=CD002002&searchKeyword=<c:out value="${searchKeyword }"/>" <c:if test="${store_category eq 'CD002002'}">class="active"</c:if> >숙박</a></li>
					<li><a href="/search/searchResult.do?store_category=CD002003&searchKeyword=<c:out value="${searchKeyword }"/>" <c:if test="${store_category eq 'CD002003'}">class="active"</c:if> >맛집</a></li>
					<li><a href="/search/searchResult.do?store_category=CD002004&searchKeyword=<c:out value="${searchKeyword }"/>" <c:if test="${store_category eq 'CD002004'}">class="active"</c:if> >서천장터 </a></li>
				</ul>
			</div>
			
			<c:if test="${empty store_category }">
			
			<div class="search_latest">
				<!-- 관광/체험 검색결과 최근게시물 { -->
				<c:if test="${not empty category1List }">
				<div class="search_con latest_travel">
					<h3><em>관광/체험</em><a href="/search/searchResult.do?store_category=CD002001&searchKeyword=<c:out value="${searchKeyword }"/>" class="more"><i class="far fa-plus"></i> 더보기</a></h3>
					<div class="main-product latest-travel swiper-container">
						<ul class="nopm swiper-wrapper">
							<c:forEach var="category1List" items="${category1List}" varStatus="status">
							<li class="swiper-slide">
								<a href="/shop/itemView.do?store_category=CD002001&prod_id=<c:out value="${category1List.prod_id}"/>" class="pic"><img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${category1List.prod_img_1}"/>&fileSn=0" onerror="this.src='/images/baseScmtour/noimg_615.png';"/></a>
								<a href="/shop/itemView.do?store_category=CD002001&prod_id=<c:out value="${category1List.prod_id}"/>" class="txt">
									<em class="subject"><c:out value="${category1List.prod_nm}"/></em>
									<span class="loca"><c:out value="${category1List.store_nm}"/></span>
									<span class="goodnum"><b class="colorOrange"><i class="fas fa-heart"></i></b> <fmt:formatNumber value="${category1List.prod_pick_cnt}" type="number"/></span>
								</a>
							</li>
							</c:forEach>
						</ul>
						<div class="swiper-pagination"></div>
						<script>
							var swiper1 = new Swiper('.latest-travel', {
								slidesPerView: 'auto',
								spaceBetween: 8,
								pagination: {
									el: '.swiper-pagination',
									dynamicBullets: true,
								},
							});
						</script>
					</div>
				</div>
				</c:if>
				<!-- } 관광/체험 검색결과 최근게시물 -->
				<!-- 숙박 검색결과 최근게시물 { -->
				<c:if test="${not empty category2List }">
				<div class="search_con latest_room">
					<h3><em>숙박</em><a href="/search/searchResult.do?store_category=CD002002&searchKeyword=<c:out value="${searchKeyword }"/>" class="more"><i class="far fa-plus"></i> 더보기</a></h3>
					<div class="main-product latest-room swiper-container">
						<ul class="nopm swiper-wrapper">
							<c:forEach var="category2List" items="${category2List}" varStatus="status">
							<li class="swiper-slide">
								<a href="/shop/itemView.do?store_category=CD002002&prod_id=<c:out value="${category2List.prod_id}"/>" class="pic"><img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${category2List.prod_img_1}"/>&fileSn=0" onerror="this.src='/images/baseScmtour/noimg_615.png';"/></a>
								<a href="/shop/itemView.do?store_category=CD002002&prod_id=<c:out value="${category2List.prod_id}"/>" class="txt">
									<em class="subject"><c:out value="${category2List.prod_nm}"/></em>
									<span class="loca"><c:out value="${category2List.store_nm}"/></span>
									<span class="goodnum"><b class="colorOrange"><i class="fas fa-heart"></i></b> <fmt:formatNumber value="${category2List.prod_pick_cnt}" type="number"/></span>
								</a>
							</li>
							</c:forEach>
						</ul>
						<div class="swiper-pagination"></div>
						<script>
							var swiper2 = new Swiper('.latest-room', {
								slidesPerView: 'auto',
								spaceBetween: 8,
								pagination: {
									el: '.swiper-pagination',
									dynamicBullets: true,
								},
							});
						</script>
					</div>
				</div>
				</c:if>
				<!-- } 숙박 검색결과 최근게시물 -->
				<!-- 맛집 검색결과 최근게시물 { -->
				<c:if test="${not empty category3List }">
				<div class="search_con latest_food">
					<h3><em>맛집</em><a href="/search/searchResult.do?store_category=CD002003&searchKeyword=<c:out value="${searchKeyword }"/>" class="more"><i class="far fa-plus"></i> 더보기</a></h3>
					<div class="main-product latest-food swiper-container">
						<ul class="nopm swiper-wrapper">
							<c:forEach var="category3List" items="${category3List}" varStatus="status">
							<li class="swiper-slide">
								<a href="/shop/itemView.do?store_category=CD002003&prod_id=<c:out value="${category3List.prod_id}"/>" class="pic"><img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${category3List.prod_img_1}"/>&fileSn=0" onerror="this.src='/images/baseScmtour/noimg_615.png';"/></a>
								<a href="/shop/itemView.do?store_category=CD002003&prod_id=<c:out value="${category3List.prod_id}"/>" class="txt">
									<em class="subject"><c:out value="${category3List.prod_nm}"/></em>
									<span class="loca"><c:out value="${category3List.store_nm}"/></span>
									<span class="goodnum"><b class="colorOrange"><i class="fas fa-heart"></i></b> <fmt:formatNumber value="${category3List.prod_pick_cnt}" type="number"/></span>
								</a>
							</li>
							</c:forEach>
						</ul>
						<div class="swiper-pagination"></div>
						<script>
							var swiper3 = new Swiper('.latest-food', {
								slidesPerView: 'auto',
								spaceBetween: 8,
								pagination: {
									el: '.swiper-pagination',
									dynamicBullets: true,
								},
							});
						</script>
					</div>
				</div>
				</c:if>
				<!-- } 맛집 검색결과 최근게시물 -->
				<!-- 서천장터 검색결과 최근게시물 { -->
				<c:if test="${not empty category4List }">
				<div class="search_con latest_market">
					<h3><em>서천장터</em><a href="/search/searchResult.do?store_category=CD002004&searchKeyword=<c:out value="${searchKeyword }"/>" class="more"><i class="far fa-plus"></i> 더보기</a></h3>
					<div class="marketlist latest-market swiper-container">
						<ul class="nopm swiper-wrapper">
							<c:forEach var="category4List" items="${category4List}" varStatus="status">
							<li class="swiper-slide">
								<a href="/shop/itemView.do?store_category=CD002004&prod_category=<c:out value="${category4List.prod_category}"/>&prod_id=<c:out value="${category4List.prod_id}"/>" class="pic"><img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${category4List.prod_img_1}"/>&fileSn=0" onerror="this.src='/images/baseScmtour/noimg_615.png';"/></a>
								<a href="/shop/itemView.do?store_category=CD002004&prod_category=<c:out value="${category4List.prod_category}"/>&prod_id=<c:out value="${category4List.prod_id}"/>" class="txt">
									<span class="store">[<c:out value="${category4List.store_nm}"/>]</span>
									<em class="subject"><c:out value="${category4List.prod_nm}"/></em>
									<span class="price"><fmt:formatNumber value="${category4List.prod_price}" type="number"/> <small>원</small></span>
								</a>
							</li>
							</c:forEach>
						</ul>
						<div class="swiper-pagination"></div>
						<script>
							// 메인 슬라이드
							var swiper4 = new Swiper('.latest-market', {
								slidesPerView: 'auto',
								spaceBetween: 8,
								pagination: {
									el: '.swiper-pagination',
									dynamicBullets: true,
								},
							});
						</script>
					</div>
				</div>
				</c:if>
				<!-- } 서천장터 검색결과 최근게시물 -->
			</div>
			
			</c:if>
			
			<c:if test="${not empty store_category }">

			<c:choose>
				<c:when test="${store_category eq 'CD002001' }">
					<c:set var="category_name" value="관광/체험"/>
				</c:when>
				<c:when test="${store_category eq 'CD002002' }">
					<c:set var="category_name" value="숙박"/>
				</c:when>
				<c:when test="${store_category eq 'CD002003' }">
					<c:set var="category_name" value="맛집"/>
				</c:when>
				<c:when test="${store_category eq 'CD002004' }">
					<c:set var="category_name" value="서천장터"/>
				</c:when>
			</c:choose>
			<div class="search_con">
				<h3><em><c:out value="${category_name }"/></em></h3>
				<div class="main-product search-product"  id="itemSearchResult">
				<!--  상품목록이 들어올 부분 -->
				</div>
			</div>
	
			<input type="hidden" id="pageNum" value="0" />
			<input type="hidden" id="pagePerCnt" value="10" />
			<input type="hidden" id="store_category" value="<c:out value="${store_category }"/>" />
			<input type="hidden" id="searchKeyword" value="<c:out value="${searchKeyword }"/>" />
			<script>
			getSearchItemList();
			</script>

			</c:if>
			<c:if test="${empty store_category }">
			<c:if test="${empty category1List && empty category2List && empty category3List && empty category4List }">
			<br><br>
			<center><p class="comment" style="color: #ff6600;">검색된 상품이 없습니다.</p></center>
			<br>
			</c:if>
			</c:if>
			
		</article>
	</section>
	<!-- } 전체검색 리스트 -->
	
<c:import url="/Api/IncludeBottom.do"/>