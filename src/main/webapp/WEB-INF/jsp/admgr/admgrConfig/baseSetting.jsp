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
			<h1 class="bigTit">기본환경설정</h1>
			<div class="pageComment">
				<div class="comment_ico"><i class="fad fa-comment-alt-smile"></i></div>
				<p>
					이롬 스토어의 기본적인 관리 환경을 세팅하는 페이지입니다.<br />
					설정을 변경하시고 꼭 <span class="colorRed">저장 버튼</span>을 눌러주세요.
				</p>
			</div>

			<!-- 환경설정 > 기본환경설정 { -->
			<form method="post" action="/admgr/admgrConfig/baseSettingSave.do"  id="basesettingForm" name="basesettingForm" onsubmit="return baseSettingset()" >
			<input type="hidden" id="save_path" value="Globals.file_edit_path" /> 
			<section id="baseSetting" class="page_content">
				<!-- 전체 기본설정 { -->
				<article class="page_sortation">
					<h2 class="h2Tit"><i class="fal fa-window-minimize"></i> 기본환경</h2>
					<table class="admin_tbl admin_write_tbl">
						<caption>전체 기본설정</caption>
						<colgroup>
							<col width="200" />
							<col />
						</colgroup>
						<tbody>
							<tr>
								<th>웹사이트 제목</th>
								<td><input type="text" autocomplete="no" id="site_nm" name="site_nm" class="admin_input" size="50" placeholder="웹사이트 제목을 입력하세요." value="<c:out value="${BaseConfig.site_nm }"/>" /></td>
							</tr>
							<tr>
								<th>관리자 메일</th>
								<td><input type="text" autocomplete="no" id="site_email" name="site_email" class="admin_input" size="30" placeholder="관리자이메일 주소를 입력하세요." value="<c:out value="${BaseConfig.site_email }"/>" /></td>
							</tr>
							<tr>
								<th>이용약관</th>
								<td><textarea id="site_use_rule" name="site_use_rule" class="admin_textarea w100" rows="7" placeholder="이용약관을 입력하세요."><c:out value="${BaseConfig.site_use_rule}"/></textarea></td>
							</tr>
							<tr>
								<th>개인정보처리방침</th>
								<td><textarea id="site_personal" name="site_personal" class="admin_textarea w100" rows="7" placeholder="개인정보처리방침 입력하세요."><c:out value="${BaseConfig.site_personal }"/></textarea></td>
							</tr>
							<tr>
								<th>위치정보동의</th>
								<td><textarea id="site_agree_place" name="site_agree_place" class="admin_textarea w100" rows="7" placeholder="위치정보동의를 입력하세요."><c:out value="${BaseConfig.site_agree_place }"/></textarea></td>
							</tr>
							<tr>
								<th>방문자분석 스크립트</th>
								<td>
									<p class="comment">* 방문자분석 스크립트 코드를 입력합니다. 예) 구글 애널리틱스</p>
									<textarea id="site_customer_script" name="site_customer_script" rows="7" class="admin_textarea w100" ><c:out value="${BaseConfig.site_customer_script }"/></textarea>
								</td>
							</tr>
						</tbody>
					</table>
				</article>
				<!-- } 전체 기본설정 -->

				<!-- 환경설정 > 결제 및 배송설정 { -->
				<!-- 사업자정보 { -->
				<article class="page_sortation">
					<h2 class="h2Tit"><i class="fal fa-window-minimize"></i> 사업자정보</h2>
					<table class="admin_tbl admin_write_tbl">
						<caption>사업자정보</caption>
						<colgroup>
							<col width="200" />
							<col />
							<col width="200" />
							<col />
						</colgroup>
						<tbody>
							<tr>
								<th>회사명</th>
								<td><input type="text" autocomplete="no" id="site_company_nm" name="site_company_nm" class="admin_input" size="40" value="<c:out value="${BaseConfig.site_company_nm}"/>" /></td>
								<th>사업자등록번호</th>
								<td><input type="text" autocomplete="no" id="site_company_number" name="site_company_number" class="admin_input" size="40" value="<c:out value="${BaseConfig.site_company_number }"/>" /></td>
							</tr>
							<tr>
								<th>대표자명</th>
								<td><input type="text" autocomplete="no" id="site_ceo_nm" name="site_ceo_nm" class="admin_input" size="40" value="<c:out value="${BaseConfig.site_ceo_nm }"/>" /></td>
								<th>통신판매업 신고번호</th>
								<td><input type="text" autocomplete="no" id="site_sail_auth_number" name="site_sail_auth_number" class="admin_input" size="40" value="<c:out value="${BaseConfig.site_sail_auth_number }"/>" /></td>
							</tr>
							<tr>
								<th>대표전화번호</th>
								<td><input type="text" autocomplete="no" id="site_tel" name="site_tel" class="admin_input" size="40" value="<c:out value="${BaseConfig.site_tel }"/>" /></td>
								<th>팩스번호</th>
								<td><input type="text" autocomplete="no" id="site_fax" name="site_fax" class="admin_input" size="40" value="<c:out value="${BaseConfig.site_fax}"/>" /></td>
							</tr>
							<tr>
								<th>사업장 주소</th>
								<td colspan="3" style="line-height: 40px;">
									<input type="text" autocomplete="no" id="site_zip" name="site_zip" class="admin_input" size="20" value="<c:out value="${BaseConfig.site_zip }"/>" readonly />
									&nbsp; <button type="button" class="btns redbtn" onclick="form_execDaumPostcode('site_zip', 'site_addr_1', 'site_addr_2')"><i class="far fa-search"></i> 우편번호 </button>
									<br>
									<input type="text" autocomplete="no" id="site_addr_1" name="site_addr_1" class="admin_input" size="80" value="<c:out value="${BaseConfig.site_addr_1 }"/>" readonly /><br>
									<input type="text" autocomplete="no" id="site_addr_2" name="site_addr_2" class="admin_input" size="80" value="<c:out value="${BaseConfig.site_addr_2 }"/>" />
								</td>
							</tr>
							<tr>
								<th>정보관리책임자명</th>
								<td><input type="text" autocomplete="no" id="site_info_adm_nm" name="site_info_adm_nm" class="admin_input" size="40" value="<c:out value="${BaseConfig.site_info_adm_nm }"/>" /></td>
								<th>정보책임자 이메일</th>
								<td><input type="text" autocomplete="no" id="site_info_adm_email" name="site_info_adm_email" class="admin_input" size="40" value="<c:out value="${BaseConfig.site_info_adm_email }"/>" /></td>
							</tr>
							<tr>
								<th>SMS 발신 대표번호</th>
								<td collspan="3">
									<p class="comment">* 메시지 발송업체에 등록된 발신번호여야 합니다.</p>
									<input type="text" autocomplete="no" id="sms_send" name="sms_send" class="admin_input" size="40" value="<c:out value="${BaseConfig.sms_send }"/>" />
								</td>
							</tr>
							<tr>
								<th>SMS 수신번호 1</th>
								<td><input type="text" autocomplete="no" id="sms_no1" name="sms_no1" class="admin_input" size="40" value="<c:out value="${BaseConfig.sms_no1 }"/>" /></td>
								<th>SMS 수신번호 2</th>
								<td><input type="text" autocomplete="no" id="sms_no2" name="sms_no2" class="admin_input" size="40" value="<c:out value="${BaseConfig.sms_no2 }"/>" /></td>
							</tr>
						</tbody>
					</table>
				</article>
				<!-- } 사업자정보 -->

				<!-- 결제설정 { -->
				<article class="page_sortation">
					<h2 class="h2Tit"><i class="fal fa-window-minimize"></i> 결제설정</h2>
					<table class="admin_tbl admin_write_tbl">
						<caption>결제설정</caption>
						<colgroup>
							<col width="200" />
							<col />
							<col width="200" />
							<col />
						</colgroup>
						<tbody>
							<%--
							<tr>
								<th>무통장입금사용</th>
								<td colspan="3">
									<p class="comment">* 주문시 무통장으로 입금을 가능하게 할것인지를 설정합니다.</p>
									<p class="comment">* 사용할 경우 은행계좌를 반드시 입력하여 주십시오.</p>
									<input type="checkbox" id="pay_use_bank_st" name="pay_use_bank_st" class="admin_check" value="Y" <c:if test="${BaseConfig.pay_use_bank_st eq 'Y'}">checked</c:if> /><label for="pay_use_bank_st">사용</label>
								</td>
							</tr>
							 --%>
							<tr>
								<th>은행계좌</th>
								<td colspan="3">
									<select id="pay_bank_nm" name="pay_bank_nm" class="basic_select admin_select ">
										<option>은행명</option>
										<c:forEach var="banklist" items="${BankList}" varStatus="status">
											<option value="${banklist.base_cd}" <c:if test="${banklist.base_cd eq BaseConfig.pay_bank_nm  }">selected</c:if> >${banklist.base_cd_nm}</option>
										</c:forEach>
									</select>
									<input type="text" autocomplete="no" id="pay_bank_number" name="pay_bank_number" class="admin_input" size="40" placeholder="계좌번호" value="<c:out value="${BaseConfig.pay_bank_number }"/>" />
									<input type="text" autocomplete="no" id="pay_bank_user" name="pay_bank_user" class="admin_input" size="30" placeholder="예금주" value="<c:out value="${BaseConfig.pay_bank_user}"/>" />
								</td>
							</tr>
							<tr>
								<th>신용카드결제사용</th>
								<td colspan="3">
									<p class="comment">* 주문시 신용카드 결제를 가능하게 할것인지를 설정합니다.<br>* 실시간계좌이체, 가상계좌결제 같이 적용됩니다.</p>
									<input type="checkbox" id="pay_use_card_st" name="pay_use_card_st" class="admin_check" value="Y" <c:if test="${BaseConfig.pay_use_card_st eq 'Y'}">checked</c:if> /><label for="pay_use_card_st">사용</label>
								</td>
							</tr>
							<tr>
								<th>신용카드 기본정산률</th>
								<td colspan="3">
									<p class="comment">* 상점정산시 신용카드 결제에 사용될 기본 정산률이며, 업종구분없이 공통적용입니다.</p>
									<input type="text" id="pay_card_calc" name="pay_card_calc"  class="admin_input" size="10" value="<c:out value="${BaseConfig.pay_card_calc}"/>" >%</label>
								</td>
							</tr>
							<tr>
							<tr>
								<th>실시간계좌이체 기본정산률</th>
								<td colspan="3">
									<p class="comment">* 상점정산시 실시간계좌이체 결제에 사용될 기본 정산률이며, 업종구분없이 공통적용입니다.</p>
									<input type="text" id="pay_real_calc" name="pay_real_calc"  class="admin_input" size="10" value="<c:out value="${BaseConfig.pay_real_calc}"/>" >%</label>
								</td>
							</tr>
							<tr>
							<tr>
								<th>가상계좌 기본정산률</th>
								<td colspan="3">
									<p class="comment">* 상점정산시 가상계좌 결제에 사용될 기본 정산률이며, 업종구분없이 공통적용입니다.</p>
									<input type="text" id="pay_virt_calc" name="pay_virt_calc"  class="admin_input" size="10" value="<c:out value="${BaseConfig.pay_virt_calc}"/>" >원</label>
								</td>
							</tr>
							<tr>
								<th>PG사 상점관리자</th>
								<td colspan="3">
									<p class="comment">* http:// 또는 https:// 등, 프로토콜을 포함한 전체 URL을 입력하세요.</p>
									<input type="text" autocomplete="no" id="pay_pg_adm_url" name="pay_pg_adm_url" class="admin_input w100" placeholder="상점관리자 홈페이지 주소를 입력하세요."  value="<c:out value="${BaseConfig.pay_pg_adm_url}"/>" />
									<c:if test="${not empty BaseConfig.pay_pg_adm_url}">
									<br>
									<a href="<c:out value="${BaseConfig.pay_pg_adm_url}"/>" target="_blank" class="btns redbtn mgt5px" >새창으로 열기</a>
									</c:if>
								</td>
							</tr>
							<%--
							<tr>
								<th>PG사 상점아이디</th>
								<td><input type="text" autocomplete="no" id="pay_pg_id" name="pay_pg_id" class="admin_input" size="40" value="<c:out value="${BaseConfig.pay_pg_id}"/>" /></td>
								<th>PG사 키패스워드</th>
								<td><input type="text" autocomplete="no" id="pay_pg_pwd" name="pay_pg_pwd" class="admin_input" size="40" value="<c:out value="${BaseConfig.pay_pg_pwd}"/>" /></td>
							</tr>
							 --%>
						</tbody>
					</table>
				</article>
				<!-- } 결제설정 -->

				<!-- 소셜로그인 { -->
				<article class="page_sortation">
					<h2 class="h2Tit"><i class="fal fa-window-minimize"></i> 소셜로그인</h2>
					<table class="admin_tbl admin_write_tbl">
						<caption>소셜로그인</caption>
						<colgroup>
							<col width="200" />
							<col />
							<col width="200" />
							<col />
						</colgroup>
						<tbody>
							<tr>
								<th>소셜로그인 사용여부</th>
								<td colspan="3"><input type="checkbox" id="sns_use_login_st" name="sns_use_login_st" class="admin_check" value="Y" <c:if test="${BaseConfig.sns_use_login_st eq 'Y'}">checked</c:if>  /><label for="sns_use_login_st">사용</label></td>
							</tr>
							<tr>
								<th>네이버 Client ID</th>
								<td><input type="text" autocomplete="no" id="sns_naver_cid" name="sns_naver_cid" class="admin_input" size="40" value="<c:out value="${BaseConfig.sns_naver_cid}"/>" /></td>
								<th>네이버 Client Secret</th>
								<td><input type="text" autocomplete="no" id="sns_naver_ckey" name="sns_naver_ckey" class="admin_input" size="40" value="<c:out value="${BaseConfig.sns_naver_ckey}"/>" /></td>
							</tr>
							<tr>
								<th>카카오 REST API 키</th>
								<td><input type="text" autocomplete="no" id="sns_daum_rakey" name="sns_daum_rakey" class="admin_input" size="40" value="<c:out value="${BaseConfig.sns_daum_rakey}"/>" /></td>
								<th>카카오 Client Secret</th>
								<td><input type="text" autocomplete="no" id="sns_daum_jskey" name="sns_daum_jskey" class="admin_input" size="40" value="<c:out value="${BaseConfig.sns_daum_jskey}"/>" /></td>
							</tr>
							<tr>
								<th>카카오 Javascript 키</th>
								<td colspan="3"><input type="text" autocomplete="no" id="sns_daum_ckey" name="sns_daum_ckey" class="admin_input" size="40" value="<c:out value="${BaseConfig.sns_daum_ckey}"/>" /></td>
							</tr>
							<tr>
								<th>Facebook Client ID</th>
								<td><input type="text" autocomplete="no" id="sns_facebook_cid" name="sns_facebook_cid" class="admin_input" size="40" value="<c:out value="${BaseConfig.sns_facebook_cid}"/>" /></td>
								<th>Facebook Client Secret</th>
								<td><input type="text" autocomplete="no" id="sns_facebook_ckey" name="sns_facebook_ckey" class="admin_input" size="40" value="<c:out value="${BaseConfig.sns_facebook_ckey}"/>" /></td>
							</tr>
							<tr>
								<th>Apple Client ID</th>
								<td colspan="3"><input type="text" autocomplete="no" id="sns_apple_cid" name="sns_apple_cid" class="admin_input" size="40" value="<c:out value="${BaseConfig.sns_apple_cid}"/>" /></td>
							</tr>
						</tbody>
					</table>
				</article>
				<!-- } 소셜로그인 -->
				
				<!-- 소셜로그인 { -->
				<article class="page_sortation">
					<h2 class="h2Tit"><i class="fal fa-window-minimize"></i> API설정</h2>
					<table class="admin_tbl admin_write_tbl">
						<caption>api설정</caption>
						<colgroup>
							<col width="200" />
							<col />
							<col width="200" />
							<col />
						</colgroup>
						<tbody>
							<tr>
								<th>트래킹 키</th>
								<td colspan="3">
									<input type="text" autocomplete="no" id="tracking_key" name="tracking_key" class="admin_input" size="40" value="<c:out value="${BaseConfig.tracking_key}"/>" />
									<br>
									<a href="https://tracking.sweettracker.co.kr/" target="_blank" class="btns redbtn mgt5px" >새창으로 열기</a>
								</td>
							</tr>
						</tbody>
					</table>
				</article>
				<!-- } 소셜로그인 -->

				<!-- 마일리지설정 { -->
				<%--
				<article class="page_sortation">
					<h2 class="h2Tit"><i class="fal fa-window-minimize"></i> 몰 기본값 설정</h2>
					<p class="comment">* 사용설정시 적용되며, 지급 미사용시 0, 사용시 숫자로만 입력하세요.</p>
					<table class="admin_tbl admin_write_tbl">
						<caption>마일리지설정</caption>
						<colgroup>
							<col width="200" />
							<col />
							<col width="200" />
							<col />
						</colgroup>
						<tbody>
							<tr>
								<th>회원가입 마일리지</th>
								<td>
									<input type="checkbox" id="mileage_join_use_st" name="mileage_join_use_st" value="Y" <c:if test="${BaseConfig.mileage_join_use_st eq 'Y'}">checked</c:if> class="admin_check"  /><label for="mileage_join_use_st">사용</label>
									&nbsp;&nbsp;&nbsp;
									<input type="text" autocomplete="no" id="mileage_join" name="mileage_join" class="admin_input " value="<c:out value="${BaseConfig.mileage_join }"/>" /> 원
								</td>
								<th>상품구매 지급 마일리지</th>
								<td>
									<input type="checkbox" id="mileage_order_use_st" name="mileage_order_use_st" value="Y" <c:if test="${BaseConfig.mileage_order_use_st eq 'Y'}">checked</c:if> class="admin_check"   /><label for="mileage_order_use_st">사용</label>
									&nbsp;&nbsp;&nbsp;
									<input type="text" autocomplete="no" id="mileage_order" name="mileage_order" class="admin_input " value="<c:out value="${BaseConfig.mileage_order }"/>" /> %
								</td>
							</tr>
						</tbody>
					</table>
				</article>
				<!-- } 마일리지설정 -->
				 --%>
				 <input type="hidden" id="mileage_join" name="mileage_join" value="<c:out value="${BaseConfig.mileage_join }"/>" />
				 <input type="hidden" id="mileage_order" name="mileage_order" value="<c:out value="${BaseConfig.mileage_order }"/>" />
				
				<!-- 거래조건에 대한 정보 { -->
				<article class="page_sortation">
					<h2 class="h2Tit"><i class="fal fa-window-minimize"></i> 거래조건에 대한 정보 </h2>
					<p class="comment">* 업체에 제공되는 예시입니다.</p>
					<table class="admin_tbl admin_write_tbl">
						<caption>거래조건에 대한 정보</caption>
						<colgroup>
							<col width="400" />
							<col />
						</colgroup>
						<tbody>
							<tr>
								<th>재화 등의 공급방법 및 공급시기</th>
								<td>
									<textarea id="info_1" name="info_1" class="admin_textarea w100" rows="5"><c:out value="${BaseConfig.info_1 }"/></textarea>
								</td>
							</tr>
							<tr>
								<th>청약철회 등에 관한 사항</th>
								<td>
									<textarea id="info_2" name="info_2" class="admin_textarea w100" rows="5"><c:out value="${BaseConfig.info_2 }"/></textarea>
								</td>
							</tr>
							<tr>
								<th>재화 등의 교환∙반품∙보증과 그 대금 환불 및 환불의 지연에 따른 배상금 지급의 조건∙절차</th>
								<td>
									<textarea id="info_3" name="info_3" class="admin_textarea w100" rows="5"><c:out value="${BaseConfig.info_3 }"/></textarea>
								</td>
							</tr>
							<tr>
								<th>소비자피해보상의 처리, 재화 등에 대한 불만 처리 및 소비자와 사업자 사이의 분쟁처리에 관한 사항</th>
								<td>
									<textarea id="info_4" name="info_4" class="admin_textarea w100" rows="5"><c:out value="${BaseConfig.info_4 }"/></textarea>
								</td>
							</tr>
							<tr>
								<th>거래에 관한 약관의 내용 또는 확인할 수 있는 방법</th>
								<td>
									<textarea id="info_5" name="info_5" class="admin_textarea w100" rows="5"><c:out value="${BaseConfig.info_5 }"/></textarea>
								</td>
							</tr>
						</tbody>
					</table>
				</article>
				<!-- } 거래조건에 대한 정보 -->
				
				<%--
				<!-- 시스템셋팅 { -->
				<article class="page_sortation">
					<h2 class="h2Tit"><i class="fal fa-window-minimize"></i> 시스템셋팅</h2>
					<table class="admin_tbl admin_write_tbl">
						<caption>시스템셋팅</caption>
						<colgroup>
							<col width="400" />
							<col />
						</colgroup>
						<tbody>
							<tr>
								<th>중복제한 시간 설정</th>
								<td>
									<p class="comment">
									* 이 시간동안 상품뷰의 카운터, 게시판의 카운터를 중복으로 처리하지 않습니다.
									<br>
									* 0으로 설정시, 접속마다 카운터가 증가됩니다.
									</p>
									<input type="text" autocomplete="no" id="time_limit" name="time_limit" class="admin_input w50px" value="<c:out value="${BaseConfig.time_limit }"/>" />  분
								</td>
							</tr>
						</tbody>
					</table>
				</article>
				<!-- } 시스템셋팅 -->
				 --%>
				 <input type="hidden" id="time_limit" name="time_limit" value="<c:out value="${BaseConfig.time_limit }"/>" />
				
				<div class="btnarea alignRight mgt30px">
					<button type="submit" class="btns redbtn"><i class="far fa-save"></i> 저장</button>
				</div>
			</section>
			
			<!-- } 환경설정 > 기본환경설정 -->
		</div>
		<!-- } 콘텐츠 영역 -->
		
		<script>
			getEditor('site_use_rule');
			getEditor('site_personal');
			getEditor('site_agree_place');
		</script>
		
	
<c:import url="/Api/admgrIncludeBottom.do"/>