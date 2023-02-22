<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:import url="/Api/admgrIncludeTop.do"/>
<c:import url="/Api/admgrIncludeLeftMenu.do"/>

		<!-- 콘텐츠 영역 { -->
		<div id="content">
			<h1 class="bigTit">이롬스토어 상품 등록</h1>

			<!-- 상품관리 > 서천장터 > 글쓰기 { -->
			<section id="productMarketWrite" class="page_content">
				<c:import url="./productCommonForm.jsp"/>
				
				<!-- 요금정보 { -->
				<article class="page_sortation">
					<h2 class="h2Tit"><i class="fal fa-window-minimize"></i> 요금 및 상품정보</h2>
					<table class="admin_tbl admin_write_tbl">
						<caption>요금정보</caption>
						<colgroup>
							<col width="200" />
							<col />
							<col width="200" />
							<col />
						</colgroup>
						<tbody>
							<tr>
								<th>제조사</th>
								<td><input type="text" id="prod_maker" name="prod_maker" class="admin_input" size="40" value="<c:out value="${prodInfo.prod_maker }"/>" /></td>
								<th>원산지</th>
								<td><input type="text" id="prod_country" name="prod_country" class="admin_input" size="40" value="<c:out value="${prodInfo.prod_country }"/>" /></td>
							</tr>
							<tr>
								<th>시중가</th>
								<td><input type="text" id="prod_market_price" name="prod_market_price" class="admin_input alignRight" size="30" value="<c:out value="${prodInfo.prod_market_price }"/>"/> 원</td>
								<th>판매가</th>
								<td><input type="text" id="prod_price" name="prod_price" class="admin_input alignRight" size="30" value="<c:out value="${prodInfo.prod_price }"/>"/> 원</td>
							</tr>
							<tr>
								<th>할인율(출력될 할인율)</th>
								<td><input type=text id="prod_price_percent" name="prod_price_percent" class="admin_input alignRight" size="10" maxlength="2"   value="<c:out value="${prodInfo.prod_price_percent }"/>"/> %</td>							
							<%--
							<tr>
								<th>최소주문금액</th>
								<td colspan="3">
									<p class="comment">* 장바구니 담기 전, 주문금액 총합 최소기준입니다.</p>
									<p class="comment">* 제한을 없애려면, 0원으로 설정하세요.</p>
									<input type="text" id="prod_min_price" name="prod_min_price" class="admin_input alignRight" size="10" value="<c:out value="${prodInfo.prod_min_price }"/>"/> 원
								</td>
							</tr>
							 --%>
							<tr>
								<th>옵션가격 &nbsp;&nbsp; <a href="#;" onclick="option_price_add()" class="btns whitebtn h24px"><i class="fal fa-plus"></i></a><input type="hidden" value="<c:out value="${option_cnt }"/>" id="option_cnt" ></th>
								<td colspan="3" id="option_list">
									<c:set var="optcnt" value="1"/>
									<p class="comment">* 옵션명과 가격이 모두 입력되어야만 저장되며, 삭제시 반드시 저장을 하여야 합니다.<br>* 각개 금액으로 산정됩니다.  옵션상품가격을 정액으로 기입하세요. </p>
									<c:forEach var="prodOptionInfo" items="${prodOptionInfo}" varStatus="status">
									<div id="option_<c:out value="${optcnt }"/>" >
										<a href="#;" onclick="option_delete('<c:out value="${optcnt }"/>')" class="btns whitebtn h24px"><i class="fal fa-minus" ></i></a>&nbsp;&nbsp;
										<input type="text" id="option_nm_<c:out value="${optcnt }"/>'" name="prod_option_nm" class="admin_input" size="35" placeholder="내용" value="<c:out value="${prodOptionInfo.opt_nm}"/>" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<input type="text" id="option_price_<c:out value="${optcnt }"/>'" name="prod_option_price" class="admin_input alignRight" size="10" placeholder="가격" value="<c:out value="${prodOptionInfo.opt_price}"/>"  /> 원
									</div>
									<c:set var="optcnt" value="${optcnt+1}"/>
									</c:forEach>
								</td>
							</tr>
						</tbody>
					</table>
				</article>
				<!-- } 요금정보 -->

				<!-- 전자상거래 등에서 상품제공 고시 { -->
				<c:import url="./productCommonInformation.jsp"/>
				

				<div class="btnarea alignRight mgt30px">
					<ul class="nopm floats">
						<li><a href="/admgr/admgrProduct/productList.do?pageIndex=<c:out value="${pageIndex }"/>&store_category=<c:out value="${store_category }"/>&searchKey=<c:out value="${searchKey }"/>&searchKeyword=<c:out value="${searchKey }"/>" class="btns "><i class="fal fa-list"></i> 목록으로</a></li>
						<li class="fr"><button type="submit" class="btns redbtn"><i class="far fa-save"></i> 저장</button></li>

					</ul>
				</div>
			</section>
			<!-- } 상품관리 > 서천장터 > 글쓰기 -->
		</div>
		<!-- } 콘텐츠 영역 -->

		<script>
			getEditor('prod_content');
		</script>


<c:import url="/Api/admgrIncludeBottom.do"/>