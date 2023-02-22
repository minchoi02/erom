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

<c:import url="/Api/admgrIncludeTop.do"/>
<c:import url="/Api/admgrIncludeLeftMenu.do"/>

		<!-- 콘텐츠 영역 { -->
		<div id="content">
			<h1 class="bigTit">리뷰 내용</h1>

			<!-- 고객센터 > 리뷰 > 글쓰기 { -->
			<section id="boardWrite" class="page_content">
				<!-- 리뷰 내용 { -->
				<form method="post" id="bbsForm" name="bbsForm" action="/admgr/admgrCustomer/	reviewAction.do" onsubmit="return reviewFormCheck()" >
				<input type="hidden" name="bbs_id" value="<c:out value="${bbs_id}"/>" />
				<input type="hidden" name="bbs_seq" value="<c:out value="${bbs_seq}"/>" />
				<input type="hidden" name="pageIndex" value="<c:out value="${pageIndex}"/>" />
				<input type="hidden" name="searchKey" value="<c:out value="${searchKey}"/>" />
				<input type="hidden" name="searchKeyword" value="<c:out value="${searchKeyword}"/>" />
				<input type="hidden" id="return_url" name="return_url" value="" />
				<article class="page_sortation">
					<table class="admin_tbl admin_write_tbl">
						<caption>리뷰 내용</caption>
						<colgroup>
							<col width="200" />
							<col />
						</colgroup>
						<tbody>
							<tr>
								<th>유형</th>
								<td><c:out value="${bbsInfo.store_category_nm}"/></td>
							</tr>
							<tr>
								<th>상품명</th>
								<td><img src="/cmm/fms/FileDown.do?atchFileId=<c:out value="${bbsInfo.prod_img_1}"/>&fileSn=0" width="100"  onerror="this.src='/images/baseScmtour/_noImage.png';"/> <c:out value="${bbsInfo.prod_nm}"/></td>
							</tr>
							<tr>
								<th>업체</th>
								<td><c:out value="${bbsInfo.store_nm}"/></td>
							</tr>
							<tr>
								<th>글쓴이 (ID)</th>
								<td><c:out value="${bbsInfo.user_nm }"/> <c:if test="${not empty bbsInfo.user_id }">(<c:out value="${bbsInfo.user_id }"/>)</c:if>)</td>
							</tr>
							<tr>
								<th>글쓴이 연락처</th>
								<td><c:out value="${bbsInfo.bbs_writer_hp }"/></td>
							</tr>
							<tr>
								<th>글쓴이 이메일</th>
								<td><c:out value="${bbsInfo.bbs_writer_email }"/></td>
							</tr>
							<tr>
								<th>별점</th>
								<td>
									<div class="starbox">
										<c:set var="prod_star" value="${bbsInfo.prod_star }"/>
										<c:if test="${empty prod_star }">
											<c:set var="prod_star" value="0" />
										</c:if>
										<span class="starico colorStar"><c:forEach var="i" begin="1" end="5"><i class="<c:if test="${i <= bbsInfo.bbs_star }">fas</c:if><c:if test="${i > bbsInfo.bbs_star }">far</c:if> fa-star"></i></c:forEach></span>
										<%--
										<span class="starico colorStar"><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star-half-alt"></i><i class="far fa-star"></i></span>
										 --%>
										<span class="starnum"><c:out value="${bbsInfo.bbs_star}"/></span>
									</div>
								</td>
							</tr>
							<tr>
								<th>리뷰 내용</th>
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
				<!-- } 리뷰 내용 -->

				<!-- 답변달기 { -->
				<c:choose>
					<c:when test="${empty bbsInfo.bbs_reply_content }">
						<c:set var="modify_style" value="reply_insert"/>
					</c:when>
					<c:otherwise>
						<c:set var="modify_style" value="reply_modify"/>
					</c:otherwise>
				</c:choose>
				<input type="hidden" name="modify_style" value="<c:out value="${modify_style}"/>" />
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
						<li><a href="/admgr/admgrCustomer/reviewList.do?pageIndex=<c:out value="${pageIndex }"/>&store_category=<c:out value="${store_category }"/>&searchKey=<c:out value="${searchKey }"/>&searchKeyword=<c:out value="${searchKeyword }"/>" class="btns"><i class="fal fa-list"></i> 목록으로</a></li>
						<li class="fr">
						<button type="button" class="btns graybtn" onclick="delbbs('<c:out value="${pageIndex}"/>','<c:out value="${bbs_id }"/>','<c:out value="${bbs_seq}"/>','<c:out value="${searchKey}"/>','<c:out value="${searchKeyword}"/>','<c:out value="${store_category}"/>');" ><i class="far fa-save"></i> 삭제</button>
						 &nbsp;&nbsp;
						<button type="submit" class="btns redbtn"><i class="far fa-save"></i> 저장</button>
						</li>
					</ul>
				</div>
			</section>
			<!-- } 고객센터 > 리뷰 > 글쓰기 -->
		</div>
		<!-- } 콘텐츠 영역 -->


<c:import url="/Api/admgrIncludeBottom.do"/>