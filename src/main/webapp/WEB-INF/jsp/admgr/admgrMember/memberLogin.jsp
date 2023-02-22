<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%-- <c:set var="Domain" value="${header.host}"/>
<c:set var="doURI" value="${requestScope['javax.servlet.forward.servlet_path']}" /> 
<c:set var="qsURI" value="${pageContext.request.queryString}" /> 
<c:set var="URI" value="${doURI }"/>
<c:if test="${not empty qsURI}">
	<c:set var="URI" value="${doURI }?${qsURI }"/>
</c:if>
<c:if test="${Domain.indexOf('www.') eq '-1' }">
	<c:set var="Domain" value="www.${Domain }"/>
	<c:set var="fullurlset" value="https://${Domain }${doURI }"/>
	<c:if test="${not empty qsURI}">
		<c:set var="fullurlset" value="https://${Domain }${doURI }?${qsURI }"/>
	</c:if>
	<script>location.replace("<c:out value="${fullurlset}"/>");</script>
</c:if> --%>
<c:import url="/Api/admgrIncludeTopSub.do"/>

		<style>
			html{height:100%;background:#fff url('/images/baseScmtour/loginbg.jpg') no-repeat center;background-size:cover}
			body{padding-top:50px;background-color:rgba(255,255,255,0)}
			#wrapper{background-color:rgba(255,255,255,0);}
		</style>
		
		<div id="wrapper">
			<section id="loginArea">
				<h1>
					<!-- <span><img src="/images/baseScmtour/logo_w.png" height="59" alt="서천끌림" /></span> -->
					<em>관리자시스템</em>
				</h1>
				<form method="post" id="adminLogin" name="admiLogin" action="/admgr/loginAction.do" onsubmit="return adminLogin();" >
				<div class="login_area">
					<dl class="nopm">
						<dt>UserID</dt>
						<dd><input type="text" id="admin_id" name="admin_id" class="login_input login_id w100" placeholder="아이디"  value="" /></dd>
					</dl>
					<dl class="nopm mgt40px">
						<dt>Password</dt>
						<dd><input type="password" id="admin_pw" name="admin_pw" class="login_input login_pw w100" placeholder="비밀번호"  value="" /></dd>
					</dl>
					<button class="submitbtn mgt80px">로그인</button>
				</div>
				</form>
			</section>
			<!-- <p class="copyright mgt20px alignCenter">Copyright ⓒ 2020 Seocheon-gun. All rights reserved.</p> -->
		</div>
		
		<script>
		$(document).ready(function() {
			$("#admin_id").focus();
		});
		</script>

<c:import url="/Api/admgrIncludeBottomSub.do"/>