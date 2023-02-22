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
getLogin('<c:out value="${URI }"/>');
</script>
</c:if>
<script>
$(window).bind("pageshow", function (event) {
	 if ( event.originalEvent && event.originalEvent.persisted) {
		 check_all_btn(1);
		 check_all_btn(2);
		 check_all_btn(3);
		 check_all_btn(4);
	 } else {
		 check_all_btn(1);
		 check_all_btn(2);
		 check_all_btn(3);
		 check_all_btn(4);
	 }
});
</script>
<div id="container">
	<!-- 장바구니 { -->
	<section id="cartList" class="cart_favorites">
		<h1><em><i class="fas fa-shopping-cart"></i> 장바구니</em></h1>
		<form action="/shop/payment.do" method="post" onsubmit="return cartCheck()"/>

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
					<col width="35" style="width:35px" />
					<col />
				</colgroup>
				<thead>
					<tr>
						<th><input type="checkbox" id="allcheck_1" class="allcheck_1" name="" checked onclick="allcheck(1);" /></th>
						<th>상품정보</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="cartList1" items="${cartList1}" varStatus="status">
					<input type="hidden" id="cart_seq_<c:out value="${cartList1.cart_seq}"/>" name="cart_seq" value="<c:out value="${cartList1.cart_seq}"/>" class="seq_1" />
					<input type="hidden" id="cart_price_<c:out value="${cartList1.cart_seq}"/>" name="cart_price" value="<c:out value="${cartList1.total_price}"/>" class="price_1" />
					<input type="hidden" id="cart_prod_nm_<c:out value="${cartList1.cart_seq}"/>" name="cart_prod_nm" value="<c:out value="${cartList1.prod_nm}"/>" class="prod_nm_1" />
					<input type="hidden" id="cart_min_price_<c:out value="${cartList1.cart_seq}"/>" name="cart_prod_nm" value="<c:out value="${cartList1.prod_min_price}"/>" class="prod_nm_1" />
					<input type="hidden" id="cart_store_id_<c:out value="${cartList1.cart_seq}"/>" name="cart_store_id" value="<c:out value="${cartList1.store_id}"/>" class="cart_store_id_1" />
					<tr id="tr_<c:out value="${cartList1.cart_seq}"/>">
						<td colspan="2" class="alignCenter">
							<div class="pd_info floats">
							<input type="checkbox" id="chck_<c:out value="${cartList1.cart_seq}"/>" name="check_item" class="check_1" checked value="<c:out value="${cartList1.cart_seq}"/>" onclick="check_all_btn(4);" />
							<img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${cartList1.prod_img_1}"/>&fileSn=0" onerror="this.src='/images/baseScmtour/_noImage.png';"/>
							<h4 class="subject">
							<a href="/shop/itemView.do?store_category=<c:out value="${cartList1.store_category}"/>&prod_category=<c:out value="${cartList1.prod_category}"/>&prod_id=<c:out value="${cartList1.prod_id}"/>">
							<c:out value="${cartList1.prod_nm}"/><br><div style="color:#666; padding: 8px 0; font-size: 0.8em; font-weight: normal;">(<c:out value="${cartList1.store_nm}"/>)</div>
							</a>
							</h4>
							</div>
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
											<input type="hidden" id="opt_cnt_<c:out value="${opt_seq[status.index]}"/>" value="<c:out value="${opt_cnt[status.index]}"/>"/>
											<c:if test="${not empty opt_seq[status.index] }">
											<div class="pd_count_wrap floats">
												<span class="pd_tit"><c:out value="${opt_nm[status.index]}"/> : <fmt:formatNumber value="${opt_price[status.index]}" type="number"/>원</span>
												<span class="pd_count floats">
												   <a href="javascript:opt_calc_cnt('m','<c:out value="${opt_seq[status.index]}"/>','<c:out value="${opt_price[status.index]}"/>','<c:out value="${cartList1.cart_seq}"/>','<c:out value="${cartList1.store_category}"/>','<c:out value="${cartList1.store_id}"/>');" id="decreaseQuantity"><i class="fal fa-minus"></i></a>
												   <span id="numberUpDown_<c:out value="${opt_seq[status.index]}"/>"><c:out value="${opt_cnt[status.index]}"/></span>
												   <a href="javascript:opt_calc_cnt('p','<c:out value="${opt_seq[status.index]}"/>','<c:out value="${opt_price[status.index]}"/>','<c:out value="${cartList1.cart_seq}"/>','<c:out value="${cartList1.store_category}"/>','<c:out value="${cartList1.store_id}"/>');" id="increaseQuantity"><i class="fal fa-plus"></i></a>
												</span>
											</div>
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
								<input type="hidden" id="total_price_input_<c:out value="${cartList1.cart_seq}"/>" value="<c:out value="${cartList1.total_price}"/>" >
								<dt>금액</dt>
								<dd id="total_price_<c:out value="${cartList1.cart_seq}"/>"><fmt:formatNumber value="${cartList1.total_price}" type="number"/>원</dd>
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
			<div class="btnarea mgt10px">
				<a href="javascript:check_del('1');" class="btns h24px">선택삭제</a>
			</div>
		</article>
		<!-- } 관광/체험 -->
		</c:if>

		<c:if test="${not empty cartList2}">
		<!-- 숙박 { -->
		<article class="cartlist roomcart"  id="category_2">
			<h2>숙박</h2>
			<table class="cart_tbl">
				<colgroup>
					<col width="35" style="width:35px" />
					<col />
				</colgroup>
				<thead>
					<tr>
						<th><input type="checkbox" id="allcheck_2" class="allcheck_2" name="" checked onclick="allcheck(2);" /></th>
						<th>상품정보</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="cartList2" items="${cartList2}" varStatus="status">
					<input type="hidden" id="cart_seq_<c:out value="${cartList2.cart_seq}"/>" name="cart_seq" value="<c:out value="${cartList2.cart_seq}"/>" class="seq_2" />
					<input type="hidden" id="cart_price_<c:out value="${cartList2.cart_seq}"/>" name="cart_price" value="<c:out value="${cartList2.total_price}"/>" class="price_2" />
					<input type="hidden" id="cart_prod_nm_<c:out value="${cartList2.cart_seq}"/>" name="cart_prod_nm" value="<c:out value="${cartList2.prod_nm}"/>" class="prod_nm_2" />
					<input type="hidden" id="cart_min_price_<c:out value="${cartList2.cart_seq}"/>" name="cart_prod_nm" value="<c:out value="${cartList2.prod_min_price}"/>" class="prod_nm_1" />
					<input type="hidden" id="cart_store_id_<c:out value="${cartList2.cart_seq}"/>" name="cart_store_id" value="<c:out value="${cartList2.store_id}"/>" class="cart_store_id_2" />
					<tr id="tr_<c:out value="${cartList2.cart_seq}"/>">
						<td colspan="2" class="alignCenter">
							<div class="pd_info floats">
							<input type="checkbox" id="chck_<c:out value="${cartList2.cart_seq}"/>" name="check_item" class="check_2" checked value="<c:out value="${cartList2.cart_seq}"/>" onclick="check_all_btn(4);" />
							<img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${cartList2.prod_img_1}"/>&fileSn=0" onerror="this.src='/images/baseScmtour/_noImage.png';"/>
							<h4 class="subject">
							<a href="/shop/itemView.do?store_category=<c:out value="${cartList2.store_category}"/>&prod_category=<c:out value="${cartList2.prod_category}"/>&prod_id=<c:out value="${cartList2.prod_id}"/>">
							<c:out value="${cartList2.prod_nm}"/><br><div style="color:#666; padding: 8px 0; font-size: 0.8em; font-weight: normal;">(<c:out value="${cartList2.store_nm}"/>)</div>
							</a>
							</h4>
							</div>
							<dl class="nopm">
								<dt>예약룸</dt>
								<dd>
									<strong><c:out value="${cartList2.prod_room_nm }"/></strong>
								</dd>
							</dl>
							<dl class="nopm">
								<dt>예약일</dt>
								<dd>
									입실: <c:out value="${cartList2.reserve_st_dt_year}"/>년 <c:out value="${cartList2.reserve_st_dt_month}"/>월 <c:out value="${cartList2.reserve_st_dt_date}"/>일
									<br>
									퇴실: <c:out value="${cartList2.reserve_ed_dt_year}"/>년 <c:out value="${cartList2.reserve_ed_dt_month}"/>월 <c:out value="${cartList2.reserve_ed_dt_date}"/>일
								</dd>
							</dl>
							<dl class="nopm">
								<dt>예약옵션</dt>
								<dd>
								<c:choose>
									<c:when test="${empty cartList2.opt_seqs} ">-</c:when>
									<c:otherwise>
										<c:set var="opt_seq" value="${fn:split(cartList2.opt_seqs, '|||') }"/>
										<c:set var="opt_nm" value="${fn:split(cartList2.opt_nms, '|||') }"/>
										<c:set var="opt_price" value="${fn:split(cartList2.opt_prices, '|||') }"/>
										<c:set var="opt_cnt" value="${fn:split(cartList2.opt_cnts, '|||') }"/>
										<c:forEach var="opts" items="${opt_seq}" varStatus="status">
											<input type="hidden" id="opt_cnt_<c:out value="${opt_seq[status.index]}"/>" value="<c:out value="${opt_cnt[status.index]}"/>"/>
											<c:if test="${not empty opt_seq[status.index] }">
											<div class="pd_count_wrap floats">
												<span class="pd_tit"><c:out value="${opt_nm[status.index]}"/> : <fmt:formatNumber value="${opt_price[status.index]}" type="number"/>원</span>
												<span class="pd_count floats">
												   <a href="javascript:opt_calc_cnt('m','<c:out value="${opt_seq[status.index]}"/>','<c:out value="${opt_price[status.index]}"/>','<c:out value="${cartList2.cart_seq}"/>','<c:out value="${cartList2.store_category}"/>','<c:out value="${cartList2.store_id}"/>');" id="decreaseQuantity"><i class="fal fa-minus"></i></a>
												   <span id="numberUpDown_<c:out value="${opt_seq[status.index]}"/>"><c:out value="${opt_cnt[status.index]}"/></span>
												   <a href="javascript:opt_calc_cnt('p','<c:out value="${opt_seq[status.index]}"/>','<c:out value="${opt_price[status.index]}"/>','<c:out value="${cartList2.cart_seq}"/>','<c:out value="${cartList2.store_category}"/>','<c:out value="${cartList2.store_id}"/>');" id="increaseQuantity"><i class="fal fa-plus"></i></a>
												</span>
											</div>
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
							<input type="hidden" id="total_price_input_<c:out value="${cartList2.cart_seq}"/>" value="<c:out value="${cartList2.total_price}"/>" >
								<dt>금액</dt>
								<dd id="total_price_<c:out value="${cartList2.cart_seq}"/>"><fmt:formatNumber value="${cartList2.total_price}" type="number"/>원</dd>
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
			<div class="btnarea mgt10px">
				<a href="javascript:check_del('2');" class="btns h24px">선택삭제</a>
			</div>
		</article>
		<!-- } 숙박 -->
		</c:if>

		<c:if test="${not empty cartList3}">
		<!-- 맛집 { -->
		<article class="cartlist foodcart"  id="category_3">
			<h2>맛집</h2>
			<table class="cart_tbl">
				<colgroup>
					<col width="35" style="width:35px" />
					<col />
				</colgroup>
				<thead>
					<tr>
						<th><input type="checkbox" id="allcheck_3" class="allcheck_3" name="" checked onclick="allcheck(3);" /></th>
						<th>상품정보</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="cartList3" items="${cartList3}" varStatus="status">
					<input type="hidden" id="cart_seq_<c:out value="${cartList3.cart_seq}"/>" name="cart_seq" value="<c:out value="${cartList3.cart_seq}"/>" class="seq_3" />
					<input type="hidden" id="cart_price_<c:out value="${cartList3.cart_seq}"/>" name="cart_price" value="<c:out value="${cartList3.total_price}"/>" class="price_3" />
					<input type="hidden" id="cart_prod_nm_<c:out value="${cartList3.cart_seq}"/>" name="cart_prod_nm" value="<c:out value="${cartList3.prod_nm}"/>" class="prod_nm_3" />
					<input type="hidden" id="cart_min_price_<c:out value="${cartList3.cart_seq}"/>" name="cart_prod_nm" value="<c:out value="${cartList3.prod_min_price}"/>" class="prod_nm_1" />
					<input type="hidden" id="cart_store_id_<c:out value="${cartList3.cart_seq}"/>" name="cart_store_id" value="<c:out value="${cartList3.store_id}"/>" class="cart_store_id_3" />
					<tr id="tr_<c:out value="${cartList3.cart_seq}"/>">
						<td colspan="2" class="alignCenter">
							<div class="pd_info floats">
							<input type="checkbox" id="chck_<c:out value="${cartList3.cart_seq}"/>" name="check_item" class="check_3" checked value="<c:out value="${cartList3.cart_seq}"/>" onclick="check_all_btn(4);" />
							<img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${cartList3.prod_img_1}"/>&fileSn=0" onerror="this.src='/images/baseScmtour/_noImage.png';"/>
							<h4 class="subject">
							<a href="/shop/itemView.do?store_category=<c:out value="${cartList3.store_category}"/>&prod_category=<c:out value="${cartList3.prod_category}"/>&prod_id=<c:out value="${cartList3.prod_id}"/>">
							<c:out value="${cartList3.prod_nm}"/><br><div style="color:#666; padding: 8px 0; font-size: 0.8em; font-weight: normal;">(<c:out value="${cartList3.store_nm}"/>)</div>
							</a>
							</h4>
							</div>
							<dl class="nopm">
								<dt>예약일</dt>
								<dd>
									<c:out value="${cartList3.reserve_st_dt_year}"/>년 <c:out value="${cartList3.reserve_st_dt_month}"/>월 <c:out value="${cartList3.reserve_st_dt_date}"/>일
									&nbsp;
									<c:out value="${cartList3.reserve_time_hour}"/>시 <c:out value="${cartList3.reserve_time_minute}"/>분
								</dd>
							</dl>
							<dl class="nopm">
								<dt>예약옵션</dt>
								<dd>
								<c:choose>
									<c:when test="${empty cartList3.opt_seqs} ">-</c:when>
									<c:otherwise>
										<c:set var="opt_seq" value="${fn:split(cartList3.opt_seqs, '|||') }"/>
										<c:set var="opt_nm" value="${fn:split(cartList3.opt_nms, '|||') }"/>
										<c:set var="opt_price" value="${fn:split(cartList3.opt_prices, '|||') }"/>
										<c:set var="opt_cnt" value="${fn:split(cartList3.opt_cnts, '|||') }"/>
										<c:forEach var="opts" items="${opt_seq}" varStatus="status">
											<input type="hidden" id="opt_cnt_<c:out value="${opt_seq[status.index]}"/>" value="<c:out value="${opt_cnt[status.index]}"/>"/>
											<c:if test="${not empty opt_seq[status.index] }">
											<div class="pd_count_wrap floats">
												<span class="pd_tit"><c:out value="${opt_nm[status.index]}"/> : <fmt:formatNumber value="${opt_price[status.index]}" type="number"/>원</span>
												<span class="pd_count floats">
												   <a href="javascript:opt_calc_cnt('m','<c:out value="${opt_seq[status.index]}"/>','<c:out value="${opt_price[status.index]}"/>','<c:out value="${cartList3.cart_seq}"/>','<c:out value="${cartList3.store_category}"/>','<c:out value="${cartList3.store_id}"/>');" id="decreaseQuantity"><i class="fal fa-minus"></i></a>
												   <span id="numberUpDown_<c:out value="${opt_seq[status.index]}"/>"><c:out value="${opt_cnt[status.index]}"/></span>
												   <a href="javascript:opt_calc_cnt('p','<c:out value="${opt_seq[status.index]}"/>','<c:out value="${opt_price[status.index]}"/>','<c:out value="${cartList3.cart_seq}"/>','<c:out value="${cartList3.store_category}"/>','<c:out value="${cartList3.store_id}"/>');" id="increaseQuantity"><i class="fal fa-plus"></i></a>
												</span>
											</div>
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
								<input type="hidden" id="total_price_input_<c:out value="${cartList3.cart_seq}"/>" value="<c:out value="${cartList3.total_price}"/>" >
								<dt>금액</dt>
								<dd id="total_price_<c:out value="${cartList3.cart_seq}"/>"><fmt:formatNumber value="${cartList3.total_price}" type="number"/>원</dd>
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
		
		<c:set var="delivery_sum_price" value="0"/>
		<c:forEach var="cartStore4" items="${cartStore4}" varStatus="status">
			<input type="hidden" class="d_store_nm" name="d_store_nm" id="store_id_<c:out value="${cartStore4.store_id }"/>" value="<c:out value="${cartStore4.store_nm }"/>" />
			<input type="hidden" class="d_store_id" name="d_store_id" id="store_id_<c:out value="${cartStore4.store_id }"/>" value="<c:out value="${cartStore4.store_id }"/>" />
			<input type="hidden" class="d_store_def" name="d_store_def" id="store_def_<c:out value="${cartStore4.store_id }"/>" value="<c:out value="${cartStore4.store_market_default_delivery_price }"/>" />
			<input type="hidden" class="d_store_free" name="d_store_free" id="store_free_<c:out value="${cartStore4.store_id }"/>" value="<c:out value="${cartStore4.store_market_free_delivery_price }"/>" />
			<input type="hidden" class="d_store_jeju" name="d_store_jeju" id="store_jeju_<c:out value="${cartStore4.store_id }"/>" value="<c:out value="${cartStore4.store_market_jeju_delivery_price }"/>" />
			<input type="hidden" class="d_store_order" name="d_store_order" id="store_order_<c:out value="${cartStore4.store_id }"/>" value="0" />
			<input type="hidden" class="d_store_base" name="d_store_base" id="store_base_<c:out value="${cartStore4.store_id }"/>" value="def" />
			<input type="hidden" class="d_store_delivery" name="d_store_delivery" id="store_delivery_<c:out value="${cartStore4.store_id }"/>" value="0" />
		</c:forEach>
		
		<c:if test="${not empty cartList4}">
		<!-- 서천장터 { -->
		<article class="cartlist marketcart"  id="category_4">
			<h2>서천장터</h2>
			<table class="cart_tbl">
				<colgroup>
					<col width="35" style="width:35px" />
					<col />
				</colgroup>
				<thead>
					<tr>
						<th><input type="checkbox" id="allcheck_4" class="allcheck_4" name="" checked onclick="allcheck(4);" /></th>
						<th>상품정보</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="cartList4" items="${cartList4}" varStatus="status">
					<input type="hidden" id="cart_seq_<c:out value="${cartList4.cart_seq}"/>" name="cart_seq" value="<c:out value="${cartList4.cart_seq}"/>" class="seq_4" />
					<input type="hidden" id="cart_price_<c:out value="${cartList4.cart_seq}"/>" name="cart_price" value="<c:out value="${cartList4.total_price}"/>" class="price_4" />
					<input type="hidden" id="cart_prod_nm_<c:out value="${cartList4.cart_seq}"/>" name="cart_prod_nm" value="<c:out value="${cartList4.prod_nm}"/>" class="prod_nm_4" />
					<input type="hidden" id="cart_min_price_<c:out value="${cartList4.cart_seq}"/>" name="cart_prod_nm" value="<c:out value="${cartList4.prod_min_price}"/>" class="prod_nm_1" />
					<input type="hidden" id="cart_store_id_<c:out value="${cartList4.cart_seq}"/>" name="cart_store_id" value="<c:out value="${cartList4.store_id}"/>" class="cart_store_id_4" />
					<tr id="tr_<c:out value="${cartList4.cart_seq}"/>">
						<td colspan="2" class="alignCenter">
							<div class="pd_info floats">
							<input type="checkbox" id="chck_<c:out value="${cartList4.cart_seq}"/>" name="check_item" class="check_4" checked value="<c:out value="${cartList4.cart_seq}"/>" onclick="check_all_btn(4);" />
							<img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${cartList4.prod_img_1}"/>&fileSn=0" onerror="this.src='/images/baseScmtour/_noImage.png';"/>
							<h4 class="subject">
							<a href="/shop/itemView.do?store_category=<c:out value="${cartList4.store_category}"/>&prod_category=<c:out value="${cartList4.prod_category}"/>&prod_id=<c:out value="${cartList4.prod_id}"/>">
							<c:out value="${cartList4.prod_nm}"/><br><div style="color:#666; padding: 8px 0; font-size: 0.8em; font-weight: normal;">(<c:out value="${cartList4.store_nm}"/>)</div>
							</a>
							</h4>
							</div>
							<dl class="nopm">
								<dt>구매옵션</dt>
								<dd>
								<c:choose>
									<c:when test="${empty cartList4.opt_seqs} ">-</c:when>
									<c:otherwise>
										<c:set var="opt_seq" value="${fn:split(cartList4.opt_seqs, '|||') }"/>
										<c:set var="opt_nm" value="${fn:split(cartList4.opt_nms, '|||') }"/>
										<c:set var="opt_price" value="${fn:split(cartList4.opt_prices, '|||') }"/>
										<c:set var="opt_cnt" value="${fn:split(cartList4.opt_cnts, '|||') }"/>
										<c:forEach var="opts" items="${opt_seq}" varStatus="status">
											<input type="hidden" id="opt_cnt_<c:out value="${opt_seq[status.index]}"/>" value="<c:out value="${opt_cnt[status.index]}"/>"/>
											<c:if test="${not empty opt_seq[status.index] }">
											<div class="pd_count_wrap floats">
												<span class="pd_tit"><c:out value="${opt_nm[status.index]}"/> : <fmt:formatNumber value="${opt_price[status.index]}" type="number"/>원</span>
												<span class="pd_count floats">
												   <a href="javascript:opt_calc_cnt('m','<c:out value="${opt_seq[status.index]}"/>','<c:out value="${opt_price[status.index]}"/>','<c:out value="${cartList4.cart_seq}"/>','<c:out value="${cartList4.store_category}"/>','<c:out value="${cartList4.store_id}"/>');" id="decreaseQuantity"><i class="fal fa-minus"></i></a>
												   <span id="numberUpDown_<c:out value="${opt_seq[status.index]}"/>"><c:out value="${opt_cnt[status.index]}"/></span>
												   <a href="javascript:opt_calc_cnt('p','<c:out value="${opt_seq[status.index]}"/>','<c:out value="${opt_price[status.index]}"/>','<c:out value="${cartList4.cart_seq}"/>','<c:out value="${cartList4.store_category}"/>','<c:out value="${cartList4.store_id}"/>');" id="increaseQuantity"><i class="fal fa-plus"></i></a>
												</span>
											</div>
											</c:if>
										</c:forEach>
										</c:otherwise>
									</c:choose>
								</dd>
							</dl>
							<dl class="nopm">
								<input type="hidden" id="total_price_input_<c:out value="${cartList4.cart_seq}"/>" value="<c:out value="${cartList4.total_price}"/>" >
								<dt>배송비안내</dt>
								<dd>
									기본배송비 : <fmt:formatNumber value="${cartList4.store_market_default_delivery_price}" type="number"/>원 
									(제주배송비 : <fmt:formatNumber value="${cartList4.store_market_jeju_delivery_price}" type="number"/>원 )
									<br>
									업체 구매금액 총합 <strong><fmt:formatNumber value="${cartList4.store_market_free_delivery_price}" type="number"/>원 이상 무료배송</strong>
								</dd>
							</dl>
							<dl class="nopm price">
								<input type="hidden" id="total_price_input_<c:out value="${cartList4.cart_seq}"/>" value="<c:out value="${cartList4.total_price}"/>" >
								<dt>금액</dt>
								<dd id="total_price_<c:out value="${cartList4.cart_seq}"/>"><fmt:formatNumber value="${cartList4.total_price}" type="number"/>원</dd>
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
			<div class="btnarea mgt10px">
				<a href="javascript:check_del('4');" class="btns h24px">선택삭제</a>
			</div>
		</article>
		<!-- } 서천장터 -->
		</c:if>
		
		<c:set var="cate4_view" value="display: none;"/>
		<c:set var="is_cate4" value="0"/>
		<c:if test="${not empty cartList4}">
			<c:set var="cate4_view" value=""/>
			<c:set var="is_cate4" value="1"/>
		</c:if>
		
		
		<article id="cartTotalPrice"  id="order_user_form_4">
			<div class="btnarea mgt30px" id="order_user">
				<h2><strong>주문자 및 배송지 정보</strong></h2>
				<div class="con">
					<table class="option_tbl">
						<colgroup>
							<col style="width:90px" />
							<col />
						</colgroup>
						<tbody>
							<tr>
								<th>주문자</th>
								<td>
									<input type="hidden" id="order_user_id" name="order_user_id" value="<c:out value="${user_id} "/>" />
									<input type="text" id="order_user_nm" name="order_user_nm" class="order_input w100" value="<c:out value="${user_nm} "/>" />
								</td>
							</tr>
							<tr>
								<th>연락처 1</th>
								<td><input type="tel" id="order_user_hp" name="order_user_hp" class="order_input w100 phoneNumber" value="<c:out value="${user_hp} "/>" /></td>
							</tr>
							<tr>
								<th>연락처 2</th>
								<td><input type="tel" id="order_user_call" name="order_user_call" class="order_input w100 phoneNumber" value="" placeholder="(선택) 2번쨰 연락처를 기입하세요" /></td>
							</tr>
							<tr>
								<th>이메일</th>
								<td><input type="text" id="order_user_email" name="order_user_email" class="order_input w100 " value="<c:out value="${user_email} "/>" placeholder="이메일주소를 기입하세요." /></td>
							</tr>
							<%-- <c:if test="${empty user_hp || empty user_email }"> --%>
							<tr>
								<th style="height: 40px;">정보 저장동의</th>
								<td>
									<div class="agreecheck mgt10px alignLeft">
										<input type="checkbox" id="member_save" name="member_save" class="basic_check" value="Y"><label for="member_save" class="floats"><span></span><em>위 수령인,연락처1,이메일을 회원정보에 저장합니다.</em></label>
									</div>
								</td>
							</tr>
							<%-- </c:if>	 --%>							
							<tr id="addr_list" style="<c:out value="${cate4_view }"/>" >
								<th>주소록</th>
								<td>
									<select id="member_addr" name="member_addr" class="order_select w100 mgt10px" onchange="set_addr(this.value)">
										<option value="" >== 등록된 주소 선택 (<c:out value="${fn:length(addrList) }"/>개) ==</option>
										<c:forEach var="addrList" items="${addrList}" varStatus="status">
											<option value="<c:out value="${addrList.addr_seq }"/>" ><c:out value="${addrList.addr_nm}"/></option>
										</c:forEach>
									</select>
									<c:forEach var="addrList" items="${addrList}" varStatus="status">
										<input type="hidden" id="zip_<c:out value="${addrList.addr_seq }"/>" value="<c:out value="${addrList.addr_zip }"/>" />
										<input type="hidden" id="addr1_<c:out value="${addrList.addr_seq }"/>" value="<c:out value="${addrList.addr_1}"/>" />
										<input type="hidden" id="addr2_<c:out value="${addrList.addr_seq }"/>" value="<c:out value="${addrList.addr_2}"/>" />
									</c:forEach>
								</td>
							</tr>
							<tr id="addr_zip" style="<c:out value="${cate4_view }"/>" >
								<th rowspan="3">주소</th>
								<td>
									<input type="text"  id="order_user_zip" name="order_user_zip" class="order_input w100px readonly" readonly placeholder="우편번호" />
									<%--
									<a href="javascript:form_execDaumPostcode('order_user_zip', 'order_user_addr1', 'order_user_addr2','','');" class="btns graybtn mgl5px mgt10px">우편번호찾기</a>
									--%>
									<a href="javascript:form_govPostcode('order_user_zip', 'order_user_addr1', 'order_user_addr2');" class="btns graybtn mgl5px mgt10px">우편번호찾기</a>
								</td>
							</tr>
							<tr id="addr_addr1" style="<c:out value="${cate4_view }"/>" >
								<td><input type="text"  id="order_user_addr1" name="order_user_addr1" class="order_input w100 readonly" readonly placeholder="기본주소" /></td>
							</tr>
							<tr id="addr_addr2" style="<c:out value="${cate4_view }"/>" >
								<td>
									<input type="text"  id="order_user_addr2" name="order_user_addr2" class="order_input w100" placeholder="상세주소" onchange="set_delivery_price();"/>
								</td>
							</tr>
							<tr id="addr_addr3" style="<c:out value="${cate4_view }"/>" >
								<th style="height: 40px;">주소저장 동의</th>
								<td>
									<div class="agreecheck mgt10px alignLeft">
										<input type="checkbox" id="addr_save" name="addr_save" class="basic_check" value="Y">
										<label for="addr_save" class="floats"><span></span><em>위 주소를 주소록에 저장합니다.<br>예시) 집, 회사</em><input type="text" id="addr_nm" name="addr_nm" class="order_input w100 mgt5px" style="margin-top: 0;" placeholder="주소록명을 입력해주세요."><label>
									</label></label></div>
								</td>
							</tr>
							<tr id="order_meg" style="<c:out value="${cate4_view }"/>" >
								<th>배송요청</th>
								<td>
									<select id="order_user_msg" name="order_user_msg" class="order_select w100 mgt10px">
										<option value="">배송메세지 선택</option>
										<option value="무인택배 보관함에 맡겨주세요.">무인택배 보관함에 맡겨주세요.</option>
										<option value="부재시 경비실에 맡겨주세요.">부재시 경비실에 맡겨주세요.</option>
										<option value="문 앞에 놓아주세요.">문 앞에 놓아주세요.</option>
										<option value="배송전 먼저 연락을 주세요.">배송전 먼저 연락을 주세요.</option>
									</select>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>		
		</article>
		

		<!-- 쿠폰선택 { -->
		<c:if test="${not empty couponList }">
		<article id="cartTotalPrice">
			<div class="order_info_con order_agree" id="pay">
				<h2><strong>쿠폰 선택</strong></h2>
				<input type="hidden" id="coupon_sale_price" value="0" />
				<c:forEach var="couponList" items="${couponList}" varStatus="status">
					<input type="hidden" class="coupon_seq" id="coupon_seq_<c:out value="${couponList.coupon_id}"/>" value="<c:out value="${couponList.coupon_seq}"/>" /> 
					<input type="hidden" class="coupon_store_category" id="coupon_store_category_<c:out value="${couponList.coupon_id}"/>" value="<c:out value="${couponList.store_category}"/>" /> 
					<input type="hidden" class="coupon_id" id="coupon_id_<c:out value="${couponList.coupon_id}"/>" value="<c:out value="${couponList.coupon_id}"/>" /> 
					<input type="hidden" class="coupon_nm" id="coupon_nm_<c:out value="${couponList.coupon_id}"/>" value="<c:out value="${couponList.coupon_nm}"/>" /> 
					<input type="hidden" class="coupon_type" id="coupon_type_<c:out value="${couponList.coupon_id}"/>" value="<c:out value="${couponList.coupon_set_st}"/>" /> 
					<input type="hidden" class="coupon_price" id="coupon_price_<c:out value="${couponList.coupon_id}"/>" value="<c:out value="${couponList.coupon_set_price}"/>" /> 
				</c:forEach>
				<select id="order_user_coupon" name="order_user_coupon" class="order_select w100 mgt10px" onchange="coupon_calc(this.value);">
					<option value="">쿠폰을 선택하세요</option>
					<c:forEach var="couponList" items="${couponList}" varStatus="status">
					<c:set var="coupon_unit" value="원"/>
					<c:if test="${couponList.coupon_set_st eq 'P' }">
						<c:set var="coupon_unit" value="%"/>
					</c:if>
					<c:choose>
						<c:when test="${couponList.store_category eq 'CD002001'}"><c:set var="category_str" value=", 관광/체험 전용" /></c:when>
						<c:when test="${couponList.store_category eq 'CD002002'}"><c:set var="category_str" value=", 숙박 전용" /></c:when>
						<c:when test="${couponList.store_category eq 'CD002003'}"><c:set var="category_str" value=", 맛집 전용" /></c:when>
						<c:when test="${couponList.store_category eq 'CD002004'}"><c:set var="category_str" value=", 서천장터 전용" /></c:when>
						<c:otherwise><c:set var="category_str" value="" /></c:otherwise>
					</c:choose>
					<c:set var="ed_dt_ex" value="${fn:split(couponList.coupon_ed_dt,' ') }"/>
					<c:set var="ed_dt" value="${fn:split(ed_dt_ex[0],'-') }"/>
					<c:set var="ed_time" value="${fn:split(ed_dt_ex[1],':') }"/>
					<option value="<c:out value="${couponList.coupon_id}"/>">
						<c:out value="${couponList.coupon_nm}"/> (<fmt:formatNumber value="${couponList.coupon_set_price}" type="number"/><c:out value="${coupon_unit}"/> 할인<c:out value="${category_str }"/>) 
						<%-- ::::: <c:out value="${ed_dt[0] }"/>년 <c:out value="${ed_dt[1] }"/>월 <c:out value="${ed_dt[2] }"/>일 <c:out value="${ed_time[0] }"/>시  <c:out value="${ed_time[1] }"/>분 까지 사용가능 --%>
					</option>
					</c:forEach> 
				</select>
			</div>
		</article>
		</c:if>
		<!-- } 쿠폰선택 -->

		<!-- 총계 계산 { -->
		<c:set var="all_total_price" value="${category_1_total_price+category_2_total_price+category_3_total_price+category_4_total_price}"/>
		<input type="hidden" id="all_total_price" name="all_total_price" value="<c:out value="${all_total_price}"/>" />
		<input type="hidden" id="delivery_price" name="delivery_price" value="0" />
		<article id="cartTotalPrice">
			<dl class="nopm price">
				<dt>상품금액</dt>
				<dd id="all_total_price_org_str"><fmt:formatNumber value="${all_total_price}" type="number"/> <small>원</small></dd>
			</dl>
			<c:if test="${not empty couponList }">
			<dl class="nopm price" >
				<dt>쿠폰할인</dt>
				<dd id="coupon_sale_str">- 0 <small>원</small></dd>
			</dl>
			</c:if>
			<c:if test="${not empty cartList4 }">
			<dl class="nopm price" id="delivery_price_group_str">
				<dt>배송비</dt>
				<dd id="delivery_price_str"  style="line-height: 20px;">0 <small>원</small></dd>
			</dl>
			</c:if>
			<dl class="nopm price total">
				<dt>총상품가격</dt>
				<dd><strong id="all_total_price_str"><fmt:formatNumber value="${all_total_price}" type="number"/></strong> <small>원</small></dd>
			</dl>
		</article>
		
		<!-- 결제선택 { -->
		<article id="cartTotalPrice">
			<div class="order_info_con order_agree" id="pay">
				<h2><strong>결제방법 선택</strong></h2>
				<select id="order_user_pay" name="order_user_pay" class="order_select w100 mgt10px" onchange="set_pay_type(this.value)">
					<option value="card">신용카드</option> 
					<option value="realbank">실시간 계좌이체</option>
					<option value="virtual">가상계좌</option>
					<%--
					<option value="bank">무통장입금</option>
					--%>
				</select>
			</div>
			<div class="order_info_con order_agree" id="pay_time" style="display: none;">
				<select id="order_time" name="order_time" class="order_select w100 mgt10px" >
					<option value="">입금시간을 선택하세요.</option> 
					<option value="3">주문 후, 3시간내 입금</option> 
					<option value="6">주문 후, 6시간내 입금</option> 
					<option value="9">주문 후, 9시간내 입금</option> 
					<option value="12">주문 후, 12시간내 입금</option> 
					<option value="15">주문 후, 15시간내 입금</option> 
					<option value="18">주문 후, 18시간내 입금</option> 
					<option value="21">주문 후, 21시간내 입금</option> 
					<option value="24">주문 후, 24시간내 입금</option> 
				</select>
			</div>
		</article>
		<!-- } 결제선택-->
		<!-- } 총계 계산 -->
		<input type="hidden" id="is_cate4" value="<c:out value="${is_cate4 }"/>"/>		
		<div class="buybtnArea alignCenter">
			<input type="hidden" id="is_order" value="N" />
			<button type="submit" class="btns h50px orangebtn w40">주문하기</a>
		</div>

		
	</c:when>
	<c:otherwise>
		<!-- 상품이 없을 때 { -->
		<div class="cf_noitem alignCenter">
			장바구니에 상품이 존재하지 않습니다.
		</div>
		<!-- } 상품이 없을 때 -->
	</c:otherwise>
</c:choose>
	</form>
	</section>
	<!-- } 장바구니 -->
	
	</div>

	<c:if test="${not empty cartList4}">
	<script>set_delivery_price()</script>
	</c:if>

<%@ include file="../AjaxResult/zipSearch.jsp" %>
<c:import url="/Api/IncludeBottom.do"/>