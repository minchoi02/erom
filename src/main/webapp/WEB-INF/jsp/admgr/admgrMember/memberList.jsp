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
			<h1 class="bigTit">회원관리</h1>
			<div class="pageComment">
				<div class="comment_ico"><i class="fad fa-comment-alt-smile"></i></div>
				<p>
					회원을 관리하는 페이지입니다.<br />
					주문정보 저장을 위해 회원은 탈퇴 및 삭제 되어도 기본 정보는 남아있습니다.
				</p>
			</div>
			
			<!-- 회원관리 > 회원관리 > 리스트 { -->
			<section id="memberList" class="page_content">
				<!-- 리스트 검색 { -->
				<form method="get" action="" id=memberSesrahForm" name="memberSesrahForm" >
				<input type="hidden" name="user_level" value="<c:out value="${admgrMemberVO.user_level }"/>"  />
				<div class="list_search_box">
					<ul class="nopm floats">
						<li>
							<select id="searchKey" name="searchKey" class="basic_select search_select">
								<option value="user_nm" <c:if test="${searchKey eq 'user_nm'}">selected</c:if> >성명</option>
								<option value="user_id" <c:if test="${searchKey eq 'user_id'}">selected</c:if> >아이디</option>
								<option value="user_hp" <c:if test="${searchKey eq 'user_hp'}">selected</c:if> >연락처</option>
							</select>
						</li>
						<li><input type="text" autocomplete="off" id="searchKeyword" name="searchKeyword" class="search_input w300px" placeholder="검색어를 입력하세요." value="<c:out value="${searchKeyword }"/>" /></li>
						<li><button type="submit" class="search_submit"><i class="fal fa-search"></i> 검색</button></li>
						<li class="fr">전체 : <b><fmt:formatNumber value="${paginationInfo.totalRecordCount }" type="number"/></b>건</li>
					</ul>
				</div>
				</form>
				<!-- } 리스트 검색 -->

				<!-- 탭 버튼 { -->
				<nav id="tab-gnb" class="mgt20px">
					<ul class="nopm floats">
						<li <c:if test="${empty admgrMemberVO.user_level }">class="active"</c:if> ><a href="/admgr/admgrMember/memberList.do?searchKey=<c:out value="${searchKey}"/>&searchKeyword=<c:out value="${searchKeyword}"/>">전체</a></li>
						<li <c:if test="${admgrMemberVO.user_level eq '2' }">class="active"</c:if> ><a href="/admgr/admgrMember/memberList.do?user_level=2&searchKey=<c:out value="${searchKey}"/>&searchKeyword=<c:out value="${searchKeyword}"/>">일반회원</a></li>
						<li <c:if test="${admgrMemberVO.user_level eq '5' }">class="active"</c:if> ><a href="/admgr/admgrMember/memberList.do?user_level=5&searchKey=<c:out value="${searchKey}"/>&searchKeyword=<c:out value="${searchKeyword}"/>">상점회원</a></li>
						<li <c:if test="${admgrMemberVO.user_level eq '10' }">class="active"</c:if> ><a href="/admgr/admgrMember/memberList.do?user_level=10&searchKey=<c:out value="${searchKey}"/>&searchKeyword=<c:out value="${searchKeyword}"/>">관리자</a></li>
						<li class="fr <c:if test="${admgrMemberVO.user_level eq '1' }">class="active"</c:if>" ><a href="/admgr/admgrMember/memberList.do?user_level=1&searchKey=<c:out value="${searchKey}"/>&searchKeyword=<c:out value="${searchKeyword}"/>" class="colorRed">탈퇴회원</a></li>
					</ul>
				</nav>
				<!-- } 탭 버튼 -->

				<!-- 리스트 { -->
				<table class="admin_tbl admin_list_tbl mgt10px">
					<caption>회원리스트</caption>
					<colgroup>
						<col width="80" />
						<col />
						<col />
						<col />
						<col width="150" />
						<col width="200" />
						<col width="200" />
						<col width="100" />
						<col width="100" />
					</colgroup>
					<thead>
						<tr>
							<th>번호</th>
							<th>아이디</th>
							<th>성명</th>
							<th>회원등급</th>
							<th>연락처</th>
							<th>최종접속</th>
							<th>가입일</th>
							<th>상태</th>
							<th>관리</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="MemberList" items="${MemberList}" varStatus="status">
						<tr>
							<td class="alignCenter"><c:out value="${StartPageNumber-status.count}"/></td>
							<td class="alignCenter">
							<c:choose>
								<c:when test="${MemberList.user_join_fl eq 'naver'}"><img src="/images/baseScmtour/ico_naver.png" height="24" alt="네이버"> </c:when>
								<c:when test="${MemberList.user_join_fl eq 'kakao'}"><img src="/images/baseScmtour/ico_kakao.png" height="24" alt="카카오"> </c:when>
								<c:when test="${MemberList.user_join_fl eq 'facebook'}"><img src="/images/baseScmtour/ico_facebook.png" height="24" alt="페이스북"> </c:when>
								<c:when test="${MemberList.user_join_fl eq 'google'}"><img src="/images/baseScmtour/ico_google.png" height="24" alt="구글"> </c:when>
								<c:when test="${MemberList.user_join_fl eq 'apple'}"><img src="/images/baseScmtour/ico_apple.png" height="24" alt="애플"> </c:when>
								<c:otherwise></c:otherwise>
							</c:choose>
							<c:out value="${MemberList.user_id }"/>
							</td>
							<td class="alignCenter"><c:out value="${MemberList.user_nm }"/></td>
							<td class="alignCenter">
								<c:choose>
									<c:when test="${MemberList.user_level eq '5' }">상점회원</c:when>
									<c:when test="${MemberList.user_level eq '10' }">관리자</c:when>
									<c:when test="${MemberList.user_level eq '1' }">탈퇴회원</c:when>
									<c:otherwise>일반회원</c:otherwise>
								</c:choose>
							</td>
							<td class="alignCenter"><c:out value="${MemberList.user_hp }"/></td>
							<td class="alignCenter">
								<c:choose>
									<c:when test="${empty MemberList.last_login_dt }">-</c:when>
									<c:otherwise><c:out value="${MemberList.last_login_dt}"/></c:otherwise>
								</c:choose>							
							</td>
							<td class="alignCenter"><c:out value="${MemberList.reg_dt }"/></td>
							<td class="alignCenter">
								<c:choose>
									<c:when test="${MemberList.user_st eq 'O' }">탈퇴</c:when>
									<c:when test="${MemberList.user_st eq 'R' }">대기</c:when>
									<c:when test="${MemberList.user_st eq 'D' }">차단</c:when>
									<c:otherwise>정상</c:otherwise>
								</c:choose>
							</td>
							<td class="alignCenter"><a href="/admgr/admgrMember/memberForm.do?user_level=<c:out value="${user_level}"/>&searchKey=<c:out value="${searchKey}"/>&searchKeyword=<c:out value="${searchKeyword}"/>&page=<c:out value="${paginationInfo.currentPageNo}"/>&member_seq=<c:out value="${MemberList.user_seq}"/>" class="btns bluebtn h24px">관리</a></td>
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
					<a href="/admgr/admgrMember/memberForm.do" class="btns redbtn"><i class="fal fa-user-plus"></i> 회원등록</a>
				</div>
			</section>
			<!-- } 회원관리 > 회원관리 > 리스트 -->
		</div>
		<!-- } 콘텐츠 영역 -->
		
		<script type="text/javascript">
		// 페이징함수
		function jsPaging(pageNo) {
			//console.log(pageNo);
			var searchKey = $.trim($('#searchKey').val());
			var searchKeyword = $.trim($('#searchKeyword').val());
			var user_level = $.trim($('#user_level').val());
	
			var linkurl = "/admgr/admgrMember/memberList.do?pageIndex="+pageNo;
			
			if(searchKey && searchKeyword) {
				linkurl += "&searchKey="+searchKey+"&searchKeyword="+searchKeyword;
			}
			if(user_level) {
				linkurl += "&user_level="+user_level;
			}
			//console.log(linkurl)
			location.href = linkurl;
		}
		</script>


<c:import url="/Api/admgrIncludeBottom.do"/>