<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page import="java.util.*" %>

<c:set var="doURI" value="${requestScope['javax.servlet.forward.servlet_path']}" /> 
<c:set var="qsURI" value="${pageContext.request.queryString}" /> 
<c:set var="URI" value="${doURI }"/>
<c:if test="${not empty qsURI}">
	<c:set var="URI" value="${doURI }?${qsURI }"/>
</c:if>

<c:set var="user_ip" value="${user_ip }"/>
<c:set var="test_ip_value" value="192.168.0.1|220.123.69.229"/>
<c:set var="test_mode" value="N"/>
<c:forEach var="test_ip" items="${fn:split(test_ip_value,'|')}" >
	<c:if test="${user_ip eq test_ip }">
		<c:set var="test_mode" value="Y"/>
	</c:if>
</c:forEach>

<c:import url="/Api/IncludeTop.do"/>
<c:set var="order_pord_nm" value=""/>
<c:set var="order_prod_cnt" value="0"/>

<c:if test="${empty user_id }">
<script>
getLogin("/shop/cart.do");
</script>
</c:if>
<script>
$(window).bind("pageshow", function (event) {
	 if ( event.originalEvent && event.originalEvent.persisted) {
		 location.reload();
	 } else {
		//location.reload();
	 }
});
</script>
 
<script language="javascript" src="https://pretest.uplus.co.kr:9443/xpay/js/xpay_crossplatform.js" type="text/javascript"></script>
<!-- <script language="javascript" src="https://xpayvvip.uplus.co.kr/xpay/js/xpay_crossplatform.js" type="text/javascript"></script> -->

