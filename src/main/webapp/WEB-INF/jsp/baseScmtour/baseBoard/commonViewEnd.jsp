<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

			<div class="btnArea alignRight">
				<ul class="nopm floats">
					<%--오픈 후 작업
					<li>
						<a href="#;" class="btns"><i class="fal fa-arrow-left"></i> 이전글</a>
						<a href="#;" class="btns">다음글 <i class="fal fa-arrow-right"></i></a>
					</li>
					 --%>
					<%-- <li><a href="/board/list.do?bd_id=<c:out value="${bd_id}"/>&pageIndex=<c:out value="${pageIndex }"/>" class="btns"><i class="far fa-bars"></i> 목록</a></li> --%>
					<c:if test="${empty bbsInfo.bbs_reply_content}">
					<c:if test="${bd_id eq 'MTM' }">
					<li class="fr"><a href="javascript:bbs_delete('<c:out value="${bd_id}"/>','<c:out value="${bbs_seq}"/>','<c:out value="${pageIndex }"/>')" class="btns graybtn"><i class="far fa-user-delete"></i> 삭제</a></li>
					<li class="fr">&nbsp;&nbsp;</li>
					<li class="fr"><a href="/board/form.do?bd_id=<c:out value="${bd_id}"/>&pageIndex=<c:out value="${pageIndex }"/>&bbs_seq=<c:out value="${bbs_seq}"/>" class="btns orangebtn"><i class="far fa-user-edit"></i> 수정</a></li>
					</c:if>
					</c:if>
				</ul>
			</div>
		</article>
	</section>
