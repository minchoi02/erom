//==================================================================================================
// 기본 공통 {
//-----------------------------------------------------------------------------------------------------------------------------------------------------------
$(function() {
	$(".datepicker").datepicker({
		closeText: '닫기',
		 prevText: '이전달',
		 nextText: '다음달',
		 currentText: '오늘',
		 monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		 monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'], 
		 dayNames: ['일','월','화','수','목','금','토'],
		 dayNamesShort: ['일','월','화','수','목','금','토'],
		 dayNamesMin: ['일','월','화','수','목','금','토'],
		 dateFormat:'yy-mm-dd',
		 yearRange: '2020:2040',
		 weekHeader: 'Wk',
		 isRTL: false,
		 showButtonPanel: true,
		 buttonImageOnly: true,
		 showMonthAfterYear: true ,
		 changeMonth: true,
		 //maxDate: -1, //0: 오늘까지, -1은 어제까지... +1은 내일까지?
		 changeYear: true
	});
});


// GPS 좌표값 가져오기
function createmap(lat, lng){
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	mapOption = {
		center: new daum.maps.LatLng(lat, lng), // 지도의 중심좌표
		level: 3 // 지도의 확대 레벨
	};  

	// 지도를 생성합니다    
	var map = new daum.maps.Map(mapContainer, mapOption); 	
	// 결과값으로 받은 위치를 마커로 표시합니다
	var markerPosition  = new daum.maps.LatLng(lat, lng);

	var marker = new daum.maps.Marker({
		position: markerPosition
	});	

	marker.setMap(map);
}
function getgps(addr1, addr2, gpslat, gpslng) {
	var get_addr = $('#'+addr1).val()+' '+$('#'+addr2).val();
	
	if (navigator.geolocation) {
		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new daum.maps.services.Geocoder();
		
		// 주소로 좌표를 검색합니다
		geocoder.addressSearch(get_addr, function(result, status) {
		
			// 정상적으로 검색이 완료됐으면 
			 if (status === daum.maps.services.Status.OK) {
				 if(result[0].y && result[0].x) {
					$('#'+gpslat).val(result[0].y);
					$('#'+gpslng).val(result[0].x);
					$('#map').show();
					createmap(result[0].y,result[0].x);
				 } else {
					 $('#'+gpslat).val('no data');
					 $('#'+gpslng).val('no data');
				 }
			} else {
				$('#'+gpslat).val('');
				$('#'+gpslng).val('');
				$('#map').hide();
				alert('주소를 확인할 수 없습니다(1).');
			} 
		});
	} else {
		alert('주소를 확인할 수 없습니다(2).');
	}
}

/* 날짜세팅함수 */
function todateSet() {
	var today = new Date();
	var dd = today.getDate();
	var mm = today.getMonth()+1; //January is 0!
	var yyyy = today.getFullYear();

	if(dd<10) {
	    dd='0'+dd
	} 

	if(mm<10) {
	    mm='0'+mm
	} 
	return today = yyyy+'-'+mm+'-'+dd;
}
function setToday(obj) {
	var today = todateSet();
	$("#"+obj).val(today);
}

function setProdInformation(obj) {
	$(".prodcategoryset").hide();
	$("#prod_category_"+obj).css("display","block");
}

/* 키워드 체크 */
function keywordcheck() {
	var keyword = $.trim($("#keyword").val());
	if(!keyword) { alert("검색어를 입력하세요"); $("#admin_id").focus(); return false; }
}
//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
// } 기본공통 끝
//==================================================================================================


//==================================================================================================
// 관리자 세션  {
//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
/* 로그인 */
function adminLogin() {
	var admin_id = $.trim($("#admin_id").val());
	var admin_pw = $.trim($("#admin_pw").val());
	
	if(!admin_id) { alert("관리자이이디를 입력하세요"); $("#admin_id").focus(); return false; }
	if(!admin_pw) { alert("관리자비밀번호를 입력하세요"); $("#admin_pw").focus(); return false; }
}
/* 로그아웃 */
function adminLogOut() {
	if(confirm("정말 로그아웃 하시겠습니까?")) {
		location.href="/admgr/logOut.do";
	}
}
//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
// } 관리자 세션  
//==================================================================================================


//==================================================================================================
// 기본설정 {  
//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
/* 기본세팅 체크 */
function baseSettingset() {

}
function max_calc(obj, unit) {
	var obj_val = $('#'+obj).val();
	var unit_val = $('#'+unit).val();
	
	ex = obj_val.split(".");
	new_obj = obj_val;
	if(unit_val == "P") {
		if(parseInt(obj_val) > 100) {
			alert('%지정시 그 값은 100%보다 클 수 없습니다.');
			$('#'+obj).val('');
			return false;
		}
		var new_ex1 = "";
		if(ex[1] != "undefined") {
			if(ex[1].length>1) {
				new_ex1_val = ex[1][0];
				new_ex1 = "."+new_ex1_val;
			} 
			else if(ex[1] == "0") {
				new_ex1 = "";
			} else {
				new_ex1 = "."+ex[1];
			}
		}
		new_obj = ex[0]+new_ex1;
		$('#'+obj).val(new_obj);
	}
}
//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
/* 팝업검색 */
function popupCheck() {
	var searchKeyword = $.trim($("#searchKeyword").val());
	if(!searchKeyword) { alert('검색어를 입력하세요'); $("searchKeyword").focus(); return false; }
}
/* 팝업삭제 */
function popupdel(seq) {
	if(confirm("삭제한 자료는 복구가 불가능합니다.\n\n팝업을 삭제하시겠습니까?")) {
		location.href="/admgr/admgrConfig/popupDel.do?popup_seq="+seq;
	}
}
/* 팝업저장 */
function popupSaveCheck() {
// 작업예정
}
//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
// } 기본설정
//==================================================================================================


