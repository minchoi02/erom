<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
						<c:if test="${not empty promotionList}">
						<h2 class="mainTit alignCenter"><em>프로모션</em></h2>
						<div class="main-promotion main-slide2 swiper-container">
							<ul class="nopm swiper-wrapper">
								<c:forEach var="promotionList" items="${promotionList}" varStatus="status">
								<li class="swiper-slide">
									<a href="/shop/promotionView.do?bbs_seq=<c:out value="${promotionList.bbs_seq}"/>" class="pic">/<img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${promotionList.bbs_file1}"/>&fileSn=0" style="width: 100%;" onerror="this.src='/images/baseScmtour/noimg_400.png';"/></a>
									<a href="/shop/promotionView.do?bbs_seq=<c:out value="${promotionList.bbs_seq}"/>" class="txt">
										<em><c:out value="${promotionList.bbs_subject}"/></em>
										<span><c:out value="${fn:substring(promotionList.bbs_st_dt , 2 , 10) }"/> ~ <c:out value="${fn:substring(promotionList.bbs_ed_dt , 2 , 10) }"/></span>
									</a>
								</li>
								</c:forEach>
							</ul>
							<script>
								// 메인 슬라이드
								var swiper2 = new Swiper('.main-slide2', {
									slidesPerView: 'auto',
									spaceBetween: 15,
									//loop: true,
									freeMode: true,
								});
							</script>
						</div>
						</c:if>