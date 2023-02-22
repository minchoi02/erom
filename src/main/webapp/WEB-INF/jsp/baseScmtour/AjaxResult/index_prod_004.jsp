<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
							<ul class="nopm floats">
								<c:forEach var="weekList4" items="${weekList4}" varStatus="status">
								<li>
									<a href="/shop/itemView.do?store_category=CD002004&prod_category=<c:out value="${weekList4.prod_category}"/>&prod_id=<c:out value="${weekList4.prod_id}"/>" class="pic"><img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${weekList4.prod_img_1}"/>&fileSn=0" style="width: 100%;" onerror="this.src='/images/baseScmtour/noimg_615.png';"/></a>
									<a href="/shop/itemView.do?store_category=CD002004&prod_category=<c:out value="${weekList4.prod_category}"/>&prod_id=<c:out value="${weekList4.prod_id}"/>" class="txt">
										<span class="store">[<c:out value="${weekList4.store_nm}"/>]</span>
										<em class="subject"><c:out value="${weekList4.prod_nm}"/></em>
										<span class="price"><fmt:formatNumber value="${weekList4.prod_price}" type="number"/> <small>원</small></span>
									</a>
								</li>
								</c:forEach>
							</ul>
