<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:import url="/Api/admgrIncludeTop.do"/>
<c:import url="/Api/admgrIncludeLeftMenu.do"/>
<% 
response.setHeader("Cache-Control", "no-cache");
response.setHeader("Pragma", "no-cache");
response.setHeader("Expires", "0");
%>

		<!-- 콘텐츠 영역 { -->
		<div id="content">
			<h1 class="bigTit">코드 관리</h1>
			<div class="pageComment">
				<div class="comment_ico"><i class="fad fa-comment-alt-smile"></i></div>
				<p>
					코드를 관리하는 페이지이며, 시스템코드는 수정이 불가능합니다.<br />
					설정변경 후,  <span class="colorRed">저장 버튼</span>을 눌러주세요.
					데이터베이스에 코드로 저장되므로, 코드값끼리 변경하는 처리는 하지 않아야 합니다.
				</p>
			</div>

			<!-- 환경설정 > 기본환경설정 { -->
			<section id="baseSetting" class="page_content">
				<!-- 전체 기본설정 { -->
				<article class="page_sortation">
					<h2 class="h2Tit"><i class="fal fa-window-minimize"></i> 코드 관리</h2>
					<table class="admin_tbl admin_write_tbl">
						<caption>코드관리 관리</caption>
						<colgroup>
							<col width="200" />
							<col />
						</colgroup>
						<tbody>
							<tr>
								<th>은행코드</th>
								<td>
									<table class="admin_tbl admin_write_tbl">
										<colgroup>
											<col width="200" />
											<col width="200" />
											<col width="150" />
											<col />
										</colgroup>
										<tbody>
											<c:forEach var="gp001List" items="${gp001List}" varStatus="status">
											<form method="post" action="/admgr/admgrSystem/cdSettingAction.do" onsubmit="return cdSettingForm();"/>
											<tr>
												<td><input type="text" autocomplete="no" name="base_cd" class="admin_input readonly base_cd" readonly size="20" placeholder="" value="<c:out value="${gp001List.base_cd}"/>" /></td>
												<td><input type="text" autocomplete="no" name="base_cd_nm" class="admin_input base_cd_nm"  size="20" placeholder="" value="<c:out value="${gp001List.base_cd_nm }"/>" <c:if test="${gp001List.base_use_st eq 'Y' }">style="background: #ffb591; color: #000;"</c:if> /></td>
												<td>
												<select name="base_use_st" class="basic_select base_use_st" >
													<option value="Y" <c:if test="${gp001List.base_use_st eq 'Y' }">selected</c:if> > 사용
													<option value="N" <c:if test="${gp001List.base_use_st eq 'N' }">selected</c:if> > 사용안함
												</select>
												</td>
												<td><button type="submit" class="btns bluebtn h24px">수정</button></td>
											</tr>
											</form>
											</c:forEach>
										</tbody>
									</table>
								</td>
							</tr>
							<tr>
								<th>택배사코드</th>
								<td>
									<a href="http://info.sweettracker.co.kr/apidoc" target="_blank" class="btns orangebtn" >API코드 확인</a>
									<br>
									<table class="admin_tbl admin_write_tbl">
										<colgroup>
											<col width="200" />
											<col width="200" />
											<col width="200" />
											<col width="150" />
											<col />
										</colgroup>
										<tbody>
											<c:forEach var="gp003List" items="${gp003List}" varStatus="status">
											<form method="post" action="/admgr/admgrSystem/cdSettingAction.do" onsubmit="return cdSettingForm();"/>
											<tr>
												<td><input type="text" autocomplete="no" name="base_cd" class="admin_input readonly base_cd" readonly size="20" placeholder="" value="<c:out value="${gp003List.base_cd}"/>" /></td>
												<td><input type="text" autocomplete="no" name="base_cd_nm" class="admin_input base_cd_nm"  size="20" placeholder="" value="<c:out value="${gp003List.base_cd_nm }"/>" <c:if test="${gp003List.base_use_st eq 'Y' }">style="background: #ffb591; color: #000;"</c:if> /></td>
												<td><input type="text" autocomplete="no" name="base_api_cd" class="admin_input base_api_cd"  size="20" placeholder="" value="<c:out value="${gp003List.base_api_cd}"/>" <c:if test="${gp003List.base_use_st eq 'Y' }">style="background: #ffb591; color: #000;"</c:if> /></td>
												<td>
												<select name="base_use_st" class="basic_select base_use_st" >
													<option value="Y" <c:if test="${gp003List.base_use_st eq 'Y' }">selected</c:if> > 사용
													<option value="N" <c:if test="${gp003List.base_use_st eq 'N' }">selected</c:if> > 사용안함
												</select>
												</td>
												<td><button type="submit" class="btns bluebtn h24px">수정</button></td>
											</tr>
											</form>
											</c:forEach>
										</tbody>
									</table>
								</td>
							</tr>
						</tbody>
					</table>
					
				</article>
				<!-- } 전체 기본설정 -->
				
				<%--
				<div class="btnarea alignRight mgt30px">
					<a href="javascript:alert('저장되었습니다.');" class="btns redbtn"><i class="far fa-save"></i> 저장</a>
				</div>
				 --%>
			</section>
			<!-- } 환경설정 > 기본환경설정 -->
		</div>
		<!-- } 콘텐츠 영역 -->


<c:import url="/Api/admgrIncludeBottom.do"/>