//==================================================================================================
// 회원관리 {  
//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
/* 회원아이디 금지/중복 체크 */
function user_id_check() {
	var user_id = $.trim($("#user_id").val());
	if(!user_id) { alert('아이디를 입력하세요'); $("#user_id").focus(); return false; }
	
	//아이디 유효성체크
	chkid = /^[a-z]+[a-z0-9]{5,15}$/g;
	if(!chkid.test(user_id)) {
		alert('아이디는 영문소문자로 시작하는 6-15자 영문 소문자 또는 숫자이어야 합니다. ');
		$("#user_id").select();
		return false;
	}
	
	$.ajax({
		type:"post",
		url : "/admgr/admgrMember/memberCheckId.do", 
		dataType: 'text',
		//dataType: 'json',
		data : { user_id : user_id },
		async: true,
		success: function(res) {
			res = $.trim(res);
			res = res.replace(/\n/g,"");
			res = res.replace(/\r/g,"");

			if(res == "AN") {
				alert('관리자로그인이 필요합니다.'); 
				location.href='/admgr/login.do'; 
			} else {
				if(res == "Y") {
					alert("사용가능합니다");
					$("#user_id_check").val("Y");
					$("#user_id").prop("readonly", true).addClass("readonly");
					$("#id_chk").prop("disabled", true);
				} else {
					if(res == "H") {
						alert("중복된 아이디가 있습니다.");
						$("#user_id").select();
					} else {
						alert("금지어를 포함하고 있습니다..");
						$("#user_id").select();
					}
				}
			}
		}
	});
}
/* 회원가입폼 체크 */
function memberJoincheck() {
	var user_id = $.trim($("#user_id").val());
	var user_pw = $.trim($("#user_pw").val());
	var user_nm = $.trim($("#user_nm").val());
	if(!user_id) { alert('아이디를 입력하세요'); $("#user_id").focus(); return false; }
	if(!user_pw) { alert('비밀번호를 입력하세요'); $("#user_id").focus(); return false; }
	if(!user_nm) { alert('이름을 입력하세요'); $("#user_id").focus(); return false; }
	
	//아이디 유효성체크
	chkid = /^[a-z]+[a-z0-9]{5,15}$/g;
	if(!chkid.test(user_id)) {
		alert('아이디는 영문소문자로 시작하는 6-15자 영문 소문자 또는 숫자이어야 합니다. ');
		$("#user_id").select();
		return false;
	}
	
	//비밀번호 유효성체크
	chkpw = /^[a-z]+[a-z0-9]{5,15}$/g;
	if(!chkpw.test(user_pw)) {
		alert('비밀번호는 영문소문자로 시작하는 6-15자 영문 소문자 또는 숫자이어야 합니다. ');
		$("#user_pw").select();
		return false;
	}
}
//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
/* 회원마일리지 */
function memberMileageSet() {
	var user_id = $.trim($("#set_user_id").val());
	var user_nm = $.trim($("#user_nm").val());
	var mileage_content = $.trim($("#user_mileage_content").val());
	var set_mileage = $.trim($("#user_mileage").val());
	

	if(!user_id) { alert('필수값이 없습니다.'); $("#memberSearch").modal('show'); return false; }
//	if(!user_nm) { alert('필수값이 없습니다.'); $("#memberSearch").modal('show'); return false; }
	if(!mileage_content) { alert('마일리지 내용을 입력해 주세요.'); $("#user_mileage_content").focus(); return false; }
	if(!set_mileage) { alert('마일리지를 입력해 주세요.'); $("#user_mileage").focus(); return false; }
}
/* 회원정보조회 모달 오픈 */
function getMemberSsarchModalOpen() {
	$("#searchMemberResult").html("<tr><td class=\"alignCenter\" colspan=\"6\" class=\"colorRed\">검색하신 후, 선택하세요.</td></tr>");
	$("#memberSearch").modal('show');
}
/* 결과값 삽입 */
function setUser(user_id, user_nm) {
	$("#set_user_id").val(user_id);
	$("#set_user_nm").val(user_nm);
	memberSearchModalHIde();
}
/* 회원정보조회 모달 초기화 및 감춤 */
function memberSearchModalHIde() {
	$("#modalsearchkey").val("user_nm");
	$("#modalsearchKeyword").val("");
	$("#modalsearchMemberResult").html("<tr><td class=\"alignCenter\" colspan=\"6\" class=\"colorRed\">검색하신 후, 선택하세요.</td></tr>");
	$("#memberSearch").modal('hide');
}
/* 모달 회원조회 */
function getMemberSearch() {
	var modalsearchKey = $.trim($("#modalmembersearchKey").val());
	var modalsearchKeyword = $.trim($("#modalmembersearchKeyword").val());
	
	if(!modalsearchKeyword) {
		alert("검색어를 입력하세요!");
		$("#modalmembersearchKeyword").focus();
		return false;
	}
	
	$.ajax({
		type:"post",
		url : "/admgr/admgrModal/memberModalSearch.do", 
		dataType: 'text',
		//dataType: 'json',
		data : { modalsearchKey : modalsearchKey, modalsearchKeyword:modalsearchKeyword  },
		async: true,
		success: function(res) {
			res = $.trim(res);
			res = res.replace(/\n/g,"");
			res = res.replace(/\r/g,"");
			if(res == "AN") {
				alert('관리자로그인이 필요합니다.'); 
				location.href='/admgr/login.do'; 
			} else {
				$("#searchMemberResult").html(res);
			}
		}
	});	
}
//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
// } 회원관리   
//==================================================================================================


//==================================================================================================
//  상점관리 {   
//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
/* 회원정보조회 모달 오픈 */
function viewCategory(obj) {
	location.href="#store_"+obj;
}
function getStoreMemberSsarchModalOpen() {
	$("#searchStoreMemberResult").html("<tr><td class=\"alignCenter\" colspan=\"6\" class=\"colorRed\">검색하신 후, 선택하세요.</td></tr>");
	$("#storememberSearch").modal('show');
}
/* 결과값 삽입 */
function setStoreUser(user_id, user_nm, user_hp, user_email) {
	var shtml = "이름(아이디) : <span class=\"colorBlue\"><b>"+user_nm+"("+user_id+")</b></span><br />"
				+ "연락처 : "+user_hp+"<br />"
				+ "	이메일 : "+user_email;
	$("#set_user_id").val(user_id);
	$("#set_user_nm").val(user_nm);
	$("#store_hp_1").val(user_hp);
	$("#store_email").val(user_email);
	$("#store_owner_info").css("display","block").html(shtml);
	storememberSearchModalHIde();
}
/* 회원정보조회 모달 초기화 및 감춤 */
function storememberSearchModalHIde() {
	$("#modalStoresearchKey").val("user_nm");
	$("#modalStoresearchKeyword").val("");
	$("#searchStoreMemberResult").html("<tr><td class=\"alignCenter\" colspan=\"6\" class=\"colorRed\">검색하신 후, 선택하세요.</td></tr>");
	$("#storememberSearch").modal('hide');
}
/* 모달 상점회원조회 */
function getStoreMemberSearch() {
	var modalsearchKey = $.trim($("#modalStoremembersearchKey").val());
	var modalsearchKeyword = $.trim($("#modalStoremembersearchKeyword").val());
	
	if(!modalsearchKeyword) {
		alert("검색어를 입력하세요!");
		$("#modalStoremembersearchKeyword").focus();
		return false;
	}
	
	$.ajax({
		type:"post",
		url : "/admgr/admgrModal/storeMemberModalSearch.do", 
		dataType: 'text',
		//dataType: 'json',
		data : { modalsearchKey : modalsearchKey, modalsearchKeyword:modalsearchKeyword  },
		async: true,
		success: function(res) {
			res = $.trim(res);
			res = res.replace(/\n/g,"");
			res = res.replace(/\r/g,"");
			if(res == "AN") {
				alert('관리자로그인이 필요합니다.'); 
				location.href='/admgr/login.do'; 
			} else {
				$("#searchStoreMemberResult").html(res);
			}
		}
	});	
}
function def_info(obj) {
	var str = $("#info_"+obj).val();
	$("#store_info_"+obj).val(str);
}
function store_info_value_set() {
	var store_nm = $.trim($('#store_nm').val());
	var store_addr_1 = $.trim($('#store_addr_1').val());
	var store_addr_2 = $.trim($('#store_addr_2').val());
	var store_tel = $.trim($('#store_tel').val());
	
	if(!store_nm && !store_addr_1 && !store_addr_2 && !store_tel)  {
		alert("상점명, 주소, 상점대표전화 값이 존재하지 않습니다.");
		return false;
	}
	
	$("#store_info1_1").val(store_nm);
	$("#store_info1_5").val(store_nm + " / " + store_tel);
	$("#store_info2_7").val(store_nm + " " + store_tel);
	$("#store_info3_2").val(store_nm + " / " + store_addr_1 + " " +store_addr_2);
	$("#store_info3_10").val(store_nm + " / " + store_tel);
	$("#store_info4_11").val(store_nm + " / " + store_tel);
	$("#store_info5_10").val(store_nm + " / " + store_tel);
	$("#store_info6_13").val(store_nm + " / " + store_tel);
	$("#store_info7_11").val(store_nm + " / " + store_tel);
	$("#store_info8_5").val(store_nm + " / " + store_tel);
}
function base_info_value(obj) {
	var def_val = $.trim($("#def_store_info"+obj).val());
	var input_val = $.trim($("#store_info"+obj).val());
	if(!input_val) {
		$("#store_info"+obj).val(def_val);
	}
	else if(input_val && def_val != input_val) {
		if(confirm("입력값 ["+input_val+"] 을 기본값 ["+def_val+"] 으로 변경하시겠습니까?")) {
			$("#store_info"+obj).val(def_val);
		}
	}
	else if(input_val &&  def_val == input_val) {
		alert("기본값과 동일하여 변경하지 않습니다.");
	}
}

