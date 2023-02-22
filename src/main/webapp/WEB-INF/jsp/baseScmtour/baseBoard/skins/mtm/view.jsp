<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<% 
pageContext.setAttribute("CR", "\r"); 
pageContext.setAttribute("LF", "\n"); 
pageContext.setAttribute("CRLF", "\r\n"); 
pageContext.setAttribute("BR", "<br/>");
%>
<c:set var="headerType" value="subHeader" />
<c:set var="headerName" value="bbs_mtm" />

<c:set var="bbs_reply_content_line" value="${fn:replace(bbsInfo.bbs_reply_content, CRLF, BR) }"/>
<c:set var="bbs_reply_content_line" value="${fn:replace(bbs_reply_content_line, CR, BR) }"/>
<c:set var="bbs_reply_content_line" value="${fn:replace(bbs_reply_content_line, LF, BR) }"/>
<c:set var="bbs_reply_content_line" value="${fn:replace(bbs_reply_content_line, BR, '<br />') }"/>

<c:import url="/Api/IncludeTop.do"/>

<c:if test="${empty user_id }">
<script>
$(window).bind("pageshow", function (event) {
getLogin('/board/list.do?bd_id=MTM');
});
</script>
</c:if>
	
	<%@ include file="../../commonView.jsp" %>
	
	
		<c:if test="${not empty bbsInfo.bbs_reply_content}">
			<div class="board_view_con" style="border-top: 1px solid #dcdcdc; padding: 20px ">
				<div style="border: solid 1px #ccc; background: #efefef; padding: 10px;">
					<div class="alignRight" >
					<ul class="nopm floats">
						<li><strong>답글 : </strong></li> 
						<li class="fr"><span style="color: #aaa; font-size: 12px/1.2; "><c:out value="${bbsInfo.reply_reg_dt }"/></span></li> 
					</ul>
					</div>
					<br>
					<div class="alignleft" style="padding: 10px;"> 
						<c:out value="${bbs_reply_content_line}" escapeXml="false" />
					</div>
				</div>
			</div>
		</c:if>
	
	<%@ include file="../../commonViewEnd.jsp" %>
	
<c:import url="/Api/IncludeBottom.do"/>