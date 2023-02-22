<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
<%//=this_uri%>
<%//=left_uri%>

<c:set var="OrgFullUrl" value="<%= request.getRequestURL() %>" />
<c:set var="this_url" value="<%=this_uri%>" />
<c:set var="left_uri" value="<%=left_uri%>" />
<c:if test="${this_url eq 'index'}">
	<c:set var="headerType" value="index" />
</c:if>
<c:if test="${left_uri eq 'more' || left_uri eq 'payment' || left_uri eq 'cart' || left_uri eq 'favorite'   || left_uri eq 'orderReserveList'  || left_uri eq 'orderMarketList'  || left_uri eq 'favoriteReserveList'  || left_uri eq 'favoriteMarketList'  || left_uri eq 'modify'  || left_uri eq 'withdraw' || left_uri eq 'orderList' || left_uri eq 'orderDetail'  }">
	<c:set var="headerType" value="morePage" />
</c:if>
<c:if test="${left_uri eq 'promotionList' || left_uri eq 'promotionView'  }">
	<c:set var="headerType" value="subHeader" />
	<c:choose>
		<c:when test="${left_uri eq 'promotionList' || left_uri eq 'promotionView' }">
			<c:set var="headerName" value="프로모션/이벤트"/>
		</c:when>
		<c:otherwise></c:otherwise>
	</c:choose>
</c:if> 
<c:if test="${this_url eq 'baseBoard' || this_url eq 'baseBoard' || left_uri eq 'perRule' || left_uri eq 'siteRule'  }">
	<c:set var="headerType" value="subHeader" />
	<c:choose>
		<c:when test="${param.bd_id eq 'NOTICE' }">
			<c:set var="headerName" value="공지사항"/>
		</c:when>
		<c:when test="${param.bd_id eq 'MTM' }">
			<c:set var="headerName" value="1:1 문의"/>
		</c:when>
		<c:when test="${param.bd_id eq 'MTM' }">
			<c:set var="headerName" value="1:1 문의"/>
		</c:when>
		<c:when test="${left_uri eq 'perRule' }">
			<c:set var="headerName" value="개인정보 취급방침"/>
		</c:when>
		<c:when test="${left_uri eq 'siteRule' }">
			<c:set var="headerName" value="이용약관"/>
		</c:when>
		<c:otherwise></c:otherwise>
	</c:choose>
</c:if> 

<c:set var="Domain" value="${header.host}"/>
<c:set var="doURI" value="${requestScope['javax.servlet.forward.servlet_path']}" /> 
<c:set var="qsURI" value="${pageContext.request.queryString}" /> 
<c:set var="URI" value="${doURI }"/>
<c:if test="${not empty qsURI}">
	<c:set var="URI" value="${doURI }?${qsURI }"/>
</c:if>
<c:if test="${Domain.indexOf('www.') eq '-1' }">
	<c:set var="Domain" value="www.${Domain }"/>
	<c:set var="fullurlset" value="https://${Domain }${doURI }"/>
	<c:if test="${not empty qsURI}">
		<c:set var="fullurlset" value="https://${Domain }${doURI }?${qsURI }"/>
	</c:if>
	<!-- <script>location.replace("<c:out value="${fullurlset}"/>");</script> -->
</c:if>

