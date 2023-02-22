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
<c:set var="doURI" value="${requestScope['javax.servlet.forward.servlet_path']}" /> 
<c:set var="qsURI" value="${pageContext.request.queryString}" /> 
<c:set var="URI" value="${doURI }"/>
<c:if test="${not empty qsURI}">
	<c:set var="URI" value="${doURI }?${qsURI }"/>
</c:if>

<c:choose>
	<c:when test="${not empty user_id }">
		<c:set var="func_pick" value="prod_pick('${prod_id }')" />
		<c:set var="write_review" value="write_review('${prodInfo.prod_nm }')" />
	</c:when>
	<c:otherwise>
		<c:set var="func_pick" value="getLogin('${URI }')"/>
		<c:set var="write_review" value="getLogin('${URI }')"/>
	</c:otherwise>
</c:choose>

<!-- 리뷰 그래프 { -->
		<article id="viewReview">
			<!-- 평점항목 { -->
			<div class="rating_point">
				<div class="starpoint">
					<strong><fmt:formatNumber value="${real_avg}" type="number"/></strong>
					<em class="colorOrange">
					<c:forEach var="i" begin="1" end="5"><i class="<c:if test="${i <= real_avg }">fas</c:if><c:if test="${i > real_avg }">far</c:if> fa-star"></i></c:forEach>
					</em>
					<p>총 <b><fmt:formatNumber value="${reviewCnt.total_cnt}" type="number"/></b>건</p>
				</div>

				<div class="ratingchart">
					<div id="ratingChart"></div>
					<script>
						var chart = Highcharts.chart('ratingChart', {
							title: {
								text: ''
							},

							xAxis: {
								categories: ['5', '4', '3', '2', '1']
							},

							series: [{
								type: 'column',
								colorByPoint: true,
								data: [<c:out value="${reviewCnt.star5_cnt }"/>, <c:out value="${reviewCnt.star4_cnt }"/>, <c:out value="${reviewCnt.star3_cnt }"/>, <c:out value="${reviewCnt.star2_cnt }"/>, <c:out value="${reviewCnt.star1_cnt }"/>],
								showInLegend: false
							}]
						});
					</script>
					<a href="javascript:<c:out value="${write_review}"/>" class="replaywritebtn bgOrangeGra"  >리뷰 작성하기</a>
				</div>
			</div>
			<!-- } 평점항목 -->

			<!-- 댓글 { -->
			<div class="replyarea" id="replyarea">
				<c:forEach var="reviewList" items="${reviewList}" varStatus="status">
				<c:set var="content" value="${reviewList.bbs_content}"/>
				<c:set var="reply_content" value="${reviewList.bbs_reply_content}"/>
				<div class="replybox">
					<div class="replytit">
						<strong><c:out value="${reviewList.bbs_writer_nm }"/></strong>
						<em class="colorOrange">
						<c:forEach var="i" begin="1" end="5"><i class="<c:if test="${i <= reviewList.bbs_star }">fas</c:if><c:if test="${i > reviewList.bbs_star }">far</c:if> fa-star"></i></c:forEach>
						</em>
						<c:if test="${user_id eq reviewList.user_id && empty reviewList.bbs_reply_content }">
							<a href="javascript:modify_review('<c:out value="${prodInfo.prod_nm }"/>',<c:out value="${reviewList.bbs_seq}"/>);" class="review_btn btn_orange whitefont"  >수정</a>
							<a href="javascript:delete_review(<c:out value="${reviewList.bbs_seq}"/>);" class="review_btn btn_gray blackfont"  >삭제</a>
						</c:if>
						<span class="date"><c:out value="${reviewList.reg_dt }"/></span>
					</div>
					<div class="replytxt">
						<c:set var="bbs_content" value="${fn:replace(content, CRLF, BR) }"/>
						<c:set var="bbs_content" value="${fn:replace(bbs_content, CR, BR) }"/>
						<c:set var="bbs_content" value="${fn:replace(bbs_content, LF, BR) }"/>
						<c:set var="bbs_content" value="${fn:replace(bbs_content, BR, '<br />') }"/>
						<c:out value="${bbs_content}" escapeXml="false"/>
					</div>
					<c:if test="${not empty reviewList.bbs_reply_content }">
					<div class="admreply">
						<div class="replytit">
							<strong><c:out value="${reviewList.bbs_reply_user_nm }"/></strong>
							<span class="date"><c:out value="${reviewList.reply_reg_dt }"/></span>
						</div>
						<div class="replytxt">
							<c:set var="bbs_reply_content" value="${fn:replace(reply_content, CRLF, BR) }"/>
							<c:set var="bbs_reply_content" value="${fn:replace(bbs_reply_content, CR, BR) }"/>
							<c:set var="bbs_reply_content" value="${fn:replace(bbs_reply_content, LF, BR) }"/>
							<c:set var="bbs_reply_content" value="${fn:replace(bbs_reply_content, BR, '<br />') }"/>
							<c:out value="${bbs_reply_content}" escapeXml="false"/>
						</div>
					</div>
					</c:if>
				</div>
				</c:forEach>
			<!-- } 댓글 -->
			<%--
			<a href="#" id="reply_more" class="replymore">리뷰 더보기</a>
			 --%>
		</article>
		<!-- } 리뷰 그래프 -->
		
		