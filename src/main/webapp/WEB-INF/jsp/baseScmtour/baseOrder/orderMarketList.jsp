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

<c:import url="/Api/IncludeTop.do"/>

<c:if test="${empty user_id }">
<script>
$(window).bind("pageshow", function (event) {
getLogin('<c:out value="${URI }"/>');
});
</script>
</c:if>

<!-- 구매내역 { -->
	<section id="cartList" class="cart_favorites">
		<h1><em><i class="fas fa-gifts"></i> 구매내역</em></h1>

		<div class="cf_tab">
			<ul class="nopm floats">
				<li><a href="/mypage/orderReserveList.do">관광/체험, 숙박, 맛집</a></li>
				<li><a href="/mypage/orderMarketList.do" class="active">서천장터</a></li>
			</ul>
		</div>

		<!-- 상품이 없을 때 { -->
		<c:if test="${empty orderList }">
		<div class="cf_noitem alignCenter">
			주문내역이 존재하지 않습니다.
		</div>
		</c:if>
		<!-- } 상품이 없을 때 -->

		<!-- 관광/체험 { -->
		<c:if test="${not empty orderList }">
		<c:forEach var="orderList" items="${orderList}" varStatus="status">
		<c:set var="order_detail_list" value="orderDetailList_${orderList.order_id}"/>

		<article class="cartlist travelcart">
            <h2><c:out value="${orderList.reg_dt }"/> <small>(주문번호 <c:out value="${orderList.order_id}"/>)</small></h2>
			<table class="cart_tbl">
				<colgroup>
					<col width="110" style="width:110px" />
					<col />
				</colgroup>
				<thead>
					<tr>
						<th colspan="2" >상품정보</th>
					</tr>
				</thead>
				<tbody>
					<c:if test="${not empty requestScope[order_detail_list]}">
					<c:set var="calc_price" value="0"/>
					<c:forEach var="orderDetailList" items="${requestScope[order_detail_list]}" varStatus="status">
					<tr>
						<td class="alignCenter"><img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${orderDetailList.prod_img_1}"/>&fileSn=0" onerror="this.src='/images/baseScmtour/_noImage.png';"/></td>
						<td>
							<h4 class="subject"><c:out value="${orderDetailList.od_prod_nm}"/></h4>
							<dl class="nopm">
								<dt>판매업체</dt>
								<dd><c:out value="${orderDetailList.store_nm}"/></dd>
							</dl>
							<c:if test="${orderDetailList.od_prod_price > 0 }">
							<dl class="nopm">
								<dt>상품가격</dt>
								<dd><fmt:formatNumber value="${orderDetailList.od_prod_price}" type="number"/>원</dd>
								<c:set var="calc_price" value="${calc_price + orderDetailList.od_prod_price }"/>
							</dl>
							</c:if>
							<c:set var="od_prod_opt_seq" value="${fn:split(orderDetailList.od_prod_opt_seq,'|||')}" />
							<c:set var="od_prod_opt_nm" value="${fn:split(orderDetailList.od_prod_opt_nm,'|||')}" />
							<c:set var="od_prod_opt_price" value="${fn:split(orderDetailList.od_prod_opt_price,'|||')}" />
							<c:set var="od_prod_opt_cnt" value="${fn:split(orderDetailList.od_prod_opt_cnt,'|||')}" />
							<c:forEach var="od_prod_opt" items="${od_prod_opt_seq}" varStatus="opts">
							<c:if test="${not empty od_prod_opt}">
							<dl class="nopm">
								<dt>옵션</dt>
								<dd>
									<c:out value="${od_prod_opt_nm[opts.index] }"/> (<c:out value="${od_prod_opt_cnt[opts.index] }"/>개)
									<br>
									<fmt:formatNumber value="${od_prod_opt_price[opts.index] * od_prod_opt_cnt[opts.index]}" type="number"/>원
									<c:set var="calc_price" value="${calc_price + (od_prod_opt_price[opts.index] * od_prod_opt_cnt[opts.index]) }"/>
								</dd>
							</dl>
							</c:if>
							</c:forEach>
							<dl class="nopm price">
								<dt>금액</dt>
								<dd><fmt:formatNumber value="${orderDetailList.od_prod_price + orderDetailList.od_prod_total_price}" type="number"/>원</dd>
							</dl>
							<dl class="nopm">
								<dt>상태</dt>
								<dd>
									<c:choose>
										<c:when test="${orderDetailList.od_order_stat eq 'READY' }">입금대기</c:when>
										<c:when test="${orderDetailList.od_order_stat eq 'PAYMENT' }">결제완료</c:when>
										<c:when test="${orderDetailList.od_order_stat eq 'TRANSFER' }">배송중</c:when>
										<c:when test="${orderDetailList.od_order_stat eq 'COMPLETE' }">배송완료</c:when>
									</c:choose>									
								</dd>
							</dl>
						</td>
					</tr>
					</c:forEach>
					</c:if>
				</tbody>
				<tfoot>
					<tr>
						<td colspan="2" class="alignRight">
                            <p class="mgb10px fsize14">
                                <b>주소</b> : <c:out value="${orderList.order_addr1}"/> <c:out value="${orderList.order_addr2}"/><br />
                                <b>연락처</b> : <c:out value="${orderList.order_hp}"/> <c:if test="${not empty orderList.order_tel }"> , <c:out value="${orderList.order_tel}"/></c:if>
                            </p>
						    <small>주문금액</small> <strong><fmt:formatNumber value="${calc_price}" type="number"/></strong> <small>원</small>
				        </td>
					</tr>
				</tfoot>
			</table>
		</article>
		</c:forEach>
		</c:if>
		<!-- } 맛집 -->
	</section>
	<!-- } 구매내역 -->
	
<c:import url="/Api/IncludeBottom.do"/>