<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<% 
response.setHeader("pragma", "no-cache");              
response.setHeader("Cache-control", "no-cache, no-store, must-revalidate");             
response.setHeader("Expires", "0"); 

// url을 읽어와서 파일을 추출한다.
String fullUrl = request.getServletPath();
String checkUrl = fullUrl.replace("/WEB-INF/jsp/admgr/","");
String[] url_arr = checkUrl.split("/");
String this_uri = url_arr[0].replace(".jsp","");
String left_uri = "";
if(url_arr.length > 1) { //서브디렉토리일때..  왼쪽 메뉴를 잡는다.
	left_uri = url_arr[1].replace(".jsp","");
}
%>
	<c:choose>
		<c:when test="${adminLevel eq '10' }">
		<!-- 사이드 메뉴 { -->
		<aside id="sidemnu">
		<% if(this_uri.equals("admgrConfig")) { %>
			<h2><em><i class="fad fa-cog"></i></em><span>환경설정</span></h2>
			<nav id="sub-gnb">
				<ul class="nopm">
					<li <% if(left_uri.equals("baseSetting")) { %>class="active"<% } %>><a href="/admgr/admgrConfig/baseSetting.do">기본환경설정<span><i class="fal fa-chevron-right"></i></span></a></li>
					<%--
					<li <% if(left_uri.equals("popupList") || left_uri.equals("popupForm")) { %>class="active"<% } %>><a href="/admgr/admgrConfig/popupList.do">팝업관리<span><i class="fal fa-chevron-right"></i></span></a></li>
					 --%>
				</ul>
			</nav>
		<% } %>
		<% if(this_uri.equals("admgrMember")) { %>
			<h2><em><i class="fad fa-users"></i></em><span>회원관리</span></h2>
			<nav id="sub-gnb">
				<ul class="nopm">
					<li <% if(left_uri.equals("memberList") || left_uri.equals("memberForm")) { %>class="active"<% } %>><a href="/admgr/admgrMember/memberList.do">회원관리<span><i class="fal fa-chevron-right"></i></span></a></li>
					<li <% if(left_uri.equals("memberMileage")) { %>class="active"<% } %>><a href="/admgr/admgrMember/memberMileage.do">마일리지관리<span><i class="fal fa-chevron-right"></i></span></a></li>
				</ul>
			</nav>
		<% } %>
		<% if(this_uri.equals("admgrStore")) { %>
			<h2><em><i class="fad fa-store"></i></em><span>상점관리</span></h2>
			<nav id="sub-gnb">
				<ul class="nopm">
					<li <% if(left_uri.equals("storeList") || left_uri.equals("storeForm")) { %>class="active"<% } %>><a href="/admgr/admgrStore/storeList.do">상점관리<span><i class="fal fa-chevron-right"></i></span></a></li>
					<li <% if(left_uri.equals("storeCalculateList") || left_uri.equals("storeCalculateDetail")) { %>class="active"<% } %>><a href="/admgr/admgrStore/storeCalculateList.do">상점정산<span><i class="fal fa-chevron-right"></i></span></a></li>
				</ul>
			</nav>
		<% } %>
		<% if(this_uri.equals("admgrProduct")) { %>
			<h2><em><i class="fad fa-box"></i></em><span>상품관리</span></h2>
			<nav id="sub-gnb">
				<ul class="nopm">
<!--  				<li <c:if test="${store_category eq 'CD002001' }">class="active"</c:if>><a href="/admgr/admgrProduct/productList.do?store_category=CD002001">관굉/체험<span><i class="fal fa-chevron-right"></i></span></a></li>
					<li <c:if test="${store_category eq 'CD002002' }">class="active"</c:if>><a href="/admgr/admgrProduct/productList.do?store_category=CD002002">숙박<span><i class="fal fa-chevron-right"></i></span></a></li>
					<li <c:if test="${store_category eq 'CD002003' }">class="active"</c:if>><a href="/admgr/admgrProduct/productList.do?store_category=CD002003">맛집<span><i class="fal fa-chevron-right"></i></span></a></li>
-->					
					<li <c:if test="${store_category eq 'CD002004' }">class="active"</c:if>><a href="/admgr/admgrProduct/productList.do?store_category=CD002004">이롬스토어<span><i class="fal fa-chevron-right"></i></span></a></li>
<!-- 				<li <c:if test="${store_category eq 'CD002005' }">class="active"</c:if>><a href="/admgr/admgrProduct/productList.do?store_category=CD002005">추천여행상품<span><i class="fal fa-chevron-right"></i></span></a></li>
-->
				</ul>
			</nav>
		<% } %>
		<% if(this_uri.equals("admgrOrder")) { %>
			<h2><em><i class="fad fa-receipt"></i></em><span>주문내역</span></h2>
			<nav id="sub-gnb">
				<ul class="nopm">
					<li <% if(left_uri.equals("orderList") || left_uri.equals("orderForm")) { %>class="active"<% } %>><a href="/admgr/admgrOrder/orderList.do">주문내역<span><i class="fal fa-chevron-right"></i></span></a></li>
					<li <% if(left_uri.equals("orderCancelingList")) { %>class="active"<% } %>><a href="/admgr/admgrOrder/orderCancelingList.do">주문취소 요청내역<span><i class="fal fa-chevron-right"></i></span></a></li>
				<%--
					<li <c:if test="${store_category eq 'CD002001' }">class="active"</c:if>><a href="/admgr/admgrOrder/orderList.do?store_category=CD002001">관굉/체험<span><i class="fal fa-chevron-right"></i></span></a></li>
					<li <c:if test="${store_category eq 'CD002002' }">class="active"</c:if>><a href="/admgr/admgrOrder/orderList.do?store_category=CD002002">숙박<span><i class="fal fa-chevron-right"></i></span></a></li>
					<li <c:if test="${store_category eq 'CD002003' }">class="active"</c:if>><a href="/admgr/admgrOrder/orderList.do?store_category=CD002003">맛집<span><i class="fal fa-chevron-right"></i></span></a></li>
					<li <c:if test="${store_category eq 'CD002004' }">class="active"</c:if>><a href="/admgr/admgrOrder/orderList.do?store_category=CD002004">서천장터<span><i class="fal fa-chevron-right"></i></span></a></li>
				 --%>
				</ul>
			</nav>
		<% } %>
		<% if(this_uri.equals("admgrMarketing")) { %>
			<h2><em><i class="fad fa-gem"></i></em><span>프리미엄노출</span></h2>
			<nav id="sub-gnb">
				<ul class="nopm">
					<li <% if(left_uri.equals("mainSlide")) { %>class="active"<% } %>><a href="/admgr/admgrMarketing/mainSlide.do">메인 상단 슬라이드<span><i class="fal fa-chevron-right"></i></span></a></li>
					 <li <% if(left_uri.equals("week")) { %>class="active"<% } %>><a href="/admgr/admgrMarketing/week.do">MD PICK<span><i class="fal fa-chevron-right"></i></span></a></li>
					<li <% if(left_uri.equals("banner")) { %>class="active"<% } %>><a href="/admgr/admgrMarketing/banner.do">배너관리<span><i class="fal fa-chevron-right"></i></span></a></li>
					<%-- <li <% if(left_uri.equals("mainProduct")) { %>class="active"<% } %>><a href="/admgr/admgrMarketing/mainProduct.do">메인 상품 콘덴츠<span><i class="fal fa-chevron-right"></i></span></a></li> --%>
				</ul>
			</nav>
		<% } %>
		<% if(this_uri.equals("admgrCustomer")) { %>
			<h2><em><i class="fad fa-user-headset"></i></em><span>고객센터</span></h2>
			<nav id="sub-gnb">
				<ul class="nopm">
					<li <% if(left_uri.equals("noticeList") || left_uri.equals("noticeForm")) { %>class="active"<% } %>><a href="/admgr/admgrCustomer/noticeList.do">공지사항<span><i class="fal fa-chevron-right"></i></span></a></li>
					<li <% if(left_uri.equals("mtmList") || left_uri.equals("mtmForm")) { %>class="active"<% } %>><a href="/admgr/admgrCustomer/mtmList.do">1:1문의<span><i class="fal fa-chevron-right"></i></span></a></li>
					<li <% if(left_uri.equals("qnaList") || left_uri.equals("qnaForm")) { %>class="active"<% } %>><a href="/admgr/admgrCustomer/qnaList.do">상품 Q&A<span><i class="fal fa-chevron-right"></i></span></a></li>
					<li <% if(left_uri.equals("reviewList") || left_uri.equals("reviewForm")) { %>class="active"<% } %>><a href="/admgr/admgrCustomer/reviewList.do">리뷰<span><i class="fal fa-chevron-right"></i></span></a></li>
					<li <% if(left_uri.equals("eventList") || left_uri.equals("eventForm")) { %>class="active"<% } %>><a href="/admgr/admgrCustomer/eventList.do">프로모션/이벤트<span><i class="fal fa-chevron-right"></i></span></a></li>
				</ul>
			</nav>
		<% } %>
		<% if(this_uri.equals("admgrExtention")) { %>
			<h2><em><i class="fad fa-archive"></i></em><span>편의기능</span></h2>
			<nav id="sub-gnb">
				<ul class="nopm">
					<%-- <li <% if(left_uri.equals("push")) { %>class="active"<% } %>><a href="/admgr/admgrExtention/push.do">푸쉬관리<span><i class="fal fa-chevron-right"></i></span></a></li>--%>
					<li <% if(left_uri.equals("sms")) { %>class="active"<% } %>><a href="/admgr/admgrExtention/sms.do">SMS관리<span><i class="fal fa-chevron-right"></i></span></a></li>
					<%-- <li <% if(left_uri.equals("mail")) { %>class="active"<% } %>><a href="/admgr/admgrExtention/mail.do">메일발송<span><i class="fal fa-chevron-right"></i></span></a></li> --%>
					<li <% if(left_uri.equals("coupon")) { %>class="active"<% } %>><a href="/admgr/admgrExtention/coupon.do">쿠폰관리<span><i class="fal fa-chevron-right"></i></span></a></li>
				</ul>
			</nav>
		<% } %>
		<% if(this_uri.equals("admgrStatistics")) { %>
			<h2><em><i class="fad fa-analytics"></i></em><span>통계</span></h2>
			<nav id="sub-gnb">
				<ul class="nopm">
					<li <% if(left_uri.equals("keywordList")) { %>class="active"<% } %>><a href="/admgr/admgrStatistics/keywordList.do">인기검색어<span><i class="fal fa-chevron-right"></i></span></a></li>
					<li <% if(left_uri.equals("connection")) { %>class="active"<% } %>><a href="/admgr/admgrStatistics/connection.do">접속자집계<span><i class="fal fa-chevron-right"></i></span></a></li>
					<li <% if(left_uri.equals("statistics")) { %>class="active"<% } %>><a href="/admgr/admgrStatistics/statistics.do">매출통계<span><i class="fal fa-chevron-right"></i></span></a></li>
				</ul>
			</nav>
		<% } %>
		<% if(this_uri.equals("admgrSystem")) { %>
			<h2><em><i class="fad fa-cogs"></i></em><span>시스템관리</span></h2>
			<nav id="sub-gnb">
				<ul class="nopm">
					<li <% if(left_uri.equals("cdSetting")) { %>class="active"<% } %>><a href="/admgr/admgrSystem/cdSetting.do">코드관리<span><i class="fal fa-chevron-right"></i></span></a></li>
					<%-- <li <% if(left_uri.equals("gpSetting")) { %>class="active"<% } %>><a href="/admgr/admgrSystem/gpSetting.do">코드그룹관리<span><i class="fal fa-chevron-right"></i></span></a></li> --%>
					<%-- <li <% if(left_uri.equals("mailTemplate")) { %>class="active"<% } %>><a href="/admgr/admgrSystem/mailTemplate.do">메일템플릿관리<span><i class="fal fa-chevron-right"></i></span></a></li> --%>
					<li <% if(left_uri.equals("smsTemplate")) { %>class="active"<% } %>><a href="/admgr/admgrSystem/smsTemplate.do">문자템플릿관리<span><i class="fal fa-chevron-right"></i></span></a></li>
					<%-- <li <% if(left_uri.equals("pushTemplate")) { %>class="active"<% } %>><a href="/admgr/admgrSystem/pushTemplate.do">푸쉬템플릿관리<span><i class="fal fa-chevron-right"></i></span></a></li> --%>
				</ul>
			</nav>
		<% } %>
		</aside>
		<!-- } 사이드 메뉴 -->
		</c:when>
		
		
		<c:otherwise>
				<!-- 사이드 메뉴 { -->
		<aside id="sidemnu">
		<% if(this_uri.equals("admgrStore")) { %>
			<h2><em><i class="fad fa-store"></i></em><span>상점관리</span></h2>
			<nav id="sub-gnb">
				<ul class="nopm">
					<li <% if(left_uri.equals("storeList") || left_uri.equals("storeForm")) { %>class="active"<% } %>><a href="/admgr/admgrStore/storeList.do">상점관리<span><i class="fal fa-chevron-right"></i></span></a></li>
					<li <% if(left_uri.equals("storeCalculateList") || left_uri.equals("storeCalculateDetail")) { %>class="active"<% } %>><a href="/admgr/admgrStore/storeCalculateList.do">상점정산<span><i class="fal fa-chevron-right"></i></span></a></li>
				</ul>
			</nav>
		<% } %>
		<% if(this_uri.equals("admgrProduct")) { %>
			<h2><em><i class="fad fa-box"></i></em><span>상품관리</span></h2>
			<nav id="sub-gnb">
				<ul class="nopm">
<!-- 				<li <c:if test="${store_category eq 'CD002001' }">class="active"</c:if>><a href="/admgr/admgrProduct/productList.do?store_category=CD002001">관굉/체험<span><i class="fal fa-chevron-right"></i></span></a></li>
					<li <c:if test="${store_category eq 'CD002002' }">class="active"</c:if>><a href="/admgr/admgrProduct/productList.do?store_category=CD002002">숙박<span><i class="fal fa-chevron-right"></i></span></a></li>
					<li <c:if test="${store_category eq 'CD002003' }">class="active"</c:if>><a href="/admgr/admgrProduct/productList.do?store_category=CD002003">맛집<span><i class="fal fa-chevron-right"></i></span></a></li>
-->					
					<li <c:if test="${store_category eq 'CD002004' }">class="active"</c:if>><a href="/admgr/admgrProduct/productList.do?store_category=CD002004">이롬스토어<span><i class="fal fa-chevron-right"></i></span></a></li>
				</ul>
			</nav>
		<% } %>
		<% if(this_uri.equals("admgrOrder")) { %>
			<h2><em><i class="fad fa-receipt"></i></em><span>주문내역</span></h2>
			<nav id="sub-gnb">
				<ul class="nopm">
					<li <% if(left_uri.equals("orderList") || left_uri.equals("orderForm")) { %>class="active"<% } %>><a href="/admgr/admgrOrder/orderList.do">주문내역<span><i class="fal fa-chevron-right"></i></span></a></li>
					<li <% if(left_uri.equals("orderCancelingList")) { %>class="active"<% } %>><a href="/admgr/admgrOrder/orderCancelingList.do">주문취소 요청내역<span><i class="fal fa-chevron-right"></i></span></a></li>
				</ul>
			</nav>
		<% } %>
		<% if(this_uri.equals("admgrCustomer")) { %>
			<h2><em><i class="fad fa-user-headset"></i></em><span>고객센터</span></h2>
			<nav id="sub-gnb">
				<ul class="nopm">
					<li <% if(left_uri.equals("qnaList") || left_uri.equals("qnaForm")) { %>class="active"<% } %>><a href="/admgr/admgrCustomer/qnaList.do">상품 Q&A<span><i class="fal fa-chevron-right"></i></span></a></li>
					<li <% if(left_uri.equals("reviewList") || left_uri.equals("reviewForm")) { %>class="active"<% } %>><a href="/admgr/admgrCustomer/reviewList.do">리뷰<span><i class="fal fa-chevron-right"></i></span></a></li>
				</ul>
			</nav>
		<% } %>
		</aside>
		<!-- } 사이드 메뉴 -->
		</c:otherwise>
	</c:choose>
		