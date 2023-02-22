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
			<h1 class="bigTit">배너 관리</h1>
			<div class="pageComment">
				<div class="comment_ico"><i class="fad fa-comment-alt-smile"></i></div>
				<p>
					가로 배너 영역을 관리하는 페이지입니다.<br />
					첫번째 배너는 메인페이지 상단에, 두번째 배너는 홈페이지 곳곳에 존재합니다.
				</p>
			</div>
			
			<!-- 프리미엄 노출 > 이벤트 배너 { -->
			<section id="mainTopSlide" class="page_content floats">
				<form method="post" action="/admgr/admgrMarketing/bannerAction.do" id="mainMarketingForm" enctype="multipart/form-data" onsubmit="return formBannerCheck()">
				<input type="hidden" name="fbanner_seq" value="<c:out value="${banner_seq }"/>" />
				<input type="hidden" id="banner_use_st" name="fbanner_use_st" value="Y" />
				<input type="hidden" id="return_url" name="freturn_url" value="" />
				<input type="hidden" id="zone" name="zone" value="<c:out value="${zone}"/>"  />
				<c:choose>
					<c:when test="${empty banner_seq }"><input type="hidden" name="faction_mode" value="insert" /></c:when>
					<c:otherwise><input type="hidden" name="faction_mode" value="update" /></c:otherwise>
				</c:choose>	
				<div class="lcon lconbox">
					<!-- 이벤트 배너 입력 { -->
					<h2 class="h2Tit"><i class="fal fa-window-minimize"></i>배너 등록</h2>
					<table class="admin_tbl admin_write_tbl">
						<caption> 배너 입력</caption>
						<colgroup>
							<col />
						</colgroup>
						<tbody>
							<tr>
								<td>
									<p class="comment">* 구분</p>
									<ul class="nopm floats">
										<li class="mgr20px"><input type="checkbox" id="banner_zone_1" name="fbanner_zone_1" class="admin_check" value="Y" <c:if test="${bannerInfo.banner_zone_1 eq 'Y' }">checked</c:if> /><label for="banner_zone_1">메인 첫번째</label></li>
										<li class="mgr20px"><input type="checkbox" id="banner_zone_2" name="fbanner_zone_2" class="admin_check" value="Y" <c:if test="${bannerInfo.banner_zone_2 eq 'Y' }">checked</c:if>  /><label for="banner_zone_2">메인 두번째</label></li>
										<li class="mgr20px"><input type="checkbox" id="banner_zone_3" name="fbanner_zone_3" class="admin_check" value="Y" <c:if test="${bannerInfo.banner_zone_3 eq 'Y' }">checked</c:if> /><label for="banner_zone_3">더보기</label></li>
									</ul>
								</td>
							</tr>
							<tr>
								<td>
									<p class="comment">* 제목</p>
									<input type="text" id="banner_subject" name="fbanner_subject" class="admin_input w100" value="<c:out value="${bannerInfo.banner_subject }"/>" v/>
								</td>
							</tr>
							<tr>
								<td>
									<p class="comment">* 링크</p>
									<input type="text" id="banner_link" name="fbanner_link" class="admin_input w100" value="<c:out value="${bannerInfo.banner_link}"/>" />
								</td>
							</tr>
							<tr>
								<td>
									<p class="comment">* 대상브라우져</p>
									<select id="banner_target" name="fbanner_target" class="basic_select w100px">
										<option value="_self" <c:if test="${empty bannerInfo.banner_target || bannerInfo.banner_target eq '_self'}">selected</c:if> >현재창</option>
										<option value="_blank" <c:if test="${bannerInfo.banner_target eq '_blank'}">selected</c:if> >새창</option>
									</select>
								</td>
							</tr>
							<tr>
								<td>
									<p class="comment">* 시작일시</p>
									<br>
									<input type="text" id="banner_st_dt_ymd" name="fbanner_st_dt_ymd"  value="<c:out value="${bannerInfo.banner_st_dt_ymd }"/>" class="admin_input datepicker" size="12" placeholder="날짜"  readonly />
									<select id="banner_st_dt_hour" name="fbanner_st_dt_hour" class="basic_select w100px"></select>
									<select id="banner_st_dt_minute" name="fbanner_st_dt_minute" class="basic_select w100px"></select>
									<script>getHourSelect("banner_st_dt_hour", "S", "<c:out value="${bannerInfo.banner_st_dt_hour }"/>");</script>
									<script>getMinuteSelect("banner_st_dt_minute", "S", "<c:out value="${bannerInfo.banner_st_dt_minute}"/>");</script>
								</td>
							</tr>
							<tr>
								<td>
									<p class="comment">* 종료일시</p>
									<br>
									<input type="text" id="banner_ed_dt_ymd" name="fbanner_ed_dt_ymd"  value="<c:out value="${bannerInfo.banner_ed_dt_ymd }"/>" class="admin_input datepicker" size="12" placeholder="날짜"  readonly/>
									<select id="banner_ed_dt_hour" name="fbanner_ed_dt_hour" class="basic_select w100px"></select>
									<select id="banner_ed_dt_minute" name="fbanner_ed_dt_minute" class="basic_select w100px"></select>
									<script>getHourSelect("banner_ed_dt_hour", "E", "<c:out value="${bannerInfo.banner_ed_dt_hour }"/>");</script>
									<script>getMinuteSelect("banner_ed_dt_minute", "E", "<c:out value="${bannerInfo.banner_ed_dt_minute }"/>");</script>
								</td>
							</tr>
							<tr>
								<td>
									<p class="comment">* 이미지파일 (크기는 홈페이지에서 보고 맞춰야 됩니다.)</p>
									<input type="file" id="banner_img" name="fbanner_img" />
									<c:if test="${not empty bannerInfo.banner_img }">
									<br><img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${bannerInfo.banner_img}"/>&fileSn=0" style="width:90%;" />
									</c:if>
									
								</td>
							</tr>
						</tbody>
					</table>
					<!-- } 이벤트 배너 입력 -->

					<div class="btnarea alignRight mgt20px">
						<button type="submit"  class="btns redbtn"><i class="far fa-save"></i> 저장</button>
					</div>
				</div>
				</form>
				
				
				<div class="rcon">
					<!-- 리스트 검색 { -->
					<form id="bannerForm" action="/admgr/admgrMarketing/banner.do" method="post">
					<div class="list_search_box">
						<ul class="nopm floats">
							<li><input type="text" id="searchhKeyword" name="searchKeyword" class="search_input w300px" placeholder="검색어를 입력하세요."  value="<c:out value="${searchKeyword }"/>" /></li>
							<li><button type="submit" class="search_submit"><i class="fal fa-search"></i> 검색</button></li>
							<li class="fr">전체 : <b><fmt:formatNumber value="${TotalCnt}" type="number"/></b>건</li>
						</ul>
					</div>
					</form>
					<!-- } 리스트 검색 -->

					<!-- 탭 버튼 { -->
					<nav id="tab-gnb" class="mgt20px">
						<ul class="nopm floats">
							<li <c:if test="${empty zone }">class="active"</c:if> ><a href="/admgr/admgrMarketing/banner.do">전체</a></li>
							<li <c:if test="${zone eq '1'}">class="active"</c:if> ><a href="/admgr/admgrMarketing/banner.do?zone=1">메인 첫번째</a></li>
							<li <c:if test="${zone eq '2'}">class="active"</c:if>><a href="/admgr/admgrMarketing/banner.do?zone=2">메인 두번째</a></li>
							<li <c:if test="${zone eq '3'}">class="active"</c:if>><a href="/admgr/admgrMarketing/banner.do?zone=3">더보기</a></li>
						</ul>
					</nav>
					<!-- } 탭 버튼 -->
					
					<!-- 이벤트 배너 리스트 { -->
					<table class="admin_tbl admin_list_tbl mgt10px">
						<caption>이벤트 배너 리스트</caption>
						<colgroup>
							<col width="100" />
							<col width="120" />
							<col />
							<col />
							<col width="100" />
							<col width="100" />
							<col width="130" />
						</colgroup>
						<thead>
							<tr>
								<th>등록일시</th>
								<th colspan="2">제목</th>
								<th>링크</th>
								<th>시작일시</th>
								<th>종료일시</th>
								<th>관리</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="bannerList" items="${bannerList}" varStatus="status">
							<tr>
								<td class="alignCenter fsize13"><c:out value="${bannerList.reg_dt_ymd }"/><br /><c:out value="${bannerList.reg_dt_his}"/></td>
								<td class="alignCenter"><img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${bannerList.banner_img}"/>&fileSn=0" width="100"  onerror="this.src='/images/baseScmtour/_noImage.png';"/></td>
								<td>
									<small class="colorGray">
										<c:if test="${bannerList.banner_zone_1 eq 'Y' }">메인 첫번째, &nbsp;</c:if>
										<c:if test="${bannerList.banner_zone_2 eq 'Y' }">메인 두번째, &nbsp;</c:if>
										<c:if test="${bannerList.banner_zone_3 eq 'Y' }">더보기</c:if>
									</small><br />
									<c:out value="${bannerList.banner_subject}"/>
								</td>
								<td>
									설정 - [<c:choose>
										<c:when test="${bannerList.slide_target eq '_blank' }">새창</c:when>
										<c:otherwise>현재창</c:otherwise>
									</c:choose>
									]<br> 
									<a href="<c:out value="${bannerList.banner_link}"/>" target="_blank" class="colorBlue"><c:out value="${bannerList.banner_link}"/></a>
								</td>
								<td class="alignCenter fsize13"><c:out value="${bannerList.banner_st_dt_ymd }"/><br /><c:out value="${bannerList.banner_st_dt_hour}"/>:<c:out value="${bannerList.banner_st_dt_minute}"/></td>
								<td class="alignCenter fsize13"><c:out value="${bannerList.banner_ed_dt_ymd }"/><br /><c:out value="${bannerList.banner_ed_dt_hour}"/>:<c:out value="${bannerList.banner_ed_dt_minute}"/></td>
								<td class="alignCenter">
									<a href="/admgr/admgrMarketing/banner.do?pageIndex=<c:out value="${paginationInfo.currentPageNo }"/>&zone=<c:out value="${zone}"/>&searchKeyword=<c:out value="${searchKeyword }"/>&banner_seq=<c:out value="${bannerList.banner_seq }"/>" class="btns bluebtn h24px">수정</a>
									<a href="#" onclick="delbanner('<c:out value="${paginationInfo.currentPageNo}"/>','<c:out value="${bannerList.banner_seq }"/>','<c:out value="${zone}"/>','<c:out value="${searchKeyword }"/>');" class="btns lightbluebtn h24px">삭제</a>
								</td>
							</tr>
							</c:forEach>
						</tbody>
					</table>
					<!-- } 이벤트 배너 리스트 -->

				<div class="pagination">
				<ul>
					<ui:pagination paginationInfo = "${paginationInfo}" type="image" jsFunction="jsPaging" />
				</ul>
				</div>
				</div>
			</section>
			<!-- } 프리미엄 노출 > 이벤트 배너 -->
		</div>
		<!-- } 콘텐츠 영역 -->
		
		<script type="text/javascript">
		// 페이징함수
		function jsPaging(pageNo) {
			//console.log(pageNo);
			var searchKeyword = $.trim($('#searchKeyword').val());
			var zone = $.trim($('#zone').val());
	
			var linkurl = "/admgr/admgrMarketing/banner.do?pageIndex="+pageNo;
			
			if(zone) {
				linkurl += "&zone="+zone;
			}
			if(searchKeyword) {
				linkurl += "&searchKeyword="+searchKeyword;
			}
			//console.log(linkurl)
			location.href = linkurl;
		}
		</script>
		
<c:import url="/Api/admgrIncludeBottom.do"/>