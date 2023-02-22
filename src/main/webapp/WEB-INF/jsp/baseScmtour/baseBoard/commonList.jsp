<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>


	<%-- <section id="boardList">
	
		<form method="get" action="" onsubmit="return bbs_search_check();" >
		<article id="boardListSearch">
			<input type="text" class="search_input w100" placeholder="검색어를 입력해주세요" />
			<button type="submit" class="search_button"><i class="far fa-search"></i><span class="skip">검색</span></button>
		</article>
		</form> --%>
		
					<c:choose>
					
					<%--상품 Q&A 게시판 --%>
			<c:when test="${bd_id eq 'QNA'}">
		<article id="boardListCon">
			<ul class="nopm">

				<c:forEach var="bbsNoticeList" items="${bbsNoticeList}" varStatus="status">
				<li class="notice">
					<a href="/board/view.do?bd_id=<c:out value="${bd_id}"/>&pageIndex=<c:out value="${paginationInfo.currentPageNo }"/>&bbs_seq=<c:out value="${bbsNoticeList.bbs_seq}"/>">
						<em class="subject"><i class="fa fa-bullhorn" aria-hidden="true"></i> &nbsp; <c:out value="${bbsNoticeList.bbs_subject }"/></em>
						<span class="writeinfo">
							<span class="writer"><c:out value="${bbsNoticeList.bbs_writer_nm }"/><c:if test="${ empty bbsNoticeList.bbs_writer_nm}"><c:out value="${bbsNoticeList.user_nm }"/></c:if></span>
							<span class="date"><i class="far fa-clock"></i> <c:out value="${bbsNoticeList.reg_dt_ymd}"/></span>
							<span class="num"><i class="far fa-eye"></i> <fmt:formatNumber value="${bbsNoticeList.bbs_hit_cnt}" type="number"/></span>
						</span>
					</a>
				</li>
				</c:forEach>
				
				<c:forEach var="bbsList" items="${bbsList}" varStatus="status">
				<li class="notice">
					<a href="/board/view.do?bd_id=<c:out value="${bd_id}"/>&pageIndex=<c:out value="${paginationInfo.currentPageNo }"/>&bbs_seq=<c:out value="${bbsList.bbs_seq}"/>">
						<em class="subject"><c:out value="${bbsList.bbs_subject }"/></em>
						<span class="writeinfo">
							<span class="writer"><c:out value="${bbsList.bbs_writer_nm }"/><c:if test="${ empty bbsList.bbs_writer_nm}"><c:out value="${bbsList.user_nm }"/></c:if></span>
							<span class="date"><i class="far fa-clock"></i> <c:out value="${bbsList.reg_dt_ymd}"/></span>
							<span class="num"><i class="far fa-eye"></i> <fmt:formatNumber value="${bbsList.bbs_hit_cnt}" type="number"/></span>
						</span>
					</a>
				</li>
				</c:forEach>
			</ul>
			</c:when>
			
			
			
			<%--상품 1:1문의 게시판 --%>
	
			<c:when test="${bd_id eq 'MTM'}">

	<div id="sub_visual" class="sub_visual3">
  		<div class="inner">
          <div class="navigation">홈 <span>고객센터</span> <span class="last">1:1문의</span></div>
          <div class="sub-title">1:1문의</div>
      </div>
	</div>		
			
	<!-- 컨테이너 -->
    <div id="container">
        <!-- 상품리스트 -->
        <div class="product-list board-list">
            <div class="inner clearfix">			
	
                <script>
				
				$(function() {
					$(".list-qna > li > .question").click(function() {
						if(!$(this).parent().hasClass('open')) {
							$(".list-qna > li").removeClass('open');
							$(".list-qna > li > .answer").stop().slideUp(300);
							$(this).parent().addClass('open');
							$(this).siblings('.answer').stop().slideDown(300);
						} else {
							$(this).parent().removeClass('open');
							$(this).siblings('.answer').stop().slideUp(300);
						}
					});
				});
				</script>                					
		<div class="buyList-detail-list">
		
		<c:forEach var="bbsList" items="${bbsList}" varStatus="status">
                    <div class="list-qna-area">
                                         
                        <ul class="list-qna">
                            <li>
                                        <div class="question">
                                        <div class="imgArea"></div>
                                            <div class="txtArea">
                                            
                                            	<span class="completion">
                                            	<c:choose>
                                            	<c:when test="${bbsList.bbs_reply_content ne '' && bbsList.bbs_reply_content ne null}">                                            	
                                            	답변완료
                                            	</c:when>
                                            	<c:otherwise>
                                            	답변미완료
                                            	</c:otherwise>
                                            	</c:choose>
                                            	</span>
                                                <div class="write-info">2022-09-16</div>
                                                <h3><c:out value="${bbsList.bbs_subject}"/></h3>
                                            </div>
                                        </div>                            
                                        <div class="answer" style="display: none;">
                                        	<div class="aw-list">
                                            	<span class="balloon-q">Q</span>
                                            	<div class="cont"> ${bbsList.bbs_content}</div>
                                            </div>
                                            <div class="aw-list">
                                            	<span class="balloon-a">A</span>
                                            	<div class="cont"> ${bbsList.bbs_reply_content}</div>
                                            </div>
                                        </div>
                            </li>
                        </ul>                                    	                   										
				</div>
			</c:forEach>	
			
			
			</c:when>			
			
			
			
			<%--공지사항 게시판 --%>
			
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
        <!-- 상품리스트 -->
        <div class="product-list board-list">
            <div class="inner clearfix">
            	<ul id="tab2">
                    <li class="on"><a href="/board/list.do?bd_id=NOTICE&pageIndex=1">공지사항</a></li>
                    <li><a href="/board/list.do?bd_id=FAQ&pageIndex=1">FAQ</a></li>
                </ul>
                <h1>전체 <span><strong><fmt:formatNumber value="${TotalCnt}" type="number"/></strong>개</span></h1>
                
				<div class="prd-sort absol noti-sort">
				<form method="get" action="/board/list.do?bd_id=<c:out value="${bd_id}"/>" id="SearchForm"  >
				<%-- <select id="searcjKey" name="searchKey" class="basic_select search_select">
					<option value="subcontent" <c:if test="${searchKey eq 'subcontent' }">selected</c:if> >제목+내용</option>
					<option value="subject" <c:if test="${searchKey eq 'subject' }">selected</c:if> >제목</option>
					<option value="content" <c:if test="${searchKey eq 'content' }">selected</c:if> >내용</option>
				</select> --%>				
				<input type="hidden" name="bd_id" value="<c:out value="${bd_id}"/>"/>
                    <div class="search-bar">
                    <input type="text" id="searchKeyword" name="searchKeyword" class="search-input" placeholder="검색어를 입력하세요" value="<c:out value="${searchKeyword }"/>">
                    <a href="#;" id="searchKeyword2"><i class="xi-search"></i></a>
                    </div>
                 </form>
                </div>		
                					
		<div class="bo_list_noti">
		
			<ul>
                    <c:forEach var="bbsNoticeList" items="${bbsNoticeList}" varStatus="status">
                        <li>
                           <a href="/board/view.do?bd_id=<c:out value="${bd_id}"/>&pageIndex=<c:out value="${paginationInfo.currentPageNo }"/>&bbs_seq=<c:out value="${bbsNoticeList.bbs_seq}"/>">
                            <div class="txtArea">
                                <div class="num">공지</div>
                                <div class="subject">
                                
                                <c:out value="${bbsNoticeList.bbs_subject}"/> 
                                <c:if test="${bbsNoticeList.comm_cnt > 0}">&nbsp;<small class="bbs_comment_cnt" >(<fmt:formatNumber value="${bbsNoticeList.comm_cnt}" type="number"/>)</small></c:if>
                   
                                </div>
                                <div class="writer">E·헬스케어</div>
                                <c:set var="reg_dt" value="${bbsNoticeList.reg_dt}"/>
                                <div class="date">${fn:substring(reg_dt,0,10)}
                                 <i class="xi-eye-o"></i> ${bbsNoticeList.bbs_hit_cnt }
                                 </div>
                            </div>
                            </a>
                        </li>
                    </c:forEach>
                    
                    <c:forEach var="bbsList" items="${bbsList}" varStatus="status">    
                        <li>
                          <a href="/board/view.do?bd_id=<c:out value="${bd_id}"/>&pageIndex=<c:out value="${paginationInfo.currentPageNo }"/>&bbs_seq=<c:out value="${bbsList.bbs_seq}"/>">  
                            <div class="txtArea">
                                <div class="num"><c:out value="${StartPageNumber-status.count}"/></div>
                                <div class="subject">
                                
                                <c:out value="${bbsList.bbs_subject}"/>
                                <c:if test="${bbsList.comm_cnt > 0}">&nbsp;<small class="bbs_comment_cnt" >(<fmt:formatNumber value="${bbsList.comm_cnt}" type="number"/>)</small></c:if>
                               
                                </div>
                                
                                <div class="writer">E·헬스케어</div>
                                <c:set var="reg_dt2" value="${bbsList.reg_dt}"/>
                                <div class="date">${fn:substring(reg_dt2,0,10)}
                                <i class="xi-eye-o"></i> ${bbsList.bbs_hit_cnt }</div>
                            </div>
                           </a>
                        </li>
                   </c:forEach>		
                   		

			</ul>
						
			</c:when>
			

			<%--FAQ 게시판 --%>
			
			<c:when test="${bd_id eq 'FAQ'}">
			<!-- 서브비주얼 영역 -->
  <div id="sub_visual" class="sub_visual3">
  		<div class="inner">
          <div class="navigation">홈 <span>고객센터</span> <span class="last">FAQ</span></div>
          <div class="sub-title">FAQ</div>
      </div>
	</div>			
