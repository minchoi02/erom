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
			<h1 class="bigTit">Q&A</h1>
			<div class="pageComment">
				<div class="comment_ico"><i class="fad fa-comment-alt-smile"></i></div>
				<p>
					Q&A를 확인하는 페이지입니다.<br />
					답변을 달 수 있습니다.
				</p>
			</div>
			
			<!-- 고객센터 > Q&A > 리스트 { -->
			<section id="boardList" class="page_content">
				<!-- 리스트 검색 { -->
				<form method="post" id="searchForm" name="searchForm" action="/admgr/admgrCustomer/qnaList.do"  >
				<div class="list_search_box">
					<ul class="nopm floats">
					<%--
						<li>
							<select id="searcjKey" name="searchKey" class="basic_select search_select">
								<option value="prod_nm" <c:if test="${searchKey eq 'prod_nm' }">selected</c:if> >상품명</option>
								<option value="store_nm" <c:if test="${searchKey eq 'store_nm' }">selected</c:if> >업체명</option>
								<option value="content" <c:if test="${searchKey eq 'content' }">selected</c:if> >내용</option>
							</select>
						</li>
						 --%>
						 <input type="hidden"  id="searcjKey" name="searchKey" value="content" />
						<li><input type="text" id="searcjKeyword" name="searchKeyword" class="search_input w300px" placeholder="검색어를 입력하세요." value="<c:out value="${searchKeyword }"/>" /></li>
						<li><button type="submit" class="search_submit"><i class="fal fa-search"></i> 검색</button></li>
						<li class="fr">전체 : <b><fmt:formatNumber value="${TotalCnt}" type="number"/></b>건</li>
					</ul>
				</div>
				</form>
				<!-- } 리스트 검색 -->

				<!-- 탭 버튼 { -->
				<%-- <nav id="tab-gnb" class="mgt20px">
					<ul class="nopm floats">
						<li <c:if test="${empty store_category }">class="active"</c:if> ><a href="/admgr/admgrCustomer/qnaList.do">전체</a></li>
						
						<li <c:if test="${store_category eq 'CD002004'}">class="active"</c:if> ><a href="/admgr/admgrCustomer/qnaList.do?store_category=CD002004&searchKey=<c:out value="${searchKey }"/>&searchKeyword=<c:out value="${searchKeyword }"/>">이롬스토어</a></li>
					</ul>
				</nav> --%>
				
				<!-- } 탭 버튼 -->

				<!-- 리스트 { -->
				<table class="admin_tbl admin_list_tbl mgt10px">
					<caption>Q&A 리스트</caption>
					<colgroup>
						<col width="80" />
						<col width="120" />
						<col width="120" />
						<col />
						<col width="120" />
						<col width="170" />
						<col width="120" />
						<col width="130" />
					</colgroup>
					<thead>
						<tr>
							<th>번호</th>
							<th>유형</th>
							<th colspan="2">상품명</th>
							<th>글쓴이</th>
							<th>등록일시</th>
							<th>답변여부</th>
							<th>관리</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="bbsList" items="${bbsList}" varStatus="status">
						<tr>
							<td class="alignCenter"><c:out value="${StartPageNumber-status.count}"/></td>
							<td class="alignCenter"><c:out value="${bbsList.store_category_nm}"/></td>
							<td class="alignCenter"><img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${bbsList.prod_img_1}"/>&fileSn=0" width="100"  onerror="this.src='/images/baseScmtour/_noImage.png';"/></td>
							<td><small class="colorGray">[<c:out value="${bbsList.store_nm}"/> - <c:out value="${bbsList.prod_nm}"/>]</small><br /><c:out value="${bbsList.bbs_content}"/></td>
							<%--
							<td class="alignCenter"><span data-toggle="tooltip" data-html="true" data-placement="bottom" title="연락처 : 010-9876-5432"><c:out value="${bbsList.user_nm}"/></span></td>
							 --%>
							<td class="alignCenter"><c:out value="${bbsList.user_nm}"/></td>
							<td class="alignCenter"><c:out value="${bbsList.reg_dt}"/></td>
							<td class="alignCenter">
								<c:choose>
									<c:when test="${not empty bbsList.bbs_reply_content }"><span class="btns greenbtn h24px">답변완료</span></c:when>
									<c:otherwise><span class="btns graybtn h24px">미답변</span></c:otherwise>
								</c:choose>
							</td>
							<td class="alignCenter">
								<a href="/admgr/admgrCustomer/qnaForm.do?pageIndex=<c:out value="${paginationInfo.currentPageNo }"/>&searchKey=<c:out value="${searchKey}"/>&searchKeyword=<c:out value="${searchKeyword }"/>&bbs_seq=<c:out value="${bbsList.bbs_seq }"/>" class="btns bluebtn h24px">확인</a>
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
			</section>
			<!-- } 고객센터 > Q&A > 리스트 -->
		</div>
		<!-- } 콘텐츠 영역 -->
		
		<script type="text/javascript">
		// 페이징함수
		function jsPaging(pageNo) {
			//console.log(pageNo);
			var store_category = $.trim($('#store_category').val());
			var searchKey= $.trim($('#searchKey').val());
			var searchKeyword = $.trim($('#searchKeyword').val());
	
			var linkurl = "/admgr/admgrCustomer/mtmList.do?pageIndex="+pageNo;

			if(store_category) {
				linkurl += "&store_category"+store_category;
			}
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