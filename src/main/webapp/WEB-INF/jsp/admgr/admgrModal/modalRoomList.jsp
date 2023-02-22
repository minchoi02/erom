<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:forEach var="roomList" items="${roomList}" varStatus="status">
							<tr>
								<td class="alignCenter"><c:out value="${roomList.prod_room_orderby}"/></td>
								<td class="alignCenter"><c:if test="${not empty roomList.prod_room_img_1 }"><img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${roomList.prod_room_img_1}"/>&fileSn=0" width="100"  onerror="this.src='/images/baseScmtour/_noImage.png';"/></c:if></td>
								<td class="alignCenter"><c:out value="${roomList.prod_room_nm}"/></td>
								<td class="alignCenter"><c:out value="${roomList.prod_room_default_cnt}"/></td>
								<td class="alignCenter"><c:out value="${roomList.prod_room_max_cnt}"/></td>
								<td class="alignCenter">
									<fmt:formatNumber value="${roomList.prod_room_normal_normal_sale_price}" type="number"/> 원 /
									<fmt:formatNumber value="${roomList.prod_room_normal_holiday_sale_price}" type="number"/> 원
								</td>
								<td class="alignCenter">
									<fmt:formatNumber value="${roomList.prod_room_ready_normal_sale_price}" type="number"/>원 / 
									<fmt:formatNumber value="${roomList.prod_room_ready_holiday_sale_price}" type="number"/>원
								</td>
								<td class="alignCenter">
									<fmt:formatNumber value="${roomList.prod_room_busy_normal_sale_price}" type="number"/>원 / 
									<fmt:formatNumber value="${roomList.prod_room_busy_holiday_sale_price}" type="number"/> 원
								</td>
								<td class="alignCenter">
									<fmt:formatNumber value="${roomList.prod_room_ready2_normal_sale_price}" type="number"/>원 / 
									<fmt:formatNumber value="${roomList.prod_room_ready2_holiday_sale_price}" type="number"/>원
								</td>
								<td class="alignCenter">
									<button type="button" class="btns bluebtn h24px" onclick="roomSet('<c:out value="${roomList.prod_room_seq }"/>','<c:out value="${roomList.prod_room_nm}"/>'); " >수정</button>
									<a href="#" onclick="roomDel('<c:out value="${roomList.prod_room_seq }"/>'); return false; " class="btns lightbluebtn h24px">삭제</a>
								</td>
							</tr>
</c:forEach>