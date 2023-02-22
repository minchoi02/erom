<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:import url="/Api/IncludeTop.do"/>	
	
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
                    	<button class="btn">목록으로</button>
                    </div>
                </div>
                
            </div>
            
        </div>
        <!-- 공지사항리스트 -->
    </div>
    <!-- // 컨테이너 -->

<c:import url="/Api/IncludeBottom.do"/>