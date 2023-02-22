<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
			<ul class="swiper-wrapper nopm">
				<c:forEach var="mainSlideList" items="${mainSlideList}" varStatus="status">
				<li class="swiper-slide"><a href="<c:out value="${mainSlideList.slide_link}"/>" target="<c:out value="${mainSlideList.slide_target}"/>"><img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${mainSlideList.slide_img}"/>&fileSn=0"  onerror="this.src='/images/baseScmtour/_noImage.png';"/></a></li>
				</c:forEach>
			</ul>
			<div class="swiper-pagination"></div>
			<script>
				var swiper = new Swiper('#mainSlide', {
					//loop: true,
					autoplay: {
						delay: 5000,
						disableOnInteraction: false,
					},
					pagination: {
						el: '.swiper-pagination',
						dynamicBullets: true,
					},
				});
			</script>