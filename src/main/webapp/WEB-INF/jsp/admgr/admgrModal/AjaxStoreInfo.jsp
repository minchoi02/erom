<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:if test="${store_category eq 'CD002001' }">
	<input type="hidden" id="def_prod_info_1" value="<c:out value="${storeInfoAjax.store_info1_1}"/>" />
	<input type="hidden" id="def_prod_info_2" value="<c:out value="${storeInfoAjax.store_info1_2}"/>"  />
	<input type="hidden" id="def_prod_info_3" value="<c:out value="${storeInfoAjax.store_info1_3}"/>"  />
	<input type="hidden" id="def_prod_info_4" value="<c:out value="${storeInfoAjax.store_info1_4}"/>"  />
	<input type="hidden" id="def_prod_info_5" value="<c:out value="${storeInfoAjax.store_info1_5}"/>"  />
</c:if>
<c:if test="${store_category eq 'CD002002' }">
	<input type="hidden" id="def_prod_info_1" value="<c:out value="${storeInfoAjax.store_info2_1}"/>" />
	<input type="hidden" id="def_prod_info_2" value="<c:out value="${storeInfoAjax.store_info2_2}"/>"  />
	<input type="hidden" id="def_prod_info_3" value="<c:out value="${storeInfoAjax.store_info2_3}"/>"  />
	<input type="hidden" id="def_prod_info_4" value="<c:out value="${storeInfoAjax.store_info2_4}"/>"  />
	<input type="hidden" id="def_prod_info_5" value="<c:out value="${storeInfoAjax.store_info2_5}"/>"  />
	<input type="hidden" id="def_prod_info_6" value="<c:out value="${storeInfoAjax.store_info2_6}"/>"  />
	<input type="hidden" id="def_prod_info_7" value="<c:out value="${storeInfoAjax.store_info2_7}"/>"  />
</c:if>
<c:if test="${store_category eq 'CD002003' }">
	<input type="hidden" id="def_prod_info_1" value="<c:out value="${storeInfoAjax.store_info3_1}"/>" />
	<input type="hidden" id="def_prod_info_2" value="<c:out value="${storeInfoAjax.store_info3_2}"/>"  />
	<input type="hidden" id="def_prod_info_3" value="<c:out value="${storeInfoAjax.store_info3_3}"/>"  />
	<input type="hidden" id="def_prod_info_4" value="<c:out value="${storeInfoAjax.store_info3_4}"/>"  />
	<input type="hidden" id="def_prod_info_5" value="<c:out value="${storeInfoAjax.store_info3_5}"/>"  />
	<input type="hidden" id="def_prod_info_6" value="<c:out value="${storeInfoAjax.store_info3_6}"/>"  />
	<input type="hidden" id="def_prod_info_7" value="<c:out value="${storeInfoAjax.store_info3_7}"/>"  />
	<input type="hidden" id="def_prod_info_8" value="<c:out value="${storeInfoAjax.store_info3_8}"/>"  />
	<input type="hidden" id="def_prod_info_9" value="<c:out value="${storeInfoAjax.store_info3_9}"/>"  />
	<input type="hidden" id="def_prod_info_10" value="<c:out value="${storeInfoAjax.store_info3_10}"/>"  />
