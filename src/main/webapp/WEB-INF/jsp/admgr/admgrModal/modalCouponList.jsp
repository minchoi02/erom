<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="total_cnt" value="${modalTotalCnt }"/>
<c:choose>
<c:when test="${not empty modalCouponList }">
<c:forEach var="modalCouponList" items="${modalCouponList}" varStatus="status">
	<c:choose>
		<c:when test="${empty modalCouponList.store_category }">
			<c:set var="store_category_nm" value="전체"/>
		</c:when>
		<c:otherwise>
			<c:set var="store_category_nm" value="${ modalCouponList.store_category_nm}"/>
		</c:otherwise>
	</c:choose>
	<c:set var="set_st" value="원"/>
	<c:if test="${modalCouponList.coupon_set_st eq 'P' }">
		<c:set var="set_st" value="%"/>
	</c:if>
	<tr>
		<td class="alignCenter"><c:out value="${total_cnt}"/></td>
		<td class="alignCenter"><c:out value="${store_category_nm}"/></td>
		<td class="alignCenter"><c:out value="${modalCouponList.coupon_nm }"/></td>
		<td class="alignCenter"><c:out value="${modalCouponList.coupon_set_price}"/> <c:out value="${set_st}"/></td>
		<td class="alignCenter"><a href="#;" class="btns redbtn h24px" onclick="setCoupon('<c:out value="${cp_bbs_id}"/>','<c:out value="${modalCouponList.coupon_id}"/>','<c:out value="${modalCouponList.coupon_nm}"/>'); ">선택</a></td>
	</tr>
	<c:set var="total_cnt" value="${total_cnt-1 }"/>
</c:forEach>
</c:when>
<c:otherwise>
	<tr>
		<td class="alignCenter" colspan="5">검색된 데이터가 없습니다.</td>
	</tr>
</c:otherwise>
</c:choose>
