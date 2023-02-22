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
		<c:if test="${empty orderDetailList }">
		<script>alert('데이터가 존재하지 않거나, 취소된 주문입니다.'); location.replace('/mypage/orderList.do?pageIndex=<c:out value="${pageIndex}"/>'); </script>
		</c:if>
		<!-- } 상품이 없을 때 -->

		<c:set var="is_cate4" value="N"/>
		<c:if test="${not empty orderDetailList }">
		
		<c:set var="total_price" value="0"/>
		<c:set var="all_cancel" value="0"/>
		
		<article class="cartlist travelcart">
			<h2>주문내역
			<span id="allCancelBtn" style="display: none;">
				- <span style="border:1px solid #f57d21; background-color: #f57d21; color:#fff; font-size:14px; border-radius: 3px; height: 24px;  padding: 2px 20px; cursor: pointer; " onclick="order_cancel('<c:out value="${order_id }"/>', '<c:out value="${pageIndex }"/>');"> 전체 주문취소 </span>
			</span>
			</h2>
			<h3 style="margin-bottom: 10px;">주문번호 - <c:out value="${order_id }"/></h3>
			<table class="cart_tbl">
				<colgroup>
					<col width="110" style="width:110px">
					<col>
				</colgroup>
				<thead>
					<tr>
						<th colspan="2">상품정보</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach var="orderDetailList" items="${orderDetailList}" varStatus="status">
				
				<c:if test="${orderDetailList.od_store_category eq 'CD002001' }">
					<input type="hidden" id="prod_img_<c:out value="${orderDetailList.od_seq }"/>" value="<c:out value="${orderDetailList.prod_img_1 }"/>" />
					<input type="hidden" id="prod_nm_<c:out value="${orderDetailList.od_seq }"/>" value="<c:out value="${orderDetailList.od_prod_nm }"/> "/>
					<input type="hidden" id="prod_comment_<c:out value="${orderDetailList.od_seq }"/>" value="<c:out value="${orderDetailList.prod_comment }"/> "/>
					<tr>
						<td class="alignCenter">
						    <img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${orderDetailList.prod_img_1}"/>&fileSn=0" onerror="this.src='/images/baseScmtour/_noImage.png';"/>
						    <c:choose>
                       			<c:when test="${orderDetailList.od_order_stat eq 'READY'}">
                        			<span id="stat_<c:out value="${orderDetailList.od_seq }"/>" class="btns orangebtn h24px w100 mgt5px" >입금대기</span>
                       			</c:when>
				    			<c:when test="${orderDetailList.od_order_stat eq 'PAYMENT'}">
                        			<span id="stat_<c:out value="${orderDetailList.od_seq }"/>" class="btns orangebtn h24px w100 mgt5px" onclick="save_use_mart('<c:out value="${orderDetailList.od_seq }"/>','CD002001')" style="cursor: pointer;" >사용확인</span>
                       			</c:when>
                       			<c:when test="${orderDetailList.od_order_stat eq 'CANCEL'}">
                       				<c:set var="all_cancel" value="${all_cancel + 1 }"/>
	                       			<span id="stat_<c:out value="${orderDetailList.od_seq }"/>" class="btns garybtn h24px w100 mgt5px" >취소</span>
                       			</c:when>
                       			<c:when test="${orderDetailList.od_order_stat eq 'CANCELING'}">
                       				<c:set var="all_cancel" value="${all_cancel + 1 }"/>
                        			<span id="stat_<c:out value="${orderDetailList.od_seq }"/>" class="btns orangebtn h24px w100 mgt5px" >취소요청중</span>
                       			</c:when>
                            	<c:otherwise>
	                            	<c:set var="all_cancel" value="${all_cancel + 1 }"/>
	                            	<span id="stat_<c:out value="${orderDetailList.od_seq }"/>" class="btns lightgraybtn h24px w100 mgt5px">사용완료</span>
                            	</c:otherwise>
                            </c:choose>
                            <c:if test="${orderDetailList.od_order_stat eq 'PAYMENT' && orderMasterInfo.order_pay_st eq 'C'}">
	                            <br>
	                            <span onclick="order_item_cancel('<c:out value="${order_id }"/>','<c:out value="${orderDetailList.od_seq }"/>', '<c:out value="${pageIndex }"/>');" class="btns lightgraybtn h24px w100 mgt5px" style="cursor: pointer;" >취소신청</span>
                            </c:if>
				        </td>
						<td>
							<h4 class="subject"><c:out value="${orderDetailList.od_prod_nm }"/></h4>
							<dl class="nopm">
								<dt>예약일</dt>
								<dd id="prod_date_<c:out value="${orderDetailList.od_seq }"/>"><c:out value="${orderDetailList.od_st_dt}"/></dd>
							</dl>
							<c:set var="od_prod_opt_seq" value="${fn:split(orderDetailList.od_prod_opt_seq,'|||')}" />
							<c:set var="od_prod_opt_nm" value="${fn:split(orderDetailList.od_prod_opt_nm,'|||')}" />
							<c:set var="od_prod_opt_price" value="${fn:split(orderDetailList.od_prod_opt_price,'|||')}" />
							<c:set var="od_prod_opt_cnt" value="${fn:split(orderDetailList.od_prod_opt_cnt,'|||')}" />
							<c:if test="${not empty od_prod_opt_seq}">
							<dl class="nopm">
								<dt>구매인원</dt>
								<dd id="prod_opt_<c:out value="${orderDetailList.od_seq }"/>">
									<c:forEach var="od_prod_opt" items="${od_prod_opt_seq}" varStatus="opts">
									<c:out value="${od_prod_opt_nm[opts.index] }"/> : <c:out value="${od_prod_opt_price[opts.index] * od_prod_opt_cnt[opts.index] }"/>원 
									(<c:out value="${od_prod_opt_cnt[opts.index] }"/>명)<br />
									<c:set var="calc_price" value="${calc_price + (od_prod_opt_price[opts.index] * od_prod_opt_cnt[opts.index]) }"/>
									<c:set var="calc_order_price" value="${calc_order_price + (od_prod_opt_price[opts.index] * od_prod_opt_cnt[opts.index]) }"/>
									</c:forEach>
								</dd>
							</dl>
							</c:if>
							<dl class="nopm">
								<dt>예약자정보</dt>
								<dd><c:out value="${orderDetailList.od_user_nm}"/> (<c:out value="${orderDetailList.od_user_call}"/>)</dd>
							</dl>
							<dl class="nopm price">
								<dt>금액</dt>
								<dd><fmt:formatNumber value="${orderDetailList.od_prod_total_price}" type="number"/>원</dd>
								<c:set var="total_price" value="${total_price + orderDetailList.od_prod_total_price }"/>
							</dl>
						</td>
					</tr>
				</c:if>
				<c:if test="${orderDetailList.od_store_category eq 'CD002002' }">
					<input type="hidden" id="prod_img_<c:out value="${orderDetailList.od_seq }"/>" value="<c:out value="${orderDetailList.prod_img_1 }"/>" />
					<input type="hidden" id="prod_nm_<c:out value="${orderDetailList.od_seq }"/>" value="<c:out value="${orderDetailList.od_prod_nm }"/> "/>
					<input type="hidden" id="prod_comment_<c:out value="${orderDetailList.od_seq }"/>" value="<c:out value="${orderDetailList.prod_comment }"/> "/>
					<tr>
						<td class="alignCenter">
						    <img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${orderDetailList.prod_img_1}"/>&fileSn=0" onerror="this.src='/images/baseScmtour/_noImage.png';"/>
						    <c:choose>
                       			<c:when test="${orderDetailList.od_order_stat eq 'READY'}">
                        			<span id="stat_<c:out value="${orderDetailList.od_seq }"/>" class="btns orangebtn h24px w100 mgt5px" >입금대기</span>
                       			</c:when>
				    			<c:when test="${orderDetailList.od_order_stat eq 'PAYMENT'}">
                        			<span id="stat_<c:out value="${orderDetailList.od_seq }"/>" class="btns orangebtn h24px w100 mgt5px" onclick="save_use_mart('<c:out value="${orderDetailList.od_seq }"/>','CD002001')" style="cursor: pointer;" >사용확인</span>
                       			</c:when>
                       			<c:when test="${orderDetailList.od_order_stat eq 'CANCEL'}">
                       				<c:set var="all_cancel" value="${all_cancel + 1 }"/>
	                       			<span id="stat_<c:out value="${orderDetailList.od_seq }"/>" class="btns garybtn h24px w100 mgt5px" >취소</span>
                       			</c:when>
                       			<c:when test="${orderDetailList.od_order_stat eq 'CANCELING'}">
                       				<c:set var="all_cancel" value="${all_cancel + 1 }"/>
                        			<span id="stat_<c:out value="${orderDetailList.od_seq }"/>" class="btns orangebtn h24px w100 mgt5px" >취소요청중</span>
                       			</c:when>
                            	<c:otherwise>
	                            	<c:set var="all_cancel" value="${all_cancel + 1 }"/>
	                            	<span id="stat_<c:out value="${orderDetailList.od_seq }"/>" class="btns lightgraybtn h24px w100 mgt5px">사용완료</span>
                            	</c:otherwise>
                            </c:choose>
                            <c:if test="${orderDetailList.od_order_stat eq 'PAYMENT' && orderMasterInfo.order_pay_st eq 'C'}">
	                            <br>
	                            <span onclick="order_item_cancel('<c:out value="${order_id }"/>','<c:out value="${orderDetailList.od_seq }"/>', '<c:out value="${pageIndex }"/>');" class="btns lightgraybtn h24px w100 mgt5px" style="cursor: pointer;" >취소신청</span>
                            </c:if>
				        </td>
						<td>
							<h4 class="subject"><c:out value="${orderDetailList.od_prod_nm }"/></h4>
							<dl class="nopm">
								<dt>예약일</dt>
								<dd id="prod_date_<c:out value="${orderDetailList.od_seq }"/>">입실 : <c:out value="${orderDetailList.od_st_dt}"/><br>퇴실 : <c:out value="${orderDetailList.od_ed_dt}"/></dd>
							</dl>
							<c:set var="od_prod_opt_seq" value="${fn:split(orderDetailList.od_prod_opt_seq,'|||')}" />
							<c:set var="od_prod_opt_nm" value="${fn:split(orderDetailList.od_prod_opt_nm,'|||')}" />
							<c:set var="od_prod_opt_price" value="${fn:split(orderDetailList.od_prod_opt_price,'|||')}" />
							<c:set var="od_prod_opt_cnt" value="${fn:split(orderDetailList.od_prod_opt_cnt,'|||')}" />
							<c:if test="${not empty od_prod_opt_seq}">
							<dl class="nopm">
								<dt>숙박정보</dt>
								<dd id="prod_opt_<c:out value="${orderDetailList.od_seq }"/>">
									<c:forEach var="od_prod_opt" items="${od_prod_opt_seq}" varStatus="opts">
									<c:out value="${od_prod_opt_nm[opts.index] }"/> : <c:out value="${od_prod_opt_price[opts.index] * od_prod_opt_cnt[opts.index] }"/>원 
									(<c:out value="${od_prod_opt_cnt[opts.index] }"/>명)<br />
									<c:set var="calc_price" value="${calc_price + (od_prod_opt_price[opts.index] * od_prod_opt_cnt[opts.index]) }"/>
									<c:set var="calc_order_price" value="${calc_order_price + (od_prod_opt_price[opts.index] * od_prod_opt_cnt[opts.index]) }"/>
									</c:forEach>
								</dd>
							</dl>
							</c:if>
							<dl class="nopm">
								<dt>예약자정보</dt>
								<dd><c:out value="${orderDetailList.od_user_nm}"/> (<c:out value="${orderDetailList.od_user_call}"/>)</dd>
							</dl>
							<dl class="nopm price">
								<dt>금액</dt>
								<dd><fmt:formatNumber value="${orderDetailList.od_prod_total_price}" type="number"/>원</dd>
								<c:set var="total_price" value="${total_price + orderDetailList.od_prod_total_price }"/>
							</dl>
						</td>
					</tr>
				</c:if>
				<c:if test="${orderDetailList.od_store_category eq 'CD002003' }">
					<input type="hidden" id="prod_img_<c:out value="${orderDetailList.od_seq }"/>" value="<c:out value="${orderDetailList.prod_img_1 }"/>" />
					<input type="hidden" id="prod_nm_<c:out value="${orderDetailList.od_seq }"/>" value="<c:out value="${orderDetailList.od_prod_nm }"/> "/>
					<input type="hidden" id="prod_comment_<c:out value="${orderDetailList.od_seq }"/>" value="<c:out value="${orderDetailList.prod_comment }"/> "/>
					<tr>
						<td class="alignCenter">
						    <img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${orderDetailList.prod_img_1}"/>&fileSn=0" onerror="this.src='/images/baseScmtour/_noImage.png';"/>
						    <c:choose>
                       			<c:when test="${orderDetailList.od_order_stat eq 'READY'}">
                        			<span id="stat_<c:out value="${orderDetailList.od_seq }"/>" class="btns orangebtn h24px w100 mgt5px" >입금대기</span>
                       			</c:when>
				    			<c:when test="${orderDetailList.od_order_stat eq 'PAYMENT'}">
                        			<span id="stat_<c:out value="${orderDetailList.od_seq }"/>" class="btns orangebtn h24px w100 mgt5px" onclick="save_use_mart('<c:out value="${orderDetailList.od_seq }"/>','CD002001')" style="cursor: pointer;" >사용확인</span>
                       			</c:when>
                       			<c:when test="${orderDetailList.od_order_stat eq 'CANCEL'}">
                       				<c:set var="all_cancel" value="${all_cancel + 1 }"/>
	                       			<span id="stat_<c:out value="${orderDetailList.od_seq }"/>" class="btns garybtn h24px w100 mgt5px" >취소</span>
                       			</c:when>
                       			<c:when test="${orderDetailList.od_order_stat eq 'CANCELING'}">
                       				<c:set var="all_cancel" value="${all_cancel + 1 }"/>
                        			<span id="stat_<c:out value="${orderDetailList.od_seq }"/>" class="btns orangebtn h24px w100 mgt5px" >취소요청중</span>
                       			</c:when>
                            	<c:otherwise>
	                            	<c:set var="all_cancel" value="${all_cancel + 1 }"/>
	                            	<span id="stat_<c:out value="${orderDetailList.od_seq }"/>" class="btns lightgraybtn h24px w100 mgt5px">사용완료</span>
                            	</c:otherwise>
                            </c:choose>
                            <c:if test="${orderDetailList.od_order_stat eq 'PAYMENT' && orderMasterInfo.order_pay_st eq 'C'}">
	                            <br>
	                            <span onclick="order_item_cancel('<c:out value="${order_id }"/>','<c:out value="${orderDetailList.od_seq }"/>', '<c:out value="${pageIndex }"/>');" class="btns lightgraybtn h24px w100 mgt5px" style="cursor: pointer;" >취소신청</span>
                            </c:if>
				        </td>
						<td>
							<h4 class="subject"><c:out value="${orderDetailList.od_prod_nm }"/></h4>
							<dl class="nopm">
								<dt>예약일</dt>
								<dd id="prod_date_<c:out value="${orderDetailList.od_seq }"/>">
									<c:out value="${orderDetailList.od_st_dt}"/>
								</dd>
							</dl>
							<c:set var="od_prod_opt_seq" value="${fn:split(orderDetailList.od_prod_opt_seq,'|||')}" />
							<c:set var="od_prod_opt_nm" value="${fn:split(orderDetailList.od_prod_opt_nm,'|||')}" />
							<c:set var="od_prod_opt_price" value="${fn:split(orderDetailList.od_prod_opt_price,'|||')}" />
							<c:set var="od_prod_opt_cnt" value="${fn:split(orderDetailList.od_prod_opt_cnt,'|||')}" />
							<c:if test="${not empty od_prod_opt_seq}">
							<dl class="nopm">
								<dt>메뉴예약</dt>
								<dd id="prod_opt_<c:out value="${orderDetailList.od_seq }"/>">
									<c:forEach var="od_prod_opt" items="${od_prod_opt_seq}" varStatus="opts">
									<c:out value="${od_prod_opt_nm[opts.index] }"/> : <c:out value="${od_prod_opt_price[opts.index] * od_prod_opt_cnt[opts.index] }"/>원 
									(<c:out value="${od_prod_opt_cnt[opts.index] }"/>명)<br />
									<c:set var="calc_price" value="${calc_price + (od_prod_opt_price[opts.index] * od_prod_opt_cnt[opts.index]) }"/>
									<c:set var="calc_order_price" value="${calc_order_price + (od_prod_opt_price[opts.index] * od_prod_opt_cnt[opts.index]) }"/>
									</c:forEach>
								</dd>
							</dl>
							</c:if>
							<dl class="nopm">
								<dt>예약자정보</dt>
								<dd><c:out value="${orderDetailList.od_user_nm}"/> (<c:out value="${orderDetailList.od_user_call}"/>)</dd>
							</dl>
							<dl class="nopm price">
								<dt>금액</dt>
								<dd><fmt:formatNumber value="${orderDetailList.od_prod_total_price}" type="number"/>원</dd>
								<c:set var="total_price" value="${total_price + orderDetailList.od_prod_total_price }"/>
							</dl>
						</td>
					</tr>
				</c:if>
				
				<c:if test="${orderDetailList.od_store_category eq 'CD002004' }">
				<c:set var="is_cate4" value="Y"/>
					<tr>
						<td class="alignCenter">
							<img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${orderDetailList.prod_img_1}"/>&fileSn=0" onerror="this.src='/images/baseScmtour/_noImage.png';"/>
						    <c:choose>
                       			<c:when test="${orderDetailList.od_order_stat eq 'READY'}">
                        			<span id="stat_<c:out value="${orderDetailList.od_seq }"/>" class="btns orangebtn h24px w100 mgt5px" >입금대기</span>
                       			</c:when>
				    			<c:when test="${orderDetailList.od_order_stat eq 'PAYMENT'}">
                        			<span id="stat_<c:out value="${orderDetailList.od_seq }"/>" class="btns orangebtn h24px w100 mgt5px" >결제완료</span>
                       			</c:when>
                       			<c:when test="${orderDetailList.od_order_stat eq 'CANCEL'}">
                       				<c:set var="all_cancel" value="${all_cancel + 1 }"/>
	                       			<span id="stat_<c:out value="${orderDetailList.od_seq }"/>" class="btns garybtn h24px w100 mgt5px" >취소</span>
                       			</c:when>
                       			<c:when test="${orderDetailList.od_order_stat eq 'CANCELING'}">
                       				<c:set var="all_cancel" value="${all_cancel + 1 }"/>
                        			<span id="stat_<c:out value="${orderDetailList.od_seq }"/>" class="btns orangebtn h24px w100 mgt5px" >취소요청중</span>
                       			</c:when>
                       			<c:when test="${orderDetailList.od_order_stat eq 'TRANSFER'}">
                       				<c:set var="all_cancel" value="${all_cancel + 1 }"/>
                        			<span id="stat_<c:out value="${orderDetailList.od_seq }"/>" class="btns orangebtn h24px w100 mgt5px" >배송중</span>
                       			</c:when>
                            	<c:otherwise>
	                            	<c:set var="all_cancel" value="${all_cancel + 1 }"/>
	                            	<span id="stat_<c:out value="${orderDetailList.od_seq }"/>" class="btns lightgraybtn h24px w100 mgt5px">완료</span>
                            	</c:otherwise>
                            </c:choose>
                            <c:if test="${orderDetailList.od_order_stat eq 'PAYMENT' && orderMasterInfo.order_pay_st eq 'C'}">
	                            <br>
	                            <span onclick="order_item_cancel('<c:out value="${order_id }"/>','<c:out value="${orderDetailList.od_seq }"/>', '<c:out value="${pageIndex }"/>');" class="btns lightgraybtn h24px w100 mgt5px" style="cursor: pointer;" >취소신청</span>
                            </c:if>
						</td>
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
								<c:set var="total_price" value="${total_price + orderDetailList.od_prod_price + orderDetailList.od_prod_total_price }"/>
							</dl>
							<c:if test="${orderDetailList.od_order_stat eq 'TRANSFER' || orderDetailList.od_order_stat eq 'COMPLETE'}">
							<dl class="nopm">
								<dt>배송정보</dt>
								<dd>
									<c:out value="${orderDetailList.delivery_company_nm }"/> <c:out value="${orderDetailList.od_delivery_number }"/>
									<c:if test="${not empty orderDetailList.delivery_company_nm && not empty orderDetailList.od_delivery_number }">
									<a href="javascript:transfer_history('<c:out value="${orderDetailList.od_delivery_company_id }"/>','<c:out value="${orderDetailList.od_delivery_number }"/>')" class="btns orangebtn h24px">배송조회</a>
									</c:if>								
								</dd>
							</dl>
							</c:if>
						</td>
					</tr>
				</c:if>

				</c:forEach>
				</tbody>
				<tfoot>
				<c:if test="${is_cate4 eq 'Y' }">
					<tr>
						<td colspan="2" class="alignRight" style="font-weight: normal; font-size: 0.9em;">
						(<c:out value="${orderMasterInfo.order_zip}"/>) <c:out value="${orderMasterInfo.order_addr1}"/> <c:out value="${orderMasterInfo.order_addr2}"/>
						<br>
						<c:out value="${orderMasterInfo.order_user_nm}"/> <c:out value="${orderMasterInfo.order_hp}"/>
						<c:if test="${not empty orderMasterInfo.order_tel}">
						 / <c:out value="${orderMasterInfo.order_tel}"/>
						</c:if>
						</td>
					</tr>
				</c:if>
				<c:if test="${orderMasterInfo.order_total_delivery_price > 0 }">
				<c:set var="total_price" value="${total_price + orderMasterInfo.order_total_delivery_price }"/>
					<tr>
						<td colspan="2" class="alignRight"><small>배송비</small> <strong><fmt:formatNumber value="${orderMasterInfo.order_total_delivery_price}" type="number"/></strong> <small>원</small></td>
					</tr>
				</c:if>
				<c:if test="${orderMasterInfo.order_coupon_price > 0 }">
				<c:set var="total_price" value="${total_price - orderMasterInfo.order_coupon_price }"/>
					<tr>
						<td colspan="2" class="alignRight"><small>쿠폰할인</small> <strong>- <fmt:formatNumber value="${orderMasterInfo.order_coupon_price}" type="number"/></strong> <small>원</small></td>
					</tr>
				</c:if>
					<tr>
						<td colspan="2" class="alignRight"><small>주문금액</small> <strong><fmt:formatNumber value="${total_price}" type="number"/></strong> <small>원</small></td>
					</tr>
				</tfoot>
			</table>
		</article>
		</c:if>
		
			<div class="btnArea alignRight mgt20px mgb20px">
				<ul class="nopm floats">
					<li><a href="/mypage/orderList.do?pageIndex=<c:out value="${pageIndex }"/>" class="btns"><i class="far fa-bars"></i> 목록</a></li>
				</ul>
			</div>
			
			<input type="hidden" id="cancel_chk" value="<c:out value="${all_cancel }"/>" />
			<script>
			var is_all_cancel_check = $("#cancel_chk").val();
			if(is_all_cancel_check == 0) {
				$("#allCancelBtn").show();
			} else {
				$("#allCancelBtn").empty();
			}
			</script>
						
	</section>
	
	<!-- 모달팝업 > 사용확인 { -->
	<div id="reservInfo" class="modal fade reservinfo" tabindex="1" role="dialog">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header bgOrangeGra">
					<button type="button" class="closebtn" data-dismiss="modal" aria-label="Close"><i class="fal fa-times"></i></button>
					<h4 class="modal-title" id="view_title"></h4>
				</div>
				<div class="modal-body" id="order">
					<!-- 구매 상품 정보 { -->
					<article id="orderProduct">
						<div class="op_list">
							<em class="pic" id="view_img"><img src="./common/img/sample_product1.jpg" alt="" /></em>
							<em class="txt">
								<span class="subject" id="view_title_sub"></span>
								<span class="subcon" id="view_comment">
									
								</span>
							</em>
						</div>
					</article>
					<!-- } 구매 상품 정보 -->

					<!-- 주문정보 { -->
					<article id="orderPrice" class="order_info" style="padding:1em">
						<h2>예약정보</h2>
						<table class="order_tbl">
							<colgroup>
								<col />
								<col />
							</colgroup>
							<tbody>
								<tr>
									<th><span class="btns h24px whitebtn" >예약일</span></th>
									<td class="alignRight" id="view_date"></td>
								</tr>
								<tr>
									<th><span class="btns h24px whitebtn" id="view_opt_nm">구매인원</span></th>
									<td class="alignRight" id="view_opt"></td>
								</tr>
							</tbody>
							<tfoot>
								<tr>
									<th>총 금액</th>
									<td class="alignRight" id="view_price"> <small>원</small></td>
								</tr>
							</tfoot>
						</table>
					</article>
					<!-- } 주문정보 -->

					<div class="btnarea alignCenter mgt20px">
						<p class="colorRed">사용확인을 누르면 재사용이 불가합니다.</p>
						<input type="hidden" id="user_seq" value="" />
						<a href="#;" onclick="prod_use();" class="btns h50px orangebtn w40 fsize18 mgt10px">사용확인</a>
					</div>
					
				</div>
			</div>
		</div>
	</div>
	<!-- } 모달팝업 > 사용확인 -->

<c:import url="/Api/IncludeBottom.do"/>