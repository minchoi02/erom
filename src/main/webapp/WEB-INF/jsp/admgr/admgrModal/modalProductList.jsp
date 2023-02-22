<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="total_cnt" value="${modalTotalCnt }"/>
<c:choose>
<c:when test="${not empty modalProductList }">
<c:forEach var="modalProductList" items="${modalProductList}" varStatus="status">
	<tr>
		<td class="alignCenter"><c:out value="${total_cnt}"/></td>
		<td class="alignCenter"><c:out value="${modalProductList.store_category_nm}"/></td>
		<td class="alignCenter"><img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${modalProductList.prod_img_1}"/>&fileSn=0" width="100"  onerror="this.src='/images/baseScmtour/_noImage.png';"/></td>
		<td class="alignCenter"><c:out value="${modalProductList.prod_nm}"/></td>
		<td class="alignCenter"><c:out value="${modalProductList.store_nm}"/></td>
		<td class="alignCenter"><a href="#;" class="btns redbtn h24px" onclick="setProducInfo($('#in_id').val(), $('#in_prod_id').val(), $('#in_store_category').val(), '<c:out value="${modalProductList.prod_id}"/>','<c:out value="${modalProductList.prod_nm}"/>','<c:out value="${modalProductList.store_category}"/>'); ">선택</a></td>
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
