<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:set var="headerType" value="subHeader" />
<c:set var="headerName" value="bbs_mtm" />
<c:import url="/Api/IncludeTop.do"/>

<c:if test="${empty user_id }">
<script>
$(window).bind("pageshow", function (event) {
getLogin('/board/list.do?bd_id=MTM');
});
</script>
</c:if>

	<form id="bbsForm" method="post" action="/board/bbsAction.do" onsubmit="return bbsmtmForm();" >
	<input type="hidden" id="bd_id" name="bd_id" value="<c:out value="${bd_id }"/>" > 
	<c:if test="${not empty bbs_seq }">
	<input type="hidden" id="bbs_seq" name="bbs_seq" value="<c:out value="${bbs_seq}"/>" > 
	<input type="hidden" id="pageIndex" name="pageIndex" value="<c:out value="${pageIndex}"/>" >
	</c:if> 
	<section id="myinfo">
		<ul class="myinfobox nopm">
			<li><label for="u_id">ID</label><input type="text" id="u_id" name="u_id" class="basic_input w100 readonly" readonly value="<c:out value="${user_id }"/>" ></li>
			<li><label for="u_nm">이름</label><input type="text" id="u_nm" name="u_nm" class="basic_input w100 readonly" readonly value="<c:out value="${user_nm }"/>"></li>
			<li><label for="bbs_subject">제목</label><input type="text" id="bbs_subject" name="bbs_subject" class="basic_input w100 " value="<c:out value="${bbsInfo.bbs_subject }"/>" ></li>
			<li><label for="bbs_content">문의사항</label>
				<textarea name="bbs_content" id="bbs_content" class="basic_textarea w100 mgt10px" cols="30" rows="10" style="resize:none;"><c:out value="${bbsInfo.bbs_content }"/></textarea>
			</li>
		</ul>
		<ul class="agree_list mgt30px">
			<li class="commnet" style="color: #ff6600;">* 답글이 등록된 이후는 수정 및 삭제를 할 수 없습니다.</li>
		</ul>
		<div class="alignCenter mgt30px">
			<c:choose>
			<c:when test="${empty bbsInfo.bbs_seq }">
			<button type="submit" class="btns bgOrangeGra colorWhite">등록</button>
			</c:when>
			<c:otherwise>
			<button type="submit" class="btns bgOrangeGra colorWhite">수정</button>
			</c:otherwise>
			</c:choose>
		</div>
	</section>
	</form>

<c:import url="/Api/IncludeBottom.do"/>