<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
							<ul class="nopm swiper-wrapper">
								<c:forEach var="weekList2" items="${weekList2}" varStatus="status">
								<li class="swiper-slide">
									<a href="/shop/itemView.do?store_category=CD002002&prod_id=<c:out value="${weekList2.prod_id}"/>" class="pic"><img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${weekList2.prod_img_1}"/>&fileSn=0" style="width: 100%;" onerror="this.src='/images/baseScmtour/noimg_615.png';"/></a>
									<a href="/shop/itemView.do?store_category=CD002002&prod_id=<c:out value="${weekList2.prod_id}"/>" class="txt">
										<em class="subject"><c:out value="${weekList2.prod_nm}"/></em>
										<span class="loca"><c:out value="${weekList2.store_nm}"/></span>
										<span class="goodnum"><b class="colorOrange"><i class="fas fa-heart"></i></b> <fmt:formatNumber value="${weekList2.prod_hit_cnt}" type="number"/></span>
									</a>
								</li>
								</c:forEach>
							</ul>
							<script>
								// 메인 슬라이드
								var swiper5 = new Swiper('.main-slide5', {
									slidesPerView: 'auto',
									spaceBetween: 8,
									//loop: true,
								});
							</script>
