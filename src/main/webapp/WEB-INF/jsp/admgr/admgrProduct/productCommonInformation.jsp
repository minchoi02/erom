<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<div style="display: ;" id="infomation_data">
	<c:set var="prod_trade_info_1" value="${storeInfo.store_info_1}"/>
	<c:set var="prod_trade_info_2" value="${storeInfo.store_info_2}"/>
	<c:set var="prod_trade_info_3" value="${storeInfo.store_info_3}"/>
	<c:set var="prod_trade_info_4" value="${storeInfo.store_info_4}"/>
	<c:set var="prod_trade_info_5" value="${storeInfo.store_info_5}"/>	
	<c:choose>
		<c:when test="${store_category eq 'CD002001'}">
			<c:set var="prod_info_1" value="${storeInfo.store_info1_1 }"/>
			<c:set var="prod_info_2" value="${storeInfo.store_info1_2 }"/>
			<c:set var="prod_info_3" value="${storeInfo.store_info1_3 }"/>
			<c:set var="prod_info_4" value="${storeInfo.store_info1_4 }"/>
			<c:set var="prod_info_5" value="${storeInfo.store_info1_5 }"/>
		</c:when>		
		<c:when test="${store_category eq 'CD002002'}">
			<c:set var="prod_info_1" value="${storeInfo.store_info2_1 }"/>
			<c:set var="prod_info_2" value="${storeInfo.store_info2_2 }"/>
			<c:set var="prod_info_3" value="${storeInfo.store_info2_3 }"/>
			<c:set var="prod_info_4" value="${storeInfo.store_info2_4 }"/>
			<c:set var="prod_info_5" value="${storeInfo.store_info2_5 }"/>
			<c:set var="prod_info_6" value="${storeInfo.store_info2_6 }"/>
			<c:set var="prod_info_7" value="${storeInfo.store_info2_7 }"/>
		</c:when>		
		<c:when test="${store_category eq 'CD002003'}">
			<c:set var="prod_info_1" value="${storeInfo.store_info3_1 }"/>
			<c:set var="prod_info_2" value="${storeInfo.store_info3_2 }"/>
			<c:set var="prod_info_3" value="${storeInfo.store_info3_3 }"/>
			<c:set var="prod_info_4" value="${storeInfo.store_info3_4 }"/>
			<c:set var="prod_info_5" value="${storeInfo.store_info3_5 }"/>
			<c:set var="prod_info_6" value="${storeInfo.store_info3_6 }"/>
			<c:set var="prod_info_7" value="${storeInfo.store_info3_7 }"/>
			<c:set var="prod_info_8" value="${storeInfo.store_info3_8 }"/>
			<c:set var="prod_info_9" value="${storeInfo.store_info3_9 }"/>
			<c:set var="prod_info_10" value="${storeInfo.store_info3_10 }"/>
		</c:when>		
		<c:when test="${store_category eq 'CD002004'}">
			<c:set var="prod_info1_1" value="${storeInfo.store_info4_1 }"/>
			<c:set var="prod_info1_2" value="${storeInfo.store_info4_2 }"/>
			<c:set var="prod_info1_3" value="${storeInfo.store_info4_3 }"/>
			<c:set var="prod_info1_4" value="${storeInfo.store_info4_4 }"/>
			<c:set var="prod_info1_5" value="${storeInfo.store_info4_5 }"/>
			<c:set var="prod_info1_6" value="${storeInfo.store_info4_6 }"/>
			<c:set var="prod_info1_7" value="${storeInfo.store_info4_7 }"/>
			<c:set var="prod_info1_8" value="${storeInfo.store_info4_8 }"/>
			<c:set var="prod_info1_9" value="${storeInfo.store_info4_9 }"/>
			<c:set var="prod_info1_10" value="${storeInfo.store_info4_10 }"/>
			<c:set var="prod_info1_11" value="${storeInfo.store_info4_11 }"/>
			
			<c:set var="prod_info2_1" value="${storeInfo.store_info5_1 }"/>
			<c:set var="prod_info2_2" value="${storeInfo.store_info5_2}"/>
			<c:set var="prod_info2_3" value="${storeInfo.store_info5_3}"/>
			<c:set var="prod_info2_4" value="${storeInfo.store_info5_4}"/>
			<c:set var="prod_info2_5" value="${storeInfo.store_info5_5}"/>
			<c:set var="prod_info2_6" value="${storeInfo.store_info5_6}"/>
			<c:set var="prod_info2_7" value="${storeInfo.store_info5_7}"/>
			<c:set var="prod_info2_8" value="${storeInfo.store_info5_8}"/>
			<c:set var="prod_info2_9" value="${storeInfo.store_info5_9}"/>
			<c:set var="prod_info2_10" value="${storeInfo.store_info5_10}"/>
			
			<c:set var="prod_info3_1" value="${storeInfo.store_info6_1}"/>
			<c:set var="prod_info3_2" value="${storeInfo.store_info6_2}"/>
			<c:set var="prod_info3_3" value="${storeInfo.store_info6_3}"/>
			<c:set var="prod_info3_4" value="${storeInfo.store_info6_4 }"/>
			<c:set var="prod_info3_5" value="${storeInfo.store_info6_5 }"/>
			<c:set var="prod_info3_6" value="${storeInfo.store_info6_6}"/>
			<c:set var="prod_info3_7" value="${storeInfo.store_info6_7}"/>
			<c:set var="prod_info3_8" value="${storeInfo.store_info6_8}"/>
			<c:set var="prod_info3_9" value="${storeInfo.store_info6_9}"/>
			<c:set var="prod_info3_10" value="${storeInfo.store_info6_10}"/>
			<c:set var="prod_info3_11" value="${storeInfo.store_info6_11}"/>
			<c:set var="prod_info3_11" value="${storeInfo.store_info6_12}"/>
			<c:set var="prod_info3_11" value="${storeInfo.store_info6_13}"/>
			
			<c:set var="prod_info4_1" value="${storeInfo.store_info7_1}"/>
			<c:set var="prod_info4_2" value="${storeInfo.store_info7_2}"/>
			<c:set var="prod_info4_3" value="${storeInfo.store_info7_3}"/>
			<c:set var="prod_info4_4" value="${storeInfo.store_info7_4}"/>
			<c:set var="prod_info4_5" value="${storeInfo.store_info7_5}"/>
			<c:set var="prod_info4_6" value="${storeInfo.store_info7_6}"/>
			<c:set var="prod_info4_7" value="${storeInfo.store_info7_7}"/>
			<c:set var="prod_info4_8" value="${storeInfo.store_info7_8}"/>
			<c:set var="prod_info4_9" value="${storeInfo.store_info7_9}"/>
			<c:set var="prod_info4_10" value="${storeInfo.store_info7_10}"/>
			<c:set var="prod_info4_11" value="${storeInfo.store_info7_11}"/>
			
			<c:set var="prod_info5_1" value="${storeInfo.store_info8_1}"/>
			<c:set var="prod_info5_2" value="${storeInfo.store_info8_2}"/>
			<c:set var="prod_info5_3" value="${storeInfo.store_info8_3}"/>
			<c:set var="prod_info5_4" value="${storeInfo.store_info8_4}"/>
			<c:set var="prod_info5_5" value="${storeInfo.store_info8_5}"/>
			
		</c:when>
	</c:choose>
	<input type="hidden" id="def_prod_info_1" value="<c:out value="${prod_info_1}"/>"  />
	<input type="hidden" id="def_prod_info_2" value="<c:out value="${prod_info_2}"/>"  />
	<input type="hidden" id="def_prod_info_3" value="<c:out value="${prod_info_3}"/>"  />
	<input type="hidden" id="def_prod_info_4" value="<c:out value="${prod_info_4}"/>"  />
	<input type="hidden" id="def_prod_info_5" value="<c:out value="${prod_info_5}"/>"  />
	<input type="hidden" id="def_prod_info_6" value="<c:out value="${prod_info_6}"/>"  />
	<input type="hidden" id="def_prod_info_7" value="<c:out value="${prod_info_7}"/>"  />
	<input type="hidden" id="def_prod_info_8" value="<c:out value="${prod_info_8}"/>"  />
	<input type="hidden" id="def_prod_info_9" value="<c:out value="${prod_info_9}"/>"  />
	
	<input type="hidden" id="def_prod_info1_1" value="<c:out value="${prod_info1_1}"/>"  />
	<input type="hidden" id="def_prod_info1_2" value="<c:out value="${prod_info1_2}"/>"  />
	<input type="hidden" id="def_prod_info1_3" value="<c:out value="${prod_info1_3}"/>"  />
	<input type="hidden" id="def_prod_info1_4" value="<c:out value="${prod_info1_4}"/>"  />
	<input type="hidden" id="def_prod_info1_5" value="<c:out value="${prod_info1_5}"/>"  />
	<input type="hidden" id="def_prod_info1_6" value="<c:out value="${prod_info1_6}"/>"  />
	<input type="hidden" id="def_prod_info1_7" value="<c:out value="${prod_info1_7}"/>"  />
	<input type="hidden" id="def_prod_info1_8" value="<c:out value="${prod_info1_8}"/>"  />
	<input type="hidden" id="def_prod_info1_9" value="<c:out value="${prod_info1_9}"/>"  />
	<input type="hidden" id="def_prod_info1_10" value="<c:out value="${prod_info1_10}"/>"  />
	<input type="hidden" id="def_prod_info1_11" value="<c:out value="${prod_info1_11}"/>"  />

	<input type="hidden" id="def_prod_info2_1" value="<c:out value="${prod_info2_1}"/>"  />
	<input type="hidden" id="def_prod_info2_2" value="<c:out value="${prod_info2_2}"/>"  />
	<input type="hidden" id="def_prod_info2_3" value="<c:out value="${prod_info2_3}"/>"  />
	<input type="hidden" id="def_prod_info2_4" value="<c:out value="${prod_info2_4}"/>"  />
	<input type="hidden" id="def_prod_info2_5" value="<c:out value="${prod_info2_5}"/>"  />
	<input type="hidden" id="def_prod_info2_6" value="<c:out value="${prod_info2_6}"/>"  />
	<input type="hidden" id="def_prod_info2_7" value="<c:out value="${prod_info2_7}"/>"  />
	<input type="hidden" id="def_prod_info2_8" value="<c:out value="${prod_info2_8}"/>"  />
	<input type="hidden" id="def_prod_info2_9" value="<c:out value="${prod_info2_9}"/>"  />
	<input type="hidden" id="def_prod_info2_10" value="<c:out value="${prod_info2_10}"/>"  />
	
	<input type="hidden" id="def_prod_info3_1" value="<c:out value="${prod_info3_1}"/>"  />
	<input type="hidden" id="def_prod_info3_2" value="<c:out value="${prod_info3_2}"/>"  />
	<input type="hidden" id="def_prod_info3_3" value="<c:out value="${prod_info3_3}"/>"  />
	<input type="hidden" id="def_prod_info3_4" value="<c:out value="${prod_info3_4}"/>"  />
	<input type="hidden" id="def_prod_info3_5" value="<c:out value="${prod_info3_5}"/>"  />
	<input type="hidden" id="def_prod_info3_6" value="<c:out value="${prod_info3_6}"/>"  />
	<input type="hidden" id="def_prod_info3_7" value="<c:out value="${prod_info3_7}"/>"  />
	<input type="hidden" id="def_prod_info3_8" value="<c:out value="${prod_info3_8}"/>"  />
	<input type="hidden" id="def_prod_info3_9" value="<c:out value="${prod_info3_9}"/>"  />
	<input type="hidden" id="def_prod_info3_10" value="<c:out value="${prod_info3_10}"/>"  />
	<input type="hidden" id="def_prod_info3_11" value="<c:out value="${prod_info3_11}"/>"  />
	<input type="hidden" id="def_prod_info3_12" value="<c:out value="${prod_info3_12}"/>"  />
	<input type="hidden" id="def_prod_info3_13" value="<c:out value="${prod_info3_13}"/>"  />
	
	<input type="hidden" id="def_prod_info4_1" value="<c:out value="${prod_info4_1}"/>"  />
	<input type="hidden" id="def_prod_info4_2" value="<c:out value="${prod_info4_2}"/>"  />
	<input type="hidden" id="def_prod_info4_3" value="<c:out value="${prod_info4_3}"/>"  />
	<input type="hidden" id="def_prod_info4_4" value="<c:out value="${prod_info4_4}"/>"  />
	<input type="hidden" id="def_prod_info4_5" value="<c:out value="${prod_info4_5}"/>"  />
	<input type="hidden" id="def_prod_info4_6" value="<c:out value="${prod_info4_6}"/>"  />
	<input type="hidden" id="def_prod_info4_7" value="<c:out value="${prod_info4_7}"/>"  />
	<input type="hidden" id="def_prod_info4_8" value="<c:out value="${prod_info4_8}"/>"  />
	<input type="hidden" id="def_prod_info4_9" value="<c:out value="${prod_info4_9}"/>"  />
	<input type="hidden" id="def_prod_info4_10" value="<c:out value="${prod_info4_10}"/>"  />
	<input type="hidden" id="def_prod_info4_11" value="<c:out value="${prod_info4_11}"/>"  />
	
	<input type="hidden" id="def_prod_info5_1" value="<c:out value="${prod_info5_1}"/>"  />
	<input type="hidden" id="def_prod_info5_2" value="<c:out value="${prod_info5_2}"/>"  />
	<input type="hidden" id="def_prod_info5_3" value="<c:out value="${prod_info5_3}"/>"  />
	<input type="hidden" id="def_prod_info5_4" value="<c:out value="${prod_info5_4}"/>"  />
	<input type="hidden" id="def_prod_info5_5" value="<c:out value="${prod_info5_5}"/>"  />
	
	
	<textarea id="def_prod_trade_info_1"  style="display: none;"><c:out value="${prod_trade_info_1}"/></textarea>
	<textarea id="def_prod_trade_info_2"  style="display: none;"><c:out value="${prod_trade_info_2}"/></textarea>
	<textarea id="def_prod_trade_info_3"  style="display: none;"><c:out value="${prod_trade_info_3}"/></textarea>
	<textarea id="def_prod_trade_info_4"  style="display: none;"><c:out value="${prod_trade_info_4}"/></textarea>
	<textarea id="def_prod_trade_info_5"  style="display: none;"><c:out value="${prod_trade_info_5}"/></textarea>
