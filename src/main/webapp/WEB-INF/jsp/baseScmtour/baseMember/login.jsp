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

	<!-- 로그인 { -->
	<section id="login">
		<h1>
			<em><a href="/"><img src="/images/baseScmtour/logo.png" alt="끌림" /></a></em>
			<a href="/member/joinLogin.do" class="backbtn"><i class="fal fa-arrow-left"></i></a>
		</h1>
		<h2>
			<em>Login</em>
			<span>로그인 아이디/패스워드를 입력해주세요</span>
		</h2>
		<form method="post" id="userLogin" name="userLogin" action="/member/loginAction.do" onsubmit="return formUserLogin();" >
		<input type="hidden" id="return_url" name="return_url" value="<c:out value="${param.return_url }"/>" />
		<ul class="loginbox nopm">
			<li><input type="text" id="user_id" name="user_id" class="login_input w100" value="" placeholder="아이디를 입력해주세요" /><span class="loginico"><i class="far fa-user"></i></span></li>
			<li><input type="password" id="user_pw" name="user_pw" class="login_input w100" value="" placeholder="비밀번호를 입력해주세요" /><span class="loginico"><i class="far fa-lock-alt"></i></span></li>
		</ul>
		<button type="submit" class="btns loginbtn w100 mgt50px">로그인</button>
		</form>
		<a href="/member/join.do" style="display:block" class="mgt20px alignCenter">회원이 아니신가요? <strong class="colorOrange"><u>회원가입</u></strong></a>
	</section>
	
	<div class="memberloginbtn">
		<div class="inner">
			<a href="javascript:find_member();" >
				<span>로그인정보를 잊으셨나요?</span>
				<em><i class="far fa-search"></i> 회원정보찾기</em>
			</a>
		</div>
	</div>
	
	
	<div id="find_memberinfo" class="modal fade find_memberinfo" tabindex="1" role="dialog">
		<div class="modal-dialog" role="document" >
			<div class="modal-content" >
				<div class="modal-header bgOrangeGra">
					<button type="button" class="closebtn" data-dismiss="modal" aria-label="Close"><i class="fal fa-times"></i></button>
					<h4 class="modal-title">회원정보 찾기 - 서천끌림에 직접 회원가입한 경우</h4>
				</div>
				<div class="modal-body mgt10px" >
					<table>
						<tr>
							<th style="text-align:center;"><button type="button" id="idf" class="btns h20px orangebtn w90" onclick="find_id_prt();">아이디 찾기</button></th>
							<th style="text-align:center;"><button type="button" id="pwf" class="btns h20px graybtn w90" onclick="find_pw_prt();">비밀번호 찾기</button></th>
						</tr>
					</table>
				</div>

				<div class="modal-body mgt10px alignCenter" id="doc_id">
					<table class="w90" style="margin-left: 5%; " >
						<col width="100">
						<col width="*">
						
						<tr>
							<th height="45" class="alignCenter" style="background-color: #ccc;">이름</th>
							<td class="alignLeft mgl5px" style="padding: 0 10px; "><input type="text" class="basic_input w90" name="user_nm" id="i_user_nm" placeholder="이름을 입력하세요." /></td>
						</tr>
						<tr>
							<th height="10" colspan="2"></th>
						</tr>
						<tr>
							<th height="45" class="alignCenter" style="background-color: #ccc;">핸드폰</th>
							<td class="alignLeft mgl5px" style="padding: 0 10px; "><input type="text" class="basic_input w90 phoneNumber" name="user_hp" id="i_user_hp" placeholder="전화번호를 입력하세요." /></td>
						</tr>
						<tr>
							<th height="10" colspan="2"></th>
						</tr>
						<tr>
							<th height="45" class="alignCenter" colspan="2"><button type="button" class="btns h20px orangebtn w250" onclick="search_id()">아이디 확인</</button></th>
						</tr>
					</table>
				</div>
				<div class="modal-body mgt10px" id="doc_pw" style="display: none;">
					<table class="w90" style="margin-left: 5%; " >
						<col width="100">
						<col width="*">
						
						<tr>
							<th height="45" class="alignCenter" style="background-color: #ccc;">아이디</th>
							<td class="alignLeft mgl5px" style="padding: 0 10px; "><input type="text" class="basic_input w90" name="user_id" id="p_user_id" placeholder="아이디을 입력하세요." /></td>
						</tr>
						<tr>
							<th height="10" colspan="2"></th>
						</tr>
						<tr>
							<th height="45" class="alignCenter" style="background-color: #ccc;">이름</th>
							<td class="alignLeft mgl5px" style="padding: 0 10px; "><input type="text" class="basic_input w90" name="user_nm" id="p_user_nm" placeholder="이름을 입력하세요." /></td>
						</tr>
						<tr>
							<th height="10" colspan="2"></th>
						</tr>
						<tr>
							<th height="45" class="alignCenter" style="background-color: #ccc;">핸드폰</th>
							<td class="alignLeft mgl5px" style="padding: 0 10px; "><input type="text" class="basic_input w90 phoneNumber" name="user_hp" id="p_user_hp" placeholder="전화번호를 입력하세요." /></td>
						</tr>
						<tr>
							<th height="10" colspan="2"></th>
						</tr>
						<tr>
							<th height="45" class="alignCenter" colspan="2"><button type="button" class="btns h20px orangebtn w250" onclick="search_pw()">비밀번호 확인</</button></th>
						</tr>
					</table>
				</div>
				<div class="modal-body" id="result_str" class="" style="max-height: 300px; min-height: 200px; overflow-y: auto; text-align: center; padding-top: 30px; "></div>
			</div>
		</div>
	</div>
	
	<!-- } 로그인 -->
	<script>
	$("#user_id").focus();
	</script>
	<script>
		$(document).on("keyup", ".phoneNumber", function() { $(this).val( $(this).val().replace(/[^0-9]/g, "").replace(/(^02|^0505|^1[0-9]{3}|^0[0-9]{2})([0-9]+)?([0-9]{4})/,"$1-$2-$3").replace("--", "-") ); });
	</script>

<c:import url="/Api/IncludeBottom.do"/>