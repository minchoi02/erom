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
<%//=left_uri%>
<%-- <c:set var="Domain" value="${header.host}"/>
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
	<script>location.replace("<c:out value="${fullurlset}"/>");</script>
</c:if> --%>

<!doctype html>
<html lang="ko">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta http-equiv="imagetoolbar" content="no">
	<meta http-equiv="X-UA-Compatible" content="IE=10,chrome=1">
	<meta name="viewport" content="device-width,initial-scale=1.0,minimum-scale=0,maximum-scale=1.0,user-scalable=no">

	<meta name="keywords" content="<c:out value="${SiteBaseConfig.site_nm }"/> 관리자 모드" />
	<meta name="description" content="<c:out value="${SiteBaseConfig.site_nm }"/> 관리자 모드" />

	<meta property="og:type" content="website">
	<meta property="og:title" content="<c:out value="${SiteBaseConfig.site_nm }"/> 관리자 모드">
	<meta property="og:description" content="<c:out value="${SiteBaseConfig.site_nm }"/> 관리자 모드">
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
	
	<title><c:out value="${SiteBaseConfig.site_nm }"/> 관리자 모드</title>
	
	<link rel="stylesheet" type="text/css" href="/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="/css/jquery-ui.css">
	<link rel="stylesheet" type="text/css" href="/css/fontawesome-all.min.css">
	<link rel="stylesheet" type="text/css" href="/css/swiper.min.css">
	<link rel="stylesheet" type="text/css" href="/css/baseScmtour/base.css" />
	<link rel="stylesheet" type="text/css" href="/css/baseScmtour/admin.css" />

	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i">
	<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
	<link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=PT+Serif" rel="stylesheet">

	<script src="/js/jquery-3.3.1.min.js"></script>
	<script src="/js/jquery-ui.min.js"></script>
	<script src="/js/jquery.easing.1.3.js"></script>
	<script src="/js/bootstrap.min.js"></script>
	<script src="/js/swiper.min.js"></script>
	<script src="/js/common.js"></script>
	<script src="/js/admgr/admgr_common.js"></script>
	<script src="/js/ckeditor5/ckeditor.js"></script>
	<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
	<script src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=<c:out value="${SiteBaseConfig.sns_daum_rakey }"/>&libraries=services"></script>
</head>
<body>

<div id="wrapper">
	<!-- 상단 헤더 { -->
	<header id="header">
		<h1><a href="/admgr/admgrMain.do"><img src="/resource/img/logo2.png" alt="이롬로고" /></a></h1>
		<nav id="gnb">
			<ul class="nopm floats">
			<c:choose>
			<c:when test="${adminLevel eq '10' }">
				<li><a href="/admgr/admgrConfig/baseSetting.do" <% if(this_uri.equals("admgrConfig")) { %>class="active"<% } %>><em><i class="fal fa-cog"></i></em><span>환경설정</span></a></li>
				<li><a href="/admgr/admgrMember/memberList.do" <% if(this_uri.equals("admgrMember")) { %>class="active"<% } %>><em><i class="fal fa-users"></i></em><span>회원관리</span></a></li>
				<li><a href="/admgr/admgrStore/storeList.do" <% if(this_uri.equals("admgrStore")) { %>class="active"<% } %>><em><i class="fal fa-store"></i></em><span>상점관리</span></a></li>
				<li><a href="/admgr/admgrProduct/productList.do?store_category=CD002004" <% if(this_uri.equals("admgrProduct")) { %>class="active"<% } %>><em><i class="fal fa-box"></i></em><span>상품관리</span></a></li>
				<li><a href="/admgr/admgrOrder/orderList.do" <% if(this_uri.equals("admgrOrder")) { %>class="active"<% } %>><em><i class="fal fa-receipt"></i></em><span>주문내역</span></a></li>
				<li><a href="/admgr/admgrMarketing/mainSlide.do" <% if(this_uri.equals("admgrMarketing")) { %>class="active"<% } %>><em><i class="fal fa-gem"></i></em><span>프리미엄노출</span></a></li>
				<li><a href="/admgr/admgrCustomer/noticeList.do" <% if(this_uri.equals("admgrCustomer")) { %>class="active"<% } %>><em><i class="fal fa-user-headset"></i></em><span>고객센터</span></a></li>
				<li><a href="/admgr/admgrExtention/sms.do" <% if(this_uri.equals("admgrExtention")) { %>class="active"<% } %>><em><i class="fal fa-archive"></i></em><span>편의기능</span></a></li>
				<li><a href="/admgr/admgrStatistics/keywordList.do" <% if(this_uri.equals("admgrStatistics")) { %>class="active"<% } %>><em><i class="fal fa-analytics"></i></em><span>통계</span></a></li>
				<li><a href="/admgr/admgrSystem/cdSetting.do" <% if(this_uri.equals("admgrSystem")) { %>class="active"<% } %>><em><i class="fal fa-cogs"></i></em><span>시스템관리</span></a></li>
			</c:when>
			<c:otherwise>
				<li><a href="/admgr/admgrStore/storeList.do" <% if(this_uri.equals("admgrStore")) { %>class="active"<% } %>><em><i class="fal fa-store"></i></em><span>상점관리</span></a></li>
				<li><a href="/admgr/admgrProduct/productList.do?store_category=CD002004" <% if(this_uri.equals("admgrProduct")) { %>class="active"<% } %>><em><i class="fal fa-box"></i></em><span>상품관리</span></a></li>
				<li><a href="/admgr/admgrOrder/orderList.do" <% if(this_uri.equals("admgrOrder")) { %>class="active"<% } %>><em><i class="fal fa-receipt"></i></em><span>주문내역</span></a></li>
				<li><a href="/admgr/admgrCustomer/qnaList.do" <% if(this_uri.equals("admgrCustomer")) { %>class="active"<% } %>><em><i class="fal fa-user-headset"></i></em><span>고객센터</span></a></li>
			</c:otherwise>
			</c:choose>
			</ul>
		</nav>
		<div class="userstat">
			<span style="color: #fff;"><c:out value="${adminNm }"/>(<c:out value="${adminId}"/>)님 반갑습니다.</span>
			&nbsp;&nbsp;
			<a href="/admgr/logOut.do"><em><i class="fal fa-power-off"></i></em> <span>로그아웃</span></a>
		</div>
	</header>
	<!-- } 상단 헤더 -->
	
	<div id="container" <% if(this_uri.equals("admgrMain")) { %>class="noleftpadding"<% } %>>
	