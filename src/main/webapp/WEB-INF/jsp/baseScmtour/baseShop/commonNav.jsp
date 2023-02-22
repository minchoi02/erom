<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="doURI" value="${requestScope['javax.servlet.forward.servlet_path']}" /> 
<c:set var="qsURI" value="${pageContext.request.queryString}" /> 
<c:set var="URI" value="${doURI }"/>
<c:if test="${not empty qsURI}">
	<c:set var="URI" value="${doURI }?${qsURI }"/>
</c:if>

<%
    NiceID.Check.CPClient niceCheck = new  NiceID.Check.CPClient();
    
    String sSiteCode = "BP428";			// NICE로부터 부여받은 사이트 코드
    String sSitePassword = "A0vAwRN4zJhV";		// NICE로부터 부여받은 사이트 패스워드
    
    String sRequestNumber = "REQ0000000001";        	// 요청 번호, 이는 성공/실패후에 같은 값으로 되돌려주게 되므로 
                                                    	// 업체에서 적절하게 변경하여 쓰거나, 아래와 같이 생성한다.
    sRequestNumber = niceCheck.getRequestNO(sSiteCode);
  	session.setAttribute("REQ_SEQ" , sRequestNumber);	// 해킹등의 방지를 위하여 세션을 쓴다면, 세션에 요청번호를 넣는다.
  	
   	String sAuthType = "";      	// 없으면 기본 선택화면, M: 핸드폰, C: 신용카드, X: 공인인증서
   	
   	String popgubun 	= "N";		//Y : 취소버튼 있음 / N : 취소버튼 없음
	String customize 	= "";		//없으면 기본 웹페이지 / Mobile : 모바일페이지
	
	String sGender = ""; 			//없으면 기본 선택 값, 0 : 여자, 1 : 남자 
	
    // CheckPlus(본인인증) 처리 후, 결과 데이타를 리턴 받기위해 다음예제와 같이 http부터 입력합니다.
	//리턴url은 인증 전 인증페이지를 호출하기 전 url과 동일해야 합니다. ex) 인증 전 url : http://www.~ 리턴 url : http://www.~
    String sReturnUrl = "https://www.scmtour.com/shop/checkPlusSuccess.do";      // 성공시 이동될 URL
    String sErrorUrl = "https://www.scmtour.com/shop/checkPlusFail.do";          // 실패시 이동될 URL

    // 입력될 plain 데이타를 만든다.
    String sPlainData = "7:REQ_SEQ" + sRequestNumber.getBytes().length + ":" + sRequestNumber +
                        "8:SITECODE" + sSiteCode.getBytes().length + ":" + sSiteCode +
                        "9:AUTH_TYPE" + sAuthType.getBytes().length + ":" + sAuthType +
                        "7:RTN_URL" + sReturnUrl.getBytes().length + ":" + sReturnUrl +
                        "7:ERR_URL" + sErrorUrl.getBytes().length + ":" + sErrorUrl +
                        "11:POPUP_GUBUN" + popgubun.getBytes().length + ":" + popgubun +
                        "9:CUSTOMIZE" + customize.getBytes().length + ":" + customize + 
						"6:GENDER" + sGender.getBytes().length + ":" + sGender;
    
    String sMessage = "";
    String sEncData = "";
    
    int iReturn = niceCheck.fnEncode(sSiteCode, sSitePassword, sPlainData);
    if( iReturn == 0 )
    {
        sEncData = niceCheck.getCipherData();
    }
    else if( iReturn == -1)
    {
        sMessage = "암호화 시스템 에러입니다.";
    }    
    else if( iReturn == -2)
    {
        sMessage = "암호화 처리오류입니다.";
    }    
    else if( iReturn == -3)
    {
        sMessage = "암호화 데이터 오류입니다.";
    }    
    else if( iReturn == -9)
    {
        sMessage = "입력 데이터 오류입니다.";
    }    
    else
    {
        sMessage = "알수 없는 에러 입니다. iReturn : " + iReturn;
    }
%>
<%
String sBirthDate = "20100405";
String Birth = sBirthDate.substring(0,4);
//out.println(Birth); 
//authCheck = 
%>


<form name="form_chk" method="post">
	<input type="hidden" name="m" value="checkplusService">						<!-- 필수 데이타로, 누락하시면 안됩니다. -->
	<input type="hidden" name="EncodeData" value="<%= sEncData %>">		<!-- 위에서 업체정보를 암호화 한 데이타입니다. -->
	<%--
	<a href="javascript:fnPopup();"> CheckPlus 안심본인인증 Click</a>
	 --%>