</div>

<c:if test="${store_category eq 'CD002001'  }">
				<article class="page_sortation">
					<h2 class="h2Tit"><i class="fal fa-window-minimize"></i> 전자상거래 등에서 상품제공 고시</h2>
					<table class="admin_tbl admin_write_tbl">
						<caption>전자상거래 등에서 상품제공 고시</caption>
						<colgroup>
							<col width="*" />
							<col width="70%" />
						</colgroup>
						<tbody>
							<tr>
								<th>발행자 &nbsp;&nbsp; <button type="button" onclick="base_prod_info_value('_1','1');" class="btns lightgraybtn h24px"> 상점 기본값 입력</button></th>
								<td><input type="text" id="prod_info_1" name="prod_info_1" class="admin_input w100" placeholder="홍길동"  value="<c:out value="${prodInfo.prod_info_1 }"/>" /></td>
							</tr>
							<tr>
								<th>이용 가능 매장 &nbsp;&nbsp; <button type="button" onclick="base_prod_info_value_set('_2');" class="btns lightgraybtn h24px"> 상점 기본값 입력</button></th>
								<td><input type="text" id="prod_info_2" name="prod_info_2" class="admin_input w100" placeholder="상품상세설명 참조" value="<c:out value="${prodInfo.prod_info_2 }"/>" /></td>
							</tr>
							<tr>
								<th>유효기간, 이용조건 &nbsp;&nbsp; <button type="button" onclick="base_prod_info_value_set('_3');" class="btns lightgraybtn h24px"> 상점 기본값 입력</button></th>
								<td><input type="text" id="prod_info_3" name="prod_info_3" class="admin_input w100" placeholder="상품상세설명 참조" value="<c:out value="${prodInfo.prod_info_3 }"/>" /></td>
							</tr>
							<tr>
								<th>환불조건 및 방법 &nbsp;&nbsp; <button type="button" onclick="base_prod_info_value_set('_4');" class="btns lightgraybtn h24px"> 상점 기본값 입력</button></th>
								<td><input type="text" id="prod_info_4" name="prod_info_4" class="admin_input w100" placeholder="상품상세설명 참조" value="<c:out value="${prodInfo.prod_info_4 }"/>" /></td>
							</tr>
							<tr>
								<th>소비자상담 관련 전화번호 &nbsp;&nbsp; <button type="button" onclick="base_prod_info_value('_5','2');" class="btns lightgraybtn h24px"> 상점 기본값 입력</button></th>
								<td><input type="text" id="prod_info_5" name="prod_info_5" class="admin_input w100" placeholder="상품상세설명 참조" value="<c:out value="${prodInfo.prod_info_5 }"/>" /></td>
							</tr>
						</tbody>
					</table>
				</article>
