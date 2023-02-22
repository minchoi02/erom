<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:import url="/Api/admgrIncludeTop.do"/>
<c:import url="/Api/admgrIncludeLeftMenu.do"/>

<c:set var="stat_ment" value="등록"/>
<c:if test="${not empty mailInfo.mail_seq}">
	<c:set var="stat_ment" value="수정"/>
</c:if>

		<!-- 콘텐츠 영역 { -->
		<div id="content">
			<h1 class="bigTit">메일발송 - 작업대기</h1>
			<div class="pageComment">
				<div class="comment_ico"><i class="fad fa-comment-alt-smile"></i></div>
				<p>
					작업대기
				</p>
			</div>
		</div>

<c:import url="/Api/admgrIncludeBottom.do"/>