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
			<h1 class="bigTit">메인 상단 슬라이드</h1>
			<div class="pageComment">
				<div class="comment_ico"><i class="fad fa-comment-alt-smile"></i></div>
				<p>
					메인 상단의 슬라이드 영역을 관리하는 페이지입니다.<br />
					슬라이드 순서는 새로고침할때마다 랜덤으로 설정됩니다.<br />
				</p>
			</div>
			
			<!-- 프리미엄 노출 > 메인 상단 슬라이드 { -->
			<section id="mainTopSlide" class="page_content floats">
				<form method="post" action="/admgr/admgrMarketing/mainSlideAction.do" id="mainMarketingForm" enctype="multipart/form-data" onsubmit="return formSlidCheckt()">
				<input type="hidden" name="fslide_seq" value="<c:out value="${slide_seq }"/>" />
				<input type="hidden" id="slide_use_st" name="fslide_use_st" value="Y" />
				<input type="hidden" id="return_url" name="freturn_url" value="" />
				<c:choose>
					<c:when test="${empty slide_seq }"><input type="hidden" name="faction_mode" value="insert" /></c:when>
					<c:otherwise><input type="hidden" name="faction_mode" value="update" /></c:otherwise>
				</c:choose>				
				<div class="lcon lconbox">
					<!-- 메인 상단 슬라이드 입력 { -->
					<h2 class="h2Tit"><i class="fal fa-window-minimize"></i> 메인 상단 슬라이드 입력</h2>
					<table class="admin_tbl admin_write_tbl">
						<caption>메인 상단 슬라이드 입력</caption>
						<colgroup>
							<col />
						</colgroup>
						<tbody>
							<tr>
								<td>
									<p class="comment">* 제목</p>
									<input type="text" id="slide_subject" name="fslide_subject" class="admin_input w100" value="<c:out value="${slideInfo.slide_subject }"/>" />
								</td>
							</tr>
							<tr>
								<td>
									<p class="comment">* 링크</p>
									<input type="text" id="slide_link" name="fslide_link" class="admin_input w100" value="<c:out value="${slideInfo.slide_link}"/>"/>
								</td>
							</tr>
							<tr>
								<td>
									<p class="comment">* 대상브라우져</p>
									<select id="slide_target" name="fslide_target" class="basic_select w100px">
										<option value="_self" <c:if test="${empty slideInfo.slide_target || slideInfo.slide_target eq '_self'}">selected</c:if> >현재창</option>
										<option value="_blank" <c:if test="${slideInfo.slide_target eq '_blank'}">selected</c:if> >새창</option>
									</select>
								</td>
							</tr>
							<tr>
								<td>
									<p class="comment">* 시작일시</p>
									<br>
									<input type="text" id="slide_st_dt_ymd" name="fslide_st_dt_ymd"  value="<c:out value="${slideInfo.slide_st_dt_ymd }"/>" class="admin_input datepicker" size="12" placeholder="날짜"  readonly />
									<select id="slide_st_dt_hour" name="fslide_st_dt_hour" class="basic_select w100px"></select>
									<select id="slide_st_dt_minute" name="fslide_st_dt_minute" class="basic_select w100px"></select>
									<script>getHourSelect("slide_st_dt_hour", "S", "<c:out value="${slideInfo.slide_st_dt_hour }"/>");</script>
									<script>getMinuteSelect("slide_st_dt_minute", "S", "<c:out value="${slideInfo.slide_st_dt_minute}"/>");</script>
								</td>
							</tr>
							<tr>
								<td>
									<p class="comment">* 종료일시</p>
									<br>
									<input type="text" id="slide_ed_dt_ymd" name="fslide_ed_dt_ymd"  value="<c:out value="${slideInfo.slide_ed_dt_ymd }"/>" class="admin_input datepicker" size="12" placeholder="날짜"  readonly/>
									<select id="slide_ed_dt_hour" name="fslide_ed_dt_hour" class="basic_select w100px"></select>
									<select id="slide_ed_dt_minute" name="fslide_ed_dt_minute" class="basic_select w100px"></select>
									<script>getHourSelect("slide_ed_dt_hour", "E", "<c:out value="${slideInfo.slide_ed_dt_hour }"/>");</script>
									<script>getMinuteSelect("slide_ed_dt_minute", "E", "<c:out value="${slideInfo.slide_ed_dt_minute }"/>");</script>
								</td>
							</tr>
							<tr>
								<td>
									<p class="comment">* 이미지파일 (1000px * 1200px)</p>
									<input type="file" id="slide_img" name="fslide_img" />
									<c:if test="${not empty slideInfo.slide_img }">
									<br><img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${slideInfo.slide_img}"/>&fileSn=0" style="width:90%;" />
									</c:if>
								</td>
							</tr>
						</tbody>
					</table>
					<!-- } 메인 상단 슬라이드 입력 -->

					<div class="btnarea alignRight mgt20px">
						<button type="submit"  class="btns redbtn"><i class="far fa-save"></i> 저장</button>
					</div>
				</div>
				</form>
				
				
				<div class="rcon">
					<!-- 리스트 검색 { -->
					<form id=mainSlideForm" action="/admgr/admgrMarketing/mainSlide.do" method="post">
					<div class="list_search_box">
						<ul class="nopm floats">
							<li><input type="text" id="searchhKeyword" name="searchKeyword" class="search_input w300px" placeholder="검색어를 입력하세요."  value="<c:out value="${searchKeyword }"/>" /></li>
							<li><button type="submit" class="search_submit"><i class="fal fa-search"></i> 검색</button></li>
							<li class="fr">전체 : <b><fmt:formatNumber value="${TotalCnt}" type="number"/></b>건</li>
						</ul>
					</div>
					</form>
					<!-- } 리스트 검색 -->
					
					<!-- 메인 상단 슬라이드 리스트 { -->
					<table class="admin_tbl admin_list_tbl mgt10px">
						<caption>메인 상단 슬라이드 리스트</caption>
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
							<c:forEach var="slideList" items="${slideList}" varStatus="status">
							<tr>
								<td class="alignCenter fsize13"><c:out value="${slideList.reg_dt_ymd }"/><br /><c:out value="${slideList.reg_dt_his}"/></td>
								<td class="alignCenter"><img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${slideList.slide_img}"/>&fileSn=0" width="100"  onerror="this.src='/images/baseScmtour/_noImage.png';"/></td>
								<td><c:out value="${slideList.slide_subject}"/></td>
								<td>
									설정 - [<c:choose>
										<c:when test="${slideList.slide_target eq '_blank' }">새창</c:when>
										<c:otherwise>현재창</c:otherwise>
									</c:choose>
									]<br> 
									<a href="<c:out value="${slideList.slide_link}"/>" target="_blank" class="colorBlue"><c:out value="${slideList.slide_link}"/></a>
								</td>
								<td class="alignCenter fsize13"><c:out value="${slideList.slide_st_dt_ymd }"/><br /><c:out value="${slideList.slide_st_dt_hour}"/>:<c:out value="${slideList.slide_st_dt_minute}"/></td>
								<td class="alignCenter fsize13"><c:out value="${slideList.slide_ed_dt_ymd }"/><br /><c:out value="${slideList.slide_ed_dt_hour}"/>:<c:out value="${slideList.slide_ed_dt_minute}"/></td>
								<td class="alignCenter">
									<a href="/admgr/admgrMarketing/mainSlide.do?pageIndex=<c:out value="${paginationInfo.currentPageNo }"/>&searchKeyword=<c:out value="${searchKeyword }"/>&slide_seq=<c:out value="${slideList.slide_seq }"/>" class="btns bluebtn h24px">수정</a>
									<a href="#" onclick="delslide('<c:out value="${paginationInfo.currentPageNo}"/>','<c:out value="${slideList.slide_seq }"/>','<c:out value="${searchKeyword }"/>');" class="btns lightbluebtn h24px">삭제</a>
								</td>
							</tr>
							</c:forEach>
						</tbody>
					</table>
					<!-- } 메인 상단 슬라이드 리스트 -->
					
                <div class="pagination">
                <ul>
					<ui:pagination paginationInfo = "${paginationInfo}" type="image" jsFunction="jsPaging" />
				</ul>
				</div>

				</div>
			</section>
			<!-- } 프리미엄 노출 > 메인 상단 슬라이드 -->
		</div>
		<!-- } 콘텐츠 영역 -->
		
		<script type="text/javascript">
		// 페이징함수
		function jsPaging(pageNo) {
			//console.log(pageNo);
			var searchKeyword = $.trim($('#searchKeyword').val());
	
			var linkurl = "/admgr/admgrMarketing/Slide.do?pageIndex="+pageNo;
			
			if(searchKeyword) {
				linkurl += "&searchKeyword="+searchKeyword;
			}
			//console.log(linkurl)
			location.href = linkurl;
		}
		</script>


<c:import url="/Api/admgrIncludeBottom.do"/>