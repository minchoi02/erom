<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:import url="/Api/IncludeTop.do"/>	
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
	
    <div id="cart">
    	<div class="sub-top">
        	<div class="inner">
                <div class="title-top"><img src="/resource/img/cart-icon.svg" /><span>장바구니</span></div>
                <div class="navi">
                    <span><strong>장바구니</strong></span>
                    <span><i class="xi-angle-right-min"></i></span>
                    <span>주문/결제</span>
                    <span><i class="xi-angle-right-min"></i></span>
                    <span>주문완료</span>
                </div>
            </div>
        </div>
    	<div class="inner">
            <div class="cartAreaAdd">
                <div class="txtArea">
                	<h1>상품평 <span><strong>${fn:length(cartList4)}</strong>개</span></h1>
                    <div class="form-check posiabsol">
                        <input class="form-check-input" type="checkbox" id="checkTrigger1">
                        <label class="form-check-label" for="checkTrigger1">전체상품</label>
                    </div>
                    <div class="select-btn"><button class="btn">선택 삭제</button></div>
                </div>
               
                <div class="cart-list">
					<!-- 리스트 -->
					<c:forEach var="cartList4" items="${cartList4}" varStatus="status">
					<input type="hidden" id="cart_seq_<c:out value="${cartList4.cart_seq}"/>" name="cart_seq" value="<c:out value="${cartList4.cart_seq}"/>" class="seq_4" />
					<input type="hidden" id="cart_price_<c:out value="${cartList4.cart_seq}"/>" name="cart_price" value="<c:out value="${cartList4.total_price}"/>" class="price_4" />
					<input type="hidden" id="cart_prod_nm_<c:out value="${cartList4.cart_seq}"/>" name="cart_prod_nm" value="<c:out value="${cartList4.prod_nm}"/>" class="prod_nm_4" />
					<input type="hidden" id="cart_min_price_<c:out value="${cartList4.cart_seq}"/>" name="cart_prod_nm" value="<c:out value="${cartList4.prod_min_price}"/>" class="prod_nm_1" />
					<input type="hidden" id="cart_store_id_<c:out value="${cartList4.cart_seq}"/>" name="cart_store_id" value="<c:out value="${cartList4.store_id}"/>" class="cart_store_id_4" />
                	<div class="listArea">
                    	<div class="check">
                        	<div class="form-check posiabsol">
                                <input class="form-check-input" type="checkbox" id="checkTrigger2" name="check_item" checked value="<c:out value="${cartList4.cart_seq}"/>">
                                <label class="form-check-label" for="checkTrigger2"></label>
                            </div>
                        </div>
                        <div class="imgArea">
                        <a href="/shop/itemView.do?store_category=<c:out value="${cartList4.store_category}"/>&prod_category=<c:out value="${cartList4.prod_category}"/>&prod_id=<c:out value="${cartList4.prod_id}"/>">
                        <img src="/resource/img/po_product_img4.jpg"/></a></div>
                        <%-- <img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${cartList4.prod_img_1}"/>" /> --%>
                       
                        <div class="subject">
                        	<h1>${cartList4.prod_nm}</h1>