</c:if>

<c:if test="${store_category eq 'CD002002'  }">
				<article class="page_sortation">
					<h2 class="h2Tit"><i class="fal fa-window-minimize"></i> 전자상거래 등에서 상품제공 고시</h2>
					<table class="admin_tbl admin_write_tbl">
						<caption>전자상거래 등에서 상품제공 고시</caption>
						<colgroup>
							<col width="*" />
							<col width="70%" />
						</colgroup>
						<tbody>
							<tr>
								<th>국가 또는 지역명 &nbsp;&nbsp; <button type="button" onclick="base_prod_info_value_set('_1','1');" class="btns lightgraybtn h24px"> 상점 기본값 입력</button></th>
								<td><input type="text" id="prod_info_1" name="prod_info_1" class="admin_input w100" placeholder="충남 서천" value="<c:out value="${prodInfo.prod_info_1 }"/>" /></td>
							</tr>
							<tr>
								<th>숙소 형태</th>
								<td><input type="text" id="prod_info_2" name="prod_info_2" class="admin_input w100" placeholder="펜션" value="<c:out value="${prodInfo.prod_info_2 }"/>" /></td>
							</tr>
							<tr>
								<th>등급, 객실타입 &nbsp;&nbsp; <button type="button" onclick="base_prod_info_value_set('_3');" class="btns lightgraybtn h24px"> 상점 기본값 입력</button></th>
								<td><input type="text" id="prod_info_3" name="prod_info_3" class="admin_input w100" placeholder="상품상세설명 참조" value="<c:out value="${prodInfo.prod_info_3 }"/>" /></td>
							</tr>
							<tr>
								<th>사용가능 인원, 인원 추가 시 비용 &nbsp;&nbsp; <button type="button" onclick="base_prod_info_value_set('_4');" class="btns lightgraybtn h24px"> 상점 기본값 입력</button></th>
								<td><input type="text" id="prod_info_4" name="prod_info_4" class="admin_input w100" placeholder="상품상세설명 참조" value="<c:out value="${prodInfo.prod_info_4 }"/>" /></td>
							</tr>
							<tr>
								<th>부대시설, 제공 서비스 &nbsp;&nbsp; <button type="button" onclick="base_prod_info_value_set('_5');" class="btns lightgraybtn h24px"> 상점 기본값 입력</button></th>
								<td><input type="text" id="prod_info_5" name="prod_info_5" class="admin_input w100" placeholder="상품상세설명 참조" value="<c:out value="${prodInfo.prod_info_5 }"/>" /></td>
							</tr>
							<tr>
								<th>취소 규정 &nbsp;&nbsp; <button type="button" onclick="base_prod_info_value_set('_6');" class="btns lightgraybtn h24px"> 상점 기본값 입력</button></th>
								<td><input type="text" id="prod_info_6" name="prod_info_6" class="admin_input w100" placeholder="상품상세설명 참조" value="<c:out value="${prodInfo.prod_info_6 }"/>" /></td>
							</tr>
							<tr>
								<th>예약 담당 연락처 &nbsp;&nbsp; <button type="button" onclick="base_prod_info_value('_7','2');" class="btns lightgraybtn h24px"> 상점 기본값 입력</button></th>
								<td><input type="text" id="prod_info_7" name="prod_info_7" class="admin_input w100" placeholder="상품상세설명 참조" value="<c:out value="${prodInfo.prod_info_7 }"/>" /></td>
							</tr>
						</tbody>
					</table>
				</article>
</c:if>


