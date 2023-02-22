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
		<c:choose>
			<c:when test="${empty memberInfo.user_seq }">
			<h1 class="bigTit">회원등록</h1>
			</c:when>
			<c:otherwise>
			<h1 class="bigTit">회원정보수정</h1>
			</c:otherwise>
		</c:choose>		

			<!-- 회원관리 > 회원관리 > 글쓰기 { -->
			<form method="post" id="memberJoinForm"  name="memberJoinForm" action="/admgr/admgrMember/memberFormAction.do" onsubmit="return memberJoincheck();" >
			<input type="hidden" id="return_url" name="return_url" value="" />
			<input type="hidden" name="member_seq" value="<c:out value="${memberInfo.user_seq }"/>" />
			<section id="memberWrite" class="page_content">
				<!-- 회원등록 { -->
				<article class="page_sortation">
					<h2 class="h2Tit"><i class="fal fa-window-minimize"></i> 회원정보</h2>
					<table class="admin_tbl admin_write_tbl">
						<caption>회원정보</caption>
						<colgroup>
							<col width="200" />
							<col />
							<col width="200" />
							<col />
						</colgroup>
						<tbody>
							<tr>
								<th>아이디 <span class="colorRed">*</span></th>
								<td>
								<c:choose>
									<c:when test="${empty memberInfo.user_seq }">
									<p class="comment">* 필수입력하셔야 합니다.</p>
									<input type="text" autocomplete="off" id="user_id" name="user_id" class="admin_input" size="30" value="" /> <a href="#;" class="btns graybtn" id="id_chk" onclick="user_id_check(); return false;">중복확인</a>
									</c:when>
									<c:otherwise>
									<p class="comment">* 아이디는 수정이 불가능합니다.</p>
									<input type="text" autocomplete="off" id="user_id" name="user_id" class="admin_input readonly" size="30" value="<c:out value="${memberInfo.user_id }"/>" readonly />
									</c:otherwise>
								</c:choose>
								</td>
								<th>비밀번호 <span class="colorRed">*</span></th>
								<td>
									<c:choose>
										<c:when test="${empty memberInfo.user_seq }">
										<p class="comment">* 필수입력하셔야 합니다.</p>
										</c:when>
										<c:otherwise>
										<p class="comment">* 비밀번호 수정시, 입력합니다.</p>
										</c:otherwise>
									</c:choose>
									<input type="text" autocomplete="off" id="user_pw" name="user_pw" class="admin_input" size="30" />
									
								</td>
							</tr>
							
						<c:choose>
							<c:when test="${empty memberInfo.user_seq }">	
							<input type="hidden" name="user_id_check" id="user_id_check" value="N" />
							<tr>
								<th>이름 <span class="colorRed">*</span></th>
								<td><input type="text" autocomplete="off" id="user_nm" name="user_nm" value="<c:out value="${memberInfo.user_nm }"/>" class="admin_input" size="30" /></td>
								<th>회원등급 <span class="colorRed">*</span></th>
								<td>
									<p class="comment">* 상점회원으로 설정시, 상점등록시 조회됩니다.</p>
									<select id="user_level" name="user_level" class="basic_select admin_select">
										<option <c:if test="${memberInfo.user_level eq '2' }">selected</c:if> value="2" >일반회원</option>
										<option <c:if test="${memberInfo.user_level eq '5' }">selected</c:if> value="5" >상점회원</option>
										<option <c:if test="${memberInfo.user_level eq '10' }">selected</c:if> value="10" >최고관리자</option>
										<option <c:if test="${memberInfo.user_level eq '1' }">selected</c:if>value="1"  >탈퇴회원</option>
									</select>
								</td>
							</tr>
							<tr>
								<th>연락처</th>
								<td><input type="text" autocomplete="off" id="user_hp" name="user_hp" value="<c:out value="${memberInfo.user_hp }"/>" class="admin_input phoneNumber" size="40" /></td>
								<th>이메일</th>
								<td><input type="text" autocomplete="off" id="user_email" name="user_email" value="<c:out value="${memberInfo.user_email }"/>"class="admin_input" size="40" /></td>
							</tr>
							<tr>
								<th>관리자 메모</th>
								<td colspan="3">
									<p class="comment">* 해당 회원에 대해 관리자만 볼 수 있는 메모를 입력합니다.</p>
									<textarea id="user_admin_memo" name="user_admin_memo" class="admin_textarea w100" rows="7"></textarea>
								</td>
							</tr>
							</c:when>
							<c:otherwise>
							<input type="hidden" name="user_id_check" id="user_id_check" value="Y" />
							<tr>
								<th>이름 <span class="colorRed">*</span></th>
								<td><input type="text" autocomplete="off" id="user_nm" name="user_nm" value="<c:out value="${memberInfo.user_nm }"/>" class="admin_input" size="30" /></td>
								<th>마일리지</th>
								<td><fmt:formatNumber value="${memberInfo.user_total_mileage}" type="number"/> 원</td>
							</tr>
							<tr>
								<th>연락처</th>
								<td><input type="text" autocomplete="off" id="user_hp" name="user_hp" value="<c:out value="${memberInfo.user_hp }"/>" class="admin_input phoneNumber" size="40" /></td>
								<th>이메일</th>
								<td><input type="text" autocomplete="off" id="user_email" name="user_email" value="<c:out value="${memberInfo.user_email }"/>"class="admin_input" size="40" /></td>
							</tr>
							<tr>
								<th>회원등급 <span class="colorRed">*</span></th>
								<td>
									<p class="comment">* 상점회원으로 설정시, 상점등록시 조회됩니다.</p>
									<p class="comment">* 소셜가입회원은 상점회원이상으로 회원등급조정이 불가능합니다.</p>
									<select id="user_level" name="user_level" class="basic_select admin_select">
										<c:if test="${memberInfo.user_level eq '1' }">
										<option <c:if test="${memberInfo.user_level eq '1' }">selected</c:if>value="1"  >탈퇴회원</option>
										<option <c:if test="${memberInfo.user_level eq '2' }">selected</c:if> value="2" >일반회원</option>
										</c:if>

										<c:if test="${memberInfo.user_level eq '2' }">
										<option <c:if test="${memberInfo.user_level eq '1' }">selected</c:if>value="1"  >탈퇴회원</option>
										<option <c:if test="${memberInfo.user_level eq '2' }">selected</c:if> value="2" >일반회원</option>
										<c:if test="${memberInfo.user_join_fl eq 'normal' }">
										<option <c:if test="${memberInfo.user_level eq '5' }">selected</c:if> value="5" >상점회원</option>
										</c:if>
										</c:if>

										<c:if test="${memberInfo.user_level eq '5' }">
										<option <c:if test="${memberInfo.user_level eq '1' }">selected</c:if>value="1"  >탈퇴회원</option>
										<option <c:if test="${memberInfo.user_level eq '2' }">selected</c:if> value="2" >일반회원</option>
										<c:if test="${memberInfo.user_join_fl eq 'normal' }">
										<option <c:if test="${memberInfo.user_level eq '5' }">selected</c:if> value="5" >상점회원</option>
										</c:if>
										</c:if>

										<c:if test="${memberInfo.user_level eq '10' }">
										<option <c:if test="${memberInfo.user_level eq '10' }">selected</c:if> value="10" >최고관리자</option>
										</c:if>
									
									</select>
								</td>
								<th>가입유형</th>
								<td>
								<c:choose>
									<c:when test="${memberInfo.user_join_fl eq 'naver' }"><img src="/images/baseScmtour/ico_<c:out value="${memberInfo.user_join_fl }"/>.png" height="24" alt="네이버" /> 네이버 로그인</c:when>
									<c:when test="${memberInfo.user_join_fl eq 'kakao' }"><img src="/images/baseScmtour/ico_<c:out value="${memberInfo.user_join_fl }"/>.png" height="24" alt="카카오" /> 카카오 로그인</c:when>
									<c:when test="${memberInfo.user_join_fl eq 'facebook' }"><img src="/images/baseScmtour/ico_<c:out value="${memberInfo.user_join_fl }"/>.png" height="24" alt="페이스북" /> 페이스북 로그인</c:when>
									<c:when test="${memberInfo.user_join_fl eq 'google' }"><img src="/images/baseScmtour/ico_<c:out value="${memberInfo.user_join_fl }"/>.png" height="24" alt="구글" /> 구글 로그인</c:when>
									<c:when test="${memberInfo.user_join_fl eq 'apple' }"><img src="/images/baseScmtour/ico_<c:out value="${memberInfo.user_join_fl }"/>.png" height="24" alt="애플" /> 애플 로그인</c:when>
									<c:otherwise>일반가입</c:otherwise>
								</c:choose>
								</td>
							</tr>
							<tr>
								<th>회원가입일</th>
								<td><c:out value="${memberInfo.reg_dt}"/></td>
								<th>최근접속일</th>
								<td>
								<c:choose>
									<c:when test="${empty memberInfo.last_login_dt }">-</c:when>
									<c:otherwise><c:out value="${memberInfo.last_login_dt}"/></c:otherwise>
								</c:choose>
								</td>
							</tr>
							<tr>
								<th>상태</th>
								<td colspan="3">
								<c:choose>
									<c:when test="${memberInfo.user_st eq 'O' }"><span class="colorRed">탈퇴 (<c:out value="${memberInfo.withdraw_dt }"/>)</span></c:when>
									<c:when test="${memberInfo.user_st eq 'R' }"><span class="colorRed">대기 </span></c:when>
									<c:when test="${memberInfo.user_st eq 'D' }"><span class="colorRed">차단 (<c:out value="${memberInfo.deny_dt }"/>)</span></c:when>
									<c:otherwise><span class="colorBlue">정상</span></c:otherwise>
								</c:choose>
								</td>
							</tr>
							<tr>
								<th>관리자 메모</th>
								<td colspan="3">
									<p class="comment">* 해당 회원에 대해 관리자만 볼 수 있는 메모를 입력합니다.</p>
									<textarea id="user_admin_memo" name="user_admin_memo" class="admin_textarea w100" rows="7"><c:out value="${memberInfo.user_admin_memo }"/></textarea>
								</td>
							</tr>
							</c:otherwise>
						</c:choose>
						</tbody>
					</table>
				</article>
				<!-- } 회원등록 -->

				<c:if test="${not empty memberInfo.user_seq }">	
				<!-- 주소록 { -->
				<article class="page_sortation">
					<h2 class="h2Tit"><i class="fal fa-window-minimize"></i> 주소록<c:if test="${empty memberAddrList }"> : 등록된 주소록이 없습니다.</c:if></h2>
					<c:if test="${not empty memberAddrList }">
					<c:forEach var="MemberList" items="${MemberList}" varStatus="status">
					<table class="admin_tbl admin_write_tbl">
						<caption> 주소록</caption>
						<colgroup>
							<col width="200" />
							<col />
							<col width="200" />
							<col />
						</colgroup>
						<tbody>
							<tr>
								<th>주소록명 </th>
								<td colspan="3"><c:if test="${memberAddrList.addr_default eq 'Y' }">()<span class="colorBlue">기본</span>)</c:if><c:out value="${memberAddrList.addr_name }"/></td>
							</tr>
							<tr>
								<th>연락처</th>
								<td><c:out value="${memberAddrList.addr_hp }"/></td>
								<th>이메일</th>
								<td><c:out value="${memberAddrList.addr_email}"/></td>
							</tr>
							<tr>
								<th>주소</th>
								<td colspan="3">
								(<c:out value="${memberAddrList.addr_zip}"/>) <c:out value="${memberAddrList.addr_1}"/> <c:out value="${memberAddrList.addr_2}"/>
								</td>
							</tr>
						</tbody>
					</table>
					</c:forEach>
					</c:if>
				</article>
				<!-- } 주소록 -->
				</c:if>
				
				<div class="btnarea mgt30px">
					<ul class="nopm floats">
						<li><a href="/admgr/admgrMember/memberList.do?user_level=<c:out value="${user_level }"/>&searchKey=<c:out value="${searchKey }"/>&searchKeyword=<c:out value="${searchKeyword }"/>&page=<c:out value="${param.page }"/>" class="btns darkgraybtn"  onclick="history.back();"><i class="fal fa-sign-out-alt"></i> 목록</a></li>
						<li class="fr"><button type="submit" class="btns redbtn"><i class="far fa-save"></i> 저장</button></li>
					</ul>
				</div>
			</section>
			</form>
			<!-- } 회원관리 > 회원관리 > 글쓰기 -->
		</div>
		<!-- } 콘텐츠 영역 -->


<c:import url="/Api/admgrIncludeBottom.do"/>