<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

	</div>
	
	<!-- 하단 푸터 { -->
	<footer id="footer">
		<div class="respon">
			<div class="flogo"><img src="/resource/img/logo2.png" alt="이롬로고" /></div>
			<p>
				${SiteBaseConfig.site_company_nm}  &nbsp; | &nbsp;   대표이사 : ${SiteBaseConfig.site_ceo_nm}  &nbsp; | &nbsp;   대표전화 <i class="fas fa-phone-rotary"></i>${SiteBaseConfig.site_tel }  &nbsp; | &nbsp;   팩스 : ${SiteBaseConfig.site_fax }<br />
				E-mail : ${SiteBaseConfig.site_info_adm_email}  &nbsp; | &nbsp;   주소 : (<c:out value="${SiteBaseConfig.site_zip}"/>) <c:out value="${SiteBaseConfig.site_addr_1}"/> <c:out value="${SiteBaseConfig.site_addr_2}"/><br/> 
				사업자등록번호 : <c:out value="${SiteBaseConfig.site_company_number}"/>  &nbsp; | &nbsp;   건강기능식품일반판매업 : 제2018-0286832  &nbsp; | &nbsp;   통신판매신고 : ${SiteBaseConfig.site_sail_auth_number}<br/>
				Copyright by Erom Healthcare. All rights reserved.
			</p>
		</div>
	</footer>
	<!-- } 하단 푸터 -->

</div>

<!-- 모달팝업 > 회원검색 { -->
<div id="memberSearch" class="modal fade" tabindex="1" role="dialog">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="closebtn" data-dismiss="modal" aria-label="Close"><i class="fal fa-times"></i></button>
				<h4 class="modal-title">회원검색</h4>
			</div>
			<div class="modal-body">
				<div class="commentbox colorRed">※ 탈퇴회원은 조회 불가합니다.</div>
				
				<!-- 리스트 검색 { -->
				<div class="list_search_box mgt10px">
					<ul class="nopm floats">
						<li>
							<select id="modalmembersearchKey" name="modalmembersearchKey" class="basic_select search_select">
								<option value="user_nm">성명</option>
								<option value="user_id">아이디</option>
								<option value="user_hp">연락처</option>
							</select>
						</li>
						<li><input type="text" id="modalmembersearchKeyword" name="modalmembersearchKeyword" class="search_input w300px" placeholder="검색어를 입력하세요." onkeydown="if(event.keyCode == 13) { return false; }" /></li>
						<li><a onclick="getMemberSearch()" class="search_submit"><i class="fal fa-search"></i> 검색</a></li>
					</ul>
				</div>
				<!-- } 리스트 검색 -->

				<!-- 회원 리스트 { -->
				<table class="admin_tbl admin_list_tbl mgt10px">
					<caption>회원리스트</caption>
					<colgroup>
						<col width="80" />
						<col />
						<col />
						<col width="120" />
						<col width="120" />
						<col width="100" />
					</colgroup>
					<thead>
						<tr>
							<th>번호</th>
							<th>아이디</th>
							<th>성명</th>
							<th>연락처</th>
							<th>가입일</th>
							<th>관리</th>
						</tr>
					</thead>
					<tbody id="searchMemberResult">
						<tr>
							<td class="alignCenter" colspan="6" class="colorRed">검색하신 후, 선택하세요.</td>
						</tr>
					</tbody>
				</table>
				<!-- } 회원 리스트 -->
			</div>
		</div>
	</div>
</div>
<!-- } 모달팝업 > 회원검색 -->
<!-- 모달팝업 > 상점회원검색 { -->
<div id="storememberSearch" class="modal fade" tabindex="1" role="dialog">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="closebtn" data-dismiss="modal" aria-label="Close"><i class="fal fa-times"></i></button>
				<h4 class="modal-title">상점회원검색</h4>
			</div>
			<div class="modal-body">
				<div class="commentbox colorRed">※ 상점등급 회원만 조회가 가능합니다.</div>
				<div class="commentbox colorRed">※ 탈퇴회원은 조회 불가합니다.</div>
				
				<!-- 리스트 검색 { -->
				<div class="list_search_box mgt10px">
					<ul class="nopm floats">
						<li>
							<select id="modalStoremembersearchKey" name="modalStoremembersearchKey" class="basic_select search_select">
								<option value="user_nm">성명</option>
								<option value="user_id">아이디</option>
								<option value="user_hp">연락처</option>
							</select>
						</li>
						<li><input type="text" id="modalStoremembersearchKeyword" name="modalStoremembersearchKeyword" class="search_input w300px" placeholder="검색어를 입력하세요." onkeydown="if(event.keyCode == 13) { return false; }" /></li>
						<li><a onclick="getStoreMemberSearch()" class="search_submit"><i class="fal fa-search"></i> 검색</a></li>
					</ul>
				</div>
				<!-- } 리스트 검색 -->

				<!-- 회원 리스트 { -->
				<table class="admin_tbl admin_list_tbl mgt10px">
					<caption>회원리스트</caption>
					<colgroup>
						<col width="80" />
						<col />
						<col />
						<col width="120" />
						<col width="120" />
						<col width="100" />
					</colgroup>
					<thead>
						<tr>
							<th>번호</th>
							<th>아이디</th>
							<th>성명</th>
							<th>연락처</th>
							<th>가입일</th>
							<th>관리</th>
						</tr>
					</thead>
					<tbody id="searchStoreMemberResult">
						<tr>
							<td class="alignCenter" colspan="6" class="colorRed">검색하신 후, 선택하세요.</td>
						</tr>
					</tbody>
				</table>
				<!-- } 회원 리스트 -->
			</div>
		</div>
	</div>
</div>
<!-- } 모달팝업 > 상점회원검색 -->
	