<!doctype html>
<html lang="ko">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta http-equiv="imagetoolbar" content="no">
	<meta http-equiv="X-UA-Compatible" content="IE=10,chrome=1">
	<meta name="format-detection" content="telephone=no" />
	<meta name="viewport" content="device-width,initial-scale=1.0,minimum-scale=0,maximum-scale=1.0,user-scalable=no">

	<meta name="keywords" content="서천 끌림 관리자 모드" />
	<meta name="description" content="서천 끌림 관리자 모드" />

	<meta property="og:type" content="website">
	<meta property="og:title" content="서천 끌림 관리자 모드">
	<meta property="og:description" content="서천 끌림 관리자 모드">
	<meta property="og:image" content="/images/baseScmtour/scm_visual.png">
	<meta property="og:url" content="//www.scmtour.com/">
	<meta property="og:image:width" content="600" />
	<meta property="og:image:height" content="400" />

	<link rel="apple-touch-icon-precomposed" sizes="57x57" href="/images/baseScmtour/favicomatic/apple-touch-icon-57x57.png" />
	<link rel="apple-touch-icon-precomposed" sizes="114x114" href="/images/baseScmtour/favicomatic/apple-touch-icon-114x114.png" />
	<link rel="apple-touch-icon-precomposed" sizes="72x72" href="/images/baseScmtour/favicomatic/apple-touch-icon-72x72.png" />
	<link rel="apple-touch-icon-precomposed" sizes="144x144" href="/images/baseScmtour/favicomatic/apple-touch-icon-144x144.png" />
	<link rel="apple-touch-icon-precomposed" sizes="60x60" href="/images/baseScmtour/favicomatic/apple-touch-icon-60x60.png" />
	<link rel="apple-touch-icon-precomposed" sizes="120x120" href="/images/baseScmtour/favicomatic/apple-touch-icon-120x120.png" />
	<link rel="apple-touch-icon-precomposed" sizes="76x76" href="/images/baseScmtour/favicomatic/apple-touch-icon-76x76.png" />
	<link rel="apple-touch-icon-precomposed" sizes="152x152" href="/images/baseScmtour/favicomatic/apple-touch-icon-152x152.png" />
	<link rel="icon" type="image/png" href="/images/baseScmtour/favicomatic/favicon-196x196.png" sizes="196x196" />
	<link rel="icon" type="image/png" href="/images/baseScmtour/favicomatic/favicon-96x96.png" sizes="96x96" />
	<link rel="icon" type="image/png" href="/images/baseScmtour/favicomatic/favicon-32x32.png" sizes="32x32" />
	<link rel="icon" type="image/png" href="/images/baseScmtour/favicomatic/favicon-16x16.png" sizes="16x16" />
	<link rel="icon" type="image/png" href="/images/baseScmtour/favicomatic/favicon-128.png" sizes="128x128" />
	<meta name="application-name" content="&nbsp;"/>
	<meta name="msapplication-TileColor" content="#FFFFFF" />
	<meta name="msapplication-TileImage" content="/images/baseScmtour/favicomatic/mstile-144x144.png" />
	<meta name="msapplication-square70x70logo" content="/images/baseScmtour/favicomatic/mstile-70x70.png" />
	<meta name="msapplication-square150x150logo" content="/images/baseScmtour/favicomatic/mstile-150x150.png" />
	<meta name="msapplication-wide310x150logo" content="/images/baseScmtour/favicomatic/mstile-310x150.png" />
	<meta name="msapplication-square310x310logo" content="/images/baseScmtour/favicomatic/mstile-310x310.png" />
	
	<title>서천 끌림</title>
	
	<link rel="stylesheet" type="text/css" href="/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="/css/jquery-ui.css">
	<link rel="stylesheet" type="text/css" href="/css/fontawesome-all.min.css">
	<link rel="stylesheet" type="text/css" href="/css/swiper.min.css">
	<link rel="stylesheet" type="text/css" href="/css/baseScmtour/base.css" />
	<link rel="stylesheet" type="text/css" href="/css/baseScmtour/default.css" />

	<script src="/js/jquery-3.3.1.min.js"></script>
	<script src="/js/jquery-ui.min.js"></script>
	<script src="/js/jquery.easing.1.3.js"></script>
	<script src="/js/bootstrap.min.js"></script>
	<script src="/js/swiper.min.js"></script>
	<script src="/js/common.js"></script>
	<script src="/js/scmTour/common.js"></script>
	<script src="/js/ckeditor5/ckeditor.js"></script>
	<script src="/js/scmTour/default.js"></script>

	<c:if test="${left_uri eq 'itemView' || left_uri eq 'itemReView'}">
	<script src="https://code.highcharts.com/highcharts.js"></script>
	<script src="https://code.highcharts.com/highcharts-more.js"></script>
	<script src="https://code.highcharts.com/modules/exporting.js"></script>
	</c:if>	
	<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
	<script src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=<c:out value="${SiteBaseConfig.sns_daum_rakey }"/>&libraries=services"></script>