/* 몰설정 예약불가일 추가 */
function add_deny_date(obj) {
	var iscnt = $("#"+obj+"_cnt").val();
	var new_cnt = parseInt(iscnt) +1;
	$("#"+obj+"_cnt").val(new_cnt);
	var date_val = $("#"+obj+"_set_date").val();
	$("#"+obj+"_set_date").val("");
	var shtml = "<span id=\""+obj+"_"+new_cnt+"\">"
	 			+ "<a href=\"#;\" class=\"btns whitebtn\" onclick=\"delete_deny_date('"+obj+"', "+new_cnt+")\"><i class=\"fal fa-minus\"></i></a> "
	 			+ "<input type=\"text\" id=\""+obj+"_input_"+new_cnt+"\" name=\""+obj+"_deny_ymd\" class=\"admin_input readonly\" readonly size=\"10\" value=\""+date_val+"\" />"
	 			+ "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>";
	$("#"+obj+"_deny_date_list").append(shtml);
} 

/* 몰설정 예약불가일 삭제 */
function delete_deny_date(obgrp, obj) {
	if(confirm("해당 날짜를 삭제하시겠습니까?")) {
		var obj_id = $("#"+obgrp+"_"+obj).remove();
	}
}

/* 정산저장 */
function calcsave(obj) {
	$("#save_type").val(obj);
	if(obj != 'content') {
		var cal_len = $(".calc_check").length;
		var chekcedfld = 0;
		for(i=0; i<cal_len; i++) {
			if($(".calc_check").eq(i).prop("checked") == true) {
				chekcedfld++;
			}
		}
		if(chekcedfld == 0) {
			alert('한개 이상 선택하셔야 합니다.');
			return false;
		}
	}
	if(confirm("정말 실행하시겠습니까?")) {
		$("#calc_form").submit();
	} else {
		return false;
	}
} 
function all_calc_check() {
	if($("#calc_all").prop("checked") == false) {
		$(".calc_check").prop("checked", false);
	} else {
		$(".calc_check").prop("checked", true);
	}
	var checked_calc = 0;
	var selected_price = 0;
	var checked_price = 0;
	for(i=0; i<$(".calc_check").length; i++) {
		if($(".calc_check").eq(i).prop("checked") == true) {
			checked_calc++;
			checked_price = $(".calc_check").eq(i).val();
			console.log($("#dsum_res_price_"+checked_price).val());
			selected_price = parseInt(selected_price) + parseInt($("#dsum_res_price_"+checked_price).val());
		}
	}	
	$("#selec_price").html(number_format(selected_price));

}
function calc_check() {
	var checked_calc = 0;
	var selected_price = 0;
	var checked_price = 0;
	for(i=0; i<$(".calc_check").length; i++) {
		if($(".calc_check").eq(i).prop("checked") == true) {
			checked_calc++;
			checked_price = $(".calc_check").eq(i).val();
			console.log($("#dsum_res_price_"+checked_price).val());
			selected_price = parseInt(selected_price) + parseInt($("#dsum_res_price_"+checked_price).val());
		}
	}
	$("#selec_price").html(number_format(selected_price));
	if($(".calc_check").length == checked_calc) {
		$("#calc_all").prop("checked", true);
	} else {
		$("#calc_all").prop("checked", false);
	}
}
//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
//  } 상점관리   
//==================================================================================================


//==================================================================================================
//  상품관리 {   
//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
/* 상점조회 오픈 */
function setProdNm() {
	if(confirm("상점명으로 상품명을 설정하시겠습니까?")) {
		$("#prod_nm").val($("#set_store_nm").val());
	}
}
function getStoreSsarchModalOpen() {
	$("#searchStoreResult").html("<tr><td class=\"alignCenter\" colspan=\"6\" class=\"colorRed\">검색하신 후, 선택하세요.</td></tr>");
	$("#storeSearch").modal('show');
}
/* 상점조회 결과값 삽입 */
function setProductStore(store_id, store_nm, store_ceo_nm, store_tel, store_hp_1, store_addr_1, stopre_addr_2, store_use_st) {
	if(store_use_st == "Y") { use_html = "<span class=\"btns greenbtn h24px\">운영중</span>"; }
	else { use_html = "<span class=\"btns graybtn h24px\">운영중지</span>"; }
	var shtml = "대표자(상점아이디): <span class=\"colorBlue\"><b>"+store_ceo_nm+"("+store_id+")</b></span><br />"
				+ "연락처 : "+store_tel+"<br />"
				+ "핸드폰 : "+store_hp_1+"<br />"
				+ use_html;
	$("#set_store_id").val(store_id);
	$("#set_store_nm").val(store_nm);
	$("#set_store_tel").val(store_tel);
	$("#set_store_addr_1").val(store_addr_1);
	$("#set_store_addr_2").val(stopre_addr_2);
	$("#store_owner_info").css("display","block").html(shtml);
	storeSearchModalHIde();
	var store_category = $('#store_category').val();
	// 상점에 설정된 정보를 가져온다.
	$.ajax({
		type:"post",
		url : "/admgr/admgrModal/storeInfodata.do", 
		dataType: 'text',
		//dataType: 'json',
		data : { store_category : store_category, store_id:store_id  },
		async: true,
		success: function(res) {
			res = $.trim(res);
			res = res.replace(/\n/g,"");
			res = res.replace(/\r/g,"");
			if(res == "AN") {
				alert('관리자로그인이 필요합니다.'); 
				location.href='/admgr/login.do'; 
			} else {
				$("#infomation_data").html(res);
			}
		}
	});	

}
/* 상점조회 모달 초기화 및 감춤 */
function storeSearchModalHIde() {
	$("#modalStoresearchKey").val("store_nm");
	$("#modalStoresearchKeyword").val("");
	$("#searchStoreResult").html("<tr><td class=\"alignCenter\" colspan=\"6\" class=\"colorRed\">검색하신 후, 선택하세요.</td></tr>");
	$("#storeSearch").modal('hide');
}
/* 모달 상점조회 */
function getStoreSearch(store_category) {
	var modalsearchKey = $.trim($("#modalStoresearchKey").val());
	var modalsearchKeyword = $.trim($("#modalStoresearchKeyword").val());
	
	if(!modalStoresearchKeyword) {
		alert("검색어를 입력하세요!");
		$("#modalStoresearchKeyword").focus();
		return false;
	}
	
	$.ajax({
		type:"post",
		url : "/admgr/admgrModal/storeModalSearch.do", 
		dataType: 'text',
		//dataType: 'json',
		data : { modalsearchKey : modalsearchKey, modalsearchKeyword:modalsearchKeyword, store_category:store_category  },
		async: true,
		success: function(res) {
			res = $.trim(res);
			res = res.replace(/\n/g,"");
			res = res.replace(/\r/g,"");
			if(res == "AN") {
				alert('관리자로그인이 필요합니다.'); 
				location.href='/admgr/login.do'; 
			} else {
				$("#searchStoreResult").html(res);
			}
		}
	});	
}

