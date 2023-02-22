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
			<h1 class="bigTit">그룹코드 관리 - 고민중..</h1>
			<div class="pageComment">
				<div class="comment_ico"><i class="fad fa-comment-alt-smile"></i></div>
				<p>
					그룹코드를 확인하는 페이지입니다.<br />
					설정은 불가능합니다.
				</p>
			</div>

			<!-- 환경설정 > 기본환경설정 { -->
			<section id="baseSetting" class="page_content">
				<!-- 전체 기본설정 { -->
				<article class="page_sortation">
					<h2 class="h2Tit"><i class="fal fa-window-minimize"></i> 그룹코드 확인</h2>
					<table class="admin_tbl admin_write_tbl">
						<caption>그룹코드 확인</caption>
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
								<th>서천 입장시 푸시 내용</th>
								<td><input type="text" autocomplete="no" id="" name="" class="admin_input w100" value="" /></td>
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
									<p class="comment">방문자분석 스크립트 코드를 입력합니다. 예) 구글 애널리틱스</p>
									<textarea id="site_customer_script" name="site_customer_script" rows="7" class="admin_textarea w100" ><c:out value="${BaseConfig.site_customer_script }"/></textarea>
								</td>
							</tr>
						</tbody>
					</table>
				</article>
				<!-- } 전체 기본설정 -->

				<div class="btnarea alignRight mgt30px">
					<a href="javascript:alert('저장되었습니다.');" class="btns redbtn"><i class="far fa-save"></i> 저장</a>
				</div>
			</section>
			<!-- } 환경설정 > 기본환경설정 -->
		</div>
		<!-- } 콘텐츠 영역 -->


<c:import url="/Api/admgrIncludeBottom.do"/>