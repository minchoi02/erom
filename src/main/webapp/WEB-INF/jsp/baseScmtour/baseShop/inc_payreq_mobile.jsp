<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page import="java.util.*" %>
<%@ page import="lgdacom.XPayClient.XPayClient"%>
<%
    
	String mo_os = (String) pageContext.getAttribute("mo_os");
	
	/*
     * [결제 인증요청 페이지(STEP2-1)]
     *
     * 샘플페이지에서는 기본 파라미터만 예시되어 있으며, 별도로 필요하신 파라미터는 연동메뉴얼을 참고하시어 추가 하시기 바랍니다.
     */

     /* ※ 중요
 	* 환경설정 파일의 경우 반드시 외부에서 접근이 가능한 경로에 두시면 안됩니다.
 	* 해당 환경파일이 외부에 노출이 되는 경우 해킹의 위험이 존재하므로 반드시 외부에서 접근이 불가능한 경로에 두시기 바랍니다. 
 	* 예) [Window 계열] C:\inetpub\wwwroot\lgdacom ==> 절대불가(웹 디렉토리)
 	*/
 	
 	//String configPath = "C:/webapps/bin/payment";  //LG유플러스에서 제공한 환경파일("/conf/lgdacom.conf,/conf/mall.conf") 위치 지정.
    //String Domain = "http://221.145.201.124:8888/";
 	String configPath = "/webapps/bin/payment";  //LG유플러스에서 제공한 환경파일("/conf/lgdacom.conf,/conf/mall.conf") 위치 지정.
    String Domain = "https://www.scmtour.com";
    /*
     * 1. 기본결제 인증요청 정보 변경
     *
     * 기본정보를 변경하여 주시기 바랍니다.(파라미터 전달시 POST를 사용하세요)
     */
     String payType = request.getParameter("order_user_pay"); 
    
    //String CST_PLATFORM         = "test";                 //LG유플러스 결제서비스 선택(test:테스트, service:서비스)
    String CST_PLATFORM         = "service";                 //LG유플러스 결제서비스 선택(test:테스트, service:서비스)
    //String CST_MID              = "scmtour";                      //LG유플러스로 부터 발급받으신 상점아이디를 입력하세요.
    //if(("virtual").equals(payType)) {
    //	CST_MID              = "sctong";                      //LG유플러스로 부터 발급받으신 상점아이디를 입력하세요.
    //}
    String CST_MID              = "sctong";                      //LG유플러스로 부터 발급받으신 상점아이디를 입력하세요.
	//out.println(CST_MID);
    String LGD_MID              = ("test".equals(CST_PLATFORM.trim())?"t":"")+CST_MID;  //테스트 아이디는 't'를 제외하고 입력하세요.
                                                                                        //상점아이디(자동생성)
    String LGD_OID              = (String) pageContext.getAttribute("lgd_oid_val");                      //주문번호(상점정의 유니크한 주문번호를 입력하세요)
    //String LGD_AMOUNT			= (String)pageContext.getAttribute("11111");

    String LGD_AMOUNT			= request.getParameter("all_total_price");
    String LGD_BUYER            = (String) pageContext.getAttribute("lgd_buyer_val");                   //구매자명
    //String LGD_PRODUCTINFO      = (String)pageContext.getAttribute("product_info");              //상품명
    String LGD_BUYEREMAIL       = request.getParameter("order_user_email");            //구매자 이메일
    
    String LGD_TIMESTAMP        = request.getParameter("LGD_TIMESTAMP");                //타임스탬프
    //String LGD_CUSTOM_FIRSTPAY	= request.getParameter("LGD_CUSTOM_FIRSTPAY");        	//상점정의 초기결제수단
    String LGD_PCVIEWYN			= request.getParameter("LGD_PCVIEWYN");					//페이나우 휴대폰번호 입력 화면 사용 여부(유심칩이 없는 단말기에서 입력-->유심칩이 있는 휴대폰에서 실제 결제)
	String LGD_CUSTOM_SKIN      = "SMART_XPAY2";    
 
    /*
     * 가상계좌(무통장) 결제 연동을 하시는 경우 아래 LGD_CASNOTEURL 을 설정하여 주시기 바랍니다.
     */
    String LGD_CASNOTEURL		= Domain+"/PG/CasNoteUrl.do";

    /*
     * LGD_RETURNURL 을 설정하여 주시기 바랍니다. 반드시 현재 페이지와 동일한 프로트콜 및  호스트이어야 합니다. 아래 부분을 반드시 수정하십시요.
     */
    String LGD_RETURNURL		= Domain+"/PG/ReturnUrl.do";
    
	String LGD_KVPMISPWAPURL		= "";
	String LGD_KVPMISPCANCELURL     = "";
		
	String LGD_MPILOTTEAPPCARDWAPURL = ""; //iOS 연동시 필수
	
	/*
	* 계좌이체 연동을 위한 파라미터(필수)
	*/
	String LGD_MTRANSFERWAPURL 		= "";
	String LGD_MTRANSFERCANCELURL 	= "";   
	
    /*
     *************************************************
     * 2. MD5 해쉬암호화 (수정하지 마세요) - BEGIN
     *
     * MD5 해쉬암호화는 거래 위변조를 막기위한 방법입니다.
     *************************************************
     *
     * 해쉬 암호화 생성( LGD_MID + LGD_OID + LGD_AMOUNT + LGD_TIMESTAMP )
     * LGD_MID          : 상점아이디
     * LGD_OID          : 주문번호
     * LGD_AMOUNT       : 금액
     * LGD_TIMESTAMP    : 타임스탬프
     *
     * MD5 해쉬데이터 암호화 검증을 위해
     * LG유플러스에서 발급한 상점키(MertKey)를 환경설정 파일(lgdacom/conf/mall.conf)에 반드시 입력하여 주시기 바랍니다.
     */
     String LGD_HASHDATA = "";
     XPayClient xpay = null;
     try {
    	 
    	 xpay = new XPayClient();
    	 xpay.Init(configPath, CST_PLATFORM);
    	 
    	 if(LGD_TIMESTAMP == null || "".equals(LGD_TIMESTAMP)) {
    		 LGD_TIMESTAMP = xpay.GetTimeStamp();
    	 }
    	 LGD_HASHDATA = xpay.GetHashData(LGD_MID, LGD_OID, LGD_AMOUNT, LGD_TIMESTAMP);
     } catch(Exception e) {
    	 e.printStackTrace();
    	out.println("LG유플러스 제공 API를 사용할 수 없습니다. 환경파일 설정을 확인해 주시기 바랍니다. ");
 		out.println(""+e.getMessage());    	
 		return;
     } finally {
    	 xpay = null;
     }
     String LGD_CUSTOM_PROCESSTYPE = "TWOTR";
    /*
     *************************************************
     * 2. MD5 해쉬암호화 (수정하지 마세요) - END
     *************************************************
     */
      
     String CST_WINDOW_TYPE = "submit";			//수정불가
     
     HashMap payReqMap = new HashMap();
 	 payReqMap.put("CST_PLATFORM"				, CST_PLATFORM);						// 테스트, 서비스 구분
 	 payReqMap.put("CST_MID"						, CST_MID );							// 상점아이디
 	 payReqMap.put("CST_WINDOW_TYPE"				, CST_WINDOW_TYPE );					// 전송방식 구분
 	 payReqMap.put("LGD_MID"						, LGD_MID );							// 상점아이디
 	 payReqMap.put("LGD_OID"						, LGD_OID );							// 주문번호
 	 payReqMap.put("LGD_BUYER"					, LGD_BUYER );							// 구매자
 	 //payReqMap.put("LGD_PRODUCTINFO"				, LGD_PRODUCTINFO );					// 상품정보
 	 payReqMap.put("LGD_AMOUNT"					, LGD_AMOUNT );							// 결제금액
 	 payReqMap.put("LGD_BUYEREMAIL"				, LGD_BUYEREMAIL );						// 구매자 이메일
 	 payReqMap.put("LGD_CUSTOM_SKIN"				, LGD_CUSTOM_SKIN );					// 결제창 SKIN
 	 payReqMap.put("LGD_CUSTOM_PROCESSTYPE"		, LGD_CUSTOM_PROCESSTYPE );				// 트랜잭션 처리방식
 	 payReqMap.put("LGD_TIMESTAMP"				, LGD_TIMESTAMP );						// 타임스탬프
 	 payReqMap.put("LGD_HASHDATA"				, LGD_HASHDATA );						// MD5 해쉬암호값
 	 payReqMap.put("LGD_RETURNURL"				, LGD_RETURNURL );						// 응답수신페이지
 	 payReqMap.put("LGD_VERSION"					, "JSP_Non-ActiveX_SmartXPay");			// 버전정보 (삭제하지 마세요)
 	 //payReqMap.put("LGD_CUSTOM_FIRSTPAY"			, LGD_CUSTOM_FIRSTPAY );				// 디폴트 결제수단
 	 payReqMap.put("LGD_PCVIEWYN"				, LGD_PCVIEWYN );						// 휴대폰번호 입력 화면 사용 여부
 	
 	payReqMap.put("LGD_CUSTOM_SWITCHINGTYPE"	, "SUBMIT" );							// 신용카드 카드사 인증 페이지 연동 방식
 	payReqMap.put("LGD_DOMAIN_URL"	, "xpayvvip" );
     
	 //iOS 연동시 필수
	 payReqMap.put("LGD_MPILOTTEAPPCARDWAPURL"	, LGD_MPILOTTEAPPCARDWAPURL );
 	 
	 /*
	****************************************************
	* 신용카드 ISP(국민/BC)결제에만 적용 - BEGIN 
	****************************************************
	*/
	payReqMap.put("LGD_KVPMISPWAPURL"			, LGD_KVPMISPWAPURL );	
	payReqMap.put("LGD_KVPMISPCANCELURL"		, LGD_KVPMISPCANCELURL );
	/*
	****************************************************
	* 신용카드 ISP(국민/BC)결제에만 적용  - END
	****************************************************
	*/
		
	/*
	****************************************************
	* 계좌이체 결제에만 적용 - BEGIN 
	****************************************************
	*/
	payReqMap.put("LGD_MTRANSFERWAPURL"			, LGD_MTRANSFERWAPURL );	
	payReqMap.put("LGD_MTRANSFERCANCELURL"		, LGD_MTRANSFERCANCELURL );
	
	/*
	****************************************************
	* 계좌이체 결제에만 적용  - END
	****************************************************
	*/

	/*
	****************************************************
	* 모바일 OS별 ISP(국민/비씨), 계좌이체 결제 구분 값
	****************************************************
	1) Web to Web
	- 안드로이드: A (디폴트)
	- iOS: N
	  ** iOS일 경우, 반드시 N으로 값을 수정
	2) App to Web(반드시 SmartXPay_AppToWeb_연동가이드를 참조합니다.)
	- 안드로이드, iOS: A
	*/
	if("android".equals(mo_os)) {
	payReqMap.put("LGD_KVPMISPAUTOAPPYN"	, "A");					// 신용카드 결제 사용시 필수
	payReqMap.put("LGD_MTRANSFERAUTOAPPYN"	, "A");					// 계좌이체 결제 사용시 필수
	} else {
	payReqMap.put("LGD_KVPMISPAUTOAPPYN"	, "N");					// 신용카드 결제 사용시 필수
	payReqMap.put("LGD_MTRANSFERAUTOAPPYN"	, "N");					// 계좌이체 결제 사용시 필수
	}
	
	
	

	// 가상계좌(무통장) 결제연동을 하시는 경우  할당/입금 결과를 통보받기 위해 반드시 LGD_CASNOTEURL 정보를 LG 유플러스에 전송해야 합니다 .
	payReqMap.put("LGD_CASNOTEURL"		, LGD_CASNOTEURL );			// 가상계좌 NOTEURL
	
	// Return URL에서 인증 결과 수신 시 셋팅될 파라미터들
	payReqMap.put("LGD_RESPCODE"		, "" );
	payReqMap.put("LGD_PAYKEY"			, "" );
	payReqMap.put("LGD_RESPMSG"			, "" );
	
	 payReqMap.put("LGD_ENCODING", "UTF-8");
	 payReqMap.put("LGD_ENCODING_NOTEURL", "UTF-8");
	 payReqMap.put("LGD_ENCODING_RETURNURL", "UTF-8");
	 
	 session.setAttribute("PAYREQ_MAP", payReqMap);
	%>
	
	<script type="text/javascript">
	/*
	* 수정불가.
	*/
		var LGD_window_type = '<%=CST_WINDOW_TYPE%>';
		
	/*
	* 수정불가
	*/
	function launchCrossPlatform(){
	      lgdwin = open_paymentwindow(document.getElementById('LGD_PAYINFO'), '<%= CST_PLATFORM %>', LGD_window_type);
	}
	/*
	* FORM 명만  수정 가능
	*/
	function getFormObject() {
	        return document.getElementById("LGD_PAYINFO");
	}
	</script>
		
	<form method="post" action="" id="payform">
		<input type="hidden" id="order_id" name="order_id" value="<c:out value="${order_id }"/>" />
		<input type="hidden" id="forder_total_price" name="forder_total_price" value="<c:out value="${all_total_price}"/>" />
		<input type="hidden" id="forder_cart_seq" name="forder_cart_seq" value="<c:out value="${forder_cart_seq}"/>" />
		<input type="hidden" id="forder_user_name" name="forder_user_name" value="<c:out value="${forder_user_nm}"/>" />
		<input type="hidden" id="forder_user_email" name="forder_user_email" value="<c:out value="${forder_user_email}"/>" />
		<input type="hidden" id="forder_user_hp" name="forder_user_hp" value="<c:out value="${forder_user_hp}"/>" />
		<input type="hidden" id="forder_user_call" name="forder_user_call" value="<c:out value="${forder_user_call}"/>" />
		
		<input type="hidden" id="forder_user_zip" name="forder_user_zip" value="<c:out value="${forder_user_zip}"/>" />
		<input type="hidden" id="forder_user_addr1" name="forder_user_addr1" value="<c:out value="${forder_user_addr1}"/>" />
		<input type="hidden" id="forder_user_addr2" name="forder_user_addr2" value="<c:out value="${forder_user_addr2}"/>" />
		<input type="hidden" id="forder_user_message" name="forder_user_message" value="<c:out value="${forder_user_message}"/>" />
		<input type="hidden" id="forder_paytype1" name="forder_paytype" value="bank" />
		
		<input type="hidden" id="forder_coupon_id" name="forder_coupon_id" value="<c:out value="${coupon_id}"/>" />
		<input type="hidden" id="forder_coupon_calc_price" name="forder_coupon_calc_price" value="<c:out value="${coupon_sale_price}"/>" />
		<input type="hidden" id="forder_mileage" name="forder_mileage" value="<c:out value="${forder_mileage}"/>" />
		<input type="hidden" id="forder_delivery" name="forder_delivery" value="<c:out value="${forder_delivery}"/>" />
		
	</form>
	<form method="post" name="LGD_PAYINFO" id="LGD_PAYINFO" action="/PG/payRes.do">
		<input type="hidden" id="LGD_BUYERID" name="LGD_BUYERID" value="<c:out value="${user_id }"/>" />
		<input type="hidden" id="LGD_PRODUCTINFO" name="LGD_PRODUCTINFO" value="<c:out value="${product_info }"/>" />
		<input type="hidden" id="LGD_CUSTOM_USABLEPAY" name="LGD_CUSTOM_USABLEPAY" value="" />
		<input type="hidden" id="LGD_CUSTOM_FIRSTPAY" name="LGD_CUSTOM_FIRSTPAY" value="" />
		
		<input type="hidden" id="LGD_BUYERPHONE" name="LGD_BUYERPHONE" value="<c:out value="${forder_user_hp}"/>" />
		<input type="hidden" id="LGD_RECEIVER" name="LGD_RECEIVER" value="<c:out value="${forder_cart_seq}"/>" /> <%-- forder_cart_seq --%>
		<input type="hidden" id="LGD_DELIVERYINFO" name="LGD_DELIVERYINFO" value="<c:out value="${forder_user_zip}"/>:::<c:out value="${forder_user_addr1}"/>:::<c:out value="${forder_user_addr2}"/>:::<c:out value="${forder_user_message}"/>:::<c:out value="${forder_user_call}"/>" /> <%-- forder_cart_seq --%>
		<input type="hidden" id="LGD_BUYERADDRESS" name="LGD_BUYERADDRESS" value="<c:out value="${forder_user_nm}"/>:::<c:out value="${forder_user_email}"/>:::<c:out value="${coupon_id}"/>:::<c:out value="${coupon_sale_price}"/>:::<c:out value="${forder_mileage}"/>:::<c:out value="${forder_delivery}"/>" /> 

		<input type="hidden" id="forder_paytype2" name="forder_paytype" value="<c:out value="${order_user_pay}"/>" />
		<input type="hidden" id="LGD_RECEIVERPHONE" name="LGD_RECEIVERPHONE" value="<c:out value="${order_time}"/>" />
		<%
		for(Iterator i = payReqMap.keySet().iterator(); i.hasNext();){
			Object key = i.next();
			out.println("<input type='hidden' name='" + key + "' id='"+key+"' value='" + payReqMap.get(key) + "'>" );
		}
		%>
	</form>	
	
	
	