function base_prod_info_value(obj, data_type) { // obj_type: store_category 4:는 서천장터, 1,2,3은 구분없이 공통으로 적용,   data_type : 입력값 조정구분  1:상점명만,  2: 상점명+전화번호, 3: 상점명+주소,
	var store_category = $.trim($('#store_category').val());
	var prod_category = $.trim($('#store_category').val());
	var store_nm = $.trim($('#set_store_nm').val());
	var store_tel = $.trim($('#set_store_tel').val());
	var store_addr_1 = $.trim($('#set_store_addr_1').val());
	var store_addr_2 = $.trim($('#set_store_addr_2').val());
	
	if(!store_nm && !store_addr_1 && !store_addr_2 && !store_tel)  {
		alert("상점명, 주소, 상점대표전화 값이 존재하지 않습니다.");
		return false;
	}
	
	var new_val = "";
	if(data_type == "1") {
		new_val = store_nm;
	}
	if(data_type == "2") {
		new_val = store_nm + " / " + store_tel;
	}
	if(data_type == "3") {
		new_val = store_nm + " / " + store_addr_1 + " " +store_addr_2;
	}
	$("#prod_info"+obj).val(new_val);
}
function base_prod_info_value_set(obj) { // obj_type: store_category 4:는 서천장터, 1,2,3은 구분없이 공통으로 적용,   data_type : 장터의 경우 해당값 구분을 위해 추가
	var store_category = $.trim($('#store_category').val());
	var prod_category = $.trim($('#store_category').val());
	var store_nm = $.trim($('#set_store_nm').val());
	var store_tel = $.trim($('#set_store_tel').val());
	var store_addr_1 = $.trim($('#set_store_addr_1').val());
	var store_addr_2 = $.trim($('#set_store_addr_2').val());
	
	if(!store_nm && !store_addr_1 && !store_addr_2 && !store_tel)  {
		alert("상점명, 주소, 상점대표전화 값이 존재하지 않습니다.");
		return false;
	}
	
	var def_val = $.trim($("#def_prod_info"+obj).val());
	var input_val = $.trim($("#prod_info"+obj).val());
	
	if(!input_val) {
		$("#prod_info"+obj).val(def_val);
	}
	else if(input_val && def_val != input_val) {
		if(confirm("입력값 ["+input_val+"] 을 기본값 ["+def_val+"] 으로 변경하시겠습니까?")) {
			$("#prod_info"+obj).val(def_val);
		}
	}
	else if(input_val &&  def_val == input_val) {
		alert("기본값과 동일하여 변경하지 않습니다.");
	}
}

function base_prod_trade_info_value(obj) {
	var store_category = $.trim($('#store_category').val());
	var prod_category = $.trim($('#store_category').val());
	var store_nm = $.trim($('#set_store_nm').val());
	var store_tel = $.trim($('#set_store_tel').val());
	var store_addr_1 = $.trim($('#set_store_addr_1').val());
	var store_addr_2 = $.trim($('#set_store_addr_2').val());
	
	if(!store_nm && !store_addr_1 && !store_addr_2 && !store_tel)  {
		alert("상점명, 주소, 상점대표전화 값이 존재하지 않습니다.");
		return false;
	}
	var def_val = $.trim($("#def_prod_trade_info_"+obj).val());
	var input_val = $.trim($("#prod_trade_info_"+obj).val());
	if(!input_val) {
		$("#prod_trade_info_"+obj).val(def_val);
	}
	else if(input_val && def_val != input_val) {
		if(confirm("입력값 ["+input_val+"] 을 기본값 ["+def_val+"] 으로 변경하시겠습니까?")) {
			$("#prod_trade_info_"+obj).val(def_val);
		}
	}
	else if(input_val &&  def_val == input_val) {
		alert("기본값과 동일하여 변경하지 않습니다.");
	}
}
function recom_del (obj) {
	$('#prod_recom_pord_id_'+obj).val('');
	$('#prod_recom_prod_nm_'+obj).val('');
	$('#recom'+obj+'_img').empty();
	$('#recom'+obj+'_nm').empty();
}
function option_price_add() {
	var is_option_cnt = $('#option_cnt').val();
	var new_option_cnt = parseInt(is_option_cnt)+1;
	$('#option_cnt').val(new_option_cnt);
	var shtml = "<div id=\"option_"+new_option_cnt+"\">"
				+ "<a href=\"#;\" onclick=\"option_delete("+new_option_cnt+")\" class=\"btns whitebtn h24px\"><i class=\"fal fa-minus\" ></i></a>&nbsp;&nbsp;&nbsp;"
				+ "<input type=\"text\" id=\"option_nm_"+new_option_cnt+"\" name=\"prod_option_nm\" class=\"admin_input\" size=\"35\" placeholder=\"내용\" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
				+ "<input type=\"text\" id=\"option_price_"+new_option_cnt+"\" name=\"prod_option_price\" class=\"admin_input alignRight\" size=\"10\" placeholder=\"가격\" /> 원"
				//+ "<input type=\"text\" id=\"option_price_"+new_option_cnt+"\" name=\"prod_option_price\" class=\"admin_input alignRight\" size=\"10\" placeholder=\"가격\" /> 원&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
				//+ "<select class=\"basic_select w100px\" id=\"option_price_"+new_option_cnt+"\" name=\"prod_option_use_st\">"
				//+ "<option value=\"Y\">사용"
				//+ "<option value=\"N\">사용중지"
				//+ "<option value=\"S\">Sold Out"
				//+ "</select>"
				+ "</div>";
	$('#option_list').append(shtml);
}
function option_delete(obj) {
	$('#option_'+obj).remove();
}
function productSaveCheck() {
	/*
	if(!$("#set_store_id").val()) {
		alert("상점아이디를 선택하세요"); $("#set_store_id").focus(); return false;
	}
	*/
	if(!$("#prod_nm").val()) {
		alert("상품명을 입력하세요."); $("#prod_nm").focus(); return false;
	}
	return true;
}

