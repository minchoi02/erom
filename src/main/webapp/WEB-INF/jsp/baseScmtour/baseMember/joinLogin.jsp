<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%-- 설정 --%>
<c:set var="naver_client_id" value="${SiteBaseConfig.sns_naver_cid }"/>		<%-- 네이버 클라이언트 아이디 --%>
<c:set var="naver_secret_key" value="${SiteBaseConfig.sns_naver_ckey }"/>	<%-- 네이버 시크릿키 --%>
<c:set var="kakao_rest_key" value="${SiteBaseConfig.sns_daum_rakey }"/>	<%-- 카카오 레스트 키 --%>
<c:set var="kakao_js_key" value="${SiteBaseConfig.sns_daum_jskey }"/>	<%-- 카카오 자스키 --%>
<c:set var="kakao_secret_key" value="${SiteBaseConfig.sns_daum_ckey }"/>		<%-- 카카오 시크릿키 --%>
<c:set var="facebook_client_id" value="${SiteBaseConfig.sns_facebook_cid }"/>	<%-- 페이스북 클라이언트 아이디 --%>
<c:set var="facebook_secret_key" value="${SiteBaseConfig.sns_facebook_ckey }"/>	<%-- 페이스북 시크릿키 --%>
<c:set var="apple_client_id" value="${SiteBaseConfig.sns_apple_cid }"/>		<%-- 애플 클라이언트 아이디--%>
<c:set var="apple_secret_key" value="${SiteBaseConfig.sns_apple_ckey }"/>	<%-- 애플 시크릿 키 --%>

<%-- 네이버  제공발췌 { --%>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.security.SecureRandom" %>
<%@ page import="java.math.BigInteger" %>

<%
String NaverclientId = (String) pageContext.getAttribute("naver_client_id");//애플리케이션 클라이언트 아이디값";
String NaverredirectURI = URLEncoder.encode("https://www.scmtour.com/actionNaverLogin.do", "UTF-8");
//String NaverredirectURI = URLEncoder.encode("http://220.123.69.229:8888/actionNaverLogin.do", "UTF-8");
SecureRandom random = new SecureRandom();
String Naverstate = new BigInteger(130, random).toString();
String apiNaverURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code";
apiNaverURL += "&client_id=" + NaverclientId;
apiNaverURL += "&redirect_uri=" + NaverredirectURI;
apiNaverURL += "&state=" + Naverstate;
session.setAttribute("state", Naverstate);
%>
<%-- } 네이버 제공발췌  --%>

<%
String ipaddr = (String) request.getRemoteAddr();
String dev = "";
if(ipaddr.equals("192.168.0.1")) {
	dev = "dev";
}
%>
<c:set var="dev" value="<%=dev%>"/>

<c:import url="/Api/IncludeTop.do"/>

<c:if test="${not empty user_id }">
<script>
alert("이미 로그인 되어 있습니다.");
history.back();
</script>
</c:if>

	<!-- 로그인&회원가입 { -->
	<section id="joinLogin">
		<article id="joinLoginBox">
			<h1><a href="/"><img src="/images/baseScmtour/logo_gra.png" alt="끌림" /></a></h1>
			<p>서천여행이 행복한 추억이<br />되도록 이끌어 줄께요!</p>

			<!-- 회원가입 버튼 { -->
			<div class="btn_wrap">
				<div class="btn_join">
					<a href="/member/join.do" class="loginbtn loginbtn_join">
						<em><img src="/images/baseScmtour/login_ico_basic.png" alt="회원가입 아이콘" /></em>
						<span>서천끌림 회원가입</span>
					</a>
				</div>
				<!-- } 회원가입 버튼 -->
	
				<!-- SNS 로그인 { -->
				<dl class="nopm">
					<dt><em>SNS 로그인</em></dt>
					<dd>
						<ul class="nopm">
							<li>
								<a href="javascript:snsLogin('naver')" class="loginbtn loginbtn_naver" >
									<em><img src="/images/baseScmtour/login_ico_naver.png" alt="네이버 아이콘" /></em>
									<span>네이버 로그인</span>
								</a>
							</li>
							<li>
								<a href="javascript:snsLogin('kakao')" class="loginbtn loginbtn_kakao">
									<em><img src="/images/baseScmtour/login_ico_kakao.png" alt="카카오 아이콘" /></em>
									<span>카카오톡 로그인</span>
								</a>
							</li>
							<li>
								<a href="javascript:snsLogin('facebook')" class="loginbtn loginbtn_facebook" >
									<em><img src="/images/baseScmtour/login_ico_facebook.png" alt="페이스북 아이콘" /></em>
									<span>페이스북 로그인</span>
								</a>
							</li>
							<li>
								<a href="javascript:apple_login_init();" class="loginbtn loginbtn_apple" >
									<em><img src="/images/baseScmtour/login_ico_apple.png" alt="애플 아이콘" /></em>
									<div id="appleid-signin" >애플 로그인</div>
								</a>
							</li>
						</ul>
					</dd>
				</dl>
			<!-- } SNS 로그인 -->
			</div>
		</article>
	</section>
	<!-- } 로그인&회원가입 -->

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

	<%-- 애플제공 --%>
	<script type="text/javascript" src="https://appleid.cdn-apple.com/appleauth/static/jsapi/appleid/1/en_US/appleid.auth.js"></script>
	<script type="text/javascript">
		  AppleID.auth.init({
		      clientId : 'com.dtoursc.dTourSCServ',	//serviceID의 identifies
		      scope : 'name email',	// 빈칸으로 구분
		      redirectURI : 'https://www.scmtour.com/actionAppleLogin.do',
		      //state : '[STATE]',	
		      state : 'SCMTOUR',	//현재 랜덤코드로 확인
		      //usePopup : true //or false defaults to false
		      usePopup : false //or false defaults to false
		  });
    </script>
    <script>
    $("#appleid-signin > div ").css("min-width","100%").css("height","50px").css("padding-top","5px");
    </script>
	
	<script>
	function snsLogin(obj) {
		switch(obj) {
			case 'naver' : 
					location.href="<%=apiNaverURL%>"; 
					break;
			case 'kakao' : 
					client_id = "<c:out value="${kakao_rest_key}"/>";
					redirect_uri = "https://www.scmtour.com/actionKakaoLogin.do";
					//redirect_uri = "http://220.123.69.229:8888/actionKakaoLogin.do";
					location.href="https://kauth.kakao.com/oauth/authorize?client_id="+client_id+"&redirect_uri="+redirect_uri+"&response_type=code"; 
					break;
			case 'facebook' : 
					/* FB.login(function(response) {
					  // handle the response
					}, {scope: 'public_profile,email'}); */
					location.href="<c:out value="${facebook_url}"/>";
					break;
			case 'apple' : alert('기능구현중입니다.'); test(); break;
		}
	}
	
	</script>

<c:import url="/Api/IncludeBottom.do"/>