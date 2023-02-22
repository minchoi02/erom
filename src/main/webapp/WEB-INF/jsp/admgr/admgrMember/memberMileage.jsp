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
			<h1 class="bigTit">마일리지관리</h1>
			<div class="pageComment">
				<div class="comment_ico"><i class="fad fa-comment-alt-smile"></i></div>
				<p>
					회원의 마일리지를 관리하는 페이지입니다.<br />
					회원 검색 후 마일리지를 임의로 증감할 수 있습니다.
				</p>
			</div>
			
			<!-- 회원관리 > 마일리지관리 { -->
			<section id="mileageManage" class="page_content floats">
				<form method="post" action="/admgr/admgrMember/memberMileageAction.do" id="memberMileageForm" onsubmit="return memberMileageSet()">
				<div class="lcon lconbox">
					<!-- 마일리지 증감 { -->
					<h2 class="h2Tit"><i class="fal fa-window-minimize"></i> 마일리지 증감</h2>
					<table class="admin_tbl admin_write_tbl">
						<caption>마일리지 증감</caption>
						<colgroup>
							<col />
						</colgroup>
						<tbody>
							<tr>
								<td>
									<input type="hidden" id="set_user_id"  name="set_user_id" value="" />
									<input type="text" id="set_user_nm"  name="set_user_nm" class="admin_input" size="12"  readonly />
									<button type="button" class="btns graybtn" onclick="getMemberSsarchModalOpen(); return false;" >검색</button>
								</td>
							</tr>
							<tr>
								<td>
									<p class="comment">* 마일리지 내용</p>
									<input type="text" id="user_mileage_content" name="user_mileage_content" class="admin_input w100" />
								</td>
							</tr>
							<tr>
								<td>
									<p class="comment">* 마일리지 증감</p>
									<select id="user_mileage_set" name="user_mileage_set" class="basic_select admin_select">
										<option value="+">더하기</option>
										<option value="-">빼기</option>
									</select>
									<input type="text" id="user_mileage" name="user_mileage" class="admin_input" /> 점
								</td>
							</tr>
						</tbody>
					</table>
					<!-- } 마일리지 증감 -->

					<div class="btnarea alignRight mgt20px">
						<button type="submit" class="btns redbtn"><i class="far fa-save"></i> 저장</button>
					</div>
				</div>
				</form>
				
				
				<div class="rcon">
					<!-- 리스트 검색 { -->
					<form id="mileageSearchForm" action="/admgr/admgrMember/memberMileage.do" method="post">
					<div class="list_search_box">
						<ul class="nopm floats">
							<li>
								<select class="basic_select search_select" id="searchKey" name="searchKey">
									<option value="user_nm" <c:if test="${searchKey eq 'user_nm' }">selected</c:if> >성명</option>
									<option value="user_id" <c:if test="${searchKey eq 'user_id' }">selected</c:if> >아이디</option>
									<option value="user_hp" <c:if test="${searchKey eq 'user_hp' }">selected</c:if> >연락처</option>
								</select>
							</li>
							<li><input type="text" id="searchKeyword" name="searchKeyword" class="search_input w300px" placeholder="검색어를 입력하세요." value="<c:out value="${searchKeyword }"/>" ></li>
							<li><button type="submit" class="search_submit"><i class="fal fa-search"></i> 검색</button></li>
							<li class="fr">전체 : <b><fmt:formatNumber value="${TotalCnt}" type="number"/></b>건</li>
						</ul>
					</div>
					</form>
					<!-- } 리스트 검색 -->
					
					<!-- 마일리지 리스트 { -->
					<table class="admin_tbl admin_list_tbl mgt10px">
						<caption>마일리지리스트</caption>
						<colgroup>
							<col width="200" />
							<col width="200" />
							<col />
							<col width="120" />
							<col width="120" />
						</colgroup>
						<thead>
							<tr>
								<th>일시</th>
								<th>성명(아이디)</th>
								<th>적립 내용</th>
								<th>마일리지</th>
								<th>마일리지 합계</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="mileageList" items="${mileageList}" varStatus="status">
							<tr>
								<td class="alignCenter fsize13"><c:out value="${mileageList.reg_dt }"/></td>
								<td class="alignCenter"><c:out value="${mileageList.user_nm}"/> (<c:out value="${mileageList.user_id}"/>)</td>
								<td><c:out value="${mileageList.user_mileage_content}"/></td>
								<td class="alignRight">
									<c:choose>
										<c:when test="${mileageList.user_mileage_set eq '+'}">
										<span class="colorBlue">+ 
										</c:when>
										<c:otherwise>
										<span class="colorRed">- 
										</c:otherwise>
									</c:choose>
									<fmt:formatNumber value="${fn:replace(mileageList.user_mileage,'-','')}" type="number"/></span> 원
								</td>
								<td class="alignRight"><fmt:formatNumber value="${mileageList.user_mileage_step_sum}" type="number"/> 원</td>
							</tr>
							</c:forEach>
						</tbody>
					</table>
					<!-- } 마일리지 리스트 -->

				<div class="pagination">
					<ul>
					<ui:pagination paginationInfo = "${paginationInfo}" type="image" jsFunction="jsPaging" />
					</ul>
				</div>
				</div>
			</section>
			<!-- } 회원관리 > 마일리지관리 -->
		</div>
		<!-- } 콘텐츠 영역 -->

		<script type="text/javascript">
		// 페이징함수
		function jsPaging(pageNo) {
			//console.log(pageNo);
			var searchKey = $.trim($('#searchKey').val());
			var searchKeyword = $.trim($('#searchKeyword').val());
	
			var linkurl = "/admgr/admgrMember/memberMileage.do?pageIndex="+pageNo;
			
			if(searchKey && searchKeyword) {
				linkurl += "&searchKey="+searchKey+"&searchKeyword="+searchKeyword;
			}
			//console.log(linkurl)
			location.href = linkurl;
		}
		</script>
		
<c:import url="/Api/admgrIncludeBottom.do"/>