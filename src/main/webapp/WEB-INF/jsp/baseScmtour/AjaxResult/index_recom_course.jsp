<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
							<ul class="nopm swiper-wrapper">
								<c:set var="cnt" value="1"/>
								<c:forEach var="recomTravelList" items="${recomTravelList}" varStatus="status">
								<script>
								var img_arr = new Array();
								</script>
								<c:set var="recom_start" value=""/>
								<c:set var="recom_end" value=""/>
								<c:set var="recom_start_img" value=""/>
								<c:set var="recom_end_img" value=""/>
								<c:set var="recom_middle_img" value=""/>
								<c:set var="recom_cnt" value="0"/>
								 <c:if test="${recomTravelList.recom_1_use_st eq 'Y' }">
								 	<c:set var="recom_start" value="${recomTravelList.recom_1_prod_nm }"/>
								 	<c:set var="recom_end" value="${recomTravelList.recom_1_prod_nm }"/>
							 	 	<c:set var="recom_start_img" value="${recomTravelList.recom_1_img }"/>
								 	<c:set var="recom_end_img" value="${recomTravelList.recom_1_img}"/>
								 	<c:set var="recom_cnt" value="${recom_cnt+1}"/>
								 	<script>img_arr.push('<c:out value="${recomTravelList.recom_1_img }"/>')</script>
								 </c:if>
								 <c:if test="${recomTravelList.recom_2_use_st eq 'Y' }">
								 	 <c:if test="${empty recom_start }">
								 	 	<c:set var="recom_start" value="${recomTravelList.recom_2_prod_nm }"/>
								 	 	<c:set var="recom_start_img" value="${recomTravelList.recom_2_img }"/>
								 	 </c:if>
								 	<c:set var="recom_end" value="${recomTravelList.recom_2_prod_nm }"/>
								 	<c:set var="recom_end_img" value="${recomTravelList.recom_2_img}"/>
								 	<c:set var="recom_cnt" value="${recom_cnt+1}"/>
								 	<script>img_arr.push('<c:out value="${recomTravelList.recom_2_img }"/>')</script>
								 </c:if>
								 <c:if test="${recomTravelList.recom_3_use_st eq 'Y' }">
								 	 <c:if test="${empty recom_start }">
								 	 	<c:set var="recom_start" value="${recomTravelList.recom_3_prod_nm }"/>
								 	 	<c:set var="recom_start_img" value="${recomTravelList.recom_3_img }"/>
								 	 </c:if>
								 	<c:set var="recom_end" value="${recomTravelList.recom_3_prod_nm }"/>
								 	<c:set var="recom_end_img" value="${recomTravelList.recom_3_img}"/>
								 	<c:set var="recom_cnt" value="${recom_cnt+1}"/>
								 	<script>img_arr.push('<c:out value="${recomTravelList.recom_3_img }"/>')</script>
								 </c:if>
								 <c:if test="${recomTravelList.recom_4_use_st eq 'Y' }">
								 	 <c:if test="${empty recom_start }">
								 	 	<c:set var="recom_start" value="${recomTravelList.recom_4_prod_nm }"/>
								 	 	<c:set var="recom_start_img" value="${recomTravelList.recom_4_img }"/>
								 	 </c:if>
								 	<c:set var="recom_end" value="${recomTravelList.recom_4_prod_nm }"/>
								 	<c:set var="recom_cnt" value="${recom_cnt+1}"/>
								 	<script>img_arr.push('<c:out value="${recomTravelList.recom_4_img }"/>')</script>
								 </c:if>
								 <c:if test="${recomTravelList.recom_5_use_st eq 'Y' }">
								 	 <c:if test="${empty recom_start }">
								 	 	<c:set var="recom_start" value="${recomTravelList.recom_5_prod_nm }"/>
								 	 	<c:set var="recom_start_img" value="${recomTravelList.recom_5_img }"/>
								 	 </c:if>
								 	<c:set var="recom_end" value="${recomTravelList.recom_5_prod_nm }"/>
								 	<c:set var="recom_end_img" value="${recomTravelList.recom_5_img}"/>
								 	<c:set var="recom_cnt" value="${recom_cnt+1}"/>
								 	<script>img_arr.push('<c:out value="${recomTravelList.recom_5_img }"/>')</script>
								 </c:if>
								 <c:if test="${recomTravelList.recom_6_use_st eq 'Y' }">
								 	 <c:if test="${empty recom_start }">
								 	 	<c:set var="recom_start" value="${recomTravelList.recom_6_prod_nm }"/>
								 	 	<c:set var="recom_start_img" value="${recomTravelList.recom_6_img }"/>
								 	 </c:if>
								 	<c:set var="recom_end" value="${recomTravelList.recom_6_prod_nm }"/>
								 	<c:set var="recom_end_img" value="${recomTravelList.recom_6_img}"/>
								 	<c:set var="recom_cnt" value="${recom_cnt+1}"/>
								 	<script>img_arr.push('<c:out value="${recomTravelList.recom_6_img }"/>')</script>
								 </c:if>
								 <c:if test="${recomTravelList.recom_7_use_st eq 'Y' }">
								 	 <c:if test="${empty recom_start }">
								 	 	<c:set var="recom_start" value="${recomTravelList.recom_7_prod_nm }"/>
								 	 	<c:set var="recom_start_img" value="${recomTravelList.recom_7_img }"/>
								 	 </c:if>
								 	<c:set var="recom_end" value="${recomTravelList.recom_7_prod_nm }"/>
								 	<c:set var="recom_end_img" value="${recomTravelList.recom_7_img}"/>
								 	<c:set var="recom_cnt" value="${recom_cnt+1}"/>
								 	<script>img_arr.push('<c:out value="${recomTravelList.recom_7_img }"/>')</script>
								 </c:if>
								 <c:if test="${recomTravelList.recom_8_use_st eq 'Y' }">
								 	 <c:if test="${empty recom_start }">
								 	 	<c:set var="recom_start" value="${recomTravelList.recom_8_prod_nm }"/>
								 	 	<c:set var="recom_start_img" value="${recomTravelList.recom_8_img }"/>
								 	 </c:if>
								 	<c:set var="recom_end" value="${recomTravelList.recom_8_prod_nm }"/>
								 	<c:set var="recom_end_img" value="${recomTravelList.recom_8_img}"/>
								 	<c:set var="recom_cnt" value="${recom_cnt+1}"/>
								 	<script>img_arr.push('<c:out value="${recomTravelList.recom_8_img }"/>')</script>
								 </c:if>
								 <c:if test="${recomTravelList.recom_9_use_st eq 'Y' }">
								 	 <c:if test="${empty recom_start }">
								 	 	<c:set var="recom_start" value="${recomTravelList.recom_9_prod_nm }"/>
								 	 	<c:set var="recom_start_img" value="${recomTravelList.recom_9_img }"/>
								 	 </c:if>
								 	<c:set var="recom_end" value="${recomTravelList.recom_9_prod_nm }"/>
								 	<c:set var="recom_end_img" value="${recomTravelList.recom_9_img}"/>
								 	<c:set var="recom_cnt" value="${recom_cnt+1}"/>
								 	<script>img_arr.push('<c:out value="${recomTravelList.recom_9_img }"/>')</script>
								 </c:if>
								 <c:if test="${recomTravelList.recom_10_use_st eq 'Y' }">
								 	 <c:if test="${empty recom_start }">
								 	 	<c:set var="recom_start" value="${recomTravelList.recom_10_prod_nm }"/>
								 	 	<c:set var="recom_start_img" value="${recomTravelList.recom_10_img }"/>
								 	 </c:if>
								 	<c:set var="recom_end" value="${recomTravelList.recom_10_prod_nm }"/>
								 	<c:set var="recom_end_img" value="${recomTravelList.recom_10_img}"/>
								 	<c:set var="recom_cnt" value="${recom_cnt+1}"/>
								 	<script>img_arr.push('<c:out value="${recomTravelList.recom_10_img }"/>')</script>
								 </c:if>
								<li class="swiper-slide">
									<a href="/shop/itemView.do?store_category=CD002005&prod_id=<c:out value="${recomTravelList.prod_id }"/>">
										<strong class="tit" ><c:out value="${recomTravelList.prod_nm }"/></strong>
										<span class="subtxt"><c:out value="${recomTravelList.prod_comment}"/></span>
										<em class="tourgraph">
											<span class="won wonleft" style="display: block; overflow:hidden; text-overflow:ellipsis; white-space:nowrap;"><c:out value="${recom_start }"/></span>
											<span class="toursize">경유 <c:out value="${recom_cnt-2}"/>+</span>
											<span class="won wonright" style="overflow:hidden; text-overflow:ellipsis; white-space:nowrap;"><c:out value="${recom_end}"/></span>
										</em>
									</a>
									<ul class="nopm floats rpic rpic3">
										<li><a href="/shop/itemView.do?store_category=CD002005&prod_id=<c:out value="${recomTravelList.prod_id }"/>"><img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${recom_start_img}"/>&fileSn=0" style="width: 100%;" onerror="this.src='/images/baseScmtour/_noImage.png';"/></a></li>
										<li><a href="/shop/itemView.do?store_category=CD002005&prod_id=<c:out value="${recomTravelList.prod_id }"/>" id="middle_img_<c:out value="${cnt}"/>"></a></li>
										<li><a href="/shop/itemView.do?store_category=CD002005&prod_id=<c:out value="${recomTravelList.prod_id }"/>"><img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${recom_end_img}"/>&fileSn=0" style="width: 100%;" onerror="this.src='/images/baseScmtour/_noImage.png';"/></a></a></li>
									</ul>
									<script>
									var rand_start_num = 1;
									var rand_end_num = img_arr.length-2;
									var rand_num = Math.floor(Math.random()*rand_end_num) + rand_start_num;
									var middle_img_tag = "<img src=\"/cmm/fms/getImage.do?atchFileId="+img_arr[rand_num]+"&fileSn=0\" onerror=\"this.src='/images/baseScmtour/_noImage.png';\"/>";
									$("#middle_img_<c:out value="${cnt}"/>").html(middle_img_tag);
									</script>
								</li>
								<c:set var="cnt" value="${cnt+1 }"/>
								</c:forEach>
							</ul>
							<div class="swiper-pagination"></div>
							<script>
								// 메인 슬라이드
								var swiper = new Swiper('.bestslide', {
									//centeredSlides: true,
									slidesPerView: 'auto',
									spaceBetween: 15,
									//loop: true,
									pagination: {
										el: '.swiper-pagination',
									},
								});
							</script>