<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<form method="post" action="https://www.scmtour.com/PG/CasNoteUrl.do">
<!-- <form method="post" action="http://221.145.201.124:8888/PG/CasNoteUrl.do"> -->
<input name="CST_PLATFORM" type="text" value="test" />
<input name="LGD_RESPCODE" type="text" value="0000" />
<input name="LGD_MID" type="text" value="sctong" />
<input name="LGD_OID" type="text" value="P123456789123" />
<input name="LGD_AMOUNT" type="text" value="10000" />
<input name="LGD_TID" type="text" value="tidtidtidtied" />
<input name="LGD_PAYTYPE" type="text" value="0000" />
<input name="LGD_HASHDATA" type="text" value="73fca3347aa0b7700bc5f15acdf4fcf5" />
<input name="LGD_FINANCECODE" type="text" value="012" />
<input name="LGD_FINANCENAME" type="text" value="하나" />
<input name="LGD_ESCROWYN" type="text" value="N" />
<input name="LGD_ACCOUNTNUM" type="text" value="0000" />
<input name="LGD_CASTAMOUNT" type="text" value="0000" />
<input name="LGD_CASCAMOUNT" type="text" value="0000" />
<input name="LGD_CASFLAG" type="text" value="R" />
<input name="LGD_CASSEQNO" type="text" value="0000" />
<input name="LGD_CASHRECEIPTNUM" type="text" value="0000" />
<input name="LGD_CASHRECEIPTSELFYN" type="text" value="0000" />
<input name="LGD_CASHRECEIPTKIND" type="text" value="0000" />
<input name="LGD_PAYER" type="text" value="0000" />
<input name="LGD_BUYER" type="text" value="0000" />
<input name="LGD_PRODUCTINFO" type="text" value="0000" />
<input name="LGD_BUYERADDRESS" type="text" value="0000" />
<input name="LGD_BUYERPHONE" type="text" value="0000" />
<input name="LGD_BUYEREMAIL" type="text" value="0000" />
<input name="LGD_BUYERSSN" type="text" value="0000" />
<input name="LGD_PRODUCTCODE" type="text" value="0000" />
<input name="LGD_RECEIVER" type="text" value="0000" />
<input name="LGD_RECEIVERPHONE" type="text" value="0000" />
<input name="LGD_DELIVERYINFO" type="text" value="0000" />
<input name="LGD_TIMESTAMP" type="text" value="1234567890" />
<br><br>
<input type="submit" value=" test "/>

</form>

<script src="/js/jquery-3.3.1.min.js"></script>
<script>
function gogogo() {
	$.ajax({
		type:"post",
		url : "https://www.scmtour.com/PG/CasNoteUrl.do", 
		//url : "http://221.145.201.124:8888/PG/CasNoteUrl.do", 
		dataType: 'text',
		//dataType: 'json',
		data : { CST_PLATFORM:"test",LGD_RESPCODE:"0000", LGD_MID:"sctong",LGD_OID:"P123456789123", LGD_CASFLAG:"R", LGD_AMOUNT:"10000", LGD_TIMESTAMP:"1234567890", LGD_HASHDATA:"73fca3347aa0b7700bc5f15acdf4fcf5"},
		async: true,
		success: function(res) {
			console.log(res);
		}
	});
}
</script>
<input type="button" value=" ajax_test " onclick="gogogo();"/>