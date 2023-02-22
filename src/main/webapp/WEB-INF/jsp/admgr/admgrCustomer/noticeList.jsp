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
			<h1 class="bigTit">공지사항</h1>
			<div class="pageComment">
				<div class="comment_ico"><i class="fad fa-comment-alt-smile"></i></div>
				<p>
					공지사항을 관리하는 페이지입니다.
				</p>
			</div>
			
			<!-- 고객센터 > 공지사항 > 리스트 { -->
			<section id="boardList" class="page_content">
				<!-- 리스트 검색 { -->
				<form method="post" action="/admgr/admgrCustomer/noticeList.do">
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
					<caption>공지사항 리스트</caption>
					<colgroup>
						<col width="80" />
						<col />
						<col width="170" />
						<col width="100" />
						<col width="130" />
					</colgroup>
					<thead>
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>등록일시</th>
							<th>조회</th>
							<th>관리</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="bbsNoticeList" items="${bbsNoticeList}" varStatus="status">
						<tr>
							<td class="alignCenter">공지</td>
							<td>
								<a href="/admgr/admgrCustomer/noticeForm.do?pageIndex=<c:out value="${paginationInfo.currentPageNo }"/>&searchKey=<c:out value="${searchKey}"/>&searchKeyword=<c:out value="${searchKeyword }"/>&bbs_seq=<c:out value="${bbsNoticeList.bbs_seq }"/>" class="colorBlue"><c:out value="${bbsNoticeList.bbs_subject}"/> 
								<c:if test="${bbsNoticeList.comm_cnt > 0}">&nbsp;<small class="bbs_comment_cnt" >(<fmt:formatNumber value="${bbsNoticeList.comm_cnt}" type="number"/>)</small></c:if> 
								&nbsp;<i class="fal fa-external-link"></i></a>
							</td>
							<td class="alignCenter"><c:out value="${bbsNoticeList.reg_dt}"/></td>
							<td class="alignCenter"><fmt:formatNumber value="${bbsNoticeList.bbs_hit_cnt}" type="number"/></td>
							<td class="alignCenter">
								<a href="/admgr/admgrCustomer/noticeForm.do?&pageIndex=<c:out value="${paginationInfo.currentPageNo }"/>&searchKey=<c:out value="${searchKey}"/>&searchKeyword=<c:out value="${searchKeyword }"/>&bbs_seq=<c:out value="${bbsNoticeList.bbs_seq }"/>" class="btns bluebtn h24px">수정</a>
								<a href="#" onclick="delbbs('<c:out value="${bbs_id }"/>','<c:out value="${bbsNoticeList.bbs_seq}"/>','<c:out value="${searchKey}"/>',''<c:out value="${searchKeyword}"/>);" class="btns lightbluebtn h24px">삭제</a>
							</td>
						</tr>
						</c:forEach>
						<c:forEach var="bbsList" items="${bbsList}" varStatus="status">
						<tr>
							<td class="alignCenter"><c:out value="${StartPageNumber-status.count}"/></td>
							<td>
								<a href="/admgr/admgrCustomer/noticeForm.do?pageIndex=<c:out value="${paginationInfo.currentPageNo }"/>&searchKey=<c:out value="${searchKey}"/>&searchKeyword=<c:out value="${searchKeyword }"/>&bbs_seq=<c:out value="${bbsList.bbs_seq }"/>" class="colorBlue"><c:out value="${bbsList.bbs_subject}"/> 
								<c:if test="${bbsList.comm_cnt > 0}">&nbsp;<small class="bbs_comment_cnt" >(<fmt:formatNumber value="${bbsList.comm_cnt}" type="number"/>)</small></c:if> 
								&nbsp;<i class="fal fa-external-link"></i></a>
							</td>
							<td class="alignCenter"><c:out value="${bbsList.reg_dt}"/></td>
							<td class="alignCenter"><fmt:formatNumber value="${bbsList.bbs_hit_cnt}" type="number"/></td>
							<td class="alignCenter">
								<a href="/admgr/admgrCustomer/noticeForm.do?pageIndex=<c:out value="${paginationInfo.currentPageNo }"/>&searchKey=<c:out value="${searchKey}"/>&searchKeyword=<c:out value="${searchKeyword }"/>&bbs_seq=<c:out value="${bbsList.bbs_seq }"/>" class="btns bluebtn h24px">수정</a>
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
					<a href="/admgr/admgrCustomer/noticeForm.do" class="btns redbtn"><i class="fal fa-user-plus"></i> 공지사항 등록</a>
				</div>
			</section>
			<!-- } 고객센터 > 공지사항 > 리스트 -->
		</div>
		<!-- } 콘텐츠 영역 -->
		
		<script type="text/javascript">
		// 페이징함수 
		function jsPaging(pageNo) {
			//console.log(pageNo);
			var searchKey= $.trim($('#searchKey').val());
			var searchKeyword = $.trim($('#searchKeyword').val());
	
			var linkurl = "/admgr/admgrCustomer/noticeList.do?pageIndex="+pageNo;

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