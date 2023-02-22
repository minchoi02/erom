<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:choose>
	<c:when test="${result eq 'N'}">
	<span style="color: #ff6600;">회원데이터가 존재하지 않습니다.</span>
	</c:when>
	<c:when test="${result eq 'F'}">
	<span style="color: #ff6600;">이미 <strong>탈퇴</strong>한 회원입니다.</span>
	</c:when>
	<c:otherwise>
	회원정보에 등록된 핸드폰번호로 <span style="color: #ff6600;">새 비밀번호가 전송</span>되었습니다.
	<br>
	<br>
	로그인 후, <span style="color: #ff6600;">필히 비밀번호를 변경</span>하시기 바랍니다.
	</c:otherwise>
</c:choose>