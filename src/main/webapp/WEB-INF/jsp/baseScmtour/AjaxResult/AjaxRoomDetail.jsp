<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
		<c:if test="${not empty prod_room_content_1_str }">
		<dl class="nopm">
			<dt>기본정보</dt>
			<dd><c:out value="${prod_room_content_1_str}" escapeXml = "false" /></dd>
		</dl>
		</c:if>
		<c:if test="${not empty prod_room_content_2_str }">
		<dl class="nopm">
			<dt>편의시설</dt>
			<dd><c:out value="${prod_room_content_2_str}" escapeXml = "false" /></dd>
		</dl>
		</c:if>
		<dl class="nopm">
			<dt>가격정보</dt>
			<dd>
			<table class="option_tbl">
				<colgroup>
					<col />
					<col style="width:60%" />
				</colgroup>
				<tbody>
					<tr>
						<th>준성수기</th>
						<td class="alignRight">
							<c:out value="${storeInfo.store_house_ready_date_st_dt}"/> ~ <c:out value="${storeInfo.store_house_ready_date_ed_dt}"/>  
						</td>
					</tr>
					<tr>
						<th>성수기</th>
						<td class="alignRight">
							<c:out value="${storeInfo.store_house_busy_date_st_dt}"/> ~ <c:out value="${storeInfo.store_house_busy_date_ed_dt}"/>  
						</td>
					</tr>
					<c:if test="${not empty storeInfo.store_house_ready2_date_st_dt && not empty storeInfo.store_house_ready2_date_ed_dt}">
					<tr>
						<th>준성수기(성수기 후)</th>
						<td class="alignRight">
							<c:out value="${storeInfo.store_house_ready2_date_st_dt}"/> ~ <c:out value="${storeInfo.store_house_ready2_date_ed_dt}"/>  
						</td>
					</tr>
					</c:if>
				</tbody>
			</table>
			<table class="option_tbl mgt20px">
				<colgroup>
					<col />
					<col style="width:150px" />
				</colgroup>
				<tbody>
					<tr>
						<th>비수기  - 1일(평일/주말)</th>
						<td class="alignRight">
							<fmt:formatNumber value="${roomDetail.prod_room_normal_normal_sale_price }" type="number"/> 원 / <fmt:formatNumber value="${roomDetail.prod_room_normal_holiday_sale_price }" type="number"/> 원  
						</td>
					</tr>
					<tr>
						<th>준성수기 - 1일(평일/주말)</th>
						<td class="alignRight">
							<fmt:formatNumber value="${roomDetail.prod_room_ready_normal_sale_price }" type="number"/> 원 / <fmt:formatNumber value="${roomDetail.prod_room_ready_holiday_sale_price }" type="number"/> 원 
						</td>
					</tr>
					<tr>
						<th>성수기 - 1일(평일/주말)</th>
						<td class="alignRight">
							<fmt:formatNumber value="${roomDetail.prod_room_busy_normal_sale_price }" type="number"/> 원 / <fmt:formatNumber value="${roomDetail.prod_room_busy_holiday_sale_price }" type="number"/> 원
						</td>
					</tr>
					<c:if test="${not empty roomDetail.prod_room_ready2_normal_sale_price && not empty roomDetail.prod_room_ready2_holiday_sale_price}">
					<tr>
						<th>준성수기(성수기 후) - 1일(평일/주말)</th>
						<td class="alignRight">
							<fmt:formatNumber value="${roomDetail.prod_room_ready2_normal_sale_price }" type="number"/> 원 / <fmt:formatNumber value="${roomDetail.prod_room_ready2_holiday_sale_price }" type="number"/> 원 
						</td>
					</tr>
					</c:if>
				</tbody>
			</table>
			</dd>
		</dl>