<!-- // 서브비주얼 영역 -->
    
	<!-- 컨테이너 -->
    <div id="container">
        <!-- 상품리스트 -->
        <div class="product-list board-list">
            <div class="inner clearfix">
            	<ul id="tab2">
                    <li><a href="/board/list.do?bd_id=NOTICE&pageIndex=1">공지사항</a></li>
                    <li class="on"><a href="/board/list.do?bd_id=FAQ&pageIndex=1">FAQ</a></li>
                </ul>
                
                <div id="faq-tab" class="pc-style">
                	<ul>
                        <li class="on"><a href="#;">전체</a></li>
                        <li><a href="#;">주문결제</a></li>
                        <li><a href="#;">배송</a></li>
                        <li><a href="#;">취소/교환/환불</a></li>
                    </ul>
                </div>
                
                <div class="dep-menu mobile-style">
                    <a href="javascript:;" class="on">전체</a>
                    <ul class="dropdown">
                        <li class="on"><a href="#;">전체</a></li>
                        <li><a href="#;">주문결제</a></li>
                        <li><a href="#;">배송</a></li>
                        <li><a href="#;">취소/교환/환불</a></li>
                    </ul>
                </div>

<script>
$(document).ready(function() {
	
	$('#searchKeyword2').click(function () {
		var keyword = $("#searchKeyword").val();
		if(keyword == ""){
			alert("검색어를 입력해주세요.");  $("#searchKeyword").focus(); return false;
		}
		if(keyword.length < 2){
			alert("검색어는 두 글자 이상 입력해주세요.");  $("#searchKeyword").focus(); return false;				
		}
		//$("#SearchForm").prop("action", "/board/list.do?bd_id=FAQ");
		$("#SearchForm").submit();
	});
	
	$("#searchKeyword").keypress(function(e){
		if(e.keyCode == 13) {
			var keyword = $("#searchKeyword").val();
			if(keyword == ""){
				alert("검색어를 입력해주세요.");
				return false;
			}
			if(keyword.length < 2){
				alert("검색어는 두 글자 이상 입력해주세요.");  $("#searchKeyword").focus(); return false;				
			}
			//$("#SearchForm").prop("action", "/board/list.do?bd_id=FAQ");
			$("#SearchForm").submit();
						
			
		}

	});
});