<!-- 모달팝업 > 상점검색 { -->
<div id="storeSearch" class="modal fade" tabindex="1" role="dialog">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="closebtn" data-dismiss="modal" aria-label="Close"><i class="fal fa-times"></i></button>
				<h4 class="modal-title">상점검색</h4>
			</div>
			<div class="modal-body">
				<!-- 리스트 검색 { -->
				<div class="list_search_box mgt10px">
					<ul class="nopm floats">
						<li>
							<select id="modalStoresearchKey" name="modalStoresearchKey" class="basic_select search_select">
								<option value="store_nm">업체명</option>
								<option value="store_ceo_nm">대표자명</option>
								<option value="store_tel">대표전화</option>
								<option value="store_hp">핸드폰</option>
							</select>
						</li>
						<li><input type="text" id="modalStoresearchKeyword" name="modalStoresearchKeyword" class="search_input w300px" placeholder="검색어를 입력하세요." onkeydown="if(event.keyCode == 13) { return false; }" /></li>
						<li><button type="button"  onclick="getStoreSearch('<c:out value="${store_category }"/>')"  class="search_submit"><i class="fal fa-search"></i> 검색</button></li>
					</ul>
				</div>
				<!-- } 리스트 검색 -->

				<!-- 상점 리스트 { -->
				<table class="admin_tbl admin_list_tbl mgt10px">
					<caption>회원리스트</caption>
					<colgroup>
						<col width="80" />
						<col />
						<col width="120" />
						<col width="120" />
						<col width="100" />
						<col width="100" />
					</colgroup>
					<thead>
						<tr>
							<th>번호</th>
							<th>업체명</th>
							<th>대표</th>
							<th>연락처</th>
							<th>상태</th>
							<th>선택</th>
						</tr>
					</thead>
					<tbody id="searchStoreResult">
						<tr>
							<td class="alignCenter" colspan="6" class="colorRed">검색하신 후, 선택하세요.</td>
						</tr>
					</tbody>
				</table>
				<!-- } 상점 리스트 -->
			</div>
		</div>
	</div>
</div>
<!-- } 모달팝업 > 상점검색 -->

