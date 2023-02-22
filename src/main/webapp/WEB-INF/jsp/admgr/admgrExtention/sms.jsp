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
			<h1 class="bigTit">SMS관리</h1>
			<div class="pageComment">
				<div class="comment_ico"><i class="fad fa-comment-alt-smile"></i></div>
				<p>
					SMS를 발송, 관리합니다.
					<br>
					전체, 일반회원전체, 상점회원전체를 선택하여 발송할 경우, 발송에 시간이 걸릴 수 있으며 많은 비용이 부담되게 됩니다.
					<br>
					반드시, 발송완료 안내창이 뜰때까지 화면이동없이 기다려주세요.
					<br>
					직접발송은 템플릿을 제공하지 않습니다.
					<br>
					010, 011,017로 등록된 번호를 소유한 회원/상점만 목록에 제공됩니다.
				</p>
			</div>
			
			<!-- 부가기능 > SMS관리 { -->
			<section id="pushState" class="page_content floats">
				<form method="post" action="" onsubmit="return sms_add_save();" >
				<input type="hidden" name="sms_add" value="Y" />
				<div class="lcon lconbox">
					<!-- SMS 입력 { -->
					<h2 class="h2Tit"><i class="fal fa-window-minimize"></i>SMS 입력</h2>
					<table class="admin_tbl admin_write_tbl">
						<caption>SMS 입력</caption>
						<colgroup>
							<col />
						</colgroup>
						<tbody>
							<tr>
								<td>
									<p class="comment">대상선택</p>
									<select class="basic_select admin_select" id="sms_target" name="sms_target" onchange="set_target(this.value)">
										<option value="">선택하세요</option>
										<option value="all">회원전체  (<fmt:formatNumber value="${memberListCnt + storeListCnt}" type="number"/>)</option>
										<option value="normal_all">일반회원 전체 (<fmt:formatNumber value="${memberListCnt}" type="number"/>)</option>
										<option value="normal_sel">일반회원 선택</option>
										<option value="store_all">상점회원 전체 (<fmt:formatNumber value="${storeListCnt}" type="number"/>)</option>
										<option value="store_sel">상점회원 선택</option>
										<option value="input">직접입력</option>
									</select>
								</td>
							</tr>
							<tr>
								<td >
									<p class="comment">번호설정</p>
									<div id="targetlist_text"  style="display: none;">									
									</div>
									<div id="targetlist1" style="display: none;" >
									<c:forEach var="i" begin="1" end="10">
										<div>
											<select class="basic_select admin_select w200px sms_number" onchange="set_number(this.value, <c:out value="${i }"/>)">
											<option value="" > == 회원 선택 ==
											<c:forEach var="memberList" items="${memberList }">
												<option value="<c:out value="${memberList.user_hp }"/>" ><c:out value="${memberList.user_id }"/>(<c:out value="${memberList.user_nm }"/>)
											</c:forEach>
											</select>
											<input type="text" class="admin_input w150px sms_number target_number" readonly id="sms_number_<c:out value="${i }"/>" name="sms_number" />
										</div>
									</c:forEach>
									</div>
									<div id="targetlist2" style="display: none;" >
									<c:forEach var="i" begin="11" end="20">
										<div>
											<select class="basic_select admin_select w200px sms_number" onchange="set_number(this.value, <c:out value="${i }"/>)">
											<option value="" > == 상점 선택 ==
											<c:forEach var="storeList" items="${storeList }">
												<option value="<c:out value="${storeList.user_hp }"/>" ><c:out value="${storeList.store_nm }"/>
											</c:forEach>
											</select>
											<input type="text" class="admin_input w150px sms_number target_number" readonly id="sms_number_<c:out value="${i }"/>" name="sms_number" />
										</div>
									</c:forEach>
									</div>
									<div id="targetlist3" style="display: none;" >
									<c:forEach var="i" begin="21" end="30">
										<div>
											<input type="text" class="admin_input w150px sms_number target_number" id="sms_number_<c:out value="${i }"/>" name="sms_number" placeholder="전화번호를 입력하세요"/>
										</div>
									</c:forEach>
									</div>
								</td>
							</tr>
							<tr>
								<td>
									<p class="comment">내용</p>
									<textarea type="text" id="sms_msg" name="sms_msg" class="basic_textarea w100 h100" rows="5" onkeyup="char_length('sms_msg','msg_length');"></textarea>
									<div ><span id="msg_length">0</span> Byte </div>
								</td>
							</tr>
						</tbody>
					</table>
					<!-- } SMS 입력 -->

					<div class="btnarea alignRight mgt20px">
						<button type="submit" class="btns redbtn"><i class="far fa-save"></i> 발송</button>
					</div>
				</div>
				</form>
				<div class="rcon">
					<!-- 리스트 검색 { -->
					<form method="post" action="" >
					<div class="list_search_box">
						<ul class="nopm floats">
							<li><input type="text" class="search_input w300px" placeholder="검색어를 입력하세요." id="searchKeyword" name="searchKeyword" value="<c:out value="${searchKeyword}"/>" /></li>
							<li><button type="submit" class="search_submit"><i class="fal fa-search"></i> 검색</button></li>
							<li class="fr">전체 : <b><fmt:formatNumber value="${TotalCnt}" type="number"/></b>건</li>
						</ul>
					</div>
					</form>
					<!-- } 리스트 검색 -->

					<!-- SMS 리스트 { -->
					<table class="admin_tbl admin_list_tbl mgt10px">
						<caption>SMS 리스트</caption>
						<colgroup>
							<col width="100" />
							<col width="150" />
							<col />
							<col width="100" />
						</colgroup>
						<thead>
							<tr>
								<th>등록일시</th>
								<th>수신번호</th>
								<th>내용</th>
								<th>발송형태</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="smsList" items="${smsList}" varStatus="status">
							<tr>
								<td class="alignCenter fsize13"><c:out value="${smsList.tr_senddate_ymd}"/><br /><c:out value="${smsList.tr_senddate_his}"/></td>
								<td class="alignCenter"><c:out value="${smsList.tr_phone}"/></td>
								<td><c:out value="${smsList.tr_msg}"/></td>
								<td class="alignCenter fsize13">
									<c:choose>
										<c:when test="${smsList.sms_type eq 'S' }">시스템</c:when>
										<c:otherwise>직접발송</c:otherwise>
									</c:choose>
								</td>
							</tr>
							</c:forEach>
						</tbody>
					</table>
					<!-- } SMS 리스트 -->

				<div class="pagination">
				<ul>
					<ui:pagination paginationInfo = "${paginationInfo}" type="image" jsFunction="jsPaging" />
				</ul>
				</div>
				</div>
			</section>
			<!-- } 부가기능 > SMS관리 -->
		</div>
		<!-- } 콘텐츠 영역 -->
		
		<script type="text/javascript">
		// 페이징함수
		function jsPaging(pageNo) {
			//console.log(pageNo);
			var searchKeyword = $.trim($('#searchKeyword').val());
	
			var linkurl = "/admgr/admgrExtention/sms.do?pageIndex="+pageNo;

			if(searchKeyword) {
				linkurl += "&searchKeyword="+searchKeyword;
			}
			//console.log(linkurl)
			location.href = linkurl;
		}
		</script>
		<script>
			$(document).on("keyup", ".sms_number", function() { $(this).val( $(this).val().replace(/[^0-9]/g, "").replace(/(^02|^0505|^1[0-9]{3}|^0[0-9]{2})([0-9]+)?([0-9]{4})/,"$1-$2-$3").replace("--", "-") ); });
		</script>


<c:import url="/Api/admgrIncludeBottom.do"/>