</script>                
				<div class="prd-sort absol noti-sort">
				<form method="get" action="/board/list.do?bd_id=FAQ" id="SearchForm"  >
				<%-- <select id="searcjKey" name="searchKey" class="basic_select search_select">
					<option value="subcontent" <c:if test="${searchKey eq 'subcontent' }">selected</c:if> >제목+내용</option>
					<option value="subject" <c:if test="${searchKey eq 'subject' }">selected</c:if> >제목</option>
					<option value="content" <c:if test="${searchKey eq 'content' }">selected</c:if> >내용</option>
				</select> --%>				
				<input type="hidden" name="bd_id" value="<c:out value="${bd_id}"/>"/>
                    <div class="search-bar">
                    <input type="text" id="searchKeyword" name="searchKeyword" class="search-input" placeholder="검색어를 입력하세요" value="<c:out value="${searchKeyword }"/>">
                    <a href="#;" id="searchKeyword2"><i class="xi-search"></i></a>
                    </div>
                 </form>
                </div>		
                <script>
				
				$(function() {
					$(".list-qna > li > .question").click(function() {
						if(!$(this).parent().hasClass('open')) {
							$(".list-qna > li").removeClass('open');
							$(".list-qna > li > .answer").stop().slideUp(300);
							$(this).parent().addClass('open');
							$(this).siblings('.answer').stop().slideDown(300);
						} else {
							$(this).parent().removeClass('open');
							$(this).siblings('.answer').stop().slideUp(300);
						}
					});
				});
				</script>                					
		<div class="bo_list_noti list-area">
		
		<c:forEach var="bbsList" items="${bbsList}" varStatus="status">
                    <div class="list-qna-area">
                                         
                        <ul class="list-qna">
                            <li>
                                <div class="question">
                                    <div class="qt-list">
                                        <span class="balloon-q">Q</span>
                                        <div class="cate">
                                        <c:choose>
                                        <c:when test="${bbsList.bbs_writer_nm eq 1}">주문결제
                                        </c:when>
                                        <c:when test="${bbsList.bbs_writer_nm eq 2}">배송
                                        </c:when>
                                        <c:when test="${bbsList.bbs_writer_nm eq 3}">취소/교환/환불
                                        </c:when>
                                        </c:choose>
                                        </div>
                                        <div class="cont">
                                         <c:out value="${bbsList.bbs_subject}"/>
                                       
                                        </div>
                                        <i class="xi-angle-down-thin"></i>
                                    </div>
                                </div>
                                <div class="answer">
                                    <div class="aw-list">
                                        <span class="balloon-a">A</span>
                                        <div class="cont">
                                     		  ${bbsList.bbs_content}
                                        </div>
                                    </div>
                                </div>
                            </li>
                        </ul>                                    	                   										
				</div>
			</c:forEach>	
			</c:when>			
			
			</c:choose>
	
			
			
	