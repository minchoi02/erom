<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<% 
pageContext.setAttribute("CR", "\r"); 
pageContext.setAttribute("LF", "\n"); 
pageContext.setAttribute("CRLF", "\r\n"); 
pageContext.setAttribute("BR", "<br/>");
%>

<c:import url="/Api/admgrIncludeTop.do"/>
<c:import url="/Api/admgrIncludeLeftMenu.do"/>
<%--
<c:set var="newLine" value="\\n" />
<c:set var="changeTag" value="<br />" />
 --%>
		<!-- 콘텐츠 영역 { -->
		<div id="content">
			<h1 class="bigTit">1:1문의 내용</h1>

			<!-- 고객센터 > 1:1문의 > 글쓰기 { -->
			<section id="boardWrite" class="page_content">
				<!-- 1:1문의 내용 { -->
				<form method="post" id="bbsForm" name="bbsForm" action="/admgr/admgrCustomer/mtmAction.do" onsubmit="return mtmFormCheck()" >
				<article class="page_sortation">
					<table class="admin_tbl admin_write_tbl">
						<caption>1:1문의 내용</caption>
						<colgroup>
							<col width="200" />
							<col />
						</colgroup>
						<tbody>
							<tr>
								<th>글쓴이 (ID)</th>
								<td><c:out value="${bbsInfo.bbs_writer_nm }"/> <c:if test="${not empty bbsInfo.user_id }">(<c:out value="${bbsInfo.user_id }"/>)</c:if></td>
							</tr>
							<tr>
								<th>글쓴이 연락처</th>
								<td><c:out value="${bbsInfo.bbs_writer_hp }"/></td>
								<input type="hidden" name="bbs_user_hp" value="<c:out value="${bbsInfo.bbs_writer_hp }"/>"/>
							</tr>
							<tr>
								<th>글쓴이 이메일</th>
								<td><c:out value="${bbsInfo.bbs_writer_email }"/></td>
							</tr>
							<tr>
								<th>제목</th>
								<td><c:out value="${bbsInfo.bbs_subject }"/></td>
							</tr>
							<tr>
								<th>내용</th>
								<td>
									<c:set var="bbs_content_line" value="${fn:replace(bbsInfo.bbs_content, CRLF, BR) }"/>
									<c:set var="bbs_content_line" value="${fn:replace(bbs_content_line, CR, BR) }"/>
									<c:set var="bbs_content_line" value="${fn:replace(bbs_content_line, LF, BR) }"/>
									<c:set var="bbs_content_line" value="${fn:replace(bbs_content_line, BR, '<br />') }"/>
									<c:out value="${bbs_content_line }" escapeXml = "false"/>
								</td>
							</tr>
						</tbody>
					</table>
				</article>
				<!-- } 1:1문의 내용 -->

				<!-- 답변달기 { -->
				<c:choose>
					<c:when test="${empty bbsInfo.bbs_reply_content }">
						<c:set var="modify_style" value="reply_insert"/>
					</c:when>
					<c:otherwise>
						<c:set var="modify_style" value="reply_modify"/>
					</c:otherwise>
				</c:choose>
				<input type="hidden" name="bbs_seq" value="<c:out value="${bbs_seq}"/>" />
				<input type="hidden" name="modify_style" value="<c:out value="${modify_style}"/>" />
				<input type="hidden" id="return_url" name="return_url" value="" />
				<article class="page_sortation">
					<table class="admin_tbl admin_write_tbl">
						<caption>답변달기</caption>
						<colgroup>
							<col width="200" />
							<col />
						</colgroup>
						<tbody>
							<tr>
								<th>답변</th>
								<td><textarea id="bbs_reply_content" name="bbs_reply_content" class="admin_textarea w100" rows="15"><c:out value="${bbsInfo.bbs_reply_content }"/></textarea></td>
							</tr>
						</tbody>
					</table>
				</article>
				<!-- } 답변달기 -->

				<div class="btnarea mgt30px">
					<ul class="nopm floats">
						<li><a href="/admgr/admgrCustomer/mtmList.do?pageIndex=<c:out value="${pageIndex }"/>&searchKey=<c:out value="${searchKey }"/>&searchKeyword=<c:out value="${searchKeyword }"/>" class="btns"><i class="fal fa-list"></i> 목록으로</a></li>
						<li class="fr">
						<button type="button" class="btns graybtn" onclick="delbbs('<c:out value="${pageIndex}"/>','<c:out value="${bbs_id }"/>','<c:out value="${bbs_seq}"/>','<c:out value="${searchKey}"/>','<c:out value="${searchKeyword}"/>','<c:out value="${store_category}"/>');" ><i class="far fa-save"></i> 삭제</button>
						 &nbsp;&nbsp;
						<button type="submit" class="btns redbtn"><i class="far fa-save"></i> 저장</button>
						</li>
					</ul>
				</div>
				</form>
			</section>
			<!-- } 고객센터 > 1:1문의 > 글쓰기 -->
		</div>
		<!-- } 콘텐츠 영역 -->


<c:import url="/Api/admgrIncludeBottom.do"/>