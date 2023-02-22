<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:if test="${store_category_type eq 'zone'}">
				<ul class="nopm" >
					<c:forEach var="favList" items="${favList}" varStatus="status">
					<c:choose>
					<c:when test="${not empty user_id }">
						<c:set var="func_ajax_pick" value="fav_prod_pick('${favList.prod_id }')" />
					</c:when>
					<c:otherwise>
						<c:set var="func_ajax_pick" value="getLogin('/shop/itemList.do?store_category=${store_category }')"/>
					</c:otherwise>
					</c:choose>
					<li>
						<a href="/shop/itemView.do?store_category=<c:out value="${favList.store_category}"/>&prod_id=<c:out value="${favList.prod_id }"/>" class="productbox">
							<em class="pic"><img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${favList.prod_img_1}"/>&fileSn=0" style="width: 100%;" onerror="this.src='/images/baseScmtour/_noImage.png';"/></em>
							<em class="txt w100">
								<span class="subject"><c:out value="${favList.prod_nm }"/> <small><c:out value="${favList.store_nm}"/></small></span>
								<span class="subcon">
									<c:out value="${favList.prod_comment }"/>
								</span>
							</em>
						</a>
						<a href="#;" id="prod_pick_<c:out value="${favList.prod_id }"/>" class="heartbox active" onclick="<c:out value="${func_ajax_pick}"/>"><i class="fas fa-heart"></i></a>
					</li>
					</c:forEach>
				</ul>
				<c:if test="${LastNum < ListCnt }">
				<div class="btnarea mgt10px" id="moreCall">
					<a href="javascript:getFavList(); " class="btns graybtn w100">더보기 <i class="fal fa-plus"></i></a>
				</div>
				</c:if>
</c:if>


<c:if test="${store_category_type eq 'market' }">
<ul class="nopm floats" >
				<ul class="nopm floats">
					<c:forEach var="favList" items="${favList}" varStatus="status">
					<li>
						<a href="/shop/itemView.do?store_category=<c:out value="${favList.store_category}"/>&prod_category=<c:out value="${favList.prod_category }"/>&prod_id=<c:out value="${favList.prod_id }"/>" class="pic"><img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${favList.prod_img_1}"/>&fileSn=0" style="width: 100%;" onerror="this.src='/images/baseScmtour/_noImage.png';"/></a>
						<a href="/shop/itemView.do?store_category=<c:out value="${favList.store_category}"/>&prod_category=<c:out value="${favList.prod_category }"/>&prod_id=<c:out value="${favList.prod_id }"/>" class="txt">
							<span class="store">[<c:out value="${favList.store_nm }"/>]</span>
							<em class="subject"><c:out value="${favList.prod_nm }"/></em>
							<span class="price"><fmt:formatNumber value="${favList.prod_price}" type="number"/> <small>원</small></span>
						</a>
					</li>
					</c:forEach>
				</ul>
				<c:if test="${LastNum < ListCnt }">
				<div class="btnarea mgt10px" id="moreCall">
					<a href="javascript:getFavList(); " class="btns graybtn w100">더보기 <i class="fal fa-plus"></i></a>
				</div>
				</c:if>
</c:if>