<!--                             <span>15g x 10포 / 3개입</span>
                            <p>옵션 : 3박스 세트</p> -->
                        </div>
                        <div class="count">
                        	<div>
                        		<c:set var="opt_seq" value="${fn:split(cartList4.opt_seqs, '|||') }"/>
								<c:set var="opt_nm" value="${fn:split(cartList4.opt_nms, '|||') }"/>
								<c:set var="opt_price" value="${fn:split(cartList4.opt_prices, '|||') }"/>
								<c:set var="opt_cnt" value="${fn:split(cartList4.opt_cnts, '|||') }"/>
								<c:forEach var="opts" items="${opt_seq}" varStatus="status">
								<input type="hidden" id="opt_cnt_<c:out value="${opt_seq[status.index]}"/>" value="<c:out value="${opt_cnt[status.index]}"/>"/>
                                <a href="javascript:opt_calc_cnt('m','<c:out value="${opt_seq[status.index]}"/>','<c:out value="${opt_price[status.index]}"/>','<c:out value="${cartList4.cart_seq}"/>','<c:out value="${cartList4.store_category}"/>','<c:out value="${cartList4.store_id}"/>');" id="decreaseQuantity"><i class="xi-minus"></i></a>
                                <strong id="numberUpDown_<c:out value="${opt_seq[status.index]}"/>"><c:out value="${opt_cnt[status.index]}"/></strong>
                                <a href="javascript:opt_calc_cnt('p','<c:out value="${opt_seq[status.index]}"/>','<c:out value="${opt_price[status.index]}"/>','<c:out value="${cartList4.cart_seq}"/>','<c:out value="${cartList4.store_category}"/>','<c:out value="${cartList4.store_id}"/>');" id="increaseQuantity"><i class="xi-plus"></i></a>
                                </c:forEach>
                            </div>
                        </div>
                        <div class="cost">
						<input type="hidden" id="total_price_input_<c:out value="${cartList4.cart_seq}"/>" value="<c:out value="${cartList4.total_price}"/>" >
                        	<strong id="total_price_<c:out value="${cartList4.cart_seq}"/>"><fmt:formatNumber value="${cartList4.total_price}" type="number"/>원</strong><br class="pc-style">(10,000원 적립)
                        </div>
                        <c:set var="category_4_total_price" value="${category_4_total_price + cartList4.total_price }"/>
                        <div class="deli">
                        	<strong><fmt:formatNumber value="${cartList4.store_market_default_delivery_price}" type="number"/>원</strong><br class="pc-style">배송비
                        </div>
                        <div class="btnArea">
                        	<button class="btn order">주문하기</button>
                            <button class="btn del">삭제하기</button>
                        </div>
                    </div>
                    </c:forEach>
                    <!--// 리스트 -->
                    <!-- 리스트 -->
                	<div class="listArea">
                    	<div class="check">
                        	<div class="form-check posiabsol">
                                <input class="form-check-input" type="checkbox" id="checkTrigger2">
                                <label class="form-check-label" for="checkTrigger2"></label>
                            </div>
                        </div>
                        <div class="imgArea"><a href=""><img src="/resource/img/po_product_img4.jpg" /></a></div>
                        <div class="subject">
                        	<h1>이벤트 상품 )) 면역비책 발효홍삼</h1>
                            <span>15g x 10포 / 3개입</span>
                            <p>옵션 : 3박스 세트</p>
                        </div>
                        <div class="count">
                        	<div>
                                <button><i class="xi-minus"></i></button>
                                <strong>1</strong>
                                <button><i class="xi-plus"></i></button>
                            </div>
                        </div>
                        <div class="cost">
                        	<strong>125,000원</strong><br class="pc-style">(10,000원 적립)
                        </div>
                        <div class="deli">
                        	<strong>3,000원</strong><br class="pc-style">배송비
                        </div>
                        <div class="btnArea">
                        	<button class="btn order">주문하기</button>
                            <button class="btn del">삭제하기</button>
                        </div>
                    </div>
                    <!--// 리스트 -->
                   
                    <!-- 토탈 -->
                    <c:set var="all_total_price" value="${category_4_total_price}"/>
 					<input type="hidden" id="all_total_price" name="all_total_price" value="<c:out value="${all_total_price}"/>" />
                	<div class="totalArea">
                    	<div class="totalCost">
                        	<h1>총 결제금액</h1>
                            <span id="category_4_total_price_str"><fmt:formatNumber value="${all_total_price}" type="number"/>원</span>
                        </div>
                        <div class="totalCost2">
                        	<h1>총 상품금액</h1>
                            <span><fmt:formatNumber value="${all_total_price}" type="number"/>원</span>
                        </div>
                        <div class="totalDeli">
                        	<h1>배송비</h1>
                            <span id="delivery_price_str">0원</span>
                        </div>
                        <div class="totalPoint">
                        	<h1>총 예상 적립금</h1>
                            <span>20,000원</span>
                        </div>
                    </div>
                    <!--// 토탈 -->
                    <div class="totalBtn"><a href="/order.do"><button  class="btn">주문결제</button></a></div>
                </div>
            </div>
        </div>
    </div>
	
<c:import url="/Api/IncludeBottom.do"/>