<!-- 모달팝업 > 상품검색 { -->
<div id="productSearch" class="modal fade" tabindex="1" role="dialog">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="closebtn" data-dismiss="modal" aria-label="Close"><i class="fal fa-times"></i></button>
				<h4 class="modal-title">상품검색</h4>
			</div>
			<div class="modal-body">
				<input type="hidden" id="in_id" />
				<input type="hidden" id="in_prod_id" />
				<input type="hidden" id="in_store_category" />
				<div class="commentbox colorRed">※ 운영중지중인 상품은 조회 불가합니다.</div>
				
				<!-- 리스트 검색 { -->
				<div class="list_search_box mgt10px">
					<ul class="nopm floats">
						<li>
							<input type="hidden" id="modal_use_pay_st" name="modalprod_use_pay_st" valye="Y" />
							<select class="basic_select search_select" id="modalprodstore_category" name="modalprodstore_category" >
								<option value="">스토어 선택</option>
								<!--  <option value="CD002001" <c:if test="${modalstore_category eq 'CD002001' }">selected</c:if> >관광/체험</option>
								<option value="CD002002" <c:if test="${modalstore_category eq 'CD002002' }">selected</c:if> >숙박</option>
								<option value="CD002003" <c:if test="${modalstore_category eq 'CD002003' }">selected</c:if> >맛집</option>
								-->
								<option value="CD002004" <c:if test="${modalstore_category eq 'CD002004' }">selected</c:if> >이롬 스토어</option>
							</select>
							<select class="basic_select search_select"  id="modalprodsearchKey" name="modalprodsearchKey" >
								<option value="prod_nm" <c:if test="${modalsearchKey eq 'prod_nm' }">selected</c:if> >상품명</option>
								<option value="store_nm" <c:if test="${modalsearchKey eq 'prod_store_nm' }">selected</c:if> >분류명</option>
\						</select>
						</li>
						<li><input type="text" class="search_input w300px" placeholder="검색어를 입력하세요."  id="modalprodsearchKeyword" name="modalprodsearchKeyword" value="<c:out value="${modalsearchKeyword }"/>" onkeydown="if(event.keyCode == 13) { return false; }" /></li>
						<li><button type="button" onclick="getProdSearch();" class="search_submit" ><i class="fal fa-search"></i> 검색</button></li>
					</ul>
				</div>
				<!-- } 리스트 검색 -->

				<!-- 상품 리스트 { -->
				<table class="admin_tbl admin_list_tbl mgt10px">
					<caption>상품리스트</caption>
					<colgroup>
						<col width="80" />
						<col width="100" />
						<col />
						<col />
						<col width="150" />
						<col width="80" />
					</colgroup>
					<thead>
						<tr>
							<th>번호</th>
							<th>상점</th>
							<th colspan="2">상품명</th>
							<th>분류명</th>
							<th>선택</th>
						</tr>
					</thead>
					<tbody id="modalsearchProductResult">
						<tr>
							<td class="alignCenter" colspan="6" class="colorRed">검색하신 후, 선택하세요.</td>
						</tr>
					</tbody>
				</table>

				<!-- } 상품 리스트 -->
			</div>
		</div>
	</div>
</div>
<!-- } 모달팝업 > 상품검색 -->

<!-- 모달팝업 > 쿠폰검색 { -->
<div id="couponSearch" class="modal fade" tabindex="1" role="dialog">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="closebtn" data-dismiss="modal" aria-label="Close"><i class="fal fa-times"></i></button>
				<h4 class="modal-title">쿠폰검색</h4>
			</div>
			<div class="modal-body">
				<div class="commentbox colorRed">※ 기간이 지난 쿠폰은 조회 불가합니다.</div>
				
				<!-- 리스트 검색 { -->
				<div class="list_search_box mgt10px">
					<ul class="nopm floats">
						<input type="hidden" id="cp_bbs_id" />
						<li><input type="text" class="search_input w300px" id="modalcouponsearchKeyword" name="modalcouponsearchKeyword" placeholder="검색어를 입력하세요." onkeydown="if(event.keyCode == 13) { return false; }" /></li>
						<li><button type="button" class="search_submit" onclick="getCouponSearch()" ><i class="fal fa-search"></i> 검색</button></li>
					</ul>
				</div>
				<!-- } 리스트 검색 -->

				<!-- 쿠폰 리스트 { -->
				<table class="admin_tbl admin_list_tbl mgt10px">
					<caption>쿠폰리스트</caption>
					<colgroup>
						<col width="80" />
						<col width="100" />
						<col />
						<col width="100" />
						<col width="80" />
					</colgroup>
					<thead>
						<tr>
							<th>번호</th>
							<th>대상</th>
							<th>쿠폰명</th>
							<th>할인금액</th>
							<th>선택</th>
						</tr>
					</thead>
					<tbody id="searchCouponResult">
						<tr>
							<td class="alignCenter" colspan="6" class="colorRed">검색하신 후, 선택하세요.</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>
<!-- } 모달팝업 > 쿠폰검색 -->	

<script>
var ThisURL = window.location.href;
$("#return_url").val(ThisURL);
</script>

</body>
</html>