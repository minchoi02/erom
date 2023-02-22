<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:import url="/Api/admgrIncludeTop.do"/>
<c:import url="/Api/admgrIncludeLeftMenu.do"/>

<%
// url을 읽어와서 파일을 추출한다.
String fullUrl = request.getServletPath();
String checkUrl = fullUrl.replace("/WEB-INF/jsp/admgr/","");
String[] url_arr = checkUrl.split("/");
String this_uri = url_arr[0].replace(".jsp","");
String left_uri = "";
if(url_arr.length > 1) { //서브디렉토리일때..  왼쪽 메뉴를 잡는다.
	left_uri = url_arr[1].replace(".jsp","");
}
%>
<c:set var="prod_page" value="<%=left_uri%>"/>
<c:set var="now1" value=""/>
<c:set var="now2" value=""/>
<c:set var="now3" value=""/>
<c:choose>
	<c:when test="${prod_page eq 'productOrderbyList' }">
		<c:set var="now2" value="active"/>
	</c:when>
	<c:when test="${prod_page eq 'productEndList' }">
		<c:set var="now3" value="active"/>
	</c:when>
	<c:otherwise>
		<c:set var="now1" value="active"/>
	</c:otherwise>
</c:choose>	


<c:set var="category_title" value="이롬스토어"/>
<!--  
<c:if test="${ store_category ne 'CD002005'}">
	<c:choose>
		<c:when test="${store_category eq 'CD002001' }">
			<c:set var="category_title" value="관광/체험"/>
		</c:when>
		<c:when test="${store_category eq 'CD002002' }">
			<c:set var="category_title" value="숙박"/>
		</c:when>
		<c:when test="${store_category eq 'CD002003' }">
			<c:set var="category_title" value="맛집"/>
		</c:when>
		<c:when test="${store_category eq 'CD002004' }">
			<c:set var="category_title" value="이롬스토어"/>
		</c:when>
	</c:choose>
-->
		<!-- 콘텐츠 영역 { -->
		<div id="content">
			<h1 class="bigTit"><c:out value="${category_title }"/></h1>
			<div class="pageComment">
				<div class="comment_ico"><i class="fad fa-comment-alt-smile"></i></div>
				<p>
					<c:out value="${category_title }"/> 상품의 판매상태, 결제설정상태, 노출순서를 관리하는 페이지입니다.<br />
					상태 : 판매중, 판매종료 <br>
					순서 : 큰 순서일수록 우선 노출 됩니다. 
				</p>
			</div>
			
			<section id="courseList" class="page_content">
			
				<nav id="tab-gnb" class="mgt20px">
					<ul class="nopm floats">
						<li class="<c:out value="${now1 }"/>"><a href="/admgr/admgrProduct/productList.do?pageIndex=1&store_category=<c:out value="${store_category }"/>&searchKey=<c:out value="${searchKey}"/>&searchKeyword=<c:out value="${searchKeyword }"/>&searchType=<c:out value="${searchType }"/>">상품관리</a></li>
						<li class="<c:out value="${now2 }"/>"><a href="/admgr/admgrProduct/productOrderbyList.do?pageIndex=1&store_category=<c:out value="${store_category }"/>&searchKey=<c:out value="${searchKey}"/>&searchKeyword=<c:out value="${searchKeyword }"/>&searchType=<c:out value="${searchType }"/>">진열관리</a></li>
						<li class="fr <c:out value="${now3 }"/>"><a href="/admgr/admgrProduct/productEndList.do?pageIndex=1&store_category=<c:out value="${store_category }"/>&searchKey=<c:out value="${searchKey}"/>&searchKeyword=<c:out value="${searchKeyword }"/>&searchType=<c:out value="${searchType }"/>"><span class="colorRed">판매종료</span></a></li>
					</ul>
				</nav>
			
			<c:import url="./productCommonOrderbyList.jsp"/>

</c:if>

				<div class="pagination">
					<ul>
					<ui:pagination paginationInfo = "${paginationInfo}" type="image" jsFunction="jsPaging" />
					</ul>
				</div>

				
				<script type="text/javascript">
				// 페이징함수
				function jsPaging(pageNo) {
					//console.log(pageNo);
					var searchKey = $.trim($('#searchKey').val());
					var searchKeyword = $.trim($('#searchKeyword').val());
					var searchType = $.trim($('#searchType').val());
					var store_category = $.trim($('#store_category').val());
					
					
					var linkurl = "/admgr/admgrProduct/productOrderbyList.do?pageIndex="+pageNo+"&store_category=CD002004";
					
					/*if(store_category) {
						linkurl += "&store_category="+store_category;
					}*/					

					if(searchKey && searchKeyword) {
						linkurl += "&searchKey="+searchKey+"&searchKeyword="+searchKeyword;
					}
					if(searchType) {
						linkurl += "&searchType="+searchType;
					}

					//console.log(linkurl)
					location.href = linkurl;
				}
				</script>
