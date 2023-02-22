<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:set var="headerType" value="morePage" />
<c:import url="/Api/IncludeTop.do"/>

<script>
function login() {
	getLogin("/shop/more.do");
}
</script>

	<!-- 더보기 { -->
	<section id="morePage">
		<!-- 내 관광상품 구매내역 { -->
		<article id="moreMyTravel">
			
			<c:choose>
			<c:when test="${empty user_id }">
			<h2 class="mainTit">
				<em>내 관광상품 구매내역</em>
			</h2>
			<div class="main-product" style="height:100px;">
				<a href="javascript:login();" class="login_btn">로그인</a>
			</div>
			</c:when>
			<c:otherwise>
			<h2 class="mainTit">
				<em>내 관광상품 구매내역</em>
				<a href="/mypage/orderList.do" class="more"><i class="fal fa-plus"></i> 더보기</a>
			</h2>
			
			<c:choose>
			<c:when test="${empty myshowList}">
			<div class="main-product" style="height:100px;">
				<center style="padding-top: 40px;">내역이 존재하지 않습니다.</center>
			</div>
			</c:when>
			<c:otherwise>
			<div class="main-product main-slide1 swiper-container">
				<ul class="nopm swiper-wrapper">
				<c:forEach var="myshowList" items="${myshowList}"> 
					<li class="swiper-slide">
						<a href="/mypage/orderDetail.do?order_id=<c:out value="${myshowList.od_order_id}"/>" class="pic"><img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${myshowList.prod_img_1}"/>&fileSn=0" onerror="this.src='/images/baseScmtour/_noImage.png';"/></a>
						<a href="/mypage/orderDetail.do?order_id=<c:out value="${myshowList.od_order_id}"/>" class="txt">
							<em class="subject"><c:out value="${myshowList.od_prod_nm}"/></em>
							<span class="price"><fmt:formatNumber value="${myshowList.od_prod_total_price}" type="number"/> <small>원</small></span>
						</a>
						<c:choose>
					    	<c:when test="${myshowList.od_stat eq 'N'}">
					    		<c:choose>
					    			<c:when test="${myshowList.od_order_stat eq 'PAYMENT'}">
                           			<div class="state notused">사용대기</div>
                           			</c:when>
                           			<c:when test="${myshowList.od_order_stat eq 'CANCELING'}">
                           			<div class="state nopayment">취소요쳥</div>
                           			</c:when>
                           			<c:when test="${myshowList.od_order_stat eq 'CANCEL'}">
                           			<div class="state nopayment">취소</div>
                           			</c:when>
                           			<c:otherwise>
                           			<div class="state nopayment">입금대기</div>
                           			</c:otherwise>
                           		</c:choose>
                           	</c:when>
                           	<c:otherwise>
                           	<div class="state complete">사용완료</div>
                           	</c:otherwise>
						</c:choose>
					</li>
					</c:forEach>
				</ul>
				<div class="swiper-pagination"></div>
				<script>
					// 메인 슬라이드
					var swiper1 = new Swiper('.main-slide1', {
						slidesPerView: 'auto',
						spaceBetween: 10,
						pagination: {
							el: '.swiper-pagination',
						},
					});
				</script>
			</div>
			</c:otherwise>
			</c:choose>
			
			</c:otherwise>
			</c:choose>
			
		</article>
		<!-- } 내 관광상품 구매내역 -->

		<!-- 내 특산품 구매내역 { -->
		<article id="moreMyMarket" class="bgs">
		
			<c:choose>
			<c:when test="${empty user_id }">
			<h2 class="mainTit">
				<em>내 특산품 구매내역</em>
			</h2>
			<div class="main-product" style="height:100px;">
				<a href="javascript:login();" class="login_btn">로그인</a>
			</div>
			</c:when>
			<c:otherwise>
			<h2 class="mainTit">
				<em>내 특산품 구매내역</em>
				<a href="/mypage/orderList.do" class="more"><i class="fal fa-plus"></i> 더보기</a>
			</h2>
			
			<c:choose>
			<c:when test="${empty mymarketList}">
			<div class="main-product" style="height:100px;">
				<center style="padding-top: 40px;">내역이 존재하지 않습니다.</center>
			</div>
			</c:when>
			<c:otherwise>
			<div class="marketlist main-slide2 swiper-container">
				<ul class="nopm swiper-wrapper">
				<c:forEach var="mymarketList" items="${mymarketList}"> 
					<li class="swiper-slide">
						<a href="/mypage/orderDetail.do?order_id=<c:out value="${mymarketList.od_order_id}"/>" class="pic"><img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${mymarketList.prod_img_1}"/>&fileSn=0" onerror="this.src='/images/baseScmtour/_noImage.png';"/></a>
						<a href="/mypage/orderDetail.do?order_id=<c:out value="${mymarketList.od_order_id}"/>" class="txt">
							<span class="store">[<c:out value="${mymarketList.store_nm}"/>]</span>
							<em class="subject"><c:out value="${mymarketList.od_prod_nm}"/></em>
							<span class="price"><fmt:formatNumber value="${mymarketList.od_prod_total_price}" type="number"/> <small>원</small></span>
						</a>
						<c:choose>
					    	<c:when test="${mymarketList.od_stat eq 'N'}">
					    		<c:choose>
					    			<c:when test="${mymarketList.od_order_stat eq 'PAYMENT'}">
                           			<div class="state notused">결제완료</div>
                           			</c:when>
                           			<c:when test="${mymarketList.od_order_stat eq 'CANCELING'}">
                           			<div class="state nopayment">취소요쳥</div>
                           			</c:when>
                           			<c:when test="${mymarketList.od_order_stat eq 'CANCEL'}">
                           			<div class="state nopayment">취소</div>
                           			</c:when>
                           			<c:when test="${mymarketList.od_order_stat eq 'TRANSFER'}">
                           			<div class="state nopayment">배송중</div>
                           			</c:when>
                           			<c:when test="${mymarketList.od_order_stat eq 'COMPLETE'}">
                           			<div class="state nopayment">완료</div>
                           			</c:when>
                           			<c:otherwise>
                           			<div class="state nopayment">입금대기</div>
                           			</c:otherwise>
                           		</c:choose>
                           	</c:when>
                           	<c:otherwise>
                           	<div class="state complete">사 용완료</div>
                           	</c:otherwise>
						</c:choose>
					</li>
				</c:forEach>
				</ul>
				<div class="swiper-pagination"></div>
				<script>
					// 메인 슬라이드
					var swiper2 = new Swiper('.main-slide2', {
						slidesPerView: 'auto',
						spaceBetween: 10,
						pagination: {
							el: '.swiper-pagination',
						},
					});
				</script>
			</div>
			</c:otherwise>
			</c:choose>
			
			</c:otherwise>
			</c:choose>
			
		</article>
		<!-- } 내 특산품 구매내역 -->

		<!-- 배너 { -->
		<c:if test="${ not empty banner3List}">
			<article id="mainBanner">
				<c:forEach var="banner1List" items="${banner3List}" varStatus="status">
				<c:if test="${not empty banner3List.banner_link}">
				<a href="<c:out value="${banner3List.banner_link}"/>" target="<c:out value="${banner3List.banner_target}"/>">
				</c:if>
				<img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${banner3List.banner_img}"/>&fileSn=0" style="width: 100%;" onerror="this.src='/images/baseScmtour/noimg_400.png';"/>
				<c:if test="${not empty banner3List.banner_link}">
				</a>
				</c:if>
				</c:forEach>
			</article>
		</c:if>
		<!-- } 배너 -->

		<!-- 공지사항, 배너, 소셜 등 { -->
		<article id="moreNotice">
			<h2 class="mainTit">
				<em>공지사항</em>
				<a href="/board/list.do?bd_id=NOTICE&pageIndex=1" class="more"><i class="fal fa-plus"></i> 더보기</a>
			</h2>
			<div class="notice_latest">
				<ul class="nopm">
				<c:forEach var="noticeList" items="${noticeList}" varStatus="status">
					<li><a href="/board/view.do?bd_id=NOTICE&pageIndex=1&bbs_seq=<c:out value="${noticeList.bbs_seq }"/>"><em><c:out value="${noticeList.bbs_subject}"/></em><span><c:out value="${noticeList.reg_dt_ymd}"/></span></a></li>
				</c:forEach>
				</ul>
			</div>
		</article>
		<!-- } 공지사항, 배너, 소셜 등 -->

		<!-- 더보기 주요 메뉴 { -->
		<article id="moreMenu" class="bgs">
			<ul class="nopm floats">
				<li>
					<a href="/shop/itemList.do?store_category=CD002005">
						<em><img src="/images/baseScmtour/ico_etc01.png" alt="추천 여행상품" /></em>
						<span>추천 여행상품</span>
					</a>
				</li>
				<li>
					<a href="/shop/promotionList.do">
						<em><img src="/images/baseScmtour/ico_etc02.png" alt="프로모션" /></em>
						<span>프로모션/이벤트</span>
					</a>
				</li>
				<!-- 
				<li>
					<c:choose>
						<c:when test="${not empty user_id}">
							<a href="/mypage/orderReserveList.do">
						</c:when>
						<c:otherwise>
							<a href="#" onclick="getLogin('/mypage/orderReserveList.do'); return false; ">
						</c:otherwise>
					</c:choose>
						<em><img src="/images/baseScmtour/ico_etc03.png" alt="관광상품 구매내역" /></em>
						<span>관광상품 구매내역</span>
					</a>
				</li>
				<li>
					<c:choose>
						<c:when test="${not empty user_id}">
							<a href="/mypage/orderMarketList.do">
						</c:when>
						<c:otherwise>
							<a href="#" onclick="getLogin('/mypage/orderMarketList.do'); return false; ">
						</c:otherwise>
					</c:choose>
						<em><img src="/images/baseScmtour/ico_etc04.png" alt="특산품 구매내역" /></em>
						<span>특산품 구매내역</span>
					</a>
				</li>
				 -->
				<!--
				<li>
					<a href="#;">
						<em><img src="/images/baseScmtour/ico_etc05.png" alt="e-Ticket" /></em>
						<span>e-Ticket</span>
					</a>
				</li>
				<li>
					<a href="#;">
						<em><img src="/images/baseScmtour/ico_etc06.png" alt="반품/환불 내역" /></em>
						<span>반품/환불 내역</span>
					</a>
				</li>
				<li>
					<a href="#;">
						<em><img src="/images/baseScmtour/ico_etc07.png" alt="좋았서천" /></em>
						<span>좋았서천</span>
					</a>
				</li>
				-->
				<li>
					<c:choose>
						<c:when test="${not empty user_id}">
							<a href="/board/list.do?bd_id=MTM">
						</c:when>
						<c:otherwise>
							<a href="#" onclick="getLogin('/board/list.do?bd_id=MTM&pageIndex=1'); return false; ">
						</c:otherwise>
					</c:choose>
						<em><img src="/images/baseScmtour/ico_etc08.png" alt="1:1문의" /></em>
						<span>1:1문의</span>
					</a>
				</li>
				<li>
					<!-- <a href="javascript:alert('기능을 준비중입니다.');"> -->
					<a href="/extention/myPlace.do">
						<em><img src="/images/baseScmtour/ico_etc09.png" alt="내주변" /></em>
						<span>내주변</span>
					</a>
				</li>
				<!--
				<li>
					<a href="#;">
						<em><img src="/images/baseScmtour/ico_etc10.png" alt="나의 코스" /></em>
						<span>나의 코스</span>
					</a>
				</li>
				-->
				<li>
					<c:choose>
						<c:when test="${not empty user_id}">
							<a href="/member/logOut.do">
						</c:when>
						<c:otherwise>
							<a href="#" onclick="alert('로그인상태가 아닙니다.'); return false; ">
						</c:otherwise>
					</c:choose>
						<em><img src="/images/baseScmtour/ico_etc11.png" alt="로그아웃" /></em>
						<span>로그아웃</span>
					</a>
				</li>
				<li>
					<c:choose>
						<c:when test="${not empty user_id}">
							<a href="/member/modify.do">
						</c:when>
						<c:otherwise>
							<a href="#" onclick="getLogin('/member/modify.do'); return false; ">
						</c:otherwise>
					</c:choose>
						<em><img src="/images/baseScmtour/ico_etc12.png" alt="회원탈퇴" /></em>
						<span>정보수정/회원탈퇴</span>
					</a>
				</li>
			</ul>
		</article>
		<!-- } 더보기 주요 메뉴 -->
	</section>
	<!-- } 더보기 -->


<c:import url="/Api/IncludeBottom.do"/>