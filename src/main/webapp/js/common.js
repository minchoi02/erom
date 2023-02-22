(function($) {

	$(document).ready(function() {
		// menu icon states, opening main nav
		$('#menu-icon').click(function() {
			$(".mnubtn").toggleClass('open');
			$('.shadow').toggleClass('open');
			$('#m-nav').toggleClass('open');
		});

		$('#search-icon, .shadow').click(function() {
			$('.shadow').toggleClass('open');
			$('#totalSearch').toggleClass('open');
		});

		$("a.sharebtn").click(function() {
			$("#socialLinkPop").toggleClass('open');
			$(".shadowbg").fadeIn();
		});

		$("a.popCloseBtn, .shadowbg").click(function() {
			$("#socialLinkPop").removeClass('open');
			$(".shadowbg").fadeOut();
		});

		$("a.marketbuybtn").click(function() {
			$("#m-nav").toggleClass('option_open');
		});

		$('a.pagelink').click(function() {
			$('html, body').animate({
				scrollTop : $($(this).attr('href')).offset().top
			}, 500);
			return false;
		});

		/* movTop */
		$(window).scroll(function() {
			if ($(this).scrollTop() > 100) {
				$('#wrapper').addClass("scrollOn");
				$('#topArea').fadeIn();
			} else {
				$('#wrapper').removeClass("scrollOn");
				$('#topArea').fadeOut();
			}
		});
	});
})(jQuery)
function isEmpty(sIn) { return sIn ? false : true; } 
function form_execDaumPostcode(zip, addr1, addr2, lat, lng) {
	new daum.Postcode({
		oncomplete : function(data) {
			// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

			// 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
			// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
			var roadAddr = data.roadAddress; // 도로명 주소 변수
			var extraRoadAddr = ''; // 참고 항목 변수

			// 법정동명이 있을 경우 추가한다. (법정리는 제외)
			// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
			if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
				extraRoadAddr += data.bname;
			}
			// 건물명이 있고, 공동주택일 경우 추가한다.
			if (data.buildingName !== '' && data.apartment === 'Y') {
				extraRoadAddr += (extraRoadAddr !== '' ? ', '
						+ data.buildingName : data.buildingName);
			}
			// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
			if (extraRoadAddr !== '') {
				extraRoadAddr = ' (' + extraRoadAddr + ')';
			}

			// 우편번호와 주소 정보를 해당 필드에 넣는다.
			document.getElementById(zip).value = data.zonecode;
			document.getElementById(addr1).value = roadAddr;
			if(lat && lng) {
				getgps(addr1,addr2, lat, lng);
			}
			document.getElementById(addr2).focus();
			// document.getElementById("sample4_jibunAddress").value =
			// data.jibunAddress;

			// 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
			/*
			 * if(roadAddr !== ''){
			 * document.getElementById("sample4_extraAddress").value =
			 * extraRoadAddr; } else {
			 * document.getElementById("sample4_extraAddress").value = ''; }
			 */

			// var guideTextBox = document.getElementById("guide");
			// 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
			/*
			 * if(data.autoRoadAddress) { var expRoadAddr = data.autoRoadAddress +
			 * extraRoadAddr; guideTextBox.innerHTML = '(예상 도로명 주소 : ' +
			 * expRoadAddr + ')'; guideTextBox.style.display = 'block'; } else
			 * if(data.autoJibunAddress) { var expJibunAddr =
			 * data.autoJibunAddress; guideTextBox.innerHTML = '(예상 지번 주소 : ' +
			 * expJibunAddr + ')'; guideTextBox.style.display = 'block'; } else {
			 * guideTextBox.innerHTML = ''; guideTextBox.style.display = 'none'; }
			 */
		}
	}).open();
}

/* ckeditor5 시작*/
function getEditor(id) {
	ClassicEditor.create( document.querySelector( '#'+id ), {
		// toolbar: [ 'heading', '|', 'bold', 'italic', 'link' ]
		language:"ko",
		ckfinder: {
	        uploadUrl: '/Api/editorFileUpload.do' // 내가 지정한 업로드 url (post로 요청감)
	    }
	} )
}
/* ckeditor5 종료 */

/* AjaxUpload 시작 */
function file_upload(upurl, file_id) {
	var fileData = new FormData();
	var upfile = $("#"+file_id)[0].files[0];
	//console.log(upfile);
	fileData.append("uploadUrl", upurl);
	fileData.append("uploadFile", upfile);
	
	$.ajax({
		type:"post",
		enctype: 'multipart/form-data',
		url : "/Api/FileUpload.do", 
		data : fileData,
		async: false,
        cache: false,
		processData: false,
        contentType: false,
        timeout: 600000,
		success: function(res) {
			res = $.trim(res);
			res = res.replace(/\n/g,"");
			res = res.replace(/\r/g,"");
			//console.log(res);
			$("#"+file_id+"_id").val(res);
		}
	});	
}
/* AjaxUpload 종료 */

/* 시간 가져오기 */
function getHourSelect(id, htype, val) {
	var result = "";
	if (!val) {
		if (htype == "S") {
			val = "00";
		} else {
			val = "23";
		}
	}
	for (i = 0; i < 24; i++) {
		if (String(i).length == 1) {
			istr = "0" + i;
		} else {
			istr = i;
		}
		var selected = "";
		if (istr == val) {
			selected = "selected";
		}
		result += "<option value=\"" + istr + "\" " + selected + "> " + istr
				+ " 시";
	}
	$("#" + id).html(result);
}
/* 분 가져오기 */
function getMinuteSelect(id, mtype, val) {
	var result = "";
	if (!val) {
		if (mtype == "S") {
			val = "00";
		} else {
			val = "59";
		}
	}
	for (i = 0; i < 60; i += 5) {
		if (String(i).length == 1) {
			istr = "0" + i;
		} else {
			istr = i;
		}
		var selected = "";
		if (istr == val) {
			selected = "selected";
		}
		result += "<option value=\"" + istr + "\" " + selected + "> " + istr
				+ " 분";
	}
	if (val == 59) {
		selected = "selected";
	}
	result += "<option value=\"59\" " + selected + "> 59 분";
	$("#" + id).html(result);
}
/* 아이디 중복확인 */
function user_id_check() {
	var user_id = $.trim($("#user_id").val());
	// ajax 아이디 중복확인
}