<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:import url="/Api/admgrIncludeTop.do"/>
<c:import url="/Api/admgrIncludeLeftMenu.do"/>
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
<c:choose>
	<c:when test="${empty prod_seq}">
		<c:set var="btn_title" value="등록"/>
	</c:when>
	<c:otherwise>
		<c:set var="btn_title" value="수정"/>
	</c:otherwise>
</c:choose>

		<!-- 콘텐츠 영역 { -->
		<div id="content">
			<h1 class="bigTit">추천여행상품 <c:out value="${btn_title }"/></h1>

			<!-- 추천여행상품 > 글쓰기 { -->
				<form method="post" action="/admgr/admgrProduct/<c:out value="${actionUri }"/>.do" onsubmit="return productSaveCheck();" >
				<input type="hidden" id="prod_seq" name="prod_seq" value="<c:out value="${prod_seq }"/>" />
				<input type="hidden" id="pageIndex" name="pageIndex" value="<c:out value="${pageIndex }"/>" />
				<input type="hidden" id="store_category" name="store_category" class="" value="<c:out value="${store_category }"/>" /> 
				<input type="hidden" id="prod_orderby" name="prod_orderby" value="<c:out value="${prod_orderby }"/>" />
				<input type="hidden" id="return_url" name="return_url" value="" />
				<section id="courseWrite" class="page_content">

				<!-- 기본정보 { -->
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
								<th>노출여부</th>
								<td colspan="3">
									<select id="prod_use_st" name="prod_use_st"  class="basic_select w150px">
										<option value="Y" <c:if test="${prodInfo.prod_use_st eq 'Y' }">selected</c:if> >노출중									
										<option value="N" <c:if test="${prodInfo.prod_use_st eq 'N' }">selected</c:if> >노출중지									
									</select>
								</td>
							</tr>
							<tr>
								<th>상품코드 <span class="colorRed">*</span></th>
								<td colspan="3">
									<input type="text" id="prod_id" name="prod_id" value="<c:out value="${prod_id }"/>" class="admin_input readonly" readonly size="30" />
								</td>
							</tr>
							<tr>
								<th>제목 <span class="colorRed">*</span></th>
								<td colspan="3"><input type="text" id="prod_nm" name="prod_nm" value="<c:out value="${prodInfo.prod_nm }"/>" class="admin_input w100"  /></td>
							</tr>
							<tr>
								<th>기본설명</th>
								<td colspan="3">
									<p class="comment">* 상품명 하단에 상품에 대한 추가적인 설명이 필요한 경우에 입력합니다. HTML입력 불가합니다.</p>
									<textarea id="prod_comment" name="prod_comment" class="admin_textarea w100" rows="3"><c:out value="${prodInfo.prod_comment }"/></textarea>
								</td>
							</tr>
							<tr>
								<th>판매 시작일시</th>
								<td>
									<input type="text" id="prod_st_dt_ymd" name="prod_st_dt_ymd" class="admin_input datepicker" size="15" placeholder="날짜" value="<c:out value="${prod_st_dt_ymd }"/>" />
									<select id="prod_st_dt_hour" name="prod_st_dt_hour" class="basic_select w100px"></select>
									<select id="prod_st_dt_minute" name="prod_st_dt_minute" class="basic_select w100px"></select>
									<script>getHourSelect("prod_st_dt_hour", "S", "<c:out value="${prodInfo.prod_st_dt_hour }"/>");</script>
									<script>getMinuteSelect("prod_st_dt_minute", "S", "<c:out value="${prodInfo.prod_st_dt_minute }"/>");</script>									
								</td>
								<th>판매 종료일시</th>
								<td>
									<input type="text" id="prod_ed_dt_ymd" name="prod_ed_dt_ymd" class="admin_input datepicker" size="15" placeholder="날짜" value="<c:out value="${prod_ed_dt_ymd }"/>" />
									<select id="prod_ed_dt_hour" name="prod_ed_dt_hour" class="basic_select w100px"></select>
									<select id="prod_ed_dt_minute" name="prod_ed_dt_minute" class="basic_select w100px"></select>
									<script>getHourSelect("prod_ed_dt_hour", "E", "<c:out value="${prodInfo.prod_ed_dt_hour }"/>");</script>
									<script>getMinuteSelect("prod_ed_dt_minute", "E", "<c:out value="${prodInfo.prod_ed_dt_minute }"/>");</script>									
								</td>
							</tr>
							<tr>
								<th>연령</th>
								<td colspan="3">
									<ul class="nopm floats">
										<li class="mgr20px"><input type="checkbox" id="age1" name="prod_age" class="admin_check"  value="age10" <c:if test="${fn:indexOf(prodInfo.prod_age, 'age10') > -1 }">checked</c:if> /><label for="age1">10대</label></li>
										<li class="mgr20px"><input type="checkbox" id="age2" name="prod_age" class="admin_check"  value="age20" <c:if test="${fn:indexOf(prodInfo.prod_age, 'age20') > -1 }">checked</c:if> /><label for="age2">20대</label></li>
										<li class="mgr20px"><input type="checkbox" id="age3" name="prod_age" class="admin_check"  value="age30" <c:if test="${fn:indexOf(prodInfo.prod_age, 'age30') > -1 }">checked</c:if> /><label for="age3">30대</label></li>
										<li class="mgr20px"><input type="checkbox" id="age4" name="prod_age" class="admin_check"  value="age40" <c:if test="${fn:indexOf(prodInfo.prod_age, 'age40') > -1 }">checked</c:if> /><label for="age4">40대</label></li>
										<li class="mgr20px"><input type="checkbox" id="age5" name="prod_age" class="admin_check"  value="age50" <c:if test="${fn:indexOf(prodInfo.prod_age, 'age50') > -1 }">checked</c:if> /><label for="age5">50대</label></li>
										<li class="mgr20px"><input type="checkbox" id="age6" name="prod_age" class="admin_check"  value="age60" <c:if test="${fn:indexOf(prodInfo.prod_age, 'age60') > -1 }">checked</c:if> /><label for="age6">60대 이상</label></li>
									</ul>
								</td>
							</tr>
							<tr>
								<th>계절</th>
								<td colspan="3">
									<ul class="nopm floats">
										<li class="mgr20px"><input type="checkbox" id="season1" name="prod_season" class="admin_check"  value="spring" <c:if test="${fn:indexOf(prodInfo.prod_season, 'spring') > -1 }">checked</c:if> /><label for="season1">봄</label></li>
										<li class="mgr20px"><input type="checkbox" id="season2" name="prod_season" class="admin_check"  value="summer" <c:if test="${fn:indexOf(prodInfo.prod_season, 'summer') > -1 }">checked</c:if> /><label for="season2">여름</label></li>
										<li class="mgr20px"><input type="checkbox" id="season3" name="prod_season" class="admin_check"  value="fall" <c:if test="${fn:indexOf(prodInfo.prod_season, 'fall') > -1 }">checked</c:if> /><label for="season3">가을</label></li>
										<li class="mgr20px"><input type="checkbox" id="season4" name="prod_season" class="admin_check"  value="winter" <c:if test="${fn:indexOf(prodInfo.prod_season, 'winter') > -1 }">checked</c:if> /><label for="season4">겨울</label></li>
									</ul>
								</td>
							</tr>
							<tr>
								<th>여행유형</th>
								<td colspan="3">
									<ul class="nopm floats">
										<li class="mgr20px"><input type="checkbox" id="ttype1" name="prod_travel_type" class="admin_check"  value="single" <c:if test="${fn:indexOf(prodInfo.prod_travel_type, 'single') > -1 }">checked</c:if> /><label for="ttype1">혼자</label></li>
										<li class="mgr20px"><input type="checkbox" id="ttype2" name="prod_travel_type" class="admin_check"  value="lover" <c:if test="${fn:indexOf(prodInfo.prod_travel_type, 'lover') > -1 }">checked</c:if> /><label for="ttype2">연인</label></li>
										<li class="mgr20px"><input type="checkbox" id="ttype3" name="prod_travel_type" class="admin_check"  value="friend" <c:if test="${fn:indexOf(prodInfo.prod_travel_type, 'friend') > -1 }">checked</c:if> /><label for="ttype3">친구</label></li>
										<li class="mgr20px"><input type="checkbox" id="ttype4" name="prod_travel_type" class="admin_check"  value="child" <c:if test="${fn:indexOf(prodInfo.prod_travel_type, 'child') > -1 }">checked</c:if> /><label for="ttype4">아이</label></li>
										<li class="mgr20px"><input type="checkbox" id="ttype5" name="prod_travel_type" class="admin_check"  value="parent" <c:if test="${fn:indexOf(prodInfo.prod_travel_type, 'parent') > -1 }">checked</c:if> /><label for="ttype5">부모님</label></li>
									</ul>
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
										<c:when test="${prod_movie_info.file_size/1024/102 > 1 }"><c:set var="file_10_size" value="${prod_movie_info.file_size/1024/1024}"/><c:set var="file_10_str" value="MB"/></c:when>
										<c:when test="${prod_movie_info.file_size/1024 > 1 }"><c:set var="file_10_size" value="${prod_movie_info.file_size/1024}"/><c:set var="file_10_str" value="KB"/></c:when>
										<c:otherwise><c:set var="file_10_size" value="${prod_movie_info.file_size}"/><c:set var="file_10_str" value="B"/></c:otherwise>
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
							<tr>
								<th>코스내용</th>
								<td colspan="3">
									<textarea id="prod_content" name="prod_content" class="admin_textarea w100" rows="8" placeholder="※ 상품상세설명을 입력하세요."><c:out value="${prodInfo.prod_content }"/></textarea>
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

				<!-- 코스 { -->
				<article class="page_sortation">
					<h2 class="h2Tit"><i class="fal fa-window-minimize"></i> 코스 <small>(관광/체험, 숙박, 맛집 상품만 검색 가능합니다.)</small></h2>
					<table class="admin_tbl admin_write_tbl">
						<caption>코스</caption>
						<colgroup>
							<col width="200" />
							<col width="400"/>
							<col width="200" />
							<col />
						</colgroup>
						<tbody>
						<tr>
								<th>코스 #1</th>
								<td>
									<input type="hidden" id="prod_recom_pord_id_1" name="prod_recom_1" value="<c:out value="${prodInfo.prod_recom_1 }"/>" />
									<input type="hidden" id="prod_recom_store_category_1" name="" value="" />
									<input type="text" id="prod_recom_prod_nm_1" class="admin_input readonly" size="30" readonly value="<c:out value="${prodRecomInfo_1.prod_nm }"/>" />
									<button type="button" class="btns graybtn" onclick="getProductsarchModalOpen('prod_recom_pord_id_1', 'prod_recom_prod_nm_1','prod_recom_store_category_1');">검색</button>
								</td>
								<td id="recom1_img"><c:if test="${not empty prodInfo.prod_recom_1 }"><img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${prodRecomInfo_1.prod_img_1}"/>&fileSn=0" width="100"  onerror="this.src='/images/baseScmtour/_noImage.png';"/></c:if></td>
								<td id="recom1_nm">
									<c:if test="${not empty prodInfo.prod_recom_1 }">
										<c:out value="${prodRecomInfo_1.prod_nm}"/> - (상점명: <c:out value="${prodRecomInfo_1.store_nm}"/>)<br><br>
									</c:if>
									<button type="button" class="btns graybtn h24px" onclick="recom_del('1');">삭제</button>
								</td>
							</tr>
														<tr>
								<th>코스 #2</th>
								<td>
									<input type="hidden" id="prod_recom_pord_id_2" name="prod_recom_2" value="<c:out value="${prodInfo.prod_recom_2 }"/>" />
									<input type="hidden" id="prod_recom_store_category_2" name="" value="" />
									<input type="text" id="prod_recom_prod_nm_2" class="admin_input readonly" size="30" readonly value="<c:out value="${prodRecomInfo_2.prod_nm }"/>" />
									<button type="button" class="btns graybtn" onclick="getProductsarchModalOpen('prod_recom_pord_id_2', 'prod_recom_prod_nm_2','prod_recom_store_category_2');">검색</button>
								</td>
								<td id="recom2_img"><c:if test="${not empty prodInfo.prod_recom_2 }"><img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${prodRecomInfo_2.prod_img_1}"/>&fileSn=0" width="100"  onerror="this.src='/images/baseScmtour/_noImage.png';"/></c:if></td>
								<td id="recom2_nm">
									<c:if test="${not empty prodInfo.prod_recom_2 }">
										<c:out value="${prodRecomInfo_2.prod_nm}"/> - (상점명: <c:out value="${prodRecomInfo_2.store_nm}"/>)<br><br>
									</c:if>
									<button type="button" class="btns graybtn h24px" onclick="recom_del('2');">삭제</button>
								</td>
							</tr>
							<tr>
								<th>코스 #3</th>
								<td>
									<input type="hidden" id="prod_recom_pord_id_3" name="prod_recom_3" value="<c:out value="${prodInfo.prod_recom_3 }"/>" />
									<input type="hidden" id="prod_recom_store_category_3" name="" value="" />
									<input type="text" id="prod_recom_prod_nm_3" class="admin_input readonly" size="30" readonly value="<c:out value="${prodRecomInfo_3.prod_nm }"/>" />
									<button type="button" class="btns graybtn" onclick="getProductsarchModalOpen('prod_recom_pord_id_3', 'prod_recom_prod_nm_3','prod_recom_store_category_3');">검색</button>
								</td>
								<td id="recom3_img"><c:if test="${not empty prodInfo.prod_recom_3 }"><img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${prodRecomInfo_3.prod_img_1}"/>&fileSn=0" width="100"  onerror="this.src='/images/baseScmtour/_noImage.png';"/></c:if></td>
								<td id="recom3_nm">
									<c:if test="${not empty prodInfo.prod_recom_3 }">
										<c:out value="${prodRecomInfo_3.prod_nm}"/> - (상점명: <c:out value="${prodRecomInfo_3.store_nm}"/>)<br><br>
									</c:if>
									<button type="button" class="btns graybtn h24px" onclick="recom_del('3');">삭제</button>
								</td>
							</tr>
							<tr>
								<th>코스 #4</th>
								<td>
									<input type="hidden" id="prod_recom_pord_id_4" name="prod_recom_4" value="<c:out value="${prodInfo.prod_recom_4 }"/>" />
									<input type="hidden" id="prod_recom_store_category_4" name="" value="" />
									<input type="text" id="prod_recom_prod_nm_4" class="admin_input readonly" size="30" readonly value="<c:out value="${prodRecomInfo_4.prod_nm }"/>" />
									<button type="button" class="btns graybtn" onclick="getProductsarchModalOpen('prod_recom_pord_id_4', 'prod_recom_prod_nm_4','prod_recom_store_category_4');">검색</button>
								</td>
								<td id="recom4_img"><c:if test="${not empty prodInfo.prod_recom_4 }"><img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${prodRecomInfo_4.prod_img_1}"/>&fileSn=0" width="100"  onerror="this.src='/images/baseScmtour/_noImage.png';"/></c:if></td>
								<td id="recom4_nm">
									<c:if test="${not empty prodInfo.prod_recom_4 }">
										<c:out value="${prodRecomInfo_4.prod_nm}"/> - (상점명: <c:out value="${prodRecomInfo_4.store_nm}"/>)<br><br>
									</c:if>
									<button type="button" class="btns graybtn h24px" onclick="recom_del('4');">삭제</button>
								</td>
							</tr>
							<tr>
								<th>코스 #5</th>
								<td>
									<input type="hidden" id="prod_recom_pord_id_5" name="prod_recom_5" value="<c:out value="${prodInfo.prod_recom_5 }"/>" />
									<input type="hidden" id="prod_recom_store_category_5" name="" value="" />
									<input type="text" id="prod_recom_prod_nm_5" class="admin_input readonly" size="30" readonly value="<c:out value="${prodRecomInfo_5.prod_nm }"/>" />
									<button type="button" class="btns graybtn" onclick="getProductsarchModalOpen('prod_recom_pord_id_5', 'prod_recom_prod_nm_5','prod_recom_store_category_5');">검색</button>
								</td>
								<td id="recom5_img"><c:if test="${not empty prodInfo.prod_recom_5 }"><img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${prodRecomInfo_5.prod_img_1}"/>&fileSn=0" width="100"  onerror="this.src='/images/baseScmtour/_noImage.png';"/></c:if></td>
								<td id="recom5_nm">
									<c:if test="${not empty prodInfo.prod_recom_5 }">
										<c:out value="${prodRecomInfo_5.prod_nm}"/> - (상점명: <c:out value="${prodRecomInfo_5.store_nm}"/>)<br><br>
									</c:if>
									<button type="button" class="btns graybtn h24px" onclick="recom_del('5');">삭제</button>
								</td>
							</tr>
							<tr>
								<th>코스 #6</th>
								<td>
									<input type="hidden" id="prod_recom_pord_id_6" name="prod_recom_6" value="<c:out value="${prodInfo.prod_recom_6 }"/>" />
									<input type="hidden" id="prod_recom_store_category_6" name="" value="" />
									<input type="text" id="prod_recom_prod_nm_6" class="admin_input readonly" size="30" readonly value="<c:out value="${prodRecomInfo_6.prod_nm }"/>" />
									<button type="button" class="btns graybtn" onclick="getProductsarchModalOpen('prod_recom_pord_id_6', 'prod_recom_prod_nm_6','prod_recom_store_category_6');">검색</button>
								</td>
								<td id="recom6_img"><c:if test="${not empty prodInfo.prod_recom_6 }"><img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${prodRecomInfo_6.prod_img_1}"/>&fileSn=0" width="100"  onerror="this.src='/images/baseScmtour/_noImage.png';"/></c:if></td>
								<td id="recom6_nm">
									<c:if test="${not empty prodInfo.prod_recom_6 }">
										<c:out value="${prodRecomInfo_6.prod_nm}"/> - (상점명: <c:out value="${prodRecomInfo_6.store_nm}"/>)<br><br>
									</c:if>
									<button type="button" class="btns graybtn h24px" onclick="recom_del('6');">삭제</button>
								</td>
							</tr>
							<tr>
								<th>코스 #7</th>
								<td>
									<input type="hidden" id="prod_recom_pord_id_7" name="prod_recom_7" value="<c:out value="${prodInfo.prod_recom_7 }"/>" />
									<input type="hidden" id="prod_recom_store_category_7" name="" value="" />
									<input type="text" id="prod_recom_prod_nm_7" class="admin_input readonly" size="30" readonly value="<c:out value="${prodRecomInfo_7.prod_nm }"/>" />
									<button type="button" class="btns graybtn" onclick="getProductsarchModalOpen('prod_recom_pord_id_7', 'prod_recom_prod_nm_7','prod_recom_store_category_7');">검색</button>
								</td>
								<td id="recom7_img"><c:if test="${not empty prodInfo.prod_recom_7 }"><img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${prodRecomInfo_7.prod_img_1}"/>&fileSn=0" width="100"  onerror="this.src='/images/baseScmtour/_noImage.png';"/></c:if></td>
								<td id="recom7_nm">
									<c:if test="${not empty prodInfo.prod_recom_7 }">
										<c:out value="${prodRecomInfo_7.prod_nm}"/> - (상점명: <c:out value="${prodRecomInfo_7.store_nm}"/>)<br><br>
									</c:if>
									<button type="button" class="btns graybtn h24px" onclick="recom_del('7');">삭제</button>
								</td>
							</tr>
							<tr>
								<th>코스 #8</th>
								<td>
									<input type="hidden" id="prod_recom_pord_id_8" name="prod_recom_8" value="<c:out value="${prodInfo.prod_recom_8 }"/>" />
									<input type="hidden" id="prod_recom_store_category_8" name="" value="" />
									<input type="text" id="prod_recom_prod_nm_8" class="admin_input readonly" size="30" readonly value="<c:out value="${prodRecomInfo_8.prod_nm }"/>" />
									<button type="button" class="btns graybtn" onclick="getProductsarchModalOpen('prod_recom_pord_id_8', 'prod_recom_prod_nm_8','prod_recom_store_category_8');">검색</button>
								</td>
								<td id="recom8_img"><c:if test="${not empty prodInfo.prod_recom_8 }"><img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${prodRecomInfo_8.prod_img_1}"/>&fileSn=0" width="100"  onerror="this.src='/images/baseScmtour/_noImage.png';"/></c:if></td>
								<td id="recom8_nm">
									<c:if test="${not empty prodInfo.prod_recom_8 }">
										<c:out value="${prodRecomInfo_8.prod_nm}"/> - (상점명: <c:out value="${prodRecomInfo_8.store_nm}"/>)<br><br>
									</c:if>
									<button type="button" class="btns graybtn h24px" onclick="recom_del('8');">삭제</button>
								</td>
							</tr>
							<tr>
								<th>코스 #9</th>
								<td>
									<input type="hidden" id="prod_recom_pord_id_9" name="prod_recom_9" value="<c:out value="${prodInfo.prod_recom_9 }"/>" />
									<input type="hidden" id="prod_recom_store_category_9" name="" value="" />
									<input type="text" id="prod_recom_prod_nm_9" class="admin_input readonly" size="30" readonly value="<c:out value="${prodRecomInfo_9.prod_nm }"/>" />
									<button type="button" class="btns graybtn" onclick="getProductsarchModalOpen('prod_recom_pord_id_9', 'prod_recom_prod_nm_9','prod_recom_store_category_9');">검색</button>
								</td>
								<td id="recom9_img"><c:if test="${not empty prodInfo.prod_recom_9 }"><img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${prodRecomInfo_9.prod_img_1}"/>&fileSn=0" width="100"  onerror="this.src='/images/baseScmtour/_noImage.png';"/></c:if></td>
								<td id="recom9_nm">
									<c:if test="${not empty prodInfo.prod_recom_9 }">
										<c:out value="${prodRecomInfo_9.prod_nm}"/> - (상점명: <c:out value="${prodRecomInfo_9.store_nm}"/>)<br><br>
									</c:if>
									<button type="button" class="btns graybtn h24px" onclick="recom_del('9');">삭제</button>
								</td>
							</tr>
							<tr>
								<th>코스 #10</th>
								<td>
									<input type="hidden" id="prod_recom_pord_id_10" name="prod_recom_10" value="<c:out value="${prodInfo.prod_recom_10 }"/>" />
									<input type="hidden" id="prod_recom_store_category_10" name="" value="" />
									<input type="text" id="prod_recom_prod_nm_10" class="admin_input readonly" size="30" readonly value="<c:out value="${prodRecomInfo_10.prod_nm }"/>" />
									<button type="button" class="btns graybtn" onclick="getProductsarchModalOpen('prod_recom_pord_id_10', 'prod_recom_prod_nm_10','prod_recom_store_category_10');">검색</button>
								</td>
								<td id="recom10_img"><c:if test="${not empty prodInfo.prod_recom_10 }"><img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${prodRecomInfo_10.prod_img_1}"/>&fileSn=0" width="100"  onerror="this.src='/images/baseScmtour/_noImage.png';"/></c:if></td>
								<td id="recom10_nm">
									<c:if test="${not empty prodInfo.prod_recom_10 }">
										<c:out value="${prodRecomInfo_10.prod_nm}"/> - (상점명: <c:out value="${prodRecomInfo_10.store_nm}"/>)<br><br>
									</c:if>
									<button type="button" class="btns graybtn h24px" onclick="recom_del('10');">삭제</button>
								</td>
							</tr>
						</tbody>
					</table>
				</article>
				<!-- } 코스 -->

				<div class="btnarea alignRight mgt30px">
					<ul class="nopm floats">
						<li><a href="/admgr/admgrProduct/productList.do?pageIndex=<c:out value="${pageIndex }"/>&store_category=<c:out value="${store_category }"/>&searchKey=<c:out value="${searchKey }"/>&searchKeyword=<c:out value="${searchKey }"/>" class="btns "><i class="fal fa-list"></i> 목록으로</a></li>
						<li class="fr"><button type="submit" class="btns redbtn"><i class="far fa-save"></i> 저장</button></li>
					</ul>
				</div>
			</section>
			<!-- } 추천여행상품 > 글쓰기 -->
			</form>
		</div>
		<!-- } 콘텐츠 영역 -->

		<script>
			getEditor('prod_content');
		</script>

<c:import url="/Api/admgrIncludeBottom.do"/>