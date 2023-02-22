<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:import url="/Api/IncludeTop.do"/>	

	<style>
	#footer {padding-top:0px;}
	</style>
<script>
$().ready(function() {
	$("#frm").click(function() {
		$("#userLogin").submit();
	})
})
</script>
	<div class="loginBg">
    	<div class="inner">
            <div class="loginArea">
                <div class="titleArea">
                    <h1><img src="/resource/img/login-logo.png" /></h1>
                    <span>이롬 헬스케어를 <br />방문해주셔서 감사합니다!</span>
                </div>
              <form method="post" id="userLogin" name="userLogin" action="/member/loginAction.do" onsubmit="return formUserLogin();" >
                <div class="inputArea">
                	<input type="text" name="user_id" class="form-control" placeholder="이메일">
                    <input type="password" name="user_pw" class="form-control" placeholder="비밀번호">
                </div>
                <div class="schArea">
                	<div class="form-check posiabsol">
                        <input class="form-check-input" type="checkbox" id="checkTrigger1">
                        <label class="form-check-label" for="checkTrigger1">자동로그인</label>
                    </div>
                    <div class="sch-btn"><a href="#">아이디찾기</a><a href="#">비밀번호찾기</a></div>
                </div>
                <div class="login-btn"><button class="btn" id="frm">로그인</button></div>
                </form>
                <div class="snsLogin">
                	<span class="face"><a href="#"><i class="xi-facebook"></i> 페이스북 로그인</a></span>
                    <span class="kakao"><a href="#"><i class="xi-kakaotalk"></i> 카카오톡 로그인</a></span>
                    <span class="naver"><a href="#"><i class="xi-naver"></i> 네이버 로그인</a></span>
                </div>
            </div>
            <div class="joinArea">
                <div class="txt">아직 회원이 아니신가요?</div>
                <div class="login-btn"><a href="/join_step1.do"><button class="btn">회원가입</button></a></div>
            </div>
    	</div>
    </div>
	

<c:import url="/Api/IncludeBottom.do"/>

