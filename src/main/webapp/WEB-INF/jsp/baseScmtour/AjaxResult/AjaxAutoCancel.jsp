<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<script src="/js/jquery-3.3.1.min.js"></script>
<script>
var cancel_order_id = new Array();
var cancel_order_tid = new Array();
var cancel_order_price = new Array();
</script>
<c:if test="${not empty cancelReserveList}">
<c:forEach var="cancelReserveList" items="${cancelReserveList}" varStatus="status">
	<script>
		cancel_order_id.push('<c:out value="${cancelReserveList.order_id }"/>');
		cancel_order_tid.push('<c:out value="${cancelReserveList.order_pay_cd}"/>');
		cancel_order_price.push('<c:out value="${cancelReserveList.order_total_price }"/>');
	</script>
</c:forEach>
</c:if>

<script>
for(i=0; i<cancel_order_id.length; i++) {
	//console.log(cancel_order_id[i]);
	var order_id = cancel_order_id[i];
	var autnNum = cancel_order_tid[i];
	var cprice = cancel_order_price[i];
	$.ajax({
		type:"post",
		url : "/admgr/admgrOrder/orderCancelPGAuto.do", 
		dataType: 'text',
		//dataType: 'json',
		data : { autnNum:autnNum, cprice:cprice  },
		async: false,
		success: function(res) {
			res = $.trim(res);
			res = res.replace(/\n/g,"");
			res = res.replace(/\r/g,"");
			if(res == "S") {
				//alert("PG사로의 요청이 정상적으로 처리되었습니다.");
				//return true;
				// 실제db 캔슬처피
				$.ajax({
					type:"post",
					url : "/Api/orderCancelDB.do", 
					dataType: 'text',
					//dataType: 'json',
					data : { order_id: order_id },
					async: false,
					success: function(res) {
						console.log(order_id + " : 삭제");
					}
				});
			} else {
				//alert("PG사 처리가 실패하였습니다. 다시 시도하여 주세요.");
				//return false;
				console.log(order_id + " : "+res);
			}
		}
	});
}
</script>