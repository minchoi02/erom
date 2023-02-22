<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:choose>
	<c:when test="${empty prod_seq}">
		<c:set var="prod_id" value="${ProdId }"/>
		<c:set var="prod_st_dt_ymd" value="${today}"/>
		<c:set var="prod_ed_dt_ymd" value="2030-12-31"/>
		<c:set var="prod_orderby" value="1"/>
		<c:set var="actionUri" value="productInsert"/>
	</c:when>
	<c:otherwise>
		<c:set var="prod_id" value="${prodInfo.prod_id }"/>
		<c:set var="prod_st_dt_ymd" value="${prodInfo.prod_st_dt_ymd }"/>
		<c:set var="prod_ed_dt_ymd" value="${prodInfo.prod_ed_dt_ymd }"/>
		<c:set var="prod_orderby" value="${prodInfo.prod_orderby}"/>
		<c:set var="actionUri" value="productUpdate"/>
	</c:otherwise>
</c:choose>

<c:set var="owner_info" value="none"/> 
<c:if test="${not empty prod_seq}">
	<c:set var="owner_info" value="block"/>
</c:if>

				<!-- 기본정보 { -->
				<form method="post" action="/admgr/admgrProduct/<c:out value="${actionUri }"/>.do" onsubmit="return productSaveCheck();" >
				<input type="hidden" id="prod_seq" name="prod_seq" value="<c:out value="${prod_seq }"/>" />
				<input type="hidden" id="pageIndex" name="pageIndex" value="<c:out value="${pageIndex }"/>" />
				<input type="hidden" id="store_category" name="store_category" class="" value="<c:out value="${store_category }"/>" /> 
				<input type="hidden" id="prod_orderby" name="prod_orderby" value="<c:out value="${prod_orderby }"/>" />
				<input type="hidden" id="return_url" name="return_url" value="" />
				<article class="page_sortation">
					<h2 class="h2Tit"><i class="fal fa-window-minimize"></i> 기본정보</h2>
					<table class="admin_tbl admin_write_tbl">
						<caption>기본정보</caption>
						<colgroup>
							<col width="200" />
							<col />
							<col width="200" />
							<col />
						</colgroup>
						<tbody>
							<tr>
								<th>판매여부</th>
								<td colspan="3">
									<p class="comment">* 판매중지 : 제품이 진열되지 않습니다.</p>
									<%--
									<p class="comment">* Sold Out : 제품은 진열되지만, 구매는 가능하지 않습니다.</p>
									 --%>
									<select id="prod_use_st" name="prod_use_st"  class="basic_select w150px">
										<option value="Y" <c:if test="${prodInfo.prod_use_st eq 'Y' }">selected</c:if> >판매중									
										<option value="N" <c:if test="${prodInfo.prod_use_st eq 'N' }">selected</c:if> >판매중지									
										<%--<option value="S" <c:if test="${prodInfo.prod_use_st eq 'S' }">selected</c:if> >Sold Out --%>							
									</select>
								</td>
							</tr>
							<tr>
								<th>판매 시작일시  <span class="colorRed">*</span></th>
								<td>
									<input type="text" id="prod_st_dt_ymd" name="prod_st_dt_ymd" class="admin_input datepicker readonly" size="15" placeholder="날짜" value="<c:out value="${prod_st_dt_ymd }"/>"  readonly />
									<select id="prod_st_dt_hour" name="prod_st_dt_hour" class="basic_select w100px"></select>
									<select id="prod_st_dt_minute" name="prod_st_dt_minute" class="basic_select w100px"></select>
									<script>getHourSelect("prod_st_dt_hour", "S", "<c:out value="${prodInfo.prod_st_dt_hour }"/>");</script>
									<script>getMinuteSelect("prod_st_dt_minute", "S", "<c:out value="${prodInfo.prod_st_dt_minute }"/>");</script>									
								</td>
								<th>판매 종료일시  <span class="colorRed">*</span></th>
								<td>
									<input type="text" id="prod_ed_dt_ymd" name="prod_ed_dt_ymd" class="admin_input datepicker readonly" size="15" placeholder="날짜" value="<c:out value="${prod_ed_dt_ymd }"/>" readonly />
									<select id="prod_ed_dt_hour" name="prod_ed_dt_hour" class="basic_select w100px"></select>
									<select id="prod_ed_dt_minute" name="prod_ed_dt_minute" class="basic_select w100px"></select>
									<script>getHourSelect("prod_ed_dt_hour", "E", "<c:out value="${prodInfo.prod_ed_dt_hour }"/>");</script>
									<script>getMinuteSelect("prod_ed_dt_minute", "E", "<c:out value="${prodInfo.prod_ed_dt_minute }"/>");</script>									
								</td>
							</tr>							
							<tr>
								<th>상품코드 <span class="colorRed">*</span></th>
								<td colspan="3">
									<input type="text" id="prod_id" name="prod_id" value="<c:out value="${prod_id }"/>" class="admin_input readonly" readonly size="30" />
								</td>
							</tr>
							<c:if test="${adminLevel > 5 }">
							<tr>
								<th>운영업체 <span class="colorRed">*</span></th>
								<td colspan="3">
									<input type="hidden" id="set_store_id" name="store_id" value="<c:out value="${prodInfo.store_id}"/>"  />
									<input type="hidden" id="set_store_tel" name="store_tel" value="<c:out value="${storeInfo.store_tel}"/>" />
									<input type="hidden" id="set_store_addr_1" name="store_addr_1" value="<c:out value="${storeInfo.store_addr_1}"/>" />
									<input type="hidden" id="set_store_addr_2" name="store_addr_2" value="<c:out value="${storeInfo.store_addr_2 }"/>" />
									<input type="text" id="set_store_nm" name="store_nm" class="admin_input readonly" size="30" readonly value="<c:out value="${prodInfo.store_nm }"/>" />
									<button type="button" class="btns graybtn" onclick="getStoreSsarchModalOpen();">검색</button>
									<div id="store_owner_info" style="display: <c:out value="${owner_info}"/>;">
									대표자(상점아이디) : <span class="colorBlue"><b><c:out value="${storeInfo.store_ceo_nm}"/>(<c:out value="${storeInfo.store_id}"/>)</b></span><br />
									연락처 : <c:out value="${storeInfo.store_tel}"/><br />
									핸드폰 : <c:out value="${storeInfo.store_hp_1}"/><br />
									이메일 : <c:out value="${storeInfo.store_email}"/><br />
									상태 : 
									<c:choose>
										<c:when test="${storeInfo.store_use_st eq 'Y' }"><span class="btns greenbtn h24px">운영중</span></c:when>
										<c:otherwise><span class="btns graybtn h24px">운영중지</span></c:otherwise>
									</c:choose>
									</div>
								</td>
							</tr>
							</c:if>
							<c:if test="${adminLevel == 5 }">
							<tr>
								<th>운영업체 <span class="colorRed">*</span></th>
								<td colspan="3">
									<input type="hidden" id="set_store_id" name="store_id" value="<c:out value="${prodInfo.store_id}"/>"  />
									<input type="hidden" id="set_store_nm" name="store_nm" value="<c:out value="${storeInfo.store_nm}"/>" />
									<select class="basic_select w150" id="set_store_id" name="store_id_set" onchange="store_info_set(this.value)">
										<option value="">상점 선택</option>
										<c:forEach var="get_id_store_list" items="${get_id_store_list}" varStatus="status">
										<option value="<c:out value="${get_id_store_list.store_id }|||${get_id_store_list.store_nm }"/>" <c:if test="${prodInfo.store_id eq get_id_store_list.store_id }">selected</c:if> ><c:out value="${get_id_store_list.store_nm }"/></option>
										</c:forEach>
									</select>
								</td>
							</tr>
							</c:if>
							<tr>
								<th>상품명(상점명) <span class="colorRed">*</span></th>
								<td colspan="3">
									<c:if test="${store_category ne 'CD002004'}">
									<p class="comment">* 주문시 하단에 설정하는 옵션에 메뉴가 되므로, 상점명을 설정하는 것이 유리합니다. &nbsp; <button type="button" class="btns lightgraybtn h24px" onclick="setProdNm(); return false;">상점명 입력</button></p>
									</c:if>
									<c:if test="${store_category eq 'CD002004'}">
									<p class="comment">* 상품명을 입력하세요. 옵션으로 통제가능한 경우, 상품명은 간결할수록 좋습니다.</p>
									</c:if>
									<input type="text" id="prod_nm" name="prod_nm" value="<c:out value="${prodInfo.prod_nm }"/><c:if test="${empty prodInfo.prod_nm }"><c:out value="${prodInfo.store_nm }"/></c:if>" class="admin_input w100" />
								</td>
							</tr>
							<tr>
								<th>기본설명</th>
								<td colspan="3">
									<p class="comment">* 상품명 하단에 상품에 대한 추가적인 설명이 필요한 경우에 입력합니다. HTML입력 불가합니다.</p>
									<textarea id="prod_comment" name="prod_comment" class="admin_textarea w100" rows="3"><c:out value="${prodInfo.prod_comment }"/></textarea>
								</td>
							</tr>
							<c:if test="${store_category eq 'CD002001' || store_category eq 'CD002003' }">
							<tr>
								<th>운영시간 설명</th>
								<td colspan="3">
									<textarea id="prod_content_time" name="prod_content_time" class="admin_textarea w100" rows="5"><c:out value="${prodInfo.prod_content_time }"/></textarea>
								</td>
							</tr>
							<tr>
								<th>이용요금 설명</th>
								<td colspan="3">
									<textarea id="prod_content_pay" name="prod_content_pay" class="admin_textarea w100" rows="5"><c:out value="${prodInfo.prod_content_pay }"/></textarea>
								</td>
							</tr>
							</c:if>
							<tr>
								<th>관련태그</th>							
								<td colspan="3">
								<p class="comment">* 입력한 태그로 검색에 사용됩니다. ',' 쉼표로 단어를 5개까지 구분 합니다.</p>
									<textarea id="prod_content_precautions" name="prod_content_precautions" class="admin_textarea w100" rows="5"><c:out value="${prodInfo.prod_content_precautions }"/></textarea>
								</td>
							</tr>
							<%--
							<tr>
								<th>관련태그</th>
								<td colspan="3">
									<p class="comment">* 입력한 태그로 검색에 사용됩니다. ',' 쉼표로 단어를 구분 합니다.</p>
									<input type="text" id="" name="" class="admin_input w100" />
								</td>
							</tr>
							--%>
							<c:if test="${not empty prod_seq }">
							<tr>
								<th>등록일</th>
								<td><c:out value="${prodInfo.reg_dt }"/></td>
								<th>최근수정일</th>
								<td><c:out value="${prodInfo.mod_dt }"/></td>
							</tr>
							<tr>
								<th>조회수</th>
								<td><fmt:formatNumber value="${prodInfo.prod_hit_cnt }" type="number"/></td>
								<th>찜한횟수</th>
								<td><fmt:formatNumber value="${prodInfo.prod_pick_cnt }" type="number"/></td>
							</tr>
							</c:if>
						</tbody>
					</table>
				</article>
				<!-- } 기본정보 -->

				<div class="btnarea alignRight mgt30px">
					<ul class="nopm floats">
						<li><a href="/admgr/admgrProduct/productList.do?pageIndex=<c:out value="${pageIndex }"/>&store_category=<c:out value="${store_category }"/>&searchKey=<c:out value="${searchKey }"/>&searchKeyword=<c:out value="${searchKey }"/>" class="btns "><i class="fal fa-list"></i> 목록으로</a></li>
						<li class="fr"><button type="submit" class="btns redbtn"><i class="far fa-save"></i> 저장</button></li>
					</ul>
				</div>
				
				<!-- 상품설명 { -->
				<article class="page_sortation">
					<h2 class="h2Tit"><i class="fal fa-window-minimize"></i> 상품설명 <small>(이미지 사이즈 : <span class="colorRed">1,000px * 650px</span>)</small></h2>
					<table class="admin_tbl admin_write_tbl">
						<caption>상품설명</caption>
						<colgroup>
							<col width="200" />
							<col />
							<col width="200" />
							<col />
						</colgroup>
						<tbody>
							<tr>
								<th>이미지 1</th>
								<td>
									<p class="comment">* 메인 및 리스트에 보여질 이미지입니다.</p>
									<input type="file" id="prod_img_1" name="prod_img_1" onchange="file_upload('item','prod_img_1');" />
									<input type="hidden" id="prod_old_img_1_id" name="prod_old_img_1_id" value="<c:out value="${prodInfo.prod_img_1 }"/>" />
									<input type="hidden" id="prod_img_1_id" name="prod_img_1_id"  />
									<c:if test="${not empty prodInfo.prod_img_1 }">
									<c:choose>
										<c:when test="${prod_img_1_info.file_size/1024/102 > 1 }"><c:set var="file_1_size" value="${prod_img_1_info.file_size/1024/1024}"/><c:set var="file_1_str" value="MB"/></c:when>
										<c:when test="${prod_img_1_info.file_size/1024 > 1 }"><c:set var="file_1_size" value="${prod_img_1_info.file_size/1024}"/><c:set var="file_1_str" value="KB"/></c:when>
										<c:otherwise><c:set var="file_1_size" value="${prod_img_1_info.file_size}"/><c:set var="file_1_str" value="B"/></c:otherwise>
									</c:choose>
									</c:if>
								</td>
								<td colspan="2">
									<c:if test="${not empty prodInfo.prod_img_1 }">
									<img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${prodInfo.prod_img_1 }"/>&fileSn=0" width="100" />
									<br><input type="checkbox" id="prod_img_1_del" name="prod_img_1_del" class="admin_check" value="Y" /> <label for="prod_img_1_del">삭제</label>
									</c:if>
								</td>
							</tr>
							<tr>
								<th>이미지 2</th>
								<td>
									<input type="file" id="prod_img_2" name="prod_img_2" onchange="file_upload('item','prod_img_2');" />
									<input type="hidden" id="prod_old_img_2_id" name="prod_old_img_2_id" value="<c:out value="${prodInfo.prod_img_2 }"/>" />
									<input type="hidden" id="prod_img_2_id" name="prod_img_2_id"  />
									<c:if test="${not empty prodInfo.prod_img_2 }">
									<c:choose>
										<c:when test="${prod_img_2_info.file_size/1024/102 > 1 }"><c:set var="file_2_size" value="${prod_img_2_info.file_size/1024/1024}"/><c:set var="file_2_str" value="MB"/></c:when>
										<c:when test="${prod_img_2_info.file_size/1024 > 1 }"><c:set var="file_2_size" value="${prod_img_2_info.file_size/1024}"/><c:set var="file_2_str" value="KB"/></c:when>
										<c:otherwise><c:set var="file_2_size" value="${prod_img_2_info.file_size}"/><c:set var="file_2_str" value="B"/></c:otherwise>
									</c:choose>
									</c:if>
								</td>
								<td colspan="2">
									<c:if test="${not empty prodInfo.prod_img_2 }">
									<img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${prodInfo.prod_img_2 }"/>&fileSn=0" width="100" />
									<br><input type="checkbox" id="prod_img_2_del" name="prod_img_2_del" class="admin_check" value="Y" /> <label for="prod_img_2_del">삭제</label>
									</c:if>
								</td>
							</tr>
							<tr>
								<th>이미지 3</th>
								<td>
									<input type="file" id="prod_img_3" name="prod_img_3" onchange="file_upload('item','prod_img_3');" />
									<input type="hidden" id="prod_old_img_3_id" name="prod_old_img_3_id" value="<c:out value="${prodInfo.prod_img_3 }"/>" />
									<input type="hidden" id="prod_img_3_id" name="prod_img_3_id"  />
									<c:if test="${not empty prodInfo.prod_img_3 }">
									<c:choose>
										<c:when test="${prod_img_3_info.file_size/1024/102 > 1 }"><c:set var="file_3_size" value="${prod_img_3_info.file_size/1024/1024}"/><c:set var="file_3_str" value="MB"/></c:when>
										<c:when test="${prod_img_3_info.file_size/1024 > 1 }"><c:set var="file_3_size" value="${prod_img_3_info.file_size/1024}"/><c:set var="file_3_str" value="KB"/></c:when>
										<c:otherwise><c:set var="file_3_size" value="${prod_img_3_info.file_size}"/><c:set var="file_3_str" value="B"/></c:otherwise>
									</c:choose>
									</c:if>
								</td>
								<td colspan="2">
									<c:if test="${not empty prodInfo.prod_img_3 }">
									<img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${prodInfo.prod_img_3 }"/>&fileSn=0" width="100" />
									<br><input type="checkbox" id="prod_img_3_del" name="prod_img_3_del" class="admin_check" value="Y" /> <label for="prod_img_3_del">삭제</label>
									</c:if>
								</td>
							</tr>
							<tr>
								<th>이미지 4</th>
								<td>
									<input type="file" id="prod_img_4" name="prod_img_4" onchange="file_upload('item','prod_img_4');" />
									<input type="hidden" id="prod_old_img_4_id" name="prod_old_img_4_id" value="<c:out value="${prodInfo.prod_img_4 }"/>" />
									<input type="hidden" id="prod_img_4_id" name="prod_img_4_id"  />
									<c:if test="${not empty prodInfo.prod_img_4 }">
									<c:choose>
										<c:when test="${prod_img_4_info.file_size/1024/102 > 1 }"><c:set var="file_4_size" value="${prod_img_4_info.file_size/1024/1024}"/><c:set var="file_4_str" value="MB"/></c:when>
										<c:when test="${prod_img_4_info.file_size/1024 > 1 }"><c:set var="file_4_size" value="${prod_img_4_info.file_size/1024}"/><c:set var="file_4_str" value="KB"/></c:when>
										<c:otherwise><c:set var="file_4_size" value="${prod_img_4_info.file_size}"/><c:set var="file_4_str" value="B"/></c:otherwise>
									</c:choose>
									</c:if>
								</td>
								<td colspan="2">
									<c:if test="${not empty prodInfo.prod_img_4 }">
									<img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${prodInfo.prod_img_4 }"/>&fileSn=0" width="100" />
									<br><input type="checkbox" id="prod_img_4_del" name="prod_img_4_del" class="admin_check" value="Y" /> <label for="prod_img_4_del">삭제</label>
									</c:if>
								</td>
							</tr>
							<tr>
								<th>이미지 5</th>
								<td>
									<input type="file" id="prod_img_5" name="prod_img_5" onchange="file_upload('item','prod_img_5');" />
									<input type="hidden" id="prod_old_img_5_id" name="prod_old_img_5_id" value="<c:out value="${prodInfo.prod_img_5 }"/>" />
									<input type="hidden" id="prod_img_5_id" name="prod_img_5_id"  />
									<c:if test="${not empty prodInfo.prod_img_5 }">
									<c:choose>
										<c:when test="${prod_img_5_info.file_size/1024/102 > 1 }"><c:set var="file_5_size" value="${prod_img_5_info.file_size/1024/1024}"/><c:set var="file_5_str" value="MB"/></c:when>
										<c:when test="${prod_img_5_info.file_size/1024 > 1 }"><c:set var="file_5_size" value="${prod_img_5_info.file_size/1024}"/><c:set var="file_5_str" value="KB"/></c:when>
										<c:otherwise><c:set var="file_5_size" value="${prod_img_5_info.file_size}"/><c:set var="file_5_str" value="B"/></c:otherwise>
									</c:choose>
									</c:if>
								</td>
								<td colspan="2">
									<c:if test="${not empty prodInfo.prod_img_5 }">
									<img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${prodInfo.prod_img_5 }"/>&fileSn=0" width="100" />
									<br><input type="checkbox" id="prod_img_5_del" name="prod_img_5_del" class="admin_check" value="Y" /> <label for="prod_img_5_del">삭제</label>
									</c:if>
								</td>
							</tr>
							<tr>
								<th>이미지 6</th>
								<td>
									<input type="file" id="prod_img_6" name="prod_img_6" onchange="file_upload('item','prod_img_6');" />
									<input type="hidden" id="prod_old_img_6_id" name="prod_old_img_6_id" value="<c:out value="${prodInfo.prod_img_6 }"/>" />
									<input type="hidden" id="prod_img_6_id" name="prod_img_6_id"  />
									<c:if test="${not empty prodInfo.prod_img_6 }">
									<c:choose>
										<c:when test="${prod_img_6_info.file_size/1024/102 > 1 }"><c:set var="file_6_size" value="${prod_img_6_info.file_size/1024/1024}"/><c:set var="file_6_str" value="MB"/></c:when>
										<c:when test="${prod_img_6_info.file_size/1024 > 1 }"><c:set var="file_6_size" value="${prod_img_6_info.file_size/1024}"/><c:set var="file_6_str" value="KB"/></c:when>
										<c:otherwise><c:set var="file_6_size" value="${prod_img_6_info.file_size}"/><c:set var="file_6_str" value="B"/></c:otherwise>
									</c:choose>
									</c:if>
								</td>
								<td colspan="2">
									<c:if test="${not empty prodInfo.prod_img_7 }">
									<img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${prodInfo.prod_img_6 }"/>&fileSn=0" width="100" />
									<br><input type="checkbox" id="prod_img_6_del" name="prod_img_6_del" class="admin_check" value="Y" /> <label for="prod_img_6_del">삭제</label>
									</c:if>
								</td>
							</tr>
							<tr>
								<th>이미지 7</th>
								<td>
									<input type="file" id="prod_img_7" name="prod_img_7" onchange="file_upload('item','prod_img_7');" />
									<input type="hidden" id="prod_old_img_7_id" name="prod_old_img_7_id" value="<c:out value="${prodInfo.prod_img_7 }"/>" />
									<input type="hidden" id="prod_img_7_id" name="prod_img_7_id"  />
									<c:if test="${not empty prodInfo.prod_img_7 }">
									<c:choose>
										<c:when test="${prod_img_7_info.file_size/1024/102 > 1 }"><c:set var="file_7_size" value="${prod_img_7_info.file_size/1024/1024}"/><c:set var="file_7_str" value="MB"/></c:when>
										<c:when test="${prod_img_7_info.file_size/1024 > 1 }"><c:set var="file_7_size" value="${prod_img_7_info.file_size/1024}"/><c:set var="file_7_str" value="KB"/></c:when>
										<c:otherwise><c:set var="file_7_size" value="${prod_img_7_info.file_size}"/><c:set var="file_7_str" value="B"/></c:otherwise>
									</c:choose>
									</c:if>
								</td>
								<td colspan="2">
									<c:if test="${not empty prodInfo.prod_img_7 }">
									<img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${prodInfo.prod_img_7 }"/>&fileSn=0" width="100" />
									<br><input type="checkbox" id="prod_img_7_del" name="prod_img_7_del" class="admin_check" value="Y" /> <label for="prod_img_7_del">삭제</label>
									</c:if>
								</td>
							</tr>
							<tr>
								<th>이미지 8</th>
								<td>
									<input type="file" id="prod_img_8" name="prod_img_8" onchange="file_upload('item','prod_img_8');" />
									<input type="hidden" id="prod_old_img_8_id" name="prod_old_img_8_id" value="<c:out value="${prodInfo.prod_img_8 }"/>" />
									<input type="hidden" id="prod_img_8_id" name="prod_img_8_id"  />
									<c:if test="${not empty prodInfo.prod_img_8 }">
									<c:choose>
										<c:when test="${prod_img_8_info.file_size/1024/102 > 1 }"><c:set var="file_8_size" value="${prod_img_8_info.file_size/1024/1024}"/><c:set var="file_8_str" value="MB"/></c:when>
										<c:when test="${prod_img_8_info.file_size/1024 > 1 }"><c:set var="file_8_size" value="${prod_img_8_info.file_size/1024}"/><c:set var="file_8_str" value="KB"/></c:when>
										<c:otherwise><c:set var="file_8_size" value="${prod_img_8_info.file_size}"/><c:set var="file_8_str" value="B"/></c:otherwise>
									</c:choose>
									</c:if>
								</td>
								<td colspan="2">
									<c:if test="${not empty prodInfo.prod_img_8 }">
									<img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${prodInfo.prod_img_8 }"/>&fileSn=0" width="100" />
									<br><input type="checkbox" id="prod_img_8_del" name="prod_img_8_del" class="admin_check" value="Y" /> <label for="prod_img_8_del">삭제</label>
									</c:if>
								</td>
							</tr>
							<tr>
								<th>이미지 9</th>
								<td>
									<input type="file" id="prod_img_9" name="prod_img_9" onchange="file_upload('item','prod_img_9');" />
									<input type="hidden" id="prod_old_img_9_id" name="prod_old_img_9_id" value="<c:out value="${prodInfo.prod_img_9 }"/>" />
									<input type="hidden" id="prod_img_9_id" name="prod_img_9_id"  />
									<c:if test="${not empty prodInfo.prod_img_9 }">
									<c:choose>
										<c:when test="${prod_img_9_info.file_size/1024/102 > 1 }"><c:set var="file_9_size" value="${prod_img_9_info.file_size/1024/1024}"/><c:set var="file_9_str" value="MB"/></c:when>
										<c:when test="${prod_img_9_info.file_size/1024 > 1 }"><c:set var="file_9_size" value="${prod_img_9_info.file_size/1024}"/><c:set var="file_9_str" value="KB"/></c:when>
										<c:otherwise><c:set var="file_9_size" value="${prod_img_9_info.file_size}"/><c:set var="file_9_str" value="B"/></c:otherwise>
									</c:choose>
									</c:if>
								</td>
								<td colspan="2">
									<c:if test="${not empty prodInfo.prod_img_9 }">
									<img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${prodInfo.prod_img_9 }"/>&fileSn=0" width="100" />
									<br><input type="checkbox" id="prod_img_9_del" name="prod_img_9_del" class="admin_check" value="Y" /> <label for="prod_img_9_del">삭제</label>
									</c:if>
								</td>
							</tr>
							<tr>
								<th>이미지 10</th>
								<td>
									<input type="file" id="prod_img_10" name="prod_img_10" onchange="file_upload('item','prod_img_10');" />
									<input type="hidden" id="prod_old_img_10_id" name="prod_old_img_10_id" value="<c:out value="${prodInfo.prod_img_10 }"/>" />
									<input type="hidden" id="prod_img_10_id" name="prod_img_10_id"  />
									<c:if test="${not empty prodInfo.prod_img_10 }">
									<c:choose>
										<c:when test="${prod_img_10_info.file_size/1024/102 > 1 }"><c:set var="file_10_size" value="${prod_img_10_info.file_size/1024/1024}"/><c:set var="file_10_str" value="MB"/></c:when>
										<c:when test="${prod_img_10_info.file_size/1024 > 1 }"><c:set var="file_10_size" value="${prod_img_10_info.file_size/1024}"/><c:set var="file_10_str" value="KB"/></c:when>
										<c:otherwise><c:set var="file_10_size" value="${prod_img_10_info.file_size}"/><c:set var="file_10_str" value="B"/></c:otherwise>
									</c:choose>
									</c:if>
								</td>
								<td colspan="2">
									<c:if test="${not empty prodInfo.prod_img_10 }">
									<img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${prodInfo.prod_img_10 }"/>&fileSn=0" width="100" />
									<br><input type="checkbox" id="prod_img_10_del" name="prod_img_10_del" class="admin_check" value="Y" /> <label for="prod_img_10_del">삭제</label>
									</c:if>
								</td>
							</tr>
							<tr>
								<th>영상</th>
								<td>
									<p class="comment">* 영상파일은 mp4파일로 등록해야 하며 1개만 등록할 수 있습니다.<br>(파일 용량은 10 MByte 미만으로 제한)</p>
									<input type="file" id="prod_movie" name="prod_movie" onchange="file_upload('movie','prod_movie');" />
									<input type="hidden" id="prod_old_movie_id" name="prod_old_movie_id" value="<c:out value="${prodInfo.prod_movie }"/>" />
									<input type="hidden" id="prod_movie_id" name="prod_movie_id"  />
									<c:if test="${not empty prodInfo.prod_movie }">
									<c:choose>
										<c:when test="${prod_movie_info.file_size/1024/102 > 1 }"><c:set var="file_movie_size" value="${prod_movie_info.file_size/1024/1024}"/><c:set var="file_movie_str" value="MB"/></c:when>
										<c:when test="${prod_movie_info.file_size/1024 > 1 }"><c:set var="file_movie_size" value="${prod_movie_info.file_size/1024}"/><c:set var="file_movie_str" value="KB"/></c:when>
										<c:otherwise><c:set var="file_movie_size" value="${prod_movie_info.file_size}"/><c:set var="file_movie_str" value="B"/></c:otherwise>
									</c:choose>
									</c:if>
								</td>
								<td colspan="2">
									<c:if test="${not empty prodInfo.prod_movie }">
									<video src="/cmm/fms/getImage.do?atchFileId=<c:out value="${prodInfo.prod_movie }"/>&fileSn=0" width="300" controls ></video>
									<br><input type="checkbox" id="prod_movie_del" name="prod_movie_del" class="admin_check" value="Y" /> <label for="prod_movie_del">삭제</label>
									</c:if>
								</td>
							</tr>
							<c:if test="${store_category eq 'CD002004' }">
							<tr>
								<th>상품카테고리</th>
								<td colspan="3">
									<select id="prod_category" name="prod_category" class="basic_select w200px">
										<c:forEach var="categoryList" items="${categoryList}" varStatus="status">
										<option value="<c:out value="${categoryList.base_cd}"/>" <c:if test="${prodInfo.prod_category eq categoryList.base_cd }">selected</c:if> ><c:out value="${categoryList.base_cd_nm}"/></option>
										</c:forEach>
									</select>
								</td>
							</tr>
							</c:if>
							<tr>
								<th>상품설명</th>
								<td colspan="3">
									<textarea id="prod_content" name="prod_content" class="admin_textarea w100" rows="8" placeholder="※ 상품상세설명을 입력하세요."><c:out value="${prodInfo.prod_content }"/></textarea>
								</td>
							</tr>
						</tbody>
					</table>
				</article>
				<!-- } 상품설명 -->
				
				<div class="btnarea alignRight mgt30px">
					<ul class="nopm floats">
						<li><a href="/admgr/admgrProduct/productList.do?pageIndex=<c:out value="${pageIndex }"/>&store_category=<c:out value="${store_category }"/>&searchKey=<c:out value="${searchKey }"/>&searchKeyword=<c:out value="${searchKey }"/>" class="btns "><i class="fal fa-list"></i> 목록으로</a></li>
						<li class="fr"><button type="submit" class="btns redbtn"><i class="far fa-save"></i> 저장</button></li>
					</ul>
				</div>
				