/* 쿠폰조회 모달 오픈 */
function getCouponModalOpen(obj) {
	$("#cp_bbs_id").val(obj);
	$("#searchCouponResult").html("<tr><td class=\"alignCenter\" colspan=\"5\" class=\"colorRed\">검색하신 후, 선택하세요.</td></tr>");
	$("#couponSearch").modal('show');
}
/* 결과값 삽입 */
function setCoupon(obj, cp_id, cp_name) {
	$("#set_"+obj).val(cp_id);
	$("#set_"+obj+"_nm").val(cp_name);
	couponSearchModalHIde();
}
/* 회원정보조회 모달 초기화 및 감춤 */
function couponSearchModalHIde() {
	$("#modalcouponsearchKeyword").val("");
	$("#searchCouponResult").html("<tr><td class=\"alignCenter\" colspan=\"5\" class=\"colorRed\">검색하신 후, 선택하세요.</td></tr>");
	$("#couponSearch").modal('hide');
}
/* 모달 회원조회 */
function getCouponSearch() {
	var cp_bbs_id = $.trim($("#cp_bbs_id").val());
	var modalsearchKeyword = $.trim($("#modalcouponsearchKeyword").val());
	
	if(!modalsearchKeyword) {
		alert("검색어를 입력하세요!");
		$("#modalcouponsearchKeyword").focus();
		return false;
	}
	
	$.ajax({
		type:"post",
		url : "/admgr/admgrModal/couponModalSearch.do", 
		dataType: 'text',
		//dataType: 'json',
		data : {cp_bbs_id: cp_bbs_id, modalsearchKeyword:modalsearchKeyword  },
		async: true,
		success: function(res) {
			res = $.trim(res);
			res = res.replace(/\n/g,"");
			res = res.replace(/\r/g,"");
			if(res == "AN") {
				alert('관리자로그인이 필요합니다.'); 
				location.href='/admgr/login.do'; 
			} else {
				$("#searchCouponResult").html(res);
			}
		}
	});	
}
/* 룸설정관련 */
function roomSet(obj, obj_name) {
	var prod_id = $("#prod_id").val();
	$("#modal_form").empty();
	room_modal_clean();
	
	if(!obj) { // 새로 등록
		var mtitle_stat = "등록";
		var mtitle_subject = "";
		$('#title_stat').text("등록");
		$('#room_setting').modal("show");
	} else {	//수정모드
		var mtitle_stat = "수정";
		var mtitle_subject = " ::: "+obj_name+" ::: ";
	}
	$.ajax({
		type:"post",
		url : "/admgr/admgrModal/getRoomForm.do", 
		dataType: 'text',
		//dataType: 'json',
		data : { prod_id: prod_id, room_seq: obj },
		async: true,
		success: function(res) {
			res = $.trim(res);
			res = res.replace(/\n/g,"");
			res = res.replace(/\r/g,"");
			if(res == "AN") {
				alert('관리자로그인이 필요합니다.'); 
				location.href='/admgr/login.do'; 
			} else {
				// 모달호출
				$("#modal_form").html(res);
				$('#title_stat').text(mtitle_stat);
				$('#title_subject').text(mtitle_subject);
				$('#room_setting').modal("show");
			}
		}
	});	
}
function room_modal_close() {
	$('#room_setting').modal("hide");
}
function room_modal_clean() {
	$(".modal_span").css("display", "none");
	$(".moda_select").val("Y");
	$(".modal_input").val("");
	$(".modal_textarea").val("");
	$("#option_list").empty();
	$("#room_orderby").val("1");
}
function option_room_price_add() {
	var is_option_room_cnt = $('#option_room_cnt').val();
	var new_option_room_cnt = parseInt(is_option_room_cnt)+1;
	$('#option_room_cnt').val(new_option_room_cnt);
	var shtml = "<div id=\"option_room_"+new_option_room_cnt+"\">"
				+ "<a href=\"#;\" onclick=\"option_room_delete("+new_option_room_cnt+")\" class=\"btns whitebtn h24px\"><i class=\"fal fa-minus\" ></i></a>&nbsp;&nbsp;&nbsp;"
				+ "<input type=\"text\" id=\"option_room_nm_"+new_option_room_cnt+"\" name=\"prod_option_room_nm\" class=\"admin_input\" size=\"35\" placeholder=\"내용\" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
				+ "<input type=\"text\" id=\"option_room_price_"+new_option_room_cnt+"\" name=\"prod_option_room_price\" class=\"admin_input alignRight\" size=\"10\" placeholder=\"가격\" /> 원"
				+ "</div>";
	$('#option_room_list').append(shtml);
}
function option_room_delete(obj) {
	$('#option_room_'+obj).remove();
}
function save_room() {
	var prod_id = $("#prod_id").val();
	var room_seq = $("#room_seq").val();
	var room_nm= $("#room_nm").val();
	var room_use_st = $("#room_use_st").val();
	var room_orderby = $("#room_orderby").val();
	
	var room_img_1_id = $("#room_img_1_id").val();
	var room_old_img_1_id = $("#room_old_img_1_id").val();
	var room_img_1_del = "N";
	if($("#room_img_1_del").prop("checked") == true) {
		room_img_1_del = "Y";
	}
	var room_img_2_id = $("#room_img_2_id").val();
	var room_old_img_2_id = $("#room_old_img_2_id").val();
	var room_img_2_del = "N";
	if($("#room_img_2_del").prop("checked") == true) {
		room_img_2_del = "Y";
	}
	var room_img_3_id = $("#room_img_3_id").val();
	var room_old_img_3_id = $("#room_old_img_3_id").val();
	var room_img_3_del = "N";
	if($("#room_img_3_del").prop("checked") == true) {
		room_img_3_del = "Y";
	}
	var room_img_4_id = $("#room_img_4_id").val();
	var room_old_img_4_id = $("#room_old_img_4_id").val();
	var room_img_4_del = "N";
	if($("#room_img_4_del").prop("checked") == true) {
		room_img_4_del = "Y";
	}
	var room_img_5_id = $("#room_img_5_id").val();
	var room_old_img_5_id = $("#room_old_img_5_id").val();
	var room_img_5_del = "N";
	if($("#room_img_5_del").prop("checked") == true) {
		room_img_5_del = "Y";
	}
	var room_img_6_id = $("#room_img_6_id").val();
	var room_old_img_6_id = $("#room_old_img_6_id").val();
	var room_img_6_del = "N";
	if($("#room_img_6_del").prop("checked") == true) {
		room_img_6_del = "Y";
	}
	var room_img_7_id = $("#room_img_7_id").val();
	var room_old_img_7_id = $("#room_old_img_7_id").val();
	var room_img_7_del = "N";
	if($("#room_img_7_del").prop("checked") == true) {
		room_img_7_del = "Y";
	}
	var room_img_8_id = $("#room_img_8_id").val();
	var room_old_img_8_id = $("#room_old_img_8_id").val();
	var room_img_8_del = "N";
	if($("#room_img_8_del").prop("checked") == true) {
		room_img_8_del = "Y";
	}
	var room_img_9_id = $("#room_img_9_id").val();
	var room_old_img_9_id = $("#room_old_img_9_id").val();
	var room_img_9_del = "N";
	if($("#room_img_9_del").prop("checked") == true) {
		room_img_9_del = "Y";
	}
	var room_img_10_id = $("#room_img_10_id").val();
	var room_old_img_10_id = $("#room_old_img_10_id").val();
	var room_img_10_del = "N";
	if($("#room_img_10_del").prop("checked") == true) {
		room_img_10_del = "Y";
	}

	var room_content_1 = $("#room_content_1").val();
	var room_content_2 = $("#room_content_2").val();
	var room_default_cnt = $("#room_default_cnt").val();
	if(!room_default_cnt) {
		room_default_cnt = 0;
	}
	var room_max_cnt = $("#room_max_cnt").val();
	if(!room_max_cnt) {
		room_max_cnt = 0;
	}
	var room_adult_price = $("#room_adult_price").val();
	if(!room_adult_price) {
		room_adult_price = 0;
	}
	var room_young_price = $("#room_young_price").val();
	if(!room_young_price) {
		room_young_price = 0;
	}
	
	var room_normal_normal_price = $("#room_normal_normal_price").val();
	var room_normal_normal_sale_price = $("#room_normal_normal_sale_price").val();
	var room_normal_holiday_price = $("#room_normal_holiday_price").val();
	var room_normal_holiday_sale_price = $("#room_normal_holiday_sale_price").val();

	var room_ready_normal_price = $("#room_ready_normal_price").val();
	var room_ready_normal_sale_price = $("#room_ready_normal_sale_price").val();
	var room_ready_holiday_price = $("#room_ready_holiday_price").val();
	var room_ready_holiday_sale_price = $("#room_ready_holiday_sale_price").val();

	var room_ready2_normal_price = $("#room_ready2_normal_price").val();
	var room_ready2_normal_sale_price = $("#room_ready2_normal_sale_price").val();
	var room_ready2_holiday_price = $("#room_ready2_holiday_price").val();
	var room_ready2_holiday_sale_price = $("#room_ready2_holiday_sale_price").val();
	
	var room_busy_normal_price = $("#room_busy_normal_price").val();
	var room_busy_normal_sale_price = $("#room_busy_normal_sale_price").val();
	var room_busy_holiday_price = $("#room_busy_holiday_price").val();
	var room_busy_holiday_sale_price = $("#room_busy_holiday_sale_price").val();
	
	$.ajax({
		type:"post",
		url : "/admgr/admgrModal/setRoom.do", 
		dataType: 'text',
		//dataType: 'json',
		data : { 
					prod_id: prod_id, 
					room_seq: room_seq,
					room_nm: room_nm,
					room_use_st: room_use_st,
					room_orderby: room_orderby,
					room_img_1_id: room_img_1_id,
					room_old_img_1_id: room_old_img_1_id,
					room_img_1_del: room_img_1_del,
					room_img_2_id: room_img_2_id,
					room_old_img_2_id: room_old_img_2_id,
					room_img_2_del: room_img_2_del,
					room_img_3_id: room_img_3_id,
					room_old_img_3_id: room_old_img_3_id,
					room_img_3_del: room_img_3_del,
					room_img_4_id: room_img_4_id,
					room_old_img_4_id: room_old_img_4_id,
					room_img_4_del: room_img_4_del,
					room_img_5_id: room_img_5_id,
					room_old_img_5_id: room_old_img_5_id,
					room_img_5_del: room_img_5_del,
					room_img_6_id: room_img_6_id,
					room_old_img_6_id: room_old_img_6_id,
					room_img_6_del: room_img_6_del,
					room_img_7_id: room_img_7_id,
					room_old_img_7_id: room_old_img_7_id,
					room_img_7_del: room_img_7_del,
					room_img_8_id: room_img_8_id,
					room_old_img_8_id: room_old_img_8_id,
					room_img_8_del: room_img_8_del,
					room_img_9_id: room_img_9_id,
					room_old_img_9_id: room_old_img_9_id,
					room_img_9_del: room_img_9_del,
					room_img_10_id: room_img_10_id,
					room_old_img_10_id: room_old_img_10_id,
					room_img_10_del: room_img_10_del,
					room_content_1: room_content_1,
					room_content_2: room_content_2,
					room_default_cnt: room_default_cnt,
					room_max_cnt: room_max_cnt,
					room_adult_price: room_adult_price,
					room_young_price: room_young_price,
					room_normal_normal_price: room_normal_normal_price,
					room_normal_normal_sale_price: room_normal_normal_sale_price,
					room_normal_holiday_price: room_normal_holiday_price,
					room_normal_holiday_sale_price: room_normal_holiday_sale_price,
					room_ready_normal_price: room_ready_normal_price,
					room_ready_normal_sale_price: room_ready_normal_sale_price,
					room_ready_holiday_price: room_ready_holiday_price,
					room_ready_holiday_sale_price: room_ready_holiday_sale_price,
					room_ready2_normal_price: room_ready2_normal_price,
					room_ready2_normal_sale_price: room_ready2_normal_sale_price,
					room_ready2_holiday_price: room_ready2_holiday_price,
					room_ready2_holiday_sale_price: room_ready2_holiday_sale_price,
					room_busy_normal_price: room_busy_normal_price,
					room_busy_normal_sale_price: room_busy_normal_sale_price,
					room_busy_holiday_price: room_busy_holiday_price,
					room_busy_holiday_sale_price: room_busy_holiday_sale_price
				},
		async: true,
		success: function(res) {
			res = $.trim(res);
			res = res.replace(/\n/g,"");
			res = res.replace(/\r/g,"");
			if(res == "AN") {
				alert('관리자로그인이 필요합니다.'); 
				location.href='/admgr/login.do'; 
			} else {
				$.ajax({
					type:"post",
					url : "/admgr/admgrModal/getRoomList.do", 
					dataType: 'text',
					//dataType: 'json',
					data : { prod_id : prod_id },
					async: true,
					success: function(res) {
						res = $.trim(res);
						res = res.replace(/\n/g,"");
						res = res.replace(/\r/g,"");
						room_modal_close();
						$("#prod_room_list").html(res);
					}
				});
			}
		}
	});	
}
function roomDel(obj) {
	var prod_id = $("#prod_id").val();
	if(confirm("정말 삭제하시겠습니까?")) {
		$.ajax({
			type:"post",
			url : "/admgr/admgrModal/getRoomDel.do", 
			dataType: 'text',
			//dataType: 'json',
			data : { room_seq : obj },
			async: true,
			success: function(res) {
				res = $.trim(res);
				res = res.replace(/\n/g,"");
				res = res.replace(/\r/g,"");
				if(res == "AN") {
					alert('관리자로그인이 필요합니다.'); 
					location.href='/admgr/login.do'; 
				} else {
					alert("삭제되었습니다.");
					getRoomList();
				}
			}
		});
	}
}
function getRoomList() {
	var prod_id = $("#prod_id").val();
	$.ajax({
		type:"post",
		url : "/admgr/admgrModal/getRoomList.do", 
		dataType: 'text',
		//dataType: 'json',
		data : { prod_id : prod_id },
		async: true,
		success: function(res) {
			res = $.trim(res);
			res = res.replace(/\n/g,"");
			res = res.replace(/\r/g,"");
			$("#prod_room_list").html(res);
		}
	});
}

