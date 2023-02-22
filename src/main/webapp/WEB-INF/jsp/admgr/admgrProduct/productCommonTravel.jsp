<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

				<div class="btnarea alignRight mgt30px">
					<ul class="nopm floats">
						<li><a href="/admgr/admgrProduct/productList.do?pageIndex=<c:out value="${pageIndex }"/>&store_category=<c:out value="${store_category }"/>&searchKey=<c:out value="${searchKey }"/>&searchKeyword=<c:out value="${searchKey }"/>" class="btns "><i class="fal fa-list"></i> 목록으로</a></li>
						<li class="fr"><button type="submit" class="btns redbtn"><i class="far fa-save"></i> 저장</button></li>

					</ul>
				</div>
				
				<!-- 추천관광지 { -->
				<article class="page_sortation">
					<h2 class="h2Tit"><i class="fal fa-window-minimize"></i> 추천관광지 <small>관광지는 <span class="colorRed">10개</span>까지 등록가능</small></h2>
					<table class="admin_tbl admin_write_tbl">
						<caption>추천관광지</caption>
						<colgroup>
							<col width="200" />
							<col width="400" />
							<col width="120" />
							<col />
						</colgroup>
						<tbody>

							<tr>
								<th>추천관광지 #1</th>
								<td>
									<input type="hidden" id="prod_recom_pord_id_1" name="prod_recom_1" value="<c:out value="${prodInfo.prod_recom_1 }"/>" />
									<input type="hidden" id="prod_recom_store_category_1" name="" value="" />
									<input type="text" id="prod_recom_prod_nm_1" class="admin_input readonly" size="30" readonly value="<c:out value="${prodRecomInfo_1.prod_nm }"/>" />
									<button type="button" class="btns graybtn" onclick="getProductsarchModalOpen('prod_recom_pord_id_1', 'prod_recom_prod_nm_1','prod_recom_store_category_1');">검색</button>
								</td>
								<td id="recom1_img"><c:if test="${not empty prodInfo.prod_recom_1 }"><img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${prodRecomInfo_1.prod_img_1}"/>&fileSn=0" width="100"  onerror="this.src='/images/baseScmtour/_noImage.png';"/></c:if></td>
								<td id="recom1_nm">
									<c:if test="${not empty prodInfo.prod_recom_1 }">
										<c:out value="${prodRecomInfo_1.prod_nm}"/> - (상점명: <c:out value="${prodRecomInfo_1.store_nm}"/>)<br><br><button type="button" class="btns graybtn h24px" onclick="recom_del('1');">삭제</button>
									</c:if>
								</td>
							</tr>
							<tr>
								<th>추천관광지 #2</th>
								<td>
									<input type="hidden" id="prod_recom_pord_id_2" name="prod_recom_2" value="<c:out value="${prodInfo.prod_recom_2 }"/>" />
									<input type="hidden" id="prod_recom_store_category_2" name="" value="" />
									<input type="text" id="prod_recom_prod_nm_2" class="admin_input readonly" size="30" readonly value="<c:out value="${prodRecomInfo_2.prod_nm }"/>" />
									<button type="button" class="btns graybtn" onclick="getProductsarchModalOpen('prod_recom_pord_id_2', 'prod_recom_prod_nm_2','prod_recom_store_category_2');">검색</button>
								</td>
								<td id="recom2_img"><c:if test="${not empty prodInfo.prod_recom_2 }"><img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${prodRecomInfo_2.prod_img_1}"/>&fileSn=0" width="100"  onerror="this.src='/images/baseScmtour/_noImage.png';"/></c:if></td>
								<td id="recom2_nm">
									<c:if test="${not empty prodInfo.prod_recom_2 }">
										<c:out value="${prodRecomInfo_2.prod_nm}"/> - (상점명: <c:out value="${prodRecomInfo_2.store_nm}"/>)<br><br><button type="button" class="btns graybtn h24px" onclick="recom_del('2');">삭제</button>
									</c:if>
								</td>
							</tr>
							<tr>
								<th>추천관광지 #3</th>
								<td>
									<input type="hidden" id="prod_recom_pord_id_3" name="prod_recom_3" value="<c:out value="${prodInfo.prod_recom_3 }"/>" />
									<input type="hidden" id="prod_recom_store_category_3" name="" value="" />
									<input type="text" id="prod_recom_prod_nm_3" class="admin_input readonly" size="30" readonly value="<c:out value="${prodRecomInfo_3.prod_nm }"/>" />
									<button type="button" class="btns graybtn" onclick="getProductsarchModalOpen('prod_recom_pord_id_3', 'prod_recom_prod_nm_3','prod_recom_store_category_3');">검색</button>
								</td>
								<td id="recom3_img"><c:if test="${not empty prodInfo.prod_recom_3 }"><img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${prodRecomInfo_3.prod_img_1}"/>&fileSn=0" width="100"  onerror="this.src='/images/baseScmtour/_noImage.png';"/></c:if></td>
								<td id="recom3_nm">
									<c:if test="${not empty prodInfo.prod_recom_3 }">
										<c:out value="${prodRecomInfo_3.prod_nm}"/> - (상점명: <c:out value="${prodRecomInfo_3.store_nm}"/>)<br><br><button type="button" class="btns graybtn h24px" onclick="recom_del('3');">삭제</button>
									</c:if>
								</td>
							</tr>
							<tr>
								<th>추천관광지 #4</th>
								<td>
									<input type="hidden" id="prod_recom_pord_id_4" name="prod_recom_4" value="<c:out value="${prodInfo.prod_recom_4 }"/>" />
									<input type="hidden" id="prod_recom_store_category_4" name="" value="" />
									<input type="text" id="prod_recom_prod_nm_4" class="admin_input readonly" size="30" readonly value="<c:out value="${prodRecomInfo_4.prod_nm }"/>" />
									<button type="button" class="btns graybtn" onclick="getProductsarchModalOpen('prod_recom_pord_id_4', 'prod_recom_prod_nm_4','prod_recom_store_category_4');">검색</button>
								</td>
								<td id="recom4_img"><c:if test="${not empty prodInfo.prod_recom_4 }"><img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${prodRecomInfo_4.prod_img_1}"/>&fileSn=0" width="100"  onerror="this.src='/images/baseScmtour/_noImage.png';"/></c:if></td>
								<td id="recom4_nm">
									<c:if test="${not empty prodInfo.prod_recom_4 }">
										<c:out value="${prodRecomInfo_4.prod_nm}"/> - (상점명: <c:out value="${prodRecomInfo_4.store_nm}"/>)<br><br><button type="button" class="btns graybtn h24px" onclick="recom_del('4');">삭제</button>
									</c:if>
								</td>
							</tr>
							<tr>
								<th>추천관광지 #5</th>
								<td>
									<input type="hidden" id="prod_recom_pord_id_5" name="prod_recom_5" value="<c:out value="${prodInfo.prod_recom_5 }"/>" />
									<input type="hidden" id="prod_recom_store_category_5" name="" value="" />
									<input type="text" id="prod_recom_prod_nm_5" class="admin_input readonly" size="30" readonly value="<c:out value="${prodRecomInfo_5.prod_nm }"/>" />
									<button type="button" class="btns graybtn" onclick="getProductsarchModalOpen('prod_recom_pord_id_5', 'prod_recom_prod_nm_5','prod_recom_store_category_5');">검색</button>
								</td>
								<td id="recom5_img"><c:if test="${not empty prodInfo.prod_recom_5 }"><img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${prodRecomInfo_5.prod_img_1}"/>&fileSn=0" width="100"  onerror="this.src='/images/baseScmtour/_noImage.png';"/></c:if></td>
								<td id="recom5_nm">
									<c:if test="${not empty prodInfo.prod_recom_5 }">
										<c:out value="${prodRecomInfo_5.prod_nm}"/> - (상점명: <c:out value="${prodRecomInfo_5.store_nm}"/>)<br><br><button type="button" class="btns graybtn h24px" onclick="recom_del('5');">삭제</button>
									</c:if>
								</td>
							</tr>
							<tr>
								<th>추천관광지 #6</th>
								<td>
									<input type="hidden" id="prod_recom_pord_id_6" name="prod_recom_6" value="<c:out value="${prodInfo.prod_recom_6 }"/>" />
									<input type="hidden" id="prod_recom_store_category_6" name="" value="" />
									<input type="text" id="prod_recom_prod_nm_6" class="admin_input readonly" size="30" readonly value="<c:out value="${prodRecomInfo_6.prod_nm }"/>" />
									<button type="button" class="btns graybtn" onclick="getProductsarchModalOpen('prod_recom_pord_id_6', 'prod_recom_prod_nm_6','prod_recom_store_category_6');">검색</button>
								</td>
								<td id="recom6_img"><c:if test="${not empty prodInfo.prod_recom_6 }"><img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${prodRecomInfo_6.prod_img_1}"/>&fileSn=0" width="100"  onerror="this.src='/images/baseScmtour/_noImage.png';"/></c:if></td>
								<td id="recom6_nm">
									<c:if test="${not empty prodInfo.prod_recom_6 }">
										<c:out value="${prodRecomInfo_6.prod_nm}"/> - (상점명: <c:out value="${prodRecomInfo_6.store_nm}"/>)<br><br><button type="button" class="btns graybtn h24px" onclick="recom_del('6');">삭제</button>
									</c:if>
								</td>
							</tr>
							<tr>
								<th>추천관광지 #7</th>
								<td>
									<input type="hidden" id="prod_recom_pord_id_7" name="prod_recom_7" value="<c:out value="${prodInfo.prod_recom_7 }"/>" />
									<input type="hidden" id="prod_recom_store_category_7" name="" value="" />
									<input type="text" id="prod_recom_prod_nm_7" class="admin_input readonly" size="30" readonly value="<c:out value="${prodRecomInfo_7.prod_nm }"/>" />
									<button type="button" class="btns graybtn" onclick="getProductsarchModalOpen('prod_recom_pord_id_7', 'prod_recom_prod_nm_7','prod_recom_store_category_7');">검색</button>
								</td>
								<td id="recom7_img"><c:if test="${not empty prodInfo.prod_recom_7 }"><img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${prodRecomInfo_7.prod_img_1}"/>&fileSn=0" width="100"  onerror="this.src='/images/baseScmtour/_noImage.png';"/></c:if></td>
								<td id="recom7_nm">
									<c:if test="${not empty prodInfo.prod_recom_7 }">
										<c:out value="${prodRecomInfo_7.prod_nm}"/> - (상점명: <c:out value="${prodRecomInfo_7.store_nm}"/>)<br><br><button type="button" class="btns graybtn h24px" onclick="recom_del('7');">삭제</button>
									</c:if>
								</td>
							</tr>
							<tr>
								<th>추천관광지 #8</th>
								<td>
									<input type="hidden" id="prod_recom_pord_id_8" name="prod_recom_8" value="<c:out value="${prodInfo.prod_recom_8 }"/>" />
									<input type="hidden" id="prod_recom_store_category_8" name="" value="" />
									<input type="text" id="prod_recom_prod_nm_8" class="admin_input readonly" size="30" readonly value="<c:out value="${prodRecomInfo_8.prod_nm }"/>" />
									<button type="button" class="btns graybtn" onclick="getProductsarchModalOpen('prod_recom_pord_id_8', 'prod_recom_prod_nm_8','prod_recom_store_category_8');">검색</button>
								</td>
								<td id="recom8_img"><c:if test="${not empty prodInfo.prod_recom_8 }"><img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${prodRecomInfo_8.prod_img_1}"/>&fileSn=0" width="100"  onerror="this.src='/images/baseScmtour/_noImage.png';"/></c:if></td>
								<td id="recom8_nm">
									<c:if test="${not empty prodInfo.prod_recom_8 }">
										<c:out value="${prodRecomInfo_8.prod_nm}"/> - (상점명: <c:out value="${prodRecomInfo_8.store_nm}"/>)<br><br><button type="button" class="btns graybtn h24px" onclick="recom_del('8');">삭제</button>
									</c:if>
								</td>
							</tr>
							<tr>
								<th>추천관광지 #9</th>
								<td>
									<input type="hidden" id="prod_recom_pord_id_9" name="prod_recom_9" value="<c:out value="${prodInfo.prod_recom_9 }"/>" />
									<input type="hidden" id="prod_recom_store_category_9" name="" value="" />
									<input type="text" id="prod_recom_prod_nm_9" class="admin_input readonly" size="30" readonly value="<c:out value="${prodRecomInfo_9.prod_nm }"/>" />
									<button type="button" class="btns graybtn" onclick="getProductsarchModalOpen('prod_recom_pord_id_9', 'prod_recom_prod_nm_9','prod_recom_store_category_9');">검색</button>
								</td>
								<td id="recom9_img"><c:if test="${not empty prodInfo.prod_recom_9 }"><img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${prodRecomInfo_9.prod_img_1}"/>&fileSn=0" width="100"  onerror="this.src='/images/baseScmtour/_noImage.png';"/></c:if></td>
								<td id="recom9_nm">
									<c:if test="${not empty prodInfo.prod_recom_9 }">
										<c:out value="${prodRecomInfo_9.prod_nm}"/> - (상점명: <c:out value="${prodRecomInfo_9.store_nm}"/>)<br><br><button type="button" class="btns graybtn h24px" onclick="recom_del('9');">삭제</button>
									</c:if>
								</td>
							</tr>
							<tr>
								<th>추천관광지 #10</th>
								<td>
									<input type="hidden" id="prod_recom_pord_id_10" name="prod_recom_10" value="<c:out value="${prodInfo.prod_recom_10 }"/>" />
									<input type="hidden" id="prod_recom_store_category_10" name="" value="" />
									<input type="text" id="prod_recom_prod_nm_10" class="admin_input readonly" size="30" readonly value="<c:out value="${prodRecomInfo_10.prod_nm }"/>" />
									<button type="button" class="btns graybtn" onclick="getProductsarchModalOpen('prod_recom_pord_id_10', 'prod_recom_prod_nm_10','prod_recom_store_category_10');">검색</button>
								</td>
								<td id="recom10_img"><c:if test="${not empty prodInfo.prod_recom_10 }"><img src="/cmm/fms/getImage.do?atchFileId=<c:out value="${prodRecomInfo_10.prod_img_1}"/>&fileSn=0" width="100"  onerror="this.src='/images/baseScmtour/_noImage.png';"/></c:if></td>
								<td id="recom10_nm">
									<c:if test="${not empty prodInfo.prod_recom_10 }">
										<c:out value="${prodRecomInfo_10.prod_nm}"/> - (상점명: <c:out value="${prodRecomInfo_10.store_nm}"/>)<br><br><button type="button" class="btns graybtn h24px" onclick="recom_del('10');">삭제</button>
									</c:if>
								</td>
							</tr>
						</tbody>
					</table>
				</article>
				<!-- } 추천관광지 -->
				
				<div class="btnarea alignRight mgt30px">
					<ul class="nopm floats">
						<li><a href="/admgr/admgrProduct/productList.do?pageIndex=<c:out value="${pageIndex }"/>&store_category=<c:out value="${store_category }"/>&searchKey=<c:out value="${searchKey }"/>&searchKeyword=<c:out value="${searchKey }"/>" class="btns "><i class="fal fa-list"></i> 목록으로</a></li>
						<li class="fr"><button type="submit" class="btns redbtn"><i class="far fa-save"></i> 저장</button></li>

					</ul>
				</div>