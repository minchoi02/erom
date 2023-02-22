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
			<a href="/member/modify.do" class="tabmnu colorGray"><h1>정보수정</h1></a>
			<a href="/member/withdraw.do" class="tabmnu "><h1>회원탈퇴</h1></a>
		</div>
	</header>

	<!-- 회원탈퇴 { -->
	<form id="widthdrawForm" method="post" action="/member/withdrawAction.do" onsubmit="return widthdrawForm();" >
	<section id="myinfo">
		<ul class="myinfobox nopm">
			<li><label for="u_id">ID</label><input type="text" id="u_id" name="u_id" class="basic_input w100 readonly" readonly value="<c:out value="${user_id }"/>" ></li>
			<li><label for="u_nm">이름</label><input type="text" id="u_nm" name="u_nm" class="basic_input w100 readonly" readonly value="<c:out value="${user_nm }"/>"></li>
			<li><label for="u_reason">사유</label>
				<select name="withdraw_reason" id="withdraw_reason" class="basic_select w100">
					<option value="">사유를 선택해주세요</option>
					<option value="이용률 감소">이용률 감소</option>
					<option value="이용 불편">이용 불편</option>
					<option value="상품가격 불만">상품가격 불만</option>
					<option value="구매대상 상품부재">구매대상 상품부재</option>
					<%--
					<option value="etc">직접입력</option>
					 --%>
				</select>
				<%--
				<div id="widthdrae_text">
				<textarea name="withdraw_reason_text" id="withdraw_reason_text" class="basic_textarea w100 mgt10px" cols="30" rows="5" style="resize:none;">
				</textarea>
				</div>
				 --%>
			</li>
		</ul>
		<ul class="agree_list mgt30px">
			<li><input type="checkbox" id="agree_chk1" name="agree_chk1" class="basic_check"><label for="agree_chk1">
				<span></span>(필수동의) 회원탈퇴시, 개인정보취급방침에 의하여 개인정보를 파기합니다.</label>
				<br><br>
			</li>
			<li><input type="checkbox" id="agree_chk2" name="agree_chk2" class="basic_check"><label for="agree_chk2">
				<span></span>(필수동의) 기존주문내역 및 게시글은 서천군이 법적책임을 지는 범위안에서 최소한의 데이터로 일정기간 보존될 수 있으며, 그 외 개인정보취급방침에 의하여 파기됩니다.</label>
				<br><br>
			</li>
		</ul>
		<div class="alignCenter mgt30px">
			<button type="submit" class="btns bgOrangeGra colorWhite">탈퇴</button>
		</div>
	</section>
	</form>
	<!-- } 회원탈퇴 -->
	
<c:import url="/Api/IncludeBottom.do"/>