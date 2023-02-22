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
			<h1 class="bigTit">프로모션/이벤트</h1>
			<div class="pageComment">
				<div class="comment_ico"><i class="fad fa-comment-alt-smile"></i></div>
				<p>
					프로모션/이벤트를 확인하는 페이지입니다.
				</p>
			</div>
			
			<!-- 고객센터 > 프로모션/이벤트 > 리스트 { -->
			<section id="boardList" class="page_content">
				<!-- 리스트 검색 { -->
				<form method="post" action="/admgr/admgrCustomer/eventList.do">
				<div class="list_search_box">
					<ul class="nopm floats">
						<li>
							<select id="searcjKey" name="searchKey" class="basic_select search_select">
								<option value="subcontent" <c:if test="${searchKey eq 'subcontent' }">selected</c:if> >제목+내용</option>
								<option value="subject" <c:if test="${searchKey eq 'subject' }">selected</c:if> >제목</option>
								<option value="content" <c:if test="${searchKey eq 'content' }">selected</c:if> >내용</option>
							</select>
						</li>
						<li><input type="text" id="searchKeyword" name="searchKeyword"  class="search_input w300px" placeholder="검색어를 입력하세요." value="<c:out value="${searchKeyword }"/>" /></li>
						<li><button type="submit" class="search_submit"><i class="fal fa-search"></i> 검색</button></li>
						<li class="fr">전체 : <b><fmt:formatNumber value="${TotalCnt}" type="number"/></b>건</li>
					</ul>
				</div>
				</form>
				<!-- } 리스트 검색 -->

				<!-- 리스트 { -->
				<table class="admin_tbl admin_list_tbl mgt10px">
					<caption>프로모션/이벤트 리스트</caption>
					<colgroup>
						<col width="80" />
						<col />
						<col width="100" />
						<col width="100" />
						<col width="100" />
						<col width="100" />
						<col width="100" />
						<col width="130" />
					</colgroup>
					<thead>
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>등록일시</th>
							<th>시작일시</th>
							<th>종료일시</th>
							<th>조회</th>
							<th>상태</th>
							<th>관리</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="bbsList" items="${bbsList}" varStatus="status">
						<tr>
							<td class="alignCenter"><c:out value="${StartPageNumber-status.count}"/></td>
							<td><a href="javascript:alert('사용자페이지 작업후 제공')" class="colorBlue"><c:out value="${bbsList.bbs_subject}"/>&nbsp;<i class="fal fa-external-link"></i></a></td>
							<td class="alignCenter"><c:out value="${bbsList.reg_dt_ymd }"/><br><c:out value="${bbsListreg_dt_his }"/></td>
							<td class="alignCenter fsize13"><c:out value="${bbsList.bbs_st_dt_ymd }"/><br><c:out value="${bbsList.bbs_st_dt_hour}"/>:<c:out value="${bbsList.bbs_st_dt_minute}"/>:00</td>
							<td class="alignCenter fsize13"><c:out value="${bbsList.bbs_ed_dt_ymd }"/><br><c:out value="${bbsList.bbs_ed_dt_hour}"/>:<c:out value="${bbsList.bbs_ed_dt_minute}"/>:00</td>
							<td class="alignCenter"><fmt:formatNumber value="${bbsList.bbs_hit_cnt}" type="number"/></td>
							<td class="alignCenter">
							<c:choose>
								<c:when test="${bbsList.bbs_use_date eq 'Y' }">
									<c:choose>
										<c:when test="${bbsList.bbs_date_status eq 'E'}"><span class="btns lightgraybtn h24px">종료</span></c:when>
										<c:when test="${bbsList.bbs_date_status eq 'R'}"><span class="btns orangebtn h24px">대기</span></c:when>
										<c:otherwise><span class="btns greenbtn h24px">진행중</span></c:otherwise>
									</c:choose>
								</c:when>
								<c:otherwise><span class="btns redbtn h24px">사용안함</span></c:otherwise>
							</c:choose>
							</td>
							<td class="alignCenter">
								<a href="/admgr/admgrCustomer/eventForm.do?pageIndex=<c:out value="${paginationInfo.currentPageNo }"/>&searchKey=<c:out value="${searchKey}"/>&searchKeyword=<c:out value="${searchKeyword }"/>&bbs_seq=<c:out value="${bbsList.bbs_seq }"/>" class="btns bluebtn h24px">확인</a>
								<a href="#" onclick="delbbs('<c:out value="${paginationInfo.currentPageNo }"/>','<c:out value="${bbs_id }"/>','<c:out value="${bbsList.bbs_seq}"/>','<c:out value="${searchKey}"/>','<c:out value="${searchKeyword}"/>','<c:out value="${store_category}"/>');" class="btns lightbluebtn h24px">삭제</a>
							</td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
				<!-- } 리스트 -->

				<div class="pagination">
				<ul>
					<ui:pagination paginationInfo = "${paginationInfo}" type="image" jsFunction="jsPaging" />
				</ul>
				</div>

				<div class="btnarea alignRight mgt30px">
					<a href="/admgr/admgrCustomer/eventForm.do" class="btns redbtn"><i class="far fa-pencil-alt"></i> 프로모션/이벤트 등록</a>
				</div>
				</form>
			</section>
			<!-- } 고객센터 > 프로모션/이벤트 > 리스트 -->
		</div>
		<!-- } 콘텐츠 영역 -->
		
		<script type="text/javascript">
		// 페이징함수
		function jsPaging(pageNo) {
			//console.log(pageNo);
			var searchKey= $.trim($('#searchKey').val());
			var searchKeyword = $.trim($('#searchKeyword').val());
	
			var linkurl = "/admgr/admgrCustomer/mtmList.do?pageIndex="+pageNo;

			if(searchKey) {
				linkurl += "&searchKey"+searchKey;
			}
			if(searchKeyword) {
				linkurl += "&searchKeyword="+searchKeyword;
			}
			//console.log(linkurl)
			location.href = linkurl;
		}
		</script>


<c:import url="/Api/admgrIncludeBottom.do"/>