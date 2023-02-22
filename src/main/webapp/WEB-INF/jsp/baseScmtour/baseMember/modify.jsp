<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:import url="/Api/IncludeTop.do"/>

<c:if test="${empty user_id }">
<script>
$(window).bind("pageshow", function (event) {
getLogin("/member/modify.do");
});
</script>
</c:if>

	<header id="header" class="subpage tab">
		<a href="/shop/more.do" class="backbtn"><i class="fal fa-arrow-left"></i></a>
		<div class="tabmnu_wrap floats">
			<a href="/member/modify.do" class="tabmnu"><h1>정보수정</h1></a>
			<a href="/member/withdraw.do" class="tabmnu colorGray"><h1>회원탈퇴</h1></a>
		</div>
	</header>
	
	<!-- 정보수정 { -->
	<section id="myinfo">
		<p class="comment">
			<c:if test="${memberInfo.user_join_fl ne 'normal' }">
			* 소셜로그인회원은 비밀번호가 없으므로 수정을 지원하지 않습니다.
			<br>
			</c:if>
			* 비밀번호 변경을 원치 않으실 경우, 입력하지 않으셔도 됩니다.
			<br>
			* 이름이 없는 경우에 한하여 이름을 입력할 수 있으며, 한번 입력되어 저장된 이름은 변경이 금지됩니다.
		</p>
		
		<form action="/member/modifyAction.do" onsubmit="return modifyForm();" method="post">
		<ul class="myinfobox nopm">
			<li><label for="u_id">ID</label><input type="text" id="user_id" name="user_id" class="basic_input w100 readonly" readonly value="<c:out value="${memberInfo.user_id }"/>"></li>

			<c:if test="${not empty memberInfo.user_nm }">
			<li><label for="u_nm">이름</label><input type="text" id="user_nm" name="user_nm" class="basic_input w100 readonly" readonly value="<c:out value="${memberInfo.user_nm }"/>"></li>
			</c:if>
			<c:if test="${empty memberInfo.user_nm }">
			<li><label for="u_nm">이름</label><input type="text" id="user_nm" name="user_nm" class="basic_input w100 " value=""></li>
			</c:if>
			
			<c:if test="${memberInfo.user_join_fl eq 'normal' }">
			<li><label for="u_nm">비밀번호</label><input type="password" id="user_passwd" name="user_passwd" class="basic_input w100 " value=""></li>
			<li><label for="u_nm">비밀번호 확인</label><input type="password" id="user_passwd_re" name="user_passwd_re" class="basic_input w100 " value=""></li>
			</c:if>
			
			<li><label for="u_email">이메일</label><input type="text" id="user_email" name="user_email" class="basic_input w100" value="<c:out value="${memberInfo.user_email }"/>"></li>
			<li><label for="u_tel">연락처</label><input type="text" id="user_hp" name="user_hp" class="basic_input w100" value="<c:out value="${memberInfo.user_hp}"/>"></li>
		</ul>
		<div class="alignCenter mgt30px">
			<button type="submit" class="btns bgOrangeGra colorWhite">수정</button>
		</div>
		</form>
		
		<div class="address mgt30px">
			<h2>주소록</h2>
			<div class="alignJustify floats">
				<select name="address_list" id="address_list" class="basic_select left" onchange="go_addr(this.value);">
					<option value="">주소록 목록</option>
					<c:forEach var="addrList" items="${addrList }">
					<option value="<c:out value="${addrList.addr_seq }"/>" <c:if test="${addrList.addr_seq eq addr_seq }">selected</c:if> ><c:out value="${addrList.addr_nm }"/></option>
					</c:forEach>
				</select>
				<button type="button" onclick="go_addr();" class="btns graybtn colorWhite right">신규</button>
			</div>
			<form id="addrForm" action="/member/addrAction.do" onsubmit="return addrForm();" method="post">
			<input type="hidden" id="addr_seq" name="addr_seq" value="<c:out value="${addr_seq }"/>" >
			<c:choose>
				<c:when test="${empty addr_seq }"><c:set var="action_mode" value="insert"/></c:when>
				<c:otherwise><c:set var="action_mode" value="modify"/></c:otherwise>
			</c:choose>
			<input type="hidden" id="action_mode" name="action_mode" value="<c:out value="${action_mode }"/>" >
			<ul class="nopm myinfobox">
				<li>
					<label for="db_tit">별칭</label>
					<input type="text" id="addr_nm" name="addr_nm" class="basic_input w50" value="<c:out value="${addrInfo.addr_nm }"/>">
					<%--
					<span class="df_chk mgl10px"><input type="checkbox" id="addr_default" name="addr_default" class="basic_check" value="Y" <c:if test="${addrInfo.addr_default eq 'Y'}">checked</c:if> ><label for="default_chk"><span></span>기본설정</label></span>
					 --%>
				</li>
				<li>
					<label for="db_addr1">주소</label>
					<input type="text" name="addr_zip" id="addr_zip" class="basic_input w100px readonly" readonly value="<c:out value="${addrInfo.addr_zip}"/>">
					<button type="button" onclick="javascript:form_govPostcode('addr_zip', 'addr_addr1', 'addr_addr2','','');" class="btns graybtn colorWhite right mgl10px">주소검색</button>
					<input type="text" name="addr_addr1" id="addr_addr1" class="basic_input w100 mgt5px readonly" readonly value="<c:out value="${addrInfo.addr_1}"/>">
					<input type="text" name="addr_addr2" id="addr_addr2" class="basic_input w100 mgt5px" value="<c:out value="${addrInfo.addr_2}"/>">
				</li>
			</ul>
			<div class="alignCenter mgt30px">
				<c:if test="${not empty addr_seq }">
				<button type="submit" class="btns bgOrangeGra colorWhite">수정</button>
				&nbsp;&nbsp;&nbsp;
				<button type="button" class="btns graybtn colorWhite" onclick="set_mode('d')">삭제</button>
				</c:if>
				<c:if test="${empty addr_seq }">
				<button type="submit" class="btns bgOrangeGra colorWhite">등록</button>
				</c:if>
			</div>
			</form>
		</div>
	</section>
	<!-- } 정보수정 -->
<%@ include file="../AjaxResult/zipSearch.jsp" %>	
<c:import url="/Api/IncludeBottom.do"/>