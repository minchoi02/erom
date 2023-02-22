<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
						<h2 class="mainTit alignCenter"><em>베스트 특산품</em></h2>
						<ul class="nopm floats">
							<c:forEach var="mainItem4List" items="${mainItem4List}" varStatus="status">
							<c:set var="is_favorite" value=""/>
							<li>
								<a href="/shop/itemView.do?store_category=CD002004&prod_category=<c:out value="${mainItem4List.prod_category}"/>&prod_id=<c:out value="${mainItem4List.prod_id}"/>" class="pic"><img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${mainItem4List.prod_img_1}"/>&fileSn=0" style="width: 100%;" onerror="this.src='/images/baseScmtour/noimg_615.png';"/></a>
								<a href="/shop/itemView.do?store_category=CD002004&prod_category=<c:out value="${mainItem4List.prod_category}"/>&prod_id=<c:out value="${mainItem4List.prod_id}"/>" class="txt">
									<span class="store">[<c:out value="${mainItem4List.store_nm}"/>]</span>
									<em class="subject"><c:out value="${mainItem4List.prod_nm}"/></em>
									<span class="price"><fmt:formatNumber value="${mainItem4List.prod_price}" type="number"/> <small>원</small></span>
								</a>
							</li>
							</c:forEach>
						</ul>