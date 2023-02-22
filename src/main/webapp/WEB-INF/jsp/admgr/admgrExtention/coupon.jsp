<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:import url="/Api/admgrIncludeTop.do"/>
<c:import url="/Api/admgrIncludeLeftMenu.do"/>

<c:set var="coupon_id" value="${couponId }"/>
<c:set var="stat_ment" value="등록"/>
<c:if test="${not empty couponInfo.coupon_id }">
	<c:set var="coupon_id" value="${couponInfo.coupon_id }"/>
	<c:set var="stat_ment" value="수정"/>
</c:if>

		<!-- 콘텐츠 영역 { -->
		<div id="content">
			<h1 class="bigTit">쿠폰관리</h1>
			<div class="pageComment">
				<div class="comment_ico"><i class="fad fa-comment-alt-smile"></i></div>
				<p>
					쿠폰을 생성, 관리합니다.
				</p>
			</div>
			
			<!-- 부가기능 > 쿠폰관리 { -->
			<section id="pushState" class="page_content floats">
			
				<form method="post" id="couponForm" name="couponForm" action="/admgr/admgrExtention/couponAction.do" onsubmit="return couponFormCheck()" >
				<input type="hidden" name="coupon_seq" value="<c:out value="${coupon_seq}"/>" />
				<input type="hidden" name="pageIndex" value="<c:out value="${pageIndex}"/>" />
				<input type="hidden" name="searchKeyword" value="<c:out value="${searchKeyword}"/>" />
				<input type="hidden" id="return_url" name="return_url" value="" />
				<div class="lcon lconbox">
					<!-- 쿠폰 입력 { -->
					<h2 class="h2Tit"><i class="fal fa-window-minimize"></i>쿠폰 <c:out value="${stat_ment}"/></h2>
					<table class="admin_tbl admin_write_tbl">
						<caption>쿠폰 입력</caption>
						<colgroup>
							<col />
						</colgroup>
						<tbody>
							<tr>
								<td>
									<p class="comment">쿠폰사용</p>
									<input type="checkbox" id="coupon_use_st" name="coupon_use_st"  value="Y" <c:if test="${couponInfo.coupon_use_st eq 'Y' }">checked</c:if> class="admin_check" /><label for="coupon_use_st">사용</label>
								</td>
							</tr>
							<tr>
								<td>
									<p class="comment">쿠폰아이디</p>
									<input type="text" id="coupon_id" name="coupon_id" class="admin_input readonly w100"  value="<c:out value="${coupon_id }"/>" readonly /> 
									<p class="comment">자동생성 및 관리됩니다.</p>
								</td>
							</tr>
							<tr>
								<td>
									<p class="comment">쿠폰명</p>
									<input type="text" id="coupon_nm" name="coupon_nm" class="admin_input w100" value="<c:out value="${couponInfo.coupon_nm }"/>"/>
								</td>
							</tr>
							<tr>
								<td>
									<p class="comment">적용 카테고리</p>
									<select class="basic_select admin_select" id="store_category" name="store_category">
										<option value="" <c:if test="${empty couponInfo.store_category}">selected</c:if> >전체</option>
										
										<option value="CD002004" <c:if test="${couponInfo.store_category eq 'CD002004' }">selected</c:if>>이롬스토어</option>
									</select>
								</td>
							</tr>
							<tr>
								<td>
									<p class="comment">쿠폰형태</p>
									<select class="basic_select admin_select" id="coupon_set_st" name="coupon_set_st" onchange="coupon_unit_change(this.value);" >
										<option value="W" <c:if test="${couponInfo.coupon_set_st eq 'W' }">selected</c:if> >원할인</option>
										<option value="P" <c:if test="${couponInfo.coupon_set_st eq 'P' }">selected</c:if> >%할인</option>
									</select>
								</td>
							</tr>
							<tr>
								<td>
									<p class="comment">할인금액</p>
									<c:set var="coupon_unit" value="원"/>
									<c:if test="${couponInfo.coupon_set_st eq 'P' }">
										<c:set var="coupon_unit" value="%"/>
									</c:if>${coupon_set_st}
									<input type="text" id="coupon_set_price" name="coupon_set_price" class="admin_input alignRight" size="15" onkeyup="max_value('coupon_set_price','coupon_set_st')" value="<c:out value="${couponInfo.coupon_set_price }"/>" /> 
									<span id="coupon_unit"><c:out value="${coupon_unit }"/></span>
									<p class="comment">%의 경우, 소숫점2자리까지만 인식하며, 100%를 넘을 수 없습니다.</p>
								</td>
							</tr>
							<tr>
								<td>
									<p class="comment">시작일시</p>
									<input type="text" id="coupon_st_dt_ymd" name="coupon_st_dt_ymd"   value="<c:out value="${couponInfo.coupon_st_dt_ymd }"/>" class="admin_input datepicker readonly" size="12" placeholder="날짜"  readonly />
									<select id="coupon_st_dt_hour" name="coupon_st_dt_hour" class="basic_select w100px"></select>
									<select id="coupon_st_dt_minute" name="coupon_st_dt_minute" class="basic_select w100px"></select>
									<script>getHourSelect("coupon_st_dt_hour", "S", "<c:out value="${couponInfo.coupon_st_dt_hour }"/>");</script>
									<script>getMinuteSelect("coupon_st_dt_minute", "S", "<c:out value="${couponInfo.coupon_st_dt_minute}"/>");</script>
								</td>
							</tr>
							<tr>
								<td>
									<p class="comment">종료일시</p>
									<input type="text" id="coupon_ed_dt_ymd" name="coupon_ed_dt_ymd"  value="<c:out value="${couponInfo.coupon_ed_dt_ymd }"/>" class="admin_input datepicker readonly"  size="12" placeholder="날짜"  readonly/>
									<select id="coupon_ed_dt_hour" name="coupon_ed_dt_hour" class="basic_select w100px"></select>
									<select id="coupon_ed_dt_minute" name="coupon_ed_dt_minute" class="basic_select w100px"></select>
									<script>getHourSelect("coupon_ed_dt_hour", "E", "<c:out value="${couponInfo.coupon_ed_dt_hour }"/>");</script>
									<script>getMinuteSelect("coupon_ed_dt_minute", "E", "<c:out value="${couponInfo.coupon_ed_dt_minute }"/>");</script>
								</td>
							</tr>
						</tbody>
					</table>
					<!-- } 쿠폰 입력 -->

					<div class="btnarea alignRight mgt20px">
						<button type="submit" class="btns redbtn"><i class="far fa-save"></i> <c:out value="${stat_ment}"/></button>
					</div>
					</form>
				</div>
				
				
				<div class="rcon">
					<!-- 리스트 검색 { -->
					<form id="mileageSearchForm" action="/admgr/admgrMember/memberMileage.do" method="post">
					<div class="list_search_box">
						<ul class="nopm floats">
							<li><input type="text" class="search_input w300px" id="searchKeyword" name="searchKeyword" placeholder="검색어를 입력하세요." /></li>
							<li><button type="submit" class="search_submit"><i class="fal fa-search"></i> 검색</button></li>
							<li class="fr">전체 : <b><fmt:formatNumber value="${TotalCnt}" type="number"/></b>건</li>
						</ul>
					</div>
					</form>
					<!-- } 리스트 검색 -->

					<!-- 탭 버튼 { -->
<%-- 					<nav id="tab-gnb" class="mgt20px">
						<ul class="nopm floats">
							<li <c:if test="${empty store_category }">class="active"</c:if> ><a href="/admgr/admgrExtention/coupon.do">전체</a></li>
							<li <c:if test="${store_category eq 'CD002004'}">class="active"</c:if> ><a href="/admgr/admgrExtention/coupon.do?store_category=CD002004&searchKeyword=<c:out value="${searchKeyword }"/>">이롬스토어</a></li>
						</ul>
					</nav> --%>
					<!-- } 탭 버튼 -->
					
					<!-- 쿠폰 리스트 { -->
					<table class="admin_tbl admin_list_tbl mgt10px">
						<caption>쿠폰 리스트</caption>
						<colgroup>
							<col width="100" />
							<col width="80" />
							<col />
							<col width="100" />
							<col width="100" />
							<col width="100" />
							<col width="100" />
							<col width="130" />
						</colgroup>
						<thead>
							<tr>
								<th>등록일시</th>
								<th>대상</th>
								<th>내용</th>
								<th>할인금액</th>
								<th>시작일시</th>
								<th>종료일시</th>
								<th>상태</th>
								<th>관리</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="couponList" items="${couponList}" varStatus="status">
							<tr>
								<td class="alignCenter fsize13"><c:out value="${couponList.reg_dt_ymd }"/><br /><c:out value="${couponList.reg_dt_his}"/></td>
								<td class="alignCenter"><c:out value="${couponList.store_category_nm}"/><c:if test="${empty couponList.store_category_nm }">전체</c:if></td>
								<td><c:out value="${couponList.coupon_nm}"/></td>
								<td class="alignRight">
								<c:choose>
									<c:when test="${couponList.coupon_set_st eq 'W'}"><fmt:formatNumber value="${couponList.coupon_set_price}" type="number"/>원</c:when>
									<c:otherwise><c:out value="${couponList.coupon_set_price }"/>%</c:otherwise>
								</c:choose>
								</td>
								<td class="alignCenter fsize13"><c:out value="${couponList.coupon_st_dt_ymd}"/><br /><c:out value="${couponList.coupon_st_dt_hour}"/>:<c:out value="${couponList.coupon_st_dt_minute}"/>:00</td>
								<td class="alignCenter fsize13"><c:out value="${couponList.coupon_ed_dt_ymd}"/><br /><c:out value="${couponList.coupon_ed_dt_hour}"/>:<c:out value="${couponList.coupon_ed_dt_minute}"/>:00</td>
								<td class="alignCenter fsize13">
								<c:choose>
								<c:when test="${couponList.coupon_use_st eq 'Y' }">
									<c:choose>
										<c:when test="${couponList.coupon_use_status eq 'E'}"><span class="btns lightgraybtn h24px">종료</span></c:when>
										<c:when test="${couponList.coupon_use_status eq 'R'}"><span class="btns orangebtn h24px">대기</span></c:when>
										<c:otherwise><span class="btns greenbtn h24px">진행중</span></c:otherwise>
									</c:choose>
								</c:when>
								<c:otherwise><span class="btns redbtn h24px">사용안함</span></c:otherwise>
							</c:choose>
								</td>
								<td class="alignCenter">
									<a href="/admgr/admgrExtention/coupon.do?pageIndex=<c:out value="${paginationInfo.currentPageNo }"/>&store_category=<c:out value="${store_category }"/>&searchKeyword=<c:out value="${searchKeyword }"/>&coupon_seq=<c:out value="${couponList.coupon_seq }"/>" class="btns bluebtn h24px">수정</a>
									<a href="#" onclick="delcoupon('<c:out value="${paginationInfo.currentPageNo }"/>','<c:out value="${couponList.coupon_seq}"/>','<c:out value="${searchKeyword}"/>','<c:out value="${store_category}"/>');"  class="btns lightbluebtn h24px">삭제</a>
								</td>
							</tr>
							</c:forEach>
						</tbody>
					</table>
					<!-- } 쿠폰 리스트 -->

				<div class="pagination">
				<ul>
					<ui:pagination paginationInfo = "${paginationInfo}" type="image" jsFunction="jsPaging" />
				</ul>
				</div>
				</div>
			</section>
			<!-- } 부가기능 > 쿠폰관리 -->
		</div>
		<!-- } 콘텐츠 영역 -->
		
		<script type="text/javascript">
		// 페이징함수 
		function jsPaging(pageNo) {
			//console.log(pageNo);
			var searchKeyword = $.trim($('#searchKeyword').val());
	
			var linkurl = "/admgr/admgrExtention/coupon.do?pageIndex="+pageNo;
			
			if(searchKeyword) {
				linkurl += "&searchKeyword="+searchKeyword;
			}
			//console.log(linkurl)
			location.href = linkurl;
		}
		</script>


<c:import url="/Api/admgrIncludeBottom.do"/>