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
			<h1 class="bigTit">상점관리</h1>
			<div class="pageComment">
				<div class="comment_ico"><i class="fad fa-comment-alt-smile"></i></div>
				<p>
					<c:if test="${adminLevel > 5 }">
					가맹 상점 등록 및 관리하는 페이지입니다.<br />
					</c:if>
					운영에 필요한 기본정보를 이 페이지에서 관리할 수 있습니다.<br>
				</p>
			</div>
			
			<!-- 상점관리 > 상점관리 > 리스트 { -->
			<section id="storeList" class="page_content">
				<c:if test="${adminLevel > 5 }">
				<form method="get" action="" id="storeSesrahForm" name="storeSesrahForm" >
				<input type="hidden" id="store_category" name="store_category" value="<c:out value="${store_category}"/>"  />
				<!-- 리스트 검색 { -->
				<div class="list_search_box">
					<ul class="nopm floats">
						<li>
							<select class="basic_select search_select" id="searchKey" name="searchKey">
								<option value="store_nm" <c:if test="${searchKey eq 'store_nm' }">selected</c:if> >업체명</option>
								<option value="store_ceo_nm" <c:if test="${searchKey eq 'store_ceo_nm' }">selected</c:if> >대표</option>
								<option value="store_tel" <c:if test="${searchKey eq 'store_tel' }">selected</c:if> >대표전화</option>
								<option value="store_hp" <c:if test="${searchKey eq 'store_hp' }">selected</c:if> >핸드폰</option>
								<option value="store_id" <c:if test="${searchKey eq 'store_id' }">selected</c:if> >상점ID</option>
							</select>
						</li>
						<li><input type="text" class="search_input w300px" placeholder="검색어를 입력하세요." id="searchKeyword" name="searchKeyword" value="<c:out value="${searchKeyword }"/>" /></li>
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
				</c:if>
				<!-- } 리스트 검색 -->

				<!-- 탭 버튼 { -->
<!--  
				<c:if test="${adminLevel > 5 }">
				<nav id="tab-gnb" class="mgt20px">
					<ul class="nopm floats">
						<li <c:if test="${empty store_category && empty store_use_st}">class="active"</c:if> ><a href="/admgr/admgrStore/storeList.do">전체</a></li>						
						<li <c:if test="${store_category eq 'CD002001'}">class="active"</c:if> ><a href="/admgr/admgrStore/storeList.do?store_category=CD002001&searchKey=<c:out value="${searchKey }"/>&searchKeyword=<c:out value="${searchKeyword }"/>&searchType=<c:out value="${searchType }"/>">관광/체험</a></li>
						<li <c:if test="${store_category eq 'CD002002'}">class="active"</c:if> ><a href="/admgr/admgrStore/storeList.do?store_category=CD002002&searchKey=<c:out value="${searchKey }"/>&searchKeyword=<c:out value="${searchKeyword }"/>&searchType=<c:out value="${searchType }"/>">숙박</a></li>
						<li <c:if test="${store_category eq 'CD002003'}">class="active"</c:if> ><a href="/admgr/admgrStore/storeList.do?store_category=CD002003&searchKey=<c:out value="${searchKey }"/>&searchKeyword=<c:out value="${searchKeyword }"/>&searchType=<c:out value="${searchType }"/>">맛집</a></li>
						<li <c:if test="${store_category eq 'CD002004'}">class="active"</c:if> ><a href="/admgr/admgrStore/storeList.do?store_category=CD002004&searchKey=<c:out value="${searchKey }"/>&searchKeyword=<c:out value="${searchKeyword }"/>&searchType=<c:out value="${searchType }"/>">이롬</a></li>
						<li class="fr  <c:if test="${not empty store_use_st}">active</c:if> "><a href="/admgr/admgrStore/storeList.do?store_use_st=R" class="colorRed">운영중지업체</a></li>
					</ul>
				</nav>
				</c:if>
-->				
				<!-- } 탭 버튼 -->

				<!-- 리스트 { -->
				<table class="admin_tbl admin_list_tbl mgt10px">
					<caption>상점 리스트</caption>
					<colgroup>
						<col width="80" />
						<col />
						<col width="100" />
<!-- 						
						<col width="80" />
						<col width="80" />
						<col width="80" />
						<col width="80" />
-->						
						<col width="150" />
						<col width="180" />
						<col width="100" />
						<col width="100" />
					</colgroup>
					<thead>
						<tr>
							<th>번호</th>
							<th>업체명</th>
							<th>대표</th>
<!-- 						<th>관광/체험</th>
							<th>숙박</th>
							<th>맛집</th>
							<th>서천장터</th>
 -->							
							<th>대표번호</th>
							<th>등록일</th>
							<th>상태</th>
							<th>관리</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="storeList" items="${storeList}" varStatus="status">
						<tr>
							<td class="alignCenter"><c:out value="${StartPageNumber-status.count}"/></td>
							<td><c:out value="${storeList.store_nm}"/></td>  							
							<td class="alignCenter"><c:out value="${storeList.store_ceo_nm}"/></td>
<!--
							<td class="alignCenter"><c:if test="${storeList.store_use_travel eq 'Y' }">●</c:if></td>
							<td class="alignCenter"><c:if test="${storeList.store_use_house eq 'Y' }">●</c:if></td>
							<td class="alignCenter"><c:if test="${storeList.store_use_food eq 'Y' }">●</c:if></td>
							<td class="alignCenter"><c:if test="${storeList.store_use_market eq 'Y' }">●</c:if></td>
-->							
							<td class="alignCenter"><c:out value="${storeList.store_hp_1}"/></td>
							<td class="alignCenter"><c:out value="${storeList.reg_dt}"/></td>
							<td class="alignCenter">
							<c:choose>
								<c:when test="${storeList.store_use_st eq 'Y' }"><span class="btns greenbtn h24px">운영중</span></c:when>
								<c:otherwise><span class="btns graybtn h24px">운영중지</span></c:otherwise>
							</c:choose>
							</td>
							<td class="alignCenter">
							<c:choose>
								<c:when test="${adminLevel > 5 }">
								<a href="/admgr/admgrStore/storeForm.do?pageIndex=<c:out value="${paginationInfo.currentPageNo }"/>&store_category=<c:out value="${store_category}"/>&searchKey=<c:out value="${searchKey }"/>&searchType=<c:out value="${searchType}"/>&searchKeyword=<c:out value="${searchKeyword }"/>&store_seq=<c:out value="${storeList.store_seq}"/>" class="btns bluebtn h24px">관리</a>
								</c:when>
								<c:otherwise>
								<a href="/admgr/admgrStore/storeForm.do?pageIndex=<c:out value="${paginationInfo.currentPageNo }"/>&store_seq=<c:out value="${storeList.store_seq}"/>" class="btns bluebtn h24px">관리</a>
								</c:otherwise>
							</c:choose>
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

				
				<c:if test="${adminLevel > 5 }">
				<div class="btnarea alignRight mgt30px">
					<a href="/admgr/admgrStore/storeForm.do" class="btns redbtn"><i class="fal fa-store"></i> 상점등록</a>
				</div>
				</c:if>
			</section>
			<!-- } 상점관리 > 상점관리 > 리스트 -->
		</div>
		<!-- } 콘텐츠 영역 -->
		
		<script type="text/javascript">
		// 페이징함수
		function jsPaging(pageNo) {
			//console.log(pageNo);
			var searchKey = $.trim($('#searchKey').val());
			var searchKeyword = $.trim($('#searchKeyword').val());
			var searchType = $.trim($('#searchType').val());
			var store_category = $.trim($('#store_category').val());
	
			var linkurl = "/admgr/admgrStore/storeList.do?pageIndex="+pageNo;
			<c:if test="${adminLevel > 5 }">		
			if(store_category) {
				linkurl += "&store_category="+store_category;
			}
			if(searchKey && searchKeyword) {
				linkurl += "&searchKey="+searchKey+"&searchKeyword="+searchKeyword;
			}
			if(searchType) {
				linkurl += "&searchType="+searchType;
			}
			</c:if>
			//console.log(linkurl)
			location.href = linkurl;
		}
		</script>


<c:import url="/Api/admgrIncludeBottom.do"/>