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

<!-- 예약내역 { -->
	<section id="cartList" class="cart_favorites">
		<h1><em><i class="fas fa-gifts"></i> 예약내역</em></h1>

		<div class="cf_tab">
			<ul class="nopm floats">
				<li><a href="/mypage/orderReserveList.do" class="active">관광/체험, 숙박, 맛집</a></li>
				<li><a href="/mypage/orderMarketList.do">서천장터</a></li>
			</ul>
		</div>

		<c:if test="${empty orderDetailList1 && empty orderDetailList2 && empty orderDetailList3}">
		<!-- 상품이 없을 때 { -->
		<div class="cf_noitem alignCenter">
			주문내역이 존재하지 않습니다.
		</div>
		<!-- } 상품이 없을 때 -->
		</c:if>
		
		<c:if test="${not empty orderDetailList1}">
		<!-- 관광/체험 { -->
		<article class="cartlist travelcart">
			<h2>관광/체험</h2>
			<table class="cart_tbl">
				<colgroup>
					<col width="110" style="width:110px" />
					<col />
				</colgroup>
				<thead>
					<tr>
						<th colspan="2">상품정보</th>
					</tr>
				</thead>
				<tbody>
					<c:set var="calc_price" value="0"/>
					<c:forEach var="orderDetailList1" items="${orderDetailList1}" varStatus="status">
					<c:set var="calc_order_price" value="0"/>
					<input type="hidden" id="prod_img_<c:out value="${orderDetailList1.od_seq }"/>" value="<c:out value="${orderDetailList1.prod_img_1 }"/>" />
					<input type="hidden" id="prod_nm_<c:out value="${orderDetailList1.od_seq }"/>" value="<c:out value="${orderDetailList1.od_prod_nm }"/> "/>
					<input type="hidden" id="prod_comment_<c:out value="${orderDetailList1.od_seq }"/>" value="<c:out value="${orderDetailList1.prod_comment }"/> "/>
					<tr>
						<td class="alignCenter">
						    <img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${orderDetailList1.prod_img_1}"/>&fileSn=0" onerror="this.src='/images/baseScmtour/_noImage.png';"/>
						    <c:choose>
						    	<c:when test="${orderDetailList1.od_stat eq 'N'}">
						    		<c:choose>
						    			<c:when test="${orderDetailList1.od_order_stat eq 'PAYMENT'}">
                            			<span class="btns orangebtn h24px w100 mgt5px" onclick="save_use_mart('<c:out value="${orderDetailList1.od_seq }"/>','CD002001')" style="cursor: pointer;" >사용확인</span>
                            			</c:when>
                            			<c:otherwise>
                            			<span class="btns orangebtn h24px w100 mgt5px" >입금대기</span>
                            			</c:otherwise>
                            		</c:choose>
                            	</c:when>
                            	<c:otherwise>
                            	<span class="btns lightgraybtn h24px w100 mgt5px">사용완료</span>
                            	</c:otherwise>
                            </c:choose>
				        </td>
						<td>
							<h4 class="subject"><c:out value="${orderDetailList1.od_prod_nm }"/> <small>(주문번호 <c:out value="${orderDetailList1.od_order_id}"/>)</small></h4>
							<dl class="nopm">
								<dt>예약일</dt>
								<dd id="prod_date_<c:out value="${orderDetailList1.od_seq }"/>"><c:out value="${orderDetailList1.od_st_dt}"/></dd>
							</dl>
							<c:set var="od_prod_opt_seq" value="${fn:split(orderDetailList1.od_prod_opt_seq,'|||')}" />
							<c:set var="od_prod_opt_nm" value="${fn:split(orderDetailList1.od_prod_opt_nm,'|||')}" />
							<c:set var="od_prod_opt_price" value="${fn:split(orderDetailList1.od_prod_opt_price,'|||')}" />
							<c:set var="od_prod_opt_cnt" value="${fn:split(orderDetailList1.od_prod_opt_cnt,'|||')}" />
							<c:if test="${not empty od_prod_opt_seq}">
							<dl class="nopm">
								<dt>구매인원</dt>
								<dd id="prod_opt_<c:out value="${orderDetailList1.od_seq }"/>">
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
								<dd><c:out value="${orderDetailList1.od_user_nm}"/> (<c:out value="${orderDetailList1.od_user_call}"/>)</dd>
							</dl>
							<dl class="nopm price">
								<dt>금액</dt>
								<dd id="prod_price_<c:out value="${orderDetailList1.od_seq }"/>"><fmt:formatNumber value="${calc_order_price}" type="number"/>원</dd>
							</dl>
						</td>
					</tr>
					</c:forEach>
				</tbody>
				<%-- <tfoot>
					<tr>
						<td colspan="2" class="alignRight"><small>주문금액</small> <strong><fmt:formatNumber value="${calc_price}" type="number"/></strong> <small>원</small></td>
					</tr>
				</tfoot> --%>
			</table>
		</article>
		</c:if>
		<!-- } 관광/체험 -->

		<%-- <c:if test="${empty orderDetailList2}">
		<!-- 상품이 없을 때 { -->
		<div class="cf_noitem alignCenter">
			주문내역이 존재하지 않습니다.
		</div>
		<!-- } 상품이 없을 때 -->
		</c:if> --%>
		
		<c:if test="${not empty orderDetailList2}">
		<!-- 숙박 { -->
		<article class="cartlist travelcart">
			<h2>숙박</h2>
			<table class="cart_tbl">
				<colgroup>
					<col width="110" style="width:110px" />
					<col />
				</colgroup>
				<thead>
					<tr>
						<th colspan="2">상품정보</th>
					</tr>
				</thead>
				<tbody>
					<c:set var="calc_price" value="0"/>
					<c:forEach var="orderDetailList2" items="${orderDetailList2}" varStatus="status">
					<c:set var="calc_order_price" value="0"/>
					<input type="hidden" id="prod_img_<c:out value="${orderDetailList2.od_seq }"/>" value="<c:out value="${orderDetailList2.prod_img_1 }"/>" />
					<input type="hidden" id="prod_nm_<c:out value="${orderDetailList2.od_seq }"/>" value="<c:out value="${orderDetailList2.od_prod_nm }"/> "/>
					<input type="hidden" id="prod_comment_<c:out value="${orderDetailList2.od_seq }"/>" value="<c:out value="${orderDetailList2.prod_comment }"/> "/>
					<tr>
						<td class="alignCenter">
						    <img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${orderDetailList2.prod_img_1}"/>&fileSn=0" onerror="this.src='/images/baseScmtour/_noImage.png';"/>
						    <c:choose>
						    	<c:when test="${orderDetailList2.od_stat eq 'N' }">
                            		<c:choose>
						    			<c:when test="${orderDetailList2.od_order_stat eq 'PAYMENT'}">
                            			<span class="btns orangebtn h24px w100 mgt5px" onclick="save_use_mart('<c:out value="${orderDetailList2.od_seq }"/>','CD002002')" style="cursor: pointer;" >사용확인</span>
                            			</c:when>
                            			<c:otherwise>
                            			<span class="btns orangebtn h24px w100 mgt5px" >입금대기</span>
                            			</c:otherwise>
                            		</c:choose>
                            	</c:when>
                            	<c:otherwise>
                            	<span class="btns lightgraybtn h24px w100 mgt5px">사용완료</span>
                            	</c:otherwise>
                            </c:choose>
				        </td>
						<td>
							<h4 class="subject"><c:out value="${orderDetailList2.od_prod_nm }"/> <small>(주문번호 <c:out value="${orderDetailList2.od_order_id}"/>)</small></h4>
							<dl class="nopm">
								<dt>예약일</dt>
								<dd id="prod_date_<c:out value="${orderDetailList2.od_seq }"/>">입실 : <c:out value="${orderDetailList2.od_st_dt}"/><br>퇴실 : <c:out value="${orderDetailList2.od_ed_dt}"/></dd>
							</dl>
							<c:set var="od_prod_opt_seq" value="${fn:split(orderDetailList2.od_prod_opt_seq,'|||')}" />
							<c:set var="od_prod_opt_nm" value="${fn:split(orderDetailList2.od_prod_opt_nm,'|||')}" />
							<c:set var="od_prod_opt_price" value="${fn:split(orderDetailList2.od_prod_opt_price,'|||')}" />
							<c:set var="od_prod_opt_cnt" value="${fn:split(orderDetailList2.od_prod_opt_cnt,'|||')}" />
							<c:if test="${not empty od_prod_opt_seq}">
							<dl class="nopm">
								<dt>숙박정보</dt>
								<dd id="prod_opt_<c:out value="${orderDetailList2.od_seq }"/>">
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
								<dd><c:out value="${orderDetailList2.od_user_nm}"/> (<c:out value="${orderDetailList2.od_user_call}"/>)</dd>
							</dl>
							<dl class="nopm price">
								<dt>금액</dt>
								<dd id="prod_price_<c:out value="${orderDetailList2.od_seq }"/>"><fmt:formatNumber value="${calc_order_price}" type="number"/>원</dd>
							</dl>
						</td>
					</tr>
					</c:forEach>
				</tbody>
				<%-- <tfoot>
					<tr>
						<td colspan="2" class="alignRight"><small>주문금액</small> <strong><fmt:formatNumber value="${calc_price}" type="number"/></strong> <small>원</small></td>
					</tr>
				</tfoot> --%>
			</table>
		</article>
		</c:if>
		<!-- } 숙박 -->
		
		<%-- <c:if test="${empty orderDetailList3}">
		<!-- 상품이 없을 때 { -->
		<div class="cf_noitem alignCenter">
			주문내역이 존재하지 않습니다.
		</div>
		<!-- } 상품이 없을 때 -->
		</c:if> --%>
		
		<c:if test="${not empty orderDetailList3}">
		<!-- 맛집 { -->
		<article class="cartlist travelcart">
			<h2>맛집</h2>
			<table class="cart_tbl">
				<colgroup>
					<col width="110" style="width:110px" />
					<col />
				</colgroup>
				<thead>
					<tr>
						<th colspan="2">상품정보</th>
					</tr>
				</thead>
				<tbody>
					<c:set var="calc_price" value="0"/>
					<c:forEach var="orderDetailList3" items="${orderDetailList3}" varStatus="status">
					<c:set var="calc_order_price" value="0"/>
					<input type="hidden" id="prod_img_<c:out value="${orderDetailList3.od_seq }"/>" value="<c:out value="${orderDetailList3.prod_img_1 }"/>" />
					<input type="hidden" id="prod_nm_<c:out value="${orderDetailList3.od_seq }"/>" value="<c:out value="${orderDetailList3.od_prod_nm }"/> "/>
					<input type="hidden" id="prod_comment_<c:out value="${orderDetailList3.od_seq }"/>" value="<c:out value="${orderDetailList3.prod_comment }"/> "/>
					<tr>
						<td class="alignCenter">
						    <img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${orderDetailList3.prod_img_1}"/>&fileSn=0" onerror="this.src='/images/baseScmtour/_noImage.png';"/>
						    <c:choose>
						    	<c:when test="${orderDetailList3.od_stat eq 'N' }">
                            		<c:choose>
						    			<c:when test="${orderDetailList3.od_order_stat eq 'PAYMENT'}">
                            			<span class="btns orangebtn h24px w100 mgt5px" onclick="save_use_mart('<c:out value="${orderDetailList3.od_seq }"/>','CD002003')" style="cursor: pointer;" >사용확인</span>
                            			</c:when>
                            			<c:otherwise>
                            			<span class="btns orangebtn h24px w100 mgt5px" >입금대기</span>
                            			</c:otherwise>
                            		</c:choose>
                            	</c:when>
                            	<c:otherwise>
                            	<span class="btns lightgraybtn h24px w100 mgt5px">사용완료</span>
                            	</c:otherwise>
                            </c:choose>
				        </td>
						<td>
							<h4 class="subject"><c:out value="${orderDetailList3.od_prod_nm }"/> <small>(주문번호 <c:out value="${orderDetailList3.od_order_id}"/>)</small></h4>
							<dl class="nopm">
								<dt>예약일</dt>
								<dd id="prod_date_<c:out value="${orderDetailList3.od_seq }"/>">
									<c:out value="${orderDetailList3.od_st_dt}"/>
								</dd>
							</dl>
							<c:set var="od_prod_opt_seq" value="${fn:split(orderDetailList3.od_prod_opt_seq,'|||')}" />
							<c:set var="od_prod_opt_nm" value="${fn:split(orderDetailList3.od_prod_opt_nm,'|||')}" />
							<c:set var="od_prod_opt_price" value="${fn:split(orderDetailList3.od_prod_opt_price,'|||')}" />
							<c:set var="od_prod_opt_cnt" value="${fn:split(orderDetailList3.od_prod_opt_cnt,'|||')}" />
							<c:if test="${not empty od_prod_opt_seq}">
							<dl class="nopm">
								<dt>메뉴예약</dt>
								<dd id="prod_opt_<c:out value="${orderDetailList3.od_seq }"/>">
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
								<dd><c:out value="${orderDetailList3.od_user_nm}"/> (<c:out value="${orderDetailList3.od_user_call}"/>)</dd>
							</dl>
							<dl class="nopm price">
								<dt>금액</dt>
								<dd id="prod_price_<c:out value="${orderDetailList3.od_seq }"/>"><fmt:formatNumber value="${calc_order_price}" type="number"/>원</dd>
							</dl>
						</td>
					</tr>
					</c:forEach>
				</tbody>
				<%-- <tfoot>
					<tr>
						<td colspan="2" class="alignRight"><small>주문금액</small> <strong><fmt:formatNumber value="${calc_price}" type="number"/></strong> <small>원</small></td>
					</tr>
				</tfoot> --%>
			</table>
		</article>
		</c:if>
		<!-- } 맛집 -->
		
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
										<td class="alignRight" id="view_opt">
											
										</td>
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