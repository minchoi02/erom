<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:set var="headerType" value="morePage" />
<c:import url="/Api/IncludeTop.do"/>

	<!-- 찜한상품 { -->
	<section id="favorites" class="cart_favorites">
		<h1><em><i class="fas fa-heart-circle"></i> 찜한상품</em></h1>

		<div class="cf_tab">
			<ul class="nopm floats">
				<li><a href="/mypage/favoriteReserveList.do" class="active" >관광/체험, 숙박, 맛집</a></li>
				<li><a href="/mypage/favoriteMarketList.do" >서천장터</a></li>
			</ul>
		</div>

		<!-- 상품이 없을 때 { --
		<div class="cf_noitem alignCenter">
			장바구니에 상품이 존재하지 않습니다.
		</div>
		!-- } 상품이 없을 때 -->
		
		<!-- 찜한상품 리스트 { -->
		<article class="favoriteslist">
			<div class="trf_list" id="favList">
				
			</div>
		</article>
		<!-- } 찜한상품 리스트 -->

		<!-- } 찜한상품 리스트 -->
	</section>
	<!-- } 찜한상품 -->

<input type="hidden" id="pageNum" value="0" />
<input type="hidden" id="pagePerCnt" value="10" />
<input type="hidden" id="store_category" value="zone" />
<script>
getFavList();
</script>
<c:import url="/Api/IncludeBottom.do"/>