/* 정산 월선택 */
function set_calc_month(obj) {
	var sel_year = $("#this_year").val(); 
	var new_obj = obj; 
	if(obj.length == 1) {
		new_obj = "0"+obj;
	}
	$(".month").removeClass("aquabtn");
	for(i=0; i<12; i++) {
		if($.trim($(".month").eq(i).text()) == obj+"월") {
			$(".month").eq(i).addClass("aquabtn");
		}
	}
	var set_ym = sel_year+"-"+new_obj;
	$("#search_ym").val(set_ym);
	location.href="/admgr/admgrStore/storeCalculateList.do?search_ym="+set_ym;
}
function store_info_set(obj) {
	var obj_ex = obj.split("|||");
	$("#set_store_id").val(obj_ex[0]);
	$("#set_store_nm").val(obj_ex[1]);
}
//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
//  } 상품관리   
//==================================================================================================


//==================================================================================================
//  주문내력 {   
//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function orderForm() {
	/*
	var in_date = $("#order_pay_date").val();
	if(in_date.length > 0) {
		if($("#order_st1").prop("checked") == true) {
			$("#order_st2").prop("checked", true);
		}
	} else {
		if($("#order_st2").prop("checked") == true) {
			$("#order_st1").prop("checked", true);
		}
	}
	*/
	if($("#is_cancel").val() == "Y") {
		if(!$("#cancel_price").val() || parseInt($("#cancel_price").val()) <= 0) {
			alert("취소상품이  존재합니다.\n\n취소금액을 입력하세요.");
			$("#cancel_price").focus();
			return false;
		} else {
			var cprice = $("#cancel_price").val();
			var autnNum = $("#order_pay_cd").val();
			if(!autnNum) { alert("승인번호가 존재하지 않습니다.\n\n거래 취소요청을 보낼 수 없습니다."); return false; }
			if(!cprice) { alert("취소금액이 존재하지 않습니다.\n\n거래 취소요청을 보낼 수 없습니다."); return false; }
			if(confirm("금액 "+number_format(cprice)+"원을 PG사로 취소요청 보내시겠습니까?")) {
				$.ajax({
					type:"post",
					url : "/admgr/admgrOrder/orderCancelPG.do", 
					dataType: 'text',
					//dataType: 'json',
					data : { autnNum:autnNum, cprice:cprice  },
					async: true,
					success: function(res) {
						res = $.trim(res);
						res = res.replace(/\n/g,"");
						res = res.replace(/\r/g,"");
						if(res == "S") {
							alert("PG사로의 요청이 정상적으로 처리되었습니다.");
							return true;
						} else {
							alert("PG사 처리가 실패하였습니다. 다시 시도하여 주세요.");
							return false;
						}
					}
				});
			}
		}
		
	} else {
		return true;
	}

}
function del_indate() {
	if(confirm("입금일자를 제거하면, \n  1)주문상태를 미결제로 변경\n  2)배송사,송장번호 초기화\n  3)상태가 미결제로 설정\n됩니다.\n\n진행하시겠습니까?\n(저장 후, 설정이 반영됩니다.)")) {
		$("#order_pay_date").val('');
		$("#order_st1").prop("checked", true);
		$(".odst").val("READY").addClass("disabled").prop("disabled", true);
		$(".dst").val("N").addClass("disabled").prop("disabled", true);
		$(".dcom").val("").addClass("disabled").prop("disabled", true);
		$(".dnum").val("").addClass("disabled").prop("disabled", true);
	}
}
function chk_cancel(od_seq, od_stat) {
	if(od_stat == "CANCEL") {
		$("#cancel_price_item_"+od_seq).val('0');
		$("#cancel_price_frm_"+od_seq).show();
		cancel_price_sum();
	} else {
		$("#cancel_price_item_"+od_seq).val('0');
		$("#cancel_price_frm_"+od_seq).hide();
		cancel_price_sum();
	}
	
	var res = 0;
	for(i=0; i<$(".odst").length; i++) {
		if($(".odst").eq(i).val() == "CANCEL") {
			res++;
		}
	}
	if(res > 0) {
		$("#is_cancel").val("Y");
		$("#cancel_form").show();
	} else {
		$("#cancel_form").hide();
	}
}
function cancel_price_sum() {
	var res = 0;
	for(i=0; i<$(".cancel_price_item").length; i++) {
		res += parseInt($(".cancel_price_item").eq(i).val());
	}
	$("#cancel_price").val(res);
	
}