<div id="container">
	<!-- 장바구니 { -->
	<section id="cartList" class="cart_favorites">
		<h1><em><i class="fas fa-shopping-cart"></i> 주문  및 결제 ${order_id}</em></h1>

<c:choose>
	<c:when test="${cartcnt > 0 }">
	<c:set var="category_1_total_price" value="0"/>
	<c:set var="category_2_total_price" value="0"/>
	<c:set var="category_3_total_price" value="0"/>
	<c:set var="category_4_total_price" value="0"/>
	
		<c:if test="${not empty cartList1}">
		<!-- 관광/체험 { -->
		<article class="cartlist travelcart" id="category_1">
			<h2>관광/체험</h2>
			<table class="cart_tbl">
				<colgroup>
					<col width="100" style="width:100px" />
					<col />
				</colgroup>
				<thead>
					<tr>
						<th colspan="2">상품정보</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="cartList1" items="${cartList1}" varStatus="status">
					<c:set var="order_pord_nm" value="${cartList1.prod_nm}"/>
					<c:set var="order_prod_cnt" value="${order_prod_cnt + 1}"/>
					<input type="hidden" id="cart_seq_<c:out value="${cartList1.cart_seq}"/>" name="cart_seq" value="<c:out value="${cartList1.cart_seq}"/>" class="seq_1" />
					<input type="hidden" id="cart_price_<c:out value="${cartList1.cart_seq}"/>" name="cart_price" value="<c:out value="${cartList1.total_price}"/>" class="price_1" />
					<input type="hidden" id="cart_prod_nm_<c:out value="${cartList1.cart_seq}"/>" name="cart_prod_nm" value="<c:out value="${cartList1.prod_nm}"/>" class="prod_nm_1" />
					<tr id="tr_<c:out value="${cartList1.cart_seq}"/>">
						<td class="alignCenter"><img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${cartList1.prod_img_1}"/>&fileSn=0"  onerror="this.src='/images/baseScmtour/_noImage.png';"/></td>
						<td>
							<h4 class="subject"><c:out value="${cartList1.prod_nm}"/></h4>
							<dl class="nopm">
								<dt>예약일</dt>
								<dd><c:out value="${cartList1.reserve_st_dt_year}"/>년 <c:out value="${cartList1.reserve_st_dt_month}"/>월 <c:out value="${cartList1.reserve_st_dt_date}"/>일</dd>
							</dl>
							<dl class="nopm">
								<dt>예약인원</dt>
								<dd>
									<c:choose>
										<c:when test="${empty cartList1.opt_seqs} ">-</c:when>
										<c:otherwise>
											<c:set var="opt_seq" value="${fn:split(cartList1.opt_seqs, '|||') }"/>
											<c:set var="opt_nm" value="${fn:split(cartList1.opt_nms, '|||') }"/>
											<c:set var="opt_price" value="${fn:split(cartList1.opt_prices, '|||') }"/>
											<c:set var="opt_cnt" value="${fn:split(cartList1.opt_cnts, '|||') }"/>
											<c:forEach var="opts" items="${opt_seq}" varStatus="status">
											<c:if test="${not empty opt_seq[status.index] }">
												<c:out value="${opt_nm[status.index]}"/> : <fmt:formatNumber value="${opt_price[status.index]}" type="number"/>원 (<c:out value="${opt_cnt[status.index]}"/>명)<br>
											</c:if>
											</c:forEach>
										</c:otherwise>
									</c:choose>
								</dd>
							</dl>
							<dl class="nopm">
								<dt>예약자정보</dt>
								<dd><c:out value="${cartList1.reserve_user_nm}"/> (<c:out value="${cartList1.reserve_user_call}"/>)</dd>
							</dl>
							<dl class="nopm price">
								<dt>금액</dt>
								<dd><fmt:formatNumber value="${cartList1.total_price}" type="number"/>원</dd>
								<c:set var="category_1_total_price" value="${category_1_total_price + cartList1.total_price }"/>
							</dl>
						</td>
					</tr>
					</c:forEach>
				</tbody>
				<tfoot>
					<tr>
						<td colspan="2" class="alignRight"><small>주문금액</small> <strong id="category_1_total_price_str"><fmt:formatNumber value="${category_1_total_price}" type="number"/></strong> <small>원</small></td>
					</tr>
				</tfoot>
			</table>
		</article>
		<!-- } 관광/체험 -->
		</c:if>

		<c:if test="${not empty cartList2}">
		<!-- 숙박 { -->
		<article class="cartlist roomcart"  id="category_2">
			<h2>숙박</h2>
			<table class="cart_tbl">
				<colgroup>
					<col style="width:100px" />
					<col />
				</colgroup>
				<thead>
					<tr>
						<th colspan="2">상품정보</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="cartList2" items="${cartList2}" varStatus="status">
					<c:set var="order_pord_nm" value="${cartList2.prod_nm}"/>
					<c:set var="order_prod_cnt" value="${order_prod_cnt + 1}"/>
					<input type="hidden" id="cart_seq_<c:out value="${cartList2.cart_seq}"/>" name="cart_seq" value="<c:out value="${cartList2.cart_seq}"/>" class="seq_2" />
					<input type="hidden" id="cart_price_<c:out value="${cartList2.cart_seq}"/>" name="cart_price" value="<c:out value="${cartList2.total_price}"/>" class="price_2" />
					<input type="hidden" id="cart_prod_nm_<c:out value="${cartList2.cart_seq}"/>" name="cart_prod_nm" value="<c:out value="${cartList2.prod_nm}"/>" class="prod_nm_2" />
					<tr id="tr_<c:out value="${cartList2.cart_seq}"/>">
						<td class="alignCenter"><img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${cartList2.prod_img_1}"/>&fileSn=0" onerror="this.src='/images/baseScmtour/_noImage.png';"/></td>
						<td>
							<h4 class="subject"><c:out value="${cartList2.prod_nm}"/></h4>
							<dl class="nopm">
								<dt>예약일</dt>
								<dd>
									입실: <c:out value="${cartList2.reserve_st_dt_year}"/>년 <c:out value="${cartList2.reserve_st_dt_month}"/>월 <c:out value="${cartList2.reserve_st_dt_date}"/>일
									<br>
									퇴실: <c:out value="${cartList2.reserve_ed_dt_year}"/>년 <c:out value="${cartList2.reserve_ed_dt_month}"/>월 <c:out value="${cartList2.reserve_ed_dt_date}"/>일
								</dd>
							</dl>
							<dl class="nopm">
								<dt>예약정보</dt>
								<dd>
									<c:choose>
										<c:when test="${empty cartList2.opt_seqs} ">-</c:when>
										<c:otherwise>
											<c:set var="opt_seq" value="${fn:split(cartList2.opt_seqs, '|||') }"/>
											<c:set var="opt_nm" value="${fn:split(cartList2.opt_nms, '|||') }"/>
											<c:set var="opt_price" value="${fn:split(cartList2.opt_prices, '|||') }"/>
											<c:set var="opt_cnt" value="${fn:split(cartList2.opt_cnts, '|||') }"/>
											<c:forEach var="opts" items="${opt_seq}" varStatus="status">
											<c:choose>
												<c:when test="${opt_seq[status.index] eq 'Adult' || opt_seq[status.index] eq 'Young'}"><c:set var="room_opt_unit" value="명"/></c:when>
												<c:otherwise><c:set var="room_opt_unit" value="개"/></c:otherwise>
											</c:choose>
											<c:if test="${not empty opt_seq[status.index] }">
												<c:out value="${opt_nm[status.index]}"/> : <fmt:formatNumber value="${opt_price[status.index]}" type="number"/>원 (<c:out value="${opt_cnt[status.index]}"/><c:out value="${room_opt_unit }"/>)<br>
											</c:if>
											</c:forEach>
										</c:otherwise>
									</c:choose>
								</dd>
							</dl>
							<dl class="nopm">
								<dt>예약자정보</dt>
								<dd><c:out value="${cartList2.reserve_user_nm}"/> (<c:out value="${cartList2.reserve_user_call}"/>)</dd>
							</dl>
							<dl class="nopm price">
								<dt>금액</dt>
								<dd><fmt:formatNumber value="${cartList2.total_price}" type="number"/>원</dd>
								<c:set var="category_2_total_price" value="${category_2_total_price + cartList2.total_price }"/>
							</dl>
						</td>
					</tr>
					</c:forEach>
				</tbody>
				<tfoot>
					<tr>
						<td colspan="2" class="alignRight"><small>주문금액</small> <strong id="category_2_total_price_str"><fmt:formatNumber value="${category_2_total_price}" type="number"/></strong> <small>원</small></td>
					</tr>
				</tfoot>
			</table>
		</article>
		<!-- } 숙박 -->
		</c:if>

		<c:if test="${not empty cartList3}">
		<!-- 맛집 { -->
		<article class="cartlist foodcart"  id="category_3">
			<h2>맛집</h2>
			<table class="cart_tbl">
				<colgroup>
					<col style="width:100px" />
					<col />
				</colgroup>
				<thead>
					<tr>
						<th colspan="2">상품정보</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="cartList3" items="${cartList3}" varStatus="status">
					<c:set var="order_pord_nm" value="${cartList3.prod_nm}"/>
					<c:set var="order_prod_cnt" value="${order_prod_cnt + 1}"/>
					<input type="hidden" id="cart_seq_<c:out value="${cartList3.cart_seq}"/>" name="cart_seq" value="<c:out value="${cartList3.cart_seq}"/>" class="seq_3" />
					<input type="hidden" id="cart_price_<c:out value="${cartList3.cart_seq}"/>" name="cart_price" value="<c:out value="${cartList3.total_price}"/>" class="price_3" />
					<input type="hidden" id="cart_prod_nm_<c:out value="${cartList3.cart_seq}"/>" name="cart_prod_nm" value="<c:out value="${cartList3.prod_nm}"/>" class="prod_nm_3" />
					<tr id="tr_<c:out value="${cartList3.cart_seq}"/>">
						<td class="alignCenter"><img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${cartList3.prod_img_1}"/>&fileSn=0" onerror="this.src='/images/baseScmtour/_noImage.png';"/></td>
						<td>
							<h4 class="subject"><c:out value="${cartList3.prod_nm}"/></h4>
							<dl class="nopm">
								<dt>예약일</dt>
								<dd>
									<c:out value="${cartList3.reserve_st_dt_year}"/>년 <c:out value="${cartList3.reserve_st_dt_month}"/>월 <c:out value="${cartList3.reserve_st_dt_date}"/>일
									 <c:out value="${cartList3.reserve_time_hour}"/>시 <c:out value="${cartList3.reserve_time_minute}"/>분 
								</dd>
							</dl>
							<dl class="nopm">
								<dt>예약메뉴</dt>
								<dd>
									<c:choose>
										<c:when test="${empty cartList3.opt_seqs} ">-</c:when>
										<c:otherwise>
											<c:set var="opt_seq" value="${fn:split(cartList3.opt_seqs, '|||') }"/>
											<c:set var="opt_nm" value="${fn:split(cartList3.opt_nms, '|||') }"/>
											<c:set var="opt_price" value="${fn:split(cartList3.opt_prices, '|||') }"/>
											<c:set var="opt_cnt" value="${fn:split(cartList3.opt_cnts, '|||') }"/>
											<c:forEach var="opts" items="${opt_seq}" varStatus="status">
											<c:if test="${not empty opt_seq[status.index] }">
												<c:out value="${opt_nm[status.index]}"/> : <fmt:formatNumber value="${opt_price[status.index]}" type="number"/>원 (<c:out value="${opt_cnt[status.index]}"/>개)<br>
											</c:if>
											</c:forEach>
										</c:otherwise>
									</c:choose>
								</dd>
							</dl>
							<dl class="nopm">
								<dt>예약자정보</dt>
								<dd><c:out value="${cartList3.reserve_user_nm}"/> (<c:out value="${cartList3.reserve_user_call}"/>)</dd>
							</dl>
							<dl class="nopm price">
								<dt>금액</dt>
								<dd><fmt:formatNumber value="${cartList3.total_price}" type="number"/>원</dd>
								<c:set var="category_3_total_price" value="${category_3_total_price + cartList3.total_price }"/>
							</dl>
						</td>
					</tr>
					</c:forEach>
				</tbody>
				<tfoot>
					<tr>
						<td colspan="2" class="alignRight"><small>주문금액</small> <strong id="category_3_total_price_str"><fmt:formatNumber value="${category_3_total_price}" type="number"/></strong> <small>원</small></td>
					</tr>
				</tfoot>
			</table>
			<div class="btnarea mgt10px">
				<a href="javascript:check_del('3');" class="btns h24px">선택삭제</a>
			</div>
		</article>
		<!-- } 맛집 -->
		</c:if>
		
		<c:if test="${not empty cartList4}">
		<!-- 서천장터 { -->
		<article class="cartlist marketcart"  id="category_4">
			<h2>서천장터</h2>
			<table class="cart_tbl">
				<colgroup>
					<col width="100" style="width:100px" />
					<col />
				</colgroup>
				<thead>
					<tr>
						<th colspan="2">상품정보</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="cartList4" items="${cartList4}" varStatus="status">
					<c:set var="order_pord_nm" value="${cartList4.prod_nm}"/>
					<c:set var="order_prod_cnt" value="${order_prod_cnt + 1}"/>
					<input type="hidden" id="cart_seq_<c:out value="${cartList4.cart_seq}"/>" name="cart_seq" value="<c:out value="${cartList4.cart_seq}"/>" class="seq_4" />
					<input type="hidden" id="cart_price_<c:out value="${cartList4.cart_seq}"/>" name="cart_price" value="<c:out value="${cartList4.total_price}"/>" class="price_4" />
					<input type="hidden" id="cart_prod_nm_<c:out value="${cartList4.cart_seq}"/>" name="cart_prod_nm" value="<c:out value="${cartList4.prod_nm}"/>" class="prod_nm_4" />
					<tr id="tr_<c:out value="${cartList4.cart_seq}"/>">
						<td class="alignCenter"><img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${cartList4.prod_img_1}"/>&fileSn=0" onerror="this.src='/images/baseScmtour/_noImage.png';"/></td>
						<td>
							<h4 class="subject"><c:out value="${cartList4.prod_nm}"/></h4>
							<dl class="nopm">
								<dt>판매업체</dt>
								<dd><c:out value="${cartList4.store_nm}"/></dd>
							</dl>
							<dl class="nopm">
								<dt>구매상품</dt>
								<dd>
									<c:choose>
										<c:when test="${empty cartList4.opt_seqs} ">-</c:when>
										<c:otherwise>
											<c:set var="opt_seq" value="${fn:split(cartList4.opt_seqs, '|||') }"/>
											<c:set var="opt_nm" value="${fn:split(cartList4.opt_nms, '|||') }"/>
											<c:set var="opt_price" value="${fn:split(cartList4.opt_prices, '|||') }"/>
											<c:set var="opt_cnt" value="${fn:split(cartList4.opt_cnts, '|||') }"/>
											<c:forEach var="opts" items="${opt_seq}" varStatus="status">
											<c:if test="${not empty opt_seq[status.index] }">
												<c:out value="${opt_nm[status.index]}"/> : <fmt:formatNumber value="${opt_price[status.index]}" type="number"/>원 (<c:out value="${opt_cnt[status.index]}"/>개)<br>
											</c:if>
											</c:forEach>
										</c:otherwise>
									</c:choose>
								</dd>
							</dl>
							<dl class="nopm price">
								<dt>금액</dt>
								<dd><fmt:formatNumber value="${cartList4.total_price}" type="number"/>원</dd>
								<c:set var="category_4_total_price" value="${category_4_total_price + cartList4.total_price }"/>
							</dl>
						</td>
					</tr>
					</c:forEach>
				</tbody>
				<tfoot>
					<tr>
						<td colspan="2" class="alignRight"><small>주문금액</small> <strong id="category_4_total_price_str"><fmt:formatNumber value="${category_4_total_price}" type="number"/></strong> <small>원</small></td>
					</tr>
				</tfoot>
			</table>
		</article>
		<!-- } 서천장터 -->
		</c:if>
		
		<c:if test="${not empty cartList4}">
		<article id="cartTotalPrice">
			<div class="btnarea mgt30px" id="order_user">
				<h2><strong>주문자 및 배송지 정보</strong></h2>
				<div class="con">
					<table class="option_tbl">
						<colgroup>
							<col style="width:70px" />
							<col />
						</colgroup>
						<tbody>
							<tr>
								<th>수령인</th>
								<td>
									<input type="text" class="order_input w100 readonly" readonly value="<c:out value="${forder_user_nm} "/>"/>
								</td>
							</tr>
							<tr>
								<th>연락처 1</th>
								<td><input type="text" class="order_input w100 readonly" readonly value="<c:out value="${forder_user_hp}"/> "/></td>
							</tr>
							<tr>
								<th>연락처 2</th>
								<td><input type="text" class="order_input w100 readonly" readonly value="<c:out value="${forder_user_call} "/>"/></td>
							</tr>
							<tr>
								<th>이메일</th>
								<td><input type="text" class="order_input w100 readonly" readonly value="<c:out value="${forder_user_email} "/>"/></td>
							</tr>
							<tr>
								<th >주소</th>
								<td><input type="text" class="order_input w100 readonly" readonly value="(<c:out value="${forder_user_zip} "/>) <c:out value="${forder_user_addr1} "/> <c:out value="${forder_user_addr2} "/> "/></td>
							</tr>
							<tr>
								<th>배송요청</th>
								<td><input type="text" class="order_input w100 readonly" readonly value="<c:out value="${forder_user_message} "/>"/></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>		
		</article>
		</c:if>
		<c:if test="${empty cartList4}">
		<article id="cartTotalPrice">
			<div class="btnarea" id="order_user">
				<h2><strong>주문자 정보</strong></h2>
				<div class="con">
					<table class="option_tbl">
						<colgroup>
							<col style="width:70px" />
							<col />
						</colgroup>
						<tbody>
							<tr>
								<th>주문자</th>
								<td>
									<input type="text" class="order_input w100 readonly" readonly value="<c:out value="${forder_user_nm} "/>"/>
								</td>
							</tr>
							<tr>
								<th>연락처 1</th>
								<td><input type="text" class="order_input w100 readonly" readonly value="<c:out value="${forder_user_hp}"/> "/></td>
							</tr>
							<tr>
								<th>연락처 2</th>
								<td><input type="text" class="order_input w100 readonly" readonly value="<c:out value="${forder_user_call} "/>"/></td>
							</tr>
							<tr>
								<th>이메일</th>
								<td><input type="text" class="order_input w100 readonly" readonly value="<c:out value="${forder_user_email} "/>"/></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</article>
		</c:if>
		
		<c:set var="all_total_price" value="${all_total_price}"/>
		<input type="hidden" id="all_total_price" value="<c:out value="${all_total_price}"/>" />
		
		
		<!-- 쿠폰선택 { -->
		<c:set var="coupon_sale_price" value="0"/>
		<c:if test="${not empty couponInfo }">
		<article id="cartTotalPrice">
			<div class="order_info_con order_agree" id="pay">
				<h2><strong>쿠폰 선택</strong></h2>
				<br>
				<c:out value="${couponInfo.coupon_nm }"/> 
				<c:choose>
					<c:when test="${couponInfo.store_category eq 'CD002001'}">
						<c:set var="cpcate" value="관광/체험 전용" />
					</c:when>
					<c:when test="${couponInfo.store_category eq 'CD002002'}">
						<c:set var="cpcate" value="숙박 전용" />
					</c:when>
					<c:when test="${couponInfo.store_category eq 'CD002003'}">
						<c:set var="cpcate" value="맛집 전용" />
					</c:when>
					<c:when test="${couponInfo.store_category eq 'CD002004'}">
						<c:set var="cpcate" value="서천장터 전용" />
					</c:when>
					<c:otherwise>
						<c:set var="cpcate" value="모든 상품 적용" />
					</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${couponInfo.coupon_set_st eq 'W'}">
						<c:set var="cpunit" value="원" />
					</c:when>
					<c:otherwise>
						<c:set var="cpunit" value="%" />
					</c:otherwise>
				</c:choose>
				 (<c:out value="${cpcate}"/> ::: <c:out value="${couponInfo.coupon_set_price }"/><c:out value="${cpunit }"/> 할인)
			</div>
		</article>
		</c:if>
		<!-- } 쿠폰선택 -->

		<!-- 결제선택 { -->
		<article id="cartTotalPrice">
			<div class="order_info_con order_agree" id="pay">
				<h2>
					<strong>결제방법 선택</strong> :
					<c:choose>
						<c:when test="${order_user_pay eq 'card' }">신용카드</c:when>
						<c:when test="${order_user_pay eq 'realbank' }">실시간 계좌이체</c:when>
						<c:when test="${order_user_pay eq 'virtual' }">가상계좌</c:when>
						<c:when test="${order_user_pay eq 'bank' }">무통장입금</c:when>
					</c:choose> 
					<input type="hidden" name="order_user_pay" value="<c:out value="${order_user_pay }"/>" />
					<input type="hidden" name="order_time" value="<c:out value="${order_time }"/>" />
				</h2>
			</div>
		</article>
		<!-- } 결제선택-->
		
		<!-- 구매조건 확인 및 결제진행 동의 { -->
		<article id="cartTotalPrice">
			<div class="order_info_con order_agree" >
				<h2><strong>구매조건 확인 및 결제진행 동의</strong><br><br></h2>
				<div class="con">
					<div class="agreebox">
						1. 개인정보 수집 및 이용 목적 : 주문서 작성<br />
						2. 개인정보수집항목 : 주문자, 연락처<br />
						3. 개인정보 보유 및 이용기간 : 5년<br />
						4. 개인정보 수집 및 이용에 동의하지 않을 권리가 있으며 , 동의하지 않을 경우에는 주문서 작성이 불가합니다
					</div>
					<div class="agreecheck mgt10px alignRight">
						<input type="checkbox" id="agree" name="agree" class="basic_check" value="Y" /><label for="agree"><span></span>위 개인정보 제공 및 이용에 동의합니다.<label>
					</div>
				</div>
			</div>
		</article>
		
		<%--
		<!-- 결제선택 { -->
		<article id="cartTotalPrice">
			<div class="order_info_con order_agree" id="pay">
				<h2><strong>결제방법 선택</strong></h2>
				<select id="order_user_pay" name="order_user_pay" class="order_select w100 mgt10px" onchange="set_pay_type(this.value)">
					<option value="card">신용카드</option> 
					<option value="realbank">실시간 계좌이체</option>
					<option value="virtual">가상계좌</option> 
					<option value="bank">무통장입금</option> 
				</select>
			</div>
		</article>
		<!-- } 결제선택-->
		
		<!-- 구매조건 확인 및 결제진행 동의 { -->
		<article id="cartTotalPrice">
			<div class="order_info_con order_agree" >
				<h2><strong>구매조건 확인 및 결제진행 동의</strong><br><br></h2>
				<div class="con">
					<div class="agreebox">
						1. 개인정보 수집 및 이용 목적 : 주문서 작성<br />
						2. 개인정보수집항목 : 주문자, 연락처<br />
						3. 개인정보 보유 및 이용기간 : 5년<br />
						4. 개인정보 수집 및 이용에 동의하지 않을 권리가 있으며 , 동의하지 않을 경우에는 주문서 작성이 불가합니다
					</div>
					<div class="agreecheck mgt10px alignRight">
						<input type="checkbox" id="agree" name="agree" class="basic_check" value="Y" /><label for="agree"><span></span>위 개인정보 제공 및 이용에 동의합니다.<label>
					</div>
				</div>
			</div>
		</article>
		<article id="cartTotalPrice">
			<div class="order_info_con order_agree" >
				<h2><strong>개인정보 변경동의 (선택사항)</strong><br><br></h2>
				<div class="con">
					<div class="agreebox">
						1. 주문시 입력된 정보로 회원의 개인정보를 변경합니다.<br />
						2. 변경항목 : 전화번호(핸드폰), 이메일주소<br />
						3. 정보의 보유기간은 개인정보보호방침에 따릅니다.<br />
					</div>
					<div class="agreecheck mgt10px alignRight">
						<input type="checkbox" id="changeinfo" name="changeinfo" class="basic_check" value="Y" /><label for="agree"><span></span>위 입력정보르 개인정보변경에 동의합니다.<label>
					</div>
				</div>
			</div>
		</article>
		<!-- } 구매조건 확인 및 결제진행 동의 -->
		 --%>

		<!-- 총계 계산 { -->
		<article id="cartTotalPrice">
			<dl class="nopm price">
				<dt>총상품가격</dt>
				<dd>
				<strong id="all_total_price_str"><fmt:formatNumber value="${all_total_price}" type="number"/></strong> <small>원</small>
				<c:if test="${delivery_price > 0}">
				<div id="delivery_price_str" style="font-size: 0.7em;">(배송비 +<fmt:formatNumber value="${delivery_price}" type="number"/>원 적용)</div>
				</c:if>
				<c:if test="${coupon_sale_price > 0}">
				<div id="coupon_sale_str" style="font-size: 0.7em; "> (할인 -<fmt:formatNumber value="${coupon_sale_price}" type="number"/>원 적용)</div>
				</c:if>
				</dd>
			</dl>
		</article>
		<!-- } 총계 계산 -->

		<div class="buybtnArea alignCenter">
			<a href="javascript:orderPayment();" class="btns h50px orangebtn w40">결제하기</a>
		</div>

		
	</c:when>
	<c:otherwise>
		<!-- 상품이 없을 때 { -->
		<div class="cf_noitem alignCenter">
			주문할 상품이 존재하지 않습니다.
		</div>
		<!-- } 상품이 없을 때 -->
	</c:otherwise>
</c:choose>
		
	</section>
	<!-- } 장바구니 -->
	
	</div>

	<c:set var="lgd_buyer_val" value="${user_nm }"/>
	<c:set var="lgd_oid_val" value="${order_id }"/>
	<c:set var="product_info" value="${order_pord_nm}${order_prod_cnt_str }"/>
	<c:set var="forder_delivery" value="${delivery_price}"/>
	<input type="hidden" name="product_info" id="product_info" value="<c:out value="${product_info }"/>"/>
	
	<c:if test="${empty forder_user_hp }"><c:set var="forder_user_hp" value="+++++"/></c:if>
	<c:if test="${empty forder_user_call }"><c:set var="forder_user_call" value="+++++"/></c:if>
	<c:if test="${empty forder_user_zip }"><c:set var="forder_user_zip" value="+++++"/></c:if>
	<c:if test="${empty forder_user_addr1 }"><c:set var="forder_user_addr1" value="+++++"/></c:if>
	<c:if test="${empty forder_user_message }"><c:set var="forder_user_message" value="+++++"/></c:if>
	<c:if test="${empty forder_user_nm }"><c:set var="forder_user_nm" value="+++++"/></c:if>
	<c:if test="${empty forder_user_email }"><c:set var="forder_user_email" value="+++++"/></c:if>
	<c:if test="${empty coupon_id }"><c:set var="coupon_id" value="+++++"/></c:if>
	<c:if test="${empty coupon_sale_price }"><c:set var="coupon_sale_price" value="+++++"/></c:if>
	<c:if test="${empty forder_mileage }"><c:set var="forder_mileage" value="+++++"/></c:if>
	<c:if test="${empty forder_delivery }"><c:set var="forder_delivery" value="+++++"/></c:if>

	<c:choose>
		<c:when test="${order_prod_cnt > 1}">
			<c:set var="order_prod_cnt_str" value="외 ${order_prod_cnt-1}건"/>
		</c:when>
		<c:otherwise>
			<c:set var="order_prod_cnt_str" value=""/>
		</c:otherwise>
	</c:choose>
	
	<c:set var="mo_os" value="${isMoOS}"/>
	<c:choose>
		<c:when test="${isMoOS eq 'apple'}">
			<c:set var="order_os_set" value="N"/>
		</c:when>
		<c:otherwise>
			<c:set var="order_os_set" value="A"/>
		</c:otherwise>
	</c:choose>
	<c:choose>
		<c:when test="${isMobile ne '1' }">
			<%@ include file="inc_payreq_pc.jsp" %>
		</c:when>
		<c:otherwise>
			<%@ include file="inc_payreq_mobile.jsp" %>
		</c:otherwise>
	</c:choose>
	
	
	
<c:import url="/Api/IncludeBottom.do"/>