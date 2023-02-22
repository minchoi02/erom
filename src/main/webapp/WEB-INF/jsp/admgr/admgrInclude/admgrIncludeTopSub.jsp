<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<% 
response.setHeader("pragma", "no-cache");              
response.setHeader("Cache-control", "no-cache, no-store, must-revalidate");             
response.setHeader("Expires", "0"); 
%>
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

	<script src="/js/jquery-3.3.1.min.js"></script>
	<script src="/js/jquery-ui.min.js"></script>
	<script src="/js/jquery.easing.1.3.js"></script>
	<script src="/js/bootstrap.min.js"></script>
	<script src="/js/swiper.min.js"></script>
	<script src="/js/common.js"></script>
	<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
	<script src="/js/admgr/admgr_common.js"></script>
	<script src="/js/ckeditor5/ckeditor.js"></script>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=<c:out value="${SiteBaseConfig.sns_daum_jskey }"/>&libraries=services"></script>
</head>
<body>