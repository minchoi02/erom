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

	<section id="cartList" class="cart_favorites">
		<h1><em><i class="fas fa-gifts"></i> 구매내역</em></h1>

		<!-- 상품이 없을 때 { -->
		<c:if test="${empty orderMasterList }">
		<div class="cf_noitem alignCenter">
			주문내역이 존재하지 않습니다.
		</div>
		</c:if>
		<!-- } 상품이 없을 때 -->
		
		<c:if test="${not empty orderMasterList }">
		<c:forEach var="orderMasterList" items="${orderMasterList}" varStatus="status">
		<c:set var="order_dt_ymd_arr" value="${fn:split(orderMasterList.reg_dt,'-')}"/>
		<c:set var="order_dt_ymd" value="${order_dt_ymd_arr[0]}년 ${order_dt_ymd_arr[1]}월 ${order_dt_ymd_arr[2]}일 "/>
        <article class="cartlist travelcart">
		    <h2><c:out value="${order_dt_ymd}"/> <small>(주문번호 <c:out value="${orderMasterList.order_id }"/>)</small>
			<c:choose>
			<c:when test="${orderMasterList.order_st eq 'PAYMENT' }">
		    <span class="btns orangebtn h24px mgt5px">결제완료</span>
			</c:when>
			<c:when test="${orderMasterList.order_st eq 'CANCEL' }">
		    <span class="btns whitebtn h24px mgt5px">주문취소</span>
			</c:when>
			<c:when test="${orderMasterList.order_st eq 'CANCELING' }">
		    <span class="btns graybtn h24px mgt5px">취소요청중</span>
			</c:when>
			<c:when test="${orderMasterList.order_st eq 'READY' }">
			<c:choose>
				<c:when test="${orderMasterList.order_pay_st eq 'B' }">
					<c:set var="bank_nm" value="${bank_name.base_cd_nm }"/>
					<c:set var="bank_number" value="${SiteBaseConfig.pay_bank_number }"/>
					<c:set var="bank_user" value="${SiteBaseConfig.pay_bank_user }"/>
				</c:when>
				<c:when test="${orderMasterList.order_pay_st eq 'V' }">
					<c:set var="bank_nm" value="${orderMasterList.order_pay_vbank_nm }"/>
					<c:set var="bank_number" value="${orderMasterList.order_pay_vbank_number }"/>
					<c:set var="bank_user" value="${orderMasterList.order_pay_vbank_user }"/>
				</c:when>
			</c:choose>
			<input type="hidden" id="order_price_<c:out value="${orderMasterList.order_id }"/>" value="<c:out value="${orderMasterList.order_total_price }"/>"/>
			<input type="hidden" id="delivery_price_<c:out value="${orderMasterList.order_id }"/>" value="<c:out value="${orderMasterList.order_total_delivery_price }"/>"/>
			<input type="hidden" id="coupon_price_<c:out value="${orderMasterList.order_id }"/>" value="<c:out value="${orderMasterList.order_coupon_price }"/>"/>
			<input type="hidden" id="mileage_<c:out value="${orderMasterList.order_id }"/>" value="<c:out value="${orderMasterList.order_use_mileage }"/>"/>
			<input type="hidden" id="bank_nm_<c:out value="${orderMasterList.order_id }"/>" value="<c:out value="${bank_nm}"/>" />
			<input type="hidden" id="bank_number_<c:out value="${orderMasterList.order_id }"/>" value="<c:out value="${bank_number}"/>" />
			<input type="hidden" id="bank_user_<c:out value="${orderMasterList.order_id }"/>" value="<c:out value="${bank_user}"/>" />
			
		    <span class="btns graybtn h24px mgt5px" onclick="payinfo('<c:out value="${orderMasterList.order_id }"/>');">입금대기</span>
			</c:when>
			</c:choose>

		    </h2>
			<table class="cart_tbl">
				<colgroup>
					<col>
				</colgroup>
				<thead>
					<tr>
						<th>상품정보
						<a class="btn_more" href="/mypage/orderDetail.do?order_id=<c:out value="${orderMasterList.order_id }"/>&pageIndex=<c:out value="${paginationInfo.currentPageNo }"/>">상세보기</a>
						</th>
					</tr>
				</thead>
				<tbody>
					<c:set var="order_detail_list" value="orderDetailList_${orderMasterList.order_id}"/>
					<c:forEach var="orderDetailList" items="${requestScope[order_detail_list]}" varStatus="status">
					<tr>
						<td>
							<h4 class="mgb0px" >
								<span class="" ><c:out value="${orderDetailList.od_prod_nm }"/> &nbsp; 
									<c:if test="${orderDetailList.od_order_stat eq 'CANCELING'}"> <span class="btns graybtn h24px ">취소요청중</span></c:if>
									<c:if test="${orderDetailList.od_order_stat eq 'PAYMENT'}"> <span class="btns orangebtn h24px ">결제완료</span></c:if>
									<c:if test="${orderDetailList.od_order_stat eq 'READY'}"> <span class="btns graybtn h24px ">입금대기</span></c:if>
									<c:if test="${orderDetailList.od_order_stat eq 'CANCEL'}"> <span class="btns whitebtn h24px ">취소</span></c:if>
									<c:if test="${orderDetailList.od_order_stat eq 'TRANSLATE'}"> <span class="btns graybtn h24px ">배송중</span></c:if>
									<c:if test="${orderDetailList.od_order_stat eq 'COMPLETE'}"> <span class="btns graybtn h24px ">완료</span></c:if>
								</span>
							</h4>
						</td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
		</article>
		</c:forEach>
		<!-- } 맛집 -->
		
		<div class="pagenation">
			<ui:pagination paginationInfo = "${paginationInfo}" type="image" jsFunction="jsPaging" />
		</div>
		<br>
		<br>
		<script type="text/javascript">
		// 페이징함수
		function jsPaging(pageNo) {
			var linkurl = "/mypage/orderList.do?pageIndex="+pageNo;
			location.href = linkurl;
		}
		</script>
		
	</section>
	
	</c:if>
	
	<!-- 모달팝업 > 사용확인 { -->
	<div id="reservInfo" class="modal fade reservinfo" tabindex="1" role="dialog">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header bgOrangeGra">
					<button type="button" class="closebtn" data-dismiss="modal" aria-label="Close"><i class="fal fa-times"></i></button>
					<h4 class="modal-title" id="view_title"></h4>
				</div>
				<div class="modal-body" id="order">
					<!-- 주문정보 { -->
					<article id="orderPrice" class="order_info" style="padding:1em">
						<table class="order_tbl">
							<colgroup>
								<col />
								<col />
							</colgroup>
							<tbody>
								<tr>
									<th><span class="btns h24px whitebtn" >입금은행</span></th>
									<td class="alignRight" id="view_bank_info1"></td>
								</tr>
								<tr>
									<th><span class="btns h24px whitebtn" >입금계좌</span></th>
									<td class="alignRight" id="view_bank_info2"></td>
								</tr>
								<tr>
									<th><span class="btns h24px whitebtn" >예금주명</span></th>
									<td class="alignRight" id="view_bank_info3"></td>
								</tr>
							</tbody>
							<tfoot>
								<tr>
									<th>총 금액</th>
									<td class="alignRight" id="view_price"> <small>원</small></td>
								</tr>
							</tfoot>
							<tfoot>
								<tr>
									<th><span class="btns h24px whitebtn">상품가</span></th>
									<td class="alignRight" id="view_prod_price"></td>
								</tr>
								<tr>
									<th><span class="btns h24px whitebtn">배송비</span></th>
									<td class="alignRight" id="view_deli"></td>
								</tr>
								<tr>
									<th><span class="btns h24px whitebtn">쿠폰할인</span></th>
									<td class="alignRight" id="view_coupon"></td>
								</tr>
							</tfoot>
						</table>
					</article>
					<!-- } 주문정보 -->
					
				</div>
			</div>
		</div>
	</div>
	<!-- } 모달팝업 > 사용확인 -->
	
<c:import url="/Api/IncludeBottom.do"/>