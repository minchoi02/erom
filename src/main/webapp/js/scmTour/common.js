/* 로그인 */
function formUserLogin() {
	var user_id = $.trim($("#user_id").val());
	var user_pw = $.trim($("#user_pw").val());
	if(!user_id) { alert("이이디를 입력하세요"); $("#user_id").focus(); return false; }
	if(!user_pw) { alert("비밀번호를 입력하세요"); $("#user_pw").focus(); return false; }
}
/* 로그아웃 */
function userLogOut() {
	if(confirm("정말 로그아웃 하시겠습니까?")) {
		location.href="/member/logOut.do";
	}
}
/* 회원가입 */
function formUserJoin() {
	var user_id = $.trim($("#user_id").val());
	var user_nm = $.trim($("#user_nm").val());
	var user_pw = $.trim($("#user_pw").val());
	var user_pw_re = $.trim($("#user_pw_re").val());
	var user_hp = $.trim($("#user_hp").val());
	
	if(!user_id) { alert("이이디를 입력하세요"); $("#user_id").focus(); return false; }
	chkid = /^[a-z]+[a-z0-9]{5,15}$/g;
	if(!chkid.test(user_id)) {
		alert('아이디는 영문소문자로 시작하는 6-15자 영문 소문자 또는 숫자이어야 합니다. ');
		$("#user_id").select();
		return false;
	}
	if(!user_nm) { alert("이름을 입력하세요"); $("#user_nm").focus(); return false; }
	if(user_nm.length <= 1) {
		alert('이름은 두글자 이상이어야 합니다. ');
		$("#user_nm").select();
		return false;
	}
	if(!user_pw) { alert("비밀번호를 입력하세요"); $("#user_pw").focus(); return false; }
	//비밀번호 유효성체크
	chkpw = /^[a-z]+[~`!@#$%\\^&*()A-Za-z0-9-+]{5,15}$/g;
	if(!chkpw.test(user_pw)) {
		alert('비밀번호는 영문소문자로 시작하는 6-15자 영문 소문자 또는 숫자이어야 합니다. ');
		$("#user_pw").select();
		return false;
	}
	if(!user_pw_re) { alert("비밀번호를 다시 한번 더 입력하세요"); $("#user_pw_re").focus(); return false; }
	if(user_pw != user_pw_re) { alert("비밀번호를 정확하지 않습니다.\n\n확인용 비밀번호를 다시 입력하세요"); $("#user_pw_re").select(); return false; }
	if(!user_hp) { alert("핸드폰번호를 입력하세요"); $("#user_hp").focus(); return false; }
	if(user_hp.length <= 10) {
		alert('핸드폰번호가 비정상적입니다. 비밀번호 찾기에 이용되므로 정확하게 입력해 주세요.');
		$("#user_hp").select();
		return false;
	}
	
}
/* 검색 */
function Fromsearch() {
	var searchKeyword = $.trim($("#searchKeyword").val());
	if(!searchKeyword) { alert("검색어를 입력하세요"); $("#searchKeyword").focus(); return false; }	
}

/* 회원정보수정 */
function modifyForm() {
	var user_pw = $.trim($("#user_passwd").val());
	var user_pw_re = $.trim($("#user_passwd_re").val());
	
	//비밀번호 유효성체크
	if(user_pw.length> 0) {
		chkpw = /^[a-z]+[a-z0-9]{5,15}$/g;
		if(!chkpw.test(user_pw)) {
			alert('비밀번호는 영문소문자로 시작하는 6-15자 영문 소문자 또는 숫자이어야 합니다. ');
			$("#user_pw").select();
			return false;
		}
		if(!user_pw_re) { alert("비밀번호를 다시 한번 더 입력하세요"); $("#user_pw_re").focus(); return false; }
		if(user_pw != user_pw_re) { alert("비밀번호를 정확하지 않습니다.\n\n확인용 비밀번호를 다시 입력하세요"); $("#user_pw_re").select(); return false; }
	}
}

function number_format(str){
	str = str + "";
	if(str == "" || /[^0-9,]/.test(str)) return str;
	str = str.replace(/,/g, "");
	for(var i=0; i<parseInt(str.length/3, 10); i++){
		str = str.replace(/([0-9])([0-9]{3})(,|$)/, "$1,$2$3");
	}
	return str;
}

function transfer_history(transcomp, transnum) {
	var w = window.open('/mypage/transfer.do?tcomp='+transcomp+'&tnum='+transnum,'historys', "width=500, height=800");
	w.focus();
}