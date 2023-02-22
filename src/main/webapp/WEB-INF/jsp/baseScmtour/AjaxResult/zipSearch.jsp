<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
	<!-- 모달팝업 > 우편번호 검색 { -->
	<div id="zipsearch" class="modal fade zipsearch" tabindex="1" role="dialog">
		<div class="modal-dialog" role="document" >
			<div class="modal-content" >
				<div class="modal-header bgOrangeGra">
					<button type="button" class="closebtn" data-dismiss="modal" aria-label="Close"><i class="fal fa-times"></i></button>
					<h4 class="modal-title">우편번호 검색</h4>
				</div>
				<form id="form" name="form" method="post" onsubmit="return false;">
				<div class="modal-body mgt10px" >
					<ul class="nopm floats">
						<input type="hidden" id="currentPage" name="currentPage" value="1" />
						<input type="hidden" id="countPerPage" name="countPerPage" value="10" />
						<input type="hidden" name="resultType" value="json" />
						<input type="hidden" id="zip_area" value="" />
						<input type="hidden" id="zip_addr1" value="" />
						<input type="hidden" id="zip_addr2" value="" />
						<input type="hidden" name="confmKey" value="U01TX0FVVEgyMDIwMDYyMjEzMzcyMzEwOTg5MTU=" />
						<%--
						<li><input type="text" class="basic_input w300px" id="keyword" name="keyword" placeholder="검색어를 입력하세요." onkeydown="enterSearch('zip', 'addr1', 'addr2');" /></li>
						--%>
						<li><input type="text" class="basic_input w200px" id="keyword" name="keyword" placeholder="검색어를 입력하세요." /></li>
						<li><button type="button" class="btns h20px orangebtn w150" onclick="$('#currentPage').val(1); send_govPostcode('zip', 'addr1', 'addr2')" ><i class="fal fa-search"></i> 검색</button></li>
					</ul>
				</div>
				</form>
				<div class="modal-body" id="addrList" style="max-height: 700px; min-height: 200px; overflow-y: auto;">
				<!-- 주소목록 -->	
				* TIP !!!
				<br><br>
				동명 + 건물명으로 검색하시면 더욱 최적의 결과를 얻으실 수 있습니다.
				<br><br>
				예) 서천 코아루, 서천 천년가, 서천 센터	
				</div>
				<div class="paginate alignCenter mgb10px" id="pageApi"></div>
			</div>
		</div>
	</div>
	<style>
	.ziplink { display: inline-block; border: solid 1px #aaa; padding:4px; width: 30px; border-radius: 5px; font-weight: noraml; color: #aaa; }
	.zipsel { display: inline-block; border: solid 1px #ff6600; padding:4px; width: 30px; border-radius: 5px; font-weight: bold; color: #ff6600; }
	</style>
	<script>
	var zip_info = "<p style='color: #ff6600; font-weight:bold; font-family:system; font-size: 18px;'>* TIP !!!</p>"
		+ "<br>"
		+ "<strong>동명 + 건물명으로 검색하시면 더욱 최적의 결과를 얻으실 수 있습니다.</strong>"
		+ "<br><br>"
		+ "예) 서천 코아루, 서천 천년가, 서천 센터";	
			
	function send_govPostcode(){
	$(".loading").show();
	$("#addrList").html(''); 
	$("#pageApi").html('');
	
	// 적용예 (api 호출 전에 검색어 체크)
	if (!checkSearchedWord(document.form.keyword)) {
		return ;
	}
	
	$.ajax({
		 url :"https://www.juso.go.kr/addrlink/addrLinkApiJsonp.do"  //인터넷망
		,type:"post"
		,data:$("#form").serialize()
		,dataType:"jsonp"
		,crossDomain:true
		,success:function(jsonStr){
			$("#addrList").html("");
			var errCode = jsonStr.results.common.errorCode;
			var errDesc = jsonStr.results.common.errorMessage;
			if(errCode != "0"){
				alert(errCode+"="+errDesc+"\n시스템관리자에게 문의바랍니다.");
				$(".loading").hide();
			}else{
				if(jsonStr != null){
					makeListJson(jsonStr);
					pageMake(jsonStr);
					$(".loading").hide();
				}
			}
		}
	    ,error: function(xhr,status, error){
	    	alert("에러발생!. 시스템관리자에게 문의바랍니다.");
	    	$(".loading").hide();
	    }
	});
	}
	function makeListJson(jsonStr){
	var htmlStr = "";
	htmlStr += "<table >";
	$(jsonStr.results.juso).each(function(){
		htmlStr += "<tr onMouseOver=this.style.backgroundColor='#fac096' onMouseOut=this.style.backgroundColor='#ffffff' >";
		htmlStr += "<td style='padding:4px; text-align:center; width: 80px; font-weight: bold; color: #ff6600;'>"+this.zipNo+"</td>";
		htmlStr += "<td style='padding: 10px; text-align:left; ' >";
		htmlStr += "<div style='font-weight: bold; '>"+this.roadAddr+"</div>";
		htmlStr += "<div style='font-weight: normal; color: gray; margin-top: 5px;'>"+this.jibunAddr+"</div>";
		htmlStr += "</td>";
		/*
		htmlStr += "<td>"+this.roadAddrPart1+"</td>";
		htmlStr += "<td>"+this.roadAddrPart2+"</td>";
		htmlStr += "<td>"+this.jibunAddr+"</td>";
		htmlStr += "<td>"+this.engAddr+"</td>";
		htmlStr += "<td>"+this.zipNo+"</td>";
		htmlStr += "<td>"+this.admCd+"</td>";
		htmlStr += "<td>"+this.rnMgtSn+"</td>";
		htmlStr += "<td>"+this.bdMgtSn+"</td>";
		htmlStr += "<td>"+this.detBdNmList+"</td>";
		*/
		/** API 서비스 제공항목 확대 (2017.02) **/
		/*
		htmlStr += "<td>"+this.bdNm+"</td>";
		htmlStr += "<td>"+this.bdKdcd+"</td>";
		htmlStr += "<td>"+this.siNm+"</td>";
		htmlStr += "<td>"+this.sggNm+"</td>";
		htmlStr += "<td>"+this.emdNm+"</td>";
		htmlStr += "<td>"+this.liNm+"</td>";
		htmlStr += "<td>"+this.rn+"</td>";
		htmlStr += "<td>"+this.udrtYn+"</td>";
		htmlStr += "<td>"+this.buldMnnm+"</td>";
		htmlStr += "<td>"+this.buldSlno+"</td>";
		htmlStr += "<td>"+this.mtYn+"</td>";
		htmlStr += "<td>"+this.lnbrMnnm+"</td>";
		htmlStr += "<td>"+this.lnbrSlno+"</td>";
		htmlStr += "<td>"+this.emdNo+"</td>";
		*/
		htmlStr += "<td style='padding:4px; text-align:center; width: 80px;'><button type='button' class='btns graybtn colorWhite right h30px' onclick='setaddr(\""+this.zipNo+"\", \""+this.roadAddr+"\");'> 선택 </button></td>";
		htmlStr += "</tr>";
	});
	htmlStr += "</table>";
	$("#addrList").html(htmlStr);
	}
	//특수문자, 특정문자열(sql예약어의 앞뒤공백포함) 제거
	function checkSearchedWord(obj){
	if(obj.value.length >0){
		//특수문자 제거
		var expText = /[%=><]/ ;
		if(expText.test(obj.value) == true){
			alert("특수문자를 입력 할수 없습니다.") ;
			obj.value = obj.value.split(expText).join(""); 
			return false;
		}
		
		//특정문자열(sql예약어의 앞뒤공백포함) 제거
		var sqlArray = new Array(
			//sql 예약어
			"OR", "SELECT", "INSERT", "DELETE", "UPDATE", "CREATE", "DROP", "EXEC",
	         		 "UNION",  "FETCH", "DECLARE", "TRUNCATE" 
		);
		
		var regex;
		for(var i=0; i<sqlArray.length; i++){
			regex = new RegExp( sqlArray[i] ,"gi") ;
			
			if (regex.test(obj.value) ) {
			    alert("\"" + sqlArray[i]+"\"와(과) 같은 특정문자로 검색할 수 없습니다.");
				obj.value =obj.value.replace(regex, "");
				return false;
			}
		}
	}
	return true ;
	}
	function enterSearch() {	//폼레서 엔터키 입력시 구동되는 함수
		var evt_code = (window.netscape) ? ev.which : event.keyCode;
		if (evt_code == 13) {    
			event.keyCode = 0;  
			send_govPostcode(); 
		} 
	}
	//페이지 이동
	function goPage(pageNum){
	document.form.currentPage.value=pageNum;
	send_govPostcode();
	}
	//json타입 페이지 처리 (주소정보 리스트 makeListJson(jsonStr); 다음에서 호출)
	/* 
	*  json타입으로 페이지 처리시 수정 
	*  function pageMake(jsonStr){ 
	*  	var total = jsonStr.results.common.totalCount; // 총건수 
	*/
	
	//xml타입 페이지 처리 (주소정보 리스트 makeList(xmlData); 다음에서 호출) 
	//function pageMake(xmlStr){
	//var total = $(xmlStr).find("totalCount").text(); // 총건수
	function pageMake(jsonStr){ 
	var total = jsonStr.results.common.totalCount; // 총건수 
	var pageNum = document.form.currentPage.value;// 현재페이지
	var paggingStr = "";
	if(total < 1){
	}else{
		var PAGEBLOCK=parseInt(document.form.countPerPage.value);
		var pageSize=document.form.countPerPage.value;
		var totalPages = Math.floor((total-1)/pageSize) + 1;
		var firstPage = Math.floor((pageNum-1)/PAGEBLOCK) * PAGEBLOCK + 1;		
		if( firstPage <= 0 ) firstPage = 1;		
		var lastPage = firstPage-1 + PAGEBLOCK;
		if( lastPage > totalPages ) lastPage = totalPages;		
		var nextPage = lastPage+1 ;
		var prePage = firstPage-5 ;		
		if( firstPage > PAGEBLOCK ){
			paggingStr +=  "<a href='javascript:goPage("+prePage+");'><span class='ziplink'>◁</span></a>  " ;
		}		
		for( i=firstPage; i<=lastPage; i++ ){
			if( pageNum == i )
				paggingStr += "<a href='javascript:goPage("+i+");'><span class='zipsel'>" + i + "</span></a>  ";
			else
				paggingStr += "<a href='javascript:goPage("+i+");'><span class='ziplink'>" + i + "</span></a>  ";
		}		
		if( lastPage < totalPages ){
			paggingStr +=  "<a href='javascript:goPage("+nextPage+");'><span class='ziplink'>▷</span></a>";
		}		
		$("#pageApi").html(paggingStr);
	}	
	}
	function form_govPostcode(zip, addr1, addr2) {
	$("#keyword").val(''); 
	$("#addrList").html(zip_info); 
	$("#pageApi").html(''); 
	$('#zipsearch').modal("show");
	$('#zip_area').val(zip);
	$('#zip_addr1').val(addr1);
	$('#zip_addr2').val(addr2);
	}
	function setaddr(zip_val, addr1_val) {
	$("#zipsearch").modal('hide'); 
	$("#keyword").val(''); 
	$("#addrList").html(zip_info); 
	$("#pageApi").html(''); 
	var zip = $("#zip_area").val();
	var addr1 = $("#zip_addr1").val();
	var addr2 = $("#zip_addr2").val();
	$("#"+zip).val(zip_val);
	$("#"+addr1).val(addr1_val);
	$("#"+addr2).focus();
	}

	</script>
	<!-- } 모달팝업 > 우편번호 검색 -->