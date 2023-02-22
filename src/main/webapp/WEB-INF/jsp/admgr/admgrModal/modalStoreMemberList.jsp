<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="total_cnt" value="${modalTotalCnt }"/>
<c:choose>
<c:when test="${not empty modalMemberList }">
<c:forEach var="modalMemberList" items="${modalMemberList}" varStatus="status">
	<tr>
		<td class="alignCenter"><c:out value="${total_cnt}"/></td>
		<td class="alignCenter"><c:out value="${modalMemberList.user_id}"/></td>
		<td class="alignCenter"><c:out value="${modalMemberList.user_nm }"/></td>
		<td class="alignCenter"><c:out value="${modalMemberList.user_hp}"/></td>
		<td class="alignCenter"><c:out value="${modalMemberList.reg_dt }"/></td>
		<td class="alignCenter"><a href="#;" class="btns redbtn h24px" onclick="setStoreUser('<c:out value="${modalMemberList.user_id}"/>','<c:out value="${modalMemberList.user_nm}"/>','<c:out value="${modalMemberList.user_hp}"/>','<c:out value="${modalMemberList.user_email}"/>'); ">선택</a></td>
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