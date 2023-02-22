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
			<h1 class="bigTit">인기검색어</h1>
			<div class="pageComment">
				<div class="comment_ico"><i class="fad fa-comment-alt-smile"></i></div>
				<p>
					기간별 인기검색어 목록입니다.
				</p>
			</div>
			
			<!-- 상점관리 > 상점정산 > 리스트 { -->
			<section id="storeCalculateList" class="page_content">
				<!-- 리스트 검색 { -->
				<div class="list_search_box">
					<ul class="nopm floats">
						<li>
							<select class="basic_select search_select" id="this_year" name="this_year">
								<c:forEach var="i" begin="2020" end="${thisY }">  
								<option value="<c:out value="${i }"/>" <c:if test="${thisY eq i }">selected</c:if> ><c:out value="${i }"/>년</option>
								</c:forEach>
							</select>
						</li>
						<li>
						<c:set var="this_ym_arr" value="${fn:split(thisYm,'-') }"/>
						<c:set var="month" value="${this_ym_arr[1] }"/>
						<c:forEach var="i" begin="01" end="12">  
							<a href="#;" class="month btns h30px <c:if test="${month eq i }">aquabtn</c:if>" onclick="set_keywords_month('<c:out value="${i }"/>')"> <c:out value="${i}"/>월</a>
						</c:forEach>
						</li>
					</ul>
				</div>
				<!-- } 리스트 검색 -->

				<!-- 리스트 { -->
				<table class="admin_tbl admin_list_tbl mgt10px">
					<caption>키워드 리스트</caption>
					<colgroup>
						<col width="80" />
						<col width="120" />
						<col />
					</colgroup>
					<thead>
						<tr>
							<th>번호</th>
							<th>조회수</th>
							<th>업체명</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="keywordsList" items="${keywordsList }">
						<tr>
							<td class="alignCenter"><fmt:formatNumber value="${StartPageNumber-1 }" type="number"/></td>
							<td class="alignCenter"><fmt:formatNumber value="${keywordsList.cnt}" type="number"/></td>
							<td><c:out value="${keywordsList.keywords}"/></td>
						</tr>
						<c:set var="StartPageNumber" value="${StartPageNumber-1 }"/>
						</c:forEach>
					</tbody>
				</table>
				<!-- } 리스트 -->

				<div class="pagination">
				<ul>
					<ui:pagination paginationInfo = "${paginationInfo}" type="image" jsFunction="jsPaging" />
				</ul>
				</div>
			</section>
			<!-- } 상점관리 > 상점정산 > 리스트 -->
	
		</div>
				
		<script type="text/javascript">
		// 페이징함수
		function jsPaging(pageNo) {
			var linkurl = "/admgr/admgrStatistics/keywordList.do?pageIndex="+pageNo+"&search_ym=<c:out value="${search_ym}"/>";
			location.href = linkurl;
		}
		</script>

	
<c:import url="/Api/admgrIncludeBottom.do"/>