</form>
<script language='javascript'>
window.name ="Parent_window";

function fnPopup(){
	window.open('', 'popupChk', 'width=500, height=550, top=100, left=100, fullscreen=no, menubar=no, status=no, toolbar=no, titlebar=yes, location=no, scrollbar=no');
	document.form_chk.action = "https://nice.checkplus.co.kr/CheckPlusSafeModel/checkplus.cb";
	document.form_chk.target = "popupChk";
	document.form_chk.submit();
}
</script>

<input type="hidden" id="store_category" name="store_category" value="<c:out value="${store_category }"/>" />
<input type="hidden" id="prod_category" name="prod_category" value="<c:out value="${prod_category }"/>" />
<input type="hidden" id="prod_nm" name="prod_nm" value="<c:out value="${prodInfo.prod_nm}"/>" />
<input type="hidden" id="store_id" name="store_id" value="<c:out value="${prodInfo.store_id}"/>" />
<input type="hidden" id="store_nm" name="store_nm" value="<c:out value="${prodInfo.store_nm}"/>" />
<c:forEach var="optionList" items="${optionList}" varStatus="status">
	<input type="hidden" id="opt_seq_<c:out value="${optionList.opt_seq }"/>" class="order_seq" value="<c:out value="${optionList.opt_seq }"/>" /> 
	<input type="hidden" id="opt_nm_<c:out value="${optionList.opt_seq }"/>" class="order_nm" value="<c:out value="${optionList.opt_nm }"/>" /> 
	<input type="hidden" id="opt_price_<c:out value="${optionList.opt_seq }"/>" class="order_price" value="<c:out value="${optionList.opt_price}"/>" /> 
	<input type="hidden" id="opt_order_price_<c:out value="${optionList.opt_seq }"/>" class="order_order_price" value="0" /> 
	<input type="hidden" id="opt_order_cnt_<c:out value="${optionList.opt_seq }"/>" class="order_cnt" value="1" /> 
</c:forEach>

	<nav id="m-nav" class="detailpage marketver market">
		<ul class="nopm floats">
			<li><a href="javascript:history.back();"><em><i class="fal fa-long-arrow-left"></i></em><span class="sound_only">뒤로가기</span></a></li>
			<li class="marketbuy">
				<c:if test="${empty user_id }">
				<a href="javascript:getLogin('<c:out value="${URI}"/>')" class="btns bgOrangeGra ">구매하기</a>
				</c:if>
				<c:if test="${not empty user_id }">
				<%-- <c:if test="${prod_category ne 'CD005002' }"> --%>
				<c:if test="${prod_category eq 'CD005001' }">
				<c:choose>
					<c:when test="${not empty adultAuth}">
					<a href="#;" class="btns bgOrangeGra marketbuybtn">구매하기</a>
					</c:when>
					<c:otherwise>
					<a href="javascript:fnPopup();" class="btns bgOrangeGra ">구매하기</a>
					</c:otherwise>
				</c:choose>
				</c:if>
				<%-- <c:if test="${prod_category eq 'CD005002' }"> --%>
				<c:if test="${prod_category ne 'CD005001' }">
				<a href="#;" class="btns bgOrangeGra marketbuybtn">구매하기</a>
				</c:if>
				</c:if>
			</li>
		</ul>
		<div id="marketoption">
			<div class="topclose"><a href="#;" class="marketbuybtn"><i class="far fa-chevron-down"></i></a></div>
			<div class="optionbox">
				<div class="optionselect">
					<select id="item_sel" class="basic_select w100" onchange="sel_opt(this.value); ">
						<option value="">옵션을 선택해주세요.</option>
						<c:forEach var="optionList" items="${optionList}" varStatus="status">
							<option value="<c:out value="${optionList.opt_seq }"/>"><c:out value="${optionList.opt_nm }"/> (<fmt:formatNumber value="${optionList.opt_price}" type="number"/>원)</option>
						</c:forEach>
					</select>
				</div>
				<div class="optionchoice" id="optList">
				<!--헝목뷰  -->
				</div>
				<div class="optionchoice">
					<div class="optionprice alignRight">
						<small>총</small> <strong id="total_price">0</strong><small>원</small>
					</div>
				</div>
			</div>
			<div class="btnArea alignCenter">
				<ul class="nopm floats">
					<li><a href="javascript:cart_add('cart');" class="btns h50px w100">장바구니</a></li>
					<li class="fr"><a href="javascript:cart_add('order');" class="btns h50px orangebtn w100">구매하기</a></li>
				</ul>
			</div>
		</div>
	</nav>