<c:if test="${store_category eq 'CD002003'  }">

				<article class="page_sortation">
					<h2 class="h2Tit"><i class="fal fa-window-minimize"></i> 전자상거래 등에서 상품제공 고시</h2>
					<table class="admin_tbl admin_write_tbl">
						<caption>전자상거래 등에서 상품제공 고시</caption>
						<colgroup>
							<col width="*" />
							<col width="70%" />
						</colgroup>
						<tbody>
							<tr>
								<th>식품의 유형 &nbsp;&nbsp; <button type="button" onclick="base_prod_info_value_set('_1');" class="btns lightgraybtn h24px"> 상점 기본값 입력</button></th>
								<td><input type="text" id="prod_info_1" name="prod_info_1" class="admin_input w100" placeholder="즉석조리식품" value="<c:out value="${prodInfo.prod_info_1 }"/>" /></td>
							</tr>
							<tr>
								<th>생산자, 수입품의 경우 수입자를 함께 표기 &nbsp;&nbsp; <button type="button" onclick="base_prod_info_value('_2','3');" class="btns lightgraybtn h24px"> 상점 기본값 입력</button></th>
								<td><input type="text" id="prod_info_2" name="prod_info_2" class="admin_input w100" placeholder="상호명 / 주소" value="<c:out value="${prodInfo.prod_info_2 }"/>" /></td>
							</tr>
							<tr>
								<th>제조연월일, 유통기한 또는 품질유지기한 &nbsp;&nbsp; <button type="button" onclick="base_prod_info_value_set('_3');" class="btns lightgraybtn h24px"> 상점 기본값 입력</button></th>
								<td><input type="text" id="prod_info_3" name="prod_info_3" class="admin_input w100" placeholder="주문 후 제조" value="<c:out value="${prodInfo.prod_info_3 }"/>" /></td>
							</tr>
							<tr>
								<th>포장단위별 용량(중량), 수량 &nbsp;&nbsp; <button type="button" onclick="base_prod_info_value_set('_4');" class="btns lightgraybtn h24px"> 상점 기본값 입력</button></th>
								<td><input type="text" id="prod_info_4" name="prod_info_4" class="admin_input w100" placeholder="상세페이지 참조" value="<c:out value="${prodInfo.prod_info_4 }"/>" /></td>
							</tr>
							<tr>
								<th>원재료명 및 함량 &nbsp;&nbsp; <button type="button" onclick="base_prod_info_value_set('_5');" class="btns lightgraybtn h24px"> 상점 기본값 입력</button></th>
								<td><input type="text" id="prod_info_5" name="prod_info_5" class="admin_input w100" placeholder="상세페이지 참조" value="<c:out value="${prodInfo.prod_info_5 }"/>" /></td>
							</tr>
							<tr>
								<th>영양성분 &nbsp;&nbsp; <button type="button" onclick="base_prod_info_value_set('_6');" class="btns lightgraybtn h24px"> 상점 기본값 입력</button></th>
								<td><input type="text" id="prod_info_6" name="prod_info_6" class="admin_input w100" placeholder="상세페이지 참조" value="<c:out value="${prodInfo.prod_info_6 }"/>" /></td>
							</tr>
							<tr>
								<th>유전자재조합식품에 해당하는 경우의 표시 &nbsp;&nbsp; <button type="button" onclick="base_prod_info_value_set('_7');" class="btns lightgraybtn h24px"> 상점 기본값 입력</button></th>
								<td><input type="text" id="prod_info_7" name="prod_info_7" class="admin_input w100" placeholder="해당없음" value="<c:out value="${prodInfo.prod_info_7 }"/>" /></td>
							</tr>
							<tr>
								<th>영유아식 또는 체중조절식품 등에 해당하는 경우 표시광고 사전심의필 &nbsp;&nbsp; <button type="button" onclick="base_prod_info_value_set('_8');" class="btns lightgraybtn h24px"> 상점 기본값 입력</button></th>
								<td><input type="text" id="prod_info_8" name="prod_info_8" class="admin_input w100" placeholder="해당없음" value="<c:out value="${prodInfo.prod_info_8 }"/>" /></td>
							</tr>
							<tr>
								<th>수입식품에 해당하는 경우 식품위생법에 따른 수입신고를 필함의 문구 &nbsp;&nbsp; <button type="button" onclick="base_prod_info_value_set('_9');" class="btns lightgraybtn h24px"> 상점 기본값 입력</button></th>
								<td><input type="text" id="prod_info_9" name="prod_info_9" class="admin_input w100" placeholder="해당없음" value="<c:out value="${prodInfo.prod_info_9 }"/>" /></td>
							</tr>
							<tr>
								<th>소비자상담 관련 전화번호 &nbsp;&nbsp; <button type="button" onclick="base_prod_info_value('_10','2');" class="btns lightgraybtn h24px"> 상점 기본값 입력</button></th>
								<td><input type="text" id="prod_info_10" name="prod_info_10" class="admin_input w100" placeholder="상호명 전화번호" value="<c:out value="${prodInfo.prod_info_10 }"/>" /></td>
							</tr>
						</tbody>
					</table>
				</article>
 
</c:if>

