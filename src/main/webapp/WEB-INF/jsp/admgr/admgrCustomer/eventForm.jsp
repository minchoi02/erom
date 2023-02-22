<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:import url="/Api/admgrIncludeTop.do"/>
<c:import url="/Api/admgrIncludeLeftMenu.do"/>

		<!-- 콘텐츠 영역 { -->
		<div id="content">
			<h1 class="bigTit">프로모션/이벤트 내용</h1>

			<!-- 고객센터 > 프로모션/이벤트 > 글쓰기 { -->
			<section id="boardWrite" class="page_content">
				<!-- 프로모션/이벤트 내용 { -->
				<form method="post" id="bbsForm" name="bbsForm" action="/admgr/admgrCustomer/eventAction.do" onsubmit="return eventFormCheck()" >
				<input type="hidden" name="bbs_id" value="<c:out value="${bbs_id}"/>" />
				<input type="hidden" name="bbs_seq" value="<c:out value="${bbs_seq}"/>" />
				<input type="hidden" name="pageIndex" value="<c:out value="${pageIndex}"/>" />
				<input type="hidden" name="searchKey" value="<c:out value="${searchKey}"/>" />
				<input type="hidden" name="searchKeyword" value="<c:out value="${searchKeyword}"/>" />
				<input type="hidden" id="return_url" name="return_url" value="" />
				<article class="page_sortation">
					<table class="admin_tbl admin_write_tbl">
						<caption>프로모션/이벤트 내용</caption>
						<colgroup>
							<col width="200" />
							<col />
							<col width="200" />
							<col />
						</colgroup>
						<tbody>
							<tr>
								<th>사용</th>
								<td colspan="3"><input type="checkbox" id="bbs_use_date" name="bbs_use_date"  value="Y" <c:if test="${bbsInfo.bbs_use_date eq 'Y'}">checked</c:if> class="admin_check" /><label for="bbs_use_date">사용</label></td>
							</tr>
							<tr>
								<th>제목 <span class="colorRed">*</span></th>
								<td colspan="3"><input type="text" id="bbs_subject" name="bbs_subject" class="admin_input w100"  value="<c:out value="${bbsInfo.bbs_subject}"/>"/></td>
							</tr>
							<tr>
								<th>진행 시작일시</th>
								<td>
									<input type="text" id="bbs_st_dt_ymd" name="bbs_st_dt_ymd"  value="<c:out value="${bbsInfo.bbs_st_dt_ymd }"/>" class="admin_input datepicker readonly" size="18" placeholder="날짜"  readonly />
									<select id="bbs_st_dt_hour" name="bbs_st_dt_hour" class="basic_select w100px"></select>
									<select id="bbs_st_dt_minute" name="bbs_st_dt_minute" class="basic_select w100px"></select>
									<script>getHourSelect("bbs_st_dt_hour", "S", "<c:out value="${bbsInfo.bbs_st_dt_hour }"/>");</script>
									<script>getMinuteSelect("bbs_st_dt_minute", "S", "<c:out value="${bbsInfo.bbs_st_dt_minute}"/>");</script>
								</td>
								<th>진행 종료일시</th>
								<td>
									<input type="text" id="bbs_ed_dt_ymd" name="bbs_ed_dt_ymd"  value="<c:out value="${bbsInfo.bbs_ed_dt_ymd }"/>" class="admin_input datepicker readonly" size="18" placeholder="날짜"  readonly/>
									<select id="bbs_ed_dt_hour" name="bbs_ed_dt_hour" class="basic_select w100px"></select>
									<select id="bbs_ed_dt_minute" name="bbs_ed_dt_minute" class="basic_select w100px"></select>
									<script>getHourSelect("bbs_ed_dt_hour", "E", "<c:out value="${bbsInfo.bbs_ed_dt_hour }"/>");</script>
									<script>getMinuteSelect("bbs_ed_dt_minute", "E", "<c:out value="${bbsInfo.bbs_ed_dt_minute }"/>");</script>
								</td>
							</tr>
							<tr>
								<th>내용 <span class="colorRed">*</span></th>
								<td colspan="3">
									<textarea id="bbs_content" name="bbs_content" class="admin_textarea w100" rows="10" placeholder="※ 내용을 입력해주세요"><c:out value="${bbsInfo.bbs_content}"/></textarea>
								</td>
							</tr>

							<tr>
								<th>쿠폰 #1 </th>
								<td colspan="3">
									<input type="hidden" id="set_bbs_cp1" name="bbs_cp1" value="<c:out value="${bbsInfo.bbs_cp1 }"/>" />
									<input type="text" id="set_bbs_cp1_nm" name="bbs_cp1_nm" class="admin_input readonly " size="30" readonly value="<c:out value="${bbs_cp1_info.coupon_nm}"/>"/>
									<a href="#;" class="btns graybtn" onclick="getCouponModalOpen('bbs_cp1');" >쿠폰검색</a>
									<span id="cp1_res">
									<c:if test="${not empty bbsInfo.bbs_cp1 }">
									<c:set var="cp1_unit" value="원"/>
									<c:if test="${bbs_cp1_info.coupon_set_st eq 'P' }">
										<c:set var="cp1_unit" value="%"/>
									</c:if>
									<span class="comment">&nbsp;&nbsp;<fmt:formatNumber value="${bbs_cp1_info.coupon_set_price}" type="number"/><c:out value="${cp1_unit }"/> 할인
									 &nbsp; ::: &nbsp; <c:out value="${bbs_cp1_info.coupon_st_dt_ymd }"/> <c:out value="${bbs_cp1_info.coupon_st_dt_hour}"/>:<c:out value="${bbs_cp1_info.coupon_st_dt_minute}"/>
									  ~ <c:out value="${bbs_cp1_info.coupon_ed_dt_ymd }"/> <c:out value="${bbs_cp1_info.coupon_ed_dt_hour}"/>:<c:out value="${bbs_cp1_info.coupon_ed_dt_minute}"/></span>
									 &nbsp;&nbsp;&nbsp;&nbsp;<button type="button" class="btns lightgraybtn h24px" onclick="cp_del(1); "/>쿠폰삭제</button>
									</c:if>
									</span>
								</td>
							</tr>
							<tr>
								<th>쿠폰 #2 </th>
								<td colspan="3">
									<input type="hidden" id="set_bbs_cp2" name="bbs_cp2" value="<c:out value="${bbsInfo.bbs_cp2 }"/>" />
									<input type="text" id="set_bbs_cp2_nm" name="bbs_cp2_nm" class="admin_input readonly " size="30" readonly value="<c:out value="${bbs_cp2_info.coupon_nm}"/>"/>
									<a href="#;" class="btns graybtn" onclick="getCouponModalOpen('bbs_cp2');" >쿠폰검색</a>
									<span id="cp2_res">
									<c:if test="${not empty bbsInfo.bbs_cp2 }">
									<c:set var="cp2_unit" value="원"/>
									<c:if test="${bbs_cp2_info.coupon_set_st eq 'P' }">
										<c:set var="cp2_unit" value="%"/>
									</c:if>
									<span class="comment">&nbsp;&nbsp;<fmt:formatNumber value="${bbs_cp2_info.coupon_set_price}" type="number"/><c:out value="${cp2_unit }"/> 할인
									 &nbsp; ::: &nbsp; <c:out value="${bbs_cp2_info.coupon_st_dt_ymd }"/> <c:out value="${bbs_cp2_info.coupon_st_dt_hour}"/>:<c:out value="${bbs_cp2_info.coupon_st_dt_minute}"/>
									  ~ <c:out value="${bbs_cp2_info.coupon_ed_dt_ymd }"/> <c:out value="${bbs_cp2_info.coupon_ed_dt_hour}"/>:<c:out value="${bbs_cp2_info.coupon_ed_dt_minute}"/></span>
									&nbsp;&nbsp;&nbsp;&nbsp;<button type="button" class="btns lightgraybtn h24px" onclick="cp_del(2); "/>쿠폰삭제</button>
									</c:if>
									</span>
								</td>
							</tr>
							<tr>
								<th>쿠폰 #3 </th>
								<td colspan="3">
									<input type="hidden" id="set_bbs_cp3" name="bbs_cp3" value="<c:out value="${bbsInfo.bbs_cp3 }"/>" />
									<input type="text" id="set_bbs_cp3_nm" name="bbs_cp3_nm" class="admin_input readonly " size="30" readonly value="<c:out value="${bbs_cp3_info.coupon_nm}"/>"/>
									<a href="#;" class="btns graybtn" onclick="getCouponModalOpen('bbs_cp3');" >쿠폰검색</a>
									<span id="cp3_res">
									<c:if test="${not empty bbsInfo.bbs_cp3 }">
									<c:set var="cp3_unit" value="원"/>
									<c:if test="${bbs_cp3_info.coupon_set_st eq 'P' }">
										<c:set var="cp3_unit" value="%"/>
									</c:if>
									<span class="comment">&nbsp;&nbsp;<fmt:formatNumber value="${bbs_cp3_info.coupon_set_price}" type="number"/><c:out value="${cp3_unit }"/> 할인
									 &nbsp; ::: &nbsp; <c:out value="${bbs_cp3_info.coupon_st_dt_ymd }"/> <c:out value="${bbs_cp3_info.coupon_st_dt_hour}"/>:<c:out value="${bbs_cp3_info.coupon_st_dt_minute}"/>
									  ~ <c:out value="${bbs_cp3_info.coupon_ed_dt_ymd }"/> <c:out value="${bbs_cp3_info.coupon_ed_dt_hour}"/>:<c:out value="${bbs_cp3_info.coupon_ed_dt_minute}"/></span>
									 &nbsp;&nbsp;&nbsp;&nbsp;<button type="button" class="btns lightgraybtn h24px" onclick="cp_del(3); "/>쿠폰삭제</button>
									</c:if>
									</span>
								</td>
							</tr>
							<tr>
								<th>쿠폰 #4 </th>
								<td colspan="3">
									<input type="hidden" id="set_bbs_cp4" name="bbs_cp4" value="<c:out value="${bbsInfo.bbs_cp4 }"/>" />
									<input type="text" id="set_bbs_cp4_nm" name="bbs_cp4_nm" class="admin_input readonly " size="30" readonly value="<c:out value="${bbs_cp4_info.coupon_nm}"/>"/>
									<a href="#;" class="btns graybtn" onclick="getCouponModalOpen('bbs_cp4');" >쿠폰검색</a>
									<span id="cp4_res">
									<c:if test="${not empty bbsInfo.bbs_cp4 }">
									<c:set var="cp4_unit" value="원"/>
									<c:if test="${bbs_cp4_info.coupon_set_st eq 'P' }">
										<c:set var="cp4_unit" value="%"/>
									</c:if>
									<span class="comment">&nbsp;&nbsp;<fmt:formatNumber value="${bbs_cp4_info.coupon_set_price}" type="number"/><c:out value="${cp4_unit }"/> 할인
									 &nbsp; ::: &nbsp; <c:out value="${bbs_cp4_info.coupon_st_dt_ymd }"/> <c:out value="${bbs_cp4_info.coupon_st_dt_hour}"/>:<c:out value="${bbs_cp4_info.coupon_st_dt_minute}"/>
									  ~ <c:out value="${bbs_cp4_info.coupon_ed_dt_ymd }"/> <c:out value="${bbs_cp4_info.coupon_ed_dt_hour}"/>:<c:out value="${bbs_cp4_info.coupon_ed_dt_minute}"/></span>
									 &nbsp;&nbsp;&nbsp;&nbsp;<button type="button" class="btns lightgraybtn h24px" onclick="cp_del(4); "/>쿠폰삭제</button>
									</c:if>
									</span>
								</td>
							</tr>
							<tr>
								<th>쿠폰 #5 </th>
								<td colspan="3">
									<input type="hidden" id="set_bbs_cp5" name="bbs_cp5" value="<c:out value="${bbsInfo.bbs_cp5 }"/>" />
									<input type="text" id="set_bbs_cp5_nm" name="bbs_cp5_nm" class="admin_input readonly " size="30" readonly value="<c:out value="${bbs_cp5_info.coupon_nm}"/>"/>
									<a href="#;" class="btns graybtn" onclick="getCouponModalOpen('bbs_cp5');" >쿠폰검색</a>
									<span id="cp5_res">
									<c:if test="${not empty bbsInfo.bbs_cp5 }">
									<c:set var="cp5_unit" value="원"/>
									<c:if test="${bbs_cp5_info.coupon_set_st eq 'P' }">
										<c:set var="cp5_unit" value="%"/>
									</c:if>
									<span class="comment">&nbsp;&nbsp;<fmt:formatNumber value="${bbs_cp5_info.coupon_set_price}" type="number"/><c:out value="${cp5_unit }"/> 할인
									 &nbsp; ::: &nbsp; <c:out value="${bbs_cp5_info.coupon_st_dt_ymd }"/> <c:out value="${bbs_cp5_info.coupon_st_dt_hour}"/>:<c:out value="${bbs_cp5_info.coupon_st_dt_minute}"/>
									  ~ <c:out value="${bbs_cp5_info.coupon_ed_dt_ymd }"/> <c:out value="${bbs_cp5_info.coupon_ed_dt_hour}"/>:<c:out value="${bbs_cp5_info.coupon_ed_dt_minute}"/></span>
									&nbsp;&nbsp;&nbsp;&nbsp;<button type="button" class="btns lightgraybtn h24px" onclick="cp_del(5); "/>쿠폰삭제</button>
									</c:if>
									</span>
								</td>
							</tr>
							<%--
							<tr>
								<th>쿠폰 #6 </th>
								<td colspan="3">
									<input type="hidden" id="set_bbs_cp6" name="bbs_cp6" value="<c:out value="${bbsInfo.bbs_cp6 }"/>" />
									<input type="text" id="set_bbs_cp6_nm" name="bbs_cp6_nm" class="admin_input readonly " size="30" readonly value="<c:out value="${bbs_cp6_info.coupon_nm}"/>"/>
									<a href="#;" class="btns graybtn" onclick="getCouponModalOpen('bbs_cp6');" >쿠폰검색</a>
									<span id="cp6_res">
									<c:if test="${not empty bbsInfo.bbs_cp6 }">
									<c:set var="cp6_unit" value="원"/>
									<c:if test="${bbs_cp6_info.coupon_set_st eq 'P' }">
										<c:set var="cp6_unit" value="%"/>
									</c:if>
									<span class="comment">&nbsp;&nbsp;<fmt:formatNumber value="${bbs_cp6_info.coupon_set_price}" type="number"/><c:out value="${cp6_unit }"/> 할인
									 &nbsp; ::: &nbsp; <c:out value="${bbs_cp6_info.coupon_st_dt_ymd }"/> <c:out value="${bbs_cp6_info.coupon_st_dt_hour}"/>:<c:out value="${bbs_cp6_info.coupon_st_dt_minute}"/>
									  ~ <c:out value="${bbs_cp6_info.coupon_ed_dt_ymd }"/> <c:out value="${bbs_cp6_info.coupon_ed_dt_hour}"/>:<c:out value="${bbs_cp6_info.coupon_ed_dt_minute}"/></span>
									 &nbsp;&nbsp;&nbsp;&nbsp;<button type="button" class="btns lightgraybtn h24px" onclick="cp_del(6); "/>쿠폰삭제</button>
									</c:if>
									</span>
								</td>
							</tr>
							<tr>
								<th>쿠폰 #7 </th>
								<td colspan="3">
									<input type="hidden" id="set_bbs_cp7" name="bbs_cp7" value="<c:out value="${bbsInfo.bbs_cp7 }"/>" />
									<input type="text" id="set_bbs_cp7_nm" name="bbs_cp7_nm" class="admin_input readonly " size="30" readonly value="<c:out value="${bbs_cp7_info.coupon_nm}"/>"/>
									<a href="#;" class="btns graybtn" onclick="getCouponModalOpen('bbs_cp7');" >쿠폰검색</a>
									<span id="cp7_res">
									<c:if test="${not empty bbsInfo.bbs_cp7 }">
									<c:set var="cp7_unit" value="원"/>
									<c:if test="${bbs_cp7_info.coupon_set_st eq 'P' }">
										<c:set var="cp7_unit" value="%"/>
									</c:if>
									<span class="comment">&nbsp;&nbsp;<fmt:formatNumber value="${bbs_cp7_info.coupon_set_price}" type="number"/><c:out value="${cp7_unit }"/> 할인
									 &nbsp; ::: &nbsp; <c:out value="${bbs_cp7_info.coupon_st_dt_ymd }"/> <c:out value="${bbs_cp7_info.coupon_st_dt_hour}"/>:<c:out value="${bbs_cp7_info.coupon_st_dt_minute}"/>
									  ~ <c:out value="${bbs_cp7_info.coupon_ed_dt_ymd }"/> <c:out value="${bbs_cp7_info.coupon_ed_dt_hour}"/>:<c:out value="${bbs_cp7_info.coupon_ed_dt_minute}"/></span>
									 &nbsp;&nbsp;&nbsp;&nbsp;<button type="button" class="btns lightgraybtn h24px" onclick="cp_del(7); "/>쿠폰삭제</button>
									</c:if>
									</span>
								</td>
							</tr>
							<tr>
								<th>쿠폰 #8 </th>
								<td colspan="3">
									<input type="hidden" id="set_bbs_cp8" name="bbs_cp8" value="<c:out value="${bbsInfo.bbs_cp8 }"/>" />
									<input type="text" id="set_bbs_cp8_nm" name="bbs_cp8_nm" class="admin_input readonly " size="30" readonly value="<c:out value="${bbs_cp8_info.coupon_nm}"/>"/>
									<a href="#;" class="btns graybtn" onclick="getCouponModalOpen('bbs_cp8');" >쿠폰검색</a>
									<span id="cp8_res">
									<c:if test="${not empty bbsInfo.bbs_cp8 }">
									<c:set var="cp8_unit" value="원"/>
									<c:if test="${bbs_cp8_info.coupon_set_st eq 'P' }">
										<c:set var="cp8_unit" value="%"/>
									</c:if>
									<span class="comment">&nbsp;&nbsp;<fmt:formatNumber value="${bbs_cp8_info.coupon_set_price}" type="number"/><c:out value="${cp8_unit }"/> 할인
									 &nbsp; ::: &nbsp; <c:out value="${bbs_cp8_info.coupon_st_dt_ymd }"/> <c:out value="${bbs_cp8_info.coupon_st_dt_hour}"/>:<c:out value="${bbs_cp8_info.coupon_st_dt_minute}"/>
									  ~ <c:out value="${bbs_cp8_info.coupon_ed_dt_ymd }"/> <c:out value="${bbs_cp8_info.coupon_ed_dt_hour}"/>:<c:out value="${bbs_cp8_info.coupon_ed_dt_minute}"/></span>
									 &nbsp;&nbsp;&nbsp;&nbsp;<button type="button" class="btns lightgraybtn h24px" onclick="cp_del(8); "/>쿠폰삭제</button>
									</c:if>
									</span>
								</td>
							</tr>
							<tr>
								<th>쿠폰 #9 </th>
								<td colspan="3">
									<input type="hidden" id="set_bbs_cp9" name="bbs_cp9" value="<c:out value="${bbsInfo.bbs_cp9 }"/>" />
									<input type="text" id="set_bbs_cp9_nm" name="bbs_cp9_nm" class="admin_input readonly " size="30" readonly value="<c:out value="${bbs_cp9_info.coupon_nm}"/>"/>
									<a href="#;" class="btns graybtn" onclick="getCouponModalOpen('bbs_cp9');" >쿠폰검색</a>
									<span id="cp9_res">
									<c:if test="${not empty bbsInfo.bbs_cp9 }">
									<c:set var="cp9_unit" value="원"/>
									<c:if test="${bbs_cp9_info.coupon_set_st eq 'P' }">
										<c:set var="cp9_unit" value="%"/>
									</c:if>
									<span class="comment">&nbsp;&nbsp;<fmt:formatNumber value="${bbs_cp9_info.coupon_set_price}" type="number"/><c:out value="${cp9_unit }"/> 할인
									 &nbsp; ::: &nbsp; <c:out value="${bbs_cp9_info.coupon_st_dt_ymd }"/> <c:out value="${bbs_cp9_info.coupon_st_dt_hour}"/>:<c:out value="${bbs_cp9_info.coupon_st_dt_minute}"/>
									  ~ <c:out value="${bbs_cp9_info.coupon_ed_dt_ymd }"/> <c:out value="${bbs_cp9_info.coupon_ed_dt_hour}"/>:<c:out value="${bbs_cp9_info.coupon_ed_dt_minute}"/></span>
									 &nbsp;&nbsp;&nbsp;&nbsp;<button type="button" class="btns lightgraybtn h24px" onclick="cp_del(9); "/>쿠폰삭제</button>
									</c:if>
									</span>
								</td>
							</tr>
							<tr>
								<th>쿠폰 #10 </th>
								<td colspan="3">
									<input type="hidden" id="set_bbs_cp10" name="bbs_cp10" value="<c:out value="${bbsInfo.bbs_cp10 }"/>" />
									<input type="text" id="set_bbs_cp10_nm" name="bbs_cp10_nm" class="admin_input readonly " size="30" readonly value="<c:out value="${bbs_cp10_info.coupon_nm}"/>"/>
									<a href="#;" class="btns graybtn" onclick="getCouponModalOpen('bbs_cp10');" >쿠폰검색</a>
									<span id="cp10_res">
									<c:if test="${not empty bbsInfo.bbs_cp10 }">
									<c:set var="cp10_unit" value="원"/>
									<c:if test="${bbs_cp10_info.coupon_set_st eq 'P' }">
										<c:set var="cp10_unit" value="%"/>
									</c:if>
									<span class="comment">&nbsp;&nbsp;<fmt:formatNumber value="${bbs_cp10_info.coupon_set_price}" type="number"/><c:out value="${cp10_unit }"/> 할인
									 &nbsp; ::: &nbsp; <c:out value="${bbs_cp10_info.coupon_st_dt_ymd }"/> <c:out value="${bbs_cp10_info.coupon_st_dt_hour}"/>:<c:out value="${bbs_cp10_info.coupon_st_dt_minute}"/>
									  ~ <c:out value="${bbs_cp10_info.coupon_ed_dt_ymd }"/> <c:out value="${bbs_cp10_info.coupon_ed_dt_hour}"/>:<c:out value="${bbs_cp10_info.coupon_ed_dt_minute}"/></span>
									&nbsp;&nbsp;&nbsp;&nbsp;<button type="button" class="btns lightgraybtn h24px" onclick="cp_del(10); "/>쿠폰삭제</button>
									</c:if>
									</span>
								</td>
							</tr>
							 --%>

							<tr>
								<th>리스트 이미지<br />(1000px x 200px)</th>
								<td colspan="3">
								<input type="file" id="bbs_file1" name="bbs_file1" onchange="file_upload('bbs','bbs_file1');" />
								<input type="hidden" id="bbs_old_file1_id" name="bbs_old_file1_id" value="<c:out value="${bbsInfo.bbs_file1 }"/>" />
								<input type="hidden" id="bbs_file1_id" name="bbs_file1_id"  />
								<c:if test="${not empty bbsInfo.bbs_file1 }">
								<c:choose>
									<c:when test="${bbs_file1_info.file_size/1024/102 > 1 }"><c:set var="file1_size" value="${bbs_file1_info.file_size/1024/1024}"/><c:set var="file1_str" value="MB"/></c:when>
									<c:when test="${bbs_file1_info.file_size/1024 > 1 }"><c:set var="file1_size" value="${bbs_file1_info.file_size/1024}"/><c:set var="file1_str" value="KB"/></c:when>
									<c:otherwise><c:set var="file1_size" value="${bbs_file1_info.file_size}"/><c:set var="file1_str" value="B"/></c:otherwise>
								</c:choose>
								<br>
								<img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${bbsInfo.bbs_file1 }"/>&fileSn=0" width="" />
								<br><input type="checkbox" id="bbs_file1_del" name="bbs_file1_del" class="admin_check" value="Y" /> <label for="bbs_file1_del">삭제</label>
								<%--
								<br>
								<c:out value="${bbs_file1_info.orignl_file_nm }" />&nbsp;&nbsp;
								(<fmt:formatNumber value="${file1_size}" type="number"/><c:out value="${file1_str }"/>)
								 --%>
								</c:if>
								</td>
							</tr>
						</tbody>
					</table>
				</article>
				<!-- } 프로모션/이벤트 내용 -->

				<div class="btnarea mgt30px">
					<ul class="nopm floats">
						<li><a href="/admgr/admgrCustomer/eventList.do?pageIndex=<c:out value="${pageIndex }"/>&searchKey=<c:out value="${searchKey }"/>&searchKeyword=<c:out value="${searchKeyword }"/>" class="btns"><i class="fal fa-list"></i> 목록으로</a></li>
						<li class="fr"><button type="submit" class="btns redbtn"><i class="far fa-save"></i> 저장</button></li>
					</ul>
				</div>
				</form>
			</section>
			<!-- } 고객센터 > 프로모션/이벤트 > 글쓰기 -->
		</div>
		<!-- } 콘텐츠 영역 -->
		
		<script>
			getEditor('bbs_content');
		</script>


<c:import url="/Api/admgrIncludeBottom.do"/>