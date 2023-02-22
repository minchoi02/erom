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
			<h1 class="bigTit">MD PICK</h1>
			<div class="pageComment">
				<div class="comment_ico"><i class="fad fa-comment-alt-smile"></i></div>
				<p>
					메인 첫페이지 MD PICK에 들어가는 상품슬라이드를 등록하는 페이지입니다.<br />
					슬라이드 순서는 새로고침할때마다 랜덤으로 설정됩니다.<br />
				</p>
			</div>
			
			<!-- 프리미엄 노출 > 금주의 서천 { -->
			<section id="mainTopSlide" class="page_content floats">
				<form method="post" action="/admgr/admgrMarketing/weekAction.do" id="mainMarketingForm" onsubmit="return formWeekCheck()">
				<input type="hidden" name="week_seq" value="<c:out value="${week_seq }"/>" />
				<input type="hidden" id="week_use_st" name="week_use_st" value="Y" />
				<input type="hidden" id="return_url" name="return_url" value="" />
				<c:choose>
					<c:when test="${empty week_seq }"><input type="hidden" name="action_mode" value="insert" /></c:when>
					<c:otherwise><input type="hidden" name="action_mode" value="update" /></c:otherwise>
				</c:choose>				
				<div class="lcon lconbox">
					<!-- 금주의 서천 입력 { -->
					<h2 class="h2Tit"><i class="fal fa-window-minimize"></i> 이롬 MD PICK</h2>
					<table class="admin_tbl admin_write_tbl">
						<caption>이롬 MD PICK</caption>
						<colgroup>
							<col />
						</colgroup>
						<tbody>
							<tr>
								<td>
									<p class="comment">* 상품 검색</p>
									<input type="hidden" id="store_category" name="store_category" value="<c:out value="${weekInfo.store_category }"/>" />
									<input type="hidden" id="prod_id" name="prod_id" value="<c:out value="${weekInfo.prod_id }"/>" />
									<input type="text" id="prod_nm" name="prod_nm" class="admin_input readonly " size="35" readonly value="<c:out value="${weekInfo.prod_nm }"/>" />
									<button type="button" class="btns graybtn" onclick="getProductsarchModalOpen('prod_id', 'prod_nm','store_category');" >검색</button>
								</td>
							</tr>
							<tr>
								<td>
									<p class="comment">* 시작일시</p>
									<br>
									<input type="text" id="week_st_dt_ymd" name="week_st_dt_ymd"  value="<c:out value="${weekInfo.week_st_dt_ymd }"/>" class="admin_input datepicker readonly" size="12" placeholder="날짜"  readonly />
									<select id="week_st_dt_hour" name="week_st_dt_hour" class="basic_select w100px"></select>
									<select id="week_st_dt_minute" name="week_st_dt_minute" class="basic_select w100px"></select>
									<script>getHourSelect("week_st_dt_hour", "S", "<c:out value="${weekInfo.week_st_dt_hour }"/>");</script>
									<script>getMinuteSelect("week_st_dt_minute", "S", "<c:out value="${weekInfo.week_st_dt_minute}"/>");</script>
								</td>
							</tr>
							<tr>
								<td>
									<p class="comment">* 종료일시</p>
									<br>
									<input type="text" id="week_ed_dt_ymd" name="week_ed_dt_ymd"  value="<c:out value="${weekInfo.week_ed_dt_ymd }"/>" class="admin_input datepicker readonly" size="12" placeholder="날짜"  readonly/>
									<select id="week_ed_dt_hour" name="week_ed_dt_hour" class="basic_select w100px"></select>
									<select id="week_ed_dt_minute" name="week_ed_dt_minute" class="basic_select w100px"></select>
									<script>getHourSelect("week_ed_dt_hour", "E", "<c:out value="${weekInfo.week_ed_dt_hour }"/>");</script>
									<script>getMinuteSelect("week_ed_dt_minute", "E", "<c:out value="${weekInfo.week_ed_dt_minute }"/>");</script>
								</td>
							</tr>
						</tbody>
					</table>
					<!-- } 금주의 서천 입력 -->

					<div class="btnarea alignRight mgt20px">
						<button type="submit"  class="btns redbtn"><i class="far fa-save"></i> 저장</button>
					</div>
				</div>
				</form>
				
				
				<div class="rcon">
					<!-- 리스트 검색 { -->
					<form id="weekScForm" action="/admgr/admgrMarketing/weekSc.do" method="post">
					<div class="list_search_box">
						<ul class="nopm floats">
							<li>
								<select class="basic_select search_select" id="searchhKey" name="searchhKey" >
									<option value="prod_nm" <c:if test="${searchKey eq 'prod_nm' }">selected</c:if> >상품명</option>
									<option value="store_nm" <c:if test="${searchKey eq 'prod_nm' }">selected</c:if> >업체명</option>
								</select>
							</li>
							<li><input type="text" id="searchhKeyword" name="searchKeyword" class="search_input w300px" placeholder="검색어를 입력하세요."  value="<c:out value="${searchKeyword }"/>" /></li>
							<li><button type="submit" class="search_submit"><i class="fal fa-search"></i> 검색</button></li>
							<li class="fr">전체 : <b><fmt:formatNumber value="${TotalCnt}" type="number"/></b>건</li>
						</ul>
					</div>
					</form>
					<!-- } 리스트 검색 -->

					<!-- 탭 버튼 { -->
<%-- 					<nav id="tab-gnb" class="mgt20px">
						<ul class="nopm floats">
							<li <c:if test="${empty store_category }">class="active"</c:if> ><a href="/admgr/admgrMarketing/week.do?searchKeyword=<c:out value="${searchKeyword }"/>">이롬스토어</a></li>
							
							<li <c:if test="${store_category eq 'CD002004'}">class="active"</c:if> ><a href="/admgr/admgrMarketing/week.do?store_category=CD002004&searchKey=<c:out value="${searchKey }"/>&searchKeyword=<c:out value="${searchKeyword }"/>">이롬스토어</a></li>
						</ul>
					</nav> --%>
					<!-- } 탭 버튼 -->
					
					<!-- 금주의 서천 리스트 { -->
					<table class="admin_tbl admin_list_tbl mgt10px">
						<caption>금주의 이롬 리스트</caption>
						<colgroup>
							<col width="100" />
							<col width="100" />
							<col width="120" />
							<col />
							<col width="100" />
							<col width="100" />
							<col width="130" />
						</colgroup>
						<thead>
							<tr>
								<th>등록일시</th>
								<th>종류</th>
								<th colspan="2">상품</th>
								<th>시작일시</th>
								<th>종료일시</th>
								<th>관리</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="weekList" items="${weekList}" varStatus="status">
							<tr>
								<td class="alignCenter fsize13"><c:out value="${weekList.reg_dt_ymd }"/><br /><c:out value="${weekList.reg_dt_his}"/></td>
								<td class="alignCenter"><c:out value="${weekList.store_category_nm}"/></td>
								<td class="alignCenter"><img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${weekList.prod_img_1}"/>&fileSn=0" width="100"  onerror="this.src='/images/baseScmtour/_noImage.png';"/></td>
								<td><small class="colorGray">[<c:out value="${weekList.store_nm}"/>]</small><br /><c:out value="${weekList.prod_nm}"/></td>
								<td class="alignCenter fsize13"><c:out value="${weekList.week_st_dt_ymd}"/><br /><c:out value="${weekList.week_st_dt_hour}"/>:<c:out value="${weekList.week_st_dt_minute}"/></td>
								<td class="alignCenter fsize13"><c:out value="${weekList.week_ed_dt_ymd}"/><br /><c:out value="${weekList.week_ed_dt_hour}"/>:<c:out value="${weekList.week_ed_dt_minute}"/></td>
								<td class="alignCenter">
									<a href="/admgr/admgrMarketing/week.do?pageIndex=<c:out value="${paginationInfo.currentPageNo }"/>&store_category=<c:out value="${store_category}"/>&searchKey=<c:out value="${searchKey }"/>&searchKeyword=<c:out value="${searchKeyword }"/>&week_seq=<c:out value="${weekList.week_seq }"/>" class="btns bluebtn h24px">수정</a>
									<a href="#" onclick="delweek('<c:out value="${paginationInfo.currentPageNo}"/>','<c:out value="${weekList.week_seq }"/>','<c:out value="${store_category}"/>','<c:out value="${searchKey}"/>','<c:out value="${searchKeyword }"/>');" class="btns lightbluebtn h24px">삭제</a>
								</td>
							</tr>
							</c:forEach>
						</tbody>
					</table>
					<!-- } 금주의 서천 리스트 -->
					
				<div class="pagination">
				<ul>
					<ui:pagination paginationInfo = "${paginationInfo}" type="image" jsFunction="jsPaging" />
				</ul>
				</div>

				</div>
			</section>
			<!-- } 프리미엄 노출 > 금주의 서천 -->
		</div>
		<!-- } 콘텐츠 영역 -->
		
		<script type="text/javascript">
		// 페이징함수
		function jsPaging(pageNo) {
			//console.log(pageNo);
			var searchKey= $.trim($('#searchKey').val());
			var searchKeyword = $.trim($('#searchKeyword').val());
	
			var linkurl = "/admgr/admgrMarketing/week.do?pageIndex="+pageNo;
			if(searchKey) {
				linkurl += "&searchKey="+searchKey;
			}
			if(searchKeyword) {
				linkurl += "&searchKeyword="+searchKeyword;
			}
			//console.log(linkurl)
			location.href = linkurl;
		}
		</script>


<c:import url="/Api/admgrIncludeBottom.do"/>