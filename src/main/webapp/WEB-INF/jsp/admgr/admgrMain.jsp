<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:import url="/Api/admgrIncludeTop.do"/>

<c:choose>
	<c:when test="${adminLevel eq '10' }">
		<section id="mainContainer" class="floats">
			<div class="maincon floats">
				<div class="tbl_menu">
					<h2 class="h2Tit">신규회원</h2>	
					<div class="admin_tbl_wrap">
						<table class="admin_tbl admin_list_tbl">
							<caption>회원리스트</caption>
							<colgroup>
								<col>
								<col>
								<col>
								<col>
							</colgroup>
							<thead>
								<tr>
									<th>회원아이디</th>
									<th>회원등급</th>
									<th>회원명</th>
									<th>가입일</th>
								</tr>
							</thead>
							<tbody>
							<c:forEach var="mainMemberList" items="${mainMemberList}" varStatus="status">
								<tr>
									<td class="alignCenter"><a href="/admgr/admgrMember/memberForm.do?member_seq=<c:out value="${mainMemberList.user_seq }"/>">
									<c:choose>
										<c:when test="${mainMemberList.user_join_fl eq 'naver'}"><img src="/images/baseScmtour/ico_naver.png" height="22" alt="네이버"> </c:when>
										<c:when test="${mainMemberList.user_join_fl eq 'kakao'}"><img src="/images/baseScmtour/ico_kakao.png" height="22" alt="카카오"> </c:when>
										<c:when test="${mainMemberList.user_join_fl eq 'facebook'}"><img src="/images/baseScmtour/ico_facebook.png" height="22" alt="페이스북"> </c:when>
										<c:when test="${mainMemberList.user_join_fl eq 'google'}"><img src="/images/baseScmtour/ico_google.png" height="22" alt="구글"> </c:when>
										<c:when test="${mainMemberList.user_join_fl eq 'apple'}"><img src="/images/baseScmtour/ico_apple.png" height="22" alt="애플"> </c:when>
										<c:otherwise></c:otherwise>
									</c:choose>
									<c:out value="${mainMemberList.user_id }"/>
									</a>
									</td>
									<td class="alignCenter">
									<c:choose>
										<c:when test="${mainMemberList.user_level eq '5'}">상점회원</c:when>
										<c:when test="${mainMemberList.user_level eq '10'}">관리자</c:when>
										<c:when test="${mainMemberList.user_level eq '1'}">탈퇴회원</c:when>
										<c:otherwise>일반회원</c:otherwise>
									</c:choose>
									</td>
									<td class="alignCenter"><c:out value="${mainMemberList.user_nm }"/></td>
									<td class="alignCenter"><c:out value="${mainMemberList.reg_dt}"/></td>
								</tr>
							</c:forEach>
							</tbody>
						</table>
					</div>
					<a href="/admgr/admgrMember/memberList.do" class="btn_more">더보기 +</a>
				</div>
				<div class="tbl_menu">
					<h2 class="h2Tit">최근주문</h2>	
					<div class="admin_tbl_wrap">
						<table class="admin_tbl admin_list_tbl">
							<caption>최근주문</caption>
							<colgroup>
								<col width="25%">
								<col>
								<col>
								<col>
								<col>
							</colgroup>
							<thead>
								<tr>
									<th>주문번호</th>
									<th>주문자</th>
									<th>주문금액</th>
									<th>주문일</th>
									<th>결제상태</th>
								</tr>
							</thead>
							<tbody>
							<c:forEach var="mainOrderList" items="${mainOrderList}" varStatus="status">
								<tr>
									<td class="alignCenter"><a href="#"><c:out value="${mainOrderList.order_id }"/><a/>
									</td>
									<td class="alignCenter"><c:out value="${mainOrderList.order_user_nm }"/>(<c:out value="${mainOrderList.order_user_id }"/>)</td>
									<td class="alignCenter"><c:out value="${mainOrderList.order_total_price }"/></td>
									<td class="alignCenter"><c:out value="${mainOrderList.reg_dt}"/></td>
									<td class="alignCenter">
									<c:choose>
										<c:when test="${mainOrderList.order_st eq 'READY'}">미결제</c:when>
										<c:when test="${mainOrderList.order_st eq 'PAYMENT'}">결제완료</c:when>
										<c:when test="${mainOrderList.order_st eq 'CANCEL'}">결제취소</c:when>
									</c:choose>
									</td>
								</tr>
							</c:forEach>
							</tbody>
						</table>
					</div>
					<a href="/admgr/admgrOrder/orderList.do" class="btn_more">더보기 +</a>
				</div>
				<div class="tbl_menu">
					<h2 class="h2Tit">최근 상품 QnA</h2>	
					<div class="admin_tbl_wrap">
						<table class="admin_tbl admin_list_tbl">
							<caption>최근 상품문의</caption>
							<colgroup>
								<col width="20%">
								<col width="20%">
								<col width="12%">
								<%-- <col width="20%"> --%>
								<col>
								<col width="10%">
							</colgroup>
							<thead>
								<tr>
									<th>등록일</th>
									<th>문의자</th>
									<th>분류</th>
									<!-- <th>상점</th> -->
									<th>상품</th>
									<th>답변상태</th>
								</tr>
							</thead>
							<tbody>
							<c:forEach var="mainQnaList" items="${mainQnaList}" varStatus="status">
								<tr>
									<td class="alignCenter"><a href="/admgr/admgrCustomer/qnaForm.do?bbs_seq=<c:out value="${mainQnaList.bbs_seq }"/>"><c:out value="${mainQnaList.reg_dt }"/><a/>
									</td>
									<td class="alignCenter" style="white-space:nowrap;"><c:out value="${mainQnaList.bbs_writer_nm }"/></td>
									<td class="alignCenter"><c:out value="${mainQnaList.store_category_nm }"/></td>
									<%-- <td class="alignCenter"><c:out value="${mainQnaList.store_nm }"/></td> --%>
									<td class="alignLeft" style="white-space:nowrap;"><a style="text-overflow:ellipsis;" href="/admgr/admgrCustomer/qnaForm.do?bbs_seq=<c:out value="${mainQnaList.bbs_seq }"/>"><c:out value="${mainQnaList.prod_nm }"/></a></td>
									<td class="alignCenter">
										<c:choose>
										<c:when test="${not empty mainQnaList.bbs_reply_content }">
											답변완료
										</c:when>
										<c:otherwise>답변대기</c:otherwise>
										</c:choose>
									</td>
								</tr>
							</c:forEach>
							</tbody>
						</table>
					</div>
					<a href="/admgr/admgrCustomer/qnaList.do" class="btn_more">더보기 +</a>
				</div>
				<div class="tbl_menu">
					<h2 class="h2Tit">최근 1:1 문의</h2>	
					<div class="admin_tbl_wrap">
						<table class="admin_tbl admin_list_tbl">
							<caption>최근 1:1 문의</caption>
							<colgroup>
								<col width="20%">
								<col width="15%">
								<col >
								<col width="10%">
							</colgroup>
							<thead>
								<tr>
									<th>등록일</th>
									<th>문의자</th>
									<th>문의내용</th>
									<th>답변상태</th>
								</tr>
							</thead>
							<tbody>
							<c:forEach var="mainMtmList" items="${mainMtmList}" varStatus="status">
								<tr>
									<td class="alignCenter"><a href="/admgr/admgrCustomer/mtmForm.do?bbs_seq=<c:out value="${mainMtmList.bbs_seq }"/>"><c:out value="${mainMtmList.reg_dt }"/><a/>
									</td>
									<td class="alignCenter"><c:out value="${mainMtmList.bbs_writer_nm }"/></td>
									<td class="alignLeft"><a href="/admgr/admgrCustomer/mtmForm.do?bbs_seq=<c:out value="${mainMtmList.bbs_seq }"/>"><c:out value="${mainMtmList.bbs_subject}"/></a></td>
									<td class="alignCenter">
										<c:choose>
										<c:when test="${not empty mainMtmList.bbs_reply_content }">
											답변완료
										</c:when>
										<c:otherwise>답변대기</c:otherwise>
										</c:choose>
									</td>
								</tr>
							</c:forEach>
							</tbody>
						</table>
					</div>
					<a href="/admgr/admgrCustomer/mtmList.do" class="btn_more">더보기 +</a>
				</div>
				<div class="tbl_menu">
					<h2 class="h2Tit">최근등록상품</h2>	
					<div class="admin_tbl_wrap">
						<table class="admin_tbl admin_list_tbl">
							<caption>최근등록상품</caption>
							<colgroup>
								<col width="15%">
								<col width="25%">
								<col>
								<col width="10%">
								<col width="20%">
							</colgroup>
							<thead>
								<tr>
									<th>카테고리</th>
									<th>상점명</th>
									<th>상품명</th>
									<th>상품상태</th>
									<th>등록일</th>
								</tr>
							</thead>
							<tbody>
							<c:forEach var="mainProductList" items="${mainProductList}" varStatus="status">
								<tr>
									<td class="alignCenter"><a href="/admgr/admgrProduct/productForm.do?store_category=<c:out value="${mainProductList.store_category}"/>&prod_seq=<c:out value="${mainProductList.prod_seq }"/>"><c:out value="${mainProductList.store_category_nm }"/><a/>
									</td>
									<td class="alignCenter"><c:out value="${mainProductList.store_nm }"/></td>
									<td class="alignCenter"><a href="/admgr/admgrProduct/productForm.do?store_category=<c:out value="${mainProductList.store_category}"/>&prod_seq=<c:out value="${mainProductList.prod_seq }"/>"><c:out value="${mainProductList.prod_nm }"/></a></td>
									<td class="alignCenter">
									<c:choose>
										<c:when test="${mainProductList.prod_use_st eq 'Y'}">판매중 </c:when>
										<c:when test="${mainProductList.prod_use_st eq 'N'}">판매중지 </c:when>
										<c:when test="${mainProductList.prod_use_st eq 'S'}">솔드아웃 </c:when>
										<c:otherwise></c:otherwise>
									</c:choose>
									</td>
									<td class="alignCenter"><c:out value="${mainProductList.reg_dt}"/></td>
								</tr>
							</c:forEach>
							</tbody>
						</table>
					</div>
					<a href="/admgr/admgrProduct/productList.do?store_category=CD002001" class="btn_more">더보기 +</a>
				</div>
				<%-- <div class="tbl_menu">
					<h2 class="h2Tit">최근 등록상점</h2>	
					<div class="admin_tbl_wrap">
						<table class="admin_tbl admin_list_tbl">
							<caption>최근 등록상점</caption>
							<colgroup>
								<col width="35%">
								<col width="35%">
								<col width="10%">
								<col>
							</colgroup>
							<thead>
								<tr>
									<th>상점명</th>
									<th>업체명</th>
									<th>상점상태</th>
									<th>등록일</th>
								</tr>
							</thead>
							<tbody>
							<c:forEach var="mainStoreList" items="${mainStoreList}" varStatus="status">
								<tr>
									<td class="alignCenter"><a href="/admgr/admgrStore/storeForm.do?bbs_seq=<c:out value="${mainStoreList.bbs_seq }"/>"><c:out value="${mainStoreList.store_nm }"/><a/>
									</td>
									<td class="alignCenter"><c:out value="${mainStoreList.store_company_nm }"/></td>
									<td class="alignCenter">
									<c:choose>
										<c:when test="${mainStoreList.store_use_st eq 'Y'}">운영 </c:when>
										<c:when test="${mainStoreList.store_use_st eq 'O'}">폐점 </c:when>
										<c:when test="${mainStoreList.store_use_st eq 'R'}">중지 </c:when>
										<c:otherwise></c:otherwise>
									</c:choose>
									</td>
									<td class="alignCenter"><c:out value="${mainStoreList.reg_dt}"/></td>
								</tr>
							</c:forEach>
							</tbody>
						</table>
					</div>
					<a href="/admgr/admgrStore/storeList.do" class="btn_more">더보기 +</a>
				</div> --%>
			</div>
		</section>
	</c:when>
	
	
	<c:otherwise>
		<section id="mainContainer" class="floats">
			<div class="maincon floats">
				<div class="tbl_menu">
					<h2 class="h2Tit">최근주문</h2>	
					<div class="admin_tbl_wrap">
						<table class="admin_tbl admin_list_tbl">
							<caption>최근주문</caption>
							<colgroup>
								<col>
								<col>
								<col>
								<col>
							</colgroup>
							<thead>
								<tr>
									<th>주문번호</th>
									<th>주문자</th>
									<th>주문금액</th>
									<th>주문일</th>
									<th>결제상태</th>
								</tr>
							</thead>
							<tbody>
							<c:forEach var="mainOrderList" items="${mainOrderList}" varStatus="status">
								<tr>
									<td class="alignCenter"><a href="#"><c:out value="${mainOrderList.order_id }"/><a/>
									</td>
									<td class="alignCenter"><c:out value="${mainOrderList.order_user_nm }"/>(<c:out value="${mainOrderList.order_user_id }"/>)</td>
									<td class="alignCenter"><c:out value="${mainOrderList.order_total_price }"/></td>
									<td class="alignCenter"><c:out value="${mainOrderList.reg_dt}"/></td>
									<td class="alignCenter"><c:out value="${mainOrderList.order_st}"/></td>
								</tr>
							</c:forEach>
							</tbody>
						</table>
					</div>
					<a href="/admgr/admgrOrder/orderList.do" class="btn_more">더보기 +</a>
				</div>
				<div class="tbl_menu">
					<h2 class="h2Tit">최근 상품 QnA</h2>	
					<div class="admin_tbl_wrap">
						<table class="admin_tbl admin_list_tbl">
							<caption>최근 상품문의</caption>
							<colgroup>
								<col width="20%">
								<col width="10%">
								<col width="12%">
								<col width="20%">
								<col>
								<col width="10%">
							</colgroup>
							<thead>
								<tr>
									<th>등록일</th>
									<th>문의자</th>
									<th>분류</th>
									<th>상점</th>
									<th>상품</th>
									<th>답변상태</th>
								</tr>
							</thead>
							<tbody>
							<c:forEach var="mainQnaList" items="${mainQnaList}" varStatus="status">
								<tr>
									<td class="alignCenter"><a href="/admgr/admgrCustomer/qnaForm.do?bbs_seq=<c:out value="${mainQnaList.bbs_seq }"/>"><c:out value="${mainQnaList.reg_dt }"/><a/>
									</td>
									<td class="alignCenter"><c:out value="${mainQnaList.bbs_writer_nm }"/></td>
									<td class="alignCenter"><c:out value="${mainQnaList.store_category_nm }"/></td>
									<td class="alignCenter"><c:out value="${mainQnaList.store_nm }"/></td>
									<td class="alignLeft"><a href="/admgr/admgrCustomer/qnaForm.do?bbs_seq=<c:out value="${mainQnaList.bbs_seq }"/>"><c:out value="${mainQnaList.prod_nm }"/></a></td>
									<td class="alignCenter">
										<c:choose>
										<c:when test="${not empty mainQnaList.bbs_reply_content }">
											답변완료
										</c:when>
										<c:otherwise>답변대기</c:otherwise>
										</c:choose>
									</td>
								</tr>
							</c:forEach>
							</tbody>
						</table>
					</div>
					<a href="/admgr/admgrCustomer/qnaList.do" class="btn_more">더보기 +</a>
				</div>
				<div class="tbl_menu">
					<h2 class="h2Tit">최근등록상품</h2>	
					<div class="admin_tbl_wrap">
						<table class="admin_tbl admin_list_tbl">
							<caption>최근등록상품</caption>
							<colgroup>
								<col width="15%">
								<col width="25%">
								<col>
								<col width="10%">
								<col width="20%">
							</colgroup>
							<thead>
								<tr>
									<th>카테고리</th>
									<th>상점명</th>
									<th>상품명</th>
									<th>상품상태</th>
									<th>등록일</th>
								</tr>
							</thead>
							<tbody>
							<c:forEach var="mainProductList" items="${mainProductList}" varStatus="status">
								<tr>
									<td class="alignCenter"><a href="/admgr/admgrProduct/productForm.do?store_category=<c:out value="${mainProductList.store_category}"/>&prod_seq=<c:out value="${mainProductList.prod_seq }"/>"><c:out value="${mainProductList.store_category_nm }"/><a/>
									</td>
									<td class="alignCenter"><c:out value="${mainProductList.store_nm }"/></td>
									<td class="alignCenter"><a href="/admgr/admgrProduct/productForm.do?store_category=<c:out value="${mainProductList.store_category}"/>&prod_seq=<c:out value="${mainProductList.prod_seq }"/>"><c:out value="${mainProductList.prod_nm }"/></a></td>
									<td class="alignCenter">
									<c:choose>
										<c:when test="${mainProductList.prod_use_st eq 'Y'}">판매중 </c:when>
										<c:when test="${mainProductList.prod_use_st eq 'N'}">판매중지 </c:when>
										<c:when test="${mainProductList.prod_use_st eq 'S'}">솔드아웃 </c:when>
										<c:otherwise></c:otherwise>
									</c:choose>
									</td>
									<td class="alignCenter"><c:out value="${mainProductList.reg_dt}"/></td>
								</tr>
							</c:forEach>
							</tbody>
						</table>
					</div>
					<a href="/admgr/admgrProduct/productList.do?store_category=CD002001" class="btn_more">더보기 +</a>
				</div>
			</div>
		</section>
	</c:otherwise>
</c:choose>
	
<c:import url="/Api/admgrIncludeBottom.do"/>