</c:if>
<c:if test="${store_category eq 'CD002004' }">
	<input type="hidden" id="def_prod_info1_1" value="<c:out value="${storeInfoAjax.store_info3_1}"/>" />
	<input type="hidden" id="def_prod_info1_2" value="<c:out value="${storeInfoAjax.store_info3_2}"/>"  />
	<input type="hidden" id="def_prod_info1_3" value="<c:out value="${storeInfoAjax.store_info3_3}"/>"  />
	<input type="hidden" id="def_prod_info1_4" value="<c:out value="${storeInfoAjax.store_info3_4}"/>"  />
	<input type="hidden" id="def_prod_info1_5" value="<c:out value="${storeInfoAjax.store_info3_5}"/>"  />
	<input type="hidden" id="def_prod_info1_6" value="<c:out value="${storeInfoAjax.store_info3_6}"/>"  />
	<input type="hidden" id="def_prod_info1_7" value="<c:out value="${storeInfoAjax.store_info3_7}"/>"  />
	<%-- <input type="hidden" id="def_prod_info1_8" value="<c:out value="${storeInfoAjax.store_info3_8}"/>"  />
	<input type="hidden" id="def_prod_info1_9" value="<c:out value="${storeInfoAjax.store_info3_9}"/>"  />
	<input type="hidden" id="def_prod_info1_10" value="<c:out value="${storeInfoAjax.store_info3_10}"/>"  />
	<input type="hidden" id="def_prod_info1_11" value="<c:out value="${storeInfoAjax.store_info3_11}"/>"  />
	
	<input type="hidden" id="def_prod_info2_1" value="<c:out value="${storeInfoAjax.store_info5_1}"/>" />
	<input type="hidden" id="def_prod_info2_2" value="<c:out value="${storeInfoAjax.store_info5_2}"/>"  />
	 --%><input type="hidden" id="def_prod_info2_3" value="<c:out value="${storeInfoAjax.store_info5_3}"/>"  />
	<input type="hidden" id="def_prod_info2_4" value="<c:out value="${storeInfoAjax.store_info5_4}"/>"  />
	<input type="hidden" id="def_prod_info2_5" value="<c:out value="${storeInfoAjax.store_info5_5}"/>"  />
	<input type="hidden" id="def_prod_info2_6" value="<c:out value="${storeInfoAjax.store_info5_6}"/>"  />
	<input type="hidden" id="def_prod_info2_7" value="<c:out value="${storeInfoAjax.store_info5_7}"/>"  />
	<input type="hidden" id="def_prod_info2_8" value="<c:out value="${storeInfoAjax.store_info5_8}"/>"  />
	<input type="hidden" id="def_prod_info2_9" value="<c:out value="${storeInfoAjax.store_info5_9}"/>"  />
	<input type="hidden" id="def_prod_info2_10" value="<c:out value="${storeInfoAjax.store_info5_10}"/>"  />

	<input type="hidden" id="def_prod_info3_1" value="<c:out value="${storeInfoAjax.store_info6_1}"/>" />
	<input type="hidden" id="def_prod_info3_2" value="<c:out value="${storeInfoAjax.store_info6_2}"/>"  />
	<input type="hidden" id="def_prod_info3_3" value="<c:out value="${storeInfoAjax.store_info6_3}"/>"  />
	<input type="hidden" id="def_prod_info3_4" value="<c:out value="${storeInfoAjax.store_info6_4}"/>"  />
	<input type="hidden" id="def_prod_info3_5" value="<c:out value="${storeInfoAjax.store_info6_5}"/>"  />
	<input type="hidden" id="def_prod_info3_6" value="<c:out value="${storeInfoAjax.store_info6_6}"/>"  />
	<input type="hidden" id="def_prod_info3_7" value="<c:out value="${storeInfoAjax.store_info6_7}"/>"  />
	<input type="hidden" id="def_prod_info3_8" value="<c:out value="${storeInfoAjax.store_info6_8}"/>"  />
	<input type="hidden" id="def_prod_info3_9" value="<c:out value="${storeInfoAjax.store_info6_9}"/>"  />
	<input type="hidden" id="def_prod_info3_10" value="<c:out value="${storeInfoAjax.store_info6_10}"/>"  />
	<input type="hidden" id="def_prod_info3_11" value="<c:out value="${storeInfoAjax.store_info6_11}"/>"  />
	<input type="hidden" id="def_prod_info3_12" value="<c:out value="${storeInfoAjax.store_info6_12}"/>"  />
	<input type="hidden" id="def_prod_info3_13" value="<c:out value="${storeInfoAjax.store_info6_13}"/>"  />

	<input type="hidden" id="def_prod_info4_1" value="<c:out value="${storeInfoAjax.store_info7_1}"/>" />
	<input type="hidden" id="def_prod_info4_2" value="<c:out value="${storeInfoAjax.store_info7_2}"/>"  />
	<input type="hidden" id="def_prod_info4_3" value="<c:out value="${storeInfoAjax.store_info7_3}"/>"  />
	<input type="hidden" id="def_prod_info4_4" value="<c:out value="${storeInfoAjax.store_info7_4}"/>"  />
	<input type="hidden" id="def_prod_info4_5" value="<c:out value="${storeInfoAjax.store_info7_5}"/>"  />
	<input type="hidden" id="def_prod_info4_6" value="<c:out value="${storeInfoAjax.store_info7_6}"/>"  />
	<input type="hidden" id="def_prod_info4_7" value="<c:out value="${storeInfoAjax.store_info7_7}"/>"  />
	<input type="hidden" id="def_prod_info4_8" value="<c:out value="${storeInfoAjax.store_info7_8}"/>"  />
	<input type="hidden" id="def_prod_info4_9" value="<c:out value="${storeInfoAjax.store_info7_9}"/>"  />
	<input type="hidden" id="def_prod_info4_10" value="<c:out value="${storeInfoAjax.store_info7_10}"/>"  />
	<input type="hidden" id="def_prod_info4_11" value="<c:out value="${storeInfoAjax.store_info7_11}"/>"  />

	<input type="hidden" id="def_prod_info5_1" value="<c:out value="${storeInfoAjax.store_info8_1}"/>" />
	<input type="hidden" id="def_prod_info5_2" value="<c:out value="${storeInfoAjax.store_info8_2}"/>"  />
	<input type="hidden" id="def_prod_info5_3" value="<c:out value="${storeInfoAjax.store_info8_3}"/>"  />
	<input type="hidden" id="def_prod_info5_4" value="<c:out value="${storeInfoAjax.store_info8_4}"/>"  />
	<input type="hidden" id="def_prod_info5_5" value="<c:out value="${storeInfoAjax.store_info8_5}"/>"  />
</c:if>

<textarea id="def_prod_trade_info_1" style="display: none;"><c:out value="${storeInfoAjax.store_info_1}"/></textarea>
<textarea id="def_prod_trade_info_2" style="display: none;"><c:out value="${storeInfoAjax.store_info_2}"/></textarea>
<textarea id="def_prod_trade_info_3" style="display: none;"><c:out value="${storeInfoAjax.store_info_3}"/></textarea>
<textarea id="def_prod_trade_info_4" style="display: none;"><c:out value="${storeInfoAjax.store_info_4}"/></textarea>
<textarea id="def_prod_trade_info_5" style="display: none;"><c:out value="${storeInfoAjax.store_info_5}"/></textarea>