<c:if test="${store_category eq 'CD002004'  }">
				<article class="page_sortation">
					<h2 class="h2Tit"><i class="fal fa-window-minimize"></i> 전자상거래 등에서 상품제공 고시</h2>
					<table class="admin_tbl admin_write_tbl">
						<caption>전자상거래 등에서 상품제공 고시</caption>
						<colgroup>
							<col width="*" />
							<col width="70%" />
						</colgroup>
						<tbody>
							<tr>
								<th>분류</th>
								<td>
									<input type="radio" id="prod_category_cd1" name="prod_category_cd" class="admin_check" <c:if test="${empty prodInfo.prod_category_cd || prodInfo.prod_category_cd eq '1' }">checked</c:if> onclick="setProdInformation(1); " value="1" ><label for="prod_category_cd1">농/축/수산물</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<input type="radio" id="prod_category_cd2" name="prod_category_cd" class="admin_check"  <c:if test="${prodInfo.prod_category_cd eq '2' }">checked</c:if> onclick="setProdInformation(2); " value="2" /><label for="prod_category_cd2">주류/가공품/신선식품</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<input type="radio" id="prod_category_cd3" name="prod_category_cd" class="admin_check"  <c:if test="${prodInfo.prod_category_cd eq '3' }">checked</c:if> onclick="setProdInformation(3); " value="3" /><label for="prod_category_cd3">건강기능식품</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<input type="radio" id="prod_category_cd4" name="prod_category_cd" class="admin_check"  <c:if test="${prodInfo.prod_category_cd eq '4' }">checked</c:if> onclick="setProdInformation(4); " value="4" /><label for="prod_category_cd4">화장품</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<input type="radio" id="prod_category_cd5" name="prod_category_cd" class="admin_check"  <c:if test="${prodInfo.prod_category_cd eq '5' }">checked</c:if> onclick="setProdInformation(5); " value="5" /><label for="prod_category_cd5">기타</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								</td>
							</tr>
						</tbody>
					</table>
					<table class="admin_tbl admin_write_tbl prodcategoryset" id="prod_category_1" style="display: none;" >
						<colgroup>
							<col width="*" />
							<col width="70%" />
						</colgroup>
						<tbody>
							<!-- 농/축/수산물 { -->
							<tr>
								<th>포장단위별 용량(중량), 수량, 크기 &nbsp;&nbsp; <button type="button" onclick="base_prod_info_value_set('1_1');" class="btns lightgraybtn h24px"> 상점 기본값 입력</button></th>
								<td><input type="text" id="prod_info1_1" name="prod_info1_1" class="admin_input w100" placeholder="상품상세설명 참조" value="<c:out value="${prodInfo.prod_info_1 }"/>" /></td>
							</tr>
							<tr>
								<th>생산자 &nbsp;&nbsp; <button type="button" onclick="base_prod_info_value_set('1_2');" class="btns lightgraybtn h24px"> 상점 기본값 입력</button></th>
								<td><input type="text" id="prod_info1_2" name="prod_info1_2" class="admin_input w100" placeholder="상품상세설명 참조" value="<c:out value="${prodInfo.prod_info_2 }"/>" /></td>
							</tr>
							<tr>
								<th>원산지 &nbsp;&nbsp; <button type="button" onclick="base_prod_info_value_set('1_3');" class="btns lightgraybtn h24px"> 상점 기본값 입력</button></th>
								<td><input type="text" id="prod_info1_3" name="prod_info_3" class="admin_input w100" placeholder="상품상세설명 참조" value="<c:out value="${prodInfo.prod_info_3 }"/>" /></td>
							</tr>
							<tr>
								<th>제조연월일(조장일 또는 생산연도), 유통기한 또는 품질유지기한 &nbsp;&nbsp; <button type="button" onclick="base_prod_info_value_set('1_4');" class="btns lightgraybtn h24px"> 상점 기본값 입력</button></th>
								<td><input type="text" id="prod_info1_4" name="prod_info1_4" class="admin_input w100" placeholder="제품에 별도 표기" value="<c:out value="${prodInfo.prod_info_4 }"/>" /></td>
							</tr>
							<tr>
								<th>농산물-농산물품질관리 법사 유전자 변형 농산물 표시, 지리적 표시 &nbsp;&nbsp; <button type="button" onclick="base_prod_info_value_set('1_5');" class="btns lightgraybtn h24px"> 상점 기본값 입력</button></th>
								<td><input type="text" id="prod_info1_5" name="prod_info1_5" class="admin_input w100" placeholder="해당없음" value="<c:out value="${prodInfo.prod_info_5 }"/>" /></td>
							</tr>
							<tr>
								<th>축산물-축산법에 따른 등급표시, 쇠고기의 경우 이력관리에 따른 표시 유무 &nbsp;&nbsp; <button type="button" onclick="base_prod_info_value_set('1_6');" class="btns lightgraybtn h24px"> 상점 기본값 입력</button></th>
								<td><input type="text" id="prod_info1_6" name="prod_info1_6" class="admin_input w100" placeholder="해당없음" value="<c:out value="${prodInfo.prod_info_6 }"/>" /></td>
							</tr>
							<tr>
								<th>수산물-수산물품질관리법상 유전자변형수산물 표시, 지리적 표시 &nbsp;&nbsp; <button type="button" onclick="base_prod_info_value_set('1_7');" class="btns lightgraybtn h24px"> 상점 기본값 입력</button></th>
								<td><input type="text" id="prod_info1_7" name="prod_info1_7" class="admin_input w100" placeholder="해당없음" value="<c:out value="${prodInfo.prod_info_7 }"/>" /></td>
							</tr>
							<tr>
								<th>수입식품에 해당하는 경우 식품위생법에 따른 수입신고를 필함의 문구 &nbsp;&nbsp; <button type="button" onclick="base_prod_info_value_set('1_8');" class="btns lightgraybtn h24px"> 상점 기본값 입력</button></th>
								<td><input type="text" id="prod_info1_8" name="prod_info1_8" class="admin_input w100" placeholder="해당없음" value="<c:out value="${prodInfo.prod_info_8 }"/>" /></td>
							</tr>
							<tr>
								<th>상품구성 &nbsp;&nbsp; <button type="button" onclick="base_prod_info_value_set('1_9');" class="btns lightgraybtn h24px"> 상점 기본값 입력</button></th>
								<td><input type="text" id="prod_info1_9" name="prod_info1_9" class="admin_input w100" placeholder="상품상세설명 참조" value="<c:out value="${prodInfo.prod_info_9 }"/>" /></td>
							</tr>
							<tr>
								<th>보관방법 또는 취급방법 &nbsp;&nbsp; <button type="button" onclick="base_prod_info_value_set('1_10');" class="btns lightgraybtn h24px"> 상점 기본값 입력</button></th>
								<td><input type="text" id="prod_info1_10" name="prod_info1_10" class="admin_input w100" placeholder="직사광선 및 고온 다습한 곳을 피하여 보관해주세요" value="<c:out value="${prodInfo.prod_info_10 }"/>" /></td>
							</tr>
							<tr>
								<th>소비자상담 관련 전화번호 &nbsp;&nbsp; <button type="button" onclick="base_prod_info_value('1_11','2');" class="btns lightgraybtn h24px"> 상점 기본값 입력</button></th>
								<td><input type="text" id="prod_info1_11" name="prod_info1_11" class="admin_input w100" placeholder="상품상세설명 참조" value="<c:out value="${prodInfo.prod_info_11 }"/>" /></td>
							</tr>
							<!-- } 농/축/수산물 -->
						</tbody>
					</table>
					<table class="admin_tbl admin_write_tbl prodcategoryset" id="prod_category_2" style="display: none;" >
						<colgroup>
							<col width="*" />
							<col width="70%" />
						</colgroup>
						<tbody>
							<!-- 주류/가공품/신선식품 { -->
							<tr>
								<th>식품의 유형 &nbsp;&nbsp; <button type="button" onclick="base_prod_info_value_set('2_1');" class="btns lightgraybtn h24px"> 상점 기본값 입력</button></th>
								<td><input type="text" id="prod_info2_1" name="prod_info2_1" class="admin_input w100" placeholder="주류/가공품/신선식품" value="<c:out value="${prodInfo.prod_info_1 }"/>" /></td>
							</tr>
							<tr>
								<th>생산자, 수입품의 경우 수입자를 함께 표기 &nbsp;&nbsp; <button type="button" onclick="base_prod_info_value_set('2_2');" class="btns lightgraybtn h24px"> 상점 기본값 입력</button></th>
								<td><input type="text" id="prod_info2_2" name="prod_info2_2" class="admin_input w100" placeholder="상품상세설명 참조" value="<c:out value="${prodInfo.prod_info_2 }"/>" /></td>
							</tr>
							<tr>
								<th>제조연월일, 유통기한 또는 품질유지기한 &nbsp;&nbsp; <button type="button" onclick="base_prod_info_value_set('2_3');" class="btns lightgraybtn h24px"> 상점 기본값 입력</button></th>
								<td><input type="text" id="prod_info2_3" name="prod_info2_3" class="admin_input w100" placeholder="상품상세설명 참조" value="<c:out value="${prodInfo.prod_info_3 }"/>" /></td>
							</tr>
							<tr>
								<th>포장단위별 용량(중량), 수량 &nbsp;&nbsp; <button type="button" onclick="base_prod_info_value_set('2_4');" class="btns lightgraybtn h24px"> 상점 기본값 입력</button></th>
								<td><input type="text" id="prod_info2_4" name="prod_info2_4" class="admin_input w100" placeholder="상품상세설명 참조" value="<c:out value="${prodInfo.prod_info_4 }"/>" /></td>
							</tr>
							<tr>
								<th>원재료명 및 함량 &nbsp;&nbsp; <button type="button" onclick="base_prod_info_value_set('2_5');" class="btns lightgraybtn h24px"> 상점 기본값 입력</button></th>
								<td><input type="text" id="prod_info2_5" name="prod_info2_5" class="admin_input w100" placeholder="상품상세설명 참조" value="<c:out value="${prodInfo.prod_info_5 }"/>" /></td>
							</tr>
							<tr>
								<th>영양성분 &nbsp;&nbsp; <button type="button" onclick="base_prod_info_value_set('2_6');" class="btns lightgraybtn h24px"> 상점 기본값 입력</button></th>
								<td><input type="text" id="prod_info2_6" name="prod_info2_6" class="admin_input w100" placeholder="상품상세설명 참조" value="<c:out value="${prodInfo.prod_info_6 }"/>" /></td>
							</tr>
							<tr>
								<th>유전자재조합식품에 해당하는 경우의 표시 &nbsp;&nbsp; <button type="button" onclick="base_prod_info_value_set('2_7');" class="btns lightgraybtn h24px"> 상점 기본값 입력</button></th>
								<td><input type="text" id="prod_info2_7" name="prod_info2_7" class="admin_input w100" placeholder="해당없음" value="<c:out value="${prodInfo.prod_info_7 }"/>" /></td>
							</tr>
							<tr>
								<th>영유아식 또는 체중조절식품 등에 해당하는 경우 표시광고 사전심의필 &nbsp;&nbsp; <button type="button" onclick="base_prod_info_value_set('2_8');" class="btns lightgraybtn h24px"> 상점 기본값 입력</button></th>
								<td><input type="text" id="prod_info2_8" name="prod_info2_8" class="admin_input w100" placeholder="해당없음" value="<c:out value="${prodInfo.prod_info_8 }"/>" /></td>
							</tr>
							<tr>
								<th>수입식품에 해당하는 경우 식품위생법에 따른 수입신고를 필함의 문구 &nbsp;&nbsp; <button type="button" onclick="base_prod_info_value_set('2_9');" class="btns lightgraybtn h24px"> 상점 기본값 입력</button></th>
								<td><input type="text" id="prod_info2_9" name="prod_info2_9" class="admin_input w100" placeholder="해당없음" value="<c:out value="${prodInfo.prod_info_9 }"/>" /></td>
							</tr>
							<tr>
								<th>소비자상담 관련 전화번호 &nbsp;&nbsp; <button type="button" onclick="base_prod_info_value('2_10','2');" class="btns lightgraybtn h24px"> 상점 기본값 입력</button></th>
								<td><input type="text" id="prod_info2_10" name="prod_info2_10" class="admin_input w100" placeholder="상품상세설명 참조" value="<c:out value="${prodInfo.prod_info_10 }"/>" /></td>
							</tr>
							<!-- } 주류/가공품/신선식품 -->
						</tbody>
					</table>
					<table class="admin_tbl admin_write_tbl prodcategoryset" id="prod_category_3" style="display: none;" >
						<colgroup>
							<col width="*" />
							<col width="70%" />
						</colgroup>
						<tbody>
							<!-- 건강기능식품 { -->
							<tr>
								<th>식품의 유형 &nbsp;&nbsp; <button type="button" onclick="base_prod_info_value_set('3_1');" class="btns lightgraybtn h24px"> 상점 기본값 입력</button></th>
								<td><input type="text" id="prod_info3_1" name="prod_info3_1" class="admin_input w100" placeholder="건강기능식품" value="<c:out value="${prodInfo.prod_info_1 }"/>" /></td>
							</tr>
							<tr>
								<th>제조업소의 명칭과 소재지(수입품의 경우 수입업소명, 제조업소명 및 수출국명) &nbsp;&nbsp; <button type="button" onclick="base_prod_info_value_set('3_2');" class="btns lightgraybtn h24px"> 상점 기본값 입력</button></th>
								<td><input type="text" id="prod_info3_2" name="prod_info3_2" class="admin_input w100" placeholder="상품상세설명 참조" value="<c:out value="${prodInfo.prod_info_2 }"/>" /></td>
							</tr>
							<tr>
								<th>제조연월일, 유통기한 또는 품질유지기한 &nbsp;&nbsp; <button type="button" onclick="base_prod_info_value_set('3_3');" class="btns lightgraybtn h24px"> 상점 기본값 입력</button></th>
								<td><input type="text" id="prod_info3_3" name="prod_info3_3" class="admin_input w100" placeholder="제품에 별도 표기" value="<c:out value="${prodInfo.prod_info_3 }"/>" /></td>
							</tr>
							<tr>
								<th>포장단위별 용량(중량), 수량 &nbsp;&nbsp; <button type="button" onclick="base_prod_info_value_set('3_4');" class="btns lightgraybtn h24px"> 상점 기본값 입력</button></th>
								<td><input type="text" id="prod_info3_4" name="prod_info3_4" class="admin_input w100" placeholder="상품상세설명 참조" value="<c:out value="${prodInfo.prod_info_4 }"/>" /></td>
							</tr>
							<tr>
								<th>원재료명 및 함량(농수산물의 원산지 표시에 관한 법률에 따른 원산지 표시 포함) &nbsp;&nbsp; <button type="button" onclick="base_prod_info_value_set('3_5');" class="btns lightgraybtn h24px"> 상점 기본값 입력</button></th>
								<td><input type="text" id="prod_info3_5" name="prod_info3_5" class="admin_input w100" placeholder="상품상세설명 참조" value="<c:out value="${prodInfo.prod_info_5 }"/>" /></td>
							</tr>
							<tr>
								<th>영양정보 &nbsp;&nbsp; <button type="button" onclick="base_prod_info_value_set('3_6');" class="btns lightgraybtn h24px"> 상점 기본값 입력</button></th>
								<td><input type="text" id="prod_info3_6" name="prod_info3_6" class="admin_input w100" placeholder="상품상세설명 참조" value="<c:out value="${prodInfo.prod_info_6 }"/>" /></td>
							</tr>
							<tr>
								<th>기능정보 &nbsp;&nbsp; <button type="button" onclick="base_prod_info_value_set('3_7');" class="btns lightgraybtn h24px"> 상점 기본값 입력</button></th>
								<td><input type="text" id="prod_info3_7" name="prod_info3_7" class="admin_input w100" placeholder="상품상세설명 참조" value="<c:out value="${prodInfo.prod_info_7 }"/>" /></td>
							</tr>
							<tr>
								<th>섭취량, 섭취방법 및 섭취 시 주의사항 및 부작용 가능성 &nbsp;&nbsp; <button type="button" onclick="base_prod_info_value_set('3_8');" class="btns lightgraybtn h24px"> 상점 기본값 입력</button></th>
								<td><input type="text" id="prod_info3_8" name="prod_info3_8" class="admin_input w100" placeholder="상품상세설명 참조" value="<c:out value="${prodInfo.prod_info_8 }"/>" /></td>
							</tr>
							<tr>
								<th>질병의 예방 및 치료를 위한 의약품이 아니라는 내용의 표현 &nbsp;&nbsp; <button type="button" onclick="base_prod_info_value_set('3_9');" class="btns lightgraybtn h24px"> 상점 기본값 입력</button></th>
								<td><input type="text" id="prod_info3_9" name="prod_info3_9" class="admin_input w100" placeholder="본 제품은 건강기능식품으로 질병의 예방 및 치료를 위한 의약품이 아닙니다." value="<c:out value="${prodInfo.prod_info_9 }"/>" /></td>
							</tr>
							<tr>
								<th>유전자재조합식품에 해당하는 경우의 표시 &nbsp;&nbsp; <button type="button" onclick="base_prod_info_value_set('3_10');" class="btns lightgraybtn h24px"> 상점 기본값 입력</button></th>
								<td><input type="text" id="prod_info3_10" name="prod_info3_10" class="admin_input w100" placeholder="해당없음" value="<c:out value="${prodInfo.prod_info_10 }"/>" /></td>
							</tr>
							<tr>
								<th>표시광고 사전심의필 &nbsp;&nbsp; <button type="button" onclick="base_prod_info_value_set('3_11');" class="btns lightgraybtn h24px"> 상점 기본값 입력</button></th>
								<td><input type="text" id="prod_info3_11" name="prod_info3_11" class="admin_input w100" placeholder="본 제품은 건강기능식품 표시광고 사전심의필을 받았습니다." value="<c:out value="${prodInfo.prod_info_11 }"/>" /></td>
							</tr>
							<tr>
								<th>수입식품에 해당하는 경우 “건강기능식품에 관한 법률에 따른 수입신고를 필함”의 문구 &nbsp;&nbsp; <button type="button" onclick="base_prod_info_value_set('3_12');" class="btns lightgraybtn h24px"> 상점 기본값 입력</button></th>
								<td><input type="text" id="prod_info3_12" name="prod_info3_12" class="admin_input w100" placeholder="해당없음" value="<c:out value="${prodInfo.prod_info_12 }"/>" /></td>
							</tr>
							<tr>
								<th>소비자상담 관련 전화번호 &nbsp;&nbsp; <button type="button" onclick="base_prod_info_value('3_13','2');" class="btns lightgraybtn h24px"> 상점 기본값 입력</button></th>
								<td><input type="text" id="prod_info3_13" name="prod_info3_13" class="admin_input w100" placeholder="상품상세설명 참조" value="<c:out value="${prodInfo.prod_info_13 }"/>" /></td>
							</tr>
							<!-- } 건강기능식품 -->
						</tbody>
					</table>
					<table class="admin_tbl admin_write_tbl prodcategoryset" id="prod_category_4" style="display: none;" >
						<colgroup>
							<col width="*" />
							<col width="70%" />
						</colgroup>
						<tbody>
							<!-- 화장품 { -->
							<tr>
								<th>용량 또는 중량 &nbsp;&nbsp; <button type="button" onclick="base_prod_info_value_set('4_1');" class="btns lightgraybtn h24px"> 상점 기본값 입력</button></th>
								<td><input type="text" id="prod_info4_1" name="prod_info4_1" class="admin_input w100" placeholder="상품상세설명 참조" value="<c:out value="${prodInfo.prod_info_1 }"/>" /></td>
							</tr>
							<tr>
								<th>제품 주요 사양 &nbsp;&nbsp; <button type="button" onclick="base_prod_info_value_set('4_2');" class="btns lightgraybtn h24px"> 상점 기본값 입력</button></th>
								<td><input type="text" id="prod_info4_2" name="prod_info4_2" class="admin_input w100" placeholder="상품상세설명 참조" value="<c:out value="${prodInfo.prod_info_2 }"/>" /></td>
							</tr>
							<tr>
								<th>사용기한 또는 개봉 후 사용기간 &nbsp;&nbsp; <button type="button" onclick="base_prod_info_value_set('4_3');" class="btns lightgraybtn h24px"> 상점 기본값 입력</button></th>
								<td><input type="text" id="prod_info4_3" name="prod_info4_3" class="admin_input w100" placeholder="제품에 별도 표기" value="<c:out value="${prodInfo.prod_info_3 }"/>" /></td>
							</tr>
							<tr>
								<th>사용방법 &nbsp;&nbsp; <button type="button" onclick="base_prod_info_value_set('4_4');" class="btns lightgraybtn h24px"> 상점 기본값 입력</button></th>
								<td><input type="text" id="prod_info4_4" name="prod_info4_4" class="admin_input w100" placeholder="제품에 별도 표기" value="<c:out value="${prodInfo.prod_info_4 }"/>" /></td>
							</tr>
							<tr>
								<th>제조업자 및 제조판매업자 &nbsp;&nbsp; <button type="button" onclick="base_prod_info_value_set('4_5');" class="btns lightgraybtn h24px"> 상점 기본값 입력</button></th>
								<td><input type="text" id="prod_info4_5" name="prod_info4_5" class="admin_input w100" placeholder="상품상세설명 참조" value="<c:out value="${prodInfo.prod_info_5 }"/>" /></td>
							</tr>
							<tr>
								<th>제조국 &nbsp;&nbsp; <button type="button" onclick="base_prod_info_value_set('4_6');" class="btns lightgraybtn h24px"> 상점 기본값 입력</button></th>
								<td><input type="text" id="prod_info4_6" name="prod_info4_6" class="admin_input w100" placeholder="대한민국" value="<c:out value="${prodInfo.prod_info_6 }"/>" /></td>
							</tr>
							<tr>
								<th>화장품법에 따라 기재/표시하여야 하는 모든 성분 &nbsp;&nbsp; <button type="button" onclick="base_prod_info_value_set('4_7');" class="btns lightgraybtn h24px"> 상점 기본값 입력</button></th>
								<td><input type="text" id="prod_info4_7" name="prod_info4_7" class="admin_input w100" placeholder="제품에 별도 표기" value="<c:out value="${prodInfo.prod_info_7 }"/>" /></td>
							</tr>
							<tr>
								<th>기능성 화장품 심사 필 유무 &nbsp;&nbsp; <button type="button" onclick="base_prod_info_value_set('4_8');" class="btns lightgraybtn h24px"> 상점 기본값 입력</button></th>
								<td><input type="text" id="prod_info4_8" name="prod_info4_8" class="admin_input w100" placeholder="해당없음" value="<c:out value="${prodInfo.prod_info_8 }"/>" /></td>
							</tr>
							<tr>
								<th>사용할 때 주의사항 &nbsp;&nbsp; <button type="button" onclick="base_prod_info_value_set('4_9');" class="btns lightgraybtn h24px"> 상점 기본값 입력</button></th>
								<td><input type="text" id="prod_info4_9" name="prod_info4_9" class="admin_input w100" placeholder="제품에 별도 표기" value="<c:out value="${prodInfo.prod_info_9 }"/>" /></td>
							</tr>
							<tr>
								<th>품질보증기준 &nbsp;&nbsp; <button type="button" onclick="base_prod_info_value_set('4_10');" class="btns lightgraybtn h24px"> 상점 기본값 입력</button></th>
								<td><input type="text" id="prod_info4_10" name="prod_info4_10" class="admin_input w100" placeholder="본 상품은 공정거래위원회 고시 소비자 분쟁해결기준에 의거 보상해 드립니다." value="<c:out value="${prodInfo.prod_info_10 }"/>" /></td>
							</tr>
							<tr>
								<th>소비자상담 관련 전화번호 &nbsp;&nbsp; <button type="button" onclick="base_prod_info_value('4_11','2');" class="btns lightgraybtn h24px"> 상점 기본값 입력</button></th>
								<td><input type="text" id="prod_info4_11" name="prod_info4_11" class="admin_input w100" placeholder="상품상세설명 참조" value="<c:out value="${prodInfo.prod_info_11 }"/>" /></td>
							</tr>
							<!-- } 화장품 -->
						</tbody>
					</table>
					<table class="admin_tbl admin_write_tbl prodcategoryset" id="prod_category_5" style="display: none;" >
						<colgroup>
							<col width="*" />
							<col width="70%" />
						</colgroup>
						<tbody>
							<!-- 기타 { -->
							<tr>
								<th>품명 및 모델명 &nbsp;&nbsp; <button type="button" onclick="base_prod_info_value_set('5_1');" class="btns lightgraybtn h24px"> 상점 기본값 입력</button></th>
								<td><input type="text" id="prod_info5_1" name="prod_info5_1" class="admin_input w100" placeholder="상품상세설명 참조" value="<c:out value="${prodInfo.prod_info_1 }"/>" /></td>
							</tr>
							<tr>
								<th>제조자 또는 수입자(수입품의 경우 수입자를 함께 표기) &nbsp;&nbsp; <button type="button" onclick="base_prod_info_value_set('5_2');" class="btns lightgraybtn h24px"> 상점 기본값 입력</button></th>
								<td><input type="text" id="prod_info5_2" name="prod_info5_2" class="admin_input w100" placeholder="상품상세설명 참조" value="<c:out value="${prodInfo.prod_info_2 }"/>" /></td>
							</tr>
							<tr>
								<th>제조국 또는 원산지 &nbsp;&nbsp; <button type="button" onclick="base_prod_info_value_set('5_3');" class="btns lightgraybtn h24px"> 상점 기본값 입력</button></th>
								<td><input type="text" id="prod_info5_3" name="prod_info5_3" class="admin_input w100" placeholder="대한민국 / 충남 서천" value="<c:out value="${prodInfo.prod_info_3 }"/>" /></td>
							</tr>
							<tr>
								<th>법에 의한 인증ㆍ허가 등을 받았음을 확인할 수 있는 경우 그에 대한 사항 &nbsp;&nbsp; <button type="button" onclick="base_prod_info_value_set('5_4');" class="btns lightgraybtn h24px"> 상점 기본값 입력</button></th>
								<td><input type="text" id="prod_info5_4" name="prod_info5_4" class="admin_input w100" placeholder="해당없음" value="<c:out value="${prodInfo.prod_info_4 }"/>" /></td>
							</tr>
							<tr>
								<th>A/S 책임자와 전화번호 또는 소비자상담 관련 전화번호 &nbsp;&nbsp; <button type="button" onclick="base_prod_info_value('5_5','2');" class="btns lightgraybtn h24px"> 상점 기본값 입력</button></th>
								<td><input type="text" id="prod_info5_5" name="prod_info5_5" class="admin_input w100" placeholder="상품상세설명 참조" value="<c:out value="${prodInfo.prod_info_5 }"/>" /></td>
							</tr>
							<!-- } 기타 -->
						</tbody>
					</table>
				</article>

