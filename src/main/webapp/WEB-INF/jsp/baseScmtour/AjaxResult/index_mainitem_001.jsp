<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
						<h2 class="mainTit alignCenter"><em>베스트 관광/체험</em></h2>
						<ul class="nopm">
							<c:forEach var="mainItem1List" items="${mainItem1List}" varStatus="status">
							<c:set var="is_favorite" value=""/>
							<li>
								<a href="/shop/itemView.do?store_category=CD002001&prod_id=<c:out value="${mainItem1List.prod_id}"/>" class="productbox <c:out value="${is_favorite }"/>">
									<em class="pic"><img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${mainItem1List.prod_img_1}"/>&fileSn=0" style="width: 100%;" onerror="this.src='/images/baseScmtour/noimg_615.png';"/></em>
									<em class="txt w100">
										<span class="subject"><c:out value="${mainItem1List.prod_nm}"/></span>
										<span class="subcon">
											<c:out value="${mainItem1List.prod_comment}"/>
										</span>
									</em>
								</a>
								<a href="/shop/itemView.do?store_category=CD002001&prod_id=<c:out value="${mainItem1List.prod_id}"/>" class="heartbox <c:if test="${mainItem1List.is_fav eq '1' }">active</c:if>"><i class="fas fa-heart"></i></a>
							</li>
							</c:forEach>
						</ul>