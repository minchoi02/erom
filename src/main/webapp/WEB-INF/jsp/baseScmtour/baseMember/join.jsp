<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:import url="/Api/IncludeTop.do"/>

<c:if test="${not empty user_id }">
<script>
alert("이미 로그인 되어 있습니다.");
history.back();
</script>
</c:if>

	<!-- 회원가입 { -->
	<section id="login">
		<h1>
			<em><a href="/"><img src="/images/baseScmtour/logo.png" alt="끌림" /></a></em>
			<a href="/member/joinLogin.do" class="backbtn"><i class="fal fa-arrow-left"></i></a>
		</h1>
		<h2>
			<em>Sign-up</em>
			<span>회원가입에 필요한 아이디/패스워드를 입력해주세요</span>
		</h2>
		<form method="post" id="userJoin" name="userJoin" action="/member/joinAction.do" onsubmit="return formUserJoin();" >
		<ul class="loginbox nopm">
			<li><input type="text" id="user_id" name="user_id" class="login_input w100" placeholder="아이디를 입력해주세요" /><span class="loginico"><i class="far fa-user"></i></span></li>
			<li><input type="text" id="user_nm" name="user_nm" class="login_input w100" placeholder="이름을 입력해주세요" /><span class="loginico"><i class="far fa-file-signature"></i></span></li>
			<li><input type="password" id="user_pw" name="user_pw" class="login_input w100" placeholder="비밀번호를 입력해주세요" /><span class="loginico"><i class="far fa-lock-alt"></i></span></li>
			<li><input type="password" id="user_pw_re" name="user_pw_re" class="login_input w100" placeholder="비밀번호를 다시 입력해주세요" /><span class="loginico"><i class="far fa-lock-alt"></i></span></li>
			<li><input type="text" id="user_hp" name="user_hp" class="login_input w100 phoneNumber" placeholder="핸드폰번호를 입력해주세요" /><span class="loginico"><i class="far fa-mobile-alt"></i></span></li>
		</ul>
		<button type="submit" class="btns loginbtn w100 mgt50px">회원가입</button>
		</form>
	</section>
	<!-- } 회원가입 -->

	<!-- 기존 회원일 경우 로그인 { -->
	<div class="memberloginbtn">
		<div class="inner">
			<a href="#" onclick="goLoginpage('<c:out value="${param.return_url }"/>')" >
				<span>기존 회원이십니까?</span>
				<em><i class="far fa-lock-alt"></i> 로그인</em>
			</a>
		</div>
	</div>
	<!-- } 기존 회원일 경우 로그인 -->
	
<c:import url="/Api/IncludeBottom.do"/>