</c:if>

				<div class="btnarea alignRight mgt30px">
					<ul class="nopm floats">
						<li><a href="/admgr/admgrProduct/productList.do?pageIndex=<c:out value="${pageIndex }"/>&store_category=<c:out value="${store_category }"/>&searchKey=<c:out value="${searchKey }"/>&searchKeyword=<c:out value="${searchKey }"/>" class="btns "><i class="fal fa-list"></i> 목록으로</a></li>
						<li class="fr"><button type="submit" class="btns redbtn"><i class="far fa-save"></i> 저장</button></li>

					</ul>
				</div>
				
				
				<!-- 거래조건에 대한 정보 { -->
				<article class="page_sortation">
					<h2 class="h2Tit"><i class="fal fa-window-minimize"></i> 거래조건에 대한 정보</h2>
					<table class="admin_tbl admin_write_tbl">
						<caption>거래조건에 대한 정보</caption>
						<colgroup>
							<col width="*" />
							<col width="70%" />
						</colgroup>
						<tbody>
							<tr>
								<th>재화 등의 공급방법 및 공급시기  &nbsp;&nbsp; <button type="button" onclick="base_prod_trade_info_value('1');" class="btns lightgraybtn h24px"> 상점 기본값 입력</button></th>
								<td>
									<textarea id="prod_trade_info_1" name="prod_trade_info_1" class="admin_textarea w100" rows="5"><c:out value="${prodInfo.prod_trade_info_1 }"/></textarea>
								</td>
							</tr>
							<tr>
								<th>청약철회 등에 관한 사항  &nbsp;&nbsp; <button type="button" onclick="base_prod_trade_info_value('2');" class="btns lightgraybtn h24px"> 상점 기본값 입력</button></th>
								<td>
									<textarea id="prod_trade_info_2" name="prod_trade_info_2" class="admin_textarea w100" rows="5"><c:out value="${prodInfo.prod_trade_info_2 }"/></textarea>
								</td>
							</tr>
							<tr>
								<th>재화 등의 교환∙반품∙보증과 그 대금 환불 및 환불의 지연에 따른 배상금 지급의 조건∙절차  &nbsp;&nbsp; <button type="button" onclick="base_prod_trade_info_value('3');" class="btns lightgraybtn h24px"> 상점 기본값 입력</button></th>
								<td>
									<textarea id="prod_trade_info_3" name="prod_trade_info_3" class="admin_textarea w100" rows="5"><c:out value="${prodInfo.prod_trade_info_3 }"/></textarea>
								</td>
							</tr>
							<tr>
								<th>소비자피해보상의 처리, 재화 등에 대한 불만 처리 및 소비자와 사업자 사이의 분쟁처리에 관한 사항  &nbsp;&nbsp; <button type="button" onclick="base_prod_trade_info_value('4');" class="btns lightgraybtn h24px"> 상점 기본값 입력</button></th>
								<td>
									<textarea id="prod_trade_info_4" name="prod_trade_info_4" class="admin_textarea w100" rows="5"><c:out value="${prodInfo.prod_trade_info_4 }"/></textarea>
								</td>
							</tr>
							<tr>
								<th>거래에 관한 약관의 내용 또는 확인할 수 있는 방법  &nbsp;&nbsp; <button type="button" onclick="base_prod_trade_info_value('5');" class="btns lightgraybtn h24px"> 상점 기본값 입력</button></th>
								<td>
									<textarea id="prod_trade_info_5" name="prod_trade_info_5" class="admin_textarea w100" rows="5"><c:out value="${prodInfo.prod_trade_info_5 }"/></textarea>
								</td>
							</tr>
						</tbody>
					</table>
				</article>
				<!-- } 거래조건에 대한 정보 -->

				<c:if test="${not empty prod_seq && store_category eq 'CD002004' }">
				<c:choose>
					<c:when test="${prodInfo.prod_category_cd eq '1' }">
						<c:set var="sel_prod_category" value="1"/>
					</c:when>
					<c:when test="${prodInfo.prod_category_cd eq '2' }">
						<c:set var="sel_prod_category" value="2"/>
					</c:when>
					<c:when test="${prodInfo.prod_category_cd eq '3' }">
						<c:set var="sel_prod_category" value="3"/>
					</c:when>
					<c:when test="${prodInfo.prod_category_cd eq '4' }">
						<c:set var="sel_prod_category" value="4"/>
					</c:when>
					<c:when test="${prodInfo.prod_category_cd eq '5' }">
						<c:set var="sel_prod_category" value="5"/>
					</c:when>
				</c:choose>
				</c:if>
				<c:if test="${empty prod_seq && store_category eq 'CD002004' }">
					<c:set var="sel_prod_category" value="1"/>
				</c:if>
				
				<script>
					setProdInformation("<c:out value="${sel_prod_category}"/>");
				</script>
				
				
				
				