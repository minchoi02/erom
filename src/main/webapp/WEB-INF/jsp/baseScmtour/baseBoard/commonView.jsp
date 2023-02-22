<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<% 
pageContext.setAttribute("CR", "\r"); 
pageContext.setAttribute("LF", "\n"); 
pageContext.setAttribute("CRLF", "\r\n"); 
pageContext.setAttribute("BR", "<br/>");
%>
<c:set var="bbs_content_line" value="${fn:replace(bbsInfo.bbs_content, CRLF, BR) }"/>
<c:set var="bbs_content_line" value="${fn:replace(bbs_content_line, CR, BR) }"/>
<c:set var="bbs_content_line" value="${fn:replace(bbs_content_line, LF, BR) }"/>
<c:set var="bbs_content_line" value="${fn:replace(bbs_content_line, BR, '<br />') }"/>

<c:choose>
			<c:when test="${bd_id eq 'QNA'}">
			</c:when>
			
			<c:when test="${bd_id eq 'MTM'}">
			</c:when>
			
			<c:when test="${bd_id eq 'NOTICE'}">
	<!-- 서브비주얼 영역 -->
  <div id="sub_visual" class="sub_visual3">
  		<div class="inner">
          <div class="navigation">홈 <span>고객센터</span> <span class="last">공지사항</span></div>
          <div class="sub-title">공지사항</div>
      </div>
	</div>
	<!-- // 서브비주얼 영역 -->
    
	<!-- 컨테이너 -->
    <div id="container">
        <!-- 공지사항리스트 -->
        <div class="product-list board-list">
            <div class="inner clearfix">
            	
                <div class="bo_list_noti noti-view">
                    <div class="subjArea">
                    	<h1><c:out value="${bbsInfo.bbs_subject }"/></h1>
                        <span>E-헬스케어</span>
                                <c:set var="reg_dt" value="${bbsInfo.reg_dt}"/>
                                                    
                        <span>${fn:substring(reg_dt,0,10)}</span>
                        <span><i class="xi-eye-o"></i> ${bbsInfo.bbs_hit_cnt + 1 }</span>
                    </div>
                    <div class="bonArea">
						${bbsInfo.bbs_content}
                    </div>
                </div>
                <div class="noti-btnArea">
                	<div class="left">
                    	<a href="/notice_view.do?bbs_seq=<%=request.getAttribute("PRE_SEQ") %>"><button class="btn"><i class="xi-angle-left-thin"></i> 이전글</button></a>
                        <a href="/notice_view.do?bbs_seq=<%=request.getAttribute("NEXT_SEQ") %>"><button class="btn">다음글 <i class="xi-angle-right-thin"></i></button></a>
                    </div>
                    <div class="right">
                    	<a href="/board/list.do?bd_id=<c:out value="${bd_id}"/>&pageIndex=<c:out value="${pageIndex }"/>" class="btns"> <button class="btn">목록으로</button></a>
                    </div>
                </div>
                
            </div>
            
        </div>
        <!-- 공지사항리스트 -->
    </div>
    <!-- // 컨테이너 -->			
			</c:when>			

			<c:when test="${bd_id eq 'FAQ'}">
			</c:when>
			</c:choose>
	<%-- 		
	<section id="boardView">
		<article id="boardViewCon">
			<div class="board_view_top">
				<h2><c:out value="${bbsInfo.bbs_subject }"/></h2>
				<div class="writercon">
					<span class="writer"><c:out value="${bbsInfo.bbs_writer_nm}"/><c:if test="${empty bbsInfo.bbs_writer_nm} "><c:out value="${bbsInfo.user_nm}"/></c:if></span>
					<span class="date"><i class="far fa-clock"></i> <c:out value="${bbsInfo.reg_dt_ymd}"/></span>
					<span class="num"><i class="far fa-eye"></i> <fmt:formatNumber value="${bbsInfo.bbs_hit_cnt}" type="number"/></span>
				</div>
			</div>
			<c:if test="${not empty bbsInfo.bbs_file1 or not empty bbsInfo.bbs_file2 }">
			<div class="board_view_file">
				<ul class="nopm">
					<c:if test="${not empty bbsInfo.bbs_file1}">
					<c:choose>
						<c:when test="${bbs_file1_info.file_size/1024/102 > 1 }"><c:set var="file1_size" value="${bbs_file1_info.file_size/1024/1024}"/><c:set var="file1_str" value="MB"/></c:when>
						<c:when test="${bbs_file1_info.file_size/1024 > 1 }"><c:set var="file1_size" value="${bbs_file1_info.file_size/1024}"/><c:set var="file1_str" value="KB"/></c:when>
						<c:otherwise><c:set var="file1_size" value="${bbs_file1_info.file_size}"/><c:set var="file1_str" value="B"/></c:otherwise>
					</c:choose>
					<li><a href="/cmm/fms/FileDown.do?atchFileId=<c:out value="${bbsInfo.bbs_file1 }"/>&fileSn=0"><i class="far fa-save"></i> ${bbs_file1_info.orignl_file_nm } <span class="memory">(<fmt:formatNumber value="${file1_size}" type="number"/><c:out value="${file1_str }"/>)</span></a></li>
					</c:if>

					<c:if test="${not empty bbsInfo.bbs_file2}">
					<c:choose>
						<c:when test="${bbs_file2_info.file_size/1024/102 > 1 }"><c:set var="file2_size" value="${bbs_file2_info.file_size/1024/1024}"/><c:set var="file2_str" value="MB"/></c:when>
						<c:when test="${bbs_file2_info.file_size/1024 > 1 }"><c:set var="file2_size" value="${bbs_file2_info.file_size/1024}"/><c:set var="file2_str" value="KB"/></c:when>
						<c:otherwise><c:set var="file2_size" value="${bbs_file2_info.file_size}"/><c:set var="file2_str" value="B"/></c:otherwise>
					</c:choose>
					<li><a href="/cmm/fms/FileDown.do?atchFileId=<c:out value="${bbsInfo.bbs_file2 }"/>&fileSn=0"><i class="far fa-save"></i> ${bbs_file2_info.orignl_file_nm } <span class="memory">(<fmt:formatNumber value="${file2_size}" type="number"/><c:out value="${file2_str }"/>)</span></a></li>
					</c:if>

				</ul>
			</div>
			</c:if>
			<div class="board_view_con">
				<c:out value="${bbs_content_line}" escapeXml="false" />
			</div>
--%>			
