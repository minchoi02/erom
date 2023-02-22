<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:choose>
	<c:when test="${result eq 'N'}">
	<span style="color: #ff6600;">회원데이터가 검색되지 않습니다.<br><br>* 입력하신 정보를 확인하여 주세요.<br><br>* 핸드폰번호가 등록되어 있지 않으신 회원님께서는 , 고객센터 (070-7505-8007)로 문의바랍니다.</span>
	</c:when>
	<c:when test="${result eq 'F'}">
	<span style="color: #ff6600;">이미 <strong>탈퇴</strong>한 회원입니다.</span>
	</c:when>
	<c:otherwise>
	귀하의 아이디는 <br><br><strong style="color: #ff6600;"><c:out value="${result }"/></strong><br><br> 입니다.
	</c:otherwise>
</c:choose>
