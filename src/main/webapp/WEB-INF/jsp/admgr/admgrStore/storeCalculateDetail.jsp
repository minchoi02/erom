<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:import url="/Api/admgrIncludeTop.do"/>
<c:import url="/Api/admgrIncludeLeftMenu.do"/>


		<div id="content">
			<h1 class="bigTit">상점정산</h1>
			<div class="pageComment">
				<div class="comment_ico"><i class="fad fa-comment-alt-smile"></i></div>
				<p>
					결제수수료의 수수료 : PG(카드결제대행)사 수수료<br />
					판매수수료의 수수료 : 카테고리별 판매 수수료 조건에 따름<br />
					정산기준 : 관광상품(사용완료 후 1일), 서천장터(배송 후 7일)
				</p>
			</div>
			
			<!-- 상점관리 > 상점정산 > 글쓰기 { -->
			<section id="storeCalculateWrite" class="page_content">
				<!-- 상점정보 { -->
				<article class="page_sortation">
					<h2 class="h2Tit"><i class="fal fa-window-minimize"></i> 상점정보</h2>
					<table class="admin_tbl admin_view_tbl">
						<caption>상점정보</caption>
						<colgroup>
							<col width="200" />
							<col />
							<col width="200" />
							<col />
						</colgroup>
						<tbody>
							<tr>
								<th>업체명</th>
								<td><c:out value="${storeInfo.store_nm }"/></td>
								<th>대표자명</th>
								<td><c:out value="${storeInfo.store_ceo_nm }"/></td>
							</tr>
							<tr>
								<th>업체주소</th>
								<td colspan="3">(<c:out value="${storeInfo.store_zip }"/>) <c:out value="${storeInfo.store_addr_1}"/> <c:out value="${storeInfo.store_addr_2}"/></td>
							</tr>
							<tr>
								<th>사업자등록번호</th>
								<td><c:out value="${storeInfo.store_number}"/></td>
								<th>통신판매업신고</th>
								<td><c:out value="${storeInfo.store_auth_number}"/></td>
							</tr>
							<tr>
								<th>대표번호</th>
								<td><c:out value="${storeInfo.store_tel}"/></td>
								<th>핸드폰</th>
								<td><c:out value="${storeInfo.store_hp_1}"/></td>
							</tr>
							<tr>
								<th>팩스번호</th>
								<td><c:out value="${storeInfo.store_fax}"/></td>
								<th>대표메일</th>
								<td><c:out value="${storeInfo.store_email}"/></td>
							</tr>
							<tr>
								<th>은행계좌</th>
								<td class="fsize16" colspan="3"><c:out value="${storeInfo.store_bank_nm}"/> <c:out value="${storeInfo.store_bank_number}"/> (예금주 : <c:out value="${storeInfo.store_bank_user_nm}"/>)</td>
							</tr>
							<tr>
								<th>결제수수료</th>
								<td colspan="3">
									무통장입금 : <span class="colorRed">0%</span>&nbsp;&nbsp;
									카드결제 : <span class="colorRed"><c:out value="${BaseConfig.pay_card_calc}"/>%</span>&nbsp;&nbsp;
									실시간계좌이체 : <span class="colorRed"><c:out value="${BaseConfig.pay_real_calc}"/>%</span>&nbsp;&nbsp;
									가상계좌 : <span class="colorRed"><c:out value="${BaseConfig.pay_virt_calc}"/>%</span>
								</td>
							</tr>
							<tr>
								<th>정산수수료</th>
								<td colspan="3">
									<c:if test="${storeInfo.store_use_travel eq 'Y' }">
									관광/체험 : <span class="colorRed"><c:out value="${storeInfo.store_travel_calc_percent}"/>%</span>&nbsp;&nbsp;
									</c:if>
									<c:if test="${storeInfo.store_use_house eq 'Y' }">
									숙박 : <span class="colorRed"><c:out value="${storeInfo.store_house_calc_percent}"/>%</span>&nbsp;&nbsp;
									</c:if>
									<c:if test="${storeInfo.store_use_food eq 'Y' }">
									맛집 : <span class="colorRed"><c:out value="${storeInfo.store_food_calc_percent}"/>%</span>&nbsp;&nbsp;
									</c:if>
									<c:if test="${storeInfo.store_use_market eq 'Y' }">
									서천장터 : <span class="colorRed"><c:out value="${storeInfo.store_market_calc_percent}"/>%</span>
									</c:if>
								</td>
							</tr>
						</tbody>
					</table>
					
					<%--
					<table class="admin_tbl admin_view_tbl mgt10px">
						<caption>운영자 정보</caption>
						<colgroup>
							<col width="200" />
							<col />
						</colgroup>
						<tbody>
							<tr>
								<th>운영자</th>
								<td>
									이름(아이디) : <a href="./member_write.php" class="colorBlue"><b>홍길동(gildonghong)</b></a><br />
									연락처 : 010-1234-5678<br />
									이메일 : honggildong@naver.com<br />
									등록일 : 2020-04-30 15:12:11
								</td>
							</tr>
						</tbody>
					</table>
					 --%>
				</article>
				<!-- } 상점정보 -->

				<!-- 매출내역 { -->
				<c:set var="ym_set_arr" value="${fn:split(search_ym,'-') }"/>
				<article class="page_sortation">
					<h2 class="h2Tit"><i class="fal fa-window-minimize"></i> <c:out value="${ym_set_arr[0]}"/>년 <c:out value="${ym_set_arr[1]}"/>월 매출내역 - 작업중</h2>
					
					<form method="post" id="calc_form" action="/admgr/admgrStore/storeCalculateSave.do" >
					<input type="hidden" name="save_type" id="save_type" value=""/>
					<input type="hidden" name="pageIndex" id="pageIndex" value="<c:out value="${pageIndex }"/>" />
					<input type="hidden" name="store_id" id="store_id" value="<c:out value="${store_id }"/>" />
					<input type="hidden" name="search_ym" id="search_ym" value="<c:out value="${search_ym }"/>" />
					<table class="admin_tbl admin_calculate_tbl">
						<caption><c:out value="${ym_set_arr[0]}"/>년 <c:out value="${ym_set_arr[1]}"/>월 매출내역</caption>
						<colgroup>
						<c:if test="${adminLevel eq '10' }">
							<col width="50" />
						</c:if>
							<col width="200" />
							<col width="100" />
							<col width="100" />
							<col />
							<col width="130" />
							<col width="130" />
							<col width="130" />
							<col width="130" />
							<col width="130" />
							<col width="100" />
						</colgroup>
						<thead>
							<tr>
							<c:if test="${adminLevel eq '10' }">
								<th rowspan="2"><input type="checkbox" id="calc_all" onclick="all_calc_check()"/></th>
							</c:if>
								<th rowspan="2">주문번호</th>
								<th>구분</th>
								<th>결제일</th>
								<th>상품명</th>
								<th rowspan="2">상품금액 <span class="fsize12">(A)</span></th>
								<th rowspan="2">판매수수료 <span class="fsize12">(B)</span></th>
								<th rowspan="2">결제수수료 <span class="fsize12">(C)</span></th>
								<th rowspan="2">배송비 <span class="fsize12">(D)</span></th>
								<th rowspan="2">정산금액<br /><span class="fsize12">(A+D-B-C)</span></th>
								<th rowspan="2">관리</th>
							</tr>
							<tr>
								<th colspan="3">비고</th>
							</tr>
						</thead>
						<tbody>
							<c:set var="sum_sale_price" value="0"/>
							<c:set var="sum_card_price" value="0"/>
							<c:set var="sum_calc_price" value="0"/>
							<c:set var="sum_deli_price" value="0"/>
							<c:set var="sum_res_price" value="0"/>
							
							<c:forEach var="calcDetailLists" items="${calcDetailList}" varStatus="status">
							<c:set var="dsum_card_price_res" value="${calcDetailLists.detail_total_price*(calcDetailLists.cal_card_adjustment/100) }"/>
							<c:set var="dsum_card_price_res_arr" value="${fn:split(dsum_card_price_res,'.')}"/>
							<c:set var="dsum_card_price" value="${dsum_card_price_res_arr[0]}"/>
							
							<c:set var="dsum_calc_price" value="${calcDetailLists.calc_total_price}"/>
							<c:set var="dsum_deli_price" value="${calcDetailLists.cal_delivery_price }"/>
							<c:set var="dsum_total_price" value="${calcDetailLists.detail_total_price }"/>
							
							<c:set var="detail_cnt" value="0"/>
							<c:set var="dsum_sale_price" value="0"/>
							<c:set var="calcDetailID" value="calcDetailList_${calcDetailLists.cal_order_id}_${calcDetailLists.cal_id}"/>
							<c:set var="sendDetailID" value="${calcDetailLists.cal_id}_${calcDetailLists.cal_order_id}_${store_id}"/>
							<c:forEach var="calcDetail" items="${requestScope[calcDetailID]}" varStatus="status2">
							<c:choose>
								<c:when test="${calcDetail.cal_store_category eq 'CD002001' }"><c:set var="cate_nm" value="관광/체험"/></c:when>
								<c:when test="${calcDetail.cal_store_category eq 'CD002002' }"><c:set var="cate_nm" value="숙박"/></c:when>
								<c:when test="${calcDetail.cal_store_category eq 'CD002003' }"><c:set var="cate_nm" value="맛집"/></c:when>
								<c:when test="${calcDetail.cal_store_category eq 'CD002004' }"><c:set var="cate_nm" value="서천창터"/></c:when>
							</c:choose>
							<c:choose>
								<c:when test="${calcDetail.cal_store_category ne 'CD002004' }">
								<c:set var="alink" value="/shop/itemView.do?store_category=${calcDetail.cal_store_category }&prod_id=${calcDetail.cal_prod_id}"/>
								</c:when>
								<c:otherwise>
								<c:set var="alink" value="/shop/itemView.do?store_category=${calcDetail.cal_store_category }&prod_category=${calcDetail.cal_prod_category}&prod_id=${calcDetail.cal_prod_id}"/>
								</c:otherwise>
							</c:choose>
							<c:set var="order_dt_arr" value="${fn:split(calcDetail.cal_order_dt, ' ') }"/>
							<c:set var="order_calc_price_res" value="${calcDetail.cal_order_price*(calcDetail.cal_category_adjustment/100) }"/>
							<c:set var="order_calc_price_res_arr" value="${fn:split(order_calc_price_res, '.') }"/>
							<c:set var="order_calc_price" value="${order_calc_price_res_arr[0]}"/>
							
								
							<tr>
								<c:if test="${detail_cnt eq '0'}">
								<c:if test="${adminLevel eq '10' }">
								<td class="alignCenter" rowspan="<c:out value="${calcDetailLists.order_detail_cnt * 2}"/>"><input type="checkbox" name="calc_checked" class="calc_check" onclick="calc_check();" value="<c:out value="${sendDetailID}"/>" /></td>
								</c:if>
								<td class="alignCenter" rowspan="<c:out value="${calcDetailLists.order_detail_cnt * 2}"/>"><c:out value="${calcDetail.cal_order_id}"/></td>
								</c:if>
								
								<td class="alignCenter"><c:out value="${cate_nm}"/></td>
								<td class="alignCenter"><c:out value="${order_dt_arr[0]}"/><br /><c:out value="${order_dt_arr[1]}"/></td>
								<td>
									<img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${calcDetailLists.prod_img_1}"/>&fileSn=0" onerror="this.src='/images/baseScmtour/_noImage.png';" height="50" />
									<a href="<c:out value="${alink }"/>" target="_blank" class="colorBlue"><b><c:out value="${calcDetail.od_prod_nm}"/>
									<c:if test="${not empty calcDetail.od_room_nm}"> - <c:out value="${calcDetail.od_room_nm}"/></c:if></b> 
									<i class="fal fa-external-link"></i></a>
								</td>
								<td class="alignRight"><fmt:formatNumber value="${calcDetail.cal_order_price}" type="number"/> 원</td>
								<td class="alignRight"><fmt:parseNumber integerOnly="true" value="${order_calc_price }" />원 </td>
								
								<c:if test="${detail_cnt eq '0'}">
								<td class="alignRight" rowspan="<c:out value="${calcDetailLists.order_detail_cnt * 2}"/>" ><fmt:formatNumber value="${dsum_card_price}" type="number"/> 원</td>
								<td class="alignRight" rowspan="<c:out value="${calcDetailLists.order_detail_cnt * 2}"/>" ><fmt:formatNumber value="${dsum_deli_price}" type="number"/> 원</td>
								<td class="alignRight" rowspan="<c:out value="${calcDetailLists.order_detail_cnt * 2}"/>" ><b>
									<c:set var="dsum_res_price" value="${dsum_total_price + dsum_deli_price - dsum_card_price - dsum_calc_price }"/>
									<input type="hidden" id="dsum_res_price_<c:out value="${sendDetailID}"/>" value="${dsum_res_price}"/>
									<fmt:formatNumber value="${dsum_res_price}" type="number"/>
								</b> 원</td>
								<td class="alignCenter" rowspan="<c:out value="${calcDetailLists.order_detail_cnt * 2}"/>">
									<c:choose>
										<c:when test="${calcDetailLists.cal_st eq 'N'}">
											<b class="colorRed">미정산</b>
										</c:when>
										<c:otherwise>
											<b class="colorBlue">정산완료</b>
											<br>
											<c:out value="${calcDetailLists.cal_res_dt}"/>
										</c:otherwise>
									</c:choose>
								</td>
								</c:if>
							</tr>
							<tr>
							<c:if test="${adminLevel eq '10' }">
								<td colspan="5">
							</c:if>
							<c:if test="${adminLevel ne '10' }">
								<td colspan="4">
							</c:if>
									<input type="hidden"  name="cal_seq" value="<c:out value="${calcDetail.cal_seq}"/>" />
									<input type="hidden"  name="cal_cal_id" value="<c:out value="${calcDetail.cal_id}"/>" />
									<c:if test="${adminLevel eq '10' }">
									<input type="text" id="cal_seq_<c:out value="${calcDetail.cal_seq}"/>" name="cal_content_<c:out value="${calcDetail.cal_seq}"/>" value="<c:out value="${calcDetail.cal_content }"/>" class="admin_input w100" placeholder="비고사항을 입력하세요." />
									</c:if>
									<c:if test="${adminLevel ne '10' }">
									<c:out value="${calcDetail.cal_content }"/>
									</c:if>
								</td>
							</tr>
							
							
							<c:set var="detail_cnt" value="detail_cnt+1"/>
							<c:set var="dsum_sale_price" value="${dsum_sale_price + calcDetail.cal_order_price }"/>
							<c:set var="dsum_calc_price" value="${dsum_calc_price + order_calc_price }"/>
							</c:forEach>

							<c:set var="sum_sale_price" value="${sum_sale_price + dsum_sale_price }"/>
							<c:set var="sum_card_price" value="${sum_card_price + dsum_card_price }"/>
							<c:set var="sum_calc_price" value="${sum_calc_price + dsum_calc_price }"/>
							<c:set var="sum_deli_price" value="${sum_deli_price + dsum_deli_price }"/>
							<c:set var="sum_res_price" value="${sum_res_price + dsum_res_price }"/>
							</c:forEach>
						</tbody>
						<tfoot>
							<tr>
							<c:if test="${adminLevel eq '10' }">
								<td class="alignCenter" colspan="2">합계</td>
							</c:if>
							<c:if test="${adminLevel ne '10' }">
								<td class="alignCenter" >합계</td>
							</c:if>
								<td colspan="3"></td>
								<td class="alignRight" ><b class=""><fmt:formatNumber value="${sum_sale_price}" type="number"/></b> 원</td>
								<td class="alignRight" ><b class=""><fmt:formatNumber value="${sum_calc_price}" type="number"/></b> 원</td>
								<td class="alignRight" ><b class=""><fmt:formatNumber value="${sum_card_price}" type="number"/></b> 원</td>
								<td class="alignRight" ><b class=""><fmt:formatNumber value="${sum_deli_price}" type="number"/></b> 원</td>
								<td class="alignRight" ><b class="fsize18"><fmt:formatNumber value="${sum_res_price}" type="number"/></b> 원</td>
								<td></td>
							</tr>
							<tr>
							<c:if test="${adminLevel eq '10' }">
								<td class="alignCenter" colspan="2">선택합계</td>
							</c:if>
							<c:if test="${adminLevel ne '10' }">
								<td class="alignCenter" >선택합계</td>
							</c:if>
								<td colspan="7"></td>
								<td class="alignRight" ><b class="fsize18" id="selec_price" style="color:yellow">0</b> 원</td>
								<td></td>
							</tr>
						</tfoot>
					</table>
					</form>
				</article>
				<!-- } 매출내역 -->

				<div class="btnarea alignRight mgt30px">
					<ul class="nopm floats">
						<li><a href="/admgr/admgrStore/storeCalculateList.do?pageIndex=<c:out value="${pageIndex}"/>&search_ym=<c:out value="${search_ym }"/>" class="btns "><i class="fal fa-list"></i> 목록으로</a></li>
						<li class="fr">
						<c:if test="${adminLevel eq '10' }">
							<%--
							<a href="javascript:alert('작업중');" class="btns graybtn"><i class="fal fa-file-spreadsheet"></i> 엑셀다운로드</a>
							--%>
							<a href="javascript:calcsave('content');" class="btns darkgraybtn"><i class="far fa-save"></i> 일괄비고저장</a>
							<a href="javascript:calcsave('cancel');" class="btns redbtn"><i class="far fa-save"></i> 선택정산취소</a>
							<a href="javascript:calcsave('auth');" class="btns bluebtn"><i class="far fa-save"></i> 선택정산완료</a>
						</c:if>
						</li>
					</ul>
				</div>
			</section>
			<!-- } 상점관리 > 상점정산 > 글쓰기 -->
		</div>

<c:import url="/Api/admgrIncludeBottom.do"/>