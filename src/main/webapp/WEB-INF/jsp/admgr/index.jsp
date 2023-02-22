<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%-- <c:set var="Domain" value="${header.host}"/>
<c:set var="doURI" value="${requestScope['javax.servlet.forward.servlet_path']}" /> 
<c:set var="qsURI" value="${pageContext.request.queryString}" /> 
<c:set var="URI" value="${doURI }"/>
<c:if test="${not empty qsURI}">
	<c:set var="URI" value="${doURI }?${qsURI }"/>
</c:if>
<c:if test="${Domain.indexOf('www.') eq '-1' }">
	<c:set var="Domain" value="www.${Domain }"/>
	<c:set var="fullurlset" value="https://${Domain }${doURI }"/>
	<c:if test="${not empty qsURI}">
		<c:set var="fullurlset" value="https://${Domain }${doURI }?${qsURI }"/>
	</c:if>
	<script>location.replace("<c:out value="${fullurlset}"/>");</script>
</c:if> --%>
<script>location.href='/admgr/admgrMain.do';</script>