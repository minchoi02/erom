<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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



		<!-- 상품관리 > 관광/체험 > 리스트 > 상품관리 { -->
			
			<section id="productTravelList" class="page_content">
				<!-- 리스트 검색 { -->
				<form method="get" action="" id="prodSesrahForm" name="prodSesrahForm" >
				<input type="hidden" id="store_category" name="store_category" value="<c:out value="${store_category}"/>" />
				<div class="list_search_box">
					<ul class="nopm floats">
						<li>
							<select id="searchKey" name="searchKey" class="basic_select search_select">
								<option value="prod_nm"<c:if test="${searchKey eq 'prod_nm' }">selected</c:if> >상품명</option>
								<option value="store_nm" <c:if test="${searchKey eq 'store_nm' }">selected</c:if> >업체명</option>
								<option value="prod_id" <c:if test="${searchKey eq 'prod_id' }">selected</c:if> >상품ID</option>
							</select>
						</li>
						<li><input type="text" id="searchKeyword" name="searchKeyword" class="search_input w300px" placeholder="검색어를 입력하세요."  value="<c:out value="${searchKeyword }"/>" /></li>
						<li>
							<select class="basic_select search_select" id="searchType" name="searchType">
								<option value="and" <c:if test="${searchType eq 'and' }">selected</c:if> >AND</option>
								<option value="or" <c:if test="${searchType eq 'or' }">selected</c:if> >OR</option>
							</select>
						</li>
						<li><button type="submit" class="search_submit"><i class="fal fa-search"></i> 검색</button></li>
						<li class="fr">전체 : <b><fmt:formatNumber value="${paginationInfo.totalRecordCount }" type="number"/></b>건</li>
					</ul>
				</div>
				</form>
				<!-- } 리스트 검색 -->

				<!-- 탭 버튼 { -->
				<nav id="tab-gnb" class="mgt20px">
					<ul class="nopm floats">
						<li class="<c:out value="${now1 }"/>"><a href="/admgr/admgrProduct/productList.do?pageIndex=1&store_category=<c:out value="${store_category }"/>&searchKey=<c:out value="${searchKey}"/>&searchKeyword=<c:out value="${searchKeyword }"/>&searchType=<c:out value="${searchType }"/>">상품관리</a></li>
						<li class="<c:out value="${now2 }"/>"><a href="/admgr/admgrProduct/productOrderbyList.do?pageIndex=1&store_category=<c:out value="${store_category }"/>&searchKey=<c:out value="${searchKey}"/>&searchKeyword=<c:out value="${searchKeyword }"/>&searchType=<c:out value="${searchType }"/>">진열관리</a></li>
						<li class="fr <c:out value="${now3 }"/>"><a href="/admgr/admgrProduct/productEndList.do?pageIndex=1&store_category=<c:out value="${store_category }"/>&searchKey=<c:out value="${searchKey}"/>&searchKeyword=<c:out value="${searchKeyword }"/>&searchType=<c:out value="${searchType }"/>"><span class="colorRed">판매종료</span></a></li>
					</ul>
				</nav>
				<!-- } 탭 버튼 -->

				<!-- 축제/체험 상품리스트 { -->
				<table class="admin_tbl admin_list_tbl mgt10px">
					<caption>상점 리스트</caption>
					<c:choose>
					<c:when test="${store_category ne 'CD002004' }">
					<colgroup>
						<col width="80" />
						<col width="120" />
						<col />
						<col width="150" />
						<col width="120" />
						<col width="120" />
						<col width="80" />
						<col width="100" />
						<col width="120" />
						<col width="130" />
					</colgroup>
					<thead>
						<tr>
							<th>번호</th>
							<th colspan="2">상품명</th>
							<th>판매업체</th>
							<th>판매 시작일시</th>
							<th>판매 종료일시</th>
							<th>조회</th>
							<th>상태</th>
							<th>결제</th>
							<th>관리</th>
						</tr>
					</thead>
					</c:when>
					<c:otherwise>
					<colgroup>
						<col width="80" />
						<col width="100" />
						<col width="120" />
						<col />
						<col width="150" />
						<col width="100" />
						<col width="100" />
						<%--
						<col width="80" />
						 --%>
						<col width="80" />
						<col width="100" />
						<col width="120" />
						<col width="130" />
					</colgroup>
					<thead>
						<tr>
							<th>번호</th>
							<th>분류</th>
							<th colspan="2">상품명</th>
							<th>판매업체</th>
							<th>시중가</th>
							<th>판매가</th>
							<%--
							<th>재고</th>
							 --%>
							<th>조회</th>
							<th>상태</th>
							<th>결제</th>
							<th>관리</th>
						</tr>
					</thead>
					</c:otherwise>
					</c:choose>
					
					<tbody>
						<c:forEach var="prodList" items="${prodList}" varStatus="status">
						<tr>
							<td class="alignCenter"><c:out value="${StartPageNumber-status.count}"/></td>
							<c:choose>
							<c:when test="${store_category ne 'CD002004' }">
							<td class="alignCenter"><img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${prodList.prod_img_1}"/>&fileSn=0" width="100"  onerror="this.src='/images/baseScmtour/_noImage.png';"/></td>
							<td><c:if test="${prodList.is_recom >0}"><span class="btns aquabtn h24px">추천여행상품</span><br /></c:if>
								<c:if test="${prodList.prod_use_st eq 'Y' }">
								<c:choose>
								<c:when test="${store_category ne 'CD002004' }">
								<a href="/shop/itemView.do?store_category=<c:out value="${store_category }"/>&prod_id=<c:out value="${prodList.prod_id }"/>" target="_blank">
								<c:out value="${prodList.prod_nm}"/> &nbsp;&nbsp;<i class="fas fa-external-link-alt"></i>
								</a>
								</c:when>
								<c:otherwise>
								<a href="/shop/itemView.do?store_category=<c:out value="${store_category }"/>&prod_category=<c:out value="${prodList.prod_category }"/>&prod_id=<c:out value="${prodList.prod_id }"/>"  target="_blank">
								<c:out value="${prodList.prod_nm}"/> &nbsp;&nbsp;<i class="fas fa-external-link-alt"></i>
								</a>
								</c:otherwise>
								</c:choose>
								</c:if>
								
								<c:if test="${prodList.prod_use_st ne 'Y' }">
								<c:out value="${prodList.prod_nm}"/>
								</c:if>
							</td>
							<td class="alignCenter"><c:out value="${prodList.store_nm}"/></td>
							<td class="alignCenter"><c:out value="${prodList.prod_st_dt_ymd}"/><br /><c:out value="${prodList.prod_st_dt_hour}"/>:<c:out value="${prodList.prod_st_dt_minute}"/></td>
							<td class="alignCenter"><c:out value="${prodList.prod_ed_dt_ymd}"/><br /><c:out value="${prodList.prod_ed_dt_hour}"/>:<c:out value="${prodList.prod_ed_dt_minute}"/></td>
							</c:when>
							<c:otherwise>
							<td class="alignCenter"><c:out value="${prodList.prod_category_nm}"/></td>
							<td class="alignCenter"><img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${prodList.prod_img_1}"/>&fileSn=0" width="100"  onerror="this.src='/images/baseScmtour/_noImage.png';"/></td>
							<td><small class="colorGray">[<c:out value="${prodList.prod_id}"/>]</small><br />
								<c:if test="${prodList.prod_use_st eq 'Y' }">
								<c:choose>
								<c:when test="${store_category ne 'CD002004' }">
								<a href="/shop/itemView.do?store_category=<c:out value="${store_category }"/>&prod_id=<c:out value="${prodList.prod_id }"/>" target="_blank">
								<c:out value="${prodList.prod_nm}"/> &nbsp;&nbsp;<i class="fas fa-external-link-alt"></i>
								</a>
								</c:when>
								<c:otherwise>
								<a href="/shop/itemView.do?store_category=<c:out value="${store_category }"/>&prod_category=<c:out value="${prodList.prod_category }"/>&prod_id=<c:out value="${prodList.prod_id }"/>"  target="_blank">
								<c:out value="${prodList.prod_nm}"/> &nbsp;&nbsp;<i class="fas fa-external-link-alt"></i>
								</a>
								</c:otherwise>
								</c:choose>
								</c:if>
								
								<c:if test="${prodList.prod_use_st ne 'Y' }">
								<c:out value="${prodList.prod_nm}"/>
								</c:if>
							</td>
							<td class="alignCenter"><c:out value="${prodList.store_nm}"/></td>
							<td class="alignRight"><fmt:formatNumber value="${prodList.prod_market_price }" type="number"/>원</td>
							<td class="alignRight"><fmt:formatNumber value="${prodList.prod_price }" type="number"/>원</td>
							<%--
							<td class="alignCenter">34,582</td>
							 --%>
							</c:otherwise>
							</c:choose>
							<td class="alignCenter"><fmt:formatNumber value="${prodList.prod_hit_cnt }" type="number"/></td>
							<td class="alignCenter">
							<c:choose>
								<c:when test="${prodList.prod_use_st eq 'Y' }"><span class="btns greenbtn h24px">판매중</span></c:when>
								<c:when test="${prodList.prod_use_st eq 'N' }"><span class="btns graybtn h24px">판매종료</span></c:when>
								<c:when test="${prodList.prod_use_st eq 'S' }"><span class="btns orangebtn h24px">Sold Out</span></c:when>
							</c:choose>
							</td>
							<td class="alignCenter">
							<c:choose>
								<c:when test="${prodList.prod_use_pay_st eq 'Y' }"><span class="btns greenbtn h24px">결제사용</span></c:when>
								<c:when test="${empty prodList.prod_use_pay_st || prodList.prod_use_pay_st eq 'N' }"><span class="btns graybtn h24px">결제미사용</span></c:when>
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
				<!-- } 축제/체험 상품리스트 -->

				<div class="pagination">
					<ul>
					<ui:pagination paginationInfo = "${paginationInfo}" type="image" jsFunction="jsPaging" />
					</ul>
				</div>

				<%-- <div class="pagenation">
					<ui:pagination paginationInfo = "${paginationInfo}" type="image" jsFunction="jsPaging" />
				</div> --%>				
				<script type="text/javascript">
				// 페이징함수
				function jsPaging(pageNo) {
					//console.log(pageNo);
					var searchKey = $.trim($('#searchKey').val());
					var searchKeyword = $.trim($('#searchKeyword').val());
					var searchType = $.trim($('#searchType').val());
					var store_category = $.trim($('#store_category').val());
			
					var linkurl = "/admgr/admgrProduct/productList.do?pageIndex="+pageNo;
					
					if(store_category) {
						linkurl += "&store_category="+store_category;
					}
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