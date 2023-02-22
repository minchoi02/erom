<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:choose>
	<c:when test="${not empty roomInfo.prod_room_orderby}">
		<c:set var="room_orderby" value="${roomInfo.prod_room_orderby }"/>
	</c:when>
	<c:otherwise>
		<c:set var="room_orderby" value="1"/>
	</c:otherwise>
</c:choose>


<!-- 모달팝업 > 방정보 { -->
		<div id="room_setting" class="modal fade" tabindex="1" role="dialog">
			<div class="modal-dialog" role="document" style="width: 1000px; margin-top: 20px;">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="closebtn" data-dismiss="modal" aria-label="Close"><i class="fal fa-times"></i></button>
						<h4 class="modal-title">객실 <span id="title_subject"></span> <span id="title_stat">등록</span></h4>
					</div>
					<div class="modal-body">
	
						<!-- 쿠폰 리스트 { -->
						<table class="admin_tbl admin_list_tbl mgt10px">
							<caption>객실정보</caption>
							<colgroup>
								<col width="80" />
								<col />
								<col width="80" />
								<col />
							</colgroup>
							<tbody>
								<tr>
									<th style="background-color: #666; color:#fff; ">객실명 </th>
									<td colspan="3">
										<input class="modal_input admin_input w300px" type="text" id="room_nm" name="room_nm" value="<c:out value="${roomInfo.prod_room_nm}"/>" />
										<input class="modal_input admin_input w300px" type="hidden" id="room_seq" name="room_seq" value="<c:out value="${roomInfo.prod_room_seq}"/>" />
										&nbsp;&nbsp;&nbsp;
										<select id="room_use_st" name="room_use_st" class="moda_select basic_select w150px">
											<option value="Y"> 사용
											<option value="N"> 사용중지
										</select>
									</td>
								</tr>	
								<tr>
									<th style="background-color: #666; color:#fff; ">순서조정</th>
									<td colspan="3">
										<p class="comment">숫자가 젹을수록 상위랭크 됩니다.  기본값은 1이며, 같은 순서에서는 먼저 등록된 순서로 정렬 및 노출됩니다. </p>
										<input class="modal_input admin_input w50px" type="text" id="room_orderby" name="room_orderby" value="<c:out value="${room_orderby }"/>"  />
									</td>
								</tr>	
								<tr>
									<td class="alignCenter" style="background-color: #666; color:#fff; ">사진 1</td>
									<td>
										<input type="file" id="room_img_1"  name="room_img_1"  onchange="file_upload('item','room_img_1');" />
										<input class="modal_input admin_input" type="hidden" id="room_img_1_id" name="room_img_1_id"  />
										<input class="modal_input admin_input" type="hidden" id="room_old_img_1_id" name="room_old_img_1_id" value="<c:out value="${roomInfo.prod_room_img_1}"/>" />
										<c:if test="${not empty roomInfo.prod_room_img_1 }">
										<img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${roomInfo.prod_room_img_1 }"/>&fileSn=0" width="100" />
										<br><input type="checkbox" id="room_img_1_del" name="room_img_1_del" class="admin_check" value="Y" /> <label for="room_img_1_del">삭제</label>
										</c:if>
									</td>
									<td class="alignCenter" style="background-color: #666; color:#fff; ">사진 2</td>
									<td>
										<input type="file" id="room_img_2"  name="room_img_2"  onchange="file_upload('item','room_img_2');" />
										<input class="modal_input admin_input" type="hidden" id="room_img_2_id" name="room_img_2_id"  />
										<input class="modal_input admin_input" type="hidden" id="room_old_img_2_id" name="room_old_img_2_id" value="<c:out value="${roomInfo.prod_room_img_2}"/>" />
										<c:if test="${not empty roomInfo.prod_room_img_2 }">
										<img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${roomInfo.prod_room_img_2 }"/>&fileSn=0" width="100" />
										<br><input type="checkbox" id="room_img_2_del" name="room_img_2_del" class="admin_check" value="Y" /> <label for="room_img_2_del">삭제</label>
										</c:if>
									</td>
								</tr>
								<tr>
									<td class="alignCenter" style="background-color: #666; color:#fff; ">사진 3</td>
									<td>
										<input type="file" id="room_img_3"  name="room_img_3"  onchange="file_upload('item','room_img_3');" />
										<input class="modal_input admin_input" type="hidden" id="room_img_3_id" name="room_img_3_id"  />
										<input class="modal_input admin_input" type="hidden" id="room_old_img_3_id" name="room_old_img_3_id" value="<c:out value="${roomInfo.prod_room_img_3}"/>" />
										<c:if test="${not empty roomInfo.prod_room_img_3 }">
										<img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${roomInfo.prod_room_img_3 }"/>&fileSn=0" width="100" />
										<br><input type="checkbox" id="room_img_3_del" name="room_img_3_del" class="admin_check" value="Y" /> <label for="room_img_3_del">삭제</label>
										</c:if>
									</td>
									<td class="alignCenter" style="background-color: #666; color:#fff; ">사진 4</td>
									<td>
										<input type="file" id="room_img_4"  name="room_img_4"  onchange="file_upload('item','room_img_4');" />
										<input class="modal_input admin_input" type="hidden" id="room_img_4_id" name="room_img_4_id"  />
										<input class="modal_input admin_input" type="hidden" id="room_old_img_4_id" name="room_old_img_4_id" value="<c:out value="${roomInfo.prod_room_img_4}"/>" />
										<c:if test="${not empty roomInfo.prod_room_img_4 }">
										<img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${roomInfo.prod_room_img_4 }"/>&fileSn=0" width="100" />
										<br><input type="checkbox" id="room_img_4_del" name="room_img_4_del" class="admin_check" value="Y" /> <label for="room_img_4_del">삭제</label>
										</c:if>
									</td>
								</tr>
								<tr>
									<td class="alignCenter" style="background-color: #666; color:#fff; ">사진 5</td>
									<td>
										<input type="file" id="room_img_5"  name="room_img_5"  onchange="file_upload('item','room_img_5');" />
										<input class="modal_input admin_input" type="hidden" id="room_img_5_id" name="room_img_5_id"  />
										<input class="modal_input admin_input" type="hidden" id="room_old_img_5_id" name="room_old_img_5_id" value="<c:out value="${roomInfo.prod_room_img_5}"/>" />
										<c:if test="${not empty roomInfo.prod_room_img_5 }">
										<img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${roomInfo.prod_room_img_5 }"/>&fileSn=0" width="100" />
										<br><input type="checkbox" id="room_img_5_del" name="room_img_5_del" class="admin_check" value="Y" /> <label for="room_img_5_del">삭제</label>
										</c:if>
									</td>
									<td class="alignCenter" style="background-color: #666; color:#fff; ">사진 6</td>
									<td>
										<input type="file" id="room_img_6"  name="room_img_6"  onchange="file_upload('item','room_img_6');" />
										<input class="modal_input admin_input" type="hidden" id="room_img_6_id" name="room_img_6_id"  />
										<input class="modal_input admin_input" type="hidden" id="room_old_img_6_id" name="room_old_img_6_id" value="<c:out value="${roomInfo.prod_room_img_6}"/>" />
										<c:if test="${not empty roomInfo.prod_room_img_6 }">
										<img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${roomInfo.prod_room_img_6 }"/>&fileSn=0" width="100" />
										<br><input type="checkbox" id="room_img_6_del" name="room_img_6_del" class="admin_check" value="Y" /> <label for="room_img_6_del">삭제</label>
										</c:if>
									</td>
								</tr>
								<tr>
									<td class="alignCenter" style="background-color: #666; color:#fff; ">사진 7</td>
									<td>
										<input type="file" id="room_img_7"  name="room_img_7"  onchange="file_upload('item','room_img_7');" />
										<input class="modal_input admin_input" type="hidden" id="room_img_7_id" name="room_img_7_id"  />
										<input class="modal_input admin_input" type="hidden" id="room_old_img_7_id" name="room_old_img_7_id" value="<c:out value="${roomInfo.prod_room_img_7}"/>" />
										<c:if test="${not empty roomInfo.prod_room_img_7 }">
										<img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${roomInfo.prod_room_img_7 }"/>&fileSn=0" width="100" />
										<br><input type="checkbox" id="room_img_7_del" name="room_img_7_del" class="admin_check" value="Y" /> <label for="room_img_7_del">삭제</label>
										</c:if>
									</td>
									<td class="alignCenter" style="background-color: #666; color:#fff; ">사진 8</td>
									<td>
										<input type="file" id="room_img_8"  name="room_img_8"  onchange="file_upload('item','room_img_8');" />
										<input class="modal_input admin_input" type="hidden" id="room_img_8_id" name="room_img_8_id"  />
										<input class="modal_input admin_input" type="hidden" id="room_old_img_8_id" name="room_old_img_8_id" value="<c:out value="${roomInfo.prod_room_img_8}"/>" />
										<c:if test="${not empty roomInfo.prod_room_img_8 }">
										<img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${roomInfo.prod_room_img_8 }"/>&fileSn=0" width="100" />
										<br><input type="checkbox" id="room_img_8_del" name="room_img_8_del" class="admin_check" value="Y" /> <label for="room_img_8_del">삭제</label>
										</c:if>
									</td>
								</tr>
								<tr>
									<td class="alignCenter" style="background-color: #666; color:#fff; ">사진 9</td>
									<td>
										<input type="file" id="room_img_9"  name="room_img_9"  onchange="file_upload('item','room_img_9');" />
										<input class="modal_input admin_input" type="hidden" id="room_img_9_id" name="room_img_9_id"  />
										<input class="modal_input admin_input" type="hidden" id="room_old_img_9_id" name="room_old_img_9_id" value="<c:out value="${roomInfo.prod_room_img_9}"/>" />
										<c:if test="${not empty roomInfo.prod_room_img_9 }">
										<img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${roomInfo.prod_room_img_9 }"/>&fileSn=0" width="100" />
										<br><input type="checkbox" id="room_img_9_del" name="room_img_9_del" class="admin_check" value="Y" /> <label for="room_img_9_del">삭제</label>
										</c:if>
									</td>
									<td class="alignCenter" style="background-color: #666; color:#fff; ">사진 10</td>
									<td>
										<input type="file" id="room_img_10"  name="room_img_10"  onchange="file_upload('item','room_img_10');" />
										<input class="modal_input admin_input" type="hidden" id="room_img_10_id" name="room_img_10_id"  />
										<input class="modal_input admin_input" type="hidden" id="room_old_img_10_id" name="room_old_img_10_id" value="<c:out value="${roomInfo.prod_room_img_10}"/>" />
										<c:if test="${not empty roomInfo.prod_room_img_10 }">
										<img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${roomInfo.prod_room_img_10 }"/>&fileSn=0" width="100" />
										<br><input type="checkbox" id="room_img_10_del" name="room_img_10_del" class="admin_check" value="Y" /> <label for="room_img_10_del">삭제</label>
										</c:if>
									</td>
								</tr>
							</tbody>
						</table>

						<table class="admin_tbl admin_list_tbl mgt10px">
							<caption>객실정보</caption>
							<colgroup>
								<col width="150" />
								<col />
							</colgroup>
							<tbody>
								<tr>
									<th style="background-color: #666; color:#fff; ">객실안내 - 기본정보</th>
									<td >
										<textarea class="modal_textarea admin_textarea w100"  id="room_content_1" name="room_content_1"  rows="4"><c:out value="${roomInfo.prod_room_content_1}"/></textarea>
									</td>
								</tr>
								<tr>
									<th style="background-color: #666; color:#fff; ">객실안내 - 편의시설</th>
									<td >
										<textarea class="modal_textarea admin_textarea w100" id="room_content_2" name="room_content_2" rows="4"><c:out value="${roomInfo.prod_room_content_2}"/></textarea>
									</td>
								</tr>								
								<tr>
									<th class="alignCenter" style="background-color: #666; color:#fff; ">인원(기준/최대)</th>
									<td >
										기본 <input class="modal_input admin_input" type="text" id="room_default_cnt" name="room_default_cnt" size="5" value="<c:out value="${roomInfo.prod_room_default_cnt}"/>" /> 명,&nbsp;&nbsp;&nbsp;
										최대 <input class="modal_input admin_input" type="text" id="room_max_cnt" name="room_max_cnt" size="5" value="<c:out value="${roomInfo.prod_room_max_cnt}"/>" /> 명
									</td>
								</tr>
								<tr>
									<th class="alignCenter" style="background-color: #666; color:#fff; ">인원추가</th>
									<td >
										성인 <input class="modal_input admin_input" type="text" id="room_adult_price" name="room_adult_price" size="5" value="<c:out value="${roomInfo.prod_room_adult_price}"/>" /> 원,&nbsp;&nbsp;&nbsp;
										아동 <input class="modal_input admin_input" type="text" id="room_young_price" name="room_young_price" size="5" value="<c:out value="${roomInfo.prod_room_young_price}"/>" /> 원
									</td>
								</tr>
								<%--
								<tr>
									<th class="alignCenter" style="background-color: #666; color:#fff; ">옵션 &nbsp;&nbsp; <a href="#;" onclick="option_room_price_add()" class="btns whitebtn h24px"><i class="fal fa-plus"></i></a>
										<input type="hidden" value="<c:out value="${fn:length(prodOptionInfo) }"/>" id="option_room_cnt" >
									</th>
									<td id="option_room_list">
										<c:set var="optcnt" value="1"/>
										<p class="comment">* 객실별 옵션입니다. 공통옵션과 중복되지 않게 합니다. 또한 옵션과 가격 모두 입력되지 않는 항목은 저장되지 않습니다. 
										<br>* 가격이 없다면, 0을 입력합니다.</p>									
										<c:forEach var="prodOptionInfo" items="${prodOptionInfo}" varStatus="status">
										<div id="option_room_<c:out value="${optcnt }"/>" >
											<a href="#;" onclick="option_room_delete('<c:out value="${optcnt }"/>')" class="btns whitebtn h24px"><i class="fal fa-minus" ></i></a>&nbsp;&nbsp;
											<input class="modal_input admin_input" type="text" id="option_room_nm_<c:out value="${optcnt }"/>" name="prod_option_room_nm" size="35" placeholder="내용" value="" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											<input class="modal_input admin_input" type="text" id="option_room_price_<c:out value="${optcnt }"/>'" name="prod_option_room_price" class="admin_input alignRight" size="10" placeholder="가격" value=""  /> 원
										</div>
										<c:set var="optcnt" value="${optcnt+1}"/>
										</c:forEach>
									</td>
								</tr>
								 --%>
								<tr>
									<th class="alignCenter" style="background-color: #666; color:#fff; ">요금</th>
									<td >
										<table class="admin_tbl admin_list_tbl">
											<caption>객실요금</caption>
											<%--
											<colgroup>
												<col />
												<col />
												<col />
												<col />
												<col />
											</colgroup>
											<thead>
												<tr>
													<th>구분</th>
													<th>평일정상가</th>
													<th>평일판매가</th>
													<th>주말정상가</th>
													<th>주말판매가</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td class="alignCenter">비수기</td>
													<td class="alignCenter"><input class="modal_input admin_input" type="text" id="room_normal_normal_price" name="room_normal_normal_price" class="admin_input alignRight" size="10" value="" /> 원</td>
													<td class="alignCenter"><input class="modal_input admin_input" type="text" id="room_normal_normal_sale_price" name="room_normal_normal_sale_price" class="admin_input alignRight" size="10" value="" /> 원</td>
													<td class="alignCenter"><input class="modal_input admin_input" type="text" id="room_normal_holiday_price" name="room_normal_holiday_price" class="admin_input alignRight" size="10" value="" /> 원</td>
													<td class="alignCenter"><input class="modal_input admin_input" type="text" id="room_normal_holiday_sale_price" name="room_normal_holiday_sale_price" class="admin_input alignRight" size="10" value="" /> 원</td>
												</tr>
												<tr>
													<td class="alignCenter">준성수기</td>
													<td class="alignCenter"><input class="modal_input admin_input" type="text" id="room_ready_normal_price" name="room_ready_normal_price" class="admin_input alignRight" size="10" value="" /> 원</td>
													<td class="alignCenter"><input class="modal_input admin_input" type="text" id="room_ready_normal_sale_price" name="room_ready_normal_sale_price" class="admin_input alignRight" size="10" value="" /> 원</td>
													<td class="alignCenter"><input class="modal_input admin_input" type="text" id="room_ready_holiday_price" name="room_ready_holiday_price" class="admin_input alignRight" size="10" value="" /> 원</td>
													<td class="alignCenter"><input class="modal_input admin_input" type="text" id="room_ready_holiday_sale_price" name="room_ready_holiday_sale_price" class="admin_input alignRight" size="10" value="" /> 원</td>
												</tr>
												<tr>
													<td class="alignCenter">성수기</td>
													<td class="alignCenter"><input class="modal_input admin_input" type="text" id="room_busy_normal_price" name="room_busy_normal_price" class="admin_input alignRight" size="10" value="" /> 원</td>
													<td class="alignCenter"><input class="modal_input admin_input" type="text" id="room_busy_normal_sale_price" name="room_busy_normal_sale_price" class="admin_input alignRight" size="10" value="" /> 원</td>
													<td class="alignCenter"><input class="modal_input admin_input" type="text" id="room_busy_holiday_price" name="room_busy_holiday_price" class="admin_input alignRight" size="10" value="" /> 원</td>
													<td class="alignCenter"><input class="modal_input admin_input" type="text" id="room_busy_holiday_sale_price" name="room_busy_holiday_sale_price" class="admin_input alignRight" size="10" value="" /> 원</td>
												</tr>
											</tbody>
												 --%>
											<colgroup>
												<col />
												<col />
												<col />
												<col />
											</colgroup>
											<thead>
												<tr>
													<th>구분</th>
													<th>비수기</th>
													<th>준성수기</th>
													<th>성수기</th>
													<th>준성수기(성수기 후)</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td class="alignCenter">평일</td>
													<td class="alignCenter"><input class="modal_input admin_input" type="text" id="room_normal_normal_sale_price" name="room_normal_normal_sale_price" class="admin_input alignRight" size="10" value="<c:out value="${roomInfo.prod_room_normal_normal_sale_price}"/>" /> 원</td>
													<td class="alignCenter"><input class="modal_input admin_input" type="text" id="room_ready_normal_sale_price" name="room_ready_normal_sale_price" class="admin_input alignRight" size="10" value="<c:out value="${roomInfo.prod_room_ready_normal_sale_price}"/>" /> 원</td>
													<td class="alignCenter"><input class="modal_input admin_input" type="text" id="room_busy_normal_sale_price" name="room_busy_normal_sale_price" class="admin_input alignRight" size="10" value="<c:out value="${roomInfo.prod_room_busy_normal_sale_price}"/>" /> 원</td>
													<td class="alignCenter"><input class="modal_input admin_input" type="text" id="room_ready2_normal_sale_price" name="room_ready2_normal_sale_price" class="admin_input alignRight" size="10" value="<c:out value="${roomInfo.prod_room_ready2_normal_sale_price}"/>" /> 원</td>
												</tr>
												<tr>
													<td class="alignCenter">주말</td>
													<td class="alignCenter"><input class="modal_input admin_input" type="text" id="room_normal_holiday_sale_price" name="room_normal_holiday_sale_price" class="admin_input alignRight" size="10" value="<c:out value="${roomInfo.prod_room_normal_holiday_sale_price}"/>" /> 원</td>
													<td class="alignCenter"><input class="modal_input admin_input" type="text" id="room_ready_holiday_sale_price" name="room_ready_holiday_sale_price" class="admin_input alignRight" size="10" value="<c:out value="${roomInfo.prod_room_ready_holiday_sale_price}"/>" /> 원</td>
													<td class="alignCenter"><input class="modal_input admin_input" type="text" id="room_busy_holiday_sale_price" name="room_busy_holiday_sale_price" class="admin_input alignRight" size="10" value="<c:out value="${roomInfo.prod_room_busy_holiday_sale_price}"/>" /> 원</td>
													<td class="alignCenter"><input class="modal_input admin_input" type="text" id="room_ready2_holiday_sale_price" name="room_ready2_holiday_sale_price" class="admin_input alignRight" size="10" value="<c:out value="${roomInfo.prod_room_ready2_holiday_sale_price}"/>" /> 원</td>
												</tr>
											</tbody>
										</table>
									</td>
								</tr>
							</tbody>
						</table>
						<br>
						<center>
							<button type="button" onclick="save_room();"  class="btns redbtn"><i class="far fa-save"></i> 저장</button> 
							&nbsp;&nbsp;&nbsp;
							<button type="button" onclick="room_modal_close();" class="btns graybtn"><i class="far fa-save"></i> 취소</button>
						</center>						
						<br>
					</div>
				</div>
			</div>
		</div>
		<!-- } 모달팝업 > 쿠폰검색 -->	