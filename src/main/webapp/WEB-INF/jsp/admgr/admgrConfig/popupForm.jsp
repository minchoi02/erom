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
			<h1 class="bigTit">팝업관리</h1>

			<!-- 환경설정 > 팝업관리 > 글쓰기 { -->
			<form action="/admgr/admgrConfig/popupAction.do" method="post" id="popupForm" name="popupForm" onsubmit="return popupActionCheck();" >
			<input type="hidden" name="popup_seq" value="<c:out value="${popup_seq }"/>" />
			<input type="hidden" id="return_url" name="return_url" value="" />
			<section id="popupWrite" class="page_content">
				<!-- 팝업입력 { -->
				<article class="page_sortation">
					<h2 class="h2Tit"><i class="fal fa-window-minimize"></i> 팝업
					 <c:choose>
							<c:when test="${not empty popup_seq }">수정</c:when>
							<c:otherwise>작성</c:otherwise>
						</c:choose>
					 </h2>
					<table class="admin_tbl admin_write_tbl">
						<caption>팝업 작성</caption>
						<colgroup>
							<col width="200" />
							<col />
							<col width="200" />
							<col />
						</colgroup>
						<tbody>
							<c:choose>
							<c:when test="${not empty popup_seq }">
							<tr>
								<th>팝업사용</th>
								<td><input type="checkbox" id="popup_use_st" name="popup_use_st"  value="Y" <c:if test="${popupInfo.popup_use_st eq 'Y'}">checked</c:if> class="admin_check" /><label for="popup_use_st">사용</label></td>
								<th>조회수</th>
								<td><fmt:formatNumber value="${popupInfo.popup_hit_cnt }" type="number"/> 건</td>
							</tr>
							</c:when>
							<c:otherwise>
							<tr>
								<th>팝업사용</th>
								<td colspan="3"><input type="checkbox" id="popup_use_st" name="popup_use_st"  value="Y" <c:if test="${popupInfo.popup_use_st eq 'Y'}">checked</c:if> class="admin_check" /><label for="popup_use_st">사용</label></td>
							</tr>
							</c:otherwise>
							</c:choose>							
							<tr>
								<th>팝업제목 <span class="colorRed">*</span></th>
								<td colspan="3"><input type="text" id="popup_nm" name="popup_nm"  value="<c:out value="${popupInfo.popup_nm }"/>" class="admin_input w100" /></td>
							</tr>
							<tr>
								<th>팝업위치 <span class="colorRed">*</span></th>
								<td>
									상단: <input type="text" id="popup_top" name="popup_top"  value="<c:out value="${popupInfo.popup_top }"/>" class="admin_input w50px" /> px, 
									&nbsp;&nbsp;&nbsp;
									왼쪽: <input type="text" id="popup_left" name="popup_left"  value="<c:out value="${popupInfo.popup_left }"/>" class="admin_input w50px" /> px
								</td>
								<th>팝업크기 <span class="colorRed">*</span></th>
								<td>
									가로: <input type="text" id="popup_width" name="popup_width"  value="<c:out value="${popupInfo.popup_width }"/>" class="admin_input w50px" /> px, 
									&nbsp;&nbsp;&nbsp;
									세로: <input type="text" id="popup_height" name="popup_height"  value="<c:out value="${popupInfo.popup_height }"/>" class="admin_input w50px" /> px
								</td>
							</tr>
							<tr>
								<th>시작일시 <span class="colorRed">*</span></th>
								<td>
									<input type="text" id="popup_st_dt_ymd" name="popup_st_dt_ymd"  value="<c:out value="${popupInfo.popup_st_dt_ymd }"/>" class="admin_input datepicker" size="18" placeholder="날짜"  readonly />
									<select id="popup_st_dt_hour" name="popup_st_dt_hour" class="basic_select w100px"></select>
									<select id="popup_st_dt_minute" name="popup_st_dt_minute" class="basic_select w100px"></select>
									<script>getHourSelect("popup_st_dt_hour", "S", "<c:out value="${popupInfo.popup_st_dt_hour }"/>");</script>
									<script>getMinuteSelect("popup_st_dt_minute", "S", "<c:out value="${popupInfo.popup_st_dt_minute}"/>");</script>
								</td>
								<th>종료일시 <span class="colorRed">*</span></th>
								<td>
									<input type="text" id="popup_ed_dt_ymd" name="popup_ed_dt_ymd"  value="<c:out value="${popupInfo.popup_ed_dt_ymd }"/>" class="admin_input datepicker" size="18" placeholder="날짜"  readonly/>
									<select id="popup_ed_dt_hour" name="popup_ed_dt_hour" class="basic_select w100px"></select>
									<select id="popup_ed_dt_minute" name="popup_ed_dt_minute" class="basic_select w100px"></select>
									<script>getHourSelect("popup_ed_dt_hour", "E", "<c:out value="${popupInfo.popup_ed_dt_hour }"/>");</script>
									<script>getMinuteSelect("popup_ed_dt_minute", "E", "<c:out value="${popupInfo.popup_ed_dt_minute }"/>");</script>
								</td>
							</tr>
							<tr>
								<th>내용</th>
								<td colspan="3"><textarea id="popup_content" name="popup_content" class="admin_textarea w100" rows="10" placeholder="내용을 입력하세요."><c:out value="${popupInfo.popup_content }"/></textarea></td>
							</tr>
							<c:if test="${not empty popup_seq }">
							<tr>
								<th>등록일</th>
								<td><c:out value="${popupInfo.reg_dt}"/></td>
								<th>수정일</th>
								<td><c:out value="${popupInfo.mod_dt}"/></td>
							</tr>
							</c:if>
						</tbody>
					</table>
				</article>
				<!-- } 팝업입력 -->

				<div class="btnarea alignRight mgt30px">
					<button type="submit" class="btns redbtn"><i class="far fa-save"></i> 저장</button>
				</div>
			</section>
			</form>
			<!-- } 환경설정 > 팝업관리 > 글쓰기 -->
		</div>
		<!-- } 콘텐츠 영역 -->

		<script>
			getEditor('popup_content');
		</script>

<c:import url="/Api/admgrIncludeBottom.do"/>