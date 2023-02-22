<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="doURI" value="${requestScope['javax.servlet.forward.servlet_path']}" /> 
<c:set var="qsURI" value="${pageContext.request.queryString}" /> 
<c:set var="URI" value="${doURI }"/>
<c:if test="${not empty qsURI}">
	<c:set var="URI" value="${doURI }?${qsURI }"/>
</c:if>

<c:set var="headerType" value="subHeader" />
<c:set var="headerName" value="프로모션/이벤트" />
<c:import url="/Api/IncludeTop.do"/>

	<!-- 프로모션/이벤트 뷰 { -->
	<section id="boardView">
		<article id="boardViewCon">
			<div class="promotion_top_img"><img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${promotionInfo.bbs_file1}"/>&fileSn=0" style="width: 100%;" onerror="this.src='/images/baseScmtour/_noImage.png';"/></div>
			<div class="board_view_top">
				<h2><c:out value="${promotionInfo.bbs_subject}"/></h2>
				<%--
				<div class="writercon">
					<span class="writer"><c:out value="${promotionInfo.bbs_writer_nm}"/></span>
					<span class="date"><i class="far fa-clock"></i> <c:out value="${promotionInfo.reg_dt_ymd}"/></span>
					<span class="num"><i class="far fa-eye"></i> <fmt:formatNumber value="${TotalCnt}" type="number"/></span>
				</div>
				 --%>
			</div>
			<%--
			<div class="board_view_con">
				여기에서 글을 볼 수 있습니다.<br />
				<img src="/images/baseScmtour/sample_viewcon.png" alt="" />
			</div>
			 --%>
			<div class="promotion_coupon">
				<div id="ticketbox">
					<ul class="nopm">
						<c:if test="${not empty cp_1 }">
						<c:choose>
							<c:when test="${cp_1.coupon_set_st eq 'P' }"><c:set var="cp_unit" value="%"/></c:when>
							<c:otherwise><c:set var="cp_unit" value="원"/></c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${cp_1.coupon_use_status eq 'E' }">
								<c:set var="cp_down_link" value="alert('다운로드 기간이 종료되었습니다.'); return false; "/>
								<c:set var="cp_down_ment" value="쿠폰 다운로드 종료"/>
							</c:when>
							<c:otherwise>
								<c:choose>
									<c:when test="${not empty user_id }">
										<c:choose>
											<c:when test="${cp_1.coupon_have_status eq 'N' }">									
												<c:set var="cp_down_link" value="coupon('${cp_1.coupon_id }'); "/>
												<c:set var="cp_down_ment" value="쿠폰 다운로드"/>
											</c:when>
											<c:otherwise>									
												<c:set var="cp_down_link" value="alert('이미 다운로드 되었습니다'); return false; "/>
												<c:set var="cp_down_ment" value="쿠폰 다운로드 완료"/>
											</c:otherwise>
										</c:choose>
									</c:when>
									<c:otherwise>
										<c:set var="cp_down_link" value="getLogin('${URI }')"/>
										<c:set var="cp_down_ment" value="쿠폰 다운로드"/>
									</c:otherwise>
								</c:choose>
							</c:otherwise>
						</c:choose>
						<li>
							<div class="ticket_con">
								<span class="ticket"><i class="fal fa-ticket-alt"></i></span>
								<strong><c:out value="${cp_1.store_category_nm }"/> <fmt:formatNumber value="${cp_1.coupon_set_price}" type="number"/><c:out value="${cp_unit}"/> 할인 쿠폰</strong>
								<span class="date">사용기간 : <c:out value="${cp_1.coupon_st_dt_ymd}"/> ~ <c:out value="${cp_1.coupon_ed_dt_ymd}"/></span>
								<%--
								<span class="usecoupon">사용처 : 다옴리조트</span>
								 --%>
								<a href="#" onclick="<c:out value="${cp_down_link}"/>" class="on"><c:out value="${cp_down_ment }"/></a>
							</div>
						</li>
					</c:if>
					<c:if test="${not empty cp_2 }">
						<c:choose>
							<c:when test="${cp_2.coupon_set_st eq 'P' }"><c:set var="cp_unit" value="%"/></c:when>
							<c:otherwise><c:set var="cp_unit" value="원"/></c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${cp_2.coupon_use_status eq 'E' }">
								<c:set var="cp_down_link" value="alert('다운로드 기간이 종료되었습니다.'); return false; "/>
								<c:set var="cp_down_ment" value="쿠폰 다운로드 종료"/>
							</c:when>
							<c:otherwise>
								<c:choose>
									<c:when test="${not empty user_id }">
										<c:choose>
											<c:when test="${cp_2.coupon_have_status eq 'N' }">									
												<c:set var="cp_down_link" value="coupon('${cp_2.coupon_id }'); "/>
												<c:set var="cp_down_ment" value="쿠폰 다운로드"/>
											</c:when>
											<c:otherwise>									
												<c:set var="cp_down_link" value="alert('이미 다운로드 되었습니다'); return false; "/>
												<c:set var="cp_down_ment" value="쿠폰 다운로드 완료"/>
											</c:otherwise>
										</c:choose>
									</c:when>
									<c:otherwise>
										<c:set var="cp_down_link" value="getLogin('${URI }')"/>
										<c:set var="cp_down_ment" value="쿠폰 다운로드"/>
									</c:otherwise>
								</c:choose>
							</c:otherwise>
						</c:choose>
						<li>
							<div class="ticket_con">
								<span class="ticket"><i class="fal fa-ticket-alt"></i></span>
								<strong><c:out value="${cp_2.store_category_nm }"/> <fmt:formatNumber value="${cp_2.coupon_set_price}" type="number"/><c:out value="${cp_unit}"/> 할인 쿠폰</strong>
								<span class="date">사용기간 : <c:out value="${cp_2.coupon_st_dt_ymd}"/> ~ <c:out value="${cp_2.coupon_ed_dt_ymd}"/></span>
								<%--
								<span class="usecoupon">사용처 : 다옴리조트</span>
								 --%>
								<a href="#" onclick="<c:out value="${cp_down_link}"/>" class="on"><c:out value="${cp_down_ment }"/></a>
							</div>
						</li>
					</c:if>						
					<c:if test="${not empty cp_3 }">
						<c:choose>
							<c:when test="${cp_3.coupon_set_st eq 'P' }"><c:set var="cp_unit" value="%"/></c:when>
							<c:otherwise><c:set var="cp_unit" value="원"/></c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${cp_3.coupon_use_status eq 'E' }">
								<c:set var="cp_down_link" value="alert('다운로드 기간이 종료되었습니다.'); return false; "/>
								<c:set var="cp_down_ment" value="쿠폰 다운로드 종료"/>
							</c:when>
							<c:otherwise>
								<c:choose>
									<c:when test="${not empty user_id }">
										<c:choose>
											<c:when test="${cp_3.coupon_have_status eq 'N' }">									
												<c:set var="cp_down_link" value="coupon('${cp_3.coupon_id }'); "/>
												<c:set var="cp_down_ment" value="쿠폰 다운로드"/>
											</c:when>
											<c:otherwise>									
												<c:set var="cp_down_link" value="alert('이미 다운로드 되었습니다'); return false; "/>
												<c:set var="cp_down_ment" value="쿠폰 다운로드 완료"/>
											</c:otherwise>
										</c:choose>
									</c:when>
									<c:otherwise>
										<c:set var="cp_down_link" value="getLogin('${URI }')"/>
										<c:set var="cp_down_ment" value="쿠폰 다운로드"/>
									</c:otherwise>
								</c:choose>
							</c:otherwise>
						</c:choose>
						<li>
							<div class="ticket_con">
								<span class="ticket"><i class="fal fa-ticket-alt"></i></span>
								<strong><c:out value="${cp_3.store_category_nm }"/> <fmt:formatNumber value="${cp_3.coupon_set_price}" type="number"/><c:out value="${cp_unit}"/> 할인 쿠폰</strong>
								<span class="date">사용기간 : <c:out value="${cp_3.coupon_st_dt_ymd}"/> ~ <c:out value="${cp_3.coupon_ed_dt_ymd}"/></span>
								<%--
								<span class="usecoupon">사용처 : 다옴리조트</span>
								 --%>
								<a href="#" onclick="<c:out value="${cp_down_link}"/>" class="on"><c:out value="${cp_down_ment }"/></a>
							</div>
						</li>
					</c:if>		
					<c:if test="${not empty cp_4 }">
						<c:choose>
							<c:when test="${cp_4.coupon_set_st eq 'P' }"><c:set var="cp_unit" value="%"/></c:when>
							<c:otherwise><c:set var="cp_unit" value="원"/></c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${cp_4.coupon_use_status eq 'E' }">
								<c:set var="cp_down_link" value="alert('다운로드 기간이 종료되었습니다.'); return false; "/>
								<c:set var="cp_down_ment" value="쿠폰 다운로드 종료"/>
							</c:when>
							<c:otherwise>
								<c:choose>
									<c:when test="${not empty user_id }">
										<c:choose>
											<c:when test="${cp_4.coupon_have_status eq 'N' }">									
												<c:set var="cp_down_link" value="coupon('${cp_4.coupon_id }'); "/>
												<c:set var="cp_down_ment" value="쿠폰 다운로드"/>
											</c:when>
											<c:otherwise>									
												<c:set var="cp_down_link" value="alert('이미 다운로드 되었습니다'); return false; "/>
												<c:set var="cp_down_ment" value="쿠폰 다운로드 완료"/>
											</c:otherwise>
										</c:choose>
									</c:when>
									<c:otherwise>
										<c:set var="cp_down_link" value="getLogin('${URI }')"/>
										<c:set var="cp_down_ment" value="쿠폰 다운로드"/>
									</c:otherwise>
								</c:choose>
							</c:otherwise>
						</c:choose>
						<li>
							<div class="ticket_con">
								<span class="ticket"><i class="fal fa-ticket-alt"></i></span>
								<strong><c:out value="${cp_4.store_category_nm }"/> <fmt:formatNumber value="${cp_4.coupon_set_price}" type="number"/><c:out value="${cp_unit}"/> 할인 쿠폰</strong>
								<span class="date">사용기간 : <c:out value="${cp_4.coupon_st_dt_ymd}"/> ~ <c:out value="${cp_4.coupon_ed_dt_ymd}"/></span>
								<%--
								<span class="usecoupon">사용처 : 다옴리조트</span>
								 --%>
								<a href="#" onclick="<c:out value="${cp_down_link}"/>" class="on"><c:out value="${cp_down_ment }"/></a>
							</div>
						</li>
					</c:if>
					<c:if test="${not empty cp_5 }">
						<c:choose>
							<c:when test="${cp_5.coupon_set_st eq 'P' }"><c:set var="cp_unit" value="%"/></c:when>
							<c:otherwise><c:set var="cp_unit" value="원"/></c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${cp_5.coupon_use_status eq 'E' }">
								<c:set var="cp_down_link" value="alert('다운로드 기간이 종료되었습니다.'); return false; "/>
								<c:set var="cp_down_ment" value="쿠폰 다운로드 종료"/>
							</c:when>
							<c:otherwise>
								<c:choose>
									<c:when test="${not empty user_id }">
										<c:choose>
											<c:when test="${cp_5.coupon_have_status eq 'N' }">									
												<c:set var="cp_down_link" value="coupon('${cp_5.coupon_id }'); "/>
												<c:set var="cp_down_ment" value="쿠폰 다운로드"/>
											</c:when>
											<c:otherwise>									
												<c:set var="cp_down_link" value="alert('이미 다운로드 되었습니다'); return false; "/>
												<c:set var="cp_down_ment" value="쿠폰 다운로드 완료"/>
											</c:otherwise>
										</c:choose>
									</c:when>
									<c:otherwise>
										<c:set var="cp_down_link" value="getLogin('${URI }')"/>
										<c:set var="cp_down_ment" value="쿠폰 다운로드"/>
									</c:otherwise>
								</c:choose>
							</c:otherwise>
						</c:choose>
						<li>
							<div class="ticket_con">
								<span class="ticket"><i class="fal fa-ticket-alt"></i></span>
								<strong><c:out value="${cp_5.store_category_nm }"/> <fmt:formatNumber value="${cp_5.coupon_set_price}" type="number"/><c:out value="${cp_unit}"/> 할인 쿠폰</strong>
								<span class="date">사용기간 : <c:out value="${cp_5.coupon_st_dt_ymd}"/> ~ <c:out value="${cp_5.coupon_ed_dt_ymd}"/></span>
								<%--
								<span class="usecoupon">사용처 : 다옴리조트</span>
								 --%>
								<a href="#" onclick="<c:out value="${cp_down_link}"/>" class="on"><c:out value="${cp_down_ment }"/></a>
							</div>
						</li>
					</c:if>
					<c:if test="${not empty cp_6 }">
						<c:choose>
							<c:when test="${cp_6.coupon_set_st eq 'P' }"><c:set var="cp_unit" value="%"/></c:when>
							<c:otherwise><c:set var="cp_unit" value="원"/></c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${cp_6.coupon_use_status eq 'E' }">
								<c:set var="cp_down_link" value="alert('다운로드 기간이 종료되었습니다.'); return false; "/>
								<c:set var="cp_down_ment" value="쿠폰 다운로드 종료"/>
							</c:when>
							<c:otherwise>
								<c:choose>
									<c:when test="${not empty user_id }">
										<c:choose>
											<c:when test="${cp_6.coupon_have_status eq 'N' }">									
												<c:set var="cp_down_link" value="coupon('${cp_6.coupon_id }'); "/>
												<c:set var="cp_down_ment" value="쿠폰 다운로드"/>
											</c:when>
											<c:otherwise>									
												<c:set var="cp_down_link" value="alert('이미 다운로드 되었습니다'); return false; "/>
												<c:set var="cp_down_ment" value="쿠폰 다운로드 완료"/>
											</c:otherwise>
										</c:choose>
									</c:when>
									<c:otherwise>
										<c:set var="cp_down_link" value="getLogin('${URI }')"/>
										<c:set var="cp_down_ment" value="쿠폰 다운로드"/>
									</c:otherwise>
								</c:choose>
							</c:otherwise>
						</c:choose>
						<li>
							<div class="ticket_con">
								<span class="ticket"><i class="fal fa-ticket-alt"></i></span>
								<strong><c:out value="${cp_6.store_category_nm }"/> <fmt:formatNumber value="${cp_6.coupon_set_price}" type="number"/><c:out value="${cp_unit}"/> 할인 쿠폰</strong>
								<span class="date">사용기간 : <c:out value="${cp_6.coupon_st_dt_ymd}"/> ~ <c:out value="${cp_6.coupon_ed_dt_ymd}"/></span>
								<%--
								<span class="usecoupon">사용처 : 다옴리조트</span>
								 --%>
								<a href="#" onclick="<c:out value="${cp_down_link}"/>" class="on"><c:out value="${cp_down_ment }"/></a>
							</div>
						</li>
					</c:if>					
					<c:if test="${not empty cp_7 }">
						<c:choose>
							<c:when test="${cp_7.coupon_set_st eq 'P' }"><c:set var="cp_unit" value="%"/></c:when>
							<c:otherwise><c:set var="cp_unit" value="원"/></c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${cp_7.coupon_use_status eq 'E' }">
								<c:set var="cp_down_link" value="alert('다운로드 기간이 종료되었습니다.'); return false; "/>
								<c:set var="cp_down_ment" value="쿠폰 다운로드 종료"/>
							</c:when>
							<c:otherwise>
								<c:choose>
									<c:when test="${not empty user_id }">
										<c:choose>
											<c:when test="${cp_7.coupon_have_status eq 'N' }">									
												<c:set var="cp_down_link" value="coupon('${cp_7.coupon_id }'); "/>
												<c:set var="cp_down_ment" value="쿠폰 다운로드"/>
											</c:when>
											<c:otherwise>									
												<c:set var="cp_down_link" value="alert('이미 다운로드 되었습니다'); return false; "/>
												<c:set var="cp_down_ment" value="쿠폰 다운로드 완료"/>
											</c:otherwise>
										</c:choose>
									</c:when>
									<c:otherwise>
										<c:set var="cp_down_link" value="getLogin('${URI }')"/>
										<c:set var="cp_down_ment" value="쿠폰 다운로드"/>
									</c:otherwise>
								</c:choose>
							</c:otherwise>
						</c:choose>
						<li>
							<div class="ticket_con">
								<span class="ticket"><i class="fal fa-ticket-alt"></i></span>
								<strong><c:out value="${cp_7.store_category_nm }"/> <fmt:formatNumber value="${cp_7.coupon_set_price}" type="number"/><c:out value="${cp_unit}"/> 할인 쿠폰</strong>
								<span class="date">사용기간 : <c:out value="${cp_7.coupon_st_dt_ymd}"/> ~ <c:out value="${cp_7.coupon_ed_dt_ymd}"/></span>
								<%--
								<span class="usecoupon">사용처 : 다옴리조트</span>
								 --%>
								<a href="#" onclick="<c:out value="${cp_down_link}"/>" class="on"><c:out value="${cp_down_ment }"/></a>
							</div>
						</li>
					</c:if>					
					<c:if test="${not empty cp_8 }">
						<c:choose>
							<c:when test="${cp_8.coupon_set_st eq 'P' }"><c:set var="cp_unit" value="%"/></c:when>
							<c:otherwise><c:set var="cp_unit" value="원"/></c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${cp_8.coupon_use_status eq 'E' }">
								<c:set var="cp_down_link" value="alert('다운로드 기간이 종료되었습니다.'); return false; "/>
								<c:set var="cp_down_ment" value="쿠폰 다운로드 종료"/>
							</c:when>
							<c:otherwise>
								<c:choose>
									<c:when test="${not empty user_id }">
										<c:choose>
											<c:when test="${cp_8.coupon_have_status eq 'N' }">									
												<c:set var="cp_down_link" value="coupon('${cp_8.coupon_id }'); "/>
												<c:set var="cp_down_ment" value="쿠폰 다운로드"/>
											</c:when>
											<c:otherwise>									
												<c:set var="cp_down_link" value="alert('이미 다운로드 되었습니다'); return false; "/>
												<c:set var="cp_down_ment" value="쿠폰 다운로드 완료"/>
											</c:otherwise>
										</c:choose>
									</c:when>
									<c:otherwise>
										<c:set var="cp_down_link" value="getLogin('${URI }')"/>
										<c:set var="cp_down_ment" value="쿠폰 다운로드"/>
									</c:otherwise>
								</c:choose>
							</c:otherwise>
						</c:choose>
						<li>
							<div class="ticket_con">
								<span class="ticket"><i class="fal fa-ticket-alt"></i></span>
								<strong><c:out value="${cp_8.store_category_nm }"/> <fmt:formatNumber value="${cp_8.coupon_set_price}" type="number"/><c:out value="${cp_unit}"/> 할인 쿠폰</strong>
								<span class="date">사용기간 : <c:out value="${cp_8.coupon_st_dt_ymd}"/> ~ <c:out value="${cp_8.coupon_ed_dt_ymd}"/></span>
								<%--
								<span class="usecoupon">사용처 : 다옴리조트</span>
								 --%>
								<a href="#" onclick="<c:out value="${cp_down_link}"/>" class="on"><c:out value="${cp_down_ment }"/></a>
							</div>
						</li>
					</c:if>					
					<c:if test="${not empty cp_9 }">
						<c:choose>
							<c:when test="${cp_9.coupon_set_st eq 'P' }"><c:set var="cp_unit" value="%"/></c:when>
							<c:otherwise><c:set var="cp_unit" value="원"/></c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${cp_9.coupon_use_status eq 'E' }">
								<c:set var="cp_down_link" value="alert('다운로드 기간이 종료되었습니다.'); return false; "/>
								<c:set var="cp_down_ment" value="쿠폰 다운로드 종료"/>
							</c:when>
							<c:otherwise>
								<c:choose>
									<c:when test="${not empty user_id }">
										<c:choose>
											<c:when test="${cp_9.coupon_have_status eq 'N' }">									
												<c:set var="cp_down_link" value="coupon('${cp_9.coupon_id }'); "/>
												<c:set var="cp_down_ment" value="쿠폰 다운로드"/>
											</c:when>
											<c:otherwise>									
												<c:set var="cp_down_link" value="alert('이미 다운로드 되었습니다'); return false; "/>
												<c:set var="cp_down_ment" value="쿠폰 다운로드 완료"/>
											</c:otherwise>
										</c:choose>
									</c:when>
									<c:otherwise>
										<c:set var="cp_down_link" value="getLogin('${URI }')"/>
										<c:set var="cp_down_ment" value="쿠폰 다운로드"/>
									</c:otherwise>
								</c:choose>
							</c:otherwise>
						</c:choose>
						<li>
							<div class="ticket_con">
								<span class="ticket"><i class="fal fa-ticket-alt"></i></span>
								<strong><c:out value="${cp_9.store_category_nm }"/> <fmt:formatNumber value="${cp_9.coupon_set_price}" type="number"/><c:out value="${cp_unit}"/> 할인 쿠폰</strong>
								<span class="date">사용기간 : <c:out value="${cp_9.coupon_st_dt_ymd}"/> ~ <c:out value="${cp_9.coupon_ed_dt_ymd}"/></span>
								<%--
								<span class="usecoupon">사용처 : 다옴리조트</span>
								 --%>
								<a href="#" onclick="<c:out value="${cp_down_link}"/>" class="on"><c:out value="${cp_down_ment }"/></a>
							</div>
						</li>
					</c:if>																			
					<c:if test="${not empty cp_10 }">
						<c:choose>
							<c:when test="${cp_10.coupon_set_st eq 'P' }"><c:set var="cp_unit" value="%"/></c:when>
							<c:otherwise><c:set var="cp_unit" value="원"/></c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${cp_10.coupon_use_status eq 'E' }">
								<c:set var="cp_down_link" value="alert('다운로드 기간이 종료되었습니다.'); return false; "/>
								<c:set var="cp_down_ment" value="쿠폰 다운로드 종료"/>
							</c:when>
							<c:otherwise>
								<c:choose>
									<c:when test="${not empty user_id }">
										<c:choose>
											<c:when test="${cp_10.coupon_have_status eq 'N' }">									
												<c:set var="cp_down_link" value="coupon('${cp_10.coupon_id }'); "/>
												<c:set var="cp_down_ment" value="쿠폰 다운로드"/>
											</c:when>
											<c:otherwise>									
												<c:set var="cp_down_link" value="alert('이미 다운로드 되었습니다'); return false; "/>
												<c:set var="cp_down_ment" value="쿠폰 다운로드 완료"/>
											</c:otherwise>
										</c:choose>
									</c:when>
									<c:otherwise>
										<c:set var="cp_down_link" value="getLogin('${URI }')"/>
										<c:set var="cp_down_ment" value="쿠폰 다운로드"/>
									</c:otherwise>
								</c:choose>
							</c:otherwise>
						</c:choose>
						<li>
							<div class="ticket_con">
								<span class="ticket"><i class="fal fa-ticket-alt"></i></span>
								<strong><c:out value="${cp_10.store_category_nm }"/> <fmt:formatNumber value="${cp_10.coupon_set_price}" type="number"/><c:out value="${cp_unit}"/> 할인 쿠폰</strong>
								<span class="date">사용기간 : <c:out value="${cp_10.coupon_st_dt_ymd}"/> ~ <c:out value="${cp_10.coupon_ed_dt_ymd}"/></span>
								<%--
								<span class="usecoupon">사용처 : 다옴리조트</span>
								 --%>
								<a href="#" onclick="<c:out value="${cp_down_link}"/>" class="on"><c:out value="${cp_down_ment }"/></a>
							</div>
						</li>
					</c:if>
					</ul>
				</div>
			</div>
			<div class="btnArea alignRight">
				<ul class="nopm floats">
					<%-- 오픈 후 작업
					<li>
						<a href="#;" class="btns"><i class="fal fa-arrow-left"></i> 이전글</a>
						<a href="#;" class="btns">다음글 <i class="fal fa-arrow-right"></i></a>
					</li>
					 --%>
					<li class="fr"><a href="/shop/promotionList.do?pageIndex=<c:out value="${pageIndex }"/>" class="btns"><i class="far fa-bars"></i> 목록</a></li>
				</ul>
			</div>
		</article>
	</section>
	<!-- } 프로모션/이벤트 뷰 -->

<c:import url="/Api/IncludeBottom.do"/>