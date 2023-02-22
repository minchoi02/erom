<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:import url="/Api/IncludeTop.do"/>
<% 
pageContext.setAttribute("CR", "\r"); 
pageContext.setAttribute("LF", "\n"); 
pageContext.setAttribute("CRLF", "\r\n"); 
pageContext.setAttribute("BR", "<br/>");
%>
<c:set var="siteRule_str" value="${fn:replace(siteRule, CRLF, BR) }"/>
<c:set var="siteRule_str" value="${fn:replace(siteRule_str, CR, BR) }"/>
<c:set var="siteRule_str" value="${fn:replace(siteRule_str, LF, BR) }"/>
<c:set var="siteRule_str" value="${fn:replace(siteRule_str, BR, '<br />') }"/>

	<section id="boardView">
		<article id="boardViewCon">
			<div class="board_view_top">
				<c:out value="${siteRule_str}" escapeXml="false" />
			</div>
		</article>
	</section>
	
<c:import url="/Api/IncludeBottom.do"/>