<%--
<%@ page contentType = "text/html;charset=utf-8" %>
--%>
<%@ page contentType="text/html;charset=EUC-KR" %>
<%@ page import="java.io.*" %>
<%@ page import="java.text.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.security.MessageDigest" %>
<%@ page import="lgdacom.XPayClient.XPayClient"%>

<%
    //request.setCharacterEncoding("utf-8");

	/*
     * [상점 결제결과처리(DB) 페이지]
     *
     * 1) 위변조 방지를 위한 hashdata값 검증은 반드시 적용하셔야 합니다.
     *
     */

    String LGD_RESPCODE = "";           // 응답코드: 0000(성공) 그외 실패
    String LGD_RESPMSG = "";            // 응답메세지
    String LGD_MID = "";                // 상점아이디 
    String LGD_OID = "";                // 주문번호
    String LGD_AMOUNT = "";             // 거래금액
    String LGD_TID = "";                // LG유플러스에서 부여한 거래번호
    String LGD_PAYTYPE = "";            // 결제수단코드
    String LGD_PAYDATE = "";            // 거래일시(승인일시/이체일시)
    String LGD_HASHDATA = "";           // 해쉬값
    String LGD_FINANCECODE = "";        // 결제기관코드(은행코드)
    String LGD_FINANCENAME = "";        // 결제기관이름(은행이름)
    String LGD_ESCROWYN = "";           // 에스크로 적용여부
    String LGD_TIMESTAMP = "";          // 타임스탬프
    String LGD_ACCOUNTNUM = "";         // 계좌번호(무통장입금) 
    String LGD_CASTAMOUNT = "";         // 입금총액(무통장입금)
    String LGD_CASCAMOUNT = "";         // 현입금액(무통장입금)
    String LGD_CASFLAG = "";            // 무통장입금 플래그(무통장입금) - 'R':계좌할당, 'I':입금, 'C':입금취소 
    String LGD_CASSEQNO = "";           // 입금순서(무통장입금)
    String LGD_CASHRECEIPTNUM = "";     // 현금영수증 승인번호
    String LGD_CASHRECEIPTSELFYN = "";  // 현금영수증자진발급제유무 Y: 자진발급제 적용, 그외 : 미적용
    String LGD_CASHRECEIPTKIND = "";    // 현금영수증 종류 0: 소득공제용 , 1: 지출증빙용
    String LGD_PAYER = "";    			// 임금자명
    
    /*
     * 구매정보
     */
    String LGD_BUYER = "";              // 구매자
    String LGD_PRODUCTINFO = "";        // 상품명
    String LGD_BUYERID = "";            // 구매자 ID
    String LGD_BUYERADDRESS = "";       // 구매자 주소
    String LGD_BUYERPHONE = "";         // 구매자 전화번호
    String LGD_BUYEREMAIL = "";         // 구매자 이메일
    String LGD_BUYERSSN = "";           // 구매자 주민번호
    String LGD_PRODUCTCODE = "";        // 상품코드
    String LGD_RECEIVER = "";           // 수취인
    String LGD_RECEIVERPHONE = "";      // 수취인 전화번호
    String LGD_DELIVERYINFO = "";       // 배송지

    LGD_RESPCODE            = request.getParameter("LGD_RESPCODE");
    LGD_RESPMSG             = request.getParameter("LGD_RESPMSG");
    LGD_MID                 = request.getParameter("LGD_MID");
    LGD_OID                 = request.getParameter("LGD_OID");
    LGD_AMOUNT              = request.getParameter("LGD_AMOUNT");
    LGD_TID                 = request.getParameter("LGD_TID");
    LGD_PAYTYPE             = request.getParameter("LGD_PAYTYPE");
    LGD_PAYDATE             = request.getParameter("LGD_PAYDATE");
    LGD_HASHDATA            = request.getParameter("LGD_HASHDATA");
    LGD_FINANCECODE         = request.getParameter("LGD_FINANCECODE");
    LGD_FINANCENAME         = request.getParameter("LGD_FINANCENAME");
    LGD_ESCROWYN            = request.getParameter("LGD_ESCROWYN");
    LGD_TIMESTAMP           = request.getParameter("LGD_TIMESTAMP");
    LGD_ACCOUNTNUM          = request.getParameter("LGD_ACCOUNTNUM");
    LGD_CASTAMOUNT          = request.getParameter("LGD_CASTAMOUNT");
    LGD_CASCAMOUNT          = request.getParameter("LGD_CASCAMOUNT");
    LGD_CASFLAG             = request.getParameter("LGD_CASFLAG");
    LGD_CASSEQNO            = request.getParameter("LGD_CASSEQNO");
    LGD_CASHRECEIPTNUM      = request.getParameter("LGD_CASHRECEIPTNUM");
    LGD_CASHRECEIPTSELFYN   = request.getParameter("LGD_CASHRECEIPTSELFYN");
    LGD_CASHRECEIPTKIND     = request.getParameter("LGD_CASHRECEIPTKIND");
    LGD_PAYER     			= request.getParameter("LGD_PAYER");

    LGD_BUYER               = request.getParameter("LGD_BUYER");
    LGD_PRODUCTINFO         = request.getParameter("LGD_PRODUCTINFO");
    LGD_BUYERID             = request.getParameter("LGD_BUYERID");
    LGD_BUYERADDRESS        = request.getParameter("LGD_BUYERADDRESS");
    LGD_BUYERPHONE          = request.getParameter("LGD_BUYERPHONE");
    LGD_BUYEREMAIL          = request.getParameter("LGD_BUYEREMAIL");
    LGD_BUYERSSN            = request.getParameter("LGD_BUYERSSN");
    LGD_PRODUCTCODE         = request.getParameter("LGD_PRODUCTCODE");
    LGD_RECEIVER            = request.getParameter("LGD_RECEIVER");
    LGD_RECEIVERPHONE       = request.getParameter("LGD_RECEIVERPHONE");
    LGD_DELIVERYINFO        = request.getParameter("LGD_DELIVERYINFO");
    
    String CST_PLATFORM         = "service";                 //LG유플러스 결제서비스 선택(test:테스트, service:서비스)
    
    
    Connection conn = null;
	PreparedStatement pstmt = null;
	PreparedStatement pstmt1 = null;
	PreparedStatement pstmt2 = null;
	PreparedStatement pstmt3 = null;
	
	//String jdbcUrl  = "jdbc:mysql://localhost:3306/scmtour?characterEncoding=utf8";
	String jdbcUrl  = "jdbc:mysql://182.162.27.99:3306/scmtour?characterEncoding=utf8";
	String dbId  = "scmtour";
	String dbPass = "scmtourtjcjsRmffla";
	
	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection(jdbcUrl,dbId,dbPass);

	String sqllog = "insert into base_lgd_log_tb (";
	sqllog += "regdt, CST_PLATFORM, LGD_RESPCODE, LGD_MID, LGD_OID, LGD_AMOUNT, LGD_TID,LGD_PAYTYPE,LGD_HASHDATA,LGD_FINANCECODE,LGD_FINANCENAME,";
	sqllog += "LGD_ESCROWYN,LGD_ACCOUNTNUM,LGD_CASTAMOUNT,LGD_CASCAMOUNT,LGD_CASFLAG,LGD_CASSEQNO,LGD_CASHRECEIPTNUM,LGD_CASHRECEIPTSELFYN,LGD_CASHRECEIPTKIND,";
	sqllog += "LGD_PAYER,LGD_BUYER,LGD_PRODUCTINFO,LGD_BUYERADDRESS, LGD_BUYERPHONE,LGD_BUYEREMAIL,LGD_BUYERSSN,LGD_PRODUCTCODE,LGD_RECEIVER,LGD_RECEIVERPHONE,LGD_DELIVERYINFO,LGD_TIMESTAMP";
	sqllog += " ) values ( ";
	sqllog += "now(), ?, ?, ?, ?, ?, ?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?, ?,?,?,?,?,?,?,?";
	sqllog += ")";					
	pstmt = conn.prepareStatement(sqllog);
	pstmt.setString(1,CST_PLATFORM);
	pstmt.setString(2,LGD_RESPCODE);
	pstmt.setString(3,LGD_MID);
	pstmt.setString(4,LGD_OID);
	pstmt.setString(5,LGD_AMOUNT);
	pstmt.setString(6,LGD_TID);
	pstmt.setString(7,LGD_PAYTYPE);
	pstmt.setString(8,LGD_HASHDATA);
	pstmt.setString(9,LGD_FINANCECODE);
	pstmt.setString(10,LGD_FINANCENAME);
	
	pstmt.setString(11,LGD_ESCROWYN);
	pstmt.setString(12,LGD_ACCOUNTNUM);
	pstmt.setString(13,LGD_CASTAMOUNT);
	pstmt.setString(14,LGD_CASCAMOUNT);
	pstmt.setString(15,LGD_CASFLAG);
	pstmt.setString(16,LGD_CASSEQNO);
	pstmt.setString(17,LGD_CASHRECEIPTNUM);
	pstmt.setString(18,LGD_CASHRECEIPTSELFYN);
	pstmt.setString(19,LGD_CASHRECEIPTKIND);
	
	pstmt.setString(20,LGD_PAYER);
	pstmt.setString(21,LGD_BUYER);
	pstmt.setString(22,LGD_PRODUCTINFO);
	pstmt.setString(23,LGD_BUYERADDRESS);
	pstmt.setString(24,LGD_BUYERPHONE);
	pstmt.setString(25,LGD_BUYEREMAIL);
	pstmt.setString(26,LGD_BUYERSSN);
	pstmt.setString(27,LGD_PRODUCTCODE);
	pstmt.setString(28,LGD_RECEIVER);
	pstmt.setString(29,LGD_RECEIVERPHONE);
	pstmt.setString(30,LGD_DELIVERYINFO);
	pstmt.setString(31,LGD_TIMESTAMP);
	pstmt.executeUpdate();  
	
    String configPath = "c:/webapps/bin/payment";  //LG유플러스에서 제공한 환경파일("/conf/lgdacom.conf,/conf/mall.conf") 위치 지정.
    //String configPath = "/webapps/bin/payment";  //LG유플러스에서 제공한 환경파일("/conf/lgdacom.conf,/conf/mall.conf") 위치 지정.
    
    /*
     * hashdata 검증을 위한 mertkey는 상점관리자 -> 계약정보 -> 상점정보관리에서 확인하실수 있습니다. 
     * LG유플러스에서 발급한 상점키로 반드시변경해 주시기 바랍니다.
     */  
     String LGD_HASHDATA2 = "";
     XPayClient xpay = null;
     try {
    	 
    	 xpay = new XPayClient();
    	 xpay.Init(configPath, CST_PLATFORM);
    	     	 
    	 LGD_HASHDATA2 = xpay.GetHashDataCas(LGD_MID, LGD_OID, LGD_AMOUNT, LGD_RESPCODE, LGD_TIMESTAMP);
    	 //out.println(LGD_HASHDATA2); 
    	 
     } catch(Exception e) {
    	 e.printStackTrace();
    	out.println("LG유플러스 제공 API를 사용할 수 없습니다. 환경파일 설정을 확인해 주시기 바랍니다. ");
 		out.println(""+e.getMessage());    	
 		return;
     } finally {
    	 xpay = null;
     }
    
    /*
     * 상점 처리결과 리턴메세지
     *
     * OK  : 상점 처리결과 성공
     * 그외 : 상점 처리결과 실패
     *
     * ※ 주의사항 : 성공시 'OK' 문자이외의 다른문자열이 포함되면 실패처리 되오니 주의하시기 바랍니다.
     */    
    String resultMSG = "결제결과 상점 DB처리(LGD_CASNOTEURL) 결과값을 입력해 주시기 바랍니다.";  
     
    if (LGD_HASHDATA2.trim().equals(LGD_HASHDATA)) { //해쉬값 검증이 성공이면
        if ( ("0000".equals(LGD_RESPCODE.trim())) ){ //결제가 성공이면
    
			if( "R".equals( LGD_CASFLAG.trim() ) ) {

				/*
        		System.out.println(" ::: LGD_OID ::: " + LGD_OID.trim());
				System.out.println(" ::: LGD_AMOUNT ::: " + LGD_AMOUNT.trim());
				System.out.println(" ::: LGD_RECEIVER ::: " + LGD_RECEIVER.trim());
				System.out.println(" ::: LGD_BUYERPHONE ::: " + LGD_BUYERPHONE.trim());
				System.out.println(" ::: LGD_DELIVERYINFO ::: " + LGD_DELIVERYINFO.trim());
				System.out.println(" ::: LGD_BUYERADDRESS ::: " + LGD_BUYERADDRESS.trim());
				System.out.println(" ::: LGD_PAYTYPE ::: " + LGD_PAYTYPE.trim());
				System.out.println(" ::: LGD_TID ::: " + LGD_TID.trim());
				System.out.println(" ::: LGD_RECEIVERPHONE ::: " + LGD_RECEIVERPHONE.trim());
				System.out.println(" ::: LGD_FINANCECODE ::: " + LGD_FINANCECODE.trim());
				System.out.println(" ::: LGD_FINANCENAME ::: " + LGD_FINANCENAME.trim());
				System.out.println(" ::: LGD_ACCOUNTNUM ::: " + LGD_ACCOUNTNUM.trim());
				System.out.println(" ::: LGD_PAYER ::: " + LGD_PAYER.trim());
				System.out.println(" ::: LGD_CASFLAG ::: " + LGD_CASFLAG.trim());
				*/
                /*
                 * 무통장 할당 성공 결과 상점 처리(DB) 부분
                 * 상점 결과 처리가 정상이면 "OK"
                 */    

				//String sql = "update base_order_tb set ORDER_PAY_VBANK_CD = ?, ORDER_PAY_VBANK_NM = ?, ORDER_PAY_VBANK_NUMBER = ?, ORDER_PAY_VBANK_USER = ?, ORDER_PAY_STAT = ? where ORDER_ID = ? ";
				String sql1 = "insert into base_order_virtual_tb (ORDER_ID, BANK_CD, BANK_NM, BANK_NUM, BANK_USER, BANK_PAY_STAT) values (?,?,?,?,?,?) ";
				pstmt1 = conn.prepareStatement(sql1);
				pstmt1.setString(1,LGD_OID);
				pstmt1.setString(2,LGD_FINANCECODE);
				pstmt1.setString(3,LGD_FINANCENAME);
				pstmt1.setString(4,LGD_ACCOUNTNUM);
				pstmt1.setString(5,LGD_PAYER);
				pstmt1.setString(6,LGD_CASFLAG);
				pstmt1.executeUpdate();  

				/*
				String sql2 = "insert into base_order_virtual_tb (ORDER_ID, BANK_CD, BANK_NM, BANK_NUM, BANK_USER, BANK_PAY_STAT) values (?,?,?,?,?,?) ";
				pstmt2 = conn.prepareStatement(sql2);
				pstmt2.setString(1,LGD_OID);
				pstmt2.setString(2,LGD_FINANCECODE);
				pstmt2.setString(3,LGD_FINANCENAME);
				pstmt2.setString(4,LGD_ACCOUNTNUM);
				pstmt2.setString(5,LGD_PAYER);
				pstmt2.setString(6,LGD_CASFLAG);
				pstmt2.executeUpdate();  
				*/
				
				resultMSG = "OK";

                //if( 무통장 할당 성공 상점처리결과 성공 ) 
                //resultMSG = "OK";
    			
        	}else if( "I".equals( LGD_CASFLAG.trim() ) ) {
 	            /*
    	         * 무통장 입금 성공 결과 상점 처리(DB) 부분
        	     * 상점 결과 처리가 정상이면 "OK"
            	 */    
				
				String sql21 = "update base_order_tb set ORDER_ST = 'PAYMENT', ORDER_PAY_STAT = ? where ORDER_ID = ? ";
				pstmt = conn.prepareStatement(sql21);
				pstmt.setString(1,LGD_CASFLAG);
				pstmt.setString(2,LGD_OID);
				pstmt.executeUpdate();  


				String sql22 = "update base_order_prod_detail_tb set OD_ORDER_STAT = 'PAYMENT' where OD_ORDER_ID = ? ";
				pstmt2 = conn.prepareStatement(sql22);
				pstmt2.setString(1,LGD_OID);
				pstmt2.executeUpdate();  
				
				String sql23 = "insert into base_order_virtual_tb (ORDER_ID, BANK_CD, BANK_NM, BANK_NUM, BANK_USER, BANK_PAY_STAT) values (?,?,?,?,?,?) ";
				pstmt3 = conn.prepareStatement(sql23);
				pstmt3.setString(1,LGD_OID);
				pstmt3.setString(2,LGD_FINANCECODE);
				pstmt3.setString(3,LGD_FINANCENAME);
				pstmt3.setString(4,LGD_ACCOUNTNUM);
				pstmt3.setString(5,LGD_PAYER);
				pstmt3.setString(6,LGD_CASFLAG);
				pstmt3.executeUpdate();  
				
				resultMSG = "OK";
					
        	}else if( "C".equals( LGD_CASFLAG.trim() ) ) {
 	            /*
    	         * 무통장 입금취소 성공 결과 상점 처리(DB) 부분
        	     * 상점 결과 처리가 정상이면 "OK"
            	 */    
            	//if( 무통장 입금취소 성공 상점처리결과 성공 ) 
            	//resultMSG = "OK";
				
				String sql31 = "update base_order_tb set ORDER_ST = 'CANCEL', ORDER_PAY_STAT = ? where ORDER_ID = ? ";
				pstmt = conn.prepareStatement(sql31);
				pstmt.setString(1,LGD_CASFLAG);
				pstmt.setString(2,LGD_OID);
				pstmt.executeUpdate();  
				

				String sql32 = "update base_order_prod_detail_tb set OD_ORDER_STAT = 'CANCEL' where OD_ORDER_ID = ? ";
				pstmt2 = conn.prepareStatement(sql32);
				pstmt2.setString(1,LGD_OID);
				pstmt2.executeUpdate();  
				
				String sql33 = "insert into base_order_virtual_tb (ORDER_ID, BANK_CD, BANK_NM, BANK_NUM, BANK_USER, BANK_PAY_STAT) values (?,?,?,?,?,?) ";
				pstmt3 = conn.prepareStatement(sql33);
				pstmt3.setString(1,LGD_OID);
				pstmt3.setString(2,LGD_FINANCECODE);
				pstmt3.setString(3,LGD_FINANCENAME);
				pstmt3.setString(4,LGD_ACCOUNTNUM);
				pstmt3.setString(5,LGD_PAYER);
				pstmt3.setString(6,LGD_CASFLAG);
				pstmt3.executeUpdate();  
				
				resultMSG = "OK";
					
				//if( 무통장 입금 성공 상점처리결과 성공 ) 
            	//resultMSG = "OK";


        	}
        	
			conn.close();

        } else { //결제가 실패이면
            /*
             * 거래실패 결과 상점 처리(DB) 부분
             * 상점결과 처리가 정상이면 "OK"
             */  
           //if( 결제실패 상점처리결과 성공 ) 
        	   resultMSG = "OK";     
        }
    } else { //해쉬값이 검증이 실패이면
        /*
         * hashdata검증 실패 로그를 처리하시기 바랍니다. 
         */      
        resultMSG = "결제결과 상점 DB처리(LGD_CASNOTEURL) 해쉬값 검증이 실패하였습니다.";     
    }
    
    out.println(resultMSG.toString());    
%>
 
