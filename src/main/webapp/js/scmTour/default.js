//==================================================================================================
// 기본 공통 {
//-----------------------------------------------------------------------------------------------------------------------------------------------------------
function locationReplace(url){
	alert("시작")
	if(history.replaceState)
		{ history.replaceState(null, document.title, url);
		history.go(0);
	}else{
		location.replace(url);
	}
}
function setdatepicker(obj, mindate, maxdate) {
	$("#"+obj).datepicker({
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
		 //yearRange: 'c:c+2',
		 weekHeader: 'Wk',
		 isRTL: false,
		 showButtonPanel: true,
		 buttonImageOnly: true,
		 showMonthAfterYear: true ,
		 changeMonth: true,
		 minDate: mindate, //0: 오늘까지, -1은 어제까지... +1은 내일까지?
		 maxDate: maxdate, //0: 오늘까지, -1은 어제까지... +1은 내일까지?
		 changeYear: true
	});
}
function indexAjaxLoad(obj) {
	$.ajax({
		type:"post",
		url : "/Ajax/indexLoad.do",
		dataType: 'text',
		//dataType: 'json',
		data : { object : obj},
		async: true,
		success: function(res) {
			$("#"+obj).html(res);
			$(".loading").hide();
		}
	});
}
function reserveDateStEdCheck(st, ed) {
	var store_category = $("#set_store_category").val();
	var prod_id = $("#set_prod_id").val();
	var st_in = $("#"+st).val();
	var ed_in = $("#"+ed).val();
	if(!st_in) {
		alert('입실일을 선택하세요.');
		$("#"+st).focus();
		return false;
	}
	if(!ed_in) {
		alert('퇴실일을 선택하세요.');
		$("#"+ed).focus();
		return false;
	}
	if(st_in == ed_in) {
		alert('입실일과 퇴실일은 같은 날일 수 없습니다.');
		$("#"+ed).val("");
		$("#"+ed).focus();
		return false;
	}
	
	var stDate = st_in.split("-");
	var edDate = ed_in.split("-");
	var stDatefmt = new Date(stDate[0], stDate[1], stDate[2]);
	var edDatefmt = new Date(edDate[0], edDate[1], edDate[2]);
	
	if(stDatefmt > edDatefmt) {
		alert('퇴실일은 입실일보다 이후여야 합니다.');
		$("#"+ed).val("");
		$("#"+ed).focus();
		return false;
	}
	if(st_in && ed_in) {
		location.href="/shop/itemView.do?store_category="+store_category+"&prod_id="+prod_id+"&reserve_st_dt="+st_in+"&reserve_ed_dt="+ed_in;
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
function createkakaomap(lat, lng){
	var mapContainer = document.getElementById('maparea'), // 지도를 표시할 div
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
function site_info(obj) {
	var w = window.open('http://www.ftc.go.kr/bizCommPop.do?wrkr_no='+obj+'&apv_perm_no=', 'info', 'width=700, height=500');
	w.focus();
}
function getLogin(url) {
	if(confirm('로그인이 필요합니다.\n\n로그인페이지로 이동하시겠습니까?')) {
	location.href="/login.do?return_url="+ encodeURIComponent(url);
		//location.href="/member/joinLogin.do?return_url="+ encodeURIComponent(url);
	}
}
function goLoginpage(url) {
	location.href="/member/login.do?return_url="+ encodeURIComponent(url);
}
function prod_pick(prod_id) {
	var this_cnt = $("#prod_pick_cnt").val();
	$(".loading").show();
	$.ajax({
		type:"post",
		url : "/Ajax/prodPick.do",
		dataType: 'text',
		//dataType: 'json',
		data : { prod_id : prod_id},
		async: true,
		success: function(res) {
			res = $.trim(res);
			res = res.replace(/\n/g,"");
			res = res.replace(/\r/g,"");
			if(res == "A") {
				$(".jjimbtn").addClass("active");
				new_cnt = parseInt(this_cnt) + 1;
				alert("찜목록에 추가됐습니다.");
				
				//추가됨
			} else {
				$(".jjimbtn").removeClass("active");
				new_cnt = parseInt(this_cnt) - 1;
				alert("찜목록에 삭제됐습니다.");
				//삭제됨
			}
			var new_cnt_str = number_format(new_cnt);
			$("#prod_pick_cnt").val(new_cnt);
			$("#pick_cnt").text(new_cnt_str);
			$(".loading").hide();
		}
	});
}
function fav_prod_pick(prod_id) {
	if(confirm("찜을 취소하면, 목록에 나타나지 않습니다.\n\n진행하시겠습니까?")) {
		$(".loading").show();
		$.ajax({
			type:"post",
			url : "/Ajax/prodPick.do",
			dataType: 'text',
			//dataType: 'json',
			data : { prod_id : prod_id},
			async: true,
			success: function(res) {
				res = $.trim(res);
				res = res.replace(/\n/g,"");
				res = res.replace(/\r/g,"");
				getFavList();
				$(".loading").hide();
			}
		});
	}
}
function prod_ajax_pick(prod_id) {
	$(".loading").show();
	$.ajax({
		type:"post",
		url : "/Ajax/prodPick.do",
		dataType: 'text',
		//dataType: 'json',
		data : { prod_id : prod_id},
		async: true,
		success: function(res) {
			res = $.trim(res);
			res = res.replace(/\n/g,"");
			res = res.replace(/\r/g,"");
			if(res == "A") {
				$("#prod_pick_"+prod_id).addClass("active");
				//추가됨
			} else {
				$("#prod_pick_"+prod_id).removeClass("active");
				//삭제됨
			}
			$(".loading").hide();
		}
	});
}
function write_qna(prod_nm) {
	$("#qna_content").val("");
	$("#qna_title").html(prod_nm+" Q&A 작성");
	$("#bbs_secure_st").prop("checked",false);
	$('#writeqna').modal("show");
}
function modify_qna(prod_nm, bbs_seq) {
	var bbs_id = "QNA";
	$("#qna_title").html(prod_nm+" Q&A 수정");
	$.ajax({
		type:"post",
		url : "/Ajax/get_ajax_bbs.do",
		dataType: 'text',
		//dataType: 'json',
		data : { bbs_id : bbs_id, bbs_seq : bbs_seq },
		async: true,
		success: function(res) {
			if(res) {
				var bbsObject = JSON.parse(res);
				var bbs_subject = bbsObject.bbs_subject;
				var bbs_content = bbsObject.bbs_content;
				var bbs_secure_st = bbsObject.bbs_secure_st;
				$("#qna_bbs_seq").val(bbs_seq);
				$("#qna_content").val(bbs_content);
				if(bbs_secure_st == "Y")
				$("#bbs_secure_st").prop("checked", true);
				$('#writeqna').modal("show");
				
			} else {
				alert('데이터를 기져오는데 장애가 발생하였습니다.');
			}
		}
	});
}
function delete_qna(bbs_seq) {
	if(confirm("정말 삭제하시겠습니까?")) {
		var bbs_id = "QNA";
		var bbs_action = "delete";
		$.ajax({
			type:"post",
			url : "/Ajax/bbs_save.do",
			dataType: 'text',
			//dataType: 'json',
			data : { bbs_id : bbs_id, bbs_seq : bbs_seq, bbs_action : bbs_action },
			async: true,
			success: function(res) {
				res = $.trim(res);
				res = res.replace(/\n/g,"");
				res = res.replace(/\r/g,"");
				if(res) {
					if(res == "S") {
						alert("삭제되었습니다.");
						location.reload();
					}
					else {
						alert("삭제실패!  관리자에게 문의바랍니다.");
					}
				} else {
					alert('데이터처리중 장애가 발생하였습니다.');
				}
			}
		});
	}
}
function save_qna(bbs_id, prod_id, store_id) {
	var bbs_seq = $("#qna_bbs_seq").val();
	var bbs_action = $("#qna_action_mode").val();
	var content = $.trim($("#qna_content").val());
	if(!prod_id) {
		alert("정상적인 접근이 아닙니다."); return false;
	}
	if(!content) {
		alert("내용을 입력해 주세요"); $("#qna_content").focus(); return false;
	}
	bbs_secure_st = "N";
	if($("#bbs_secure_st").prop("checked") == true) {
		bbs_secure_st = "Y";
	}
	$(".loading").show();
	$.ajax({
		type:"post",
		url : "/Ajax/bbs_save.do",
		dataType: 'text',
		//dataType: 'json',
		data : { bbs_id : bbs_id, bbs_seq : bbs_seq, bbs_action : bbs_action, prod_id : prod_id, store_id: store_id, content : content, bbs_secure_st : bbs_secure_st },
		async: true,
		success: function(res) {
			res = $.trim(res);
			res = res.replace(/\n/g,"");
			res = res.replace(/\r/g,"");
			$(".loading").hide();
			switch(res) {
				case "S" :
					if(bbs_seq) {
						alert("QnA가 수정되었습니다.");
						
					} else {
						alert("QnA가 등록되었습니다.");
					}
					$('#writeqna').modal("hide");
					location.reload();
					break;
				case "P" :
					alert("권한이 없습니다.");
					break;
				default :
					alert("등록실패! 관리자에게 문의바랍니다");
					$('#writeqna').modal("hide");
					break;
			}
		}
	});
}

function star_set(obj) {
	for(i=1; i<=5; i++) {
		if(obj >= i) {
			$("#star_"+i).removeClass("fas").removeClass("fal").addClass("fas");
		} else {
			$("#star_"+i).removeClass("fas").removeClass("fal").addClass("fal");
		}
	}
	$("#set_star").val(obj);
}
function write_review(prod_nm) {
	$("#review_title").html(prod_nm+" 리뷰 작성");
	$("#review_content").val("");
	star_set(5);
	$('#writereview').modal("show");
}
function modify_review(prod_nm, bbs_seq) {
	var bbs_id = "REVIEW";
	$("#review_title").html(prod_nm+" 리뷰 수정");
	$.ajax({
		type:"post",
		url : "/Ajax/get_ajax_bbs.do",
		dataType: 'text',
		//dataType: 'json',
		data : { bbs_id : bbs_id, bbs_seq : bbs_seq },
		async: true,
		success: function(res) {
			if(res) {
				var bbsObject = JSON.parse(res);
				var bbs_subject = bbsObject.bbs_subject;
				var bbs_content = bbsObject.bbs_content;
				var bbs_star = bbsObject.bbs_star;
				$("#review_bbs_seq").val(bbs_seq);
				$("#review_content").val(bbs_content);
				star_set(bbs_star);
				$('#writereview').modal("show");
				
			} else {
				alert('데이터를 기져오는데 장애가 발생하였습니다.');
			}
		}
	});
}
function delete_review(bbs_seq) {
	if(confirm("정말 삭제하시겠습니까?")) {
		var bbs_id = "REVIEW";
		var bbs_action = "delete";
		$.ajax({
			type:"post",
			url : "/Ajax/bbs_save.do",
			dataType: 'text',
			//dataType: 'json',
			data : { bbs_id : bbs_id, bbs_seq : bbs_seq, bbs_action : bbs_action },
			async: true,
			success: function(res) {
				res = $.trim(res);
				res = res.replace(/\n/g,"");
				res = res.replace(/\r/g,"");
				if(res) {
					if(res == "S") {
						alert("삭제되었습니다.");
						location.reload();
					} else {
						alert("삭제실패!  관리자에게 문의바랍니다.");
					}
				} else {
					alert('데이터처리중 장애가 발생하였습니다.');
				}
			}
		});
	}
}
function save_review(bbs_id, prod_id, store_id) {
	var bbs_seq = $("#review_bbs_seq").val();
	var bbs_action = $("#review_action_mode").val();
	var content = $.trim($("#review_content").val());
	var star = $.trim($("#set_star").val());
	if(!prod_id) {
		alert("정상적인 접근이 아닙니다."); return false;
	}
	if(!content) {
		alert("내용을 입력해 주세요"); $("#review_content").focus(); return false;
	}
	$(".loading").show();
	$.ajax({
		type:"post",
		url : "/Ajax/bbs_save.do",
		dataType: 'text',
		//dataType: 'json',
		data : { bbs_id : bbs_id, bbs_seq : bbs_seq, bbs_action : bbs_action, prod_id : prod_id, store_id: store_id, content : content, star : star },
		async: true,
		success: function(res) {
			res = $.trim(res);
			res = res.replace(/\n/g,"");
			res = res.replace(/\r/g,"");
			$(".loading").hide();
			switch(res) {
				case "S" :
					if(bbs_seq) {
						alert("리뷰가 수정되었습니다.");
					} else {
						alert("리뷰가 등록되었습니다.");
					}
					$('#writereview').modal("hide");
					location.reload();
					break;
				default :
					alert("등록실패! 관리자에게 문의바랍니다");
					$('#writereview').modal("hide");
					break;
			}
			
		}
	});
}


function coupon(coupon_id) {
	$(".loading").show();
	$.ajax({
		type:"post",
		url : "/Ajax/couponIssue.do",
		dataType: 'text',
		//dataType: 'json',
		data : { coupon_id : coupon_id },
		async: true,
		success: function(res) {
			res = $.trim(res);
			res = res.replace(/\n/g,"");
			res = res.replace(/\r/g,"");
			$(".loading").hide();
			switch(res) {
				// 이미 받았다면...
				case "AN" :
					getLogin($("#site_return_url").val());
					break;
				case "A" :
					alert("이미 다운로드 받은 쿠폰입니다.");
					break;
				case "E" :
					alert("이미 종료된 쿠폰입니다.");
					break;
				default :
					alert("쿠폰이 발급되었습니다.");
					location.reload();
					break;
			}
		}
	});
}

function bbs_search_check() {
	var keyword = $.trim($("#searchKeyword").val());
	if(!keyword) {
		alert("검색어를 입력하세요");
		$("#searchKeyword").focus();
		return false;
	}		
}

function getItemList(set) {
	var pageNum = $("#pageNum").val();
	var pagePerCnt = $("#pagePerCnt").val();
	var store_category = $("#store_category").val();
	var prod_category = $("#prod_category").val();
	var orderby = $("#orderby").val();
	var prod_age = $("#hidden_prod_age").val();
	var prod_season = $("#hidden_prod_season").val();
	var prod_travel_type = $("#hidden_prod_travel_type").val();
	
	$("#moreCall").remove();
	$(".loading").show();
	$.ajax({
		type:"post",
		url : "/Ajax/itemList.do",
		dataType: 'text',
		//dataType: 'json',
		data : { pageNum : pageNum, pagePerCnt: pagePerCnt, store_category : store_category, prod_category : prod_category, orderby : orderby, prod_age : prod_age, prod_season : prod_season, prod_travel_type : prod_travel_type },
		async: true,
		success: function(res) {
			//res = $.trim(res);
			//res = res.replace(/\n/g,"");
			//res = res.replace(/\r/g,"");
			if(set == "new") {
				$("#pageNum").val(1);
				if(store_category == "CD002005") {
					$("#recommendListCon").html(res);	
				} else {
					$("#siteprodList").html(res);
				}
			} else {
				$("#pageNum").val(parseInt(pageNum)+1);
				if(store_category == "CD002005") {
					$("#recommendListCon").append(res);	
				} else {
					$("#siteprodList").append(res);
				}
			}
			$(".loading").hide();
			
		}
	});
}

function getFavList() {
	var pageNum = $("#pageNum").val();
	var pagePerCnt = $("#pagePerCnt").val();
	var store_category = $("#store_category").val();
	
	$("#moreCall").remove();
	$(".loading").show();
	$.ajax({
		type:"post",
		url : "/Ajax/favList.do",
		dataType: 'text',
		//dataType: 'json',
		data : { pageNum : pageNum, pagePerCnt: pagePerCnt, store_category : store_category },
		async: true,
		success: function(res) {
			//res = $.trim(res);
			//res = res.replace(/\n/g,"");
			//res = res.replace(/\r/g,"");
			$("#pageNum").val(1);
			$("#favList").html(res);
			$(".loading").hide();
		}
	});
}


function goRecomList(obj, objval) {
	$("#hidden_prod_"+obj).val(objval);
	$("#pageNum").val(0);
	getItemList('new');
}
function roomDetailInfo(store_id, room_seq) {
	$(".loading").show();
	$.ajax({
		type:"post",
		url : "/Ajax/roomDetail.do",
		dataType: 'text',
		//dataType: 'json',
		data : { room_seq : room_seq, store_id : store_id},
		async: true,
		success: function(res) {
			//res = $.trim(res);
			//res = res.replace(/\n/g,"");
			//res = res.replace(/\r/g,"");
			$("#roomdetail").html(res);
			$("#roomInfo").modal('show');
			$(".loading").hide();
		}
	});
}
function roomReserve(st_dt, ed_dt, store_category, prod_id, room_seq) {
	if(!st_dt) { alert("입실예약일과 퇴실예약일을 선택 후, 검색을 통하여 예약가능 여부를 먼저 확인하셔야 합니다."); $("#reserve_st_dt").focus(); return false; }
	if(!ed_dt) { alert("입실예약일과 퇴실예약일을 선택 후, 검색을 통하여 예약가능 여부를 먼저 확인하셔야 합니다."); $("#reserve_ed_dt").focus(); return false; }
	if(!store_category) { alert("필수값이 체크되지 않았습니다."); return false; }
	if(!prod_id) { alert("필수값이 체크되지 않았습니다."); return false; }
	if(!st_dt) { alert("필수값이 체크되지 않았습니다."); return false; }
	if(!room_seq) { alert("예약할 객실을 선택하세요."); return false; }
	$("#roomReserveForm_"+room_seq).submit();
}


function snsLogin(obj) {
	alert('보안인증서 업그레이드 문제로 잠시 기능을 보류합니다.\n\n일반회원으로 가입은 가능합니다.');
}

function searchGo(keyword) {
	location.href='/search/searchResult.do?searchKeyword='+encodeURIComponent(keyword);
}

function searchSubmit() {
	var searchKeyword = $("#searchKeyword").val();
	searchGo(searchKeyword);
}

function getSearchItemList(set) {
	var pageNum = $("#pageNum").val();
	var pagePerCnt = $("#pagePerCnt").val();
	var store_category = $("#store_category").val();
	var searchKeyword = $("#searchKeyword").val();
	
	$("#moreCall").remove();
	$(".loading").show();
	$.ajax({
		type:"post",
		url : "/Ajax/itemSearchList.do",
		dataType: 'text',
		//dataType: 'json',
		data : { pageNum : pageNum, pagePerCnt: pagePerCnt, store_category : store_category, searchKeyword : searchKeyword },
		async: true,
		success: function(res) {
			//res = $.trim(res);
			//res = res.replace(/\n/g,"");
			//res = res.replace(/\r/g,"");
			$("#pageNum").val(parseInt(pageNum)+1);
			$("#itemSearchResult").append(res);
			$(".loading").hide();
		}
	});
}

//주문페이지
function display_set_type1() {	// 관광/체험용
	var store_category = $.trim($("#store_category").val());
	var opt_res = "";
	var res_cnt = 0;
	var opt_seq = "";
	var opt_nm = "";
	var opt_price = "";
	var opt_cnt = "";
	for(i=0; i<$(".order_order_price").length; i++) {
		if($(".order_order_price").eq(i).val() > 0) {
			res_cnt++;
			if(res_cnt > 1) {
				opt_res += "<br>";
			}
			opt_res +=  $(".order_nm").eq(i).val()+ " : ";
			opt_res +=  number_format($(".order_order_price").eq(i).val())+"원 ";
			if(store_category == "CD002001") {
				opt_res +=  "("+$(".order_cnt").eq(i).val()+"명)";
			} else {
				opt_res +=  "("+$(".order_cnt").eq(i).val()+"개)";
			}
			
			opt_seq += $(".order_seq").eq(i).val()+"|||";
			opt_nm += $(".order_nm").eq(i).val()+"|||";
			opt_price += $(".order_price").eq(i).val()+"|||";
			opt_cnt += $(".order_cnt").eq(i).val()+"|||";
		}
	}
	reserve_date_view();
	var total_price = number_format($("#opt_total_sum_price").val());
	
	$("#display_reserve_data").html(opt_res);
	$("#display_total_price").html(total_price+" <small>원</small>");
	//폼전송을 위한 옵션값 컨트롤
	$("#opt_seq").val(opt_seq);
	$("#opt_nm").val(opt_nm);
	$("#opt_price").val(opt_price);
	$("#opt_cnt").val(opt_cnt);
	
}


function reserve_date_view() {
	var store_category = $.trim($("#store_category").val());
	if(store_category == "CD002002") {
		var reserve_st_date = $("#reserve_st_dt").val();
		var date_arr = reserve_st_date.split("-");
		var str = "입실 : " + date_arr[0]+"년 " + date_arr[1]+"월 " + date_arr[2]+"일";
		var reserve_ed_date = $("#reserve_ed_dt").val();
		var date2_arr = reserve_ed_date.split("-");
		str += "<br>퇴실 : " + date2_arr[0]+"년 " + date2_arr[1]+"월 " + date2_arr[2]+"일";
	}
	else if(store_category == "CD002003") {
		var reserve_st_date = $("#reserve_st_dt").val();
		if(!reserve_st_date) {
			//alert("예약일을 설정해 주세요.");
			$("#reserve_st_dt").focus();
			return false;
		} else {
			var date_arr = reserve_st_date.split("-");
			var str = date_arr[0]+"년 " + date_arr[1]+"월 " + date_arr[2]+"일";
			var reserve_time = $("#reserve_time").val();
			if(reserve_time.length>0) {
				var time_arr = reserve_time.split(":");
				str += " "+time_arr[0]+"시 " + time_arr[1]+"분";
			}
		}
	} else {
		var reserve_st_date = $("#reserve_st_dt").val();
		var date_arr = reserve_st_date.split("-");
		var str = date_arr[0]+"년 " + date_arr[1]+"월 " + date_arr[2]+"일";
	}
	$("#display_reserve_date").html(str);
}
//이 함수는 숙박에서만 사용함.
function opt_control(id) {
	var store_category = $.trim($("#store_category").val());
	var spare_human = $("#spare_human").val();
	var sleepdt = $("#sleepdt").val();
	var sleepdt_normal_noraml = $("#sleepdt_normal_noraml").val();
	var sleepdt_normal_holiday = $("#sleepdt_normal_holiday").val();
	var sleepdt_ready_noraml = $("#sleepdt_ready_noraml").val();
	var sleepdt_ready_holiday = $("#sleepdt_ready_holiday").val();
	var sleepdt_busy_noraml = $("#sleepdt_busy_noraml").val();
	var sleepdt_busy_holiday = $("#sleepdt_busy_holiday").val();

	var opt_res = "";
	var res_cnt = 0;
	var opt_seq = "";
	var opt_nm = "";
	var opt_price = "";
	var opt_cnt = "";
	
	if(spare_human > 0) {
		var opt_adult_price = $.trim($("#opt_adult_price").val());
		var opt_add_adult = $.trim($("#opt_add_adult").val());
		var opt_young_price = $.trim($("#opt_young_price").val());
		var opt_add_young = $.trim($("#opt_add_young").val());
		
		//숙박일을 환산한다.
		var new_adult_price = opt_adult_price*sleepdt;
		var new_young_price = opt_young_price*sleepdt;
		$("#opt_adult_order_price").val(new_adult_price);
		$("#opt_young_order_price").val(new_young_price);
		
		var total_human = parseInt(opt_add_adult) + parseInt(opt_add_young);
		if(total_human > spare_human) {
			alert("마지막 선택값으로 최대인원 "+spare_human+"명을 초과하였습니다.\n마지막값을 재설정 하세요.");
			$("#opt_add_"+id).val(0);
			if(id == "adult") { $("#opt_adult_order_price").val("0"); }
			if(id == "young") { $("#opt_young_order_price").val("0"); }
			//값 재호출한다.
			opt_add_adult = $.trim($("#opt_add_adult").val());
			opt_add_young = $.trim($("#opt_add_young").val());
		}
		
		if(opt_add_adult > 0) {
			opt_res += "인원추가 - 성인: "+number_format(new_adult_price*opt_add_adult)+"원 ("+opt_add_adult+"명)<br>";
			opt_seq += "Adult|||";
			opt_nm += "인원추가 - 성인|||";
			opt_price += new_adult_price+"|||";
			opt_cnt += opt_add_adult+"|||";
			$("#opt_adult_order_price").val(new_adult_price*opt_add_adult);
		} else {
			$("#opt_add_adult").val("0");
			$("#opt_adult_order_price").val("0");
		}
		if(opt_add_young > 0) {
			opt_res += "인원추가 - 아동: "+number_format(new_young_price*opt_add_young)+"원 ("+opt_add_young+"명)<br>";
			opt_seq += "Young|||";
			opt_nm += "인원추가 - 아동|||";
			opt_price += new_young_price+"|||";
			opt_cnt += opt_add_young+"|||";
			$("#opt_young_order_price").val(new_young_price*opt_add_young);
		} else {
			$("#opt_add_young").val("0");
			$("#opt_young_order_price").val("0");
		}
	} else {
		$("#opt_add_adult").val("0");
		$("#opt_add_young").val("0");
		$("#opt_adult_order_price").val("0");
		$("#opt_young_order_price").val("0");
	}
	
	//이제 인풋에 채우고, 화면에 뿌린다. == 다른 폼의 display_set_type1, reserve_date_view 역할임
	//인원은 input에 강제로 삽입하고, 타 프로그램에서 체크한다.
	for(i=0; i<$(".order_order_price").length; i++) {
		if($(".order_order_price").eq(i).val() > 0) {
			res_cnt++;
			if(res_cnt > 1) {
				opt_res += "<br>";
			}
			opt_res +=  $(".order_nm").eq(i).val()+ " : ";
			opt_res +=  number_format($(".order_order_price").eq(i).val())+"원 ";
			//opt_res +=  "("+$(".order_cnt").eq(i).val()+"명)";
			
			opt_seq += $(".order_seq").eq(i).val()+"|||";
			opt_nm += $(".order_nm").eq(i).val()+"|||";
			opt_price += $(".order_price").eq(i).val()+"|||";
			opt_cnt += $(".order_cnt").eq(i).val()+"|||";
		}
	}
	
	var prod_price = $("#prod_price").val();
	var adult_price = $("#opt_adult_order_price").val();
	var young_price = $("#opt_young_order_price").val();
	
	var new_total_price = parseInt(prod_price) + parseInt(adult_price) + parseInt(young_price);
	for(i=0; i<$(".order_order_price").length; i++) {
		new_total_price += parseInt($(".order_order_price").eq(i).val());
	}
	
	$("#opt_total_sum_price").val(new_total_price);
	$("#display_reserve_data").html(opt_res);
	$("#display_total_price").html(number_format(new_total_price)+" <small>원</small>");
	//폼전송을 위한 옵션값 컨트롤
	$("#opt_seq").val(opt_seq);
	$("#opt_nm").val(opt_nm);
	$("#opt_price").val(opt_price);
	$("#opt_cnt").val(opt_cnt);

}

function plus_cnt(obj) {
	var store_category = $.trim($("#store_category").val());
	if(store_category == "CD002001" || store_category == "CD002003") {
		if(!$("#reserve_st_dt").val()) {
			alert("예약일을 먼저 설정해 주세요");
			$("#reserve_st_dt").focus();
			return false;
		}
	}
	if(store_category == "CD002003") {
		if(!$("#reserve_time").val()) {
			alert('예약시간을 선택해 주세요');
			$("#reserve_time").focus();
			return false;
		}
	}
	
	var opt_price = $("#opt_price_"+obj).val();
	var prev_cnt = $("#order_cnt_"+obj).val();
	var new_cnt = parseInt(prev_cnt)+1;
	var order_price = opt_price * new_cnt;
	$("#order_cnt_"+obj).val(new_cnt);
	$("#opt_order_price_"+obj).val(order_price);
	if(store_category != "CD002002") {
		total_price();
	} else {
		opt_control(obj);
	}
}
function minus_cnt(obj) {
	var store_category = $.trim($("#store_category").val());
	if(store_category == "CD002001" || store_category == "CD002003") {
		if(!$("#reserve_st_dt").val()) {
			alert("예약일을 먼저 설정해 주세요");
			$("#reserve_st_dt").focus();
			return false;
		}
	}
	if(store_category == "CD002003") {
		if(!$("#reserve_time").val()) {
			alert('예약시간을 선택해 주세요');
			$("#reserve_time").focus();
			return false;
		}
	}
		
	var opt_price = $("#opt_price_"+obj).val();
	var prev_cnt = $("#order_cnt_"+obj).val();
	var new_cnt = 0;
	if(prev_cnt > 0) {
		var new_cnt = parseInt(prev_cnt)-1;
		var order_price = opt_price * new_cnt;
		$("#order_cnt_"+obj).val(new_cnt);
		$("#opt_order_price_"+obj).val(order_price);
		if(store_category != "CD002002") {
			total_price();
		} else {
			opt_control(obj);
		}
	}
}
function total_price() {
	var prod_price = $("#prod_price").val();
	var new_total_price = parseInt(prod_price) + 0;
	for(i=0; i<$(".order_order_price").length; i++) {
		new_total_price += parseInt($(".order_order_price").eq(i).val());
	}
	$("#opt_total_sum_price").val(new_total_price);
}
// 장터용
function sel_opt(obj) {
	var opt_seq = $("#opt_seq").val();
	var sel_opt_nm = $("#opt_nm_"+obj).val();
	var sel_opt_price = $("#opt_price_"+obj).val();
	var sel_opt_order_price = $("#opt_order_price_"+obj).val();
	var sel_opt_order_cnt = $("#opt_order_cnt_"+obj).val();
	
	var is_opt = 0;
	var seq_arr = opt_seq.split("|||");
	if(seq_arr.length > 1) {
		for(i=0; i<seq_arr.length; i++) {
			if(seq_arr[i] == obj) {
				is_opt++;
				break;
			}
		}
	}
	if(is_opt>0) {
		var new_cnt = parseInt($("#opt_cnt_str_"+obj).val())+1;
		$("#opt_order_price_"+obj).val(sel_opt_price*new_cnt);
		$("#opt_order_cnt_"+obj).val(new_cnt);
		$("#opt_cnt_str_"+obj).val(new_cnt);
		$("#str_opt_price_"+obj).html(number_format(sel_opt_price*new_cnt)+"<small>원</small>");
		market_total_price();
	} else {
	
		var sel_opt_cnt = 1;
		$("#opt_order_price_"+obj).val(sel_opt_price*sel_opt_cnt);
		
		shtml = "<li><div class=\"oc_con\" id=\"opt_"+obj+"\">"
		shtml += "<h4>"+sel_opt_nm+"</h4>"
		shtml += "<div class=\"opt_count floats\">"
		shtml += "<label class=\"sound_only\">수량</label>"
		shtml += "<div class=\"count\">"
		shtml += "<button type=\"button\" onclick=\"option_plus('"+obj+"')\"><i class=\"xi-plus\"></i></button>"
		shtml += "<input type=\"text\" id=\"opt_cnt_str_"+obj+"\" value=\""+sel_opt_cnt+"\" class=\"num_input \" size=\"5\" />"
		shtml += "<button type=\"button\"  onclick=\"option_minus('"+obj+"')\"><i class=\"xi-minus\"></i></button></div>"
		shtml += "<span class=\"opt_price\" id=\"str_opt_price_"+obj+"\">"+number_format(sel_opt_price)+"<small>원</small></span>"
		shtml += "</div>"
		shtml += "<a href=\"javascript:option_del('"+obj+"');\" class=\"optiondel\"><i class=\"far fa-times\"></i></a>"
		shtml += "</div></li>";
		
		$("#optList").append(shtml);
		
	}
	market_total_price();
	$("#item_sel").val("");	

}
function option_plus(obj) {
	prev_cnt = $("#opt_cnt_str_"+obj).val();
	new_cnt = parseInt(prev_cnt)+1;
	
	var sel_opt_nm = $("#opt_nm_"+obj).val();
	var sel_opt_price = $("#opt_price_"+obj).val();
	var sel_opt_order_price = $("#opt_order_price_"+obj).val();
	var sel_opt_order_cnt = $("#opt_order_cnt_"+obj).val();
	
	$("#opt_order_price_"+obj).val(sel_opt_price*new_cnt);
	$("#opt_order_cnt_"+obj).val(new_cnt);
	$("#opt_cnt_str_"+obj).val(new_cnt);
	$("#str_opt_price_"+obj).html(number_format(sel_opt_price*new_cnt)+"<small>원</small>");
	market_total_price();
}
function option_minus(obj) {
	prev_cnt = $("#opt_cnt_str_"+obj).val();
	new_cnt = parseInt(prev_cnt)-1;
	if(new_cnt > 0) {
		var sel_opt_nm = $("#opt_nm_"+obj).val();
		var sel_opt_price = $("#opt_price_"+obj).val();
		var sel_opt_order_price = $("#opt_order_price_"+obj).val();
		var sel_opt_order_cnt = $("#opt_order_cnt_"+obj).val();
		
		$("#opt_order_price_"+obj).val(sel_opt_price*new_cnt);
		$("#opt_order_cnt_"+obj).val(new_cnt);
		$("#opt_cnt_str_"+obj).val(new_cnt);
		$("#str_opt_price_"+obj).html(number_format(sel_opt_price*new_cnt)+"<small>원</small>");
		market_total_price();
	}
}
function option_del(obj) {
	$("#opt_"+obj).remove();
	$("#opt_order_cnt_"+obj).val(1);
	$("#opt_order_price_"+obj).val(0);
	market_total_price();
}
function market_total_price(){
	var sum_total = 0;
	var val_opt_seq = "";
	var val_opt_nm = "";
	var val_opt_order_price = "";
	var val_opt_cnt = "";

	for(i=0; i<$(".order_order_price").length; i++) {
		if($(".order_order_price").eq(i).val()>0) {
			sum_total += parseInt($(".order_order_price").eq(i).val());
			val_opt_seq += $(".order_seq").eq(i).val()+"|||";
			val_opt_nm += $(".order_nm").eq(i).val()+"|||";
			val_opt_order_price += $(".order_price").eq(i).val()+"|||";
			val_opt_cnt += $(".order_cnt").eq(i).val()+"|||";
		}
	}
	
	$("#opt_seq").val(val_opt_seq);
	$("#opt_nm").val(val_opt_nm);
	$("#opt_price").val(val_opt_order_price);
	$("#opt_cnt").val(val_opt_cnt);
	
	$("#opt_total_sum_price").val(sum_total);
	$("#total_price").html(number_format(sum_total));
}


//장바구니 넣기
function cart_add(act) {
	var min_price = parseInt($("#prod_min_price").val());
	var set_price = parseInt($("#opt_total_sum_price").val());
	var store_category = $.trim($("#store_category").val());
	var store_id = $.trim($("#store_id").val());
	var store_nm = $.trim($("#store_nm").val());
	var prod_category = $.trim($("#prod_category").val());
	var prod_id = $.trim($("#prod_id").val());
	var prod_nm = $.trim($("#prod_nm").val());
	var prod_price = $.trim($("#prod_price").val());
	var prod_opt_seqs = $.trim($("#opt_seq").val());
	var prod_opt_nms = $.trim($("#opt_nm").val());
	var prod_opt_prices = $.trim($("#opt_price").val());
	var prod_opt_cnts = $.trim($("#opt_cnt").val());
	var total_price = $.trim($("#opt_total_sum_price").val());
	var prod_room_seq = $.trim($("#prod_room_seq").val());
	var reserve_st_dt = $.trim($("#reserve_st_dt").val());
	var reserve_ed_dt = $.trim($("#reserve_ed_dt").val());
	var reserve_time = $.trim($("#reserve_time").val());
	var reserve_user_nm = $.trim($("#reserve_user_name").val());
	var reserve_user_call = $.trim($("#reserve_user_call").val());
	// 필수체크
	if(store_category == "CD002001" || store_category == "CD002003") {
		if(!reserve_st_dt) {
			alert('예약일을 선택하세요.');
			$("#reserve_st_dt").focus();
			return false;
		}
		if(min_price > 0 && total_price < min_price) {
			alert('최소주문금액 '+number_format(min_price)+'원이상 주문하셔야 합니다.');
			return false;
		}
	}
	if(store_category == "CD002002") {
		if(!reserve_st_dt) {
			alert('입실일을 선택하세요.');
			$("#reserve_st_dt").focus();
			return false;
		}
		if(!reserve_ed_dt) {
			alert('퇴실시간을 선택하세요.');
			$("#reserve_ed_dt").focus();
			return false;
		}
	}
	if(store_category == "CD002003") {
		if(!reserve_time) {
			alert('예약시간을 선택하세요.');
			$("#reserve_time").focus();
			return false;
		}
	}
	if(set_price < 1) {
		alert('상품을 선택하세요.');
		return false;
	}
	if(store_category != "CD002004") {
		if(!reserve_user_nm) {
			alert('예약자명을 입력하세요.');
			$("#reserve_user_name").focus();
			return false;
		}
		if(!reserve_user_call) {
			alert('예약자의 연락처를 입력하세요.');
			$("#reserve_user_call").focus();
			return false;
		}
	}
	$(".loading").show();
	
	$.ajax({
		type:"post",
		url : "/Ajax/cartSave.do",
		dataType: 'text',
		//dataType: 'json',
		data : { store_category : store_category, store_id: store_id, store_nm: store_nm, prod_category : prod_category,
				prod_id : prod_id, prod_nm : prod_nm, prod_price : prod_price,
				prod_opt_seqs : prod_opt_seqs, prod_opt_nms : prod_opt_nms, prod_opt_prices : prod_opt_prices, prod_opt_cnts : prod_opt_cnts,
				total_price : total_price, prod_room_seq : prod_room_seq,  
				reserve_st_dt : reserve_st_dt, reserve_ed_dt : reserve_ed_dt, reserve_time : reserve_time,
				reserve_user_nm : reserve_user_nm, reserve_user_call : reserve_user_call	},
		async: true,
		success: function(res) {
			res = $.trim(res);
			res = res.replace(/\n/g,"");
			res = res.replace(/\r/g,"");
			$(".loading").hide();
			switch(res) {
				case "AN" :
					alert("회원로그인이 필요합니다.");
					break;
				case "Y" :
					if(act == "cart") {
						if(confirm("장바구니에 담았습니다.\n장바구니로 이동하시겠습니까?")) {
							location.href = "/shop/cart.do";
						}
					}
					else if(act == "order") {
						location.href = "/shop/cart.do";
					}
					break;
				case "F" :
					alert("장바구니 담기에 실패하였습니다.\n\n잠시 후 다시 시도해 주시거나, 관리자에게 문의바랍니다.");
					break;
			}
			
		}
	});
	
}

//장바구니
function allcheck(obj) {
	if($(".allcheck_"+obj).prop("checked") == true) {
		$(".check_"+obj).prop("checked", true);
		if(obj == 4) {
			$("#addr_list").show();
			$("#addr_zip").show();
			$("#addr_addr1").show();
			$("#addr_addr2").show();
			$("#addr_addr3").show();
			$("#order_meg").show();
			$("#is_cate4").val("1");
		}
	} else {
		$(".check_"+obj).prop("checked", false);
		if(obj == 4) {
			$("#addr_list").hide().val('');
			$("#addr_zip").hide();
			$("#addr_addr1").hide();
			$("#addr_addr2").hide();
			$("#addr_addr3").hide();
			$("#order_meg").hide();
			$("#is_cate4").val("0");
		}
	}
	set_delivery_price();
	resetPrice();	
}
function check_all_btn(obj) {
	var cnt = $(".check_"+obj).length;
	var is_not_check = 0;
	var all_check = true;
	for(i=0; i<cnt; i++) {
		if($(".check_"+obj).eq(i).prop("checked") == false) {
			all_check = false;
			is_not_check++;
		}
	}
	if(all_check == false) {
		$(".allcheck_"+obj).prop("checked", false);
	} else {
		$(".allcheck_"+obj).prop("checked", true);
	}
	if(obj == 4) {
		if( (parseInt(cnt)-parseInt(is_not_check)) == 0) {
			$("#is_cate4").val(0);
			$("#addr_list").hide();
			$("#addr_zip").hide();
			$("#addr_addr1").hide();
			$("#addr_addr2").hide();
			$("#addr_addr3").hide();
			$("#order_meg").hide();
			$("#is_cate4").val("0");
		} else {
			$("#is_cate4").val(1);
			$("#addr_list").show();
			$("#addr_zip").show();
			$("#addr_addr1").show();
			$("#addr_addr2").show();
			$("#addr_addr3").show();
			$("#order_meg").show();
			$("#is_cate4").val("1");
		}
	}
	
	//금액조정함수 호출
	set_delivery_price();
	resetPrice();
}

function resetPrice() {
	var all_total_price = $("#all_total_price").val();
	var reset_total_price = 0;
	var coupon_sale_price = $("#coupon_sale_price").val();
	var delivery_price = $("#delivery_price").val();
	if(!coupon_sale_price) {
		coupon_sale_price = 0;
	}
	var reset_cate_price = new Array();
	reset_cate_price[1] = 0;
	reset_cate_price[2] = 0;
	reset_cate_price[3] = 0;
	reset_cate_price[4] = 0;
	
	for(k=1; k<=4; k++) {
		for(i=0; i<$(".check_"+k).length; i++) {
			if($(".check_"+k).eq(i).prop("checked") == true) {
				reset_cate_price[k] += parseInt($(".price_"+k).eq(i).val());
				reset_total_price += parseInt($(".price_"+k).eq(i).val());
			}
		}
		$("#category_"+k+"_total_price_str").html(number_format(reset_cate_price[k]));
	}
	var org_reset_total_price = reset_total_price;
	reset_total_price = parseInt(reset_total_price) + parseInt(delivery_price) - parseInt(coupon_sale_price);
	$("#all_total_price").val(reset_total_price);
	$("#all_total_price_org_str").html(number_format(org_reset_total_price)+" <small>원</small>");
	$("#all_total_price_str").html(number_format(reset_total_price));
}

function check_del(obj) {
	var category_cnt = $(".check_"+obj).length;
	var del_seq_set = "";
	var del_cnt = 0;
	for(i=0; i<category_cnt; i++) {
		if($(".check_"+obj).eq(i).prop("checked") == true) {
			var seq = $(".seq_"+obj).eq(i).val();
			del_seq_set += seq+",";
			del_cnt++;
			
		}
	}
	var cate_nm_str = "";
	var articel_str = "";
	switch(obj) {
		case '1' :
				cate_nm_str = "관광/체험";
				store_category = "CD002001";
				var articel_str = "travelcart";				
				break;
		case '2' :
				cate_nm_str = "숙박";
				store_category = "CD002002";
				var articel_str = "roomcart";				
				break;
		case '3' :
				cate_nm_str = "맛집";
				store_category = "CD002003";
				var articel_str = "foodcart";				
				break;
		case '4' :
				cate_nm_str = "서천장터";
				store_category = "CD002004";
				var articel_str = "marketcart";				
				break;
	}
	
	if(category_cnt > 0 && del_cnt == 0) {
		alert("["+cate_nm_str+"]에서 삭제할 상품을 선택하세요");
		return false;
	} else {
		if(category_cnt == del_cnt) {
			if(confirm("["+cate_nm_str+"] 의 모든 상품을 취소하시겠습니까?")) {
				$.ajax({
					type:"post",
					url : "/Ajax/cartCateDel.do",
					dataType: 'text',
					//dataType: 'json',
					data : { store_category : store_category},
					async: true,
					success: function(res) {
						res = $.trim(res);
						res = res.replace(/\n/g,"");
						res = res.replace(/\r/g,"");
						$(".loading").hide();
						switch(res) {
							case "AN" :
								alert("회원로그인이 필요합니다.");
								break;
							case "Y" :
								/*
								$("."+articel_str).remove();
								if(store_category == "CD002004") {
									$("#addr_zip").hide();
									$("#addr_addr1").hide();
									$("#addr_addr2").hide();
									$("#order_meg").hide();
									$("#is_cate4").val("0");
								}
								resetPrice();
								*/	
								alert("삭제되었습니다");
								location.reload();
								break;
							case "F" :
								alert("삭제를 실패하였습니다.");
								break;
						}
						
					}
				});
			}
		} else {
			if(confirm("["+cate_nm_str+"] 의  선택된 상품을 취소하시겠습니까?")) {
				$.ajax({
					type:"post",
					url : "/Ajax/cartItemDel.do",
					dataType: 'text',
					//dataType: 'json',
					data : { del_item : del_seq_set},
					async: true,
					success: function(res) {
						res = $.trim(res);
						res = res.replace(/\n/g,"");
						res = res.replace(/\r/g,"");
						$(".loading").hide();
						switch(res) {
							case "AN" :
								alert("회원로그인이 필요합니다.");
								break;
							case "Y" :
								/*
								del_arr = del_seq_set.split(",");
								for(i=0; i<del_arr.length; i++) {
									if(del_arr[i].length>0) {
										$("#tr_"+del_arr[i]).remove();
										
									}
								}
								resetPrice();
								*/	
								alert("삭제되었습니다");
								location.reload();
								break;
							case "F" :
								alert("삭제를 실패하였습니다.");
								break;
						}
						
					}
				});
			}
		}
	}
	
}

function cartCheck() {
	var is_order = $("#is_order").val();
	if(is_order == "Y") {
		alert("이미 주문프로세서가 진행중입니다.");
		return false;
	}
	
	var orderpay = $("#all_total_price").val();
	if(parseInt(orderpay) < 1) {
		alert("결재할 상품이 없거나, 선택되지 않았습니다.");
		return false;
	}
	//빈값 체크
	if($("#order_user_nm").val() != undefined) {
		if(!$.trim($("#order_user_nm").val())) {
			alert("주문자명을 입력하세요.");
			$("#order_user_nm").focus();
			return false;
		}
	}
	if($("#order_user_hp").val() != undefined) {
		if(!$.trim($("#order_user_hp").val())) {
			alert("연락처1을 입력하세요.");
			$("#order_user_hp").focus();
			return false;
		}
	}
	if($("#order_user_email").val() != undefined) {
		if(!$.trim($("#order_user_email").val())) {
			alert("이메일주소를 입력하세요.");
			$("#order_user_email").focus();
			return false;
		}
	}
	if($("#is_cate4").val() == "1") {
		if($("#order_user_zip").val() != undefined) {
			if(!$.trim($("#order_user_zip").val())) {
				alert("우편번호 찾기를 통해 주소를 입력하세요.");
				$("#order_user_zip").focus();
				return false;
			}
		}
		if($("#order_user_addr2").val() != undefined) {
			if(!$.trim($("#order_user_addr2").val())) {
				alert("상세주소를  입력하세요.");
				$("#order_user_addr2").focus();
				return false;
			}
		}
		if($("#addr_save").prop("checked") == true && !$.trim($("#addr_nm").val())) {
			alert("주소록명칭을  입력하세요.");
			$("#addr_nm").focus();
			return false;
		}
	}
	if($("#order_user_pay").val() == "virtual") {
		if(!$("#order_time").val()) {
			alert("가상계좌주문시, 입금시간을 예약하셔야 합니다.\n예약시간내 미입금시 주문은 자동으로 취소됩니다.");
			return false;
		}
	}
	$("#is_order").val("Y");

}

function orderPayment() {
	var product_info = $("#product_info").val();
	$("#LGD_PRODUCTINFO").val(product_info);
	//var payType = $("#order_user_pay").find(":selected").val();
	var payType = $("#forder_paytype2").val();
	var pgcode = "";
	switch(payType) {
		case "card" : payStr = "신용카드"; pgcode ="SC0010"; break;
		case "realbank" : payStr = "실시간 계좌이체"; pgcode ="SC0030"; break;
		case "virtual" : payStr = "가상계좌"; pgcode ="SC0040"; break;
		case "bank" : payStr = "무통장입금"; pgcode =""; break;
	}
	var orderpay = $("#all_total_price").val();
	if(parseInt(orderpay) < 1) {
		alert("결재할 상품이 없거나, 선택되지 않았습니다.");
		return false;
	}
	if($("#agree").prop("checked") == false) {
		alert("구매조건 확인 및 결제진행동의에 동의를 체크하셔야 합니다.");
		$("#agree").focus();
		return false;
	}	
	if(confirm("총금액 ["+number_format(orderpay)+"]원을 ["+payStr+"](으)로 결제하시겠습니까?")) {
		//$(".loading").show();
		
		$("#LGD_CUSTOM_USABLEPAY").val(pgcode);	//PC용
		$("#LGD_CUSTOM_FIRSTPAY").val(pgcode);	//모바일용
		if($("#order_user_pay").val() == "bank") {
			$("#payform").attr("action","/shop/orderSave.do").submit();
		} else {
			launchCrossPlatform();
		}
	}
}

function coupon_calc(obj) {
	//if(confirm("쿠폰설정을 적용하시겠습니까?")) {
		var total_price = $("#all_total_price").val();
		var sale_store_category = $("#coupon_store_category_"+obj).val();
		var sale_price = $("#coupon_price_"+obj).val();
		if(sale_price > 0) {
			if($("#coupon_type_"+obj).val() == "W") {
				//원
				$("#coupon_sale_price").val(sale_price);
			}
			if($("#coupon_type_"+obj).val() == "P") {
				//퍼센트
				if(!sale_store_category) { //전체금액적용
					var sale_price = Math.floor(total_price*sale_price)/100;
					$("#coupon_sale_price").val(sale_price);
				}
				else {
					var cate_price = 0;
					if(sale_store_category == "CD002001") {
						for(i=0; i<$(".check_1").length; i++) {
							if($(".check_1").eq(i).prop("checked") == true) {
								cate_price += parseInt($(".price_1").eq(i).val());
							}
						}
					}
					if(sale_store_category == "CD002002") {
						for(i=0; i<$(".check_2").length; i++) {
							if($(".check_2").eq(i).prop("checked") == true) {
								cate_price += parseInt($(".price_2").eq(i).val());
							}
						}
					}
					if(sale_store_category == "CD002003") {
						for(i=0; i<$(".check_3").length; i++) {
							if($(".check_3").eq(i).prop("checked") == true) {
								cate_price += parseInt($(".price_3").eq(i).val());
							}
						}
					}
					if(sale_store_category == "CD002004") {
						for(i=0; i<$(".check_4").length; i++) {
							if($(".check_4").eq(i).prop("checked") == true) {
								cate_price += parseInt($(".price_4").eq(i).val());
							}
						}
					}
					if(cate_price == 0) {
						alert("쿠폰적용대상이 없습니다.\n\n해당커테고리 상품을 선택하지 않았거나, 카테고리에 상품이 존재하지 않습니다.");
						$("#order_user_coupon").val("");
						return false;
					}
					var sale_price = Math.floor(cate_price*sale_price)/100;
					$("#coupon_sale_price").val(sale_price);
				}
			}
			$("#coupon_sale_str").html("- "+number_format(sale_price)+" <small>원</small>");
		} else {
			$("#coupon_sale_price").val(0);
			$("#coupon_sale_str").html("").hide();
		}
		set_delivery_price();
		resetPrice();
	//}
}
function set_pay_type(obj) {
	if(obj == "virtual") {
		$("#order_time").val("");
		$("#pay_time").show();
		$("#order_card_info").hide();
	} else {
		if(obj == "card") {
			$("#order_card_info").show();
		} else {
			$("#order_card_info").hide();
		}
		$("#pay_time").hide();
		$("#order_time").val("");
	}
}
function save_use_mart(obj, store_category) {
	var pimg = "<img src=\"/cmm/fms/getImage.do?atchFileId="+$("#prod_img_"+obj).val()+"&fileSn=0\" onerror=\"this.src='/images/baseScmtour/_noImage.png';\"/>";
	var pdate = $("#prod_date_"+obj).html();
	var popt = $("#prod_opt_"+obj).html();
	var pprice = $("#prod_price_"+obj).html();
	switch(store_category) {
		case "CD002001" : opt_name = "예약인원"; break;
		case "CD002002" : opt_name = "숙박정보"; break;
		case "CD002003" : opt_name = "메뉴예약"; break;
	}
	$("#view_img").html(pimg);
	$("#view_title").html($("#prod_nm_"+obj).val()+" 사용확인");
	$("#view_title_sub").html($("#prod_nm_"+obj).val());
	$("#view_comment").html($("#prod_comment_"+obj).val());
	$("#view_opt").html(popt);
	$("#view_price").html(pprice);
	$("#view_opt_nm").html(opt_name);
	$("#view_date").html(pdate);
	$("#user_seq").val(obj);
	$("#reservInfo").modal("show");
}
function payinfo(order_id) {
	var price = $("#order_price_"+order_id).val();
	var deli_price = $("#delivery_price_"+order_id).val();
	var coupon_price = $("#coupon_price_"+order_id).val();
	var mileage_price = $("#mileage_"+order_id).val();
	var bank_nm = $("#bank_nm_"+order_id).val();
	var bank_number = $("#bank_number_"+order_id).val();
	var bank_user = $("#bank_user_"+order_id).val();
	var deli = $("#delivery_price_"+order_id).val();
	var prod_price = parseInt(price) + parseInt(coupon_price) + parseInt(mileage_price) - parseInt(deli_price);
	
	$("#view_title").html("입금안내 - "+order_id);
	
	$("#view_prod_price").html(number_format(prod_price)+" 원");
	//$("#view_bank_info").html(bank_nm + " " + bank_number +" "+ bank_user);
	$("#view_bank_info1").html(bank_nm);
	$("#view_bank_info2").html(bank_number);
	$("#view_bank_info3").html(bank_user);
	$("#view_deli").html(number_format(deli_price)+" 원");
	$("#view_coupon").html(" - "+number_format(coupon_price)+" 원");
	$("#view_price").html(number_format(price)+" 원");
	$("#reservInfo").modal("show");
}
function prod_use() {
	$(".loading").show();
	var od_seq = $("#user_seq").val();
	if(od_seq) {
		if(confirm("사용확인을 하면 되돌릴 수 없습니다.\n\n정말 사용중으로 처리하시겠습니까?")) {
			$.ajax({
				type:"post",
				url : "/Ajax/orderUseSave.do",
				dataType: 'text',
				//dataType: 'json',
				data : { od_seq : od_seq},
				async: true,
				success: function(res) {
					res = $.trim(res);
					res = res.replace(/\n/g,"");
					res = res.replace(/\r/g,"");
					switch(res) {
						case "AN" : alert("로그인상태가 아닙니다.\n\n로그인 후, 다시 시도해 주세요."); break;
						case "S" : alert("처리되었습니다"); location.reload(); break;
						case "A" : alert("이미 처리된 상태입니다."); $("#reservInfo").modal("hide"); break;
						case "N" : alert("주문자 본인만 처리가 가능합니다."); $("#reservInfo").modal("hide"); break;
						case "F" : alert("사용확인 처리가 실패하였습니다.\n\n잠시 후 다시 시도해 주세요."); break;
					}
					alert("처리되었습니다");
					location.reload();
				}
			});
		}
	}
}


function set_delivery_price() {
	var is_cate4 = $("#is_cate4").val();

	if(is_cate4 > 0) {
		var str = "";
		var plus = "";
		var base = "def";
		var addr = $("#order_user_addr1").val();
		if(addr.indexOf("제주") != -1) { base = "jeju"; }
		else { base = "def"; }
		$(".d_store_base").val(base);
		$(".d_store_order").val(0);
		$(".d_store_delivery").val(0);
		
		//스토어별 주문금액 합계를 구한다.
		for(i=0; i<$(".check_4").length; i++) {
			if($(".check_4").eq(i).prop("checked") == true) {
				var store_id = $(".cart_store_id_4").eq(i).val();
				var order_price = $("#store_order_"+store_id).val();
				$("#store_order_"+store_id).val(parseInt(order_price) + parseInt($(".price_4").eq(i).val()));
			}
		}
		
		//스토어별 루프를 돌며, 배송비를 체크한다.
		var total_delivery_price = 0;
		for(i=0; i<$(".d_store_id").length; i++) {
			var def_price = $(".d_store_def").eq(i).val();
			var free_price = $(".d_store_free").eq(i).val();
			var jeju_price = $(".d_store_jeju").eq(i).val();
			var order_price = $(".d_store_order").eq(i).val();
			if(order_price > 0) {
				if(parseInt(order_price) >= parseInt(free_price)) {
					delivery_price = 0;
				} else {
					if(base == "jeju") {
						delivery_price = jeju_price;
					} else {
						delivery_price = def_price;
					}
				}
			} else {
				delivery_price = 0;
			}
			$(".d_store_delivery").eq(i).val(delivery_price);
			if(i == 0) { plus = ""; }
			else { plus = "<br>"; }
			if(parseInt(delivery_price) > 0) {
			str += $(".d_store_nm").eq(i).val() + " : " + number_format(delivery_price)+" <small>원</small>"+plus;
			}
			total_delivery_price += parseInt(delivery_price);
		}
		if(base == "jeju") {
			str += "<br>(제주배송비 적용)";
		}
		// 계산을 마쳤으면.. 표시를 해야지..
		$("#delivery_price_group_str").show();
		$("#delivery_price_str").html(str);
		$("#delivery_price").val(total_delivery_price);
	} else {
		$("#delivery_price_group_str").hide();
		$("#delivery_price_str").html("0 <small>원</small>");
		$("#delivery_price").val(0);
	}
	resetPrice();	

}

function go_addr(obj) {
	if(obj) {
		location.href="/member/modify.do?addr_seq="+obj;
	} else {
		location.href="/member/modify.do";
	}
}
function addrForm() {
	var addr_seq = $("#addr_seq").val();
	var action_mode = $("#action_mode").val();
	var addr_nm = $.trim($("#addr_nm").val());
	var addr_zip = $("#addr_zip").val();
	var addr_addr2 = $.trim($("#addr_addr2").val());
	if(action_mode != "delete") {
		if(!addr_nm) { alert("별칭을 입력하세요.\nex)집, 직장 등"); $("#addr_nm").focus(); return false; }
		if(!addr_zip) { alert("주소검색을 통해서 주소를 선택하세요."); form_execDaumPostcode('addr_zip', 'addr_addr1', 'addr_addr2','',''); return false; }
		if(!addr_addr2) { alert("상세주소를 입력하세요"); $("#addr_addr2").focus(); return false; }
	}
}
function set_mode(obj) {
	if(obj == 'd') {
		if(confirm("정말 삭제하시겠습니까?")) {
			$("#action_mode").val("delete");
			$("#addrForm").submit();
		}
	}
}
function widthdrawForm() {
	if(confirm("한번 탈퇴하면, 재가입이 불가능합니다.\n\n정말 탍퇴하시겠습니까?")) {
		var withdraw_reason = $("#withdraw_reason").val();
		if(!withdraw_reason) { alert("탈퇴사유를 선택하여 주세요."); $("#withdraw_reason").focus(); return false; }
		
		if($("#agree_chk1").prop("checked")== false) { alert("필수로 동의하여 주셔야 합니다."); return false; }
		if($("#agree_chk2").prop("checked")== false) { alert("필수로 동의하여 주셔야 합니다."); return false; }
	} else {
		return false;
	}
}
function bbsmtmForm() {
	var subject = $.trim($("#bbs_subject").val());
	var content = $.trim($("#bbs_content").val());
	if(!subject) { alert("제목을 입력하여 주세요."); $("#bbs_subject").focus(); return false; }
	if(!content) { alert("내용을 입력하여 주세요."); $("#bbs_content").focus(); return false; }
}
function set_addr(obj) {
	$("#order_user_zip").val($("#zip_"+obj).val());
	$("#order_user_addr1").val($("#addr1_"+obj).val());
	$("#order_user_addr2").val($("#addr2_"+obj).val());
	$("#addr_save").prop("checked", false);
	$("#addr_nm").val("");
}
function bbs_delete(bbs_id, bbs_seq, pageIndex) {
	if(!bbs_id || !pageIndex || !bbs_seq) { alert('필수값이 없습니다.'); return false; }
	if(confirm("정말 삭제하시겠습니까?")) {
		location.href="/board/delete.do?bd_id="+bbs_id+"&pageIndex="+pageIndex+"&bbs_seq="+bbs_seq;
	}
}

function opt_calc_cnt(calc, opt_seq, opt_price, cart_seq, store_category, store_id) {
	var opt_cnt = $("#opt_cnt_"+opt_seq).val();
	var send_ajax = false;
	//alert('최소 1개이상 주문이어야 합니다.');
	if(calc == "m") {
		var calc_cnt = parseInt(opt_cnt)-1;
		if(calc_cnt == 0) {
			alert('최소 1개이상 주문이어야 합니다.');
		} else {
			send_ajax = true;
			new_calc_price = -opt_price;
		}
	}
	if(calc == "p") {
		var calc_cnt = parseInt(opt_cnt)+1;
		new_calc_price = opt_price;
		send_ajax = true;
	}

	if(send_ajax == true) {
		var min_price = $("#cart_min_price_"+cart_seq).val();
		if(!min_price) { min_price = 0; }
		var prev_total_prod_price = $("#total_price_input_"+cart_seq).val();
		if(parseInt(prev_total_prod_price)+parseInt(new_calc_price) < min_price) {
			alert('최수주문금액' +number_format(min_price)+'원이상 주문하셔야 합니다.' );
			return false;
		}
		
		$("#numberUpDown_"+opt_seq).text(calc_cnt);
		$("#opt_cnt_"+opt_seq).val(calc_cnt);
		
		if(store_category == 'CD002004') {
			$("#store_order_"+store_id).val(parseInt($("#store_order_"+store_id).val())+parseInt(new_calc_price));
		}
		
		$("#total_price_input_"+cart_seq).val(parseInt(prev_total_prod_price)+parseInt(new_calc_price));
		$("#total_price_"+cart_seq).text(number_format(parseInt(prev_total_prod_price)+parseInt(new_calc_price))+ "원");
		$("#cart_price_"+cart_seq).val(parseInt($("#cart_price_"+cart_seq).val())+parseInt(new_calc_price));
		
		//카테고리 총합
		switch(store_category) {
			case "CD002001" :
				var prev_total_cate_price = $("#category_1_total_price_str").text().replace(",","");
				$("#category_1_total_price_str").text(number_format(parseInt(prev_total_cate_price)+parseInt(new_calc_price)));
				break;
			case "CD002002" :
				prev_total_cate_price = $("#category_2_total_price_str").text().replace(",","");
				$("#category_2_total_price_str").text(number_format(parseInt(prev_total_cate_price)+parseInt(new_calc_price)));
				break;
			case "CD002003" :
				prev_total_cate_price = $("#category_3_total_price_str").text().replace(",","");
				$("#category_3_total_price_str").text(number_format(parseInt(prev_total_cate_price)+parseInt(new_calc_price)));
				break;
			case "CD002004" :
				prev_total_cate_price = $("#category_4_total_price_str").text().replace(",","");
				$("#category_4_total_price_str").text(number_format(parseInt(prev_total_cate_price)+parseInt(new_calc_price)));
				break;
		}
		//나머지 연산
		set_delivery_price();
		resetPrice();
		$.ajax({
			type:"post",
			url : "/Ajax/optionUpdate.do",
			dataType: 'text',
			//dataType: 'json',
			data : { cart_seq: cart_seq, opt_seq : opt_seq, opt_cnt: calc_cnt},
			async: true,
			success: function(res) {
				res = $.trim(res);
				res = res.replace(/\n/g,"");
				res = res.replace(/\r/g,"");
				if(res == "AN") {
					getLogin("/shop/cart.do");
				}
			}
		});
		
	}
}

function adultCheck() {
	var w = window.open('/shop/checkPlusMain.do', 'adtCheck','width=100%, height=100%');
	w.focus();
}

function find_member() {
	$("#qna_title").html("회원정보찾기");
	$('#find_memberinfo').modal("show");
}

function find_id_prt() {
	$("#i_user_nm").val("");
	$("#i_user_hp").val("");
	$("#p_user_id").val("");
	$("#p_user_nm").val("");
	$("#p_user_hp").val("");
	$("#result_str").html("");
	$("#idf").removeClass("orangebtn").removeClass("graybtn").addClass("orangebtn");
	$("#pwf").removeClass("orangebtn").removeClass("graybtn").addClass("graybtn");
	$("#doc_id").show();
	$("#doc_pw").hide();
}
function find_pw_prt() {
	$("#i_user_nm").val("");
	$("#i_user_hp").val("");
	$("#p_user_id").val("");
	$("#p_user_nm").val("");
	$("#p_user_hp").val("");
	$("#result_str").html("");
	$("#idf").removeClass("orangebtn").removeClass("graybtn").addClass("graybtn");
	$("#pwf").removeClass("orangebtn").removeClass("graybtn").addClass("orangebtn");
	$("#doc_id").hide();
	$("#doc_pw").show();
}
function search_id() {
	var user_nm = $.trim($("#i_user_nm").val());
	alert(user_nm);
	var user_hp = $.trim($("#i_user_hp").val());
	if(!user_nm) { alert('이름을 입력하세요.'); $("#i_user_nm").focus(); return false; }
	if(!user_hp) { alert('핸드폰 번호를 입력하세요.'); $("#i_user_hp").focus(); return false; }
	$.ajax({
		type:"post",
		url : "/Ajax/idFind.do",
		dataType: 'text',
		//dataType: 'json',
		data : { user_nm: user_nm, user_hp : user_hp},
		async: true,
		success: function(res) {
			$("#result_str").html(res);
		}
	});
}

function search_pw() {
	var user_id = $.trim($("#p_user_id").val());
	var user_nm = $.trim($("#p_user_nm").val());
	var user_hp = $.trim($("#p_user_hp").val());
	if(!user_id) { alert('아이디를 입력하세요.'); $("#p_user_id").focus(); return false; }
	if(!user_nm) { alert('이름을 입력하세요.'); $("#p_user_nm").focus(); return false; }
	if(!user_hp) { alert('핸드폰 번호를 입력하세요.'); $("#p_user_hp").focus(); return false; }
	$.ajax({
		type:"post",
		url : "/Ajax/pwFind.do",
		dataType: 'text',
		//dataType: 'json',
		data : { user_id: user_id, user_nm: user_nm, user_hp : user_hp},
		async: true,
		success: function(res) {
			$("#result_str").html(res);
		}
	});
	
}

function order_cancel(order_id, pageIndex) {
	if(!order_id) {
		alert('선택된 주문이 없습니다.');
		return false;
	}
	if(confirm("주문상태에 따라 일부금액이 공제될 수 있습니다.\n\n정말 주문취소를 요청하시겠습니까?")) {
		return_url = "/mypage/orderDetail.do?order_id="+order_id+"&pageIndex="+pageIndex;
		$.ajax({
			type:"post",
			url : "/shop/orderCancel.do",
			dataType: 'text',
			//dataType: 'json',
			data : { order_id: order_id, cancel_type: "A"},
			async: true,
			success: function(res) {
				if(res == "AN") {
					getLogin(return_url);
				} else {
					locationReplace(return_url);
				}
			}
		});
	}
}
function order_item_cancel(order_id,order_seq, pageIndex) {
	if(!order_seq) {
		alert('선택된 상품이 없습니다.');
		return false;
	}
	if(confirm("주문상태, 예약일, 합계금액에 따라 일부금액이 공제되거나, 배송비등이 추가로 부과될 수 있습니다.\n\n정말 해당상품의 주문취소를 요청하시겠습니까?")) {
		return_url = "/mypage/orderDetail.do?order_id="+order_id+"&pageIndex="+pageIndex;
		$.ajax({
			type:"post",
			url : "/shop/orderCancel.do",
			dataType: 'text',
			//dataType: 'json',
			data : { od_seq: order_seq},
			async: true,
			success: function(res) {
				if(res == "AN") {
					getLogin(return_url);
				} else {
					locationReplace(return_url);
				}
			}
		});
	}
}