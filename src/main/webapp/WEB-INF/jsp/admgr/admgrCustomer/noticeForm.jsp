<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:import url="/Api/admgrIncludeTop.do"/>
<c:import url="/Api/admgrIncludeLeftMenu.do"/>
<c:choose>
	<c:when test="${empty bbs_seq }">
		<c:set var="title_ment" value="등록"/>
	</c:when>
	<c:otherwise>
		<c:set var="title_ment" value="수정"/>
	</c:otherwise>
</c:choose>

		<!-- 콘텐츠 영역 { -->
		<div id="content">
			<h1 class="bigTit">공지사항 <c:out value="${title_ment }"/></h1>

			<!-- 고객센터 > 공지사항 > 글쓰기 { -->
			<section id="boardWrite" class="page_content">
				<!-- 공지사항 등록 { -->
				<form method="post" id="bbsForm" name="bbsForm" action="/admgr/admgrCustomer/noticeAction.do" onsubmit="return noticeFormCheck()" >
				<input type="hidden" name="bbs_id" value="<c:out value="${bbs_id}"/>" />
				<input type="hidden" name="bbs_seq" value="<c:out value="${bbs_seq}"/>" />
				<input type="hidden" name="pageIndex" value="<c:out value="${pageIndex}"/>" />
				<input type="hidden" name="searchKey" value="<c:out value="${searchKey}"/>" />
				<input type="hidden" name="searchKeyword" value="<c:out value="${searchKeyword}"/>" />
				<input type="hidden" id="return_url" name="return_url" value="" />
				<article class="page_sortation">
					<table class="admin_tbl admin_write_tbl">
						<caption>공지사항 <c:out value="${title_ment }"/></caption>
						<colgroup>
							<col width="200" />
							<col />
						</colgroup>
						<tbody>
							<tr>
								<th>제목 <span class="colorRed">*</span></th>
								<td><input type="text" id="bbs_subject" name="bbs_subject" class="admin_input w100" value="<c:out value="${bbsInfo.bbs_subject }"/>" /></td>
							</tr>
							<tr>
								<th>공지글설정</th>
								<td>
									<p class="comment">* 공지글 체크하고 기간을 설정하면 목록 상단 공지 영역에서 보여집니다,</p>
									<input type="checkbox" id="bbs_notice_st" name="bbs_notice_st" <c:if test="${bbsInfo.bbs_notice_st eq 'Y' }">checked</c:if> class="admin_check" value="Y" /><label for="bbs_notice_st">공지글</label>
								</td>
							</tr>
							<tr>
								<th>내용 <span class="colorRed">*</span></th>
								<td>
									<textarea id="bbs_content" name="bbs_content" class="admin_textarea w100" rows="10" placeholder="※ 내용을 입력해주세요"><c:out value="${bbsInfo.bbs_content}"/></textarea>
								</td>
							</tr>
							<tr>
								<th>링크</th>
								<td><input type="text" id="bbs_link" name="bbs_link" class="admin_input w100" value="<c:out value="${bbsInfo.bbs_link}"/>" /></td>
							</tr>
							<tr>
								<th>첨부파일 1</th>
								<td>
								<input type="file" id="bbs_file1" name="bbs_file1" onchange="file_upload('bbs','bbs_file1');" />
								<input type="hidden" id="bbs_old_file1_id" name="bbs_old_file1_id" value="<c:out value="${bbsInfo.bbs_file1 }"/>" />
								<input type="hidden" id="bbs_file1_id" name="bbs_file1_id"  />
								<c:if test="${not empty bbsInfo.bbs_file1 }">
								<c:choose>
									<c:when test="${bbs_file1_info.file_size/1024/102 > 1 }"><c:set var="file1_size" value="${bbs_file1_info.file_size/1024/1024}"/><c:set var="file1_str" value="MB"/></c:when>
									<c:when test="${bbs_file1_info.file_size/1024 > 1 }"><c:set var="file1_size" value="${bbs_file1_info.file_size/1024}"/><c:set var="file1_str" value="KB"/></c:when>
									<c:otherwise><c:set var="file1_size" value="${bbs_file1_info.file_size}"/><c:set var="file1_str" value="B"/></c:otherwise>
								</c:choose>
								<a href="/cmm/fms/FileDown.do?atchFileId=<c:out value="${bbsInfo.bbs_file1 }"/>&fileSn=0"><c:out value="${bbs_file1_info.orignl_file_nm }"/> (<fmt:formatNumber value="${file1_size}" type="number"/><c:out value="${file1_str }"/>)</a>
								</c:if>
								</td>
							</tr>
							<tr>
								<th>첨부파일 2</th>
								<td>
								<input type="file" id="bbs_file2" name="bbs_file2" onchange="file_upload('bbs','bbs_file2');" />
								<input type="hidden" id="bbs_old_file2_id" name="bbs_old_file2_id" value="<c:out value="${bbsInfo.bbs_file2 }"/>" />
								<input type="hidden" id="bbs_file2_id" name="bbs_file2_id"  />
								<c:if test="${not empty bbsInfo.bbs_file2 }">
								<c:choose>
									<c:when test="${bbs_file2_info.file_size/1024/102 > 1 }"><c:set var="file2_size" value="${bbs_file2_info.file_size/1024/1024}"/><c:set var="file2_str" value="MB"/></c:when>
									<c:when test="${bbs_file2_info.file_size/1024 > 1 }"><c:set var="file2_size" value="${bbs_file2_info.file_size/1024}"/><c:set var="file2_str" value="KB"/></c:when>
									<c:otherwise><c:set var="file2_size" value="${bbs_file2_info.file_size}"/><c:set var="file2_str" value="B"/></c:otherwise>
								</c:choose>
								<a href="/cmm/fms/FileDown.do?atchFileId=<c:out value="${bbsInfo.bbs_file2 }"/>&fileSn=0"><c:out value="${bbs_file2_info.orignl_file_nm }"/> (<fmt:formatNumber value="${file2_size}" type="number"/><c:out value="${file2_str }"/>)</a>
								
								</c:if>
								</td>
							</tr>
						</tbody>
					</table>
				</article>
				<!-- } 공지사항 등록 -->

				<div class="btnarea mgt30px">
					<ul class="nopm floats">
						<li><a href="/admgr/admgrCustomer/noticeList.do?pageIndex=<c:out value="${pageIndex }"/>&searchKey=<c:out value="${searchKey }"/>&searchKeyword=<c:out value="${searchKeyword }"/>" class="btns"><i class="fal fa-list"></i> 목록으로</a></li>
						<li class="fr">
							<button type="button" class="btns graybtn" onclick="delbbs('<c:out value="${pageIndex}"/>','<c:out value="${bbs_id }"/>','<c:out value="${bbs_seq}"/>','<c:out value="${searchKey}"/>','<c:out value="${searchKeyword}"/>','<c:out value="${store_category}"/>');" ><i class="far fa-save"></i> 삭제</button>
							&nbsp;&nbsp;
							<button type="submit" class="btns redbtn"><i class="far fa-save"></i> 저장</button>
						</li>
					</ul>
				</div>
				</form>
			</section>
			<!-- } 고객센터 > 공지사항 > 글쓰기 -->
		</div>
		<!-- } 콘텐츠 영역 -->
		
		<script>
			getEditor('bbs_content');
		</script>


<c:import url="/Api/admgrIncludeBottom.do"/>