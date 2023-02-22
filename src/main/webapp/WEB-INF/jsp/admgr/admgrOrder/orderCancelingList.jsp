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
					주문취소 내역입니다.<br />
				</p>
			</div>
			
			<!-- 주문내역 > 관광/체험 > 리스트 { -->
			<section id="orderTravelList" class="page_content">

				<!-- 리스트 { -->
				<table class="admin_tbl admin_calculate_tbl mgt10px">
					<caption>주문취소 요청 리스트</caption>
					<colgroup>
						<col width="150" />
						<col width="200" />
						<col width="150" />
						<col width="150" />
						<col />
						<col width="80" />
					</colgroup>
					<thead>
						<tr>
							<th>취소요청일</th>
							<th>주문번호</th>
							<th>주문일</th>
							<th>주문자</th>
							<th>상품명</th>
							<th>보기</th>
						</tr>
					</thead>
					<tbody>
					<c:set var="k" value="0"/>
					<c:forEach var="order_cancel_list" items="${order_cancel_list}" varStatus="status">
						<c:choose>
							<c:when test="${order_cancel_list.order_pay_st eq 'B' }"><c:set var="pay_type" value="무통장입금"/></c:when>
							<c:when test="${order_cancel_list.order_pay_st eq 'V' }"><c:set var="pay_type" value="가상계좌"/></c:when>
							<c:when test="${order_cancel_list.order_pay_st eq 'R' }"><c:set var="pay_type" value="실시간계좌이체"/></c:when>
							<c:otherwise><c:set var="pay_type" value="신용카드"/></c:otherwise>
						</c:choose>
						
						<c:if test="${k%2 == 0 }">
							<c:set var="tr_class" value="twobg"/>
						</c:if>
						
						<tr class="<c:out value="${tr_class }"/>">
							<td class="alignCenter" ><c:out value="${order_cancel_list.od_canceling_dt }"/></td>
							<td class="alignCenter" ><c:out value="${order_cancel_list.od_order_id }"/></td>
							<td class="alignCenter" ><c:out value="${order_cancel_list.reg_dt }"/></td>
							<td class="alignCenter" <c:out value="${rowspan_str }"/> ><c:out value="${order_cancel_list.order_user_nm }"/></td>
							<td class="alignLeft" >
								<small class="colorGray">[<c:out value="${order_cancel_list.store_nm }"/>]</small>
								<br />
								<c:out value="${order_cancel_list.od_prod_nm }"/>
							</td>
							<td class="alignCenter" ><a href="/admgr/admgrOrder/orderForm.do?pageIndex=1&order_st_dt=<c:out value="${eg_st_dt }"/>&order_ed_dt=<c:out value="${eg_ed_dt }"/>&searchKey=<c:out value="${searchKey }"/>&searchKeyword=<c:out value="${searchKeyword }"/>&pay_st=<c:out value="${pay_st }"/>&order_id=<c:out value="${order_cancel_list.od_order_id }"/>" class="btns bluebtn h24px">보기</a></td>
						</tr>
						<c:set var="k" value="${k+1 }"/>
					</c:forEach>
					</tbody>
				</table>
				<!-- } 리스트 -->

			</section>
			<!-- } 주문내역 > 관광/체험 > 리스트 -->
		</div>
		<!-- } 콘텐츠 영역 -->
		
<c:import url="/Api/admgrIncludeBottom.do"/>