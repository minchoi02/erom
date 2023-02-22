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
			<h1 class="bigTit">주문내역</h1>
			<div class="pageComment">
				<div class="comment_ico"><i class="fad fa-comment-alt-smile"></i></div>
				<p>
					주문내역입니다.<br />
					미결제는 무통장 주문시 결제가 안된 경우 나타나고, 주문일로 부터 3일이내 미입금시 익일 자동취소 됩니다.<br />
					예약상품의 경우, 미결제는 주문일로 부터 3일이내 미입금시 또는 예약일이 이보다 짧은 경우 예약일 익일 자동취소 됩니다.<br />
					단, 숙박예약상품의 경우, 미결제는 주문일로 부터 3시간이내 미입금시 또는 예약일이 이보다 짧은 경우 예약일 익일 자동취소 됩니다.<br />
					장터상품의 경우, 주문일로부터 3일이내 미입금시 익일 자동취소됩니다.<br />
					배송트래킹API 미사용시, 배송완료를 처리하지 않고, 배송일로부터 7일 후 자동으로 완료처리합니다. 
				</p>
			</div>
			
			<!-- 주문내역 > 관광/체험 > 리스트 { -->
			<section id="orderTravelList" class="page_content">
				<!-- 리스트 검색 { -->
				<form action="" method="get" onsubmit="return orderListSearch()">
				<div class="list_search_box">
					<ul class="nopm floats">
						<li>
							<input type="text" id="order_st_dt" name="order_st_dt" class="search_input datepicker" size="12" placeholder="날짜" value="<c:out value="${order_st_dt }"/>" /> ~ 
							<input type="text" id="order_ed_dt" name="order_ed_dt" class="search_input datepicker" size="12" placeholder="날짜" value="<c:out value="${order_ed_dt }"/>" />
						</li>
						<!-- <li>
							<a href="#;" class="btns h30px">오늘</a>
							<a href="#;" class="btns h30px">어제</a>
							<a href="#;" class="btns h30px">이번주</a>
							<a href="#;" class="btns h30px">이번달</a>
							<a href="#;" class="btns h30px">지난주</a>
							<a href="#;" class="btns h30px">지난달</a>
						</li>
						<li><button type="submit" class="search_submit"><i class="fal fa-search"></i> 검색</button></li>
					</ul>
					<ul class="nopm floats mgt5px"> -->
						<li>
							&nbsp;&nbsp; 
							<select id="searchKey" name="searchKey" class="basic_select search_select">
								<option value="order_id" <c:if test="${searchKey eq 'order_id' }">selected</c:if> >주문번호</option>
								<option value="prod_nm" <c:if test="${searchKey eq 'prod_nm' }">selected</c:if> >상품명</option>
								<option value="order_nm" <c:if test="${searchKey eq 'order_nm' }">selected</c:if> >주문자</option>
								<option value="order_hp" <c:if test="${searchKey eq 'order_hp' }">selected</c:if> >연락처</option>
								<option value=reserve_nm <c:if test="${searchKey eq 'reserve_nm' }">selected</c:if> >예약자명</option>
								<option value="reserve_hp" <c:if test="${searchKey eq 'reserve_hp' }">selected</c:if> >예약자연락처</option>
							</select>
						</li>
						<li><input type="text" id="searchKeyword" name="searchKeyword" class="search_input w300px" placeholder="검색어를 입력하세요." value="<c:out value="${searchKeyword }"/>" /></li>
						<li><button type="submit" class="search_submit"><i class="fal fa-search"></i> 검색</button></li>
						<li class="fr">전체 : <b><fmt:formatNumber value="${TotalCnt}" type="number"/></b>건</li>
					</ul>
				</div>
				</form>
				<!-- } 리스트 검색 -->
				
				<%--
				<!-- 탭 버튼 { -->
				<nav id="tab-gnb" class="mgt20px">
					<ul class="nopm floats">
						<li <c:if test="${empty pay_st }">class="active"</c:if> ><a href="/admgr/admgrOrder/orderList.do?store_category=<c:out value="${store_category }"/>">전체</a></li>
						<li <c:if test="${pay_st eq '1'}">class="active"</c:if> ><a href="/admgr/admgrOrder/orderList.do?pay_st=1">미결제</a></li>
						<li <c:if test="${pay_st eq '2'}">class="active"</c:if> ><a href="/admgr/admgrOrder/orderList.do?pay_st=2">결제완료</a></li>
						<li <c:if test="${pay_st eq '5'}">class="active"</c:if> ><a href="/admgr/admgrOrder/orderList.do?pay_st=5">배송중</a></li>
						<li <c:if test="${pay_st eq '6'}">class="active"</c:if> ><a href="/admgr/admgrOrder/orderList.do?pay_st=6">배송완료</a></li>
						<li <c:if test="${pay_st eq '4'}">class="active"</c:if> ><a href="/admgr/admgrOrder/orderList.do?pay_st=4">주문취소요청</a></li>
						<li <c:if test="${pay_st eq '3'}">class="active"</c:if> ><a href="/admgr/admgrOrder/orderList.do?pay_st=3">주문취소</a></li>
					</ul>
				</nav>
				<!-- } 탭 버튼 -->
				--%>

				<!-- 리스트 { -->
				<table class="admin_tbl admin_calculate_tbl mgt10px">
					<caption>주문 리스트</caption>
					<colgroup>
						<col width="200" />
						<col width="120" />
						<col width="150" />
						<col />
						<col width="150" />
						<col width="100" />
						<col width="200" />
						<col width="100" />
						<col width="80" />
					</colgroup>
					<thead>
						<tr>
							<th>주문번호/주문일</th>
							<th>주문자</th>
							<th>주문자 연락처</th>
							<th>상품명</th>
							<th>상품별 판매가</th>
							<th>결제/배송상태</th>
							<th>금액정보</th>
							<th>결제방식</th>
							<th>보기</th>
						</tr>
					</thead>
					<tbody>
					<c:set var="k" value="0"/>
					<c:forEach var="orderList" items="${orderList}" varStatus="status">
						<c:set var="order_detail_list" value="orderDetailList_${orderList.order_id}"/>
						<c:set var="order_detail_list_cnt" value="orderDetailListCnt_${orderList.order_id}"/>
						<c:set var="detail_cnt" value="${requestScope[order_detail_list_cnt]}"/>
						<c:choose>
							<c:when test="${orderList.order_pay_st eq 'B' }"><c:set var="pay_type" value="무통장입금"/></c:when>
							<c:when test="${orderList.order_pay_st eq 'V' }"><c:set var="pay_type" value="가상계좌"/></c:when>
							<c:when test="${orderList.order_pay_st eq 'R' }"><c:set var="pay_type" value="실시간계좌이체"/></c:when>
							<c:otherwise><c:set var="pay_type" value="신용카드"/></c:otherwise>
						</c:choose>
						
						
						<c:set var="rowspan_str" value=""/>
						
						<c:set var="i" value="0"/>
						<c:forEach var="orderDetailList" items="${requestScope[order_detail_list]}" varStatus="status">
						<c:if test="${i == 0 && detail_cnt > 1}">
							<c:set var="rowspan_str" value="rowspan=${detail_cnt }"/>
						</c:if>
						<c:set var="tr_class" value=""/>
						<c:if test="${k%2 == 0 }">
							<c:set var="tr_class" value="twobg"/>
						</c:if>
						<c:choose>
							<c:when test="${orderDetailList.od_order_stat eq 'READY' }"><c:set var="pay_res" value="미결제"/></c:when>
							<c:when test="${orderDetailList.od_order_stat eq 'PAYMENT' }"><c:set var="pay_res" value="결제완료"/></c:when>
							<c:when test="${orderDetailList.od_order_stat eq 'TRANSFER' }"><c:set var="pay_res" value="배송중"/></c:when>
							<c:when test="${orderDetailList.od_order_stat eq 'COMPLETE' }"><c:set var="pay_res" value="완료"/></c:when>
							<c:when test="${orderDetailList.od_order_stat eq 'CANCEL' }"><c:set var="pay_res" value="주문취소"/></c:when>
							<c:when test="${orderDetailList.od_order_stat eq 'CANCELING' }"><c:set var="pay_res" value="주문취소요청"/></c:when>
						</c:choose>
						
						<tr class="<c:out value="${tr_class }"/>">
							<c:if test="${i == 0 }">
							<td class="alignCenter" <c:out value="${rowspan_str }"/> >
								<c:out value="${orderDetailList.order_id }"/>
								<br >
								<small>(<c:out value="${orderList.reg_dt }"/>)</small>
							</td>
							<td class="alignCenter" <c:out value="${rowspan_str }"/> ><c:out value="${orderDetailList.order_user_nm }"/><br />(<c:out value="${orderDetailList.order_user_id }"/>)</td>
							<td class="alignCenter" <c:out value="${rowspan_str }"/> ><c:out value="${orderDetailList.order_hp }"/></td>
							</c:if>
							<td class="alignLeft" >
								<small class="colorGray">[<c:out value="${orderDetailList.store_nm }"/>]</small>
								<br />
								<c:out value="${orderDetailList.od_prod_nm }"/>
							</td>
							<td class="alignRight" ><fmt:formatNumber value="${orderDetailList.od_prod_total_price}" type="number"/>원</td>
							<td class="alignCenter"><c:out value="${pay_res }"/></td>
							<c:if test="${i == 0 }">
							<td class="alignRight" <c:out value="${rowspan_str }"/> >
								<c:if test="${orderList.order_coupon_price > 0 || orderList.order_use_mileage > 0}">
								주문: <fmt:formatNumber value="${orderList.order_total_price + orderList.order_coupon_price + orderList.order_use_mileage}" type="number"/>원<br>
								</c:if>
								<c:if test="${orderList.order_coupon_price > 0 }">
								<p class="comment">(쿠폰) -<fmt:formatNumber value="${orderList.order_coupon_price}" type="number"/>원</p>
								</c:if>
								<c:if test="${orderList.order_use_mileage > 0 }">
								<p class="comment">(마일리지) -<fmt:formatNumber value="${orderList.order_use_mileage}" type="number"/>원</p>
								</c:if>
								결제: <fmt:formatNumber value="${orderList.order_total_price}" type="number"/>원
							</td>
							<td class="alignCenter" <c:out value="${rowspan_str }"/> ><c:out value="${pay_type }"/></td>
							<td class="alignCenter" <c:out value="${rowspan_str }"/> ><a href="/admgr/admgrOrder/orderForm.do?pageIndex=<c:out value="${paginationInfo.currentPageNo }"/>&order_st_dt=<c:out value="${eg_st_dt }"/>&order_ed_dt=<c:out value="${eg_ed_dt }"/>&searchKey=<c:out value="${searchKey }"/>&searchKeyword=<c:out value="${searchKeyword }"/>&pay_st=<c:out value="${pay_st }"/>&order_id=<c:out value="${orderList.order_id }"/>" class="btns bluebtn h24px">보기</a></td>
							</c:if>
						</tr>
						<c:set var="i" value="${i+1 }"/>
						</c:forEach>
						<c:set var="k" value="${k+1 }"/>
					</c:forEach>
					</tbody>
					<!-- <tfoot>
						<tr>
							<td class="alignCenter" colspan="2" >합계</td>
							<td ></td>
							<td class="alignRight" >169,000</td>
							<td class="alignRight">3,200</td>
							<td class="alignRight" >47,200</td>
							<td class="alignRight" >47,200</td>
							<td class="alignRight" >47,200</td>
							<td ></td>
						</tr>
						<tr>
							<td class="alignRight">4,000</td>
						</tr>
					</tfoot> -->
				</table>
				<!-- } 리스트 -->

				<div class="pagination">
				<ul>
					<ui:pagination paginationInfo = "${paginationInfo}" type="image" jsFunction="jsPaging" />
				</ul>
				</div>
			</section>
			<!-- } 주문내역 > 관광/체험 > 리스트 -->
		</div>
		<!-- } 콘텐츠 영역 -->
		
		<script type="text/javascript">
				// 페이징함수
				function jsPaging(pageNo) {
					//console.log(pageNo);
					var order_st_dt = $.trim($('#order_st_dt').val());
					var order_ed_dt = $.trim($('#order_ed_dt').val());
					var searchKey = $.trim($('#searchKey').val());
					var searchKeyword = $.trim($('#searchKeyword').val());
			
					var linkurl = "/admgr/admgrOrder/orderList.do?pageIndex="+pageNo;
					
					if(order_st_dt) {
						linkurl += "&order_st_dt="+order_st_dt;
					}
					if(order_ed_dt) {
						linkurl += "&order_ed_dt="+order_ed_dt;
					}
					if(searchKey && searchKeyword) {
						linkurl += "&searchKey="+searchKey+"&searchKeyword="+searchKeyword;
					}

					//console.log(linkurl)
					location.href = linkurl;
				}
				</script>


<c:import url="/Api/admgrIncludeBottom.do"/>