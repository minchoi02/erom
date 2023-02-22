<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="total_cnt" value="${modalTotalCnt }"/>
<c:choose>
<c:when test="${not empty modalStoreList }">
<c:forEach var="modalStoreList" items="${modalStoreList}" varStatus="status">
	<tr>
		<td class="alignCenter"><c:out value="${total_cnt}"/></td>
		<td class="alignCenter"><c:out value="${modalStoreList.store_nm}"/></td>
		<td class="alignCenter"><c:out value="${modalStoreList.store_ceo_nm }"/></td>
		<td class="alignCenter"><c:out value="${modalStoreList.store_hp_1}"/></td>
		<td class="alignCenter">
		<c:choose>
			<c:when test="${modalStoreList.store_use_st eq 'Y' }"><span class="btns greenbtn h24px">운영중</span></c:when>
			<c:otherwise><span class="btns graybtn h24px">운영중지</span></c:otherwise>
		</c:choose>
		</td>
		<td class="alignCenter"><a href="#;" class="btns redbtn h24px" onclick="setProductStore('<c:out value="${modalStoreList.store_id}"/>','<c:out value="${modalStoreList.store_nm}"/>','<c:out value="${modalStoreList.store_ceo_nm}"/>','<c:out value="${modalStoreList.store_hp_1}"/>','<c:out value="${modalStoreList.store_email}"/>','<c:out value="${modalStoreList.store_use_st}"/>'); ">선택</a></td>
	</tr>
	<c:set var="total_cnt" value="${total_cnt-1 }"/>
</c:forEach>
</c:when>
<c:otherwise>
	<tr>
		<td class="alignCenter" colspan="6">검색된 데이터가 없습니다.</td>
	</tr>
</c:otherwise>
</c:choose>