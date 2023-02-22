<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:import url="/Api/IncludeTop.do"/>	
	
	
	<!-- 서브비주얼 영역 -->
  	<div id="sub_visual" class="sub_visual4">
  		<div class="inner">
          <div class="navigation">홈 <span class="last">이벤트</span></div>
          <div class="sub-title">이벤트</div>
      	</div>
	</div>
	<!-- // 서브비주얼 영역 -->
    
	<!-- 컨테이너 -->
    <div id="container">
        <!-- 공지사항리스트 -->
        <div class="product-list board-list">
            <div class="inner clearfix">
            	
                <div class="bo_list_noti noti-view event-view">
                    <div class="subjArea">
                    	<h1>이벤트 제목을 입력하세요!</h1>
                        <span>이벤트 기간 : 22.10.01 ~ 22.10.25</span>
                        <span>E-헬스케어</span>
                        <span>2022-09-16</span>
                        <span><i class="xi-eye-o"></i> 135</span>
                        <div class="snsArea">
                        	<a href=""><i class="xi-facebook"></i></a>
                            <a href=""><i class="xi-instagram"></i></a>
                            <a href=""><i class="xi-kakaotalk"></i></a>
                        </div>
                    </div>
                    <div class="bonArea" style="text-align:center;">
                    <img src="/resource/img/event-sang.png" style="text-align:center;margin:0px auto;" />
                    <br /><br /><br /><br />
                    이벤트 내용을 입력합니다.
                    <br /><br />
                    </div>
                </div>
                <div class="noti-btnArea">
                	<div class="left">
                    	<button class="btn"><i class="xi-angle-left-thin"></i> 이전글</button>
                        <button class="btn">다음글 <i class="xi-angle-right-thin"></i></button>
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
