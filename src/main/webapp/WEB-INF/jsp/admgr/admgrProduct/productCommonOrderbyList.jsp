<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

				<!-- 축제/체험 상품리스트 { -->
				<table class="admin_tbl admin_list_tbl mgt10px">
					<caption>상점 리스트</caption>
					<c:choose>
					<c:when test="${store_category ne 'CD002004' }">
					<colgroup>
						<col width="80" />
						<col width="120" />
						<col />
						<col width="150" />
						<col width="120" />
						<col width="120" />
						<col width="80" />
						<col width="120" />
						<col width="120" />
						<col width="120" />
						<col width="130" />
					</colgroup>
					<thead>
						<tr>
							<th>번호</th>
							<th colspan="2">상품명</th>
							<th>판매업체</th>
							<th>판매 시작일시</th>
							<th>판매 종료일시</th>
							<th>조회</th>
							<th>순서</th>
							<th>상태</th>
							<th>결제</th>
							<th>관리</th>
						</tr>
					</thead>
					</c:when>
					<c:otherwise>
					<colgroup>
						<col width="80" />
						<col width="100" />
						<col width="120" />
						<col />
						<col width="150" />
						<col width="100" />
						<%--
						<col width="80" />
						 --%>
						<col width="80" />
						<col width="120" />
						<col width="120" />
						<col width="120" />
						<col width="130" />
					</colgroup>
					<thead>
						<tr>
							<th>번호</th>
							<th>분류</th>
							<th colspan="2">상품명</th>
							<th>판매업체</th>
							<th>판매가</th>
							<%--
							<th>재고</th>
							 --%>
							<th>조회</th>
							<th>순서</th>
							<th>상태</th>
							<th>결제</th>
							<th>관리</th>
						</tr>
					</thead>
					</c:otherwise>
					</c:choose>
					
					<tbody>
						<c:forEach var="prodList" items="${prodList}" varStatus="status">
						<tr>
							<form action="/admgr/admgrProduct/productOrderbySave.do">
							<input type="hidden" name="pageIndex" value="<c:out value="${paginationInfo.currentPageNo }"/>" />
							<input type="hidden" name="store_category" value="<c:out value="${store_category }"/>" />
							<input type="hidden" name="prod_category" value="<c:out value="${prod_category }"/>" />
							<input type="hidden" name="searchKey" value="<c:out value="${searchKey }" />" />
							<input type="hidden" name="searchKeyword" value="<c:out value="${searchKeyword }"/>" />
							<input type="hidden" name="prod_id" value="<c:out value="${prodList.prod_id}" />" />
							<input type="hidden" name="prod_seq" value="<c:out value="${prodList.prod_seq}" />" />
							<!--  <input type="hidden" name="prod_use_pay_st" value="<c:out value="${prodList.prod_use_pay_st}"/>" />-->
							<td class="alignCenter"><c:out value="${StartPageNumber-status.count}"/></td>
							<c:choose>
							<c:when test="${store_category ne 'CD002004' }">
							<td class="alignCenter"><img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${prodList.prod_img_1}"/>&fileSn=0" width="100"  onerror="this.src='/images/baseScmtour/_noImage.png';"/></td>
							<td><c:if test="${prodList.is_recom >0}"><span class="btns aquabtn h24px">추천여행상품</span><br /></c:if>
								<c:if test="${prodList.prod_use_st eq 'Y' }">
								<c:choose>
								<c:when test="${store_category ne 'CD002004' }">
								<a href="/shop/itemView.do?store_category=<c:out value="${store_category }"/>&prod_id=<c:out value="${prodList.prod_id }"/>" target="_blank">
								<c:out value="${prodList.prod_nm}"/> &nbsp;&nbsp;<i class="fas fa-external-link-alt"></i>
								</a>
								</c:when>
								<c:otherwise>
								<a href="/shop/itemView.do?store_category=<c:out value="${store_category }"/>&prod_category=<c:out value="${prodList.prod_category }"/>&prod_id=<c:out value="${prodList.prod_id }"/>"  target="_blank">
								<c:out value="${prodList.prod_nm}"/> &nbsp;&nbsp;<i class="fas fa-external-link-alt"></i>
								</a>
								</c:otherwise>
								</c:choose>
								</c:if>
								
								<c:if test="${prodList.prod_use_st ne 'Y' }">
								<c:out value="${prodList.prod_nm}"/>
								</c:if>
							</td>
							<td class="alignCenter"><c:out value="${prodList.store_nm}"/></td>
							<td class="alignCenter"><c:out value="${prodList.prod_st_dt_ymd}"/><br /><c:out value="${prodList.prod_st_dt_hour}"/>:<c:out value="${prodList.prod_st_dt_minute}"/></td>
							<td class="alignCenter"><c:out value="${prodList.prod_ed_dt_ymd}"/><br /><c:out value="${prodList.prod_ed_dt_hour}"/>:<c:out value="${prodList.prod_ed_dt_minute}"/></td>
							</c:when>
							<c:otherwise>
							<td class="alignCenter"><c:out value="${prodList.prod_category_nm}"/></td>
							<td class="alignCenter"><img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${prodList.prod_img_1}"/>&fileSn=0" width="100"  onerror="this.src='/images/baseScmtour/_noImage.png';"/></td>
							<td><small class="colorGray">[<c:out value="${prodList.prod_id}"/>]</small><br />
								<c:if test="${prodList.prod_use_st eq 'Y' }">
								<c:choose>
								<c:when test="${store_category ne 'CD002004' }">
								<a href="/shop/itemView.do?store_category=<c:out value="${store_category }"/>&prod_id=<c:out value="${prodList.prod_id }"/>" target="_blank">
								<c:out value="${prodList.prod_nm}"/> &nbsp;&nbsp;<i class="fas fa-external-link-alt"></i>
								</a>
								</c:when>
								<c:otherwise>
								<a href="/shop/itemView.do?store_category=<c:out value="${store_category }"/>&prod_category=<c:out value="${prodList.prod_category }"/>&prod_id=<c:out value="${prodList.prod_id }"/>"  target="_blank">
								<c:out value="${prodList.prod_nm}"/> &nbsp;&nbsp;<i class="fas fa-external-link-alt"></i>
								</a>
								</c:otherwise>
								</c:choose>
								</c:if>
								
								<c:if test="${prodList.prod_use_st ne 'Y' }">
								<c:out value="${prodList.prod_nm}"/>
								</c:if>							
							</td>
							<td class="alignCenter"><c:out value="${prodList.store_nm}"/></td>
							<td class="alignRight"><fmt:formatNumber value="${prodList.prod_price }" type="number"/>원</td>
							<%--
							<td class="alignCenter">34,582</td>
							 --%>
							</c:otherwise>
							</c:choose>
							<td class="alignCenter"><fmt:formatNumber value="${prodList.prod_hit_cnt }" type="number"/></td>
							<td class="alignCenter"><input type="text" name="prod_orderby" id="prod_orderby" value="${prodList.prod_orderby}" class="admin_input w100px"/></td>
							<td class="alignCenter">
								<select id="prod_use_st" name="prod_use_st" class="basic_select w100px">
									<option value="Y" <c:if test="${prodList.prod_use_st eq 'Y' }">selected</c:if> >판매중</option>
									<option value="N" <c:if test="${prodList.prod_use_st eq 'N' }">selected</c:if> >판매중지</option>
								</select>
							</td>
							<td class="alignCenter">
								<select id="prod_use_pay_st" name="prod_use_pay_st" class="basic_select w100px">
									<option value="Y" <c:if test="${prodList.prod_use_pay_st eq 'Y' }">selected</c:if> >사용</option>
									<option value="N" <c:if test="${empty prodList.prod_use_pay_st || prodList.prod_use_pay_st eq 'N' }">selected</c:if> >사용안함</option>
								</select>
							</td>
							<td class="alignCenter">
								<button type="submit" class="btns bluebtn h24px">수정</button>
							</td>
						</tr>
						</form>
						</c:forEach>
					</tbody>
				</table>
				<!-- } 축제/체험 상품리스트 -->
