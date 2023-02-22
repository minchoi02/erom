<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:import url="/Api/admgrIncludeTop.do"/>
<c:import url="/Api/admgrIncludeLeftMenu.do"/>

<c:if test="${ store_category eq 'CD002005'}">

	<!-- 콘텐츠 영역 { -->
		<div id="content">
			<h1 class="bigTit">추천여행상품</h1>
			<div class="pageComment">
				<div class="comment_ico"><i class="fad fa-comment-alt-smile"></i></div>
				<p>
					추천여행상품 상품을 등록, 관리하는 페이지입니다.<br />
					상태 : 노출중, 노출중지
				</p>
			</div>
			
			<!-- 추천여행상품 > 리스트 > 상품관리 { -->
			<section id="courseList" class="page_content">
				<!-- 리스트 검색 { -->
				<div class="list_search_box">
					<ul class="nopm floats">
						<li>
							<select id="searchKey" name="searchKey" class="basic_select search_select">
								<option value="prod_nm"<c:if test="${searchKey eq 'prod_nm' }">selected</c:if> >제목</option>
							</select>
						</li>
						<li><input type="text" id="searchKeyword" name="searchKeyword" class="search_input w300px" placeholder="검색어를 입력하세요." /></li>
						<li><button type="submit" class="search_submit"><i class="fal fa-search"></i> 검색</button></li>
						<li class="fr">전체 : <b><fmt:formatNumber value="${paginationInfo.totalRecordCount }" type="number"/></b>건</li>
					</ul>
				</div>
				<!-- } 리스트 검색 -->

				<!-- 탭 버튼 { -->
				<nav id="tab-gnb" class="mgt20px">
					<ul class="nopm floats">
						<li><a href="/admgr/admgrProduct/productList.do?pageIndex=1&store_category=<c:out value="${store_category }"/>&searchKey=<c:out value="${searchKey}"/>&searchKeyword=<c:out value="${searchKeyword }"/>&searchType=<c:out value="${searchType }"/>">상품관리</a></li>
						<li><a href="/admgr/admgrProduct/productOrderbyList.do?pageIndex=1&store_category=<c:out value="${store_category }"/>&searchKey=<c:out value="${searchKey}"/>&searchKeyword=<c:out value="${searchKeyword }"/>&searchType=<c:out value="${searchType }"/>">진열관리</a></li>
						<li class="fr active" ><a href="/admgr/admgrProduct/productEndList.do?pageIndex=1&store_category=<c:out value="${store_category }"/>&searchKey=<c:out value="${searchKey}"/>&searchKeyword=<c:out value="${searchKeyword }"/>&searchType=<c:out value="${searchType }"/>"><span class="colorRed">노출중지</span></a></li>
					</ul>
				</nav>
				<!-- } 탭 버튼 -->

				<!-- 추천여행상품 상품리스트 { -->
				<table class="admin_tbl admin_list_tbl mgt10px">
					<caption>추천여행상품 리스트</caption>
					<colgroup>
						<col width="80" />
						<col />
						<col width="150" />
						<col width="80" />
						<col width="150" />
						<col width="100" />
						<col width="80" />
						<col width="100" />
						<col width="130" />
					</colgroup>
					<thead>
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>출발지</th>
							<th>경유지</th>
							<th>도착지</th>
							<th>등록일</th>
							<th>조회</th>
							<th>상태</th>
							<th>관리</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="prodList" items="${prodList}" varStatus="status">
						<tr>
							<td class="alignCenter"><c:out value="${StartPageNumber-status.count}"/></td>
							<td>
								<c:set var="recom_start" value=""/>
								<c:set var="recom_end" value=""/>
								<c:set var="recom_cnt" value="0"/>
								<c:out value="${prodList.prod_nm}"/><br />
								<small class="colorGray"><i class="fal fa-map-marked-alt"></i>
								 <c:if test="${prodList.recom_1_use_st eq 'Y' }">
								 	<c:out value="${prodList.recom_1_prod_nm }"/> 
								 	<c:set var="recom_start" value="${prodList.recom_1_prod_nm }"/>
								 	<c:set var="recom_end" value="${prodList.recom_1_prod_nm }"/>
								 	<c:set var="recom_cnt" value="${recom_cnt+1}"/>
								 </c:if>
								 <c:if test="${prodList.recom_2_use_st eq 'Y' }">
								 	 → <c:out value="${prodList.recom_2_prod_nm }"/>
								 	 <c:if test="${empty recom_start }">
								 	 	<c:set var="recom_start" value="${prodList.recom_2_prod_nm }"/>
								 	 </c:if>
								 	<c:set var="recom_end" value="${prodList.recom_2_prod_nm }"/>
								 	<c:set var="recom_cnt" value="${recom_cnt+1}"/>
								 </c:if>
								 <c:if test="${prodList.recom_3_use_st eq 'Y' }">
								 	 → <c:out value="${prodList.recom_3_prod_nm }"/> 
								 	 <c:if test="${empty recom_start }">
								 	 	<c:set var="recom_start" value="${prodList.recom_3_prod_nm }"/>
								 	 </c:if>
								 	<c:set var="recom_end" value="${prodList.recom_3_prod_nm }"/>
								 	<c:set var="recom_cnt" value="${recom_cnt+1}"/>
								 </c:if>
								 <c:if test="${prodList.recom_4_use_st eq 'Y' }">
								 	 → <c:out value="${prodList.recom_4_prod_nm }"/> 
								 	 <c:if test="${empty recom_start }">
								 	 	<c:set var="recom_start" value="${prodList.recom_4_prod_nm }"/>
								 	 </c:if>
								 	<c:set var="recom_end" value="${prodList.recom_4_prod_nm }"/>
								 	<c:set var="recom_cnt" value="${recom_cnt+1}"/>
								 </c:if>
								 <c:if test="${prodList.recom_5_use_st eq 'Y' }">
								 	 → <c:out value="${prodList.recom_5_prod_nm }"/> 
								 	 <c:if test="${empty recom_start }">
								 	 	<c:set var="recom_start" value="${prodList.recom_5_prod_nm }"/>
								 	 </c:if>
								 	<c:set var="recom_end" value="${prodList.recom_5_prod_nm }"/>
								 	<c:set var="recom_cnt" value="${recom_cnt+1}"/>
								 </c:if>
								 <c:if test="${prodList.recom_6_use_st eq 'Y' }">
								 	 → <c:out value="${prodList.recom_6_prod_nm }"/> 
								 	 <c:if test="${empty recom_start }">
								 	 	<c:set var="recom_start" value="${prodList.recom_6_prod_nm }"/>
								 	 </c:if>
								 	<c:set var="recom_end" value="${prodList.recom_6_prod_nm }"/>
								 	<c:set var="recom_cnt" value="${recom_cnt+1}"/>
								 </c:if>
								 <c:if test="${prodList.recom_7_use_st eq 'Y' }">
								 	 → <c:out value="${prodList.recom_7_prod_nm }"/> 
								 	 <c:if test="${empty recom_start }">
								 	 	<c:set var="recom_start" value="${prodList.recom_7_prod_nm }"/>
								 	 </c:if>
								 	<c:set var="recom_end" value="${prodList.recom_7_prod_nm }"/>
								 	<c:set var="recom_cnt" value="${recom_cnt+1}"/>
								 </c:if>
								 <c:if test="${prodList.recom_8_use_st eq 'Y' }">
								 	 → <c:out value="${prodList.recom_8_prod_nm }"/> 
								 	 <c:if test="${empty recom_start }">
								 	 	<c:set var="recom_start" value="${prodList.recom_8_prod_nm }"/>
								 	 </c:if>
								 	<c:set var="recom_end" value="${prodList.recom_8_prod_nm }"/>
								 	<c:set var="recom_cnt" value="${recom_cnt+1}"/>
								 </c:if>
								 <c:if test="${prodList.recom_9_use_st eq 'Y' }">
								 	 → <c:out value="${prodList.recom_9_prod_nm }"/> 
								 	 <c:if test="${empty recom_start }">
								 	 	<c:set var="recom_start" value="${prodList.recom_9_prod_nm }"/>
								 	 </c:if>
								 	<c:set var="recom_end" value="${prodList.recom_9_prod_nm }"/>
								 	<c:set var="recom_cnt" value="${recom_cnt+1}"/>
								 </c:if>
								 <c:if test="${prodList.recom_10_use_st eq 'Y' }">
								 	 → <c:out value="${prodList.recom_10_prod_nm }"/> 
								 	 <c:if test="${empty recom_start }">
								 	 	<c:set var="recom_start" value="${prodList.recom_10_prod_nm }"/>
								 	 </c:if>
								 	<c:set var="recom_end" value="${prodList.recom_10_prod_nm }"/>
								 	<c:set var="recom_cnt" value="${recom_cnt+1}"/>
								 </c:if>
								 </small>
							</td>
							<td class="alignCenter"><c:out value="${recom_start}"/></td>
							<td class="alignCenter"><c:out value="${recom_cnt}"/></td>
							<td class="alignCenter"><c:out value="${recom_end}"/></td>
							<td class="alignCenter"><c:out value="${prodList.reg_dt}"/></td>
							<td class="alignCenter"><fmt:formatNumber value="${prodList.prod_hit_cnt}" type="number"/></td>
							<td class="alignCenter">
								<c:choose>
									<c:when test="${prodList.prod_use_st eq 'Y' }"><span class="btns greenbtn h24px">노출중</span></c:when>
									<c:when test="${prodList.prod_use_st eq 'N' }"><span class="btns graybtn h24px">노출중지</span></c:when>
								</c:choose>
							</td>
							<td class="alignCenter">
								<a href="/admgr/admgrProduct/productForm.do?pageIndex=<c:out value="${paginationInfo.currentPageNo }"/>&store_category=<c:out value="${store_category }"/>&searchKey=<c:out value="${searchKey}"/>&searchKeyword=<c:out value="${searchKeyword}"/>&prod_seq=<c:out value="${prodList.prod_seq}"/>" class="btns bluebtn h24px">수정</a>
								<a href="#" onclick="productDelCheck(); return false;" class="btns lightbluebtn h24px">삭제</a>
							</td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
				<!-- } 추천여행상품 상품리스트 -->
</c:if>



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

		<!-- 콘텐츠 영역 { -->
		<div id="content">
			<h1 class="bigTit"><c:out value="${category_title }"/></h1>
			<div class="pageComment">
				<div class="comment_ico"><i class="fad fa-comment-alt-smile"></i></div>
				<p>
					<c:out value="${category_title }"/> 상품을 등록, 관리하는 페이지입니다.<br />
					상태 : 판매중, 노출중지, 판매종료
				</p>
			</div>
			
			<c:import url="./productCommonList.jsp"/>

</c:if>

