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
			<div class="pageComment">
				<div class="comment_ico"><i class="fad fa-comment-alt-smile"></i></div>
				<p>
					서천끌림 메인페이지의 팝업을 관리하는 페이지입니다.<br />
					상태는 시작일시와 종료일시를 조정하여 관리하세요.
				</p>
			</div>

			<!-- 환경설정 > 팝업관리 > 리스트 { -->
			<section id="popupList" class="page_content">
				<!-- 리스트 검색 { -->
				<form action="/admgr/admgrConfig/popupList.do" method="post" id="popupForm" name="popupForm" onsubmit="return popupCheck();" >
				<div class="list_search_box">
					<ul class="nopm floats">
						<li><input type="text" id="searchKeyword" name="searchKeyword" class="search_input w300px" placeholder="검색어를 입력하세요." /></li>
						<li><button type="submit" class="search_submit"><i class="fal fa-search"></i> 검색</button></li>
						<li class="fr">전체 : <b><fmt:formatNumber value="${paginationInfo.totalRecordCount }" type="number"/></b>건</li>
					</ul>
				</div>
				</form>
				<!-- } 리스트 검색 -->

				<!-- 리스트 { -->
				<table class="admin_tbl admin_list_tbl mgt10px">
					<caption>팝업리스트</caption>
					<colgroup>
						<col width="80" />
						<col />
						<col width="150" />
						<col width="150" />
						<col width="100" />
						<col width="100" />
						<col width="130" />
					</colgroup>
					<thead>
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>시작일시</th>
							<th>종료일시</th>
							<th>조회수</th>
							<th>상태</th>
							<th>관리</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="popupList" items="${popupList}" varStatus="status">
						<tr>
							<td class="alignCenter"><c:out value="${StartPageNumber-status.count}"/></td>
							<td><c:out value="${popupList.popup_nm }"/></td>
							<td class="alignCenter"><c:out value="${popupList.popup_st_dt }"/></td>
							<td class="alignCenter"><c:out value="${popupList.popup_ed_dt}"/></td>
							<td class="alignCenter"><fmt:formatNumber value="${popupList.popup_hit_cnt}" type="number"/></td>
							<td class="alignCenter">
							<c:choose>
								<c:when test="${popupList.popup_use_st eq 'Y' }">
									<c:choose>
										<c:when test="${popupList.popup_status eq 'E'}"><span class="btns lightgraybtn h24px">종료</span></c:when>
										<c:when test="${popupList.popup_status eq 'R'}"><span class="btns orangebtn h24px">대기</span></c:when>
										<c:otherwise><span class="btns greenbtn h24px">진행중</span></c:otherwise>
									</c:choose>
								</c:when>
								<c:otherwise><span class="btns redbtn h24px">사용안함</span></c:otherwise>
							</c:choose>
							</td>
							<td class="alignCenter">
								<a href="/admgr/admgrConfig/popupForm.do?popup_seq=<c:out value="${popupList.popup_seq }"/>" class="btns bluebtn h24px">수정</a>
								<a href="#" onclick="popupdel('<c:out value="${popupList.popup_seq }"/>')" class="btns lightbluebtn h24px">삭제</a>
							</td>
						</tr>
						</c:forEach>
					</tbody>
				</table>

				<div class="pagination">
				<ul>
					<ui:pagination paginationInfo = "${paginationInfo}" type="image" jsFunction="jsPaging" />
				</ul>
				</div>
					
				<div class="btnarea alignRight mgt30px">
					<a href="/admgr/admgrConfig/popupForm.do" class="btns redbtn"><i class="fal fa-clone"></i> 팝업추가</a>
				</div>
				<!-- } 리스트 -->
			</section>
			<!-- } 환경설정 > 팝업관리 > 리스트 -->
		</div>
		<!-- } 콘텐츠 영역 -->
		
		<script type="text/javascript">
		// 페이징함수
		function jsPaging(pageNo) {
			//console.log(pageNo);
			var searchKeyword = $.trim($('#searchKeyword').val());
	
			var linkurl = "/admgr/admgrMember/memberList.do?pageIndex="+pageNo;
			
			if(searchKeyword) {
				linkurl += "&searchKeyword="+searchKeyword;
			}
			//console.log(linkurl)
			location.href = linkurl;
		}
		</script>

<c:import url="/Api/admgrIncludeBottom.do"/>