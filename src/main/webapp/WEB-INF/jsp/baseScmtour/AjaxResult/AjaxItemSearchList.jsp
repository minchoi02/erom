<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:if test="${store_category eq 'CD002001' || store_category eq 'CD002002' || store_category eq 'CD002003'}">
					<ul class="nopm floats">
						<c:forEach var="categoryList" items="${categoryList}" varStatus="status">
						<li>
							<a href="/shop/itemView.do?store_category=<c:out value="${store_category}"/>&prod_id=<c:out value="${categoryList.prod_id}"/>" class="pic"><img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${categoryList.prod_img_1}"/>&fileSn=0" onerror="this.src='/images/baseScmtour/noimg_615.png';"/></a>
							<a href="/shop/itemView.do?store_category=<c:out value="${store_category}"/>&prod_id=<c:out value="${categoryList.prod_id}"/>" class="txt">
								<em class="subject"><c:out value="${categoryList.prod_nm}"/></em>
								<span class="loca"><c:out value="${categoryList.store_nm}"/></span>
								<span class="goodnum"><b class="colorOrange"><i class="fas fa-heart"></i></b> <fmt:formatNumber value="${categoryList.prod_hit_cnt}" type="number"/></span>
							</a>
						</li>
						</c:forEach>
					</ul>	
</c:if>					
<c:if test="${store_category eq 'CD002004'}">					
					<ul class="nopm floats">
						<c:forEach var="categoryList" items="${categoryList}" varStatus="status">
						<li>
							<a href="/shop/itemView.do?store_category=<c:out value="${store_category}"/>&prod_category=<c:out value="${categoryList.prod_category}"/>&prod_id=<c:out value="${categoryList.prod_id}"/>" class="pic"><img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${categoryList.prod_img_1}"/>&fileSn=0" onerror="this.src='/images/baseScmtour/noimg_615.png';"/></a>
							<a href="/shop/itemView.do?store_category=<c:out value="${store_category}"/>&prod_category=<c:out value="${categoryList.prod_category}"/>&prod_id=<c:out value="${categoryList.prod_id}"/>" class="txt">
								<span class="store">[<c:out value="${categoryList.store_nm}"/>]</span>
								<em class="subject"><c:out value="${categoryList.prod_nm}"/></em>
								<span class="price"><fmt:formatNumber value="${categoryList.prod_price}" type="number"/> <small>원</small></span>
							</a>
						</li>
						</c:forEach>
					</ul>
</c:if>					

				<c:if test="${LastNum < TotalCnt }">
				<div class="btnarea mgt10px" id="moreCall">
					<a href="javascript:getSearchItemList(); " class="btns graybtn w100">더보기 <i class="fal fa-plus"></i></a>
				</div>
				</c:if>
				
<c:if test="${empty categoryList }">
<br>
<center><p class="comment" style="color: #ff6600;">검색된 상품이 없습니다.</p></center>
</c:if>				