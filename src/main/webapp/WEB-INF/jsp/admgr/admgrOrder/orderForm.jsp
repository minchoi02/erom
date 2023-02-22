<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:import url="/Api/admgrIncludeTop.do"/>
<c:import url="/Api/admgrIncludeLeftMenu.do"/>

		<!-- 콘텐츠 영역 { -->
		<div id="content">
			<h1 class="bigTit">주문상세 </h1>
			
			<form action="/admgr/admgrOrder/orderFormSave.do" id="orderSave" name="orderSave" method="post" onsubmit="return orderForm()">
			<input type="hidden" name="pageIndex" value="<c:out value="${pageIndex }"/>" />
			<input type="hidden" name="order_st_dt" value="<c:out value="${order_st_dt }"/>" />
			<input type="hidden" name="order_ed_dt" value="<c:out value="${order_ed_dt }"/>" />
			<input type="hidden" name="searchKey" value="<c:out value="${searchKey }"/>" />
			<input type="hidden" name="searchKeyword" value="<c:out value="${searchKeyword }"/>" />
			<input type="hidden" name="pay_st" value="<c:out value="${pay_st }"/>" />
			<input type="hidden" name="order_id" value="<c:out value="${order_id }"/>" />
			<input type="hidden" id="order_pay_cd" name="order_pay_cd" value="<c:out value="${orderInfo.order_pay_cd }"/>" />
			<input type="hidden" id="is_cancel" name="is_cancel" value="N" />
			
			<!-- 주문내역 > 맛집 > 주문내역 { -->
			<section id="orderFoodWrite" class="page_content">
			<!-- 주문상품 { -->
				
				<!-- 주문자정보 { -->
				<article class="page_sortation">
					<h2 class="h2Tit"><i class="fal fa-window-minimize"></i> 주문자정보</h2>
					<table class="admin_tbl admin_write_tbl admin_view_tbl">
						<caption>주문자정보</caption>
						<colgroup>
							<col width="200" />
							<col />
							<col width="200" />
							<col />
						</colgroup>
						<tbody>
							<tr>
								<th>주문자</th>
								<td><c:out value="${orderInfo.order_user_nm}"/></td>
								<th>이메일</th>
								<td><c:out value="${orderInfo.order_email}"/></td>
							</tr>
							<tr>
								<th>연락처 1</th>
								<td><c:out value="${orderInfo.order_hp}"/></td>
								<th>연락처 2</th>
								<td><c:out value="${orderInfo.order_tel}"/></td>
							</tr>
						</tbody>
					</table>
				</article>
				
				<!-- 주문자정보 { -->
				<article class="page_sortation">
					<h2 class="h2Tit"><i class="fal fa-window-minimize"></i> 주문정보</h2>
					<table class="admin_tbl admin_write_tbl admin_view_tbl">
						<caption>주문정보</caption>
						<colgroup>
							<col width="200" />
							<col />
							<col width="200" />
							<col />
						</colgroup>
						<tbody>
							<tr>
								<th>주문일</th>
								<td><c:out value="${orderInfo.reg_dt}"/></td>
								<th>주문번호</th>
								<td><c:out value="${orderInfo.order_id}"/></td>
							</tr>
							<tr>
								<th>결제수단</th>
								<td>
									<input type="hidden" id="paytype" value="<c:out value="${orderInfo.order_pay_st}"/>"/>
									<c:choose>
										<c:when test="${orderInfo.order_pay_st eq 'B' }">무통장입금</c:when>
										<c:when test="${orderInfo.order_pay_st eq 'V' }">가상계좌</c:when>
										<c:when test="${orderInfo.order_pay_st eq 'R' }">실시간계좌이체</c:when>
										<c:otherwise>신용카드 (<c:out value="${orderInfo.order_pay_cd}"/>)</c:otherwise>
									</c:choose>
									<c:if test="${orderInfo.order_pay_st eq 'V' }">
									(입금예약시간 : <c:out value="${orderInfo.order_pay_time }"/>시간)
									<br>
									계좌정보 :  <c:out value="${orderInfo.order_pay_vbank_nm }"/>(<c:out value="${orderInfo.order_pay_vbank_number }"/>) <c:out value="${orderInfo.order_pay_vbank_user }"/>
									</c:if>
								</td>
								<th>입금일자</th>
								<td><c:out value="${orderInfo.order_pay_date }"/>
									<%-- <c:choose>
										<c:when test="${orderInfo.order_pay_st eq 'B' || orderInfo.order_pay_st eq 'V' }">
										<input type="text" id="order_pay_date" name="order_pay_date" class="admin_input datepicker" size="12" placeholder="날짜" value="<c:out value="${orderInfo.order_pay_date }"/>" />
										&nbsp;<button type="button" class="btns graybtn" onclick="del_indate()">제거</button>
										</c:when>
										<c:otherwise>-</c:otherwise>
									</c:choose> --%>
								</td>
							</tr>
							<tr>
								<th>쿠폰 / 마일리지 적용</th>
								<td>
									<span class="comment">-
									<c:choose>
										<c:when test="${orderInfo.order_coupon_price > 0 }"><fmt:formatNumber value="${orderInfo.order_coupon_price}" type="number"/></c:when>
										<c:otherwise>0</c:otherwise>
									</c:choose>
									원</span>
									&nbsp;/&nbsp;
									<span class="comment">-
									<c:choose>
										<c:when test="${orderInfo.order_use_mileage > 0 }"><fmt:formatNumber value="${orderInfo.order_use_mileage}" type="number"/></c:when>
										<c:otherwise>0</c:otherwise>
									</c:choose>
									원</span>
								</td>
								<th>총 배송비</th>
								<td><fmt:formatNumber value="${orderInfo.order_total_delivery_price}" type="number"/>원 </td>
							</tr>
							<tr>
								<th>총 금액</th>
								<td><fmt:formatNumber value="${orderInfo.order_total_price}" type="number"/>원</td>
								<th>거래번호</th>
								<td><c:out value="${orderInfo.order_pay_cd}" /></td>
							</tr>
						</tbody>
					</table>
				</article>
				
				<c:if test="${not empty orderInfo.order_zip}">
				<article class="page_sortation">
					<h2 class="h2Tit"><i class="fal fa-window-minimize"></i> 배송정보</h2>
					<table class="admin_tbl admin_write_tbl admin_view_tbl">
						<caption>배송정보</caption>
						<colgroup>
							<col width="200" />
							<col />
							<col width="200" />
							<col />
						</colgroup>
						<tbody>
							<tr>
								<th>배송정보</th>
								<td colspan="3">
									(<c:out value="${orderInfo.order_zip }"/>) <c:out value="${orderInfo.order_addr1}"/> <c:out value="${orderInfo.order_addr2}"/>
								</td>
							</tr>
							<tr>
								<th>배송메시지</th>
								<td colspan="3">
									<c:out value="${orderInfo.order_memo}"/>
								</td>
							</tr>
						</tbody>
					</table>
				</article>
				</c:if>
				<!-- } 주문자정보 -->
				
				<article class="page_sortation">
					<!-- <p class="comment">- 주문취소(부분취소) 작업예정 : PG사 연동</p>
					<p class="comment">- 환불금액 계산기 작업예정 : 스토어 환불설정 호출하여 취소날짜 기준 공제금액을 제외한 부분 + 카드부분취소시 수수료 공제부분(협의필요)</p>
					<br><br> -->
			
					<h2 class="h2Tit"><i class="fal fa-window-minimize"></i> 주문상품</h2>
					<p class="comment">* 결제완료상태가 아니면, 주문상품의 상태 및 배송정보를 처리할 수 없습니다.</p>
					<p class="comment">* 취소시, 장터상품은 배송비를 꼭 확인하세요.</p>
					<p class="comment">* 취소시, 예약상품은 공제율을 꼭 확인하세요.</p>
					<p class="comment">* 취소후라도 쿠폰등 할인내역은 고객에게 반환되지 않습니다.</p>
					
					<table class="admin_tbl admin_list_tbl">
						<caption>주문상품</caption>
						<colgroup>
							<col width="120" />
							<col />
							<col width="120" />
							<col width="120" />
							<col width="120" />
							<col width="200" />
							<col width="200" />
							<col width="200" />
						</colgroup>
						<thead>
							<tr>
								<th colspan="2">상품명</th>
								<th>기본금액</th>
								<th>옵션금액</th>
								<th>주문합계</th>
								<th>배송사</th>
								<th>송장번호</th>
								<th>상태</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="orderDetailList" items="${orderDetailList}" varStatus="status">
							<tr>
								<td class="alignCenter"><img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${orderDetailList.prod_img_1}"/>&fileSn=0" onerror="this.src='/images/baseScmtour/_noImage.png';" width="100"/></td>
								<td>
									<b class="fsize16">
										<c:if test="${adminLevel eq '10' }">
										[<c:out value="${orderDetailList.store_nm}"/>] 
										</c:if>
										<c:out value="${orderDetailList.od_prod_nm}"/>
										<c:if test="${not empty orderDetailList.prod_room_nm }">
											- <c:out value="${orderDetailList.prod_room_nm }"/>
										</c:if>
									</b>
									<c:set var="od_prod_opt_seq" value="${fn:split(orderDetailList.od_prod_opt_seq,'|||')}" />
									<c:set var="od_prod_opt_nm" value="${fn:split(orderDetailList.od_prod_opt_nm,'|||')}" />
									<c:set var="od_prod_opt_price" value="${fn:split(orderDetailList.od_prod_opt_price,'|||')}" />
									<c:set var="od_prod_opt_cnt" value="${fn:split(orderDetailList.od_prod_opt_cnt,'|||')}" />
									<c:if test="${not empty orderDetailList.od_prod_opt_seq}">
									<c:set var="opt_price" value="0"/>
									<p class="product_option mgt10px">
									<c:if test="${orderDetailList.od_store_category eq 'CD002002' }">
									<strong><c:out value="${orderDetailList.prod_room_nm}"/></strong><br>
									</c:if>
									<c:forEach var="od_prod_opt" items="${od_prod_opt_seq}" varStatus="opts">
										<c:out value="${od_prod_opt_nm[opts.index] }"/> 
										(<fmt:formatNumber value="${od_prod_opt_price[opts.index]}"/>원)  X <c:out value="${od_prod_opt_cnt[opts.index] }"/>
										: <fmt:formatNumber value="${od_prod_opt_price[opts.index] * od_prod_opt_cnt[opts.index]}" type="number"/>원<br />
										<c:set var="opt_price" value="${opt_price + (od_prod_opt_price[opts.index] * od_prod_opt_cnt[opts.index]) }"/>
									</c:forEach>
									</p>
									</c:if>
									<br>
									<p class="comment">[ 상점의 정책 <c:if test="${not empty orderDetailList.od_canceling_dt }">- 취소신청일 : <c:out value="${orderDetailList.od_canceling_dt }"/></c:if> ]</p>
									<c:choose>
									<c:when test="${orderDetailList.od_store_category eq 'CD002004' }"> 
										* 기본배송비 : <fmt:formatNumber value="${orderDetailList.store_market_default_delivery_price }"/>원 (제주배송비 : <fmt:formatNumber value="${orderDetailList.store_market_jeju_delivery_price }"/>원 )<br> 
										* 무료배송금액 : <fmt:formatNumber value="${orderDetailList.store_market_free_delivery_price }"/>원 이상
									</c:when>
									<c:otherwise>
										<c:choose>
											<c:when test="${orderDetailList.od_store_category eq 'CD002001' }">
												<c:set var="c7" value="${orderDetailList.store_travel_return_day_7 }"/>
												<c:set var="c5" value="${orderDetailList.store_travel_return_day_5 }"/>
												<c:set var="c3" value="${orderDetailList.store_travel_return_day_3 }"/>
												<c:set var="c2" value="${orderDetailList.store_travel_return_day_2 }"/>
												<c:set var="c1" value="${orderDetailList.store_travel_return_day_1 }"/>
												<c:set var="c0" value="${orderDetailList.store_travel_return_day_0 }"/>
											</c:when>
											<c:when test="${orderDetailList.od_store_category eq 'CD002002' }">
												<c:set var="c7" value="${orderDetailList.store_house_return_day_7 }"/>
												<c:set var="c5" value="${orderDetailList.store_house_return_day_5 }"/>
												<c:set var="c3" value="${orderDetailList.store_house_return_day_3 }"/>
												<c:set var="c2" value="${orderDetailList.store_house_return_day_2 }"/>
												<c:set var="c1" value="${orderDetailList.store_house_return_day_1 }"/>
												<c:set var="c0" value="${orderDetailList.store_house_return_day_0 }"/>
											</c:when>
											<c:when test="${orderDetailList.od_store_category eq 'CD002003' }">
												<c:set var="c7" value="${orderDetailList.store_food_return_day_7 }"/>
												<c:set var="c5" value="${orderDetailList.store_food_return_day_5 }"/>
												<c:set var="c3" value="${orderDetailList.store_food_return_day_3 }"/>
												<c:set var="c2" value="${orderDetailList.store_food_return_day_2 }"/>
												<c:set var="c1" value="${orderDetailList.store_food_return_day_1 }"/>
												<c:set var="c0" value="${orderDetailList.store_food_return_day_0 }"/>
											</c:when>
										</c:choose>
										* 공제율 : 예약일기준 취소신청일 환산(미공제설정 제외)<br>
										<c:if test="${c7 ne '0'}">- 7일 : <c:out value="${c7 }"/>%<br></c:if>
										<c:if test="${c5 ne '0'}">- 5일 : <c:out value="${c5 }"/>%<br></c:if>
										<c:if test="${c3 ne '0'}">- 3일 : <c:out value="${c3 }"/>%<br></c:if>
										<c:if test="${c2 ne '0'}">- 2일 : <c:out value="${c2 }"/>%<br></c:if>
										<c:if test="${c1 ne '0'}">- 1일 : <c:out value="${c1 }"/>%<br></c:if>
										<c:if test="${c0 ne '0'}">- 당일 : <c:out value="${c0 }"/>%</c:if>
									</c:otherwise>
									</c:choose>
								</td>
								<td class="alignRight"><fmt:formatNumber value="${orderDetailList.od_prod_price}" type="number"/>원</td>
								<td class="alignRight"><fmt:formatNumber value="${opt_price}" type="number"/>원</td>
								<td class="alignRight"><fmt:formatNumber value="${orderDetailList.od_prod_total_price}" type="number"/>원</td>
								<td class="alignCenter">
									<c:choose>
										<c:when test="${orderDetailList.od_order_stat eq 'CANCEL' }">-
											<input type="hidden" class="dcom"  id="od_delivery_company_id_<c:out value="${orderDetailList.od_seq}"/>" name="od_delivery_company_id" value="<c:out value="${orderDetailList.od_delivery_company_id}"/>" />
										</c:when>
										<c:otherwise>
											<c:choose>
												<c:when test="${orderDetailList.od_store_category eq 'CD002004' }">
												<c:set var="deliveryCompanyList" value="<%=new java.util.HashMap()%>" />
												<c:if test="${not empty orderDetailList.delivery_company_cd1 }">
												<c:set target="${deliveryCompanyList}" property="${orderDetailList.delivery_company_cd1 }" value="${orderDetailList.delivery_company_nm1 }" />
												</c:if>
												<c:if test="${not empty orderDetailList.delivery_company_cd2 }">
												<c:set target="${deliveryCompanyList}" property="${orderDetailList.delivery_company_cd2 }" value="${orderDetailList.delivery_company_nm2 }" />
												</c:if>
												<c:if test="${not empty orderDetailList.delivery_company_cd3 }">
												<c:set target="${deliveryCompanyList}" property="${orderDetailList.delivery_company_cd3 }" value="${orderDetailList.delivery_company_nm3 }" />
												</c:if>
												<select id="od_delivery_company_id_<c:out value="${orderDetailList.od_seq}"/>" name="od_delivery_company_id" class="basic_select w100 dcom" >
												<option value="">택배사 선택</option>
												<c:forEach var="deliveryCompanyList" items="${deliveryCompanyList }">
													<option value="<c:out value="${deliveryCompanyList.key }"/>" <c:if test="${deliveryCompanyList.key eq orderDetailList.od_delivery_company_id}">selected</c:if> ><c:out value="${deliveryCompanyList.value }"/></option>
												</c:forEach>
												</select>
												</c:when>
												<c:otherwise>
												-
												<input type="hidden" id="od_delivery_company_id_<c:out value="${orderDetailList.od_seq}"/>" name="od_delivery_company_id" class="dcom" value="<c:out value="${orderDetailList.od_delivery_company_id}"/>" />
												</c:otherwise>
											</c:choose>
										</c:otherwise>
									</c:choose>
								</td> 
								<td class="alignCenter">
									<c:choose>
										<c:when test="${orderDetailList.od_order_stat eq 'CANCEL' }">-
											<input type="hidden" class="admin_input w100 dnum"  id="od_delivery_number_<c:out value="${orderDetailList.od_seq}"/>" name="od_delivery_number" value="<c:out value="${orderDetailList.od_delivery_number}"/>" />
										</c:when>
										<c:otherwise>
											<c:choose>
												<c:when test="${orderDetailList.od_store_category eq 'CD002004' }">
												<input type="text" class="admin_input w100 dnum"  id="od_delivery_number_<c:out value="${orderDetailList.od_seq}"/>" name="od_delivery_number"  value="<c:out value="${orderDetailList.od_delivery_number}"/>"  />
												</c:when>
												<c:otherwise>
												-
												<input type="hidden" class="admin_input w100 dnum"  id="od_delivery_number_<c:out value="${orderDetailList.od_seq}"/>" name="od_delivery_number" value="<c:out value="${orderDetailList.od_delivery_number}"/>" />
												</c:otherwise>
											</c:choose>
										</c:otherwise>
									</c:choose>
								</td>
								<td class="alignCenter">
									<%--
									${orderDetailList.od_order_stat} ${orderDetailList.od_stat}
									--%>
									<c:choose>
									<c:when test="${orderDetailList.od_order_stat eq 'CANCEL' }">취소
									<input type="hidden" class="admin_input w100 "  id="od_order_stat_<c:out value="${orderDetailList.od_seq}"/>" name="od_order_stat" value="<c:out value="${orderDetailList.od_order_stat}"/>" />
									<input type="hidden" class="admin_input w100 "  id="od_stat_<c:out value="${orderDetailList.od_seq}"/>" name="od_stat" value="<c:out value="${orderDetailList.od_stat}"/>" />
									</c:when>
									<c:otherwise>
										<c:choose>
											<c:when test="${orderDetailList.od_store_category ne 'CD002004' }">
												<select id="od_order_stat_<c:out value="${orderDetailList.od_seq}"/>" name="od_order_stat" class="basic_select odst w100"  onchange="chk_cancel('<c:out value="${orderDetailList.od_seq}"/>', this.value)" >
													<option value="READY" <c:if test="${orderDetailList.od_order_stat eq 'READY' }">selected</c:if> >미결제</option>
													<option value="PAYMENT" <c:if test="${orderDetailList.od_order_stat eq 'PAYMENT' }">selected</c:if> >결제완료</option>
													<option value="COMPLETE" <c:if test="${orderDetailList.od_order_stat eq 'COMPLETE' }">selected</c:if> >사용완료</option>
													<option value="CANCEL" <c:if test="${orderDetailList.od_order_stat eq 'CANCEL' }">selected</c:if> >취소</option>
													<option value="CANCELING" <c:if test="${orderDetailList.od_order_stat eq 'CANCELING' }">selected</c:if> >취소요청</option>
												</select> 
												
												<c:choose>
												<c:when test="${orderDetailList.od_order_stat eq 'PAYMENT' }">
												<br>
												<br>
												<select id="od_stat_<c:out value="${orderDetailList.od_seq}"/>" name="od_stat" class="basic_select dst w100" >
													<option value="N" <c:if test="${orderDetailList.od_stat eq 'N' }">selected</c:if> >사용대기</option>
													<option value="Y" <c:if test="${orderDetailList.od_stat eq 'Y' }">selected</c:if> >사용완료</option>
												</select>
												</c:when>
												<c:when test="${orderDetailList.od_order_stat eq 'COMPLETE' }">
												<br>
												<br>
												사용완료
												</c:when>
												<c:otherwise>
												<input type="hidden" id="od_stat_<c:out value="${orderDetailList.od_seq}"/>" name="od_stat" class="dst" value="<c:out value="${orderDetailList.od_stat}"/>" />
												</c:otherwise>
												</c:choose>
											</c:when>
											<c:otherwise>
												<input type="hidden" id="od_stat_<c:out value="${orderDetailList.od_seq}"/>" name="od_stat" class="dst" value="<c:out value="${orderDetailList.od_stat}"/>" /> 
												<select id="od_order_stat_<c:out value="${orderDetailList.od_seq}"/>" name="od_order_stat" class="basic_select odst w100"  onchange="chk_cancel('<c:out value="${orderDetailList.od_seq}"/>', this.value)" >
													<option value="READY" <c:if test="${orderDetailList.od_order_stat eq 'READY' }">selected</c:if> >미결제</option>
													<option value="PAYMENT" <c:if test="${orderDetailList.od_order_stat eq 'PAYMENT' }">selected</c:if> >결제완료</option>
													<option value="TRANSFER" <c:if test="${orderDetailList.od_order_stat eq 'TRANSFER' }">selected</c:if> >배송중</option>
													<option value="COMPLETE" <c:if test="${orderDetailList.od_order_stat eq 'COMPLETE' }">selected</c:if> >완료</option>
													<option value="CANCEL" <c:if test="${orderDetailList.od_order_stat eq 'CANCEL' }">selected</c:if> >취소</option>
													<option value="CANCELING" <c:if test="${orderDetailList.od_order_stat eq 'CANCELING' }">selected</c:if> >취소요청</option>
												</select>
											</c:otherwise>
										</c:choose>
									</c:otherwise>
									</c:choose>
									<div style="display: none; padding-top: 10px;" id="cancel_price_frm_<c:out value="${orderDetailList.od_seq}"/>">
									취소액:	<input type="text" id="cancel_price_item_<c:out value="${orderDetailList.od_seq}"/>" name="cancel_price_item" value="0" dir="right"  class="admin_input w60 cancel_price_item" placeholder="숫자만 입력" onkeyup="cancel_price_sum();" /> 원
									</div>
									<input type="hidden" name="od_seq" value="${orderDetailList.od_seq}"/>
								</td>
							</tr>
							</c:forEach>
						</tbody>
					</table>
				</article>
				<!-- } 주문상품 -->
				
				
				<!-- 주문관리 { -->
				<article class="page_sortation" id="cancel_form" style="display: none;">
					<h2 class="h2Tit"><i class="fal fa-window-minimize"></i> 주문취소</h2>
					<p class="comment">* 주문목록에서 상품별로 입력된 취소액을 합한 금액입니다.</p>
					<p class="comment">* 장터상품의 경우, 배송비를 꼭 확인하세요.</p>
					<p class="comment">* 예약상품의 경우, 공제율을 꼭 확인하세요.</p>
					<p class="comment">* 다양한 상황을 체크하기 위하여, 자동으로 처리하지 않습니다.</p>
					<table class="admin_tbl admin_write_tbl">
						<caption>주문관리</caption>
						<colgroup>
							<col width="200" />
							<col />
						</colgroup>
						<tbody>
							<tr>
								<th>주문 총액<br>(배송비 포함)</th>
								<td>
									<fmt:formatNumber value="${orderInfo.order_total_price}" type="number"/> 원 (배송비: <fmt:formatNumber value="${orderInfo.order_total_delivery_price}" type="number"/> 원, 할인: <fmt:formatNumber value="${orderInfo.order_coupon_price + orderInfo.order_use_mileage}" type="number"/>원 적용 )
								</td>
							</tr>
							<tr>
								<th>주문취소 총액<br>(배송비 체크!)</th>
								<td>
									<input type="text" id="cancel_price" name="cancel_price" class="admin_input w150px" value="0" dir="right" placeholder="숫자만 입력" readonly> 원
								</td>
							</tr>
						</tbody>
					</table>
				</article>
				<!-- } 주문관리 -->

				<!-- 주문관리 { -->
				<c:if test="${adminLevel > 5 }">
				<article class="page_sortation">
					<h2 class="h2Tit"><i class="fal fa-window-minimize"></i> 관리자메모</h2>
					<p class="comment">* 해당메모는 관리자만 볼 수 있으며, 상점관리자는 볼 수 없습니다.</p>
					<table class="admin_tbl admin_write_tbl">
						<caption>주문관리</caption>
						<colgroup>
							<col width="200" />
							<col />
						</colgroup>
						<tbody>
							<tr>
								<th>관리자메모</th>
								<td>
									<textarea id="order_memo" name="order_memo" class="admin_textarea w100" rows="15"><c:out value="${order_memo }"/></textarea>
								</td>
							</tr>
						</tbody>
					</table>
				</article>
				</c:if>
				
				<!-- } 주문관리 -->

				<div class="btnarea alignRight mgt30px">
					<ul class="nopm floats">
						<li><a href="/admgr/admgrOrder/orderList.do?pageIndex=<c:out value="${pageIndex }"/>&order_st_dt=<c:out value="${order_st_dt }"/>&order_ed_dt=<c:out value="${order_ed_dt }"/>&searchKey=<c:out value="${searchKey }"/>&searchKeyword=<c:out value="${searchKeyword }"/>&pay_st=<c:out value="${pay_st }"/>" class="btns "><i class="fal fa-list"></i> 목록으로</a></li>
						<li class="fr"><button type="submit" class="btns redbtn"><i class="far fa-save"></i> 저장</button></li>
					</ul>
				</div>
			</section>
			</form>
			<!-- } 주문내역 > 맛집 > 주문내역-->
		</div>
		<!-- } 콘텐츠 영역 -->


<c:import url="/Api/admgrIncludeBottom.do"/>