//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
//  } 주문내력   
//==================================================================================================


//==================================================================================================
//  프리미엄노출 {   
//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
/* 슬라이드관련 */
function formSlidCheckt() {
	var slide_subject = $.trim($('#slide_subject').val());
	var st_dt = $.trim($('#slide_st_dt_ymd').val());
	var ed_dt = $.trim($('#slide_ed_dt_ymd').val());
	var slide_img = $.trim($('#slide_img').val());
	if(!slide_subject) { alert('슬라이드제목을 입력하세요'); return false; };
	if(!st_dt) { alert('시작날짜를 선택하세요'); return false; };
	if(!ed_dt) { alert('종료날짜를 선택하세요'); return false; };
	//if(!slide_img) { alert('이미지를 등록하세요'); return false; };
}
function delslide(pageIndex, seq, searchKeyword) {
	if(confirm("정말 삭제하시겠습니까?")) {
		location.href="/admgr/admgrMarketing/slideDelete.do?pageIndex="+pageIndex+"&searchKeyword="+searchKeyword+"&slide_seq="+seq+"&action_mode=delete";
	}
}
//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
/* 금주의 서천 */
function formWeekCheck() {
	var prod_id = $('#prod_id').val();
	var st_dt = $('#week_st_dt_ymd').val();
	var ed_dt = $('#week_ed_dt_ymd').val();
	var week_img = $('#week_img').val();
	if(!prod_id) { alert('상품을 검색하세요'); getProductsarchModalOpen('prod_id', 'prod_nm','store_category');  return false; };
	if(!st_dt) { alert('시작날짜를 선택하세요'); return false; };
	if(!ed_dt) { alert('종료날짜를 선택하세요'); return false; };
}
function delweek(pageIndex, seq, store_category, searchKey, searchKeyword) {
	if(confirm("정말 삭제하시겠습니까?")) {
		location.href="/admgr/admgrMarketing/weekDelete.do?pageIndex="+pageIndex+"&store_category="+store_category+"&searchKey="+searchKey+"&searchKeyword="+searchKeyword+"&week_seq="+seq+"&action_mode=delete";
	}
}
//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
/* 배너관련 */
function formBannerCheck() {
	if($('#banner_zone_1').prop('checked') == false && $('#banner_zone_2').prop('checked')== false &&  $('#banner_zone_3').prop('checked')== false ) {
		alert('배너표시영역을 한가지 이상 선택하여야 합니다.');  return false;
	}
	var banner_subject = $.trim($('#banner_subject').val());
	var st_dt = $.trim($('#banner_st_dt_ymd').val());
	var ed_dt = $.trim($('#banner_ed_dt_ymd').val());
	var banner_img = $.trim($('#banner_img').val());
	if(!banner_subject) { alert('배너제목을 입력하세요'); return false; };
	if(!st_dt) { alert('시작날짜를 선택하세요'); return false; };
	if(!ed_dt) { alert('종료날짜를 선택하세요'); return false; };
	//if(!banner_img) { alert('이미지를 등록하세요'); return false; };
}
function delbanner(pageIndex, seq, zone, searchKeyword) {
	if(confirm("정말 삭제하시겠습니까?")) {
		location.href="/admgr/admgrMarketing/bannerDelete.do?pageIndex="+pageIndex+"&zone="+zone+"&searchKeyword="+searchKeyword+"&banner_seq="+seq+"&action_mode=delete";
	}
}
//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
/* 메인상품관련 */
function formMainCheck() {
	var prod_id = $('#prod_id').val();
	var st_dt = $('#main_st_dt_ymd').val();
	var ed_dt = $('#main_ed_dt_ymd').val();
	if(!prod_id) { alert('상품을 검색하세요'); getProductsarchModalOpen('prod_id', 'prod_nm','store_cateogry');  return false; };
	if(!st_dt) { alert('시작날짜를 선택하세요'); return false; };
	if(!ed_dt) { alert('종료날짜를 선택하세요'); return false; };
}
function delmain(pageIndex, seq, store_category, searchKey, searchKeyword) {
	if(confirm("정말 삭제하시겠습니까?")) {
		location.href="/admgr/admgrMarketing/mainDelete.do?pageIndex="+pageIndex+"&store_category="+store_category+"&searchKey="+searchKey+"&searchKeyword="+searchKeyword+"&main_seq="+seq+"&action_mode=delete";
	}
}
//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
/* 상품조회 모달 오픈 */
function getProductsarchModalOpen(in_id, in_prod_id, in_store_category) {
	$("#modalsearchProductResult").html("<tr><td class=\"alignCenter\" colspan=\"6\" class=\"colorRed\">검색하신 후, 선택하세요.</td></tr>");
	$('#in_id').val(in_id);
	$('#in_prod_id').val(in_prod_id);
	$('#in_store_category').val(in_store_category);
	$("#productSearch").modal('show');
}
/* 결과값 삽입 */
function setProducInfo(in_id, in_prod_id, in_store_category, prod_id, prod_nm, store_category) {
	$("#"+in_id).val(prod_id);
	$("#"+in_prod_id).val(prod_nm);
	$("#"+in_store_category).val(store_category);
	productSearchModalHIde();
}
/* 상품조회 모달 초기화 및 감춤 */
function productSearchModalHIde() {
	$("#modalstore_category").val("");
	$("#modalsearchkey").val("prod_nm");
	$("#modalsearchKeyword").val("");
	$('#in_id').val("");
	$('#in_prod_id').val("");
	$('#in_store_category').val("");
	$("#modalsearchProductResult").html("<tr><td class=\"alignCenter\" colspan=\"6\" class=\"colorRed\">검색하신 후, 선택하세요.</td></tr>");
	$("#productSearch").modal('hide');
}
/* 모달 상품조회 */
function getProdSearch() {
	var modalstore_category = $.trim($("#modalprodstore_category").val());
	var modalsearchKey = $.trim($("#modalprodsearchKey").val());
	var modalsearchKeyword = $.trim($("#modalprodsearchKeyword").val());
	var modalprod_use_pay_st = $.trim($("#modalprod_use_pay_st").val());
	
	if(!modalsearchKeyword) {
		alert("검색어를 입력하세요!");
		$("#modalprodsearchKeyword").focus();
		return false;
	}
	
	$.ajax({
		type:"post",
		url : "/admgr/admgrModal/prodModalList.do", 
		dataType: 'text',
		//dataType: 'json',
		data : { modalstore_category : modalstore_category, modalsearchKey : modalsearchKey, modalsearchKeyword : modalsearchKeyword, modalprod_use_pay_st:modalprod_use_pay_st  },
		async: true,
		success: function(res) {
			res = $.trim(res);
			res = res.replace(/\n/g,"");
			res = res.replace(/\r/g,"");
			if(res == "AN") {
				alert('관리자로그인이 필요합니다.'); 
				location.href='/admgr/login.do'; 
			} else {
				$("#modalsearchProductResult").html(res);
			}
		}
	});	
}
//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
//  } 프리미엄노출   
//==================================================================================================


