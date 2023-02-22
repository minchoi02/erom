<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:import url="/Api/IncludeTop.do"/>

	<!-- 프로모션/이벤트 리스트 { -->
	<section id="boardList" class="bgs">
		<form method="get" action="/shop/promotionList.do">
		<input type="hidden" name="pageIndex" value="<c:out value="${paginationInfo.currentPageNo }"/>" />
		<input type="hidden" name="bbs_use" value="<c:out value="${bbs_use}"/>" />
		<article id="boardListSearch">
			<input type="text" id="searchKeyword" name="searchKeyword" class="search_input w100" placeholder="검색어를 입력해주세요" value="<c:out value="${ searchKeyword}"/>" />
			<button type="submit" class="search_button"><i class="far fa-search"></i><span class="skip">검색</span></button>
		</article>
		</form>
		<div class="promotion_tab">
			<ul class="nopm floats">
				<li><a href="/shop/promotionList.do?pageIndex=1&bbs_use=Y&searchKeyword=<c:out value="${searchKeyword }"/>" <c:if test="${bbs_use eq 'Y' }">class="active"</c:if> >진행중</a></li>
				<li><a href="/shop/promotionList.do?pageIndex=1&bbs_use=N&searchKeyword=<c:out value="${searchKeyword }"/>" <c:if test="${bbs_use eq 'N' }">class="active"</c:if> >종료</a></li>
			</ul>
		</div>
		<article id="promotionListCon">
			<ul class="nopm">
				<c:forEach var="promotionList" items="${promotionList}" varStatus="status">
				<li>
					<a href="/shop/promotionView.do?pageIndex=<c:out value="${paginationInfo.currentPageNo }"/>&bbs_seq=<c:out value="${promotionList.bbs_seq}"/>">
						<em><img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${promotionList.bbs_file1}"/>&fileSn=0" style="width: 100%;" onerror="this.src='/images/baseScmtour/_noImage.png';"/></em>
						<span>진행기간 : <c:out value="${promotionList.bbs_st_dt_ymd}"/> ~ <c:out value="${promotionList.bbs_ed_dt_ymd}"/></span>
					</a>
				</li>
				</c:forEach>

			<div class="pagenation alignCenter">
				<ui:pagination paginationInfo = "${paginationInfo}" type="image" jsFunction="jsPaging" />
			</div>
		</article>
	</section>
	<!-- } 프로모션/이벤트 리스트 -->
	
		<script type="text/javascript">
		function jsPaging(pageNo) {
			//console.log(pageNo);
			var searchKeyword = $.trim($('#searchKeyword').val());
	
			var linkurl = "/shop/promotionList.do?pageIndex="+pageNo;
			
			if(searchKeyword) {
				linkurl += "&searchKey="+searchKey+"&searchKeyword="+searchKeyword;
			}
			//console.log(linkurl)
			location.href = linkurl;
		}
		</script>
	

<c:import url="/Api/IncludeBottom.do"/>