</head>
<body>

<c:set var="markettoparea" value=""/>
<c:if test="${store_category eq 'CD002004'}">
<c:set var="markettoparea" value="market"/>
</c:if>
<div id="wrapper" class="<c:out value="${markettoparea }"/> ">
	<c:if test="${headerType eq 'index' }">
	<!-- 메인페이지 상단 헤더 { -->
	<header id="header" class="indexpage">
		<h1><a href="/"><img src="/images/baseScmtour/logo.png" alt="끌림로고" height="30" /></a></h1>
		<div class="search_userbox">
			<ul class="nopm floats">
				<%-- user_id = ${user_id}, <%=session.getId()%> --%>
				<li><a href="/search/search.do" class="subtn searchbtn"><i class="far fa-search"></i><span class="sound_only">검색 버튼</span></a></li>
				<c:choose>
				<c:when test="${empty user_id }">
				<li><a href="/member/joinLogin.do" class="subtn userbtn"><i class="far fa-lock-alt"></i><span class="sound_only">로그인 버튼</span></a></li>
				</c:when>
				<c:otherwise>
				<li><a href="/shop/more.do" class="subtn userbtn"><i class="fas fa-sign-in-alt"></i> <i class="fas fa-sign-out-alt"></i><span class="sound_only">로그인 버튼</span></a></li>
				</c:otherwise>
				</c:choose>
			</ul>
		</div>
	</header>
	<!-- } 메인페이지 상단 헤더 -->
	</c:if>

	<c:if test="${headerType eq 'morePage' }">
	<!-- 더보기 상단 헤더 { -->
	<header id="header" class="morepage bgOrangeGra">
		<a href="javascript:history.back();" class="backbtn colorOrange"><i class="fal fa-arrow-left"></i></a>
	<c:choose>
		<c:when test="${not empty user_id }">
			<div class="my_mileage"><small>내 마일리지</small> <strong><fmt:formatNumber value="${memberInfo.user_total_mileage}" type="number"/></strong> P</div>
		</c:when>
		<c:otherwise>
			<div class="my_mileage"><small>내 마일리지</small> <strong>0</strong> P</div>
		</c:otherwise>
	</c:choose>
		<div class="alink">
		<c:choose>
			<c:when test="${not empty user_id }">
			<a href="/shop/cart.do" class="btns whitebtn"><span class="colorOrange"><i class="fal fa-shopping-cart"></i></span> 장바구니</a>
			<a href="/mypage/favoriteReserveList.do" class="btns whitebtn"><span class="colorOrange"><i class="fal fa-plus-circle"></i></span> 찜한상품</a>
			</c:when>
			<c:otherwise>
			<a href="javascript:getLogin('/shop/cart.do');" class="btns whitebtn"><span class="colorOrange"><i class="fal fa-shopping-cart"></i></span> 장바구니</a>
			<a href="javascript:getLogin('/mypage/favoriteReserveList.do');" class="btns whitebtn"><span class="colorOrange"><i class="fal fa-plus-circle"></i></span> 찜한상품</a>
			</c:otherwise>
		</c:choose>
		</div>
	</header>
	<!-- } 더보기 상단 헤더 -->
	</c:if>

	<c:if test="${headerType eq 'subHeader' }">
	<!-- 일반 상단 헤더 { -->
	<header id="header" class="subpage">
		<a href="javascript:history.back();" class="backbtn"><i class="fal fa-arrow-left"></i></a>
		<h1><c:out value="${headerName}"/></h1>
	</header>
	<!-- } 일반 상단 헤더 -->
	</c:if>
 
	<div id="container">
	<input type="hidden" id="site_return_url" value="<c:out value="${URI}"/>" />