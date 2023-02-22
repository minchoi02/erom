<%@ page import="java.util.*" %>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:if test="${isMobile eq '0' }">
<%
request.setCharacterEncoding("utf-8");

String LGD_RESPCODE = request.getParameter("LGD_RESPCODE");
String LGD_RESPMSG 	= request.getParameter("LGD_RESPMSG");

Map payReqMap = request.getParameterMap();
%>
<html>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" type="text/css" href="/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="/css/jquery-ui.css">
<link rel="stylesheet" type="text/css" href="/css/fontawesome-all.min.css">
<link rel="stylesheet" type="text/css" href="/css/baseScmtour/base.css" />
<link rel="stylesheet" type="text/css" href="/css/baseScmtour/default.css" />
<script src="/js/jquery-3.3.1.min.js"></script>
<script src="/js/jquery-ui.min.js"></script>
<script src="/js/jquery.easing.1.3.js"></script>
<script src="/js/bootstrap.min.js"></script>
<head>
	<script type="text/javascript">

		function setLGDResult() {
			if(opener) {
				opener.parent.payment_return();
			} else {
				parent.payment_return();
			}
			try {
			} catch (e) {
				alert(e.message);
			}
			
		}

		
	</script>
</head>
<div class="loading" >
	<div class="loadingico"><i class="fad fa-spinner fa-spin"></i></div>
</div>
<body onload="setLGDResult()">
<%-- <p><h1>RETURN_URL (인증결과)</h1></p>
<div>
<p>LGD_RESPCODE (결과코드) : <%= LGD_RESPCODE %></p>
<p>LGD_RESPMSG (결과메시지): <%= LGD_RESPMSG %></p> --%>

	<form method="post" name="LGD_RETURNINFO" id="LGD_RETURNINFO">
	<%
	for (Iterator i = payReqMap.keySet().iterator(); i.hasNext();) {
		Object key = i.next();
		if (payReqMap.get(key) instanceof String[]) {
			String[] valueArr = (String[])payReqMap.get(key);
			for(int k = 0; k < valueArr.length; k++)
				out.println("<input type='hidden' name='" + key + "' id='"+key+"'value='" + valueArr[k] + "'/>");
		} else {
			String value = payReqMap.get(key) == null ? "" : (String) payReqMap.get(key);
			out.println("<input type='hidden' name='" + key + "' id='"+key+"'value='" + value + "'/>");
		}
	}
	%>
	</form>
</body>
</html>
</c:if>

<c:if test="${isMobile eq '1' }">
<%
	HashMap payReqMap = (HashMap)session.getAttribute("PAYREQ_MAP");//결제 요청시, Session에 저장했던 파라미터 MAP 

/*
  payreq_crossplatform.jsp 에서 세션에 저장했던 파라미터 값이 유효한지 체크 
  세션 유지 시간(로그인 유지시간)을 적당히 유지 하거나 세션을 사용하지 않는 경우 DB처리 하시기 바랍니다.
*/
	if(payReqMap == null) 
	{
		out.println("세션이 만료 되었거나 유효하지 않은 요청 입니다.");
		return;
	}
%>
<html>
<head>
	<script type="text/javascript">
		function setLGDResult() {
			document.getElementById('LGD_PAYINFO').submit();
		}
		
	</script>
</head>
<body onload="setLGDResult()">
<% 
String LGD_RESPCODE = request.getParameter("LGD_RESPCODE");
String LGD_RESPMSG 	= request.getParameter("LGD_RESPMSG");
String LGD_PAYKEY	= "";

if("0000".equals(LGD_RESPCODE)){
	LGD_PAYKEY = request.getParameter("LGD_PAYKEY");
	payReqMap.put("LGD_RESPCODE"	, LGD_RESPCODE);
	payReqMap.put("LGD_RESPMSG"		, LGD_RESPMSG);
	payReqMap.put("LGD_PAYKEY"		, LGD_PAYKEY);

%><form method="post" name="LGD_PAYINFO" id="LGD_PAYINFO" action="/PG/PayRes.do"><%		
	for(Iterator i = payReqMap.keySet().iterator(); i.hasNext();){
		Object key = i.next();
		out.println("<input type='hidden' name='" + key + "' value='" + payReqMap.get(key) + "'>" );
	}
%></form><%
}
else{
	out.println("LGD_RESPCODE:" + LGD_RESPCODE + " ,LGD_RESPMSG:" + LGD_RESPMSG); //인증 실패에 대한 처리 로직 추가
}
%>
</body>
</html>
</c:if>