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
<script>

function check_id1() {
	var user_id = $.trim($("#user_id").val());
	
	
	if(!user_id) { alert('아이디를 입력하세요.'); $("#user_id").focus(); return false; }
	
	$.ajax({
		type:"post",
		url : "/Ajax/idCheck.do",
		dataType: 'text',
		//dataType: 'json',
		data : { user_id: user_id},
		async: true,
		success: function(res) {
			//alert(res);
			$("#result_str").html(res);
			
		}
	});
}
</script>
	<!-- 회원가입 { -->
	<div class="joinBg">
    	<div class="inner">
    	<form method="post" id="userJoin" name="userJoin" action="/member/joinAction.do" onsubmit="return formUserJoin();" >
            <div class="joinputArea">            
                <div class="titleArea">
                    <h1><img src="/resource/img/joininput-icon.png" /> <strong>이롬 헬스케어 회원가입</strong></h1>
                    <span><img src="/resource/img/login-logo.png" /></span>
                </div>
                <div class="infoArea">
                	<h1>필수정보</h1>
					<div class="overlap"><input type="text" id="user_id" name="user_id" class="form-control" placeholder="아이디"><button type="button" class="btn" onclick="check_id1()"/>중복확인</</button></div>
    				<div class="modal-body" id="result_str" class="" style="max-height: 100px; min-height: 10px; overflow-y: auto; text-align: left; padding-top: 0px; padding-bottom: 10px; "></div>                	
                	    	             
                    <!-- <div class="overlap"><input type="text" id="user_id" name="user_id" class="form-control" placeholder="아이디"><button class="btn" onclick="check_id()">중복확인</button></div> -->                    
                    <div><input type="password" id="user_pw" name="user_pw" class="form-control" placeholder="비밀번호"></div>
                    <div><input type="password" id="user_pw_re" name="user_pw_re" class="form-control" placeholder="비밀번호 확인"></div>
					<div><input type="text"  id="user_nm" name="user_nm" class="form-control" placeholder="이름"></div>                    
                    <div><input type="text"  id="user_email" name="user_email" class="form-control" placeholder="이메일"></div>
                    <div><input type="text" id="user_hp" name="user_hp" class="form-control" placeholder="휴대폰 번호를 입력해주세요(-표시적용시키기)"></div>
                    <span>· 휴대폰번호는 아이디 또는 비밀번호를 찾기 위한 정보이므로 정확하게 입력해 주세요.</span>
                </div>
                <div class="infoArea">
                	<h1>부가정보</h1>
                	<div><input type="text" name="user_birth" class="form-control" placeholder="생년월일 ex)871225"></div>
                    <div class="gender">
                    	<span>성별</span>
                        
                        <div class="custom-control custom-radio">
                            <input type="radio" id="customRadio3" name="user_sex_fl" value="M" class="custom-control-input"
                            checked="checked">
                            <label class="custom-control-label" for="customRadio3">남자</label>
                        </div>
                        
                        <div class="custom-control custom-radio">
                            <input type="radio" id="customRadio4" name="user_sex_fl" value="F" class="custom-control-input">
                            <label class="custom-control-label" for="customRadio4">여자</label>
                        </div>
                        
                    </div>
                </div>
                <div class="infoArea border-none">
                	<h1>멤버쉽회원정보</h1>
                	<div><input type="text" name="user_m_nm" class="form-control" placeholder="이름"></div>
                    <div><input type="text" name="user_m_num" class="form-control" placeholder="멤버쉽 번호"></div>
                </div>
                <div class="totalBtn"><button type="submit" class="btn" 
                style="    
    padding: 18px 20px;
    color: #004f4a;
    border: solid 1px #ddd;
    font-size: 20px;
    background: #90bd20;
    border-radius: 5px;
    cursor: pointer;
    font-family: 'S-CoreDream';
    width: 20%"
    >등록하기</button></a></div>
            </div>
            </form>
    	</div>
    </div>
	
<c:import url="/Api/IncludeBottom.do"/>

