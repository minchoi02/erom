<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:import url="/Api/admgrIncludeTop.do"/>
<c:import url="/Api/admgrIncludeLeftMenu.do"/>
<% 
response.setHeader("Cache-Control", "no-cache");
response.setHeader("Pragma", "no-cache");
response.setHeader("Expires", "0");
%>
		<!-- 콘텐츠 영역 { -->
		<div id="content">
			<h1 class="bigTit">문자템플릿 관리</h1>
			<div class="pageComment">
				<div class="comment_ico"><i class="fad fa-comment-alt-smile"></i></div>
				<p>
					문자발송용 템플릿을 관리합니다.
					<br>
					센터에서 받을 수신번호는 메인메뉴 > 환경설정 에서 가능합니다.
					<br>
					지정된 {템플릿}외 적용이 불가하며, HTML태그사용이 제한됩니다.
					모든 문자의 서두에  "[이롬 스토어]" 가 자동으로 붙습니다.
				</p>
			</div>
			
			<!-- 부가기능 > 푸시관리 { -->
			<section id="pushState" class="page_content floats">
                <!-- 푸시 리스트 { -->
                <table class="admin_tbl admin_list_tbl mgt10px">
                    <caption>문자 리스트</caption>
                    <colgroup>
                        <col width="100" />
                        <col />
                        <col />
                        <col />
                    </colgroup>
                    <thead>
                        <tr>
                            <th>상태</th>
                            <th>회원</th>
                            <th>상점</th>
                            <th>센터</th>
                        </tr>
                    </thead>
                    <tbody>
                    	
                    	<form method="post" action="/admgr/admgrSystem/smsTemplateAction.do">
                    	<input type="hidden" name="sms_cd" value="ORDER"/>
                         <tr>
                            <th class="alignCenter">미결제 주문<br><br><button type="submit" class="btns bluebtn h24px">수정</button></th>
                            <td>
                                <p><input type="checkbox" value="Y" id="check_<c:out value="${smsListOrder.sms_seq}"/>_user" name="sms_use_user" class="admin_check" <c:if test="${smsListOrder.sms_use_user eq 'Y'}">checked</c:if> ><label for="check_<c:out value="${smsListOrder.sms_seq}"/>_user">사용</label></p>
                                <textarea name="sms_content_user" id="" class="w100 mgt10px admin_textarea" cols="30" rows="5" ><c:out value="${smsListOrder.sms_content_user}"/></textarea>
                                <p class="mgt10px">{주문번호},{결제대기시간}</p>
                            </td>
                            <td class="no_zoneX">
                                <%-- <p><input type="checkbox" value="Y" id="check_<c:out value="${smsListOrder.sms_seq}"/>_store" name="sms_use_store" class="admin_check" <c:if test="${smsListOrder.sms_use_store eq 'Y'}">checked</c:if> ><label for="check_<c:out value="${smsListOrder.sms_seq}"/>_store">사용</label></p>
                                <textarea name="sms_content_store" id="" class="w100 mgt10px admin_textarea" cols="30" rows="5" ><c:out value="${smsListOrder.sms_content_store}"/></textarea>
                                <p class="mgt10px">{주문번호}</p> --%>
                            </td>
                            <td>
                                <p><input type="checkbox" value="Y" id="check_<c:out value="${smsListOrder.sms_seq}"/>_center" name="sms_use_center" class="admin_check" <c:if test="${smsListOrder.sms_use_center eq 'Y'}">checked</c:if> ><label for="check_<c:out value="${smsListOrder.sms_seq}"/>_center">사용</label></p>
                                <textarea name="sms_content_center" id="" class="w100 mgt10px admin_textarea" cols="30" rows="5" ><c:out value="${smsListOrder.sms_content_center}"/></textarea>
                                <p class="mgt10px">{주문번호},{결제대기시간}</p>
                            </td>
                        </tr>
                        </form>
                        
                        <form method="post" action="/admgr/admgrSystem/smsTemplateAction.do">
                    	<input type="hidden" name="sms_cd" value="CANCELAUTO"/>
                         <tr>
                            <th class="alignCenter">주문취소 <br><br><button type="submit" class="btns bluebtn h24px">수정</button></th>
                            <td>
                                <p><input type="checkbox" value="Y" id="check_<c:out value="${smsListCancelAuto.sms_seq}"/>_user" name="sms_use_user" class="admin_check" <c:if test="${smsListCancelAuto.sms_use_user eq 'Y'}">checked</c:if> ><label for="check_<c:out value="${smsListCancelAuto.sms_seq}"/>_user">사용</label></p>
                                <textarea name="sms_content_user" id="" class="w100 mgt10px admin_textarea" cols="30" rows="5" ><c:out value="${smsListCancelAuto.sms_content_user}"/></textarea>
                                <p class="mgt10px">{주문번호}</p>
                            </td>
                            <td class="no_zoneX">
                                <%-- <p><input type="checkbox" value="Y" id="check_<c:out value="${smsListCancelAuto.sms_seq}"/>_store" name="sms_use_store" class="admin_check" <c:if test="${smsListCancelAuto.sms_use_store eq 'Y'}">checked</c:if> ><label for="check_<c:out value="${smsListCancelAuto.sms_seq}"/>_store">사용</label></p>
                                <textarea name="sms_content_store" id="" class="w100 mgt10px admin_textarea" cols="30" rows="5" ><c:out value="${smsListCancelAuto.sms_content_store}"/></textarea>
                                <p class="mgt10px">{주문번호},{결제대기시간}</p> --%>
                            </td>
                            <td>
                                <p><input type="checkbox" value="Y" id="check_<c:out value="${smsListCancelAuto.sms_seq}"/>_center" name="sms_use_center" class="admin_check" <c:if test="${smsListCancelAuto.sms_use_center eq 'Y'}">checked</c:if> ><label for="check_<c:out value="${smsListCancelAuto.sms_seq}"/>_center">사용</label></p>
                                <textarea name="sms_content_center" id="" class="w100 mgt10px admin_textarea" cols="30" rows="5" ><c:out value="${smsListCancelAuto.sms_content_center}"/></textarea>
                                <p class="mgt10px">{주문번호}</p>
                            </td>
                        </tr>
                        </form>
                        
                    	<form method="post" action="/admgr/admgrSystem/smsTemplateAction.do">
                    	<input type="hidden" name="sms_cd" value="PAYMENT"/>
                         <tr>
                            <th class="alignCenter">결제완료 <br><br><button type="submit" class="btns bluebtn h24px">수정</button></th>
                            <td>
                                <p><input type="checkbox" value="Y" id="check_<c:out value="${smsListPayment.sms_seq}"/>_user" name="sms_use_user" class="admin_check" <c:if test="${smsListPayment.sms_use_user eq 'Y'}">checked</c:if> ><label for="check_<c:out value="${smsListPayment.sms_seq}"/>_user">사용</label></p>
                                <textarea name="sms_content_user" id="" class="w100 mgt10px admin_textarea" cols="30" rows="5" ><c:out value="${smsListPayment.sms_content_user}"/></textarea>
                                <p class="mgt10px">{주문번호},{결제대기시간}</p>
                            </td>
                            <td class="no_zoneX">
                                <%-- <p><input type="checkbox" value="Y" id="check_<c:out value="${smsListPayment.sms_seq}"/>_store" name="sms_use_store" class="admin_check" <c:if test="${smsListPayment.sms_use_store eq 'Y'}">checked</c:if> ><label for="check_<c:out value="${smsListPayment.sms_seq}"/>_store">사용</label></p>
                                <textarea name="sms_content_store" id="" class="w100 mgt10px admin_textarea" cols="30" rows="5" ><c:out value="${smsListPayment.sms_content_store}"/></textarea>
                                <p class="mgt10px">{주문번호}</p> --%>
                            </td>
                            <td>
                                <p><input type="checkbox" value="Y" id="check_<c:out value="${smsListPayment.sms_seq}"/>_center" name="sms_use_center" class="admin_check" <c:if test="${smsListPayment.sms_use_center eq 'Y'}">checked</c:if> ><label for="check_<c:out value="${smsListPayment.sms_seq}"/>_center">사용</label></p>
                                <textarea name="sms_content_center" id="" class="w100 mgt10px admin_textarea" cols="30" rows="5" ><c:out value="${smsListPayment.sms_content_center}"/></textarea>
                                <p class="mgt10px">{주문번호},{결제대기시간}</p>
                            </td>
                        </tr>
                        </form>
                        <%-- 
                        <form method="post" action="/admgr/admgrSystem/smsTemplateAction.do">
                    	<input type="hidden" name="sms_cd" value="PAYMENT001"/>
                         <tr>
                            <th class="alignCenter">결제완료<br> - <br>관광/체럼 <br><br><button type="submit" class="btns bluebtn h24px">수정</button></th>
                            <td class="no_zoneX">
                            --%>
                               <%--  <p><input type="checkbox" value="Y" id="check_<c:out value="${smsListPayment001.sms_seq}"/>_user" name="sms_use_user" class="admin_check" <c:if test="${smsListPayment001.sms_use_user eq 'Y'}">checked</c:if> ><label for="check_<c:out value="${smsListPayment001.sms_seq}"/>_user">사용</label></p>
                                <textarea name="sms_content_user" id="" class="w100 mgt10px admin_textarea" cols="30" rows="5" ><c:out value="${smsListPayment001.sms_content_user}"/></textarea>
                                 <p class="mgt10px">{주문번호},{예약일},{상품명}</p> --%>
                           <%-- 
                            </td>
                            <td>
                                <p><input type="checkbox" value="Y" id="check_<c:out value="${smsListPayment001.sms_seq}"/>_store" name="sms_use_store" class="admin_check" <c:if test="${smsListPayment001.sms_use_store eq 'Y'}">checked</c:if> ><label for="check_<c:out value="${smsListPayment001.sms_seq}"/>_store">사용</label></p>
                                <textarea name="sms_content_store" id="" class="w100 mgt10px admin_textarea" cols="30" rows="5" ><c:out value="${smsListPayment001.sms_content_store}"/></textarea>
                                <p class="mgt10px">{주문번호},{예약일},{상품명}</p>
                            </td>
                            <td class="no_zoneX">
                            --%>
                                <%-- <p><input type="checkbox" value="Y" id="check_<c:out value="${smsListPayment001.sms_seq}"/>_center" name="sms_use_center" class="admin_check" <c:if test="${smsListPayment001.sms_use_center eq 'Y'}">checked</c:if> ><label for="check_<c:out value="${smsListPayment001.sms_seq}"/>_center">사용</label></p>
                                <textarea name="sms_content_center" id="" class="w100 mgt10px admin_textarea" cols="30" rows="5" ><c:out value="${smsListPayment001.sms_content_center}"/></textarea>
                                 <p class="mgt10px">{주문번호},{예약일},{상품명}</p> --%>
                           <%-- 
                            </td>
                        </tr>
                        </form>
                        --%>
                        
                        <%-- 
                        <form method="post" action="/admgr/admgrSystem/smsTemplateAction.do">
                    	<input type="hidden" name="sms_cd" value="PAYMENT002"/>
                         <tr>
                            <th class="alignCenter">결제완료<br> - <br>숙박 <br><br><button type="submit" class="btns bluebtn h24px">수정</button></th>
                            <td class="no_zoneX">
                            --%>
                                <%-- <p><input type="checkbox" value="Y" id="check_<c:out value="${smsListPayment002.sms_seq}"/>_user" name="sms_use_user" class="admin_check" <c:if test="${smsListPayment002.sms_use_user eq 'Y'}">checked</c:if> ><label for="check_<c:out value="${smsListPayment002.sms_seq}"/>_user">사용</label></p>
                                <textarea name="sms_content_user" id="" class="w100 mgt10px admin_textarea" cols="30" rows="5" ><c:out value="${smsListPayment002.sms_content_user}"/></textarea>
                                <p class="mgt10px">{주문번호},{예약일},{상품명}</p> --%>
                            <%-- 
                            </td>
                            <td>
                                <p><input type="checkbox" value="Y" id="check_<c:out value="${smsListPayment002.sms_seq}"/>_store" name="sms_use_store" class="admin_check" <c:if test="${smsListPayment002.sms_use_store eq 'Y'}">checked</c:if> ><label for="check_<c:out value="${smsListPayment002.sms_seq}"/>_store">사용</label></p>
                                <textarea name="sms_content_store" id="" class="w100 mgt10px admin_textarea" cols="30" rows="5" ><c:out value="${smsListPayment002.sms_content_store}"/></textarea>
                                <p class="mgt10px">{주문번호},{예약일},{상품명}</p>
                            </td>
                            
                            <td class="no_zoneX">
                            --%>
                                <%-- <p><input type="checkbox" value="Y" id="check_<c:out value="${smsListPayment002.sms_seq}"/>_center" name="sms_use_center" class="admin_check" <c:if test="${smsListPayment002.sms_use_center eq 'Y'}">checked</c:if> ><label for="check_<c:out value="${smsListPayment002.sms_seq}"/>_center">사용</label></p>
                                <textarea name="sms_content_center" id="" class="w100 mgt10px admin_textarea" cols="30" rows="5" ><c:out value="${smsListPayment002.sms_content_center}"/></textarea>
                                <p class="mgt10px">{주문번호},{예약일},{상품명}</p> --%>
                            <%-- 
                            </td>
                        </tr>
                        </form>
                        --%>
                        <%-- 
                        <form method="post" action="/admgr/admgrSystem/smsTemplateAction.do">
                    	<input type="hidden" name="sms_cd" value="PAYMENT003"/>
                         <tr>
                            <th class="alignCenter">결제완료<br> - <br>맛집 <br><br><button type="submit" class="btns bluebtn h24px">수정</button></th>
                            <td class="no_zoneX">
                            --%>
                                <%-- <p><input type="checkbox" value="Y" id="check_<c:out value="${smsListPayment003.sms_seq}"/>_user" name="sms_use_user" class="admin_check" <c:if test="${smsListPayment003.sms_use_user eq 'Y'}">checked</c:if> ><label for="check_<c:out value="${smsListPayment003.sms_seq}"/>_user">사용</label></p>
                                <textarea name="sms_content_user" id="" class="w100 mgt10px admin_textarea" cols="30" rows="5" ><c:out value="${smsListPayment003.sms_content_user}"/></textarea>
                                <p class="mgt10px">{주문번호},{예약일},{상품명}</p> --%>
                            <%-- 
                            </td>
                            <td>
                                <p><input type="checkbox" value="Y" id="check_<c:out value="${smsListPayment003.sms_seq}"/>_store" name="sms_use_store" class="admin_check" <c:if test="${smsListPayment003.sms_use_store eq 'Y'}">checked</c:if> ><label for="check_<c:out value="${smsListPayment003.sms_seq}"/>_store">사용</label></p>
                                <textarea name="sms_content_store" id="" class="w100 mgt10px admin_textarea" cols="30" rows="5" ><c:out value="${smsListPayment003.sms_content_store}"/></textarea>
                                <p class="mgt10px">{주문번호},{예약일},{상품명}</p>
                            </td>
                            <td class="no_zoneX">
                            --%>
                                <%-- <p><input type="checkbox" value="Y" id="check_<c:out value="${smsListPayment003.sms_seq}"/>_center" name="sms_use_center" class="admin_check" <c:if test="${smsListPayment003.sms_use_center eq 'Y'}">checked</c:if> ><label for="check_<c:out value="${smsListPayment003.sms_seq}"/>_center">사용</label></p>
                                <textarea name="sms_content_center" id="" class="w100 mgt10px admin_textarea" cols="30" rows="5" ><c:out value="${smsListPayment003.sms_content_center}"/></textarea>
                                <p class="mgt10px">{주문번호},{예약일},{상품명}</p> --%>
                            <%-- 
                            </td>
                        </tr>
                        </form>
                        --%>
                        <form method="post" action="/admgr/admgrSystem/smsTemplateAction.do">
                    	<input type="hidden" name="sms_cd" value="PAYMENT004"/>
                         <tr>
                            <th class="alignCenter">결제완료<br> - <br>스토어 <br><br><button type="submit" class="btns bluebtn h24px">수정</button></th>
                            <td class="no_zoneX">
                                <%-- <p><input type="checkbox" value="Y" id="check_<c:out value="${smsListPayment004.sms_seq}"/>_user" name="sms_use_user" class="admin_check" <c:if test="${smsListPayment004.sms_use_user eq 'Y'}">checked</c:if> ><label for="check_<c:out value="${smsListPayment004.sms_seq}"/>_user">사용</label></p>
                                <textarea name="sms_content_user" id="" class="w100 mgt10px admin_textarea" cols="30" rows="5" ><c:out value="${smsListPayment004.sms_content_user}"/></textarea>
                                <p class="mgt10px">{주문번호},{상품명}</p> --%>
                            </td>
                            <td>
                                <p><input type="checkbox" value="Y" id="check_<c:out value="${smsListPayment004.sms_seq}"/>_store" name="sms_use_store" class="admin_check" <c:if test="${smsListPayment004.sms_use_store eq 'Y'}">checked</c:if> ><label for="check_<c:out value="${smsListPayment004.sms_seq}"/>_store">사용</label></p>
                                <textarea name="sms_content_store" id="" class="w100 mgt10px admin_textarea" cols="30" rows="5" ><c:out value="${smsListPayment004.sms_content_store}"/></textarea>
                                <p class="mgt10px">{주문번호},{상품명}</p>
                            </td>
                            <td class="no_zoneX">
                                <%-- <p><input type="checkbox" value="Y" id="check_<c:out value="${smsListPayment004.sms_seq}"/>_center" name="sms_use_center" class="admin_check" <c:if test="${smsListPayment004.sms_use_center eq 'Y'}">checked</c:if> ><label for="check_<c:out value="${smsListPayment004.sms_seq}"/>_center">사용</label></p>
                                <textarea name="sms_content_center" id="" class="w100 mgt10px admin_textarea" cols="30" rows="5" ><c:out value="${smsListPayment004.sms_content_center}"/></textarea>
                                <p class="mgt10px">{주문번호},{상품명}</p> --%>
                            </td>
                        </tr>
                        </form>

						<form method="post" action="/admgr/admgrSystem/smsTemplateAction.do">
                    	<input type="hidden" name="sms_cd" value="DELIVERY_START"/>
                         <tr>
                            <th class="alignCenter">배송안내<br> - <br>스토어 <br><br><button type="submit" class="btns bluebtn h24px">수정</button></th>
                            <td>
                                <p><input type="checkbox" value="Y" id="check_<c:out value="${smsListDeliveryStart.sms_seq}"/>_user" name="sms_use_user" class="admin_check" <c:if test="${smsListDeliveryStart.sms_use_user eq 'Y'}">checked</c:if> ><label for="check_<c:out value="${smsListDeliveryStart.sms_seq}"/>_user">사용</label></p>
                                <textarea name="sms_content_user" id="" class="w100 mgt10px admin_textarea" cols="30" rows="5" ><c:out value="${smsListDeliveryStart.sms_content_user}"/></textarea>
                                <p class="mgt10px">{주문번호},{상품명},{배송사},{송장번호}</p>
                            </td>
                            <td class="no_zoneX">
                                <%-- <p><input type="checkbox" value="Y" id="check_<c:out value="${smsListDeliveryStart.sms_seq}"/>_store" name="sms_use_store" class="admin_check" <c:if test="${smsListDeliveryStart.sms_use_store eq 'Y'}">checked</c:if> ><label for="check_<c:out value="${smsListDeliveryStart.sms_seq}"/>_store">사용</label></p>
                                <textarea name="sms_content_store" id="" class="w100 mgt10px admin_textarea" cols="30" rows="5" ><c:out value="${smsListDeliveryStart.sms_content_store}"/></textarea>
                                <p class="mgt10px">{주문번호},{상품명},{배송사},{송장번호}</p> --%>
                            </td>
                            <td>
                                <p><input type="checkbox" value="Y" id="check_<c:out value="${smsListDeliveryStart.sms_seq}"/>_center" name="sms_use_center" class="admin_check" <c:if test="${smsListDeliveryStart.sms_use_center eq 'Y'}">checked</c:if> ><label for="check_<c:out value="${smsListDeliveryStart.sms_seq}"/>_center">사용</label></p>
                                <textarea name="sms_content_center" id="" class="w100 mgt10px admin_textarea" cols="30" rows="5" ><c:out value="${smsListDeliveryStart.sms_content_center}"/></textarea>
                                <p class="mgt10px">{주문번호},{상품명},{배송사},{송장번호}</p>
                            </td>
                        </tr>
                        </form>

						<form method="post" action="/admgr/admgrSystem/smsTemplateAction.do">
                    	<input type="hidden" name="sms_cd" value="PAYMENTNEED"/>
                         <tr>
                            <th class="alignCenter">미결제<br> - <br>입금안내 <br><br><button type="submit" class="btns bluebtn h24px">수정</button></th>
                            <td>
                                <p><input type="checkbox" value="Y" id="check_<c:out value="${smsListPaymentNeed.sms_seq}"/>_user" name="sms_use_user" class="admin_check" <c:if test="${smsListPaymentNeed.sms_use_user eq 'Y'}">checked</c:if> ><label for="check_<c:out value="${smsListPaymentNeed.sms_seq}"/>_user">사용</label></p>
                                <textarea name="sms_content_user" id="" class="w100 mgt10px admin_textarea" cols="30" rows="5" ><c:out value="${smsListPaymentNeed.sms_content_user}"/></textarea>
                                <p class="mgt10px">{주문번호}</p>
                            </td>
                            <td class="no_zoneX">
                                <%-- <p><input type="checkbox" value="Y" id="check_<c:out value="${smsListPaymentNeed.sms_seq}"/>_store" name="sms_use_store" class="admin_check" <c:if test="${smsListPaymentNeed.sms_use_store eq 'Y'}">checked</c:if> ><label for="check_<c:out value="${smsListPaymentNeed.sms_seq}"/>_store">사용</label></p>
                                <textarea name="sms_content_store" id="" class="w100 mgt10px admin_textarea" cols="30" rows="5" ><c:out value="${smsListPaymentNeed.sms_content_store}"/></textarea>
                                <p class="mgt10px">{주문번호}</p> --%>
                            </td>
                            <td class="no_zoneX">
                               <%--  <p><input type="checkbox" value="Y" id="check_<c:out value="${smsListPaymentNeed.sms_seq}"/>_center" name="sms_use_center" class="admin_check" <c:if test="${smsListPaymentNeed.sms_use_center eq 'Y'}">checked</c:if> ><label for="check_<c:out value="${smsListPaymentNeed.sms_seq}"/>_center">사용</label></p>
                                <textarea name="sms_content_center" id="" class="w100 mgt10px admin_textarea" cols="30" rows="5" ><c:out value="${smsListPaymentNeed.sms_content_center}"/></textarea>
                                <p class="mgt10px">{주문번호}</p> --%>
                            </td>
                        </tr>
                        </form>
						<%-- 
						<form method="post" action="/admgr/admgrSystem/smsTemplateAction.do">
                    	<input type="hidden" name="sms_cd" value="RESERVEINFO"/>
                         <tr>
                            <th class="alignCenter">예약안내<br> - <br>1일전 <br><br><button type="submit" class="btns bluebtn h24px">수정</button></th>
                            <td>
                                <p><input type="checkbox" value="Y" id="check_<c:out value="${smsListReserveInfo.sms_seq}"/>_user" name="sms_use_user" class="admin_check" <c:if test="${smsListReserveInfo.sms_use_user eq 'Y'}">checked</c:if> ><label for="check_<c:out value="${smsListReserveInfo.sms_seq}"/>_user">사용</label></p>
                                <textarea name="sms_content_user" id="" class="w100 mgt10px admin_textarea" cols="30" rows="5" ><c:out value="${smsListReserveInfo.sms_content_user}"/></textarea>
                                 <p class="mgt10px">{주문번호},{예약일},{상품명}</p>
                            </td>
                            <td>
                                <p><input type="checkbox" value="Y" id="check_<c:out value="${smsListReserveInfo.sms_seq}"/>_store" name="sms_use_store" class="admin_check" <c:if test="${smsListReserveInfo.sms_use_store eq 'Y'}">checked</c:if> ><label for="check_<c:out value="${smsListReserveInfo.sms_seq}"/>_store">사용</label></p>
                                <textarea name="sms_content_store" id="" class="w100 mgt10px admin_textarea" cols="30" rows="5" ><c:out value="${smsListReserveInfo.sms_content_store}"/></textarea>
                                <p class="mgt10px">{주문번호},{예약일},{상품명}</p>
                            </td>
                            <td class="no_zoneX">
                            --%>
                                <%-- <p><input type="checkbox" value="Y" id="check_<c:out value="${smsListReserveInfo.sms_seq}"/>_center" name="sms_use_center" class="admin_check" <c:if test="${smsListReserveInfo.sms_use_center eq 'Y'}">checked</c:if> ><label for="check_<c:out value="${smsListReserveInfo.sms_seq}"/>_center">사용</label></p>
                                <textarea name="sms_content_center" id="" class="w100 mgt10px admin_textarea" cols="30" rows="5" ><c:out value="${smsListReserveInfo.sms_content_center}"/></textarea>
                                <p class="mgt10px">{주문번호},{예약일},{상품명}</p> --%>
                            <%-- 
                            </td>
                        </tr>
                        </form>
							--%>                        
                        
            
                        
						<form method="post" action="/admgr/admgrSystem/smsTemplateAction.do">
                    	<input type="hidden" name="sms_cd" value="Cancel004"/>
                         <tr>
                            <th class="alignCenter">주문취소<br> - <br>장터 <br><br><button type="submit" class="btns bluebtn h24px">수정</button></th>
                            <td>
                                <p><input type="checkbox" value="Y" id="check_<c:out value="${smsListCancel004.sms_seq}"/>_user" name="sms_use_user" class="admin_check" <c:if test="${smsListCancel004.sms_use_user eq 'Y'}">checked</c:if> ><label for="check_<c:out value="${smsListCancel004.sms_seq}"/>_user">사용</label></p>
                                <textarea name="sms_content_user" id="" class="w100 mgt10px admin_textarea" cols="30" rows="5" ><c:out value="${smsListCancel004.sms_content_user}"/></textarea>
                            </td>
                            <td>
                                <p><input type="checkbox" value="Y" id="check_<c:out value="${smsListCancel004.sms_seq}"/>_store" name="sms_use_store" class="admin_check" <c:if test="${smsListCancel004.sms_use_store eq 'Y'}">checked</c:if> ><label for="check_<c:out value="${smsListCancel004.sms_seq}"/>_store">사용</label></p>
                                <textarea name="sms_content_store" id="" class="w100 mgt10px admin_textarea" cols="30" rows="5" ><c:out value="${smsListCancel004.sms_content_store}"/></textarea>
                            </td>
                            <td>
                                <p><input type="checkbox" value="Y" id="check_<c:out value="${smsListCancel004.sms_seq}"/>_center" name="sms_use_center" class="admin_check" <c:if test="${smsListCancel004.sms_use_center eq 'Y'}">checked</c:if> ><label for="check_<c:out value="${smsListCancel004.sms_seq}"/>_center">사용</label></p>
                                <textarea name="sms_content_center" id="" class="w100 mgt10px admin_textarea" cols="30" rows="5" ><c:out value="${smsListCancel004.sms_content_center}"/></textarea>
                            </td>
                        </tr>
                        </form>

						<form method="post" action="/admgr/admgrSystem/smsTemplateAction.do">
                    	<input type="hidden" name="sms_cd" value="QNAADD"/>
                         <tr>
                            <th class="alignCenter">Q&A<br> - <br>등록 <br><br><button type="submit" class="btns bluebtn h24px">수정</button></th>
                            <td>
                                <p><input type="checkbox" value="Y" id="check_<c:out value="${smsListQnaAdd.sms_seq}"/>_user" name="sms_use_user" class="admin_check" <c:if test="${smsListQnaAdd.sms_use_user eq 'Y'}">checked</c:if> ><label for="check_<c:out value="${smsListQnaAdd.sms_seq}"/>_user">사용</label></p>
                                <textarea name="sms_content_user" id="" class="w100 mgt10px admin_textarea" cols="30" rows="5" ><c:out value="${smsListQnaAdd.sms_content_user}"/></textarea>
                            </td>
                            <td>
                                <p><input type="checkbox" value="Y" id="check_<c:out value="${smsListQnaAdd.sms_seq}"/>_store" name="sms_use_store" class="admin_check" <c:if test="${smsListQnaAdd.sms_use_store eq 'Y'}">checked</c:if> ><label for="check_<c:out value="${smsListQnaAdd.sms_seq}"/>_store">사용</label></p>
                                <textarea name="sms_content_store" id="" class="w100 mgt10px admin_textarea" cols="30" rows="5" ><c:out value="${smsListQnaAdd.sms_content_store}"/></textarea>
                            </td>
                            <td>
                                <p><input type="checkbox" value="Y" id="check_<c:out value="${smsListQnaAdd.sms_seq}"/>_center" name="sms_use_center" class="admin_check" <c:if test="${smsListQnaAdd.sms_use_center eq 'Y'}">checked</c:if> ><label for="check_<c:out value="${smsListQnaAdd.sms_seq}"/>_center">사용</label></p>
                                <textarea name="sms_content_center" id="" class="w100 mgt10px admin_textarea" cols="30" rows="5" ><c:out value="${smsListQnaAdd.sms_content_center}"/></textarea>
                            </td>
                        </tr>
                        </form>

						<form method="post" action="/admgr/admgrSystem/smsTemplateAction.do">
                    	<input type="hidden" name="sms_cd" value="QNAREPLY"/>
                         <tr>
                            <th class="alignCenter">Q&A<br> - <br>답변등록 <br><br><button type="submit" class="btns bluebtn h24px">수정</button></th>
                            <td>
                                <p><input type="checkbox" value="Y" id="check_<c:out value="${smsListQnaReply.sms_seq}"/>_user" name="sms_use_user" class="admin_check" <c:if test="${smsListQnaReply.sms_use_user eq 'Y'}">checked</c:if> ><label for="check_<c:out value="${smsListQnaReply.sms_seq}"/>_user">사용</label></p>
                                <textarea name="sms_content_user" id="" class="w100 mgt10px admin_textarea" cols="30" rows="5" ><c:out value="${smsListQnaReply.sms_content_user}"/></textarea>
                            </td>
                            <td>
                                <p><input type="checkbox" value="Y" id="check_<c:out value="${smsListQnaReply.sms_seq}"/>_store" name="sms_use_store" class="admin_check" <c:if test="${smsListQnaReply.sms_use_store eq 'Y'}">checked</c:if> ><label for="check_<c:out value="${smsListQnaReply.sms_seq}"/>_store">사용</label></p>
                                <textarea name="sms_content_store" id="" class="w100 mgt10px admin_textarea" cols="30" rows="5" ><c:out value="${smsListQnaReply.sms_content_store}"/></textarea>
                            </td>
                            <td>
                                <p><input type="checkbox" value="Y" id="check_<c:out value="${smsListQnaReply.sms_seq}"/>_center" name="sms_use_center" class="admin_check" <c:if test="${smsListQnaReply.sms_use_center eq 'Y'}">checked</c:if> ><label for="check_<c:out value="${smsListQnaReply.sms_seq}"/>_center">사용</label></p>
                                <textarea name="sms_content_center" id="" class="w100 mgt10px admin_textarea" cols="30" rows="5" ><c:out value="${smsListQnaReply.sms_content_center}"/></textarea>
                            </td>
                        </tr>
                        </form>

						<form method="post" action="/admgr/admgrSystem/smsTemplateAction.do">
                    	<input type="hidden" name="sms_cd" value="QNAREPLYMODIFY"/>
                         <tr>
                            <th class="alignCenter">Q&A<br> - <br>답변수정 <br><br><button type="submit" class="btns bluebtn h24px">수정</button></th>
                            <td>
                                <p><input type="checkbox" value="Y" id="check_<c:out value="${smsListQnaReplyModify.sms_seq}"/>_user" name="sms_use_user" class="admin_check" <c:if test="${smsListQnaReplyModify.sms_use_user eq 'Y'}">checked</c:if> ><label for="check_<c:out value="${smsListQnaReplyModify.sms_seq}"/>_user">사용</label></p>
                                <textarea name="sms_content_user" id="" class="w100 mgt10px admin_textarea" cols="30" rows="5" ><c:out value="${smsListQnaReplyModify.sms_content_user}"/></textarea>
                            </td>
                            <td>
                                <p><input type="checkbox" value="Y" id="check_<c:out value="${smsListQnaReplyModify.sms_seq}"/>_store" name="sms_use_store" class="admin_check" <c:if test="${smsListQnaReplyModify.sms_use_store eq 'Y'}">checked</c:if> ><label for="check_<c:out value="${smsListQnaReplyModify.sms_seq}"/>_store">사용</label></p>
                                <textarea name="sms_content_store" id="" class="w100 mgt10px admin_textarea" cols="30" rows="5" ><c:out value="${smsListQnaReplyModify.sms_content_store}"/></textarea>
                            </td>
                            <td>
                                <p><input type="checkbox" value="Y" id="check_<c:out value="${smsListQnaReplyModify.sms_seq}"/>_center" name="sms_use_center" class="admin_check" <c:if test="${smsListQnaReplyModify.sms_use_center eq 'Y'}">checked</c:if> ><label for="check_<c:out value="${smsListQnaReplyModify.sms_seq}"/>_center">사용</label></p>
                                <textarea name="sms_content_center" id="" class="w100 mgt10px admin_textarea" cols="30" rows="5" ><c:out value="${smsListQnaReplyModify.sms_content_center}"/></textarea>
                            </td>
                        </tr>
                        </form>

						<form method="post" action="/admgr/admgrSystem/smsTemplateAction.do">
                    	<input type="hidden" name="sms_cd" value="MTMADD"/>
                         <tr>
                            <th class="alignCenter">1:1 문의<br> - <br>등록 <br><br><button type="submit" class="btns bluebtn h24px">수정</button></th>
                            <td>
                                <p><input type="checkbox" value="Y" id="check_<c:out value="${smsListMtmAdd.sms_seq}"/>_user" name="sms_use_user" class="admin_check" <c:if test="${smsListMtmAdd.sms_use_user eq 'Y'}">checked</c:if> ><label for="check_<c:out value="${smsListMtmAdd.sms_seq}"/>_user">사용</label></p>
                                <textarea name="sms_content_user" id="" class="w100 mgt10px admin_textarea" cols="30" rows="5" ><c:out value="${smsListMtmAdd.sms_content_user}"/></textarea>
                            </td>
                            <td class="no_zoneX">
                                <%-- <p><input type="checkbox" value="Y" id="check_<c:out value="${smsListMtmAdd.sms_seq}"/>_store" name="sms_use_store" class="admin_check" <c:if test="${smsListMtmAdd.sms_use_store eq 'Y'}">checked</c:if> ><label for="check_<c:out value="${smsListMtmAdd.sms_seq}"/>_store">사용</label></p>
                                <textarea name="sms_content_store" id="" class="w100 mgt10px admin_textarea" cols="30" rows="5" ><c:out value="${smsListMtmAdd.sms_content_store}"/></textarea> --%>
                            </td>
                            <td>
                                <p><input type="checkbox" value="Y" id="check_<c:out value="${smsListMtmAdd.sms_seq}"/>_center" name="sms_use_center" class="admin_check" <c:if test="${smsListOrder.sms_use_center eq 'Y'}">checked</c:if> ><label for="check_<c:out value="${smsListMtmAdd.sms_seq}"/>_center">사용</label></p>
                                <textarea name="sms_content_center" id="" class="w100 mgt10px admin_textarea" cols="30" rows="5" ><c:out value="${smsListMtmAdd.sms_content_center}"/></textarea>
                            </td>
                        </tr>
                        </form>

						<form method="post" action="/admgr/admgrSystem/smsTemplateAction.do">
                    	<input type="hidden" name="sms_cd" value="MTMREPLY"/>
                         <tr>
                            <th class="alignCenter">1:1 문의<br> - <br>답변등록 <br><br><button type="submit" class="btns bluebtn h24px">수정</button></th>
                            <td>
                                <p><input type="checkbox" value="Y" id="check_<c:out value="${smsListMtmReply.sms_seq}"/>_user" name="sms_use_user" class="admin_check" <c:if test="${smsListMtmReply.sms_use_user eq 'Y'}">checked</c:if> ><label for="check_<c:out value="${smsListMtmReply.sms_seq}"/>_user">사용</label></p>
                                <textarea name="sms_content_user" id="" class="w100 mgt10px admin_textarea" cols="30" rows="5" ><c:out value="${smsListMtmReply.sms_content_user}"/></textarea>
                            </td>
                            <td class="no_zoneX">
                                <%-- <p><input type="checkbox" value="Y" id="check_<c:out value="${smsListMtmReply.sms_seq}"/>_store" name="sms_use_store" class="admin_check" <c:if test="${smsListMtmReply.sms_use_store eq 'Y'}">checked</c:if> ><label for="check_<c:out value="${smsListMtmReply.sms_seq}"/>_store">사용</label></p>
                                <textarea name="sms_content_store" id="" class="w100 mgt10px admin_textarea" cols="30" rows="5" ><c:out value="${smsListMtmReply.sms_content_store}"/></textarea> --%>
                            </td>
                            <td>
                                <p><input type="checkbox" value="Y" id="check_<c:out value="${smsListMtmReply.sms_seq}"/>_center" name="sms_use_center" class="admin_check" <c:if test="${smsListMtmReply.sms_use_center eq 'Y'}">checked</c:if> ><label for="check_<c:out value="${smsListMtmReply.sms_seq}"/>_center">사용</label></p>
                                <textarea name="sms_content_center" id="" class="w100 mgt10px admin_textarea" cols="30" rows="5" ><c:out value="${smsListMtmReply.sms_content_center}"/></textarea>
                            </td>
                        </tr>
                        </form>

						<form method="post" action="/admgr/admgrSystem/smsTemplateAction.do">
                    	<input type="hidden" name="sms_cd" value="MTMREPLYMODIFY"/>
                         <tr>
                            <th class="alignCenter">1:1 문의<br> - <br>답변수정 <br><br><button type="submit" class="btns bluebtn h24px">수정</button></th>
                            <td>
                                <p><input type="checkbox" value="Y" id="check_<c:out value="${smsListMtmReplyModify.sms_seq}"/>_user" name="sms_use_user" class="admin_check" <c:if test="${smsListMtmReplyModify.sms_use_user eq 'Y'}">checked</c:if> ><label for="check_<c:out value="${smsListMtmReplyModify.sms_seq}"/>_user">사용</label></p>
                                <textarea name="sms_content_user" id="" class="w100 mgt10px admin_textarea" cols="30" rows="5" ><c:out value="${smsListMtmReplyModify.sms_content_user}"/></textarea>
                            </td>
                            <td class="no_zoneX">
                                <%-- <p><input type="checkbox" value="Y" id="check_<c:out value="${smsListMtmReplyModify.sms_seq}"/>_store" name="sms_use_store" class="admin_check" <c:if test="${smsListMtmReplyModify.sms_use_store eq 'Y'}">checked</c:if> ><label for="check_<c:out value="${smsListMtmReplyModify.sms_seq}"/>_store">사용</label></p>
                                <textarea name="sms_content_store" id="" class="w100 mgt10px admin_textarea" cols="30" rows="5" ><c:out value="${smsListMtmReplyModify.sms_content_store}"/></textarea> --%>
                            </td>
                            <td>
                                <p><input type="checkbox" value="Y" id="check_<c:out value="${smsListMtmReplyModify.sms_seq}"/>_center" name="sms_use_center" class="admin_check" <c:if test="${smsListMtmReplyModify.sms_use_center eq 'Y'}">checked</c:if> ><label for="check_<c:out value="${smsListMtmReplyModify.sms_seq}"/>_center">사용</label></p>
                                <textarea name="sms_content_center" id="" class="w100 mgt10px admin_textarea" cols="30" rows="5" ><c:out value="${smsListMtmReplyModify.sms_content_center}"/></textarea>
                            </td>
                        </tr>
                        </form>
                        
					</tbody>
                </table>
                <!-- } 푸시 리스트 -->
			</section>
			<!-- } 부가기능 > 푸시관리 -->
		</div>
		<!-- } 콘텐츠 영역 -->


<c:import url="/Api/admgrIncludeBottom.do"/>