//==================================================================================================
//  고객센터 {   
//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function delbbs(pageIndex,bbs_id, seq, searchKey, searchKeyword, store_category) {
	if(confirm("정말 삭제하시겠습니까?")) {
		var gourl = "/admgr/admgrCustomer/bbsDelete.do?pageIndex="+pageIndex+"&bbs_id="+bbs_id+"&searchKey="+searchKey+"&searchKeyword="+searchKeyword+"&bbs_seq="+seq;
		if(store_category) {
			gourl += "&store_category="+store_category;
		}
		location.href=gourl;
	}	
}
function cp_del(obj) {
	if(confirm("쿠폰을 삭제하시겠습니까?\n\n삭제 후, 저장하여야 반영됩니다.")) {
		$("#set_bbs_cp"+obj).val("");
		$("#set_bbs_cp"+obj+"_nm").val("");
		$("#cp"+obj+"_res").empty();
	}
}
//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
//  } 고객센터   
//==================================================================================================


//==================================================================================================
//  부가기능 {   
//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function coupon_unit_change(obj) {
	var res = "원";
	if(obj == "P") { res = "%" }
	$('#coupon_unit').text(res);
	$('#coupon_unit').text(res);
	$('#coupon_set_price').val('');
}
function max_value(obj, unit) {
	var obj_val = $('#'+obj).val();
	var unit_val = $('#'+unit).val();
	
	ex = obj_val.split(".");
	new_obj = obj_val;
	if(unit_val == "P") {
		if(parseInt(obj_val) > 100) {
			alert('%지정시 그 값은 100%보다 클 수 없습니다.');
			$('#'+obj).val('');
			return false;
		}
		var new_ex1 = "";
		if(ex[1] != "undefined") {
			if(ex[1].length>2) {
				new_ex1_val = ex[1][0]+ex[1][1];
				new_ex1 = "."+new_ex1_val;
			} 
			else if(ex[1] == "00") {
				new_ex1 = "";
			} else {
				new_ex1 = "."+ex[1];
			}
		}
		new_obj = ex[0]+new_ex1;
		$('#'+obj).val(new_obj);
	}
}
function delcoupon(pageIndex, seq, searchKeyword, store_category) {
	if(confirm("정말 삭제하시겠습니까?")) {
		var gourl = "/admgr/admgrExtention/couponDel.do?pageIndex="+pageIndex+"&coupon_seq="+seq+"&searchKeyword="+searchKeyword+"&store_category="+store_category;
		location.href=gourl;
	}
}
function set_target(obj) {
	var res = "";
	switch(obj) {
		case "all" : res = "회원전체"; $("#targetlist_text").show().html(res); $("#targetlist1").hide(); $("#targetlist2").hide(); $("#targetlist3").hide(); break; 
		case "normal_all" : res = "일반회원 전체"; $("#targetlist_text").show().html(res); $("#targetlist1").hide(); $("#targetlist2").hide(); $("#targetlist3").hide(); break; 
		case "store_all" : res = "상점회원 전체"; $("#targetlist_text").show().html(res); $("#targetlist1").hide(); $("#targetlist2").hide(); $("#targetlist3").hide(); break;
		case "normal_sel" : $(".sms_number").val(""); $("#targetlist_text").hide(); $("#targetlist1").show(); $("#targetlist2").hide(); $("#targetlist3").hide(); break;
		case "store_sel" : $(".sms_number").val(""); $("#targetlist_text").hide(); $("#targetlist1").hide(); $("#targetlist2").show(); $("#targetlist3").hide(); break;
		case "input" : $(".sms_number").val(""); $("#targetlist_text").hide(); $("#targetlist1").hide(); $("#targetlist2").hide(); $("#targetlist3").show(); break;
	}
}
function set_number(obj, idx) {
	var data = $("#sms_number_"+idx).val(obj);
}
function char_length(obj, prt) {
	var getstr = $("#"+obj).val();
	var len = 0;
	for (var i = 0; i < getstr.length; i++) {
        if (escape(getstr.charAt(i)).length == 6) {
            len++;
        }
        len++;
    }
	var str = "";
	if(len < 80) {
		str = "[SMS] <b class='colorOrange'>"+len+"</b>"; 
	} else {
		str = "[LMS] <b class='colorOrange'>"+len+"</b>";
	}
	$("#"+prt).html(str);
}

function sms_add_save() {
	if($("#sms_target").val() == "") {
		alert("대상을 선택하세요");
		return false;
	}
	if($("#sms_target").val() == "normal_sel" || $("#sms_target").val() == "store_sel") {
		var target_cnt = 0;
		//alert($(".target_number").length);
		for(i=0; i<$(".target_number").length; i++) {
			if($.trim($(".target_number").eq(i).val())) {
				target_cnt++;
			}
		}
		if(target_cnt == 0) {
			alert('한명이상 대상자가 있어야 합니다.');
			return false;
		}
	}
	if(!$.trim($("#sms_msg").val())) {
		alert("메세지 내용을 입력하세요!");
		return false;
	}
	if(confirm("정말 문자메세지를 전송하시겠습니까?")) {
		return true;
	} else {
		return false;
	}
}
//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
//  } 부가기능   
//==================================================================================================


//==================================================================================================
//  통계 {   
//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function set_keywords_month(obj) {
	var sel_year = $("#this_year").val(); 
	var new_obj = obj; 
	if(obj.length == 1) {
		new_obj = "0"+obj;
	}
	$(".month").removeClass("aquabtn");
	for(i=0; i<12; i++) {
		if($.trim($(".month").eq(i).text()) == obj+"월") {
			$(".month").eq(i).addClass("aquabtn");
		}
	}
	var set_ym = sel_year+"-"+new_obj;
	$("#search_ym").val(set_ym);
	location.href="/admgr/admgrStatistics/keywordList.do?search_ym="+set_ym;
}
function set_conn_month(obj) {
	var sel_year = $("#this_year").val(); 
	var new_obj = obj; 
	if(obj.length == 1) {
		new_obj = "0"+obj;
	}
	$(".month").removeClass("aquabtn");
	for(i=0; i<12; i++) {
		if($.trim($(".month").eq(i).text()) == obj+"월") {
			$(".month").eq(i).addClass("aquabtn");
		}
	}
	var set_ym = sel_year+"-"+new_obj;
	$("#search_ym").val(set_ym);
	location.href="/admgr/admgrStatistics/connection.do?search_ym="+set_ym;
}
function set_sale_month(obj) {
	var sel_year = $("#this_year").val(); 
	var new_obj = obj; 
	if(obj.length == 1) {
		new_obj = "0"+obj;
	}
	$(".month").removeClass("aquabtn");
	for(i=0; i<12; i++) {
		if($.trim($(".month").eq(i).text()) == obj+"월") {
			$(".month").eq(i).addClass("aquabtn");
		}
	}
	var set_ym = sel_year+"-"+new_obj;
	$("#search_ym").val(set_ym);
	location.href="/admgr/admgrStatistics/statistics.do?search_ym="+set_ym;
}

//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
//  } 통계   
//==================================================================================================


//==================================================================================================
//  시스템관리 {   
//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function cdSettingForm() {
	return true;
}
//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
//  } 시스템관리   
//==================================================================================================


//==================================================================================================
//  Sample {   
//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
//  } Sample   
//==================================================================================================


/* 상품삭제체크 */
function productDelCheck(seq) {
	if(confirm("삭제한 데이터는 복구 되지 않습니다.\n\n정말 삭제하시겠습니까?")) {
		location.href="/admgr/admgrProduct/productForm.do?store_category="+store_category+"&prod_seq="+seq
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


