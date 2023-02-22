<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:import url="/Api/IncludeTopSub.do"/>

<style>
.header-title { font-size: 15px; font-weight: bold; text-align: center; padding: 10px; margin-bottom: 30px; border: solid 1px #aaa; background: #f06828; color: #fff; border-radius: 15px; }
</style>
<div id="transfer_result">
	<div class="panel-body">
        <div class="col-md-12 header-title" >서천 e끌림 배송조회</div>
        <div class="col-md-12">
            <div class="form-group row">
                <label for="invoice" class="col-xs-4 label-style">운송장번호</label>
                <div class="col-xs-8 info-style" id="t_num">-</div>
            </div>
            <div class="form-group row">
                <label for="to" class="col-xs-4 label-style">받는 사람</label>
                <div class="col-xs-8 info-style"  id="r_nm">-</div>
            </div>
            <div class="form-group row">
                <label for="from" class="col-xs-4 label-style">보낸 사람</label>
                <div class="col-xs-8 info-style" id="s_nm">-</div>
            </div>
            <div class="form-group row">
                <label for="adress" class="col-xs-4 label-style">수령 주소</label>
                <div class="col-xs-8 info-style" id="r_addr">-</div>
            </div>
        </div>
    </div>

    <div class="col-sm-12">
        <table class="table table-striped">
            <thead>
            <tr>
                <th>시간</th>
                <th>현재 위치</th>
                <th>배송 상태</th>
            </tr>
            </thead>
            <tbody id="tracking">
            
            </tbody>
        </table>
    </div>
</div>

<script>
var tkey = "<c:out value="${tkey}"/>";
var tcode = "<c:out value="${tcode}"/>";
var tnum = "<c:out value="${tnum}"/>";

$.ajax({
	type:"get",
	url : "https://info.sweettracker.co.kr/api/v1/trackingInfo", 
	//dataType: 'text',
	dataType: 'json',
	data : { t_key : tkey, t_code : tcode, t_invoice : tnum },
	async: true,
	success: function(res) {
		
		var code = res.code;
		var msg = res.msg;

		if(code == "104") {
			alert(msg);
			self.window.close();
			return false;
		}
		if(code == "105") {
			alert(msg);
			self.window.close();
			return false;
		}
		
		var sender_nm = res.senderName;
		var receiver_nm = res.receiverName;
		var itemnm = res.itemName;
		var t_num = res.invoiceNo;
		var receiver_addr = res.receiverAddr;
		var tracking = res.trackingDetails;
		
		$("#t_num").text(t_num);
		$("#r_nm").text(receiver_nm);
		$("#s_nm").text(sender_nm);
		$("#r_addr").text(receiver_addr);
		
		htmlcode = "";
		if(tracking.length == 0) {
			htmlcode += "<tr><td colspan='3'>트래킹정보가 없습니다.</td></tr>";
		} else {
			for(i=0; i<tracking.length; i++) {
				var t_date = tracking[i].timeString;
				var t_where = tracking[i].where;
				var t_kind= tracking[i].kind;
				htmlcode += "<tr><td>"+t_date+"</td><td>"+t_where+"</td><td>"+t_kind+"</td></tr>";
			}
		}
		$("#tracking").html(htmlcode);
		
	}
});

</script>