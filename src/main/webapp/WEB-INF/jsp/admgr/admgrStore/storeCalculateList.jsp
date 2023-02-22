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
			<h1 class="bigTit">이롬정산</h1>
			<div class="pageComment">
				<div class="comment_ico"><i class="fad fa-comment-alt-smile"></i></div>
				<p>
					정산 페이지입니다.<br />
					선택한 년, 월 내에서 업체명이 가나다 순으로 정렬됩니다.
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
							<a href="#;" class="month btns h30px <c:if test="${month eq i }">aquabtn</c:if>" onclick="set_calc_month('<c:out value="${i }"/>')"> <c:out value="${i}"/>월</a>
						</c:forEach>
						</li>
						<input type="hidden" id="search_ym" name="search_ym" value="<c:out value="${thisYm }"/>"/>
					</ul>
					<%--
					<ul class="nopm floats mgt5px">
						<li>
							<select class="basic_select search_select" id="searchKey" name="searchKey">
								<option value="store_id">업체명</option>
								<option value="store_id">대표</option>
								<option value="store_id">운영자</option>
								<option value="store_id">연락처</option>
							</select>
						</li>
						<li><input type="text" class="search_input w300px" id="searchKeyword" name="searchKeyword" placeholder="검색어를 입력하세요." /></li>
						<li><button type="submit" class="search_submit"><i class="fal fa-search"></i> 검색</button></li>
						<li class="fr">전체 : <b>2,489</b>건</li>
					</ul>
					 --%>
				</div>
				<!-- } 리스트 검색 -->

				<%--
				<!-- 탭 버튼 { -->
				<nav id="tab-gnb" class="mgt20px">
					<ul class="nopm floats">
						<li class="active"><a href="#;">전체</a></li>
						<li><a href="#;">관광/체험</a></li>
						<li><a href="#;">숙박</a></li>
						<li><a href="#;">맛집</a></li>
						<li><a href="#;">서천장터</a></li>
					</ul>
				</nav>
				<!-- } 탭 버튼 -->
				 --%>

				<!-- 리스트 { -->
				<table class="admin_tbl admin_list_tbl mgt10px">
					<caption>정산 리스트</caption>
					<colgroup>
						<col width="80" />
						<col />
						<col width="120" />
						<col width="120" />
						<col width="180" />
						<col width="120" />
						<col width="120" />
					</colgroup>
					<thead>
						<tr>
							<th>번호</th>
							<th>업체명</th>
							<th>대표</th>
							<th>언략처</th>
							<th>금액</th>
							<th>상태</th>
							<th>관리</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="calcList" items="${calcList }">
						<%-- <c:set var="sum_price" value="${calcList.cal_total_order_price + calcList.cal_total_delivery_price - calcList.cal_total_coupon_price - calcList.cal_total_mileage}"/> --%>
						<c:set var="sum_price" value="${calcList.cal_total_order_price}"/>
						
						<tr>
							<td class="alignCenter"><c:out value="${StartPageNumber-1 }"/></td>
							<td><c:out value="${calcList.store_nm }"/> &nbsp; (총 <c:out value="${calcList.calc_total_cnt}"/>건)</td>
							<td class="alignCenter"><span data-toggle="tooltip" data-html="true" data-placement="bottom" title=""><c:out value="${calcList.store_ceo_nm }"/></span></td>
							<td class="alignCenter"><span data-toggle="tooltip" data-html="true" data-placement="bottom" title="연락처 "><c:out value="${calcList.store_tel}"/></span></td>
							<td class="alignRight"><b class="fsize16"><fmt:formatNumber value="${sum_price}" type="number"/></b> 원</td>
							<td class="alignCenter">
							<c:choose>
								<c:when test="${calcList.calc_total_cnt eq calcList.calc_no_cnt}"><span class="btns h24px">&nbsp;&nbsp;미정산&nbsp;&nbsp; </span></c:when>
								<c:when test="${calcList.calc_no_cnt eq '0'}"><span class="btns greenbtn h24px">정산완료</span></c:when>
								<c:otherwise><span class="btns graybtn h24px">부분정산</span></c:otherwise>
							</c:choose>
							</td>
							<td class="alignCenter"><a href="/admgr/admgrStore/storeCalculateDetail.do?pageIndex=<c:out value="${paginationInfo.currentPageNo }"/>&store_id=<c:out value="${calcList.cal_store_id}"/>&search_ym=<c:out value="${search_ym}"/>" class="btns bluebtn h24px">관리</a></td>
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
		<!-- } 콘텐츠 영역 -->
		
		<script type="text/javascript">
		// 페이징함수
		function jsPaging(pageNo) {
			var linkurl = "/admgr/admgrStore/storeCalculateList.do?pageIndex="+pageNo+"&search_ym=<c:out value="${search_ym}"/>";
			location.href = linkurl;
		}
		</script>


<c:import url="/Api/admgrIncludeBottom.do"/>