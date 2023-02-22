<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<style>
	.pagenation{margin-top:20px;text-align:center;font-size:0;}
	.pagenation span,
	.pagenation a{display:inline-block;min-width:30px;height:30px;line-height:28px;margin:0 1px;border:1px solid #dcdcdc;font-size:13px;border-radius:4px;color:#666;vertical-align:top}
	.pagenation a.arrow{background-color:#fafafa}
	.pagenation a:hover{border-color:#999;background-color:#f7f7f7;color:#212121}
	.pagenation span{border-color:#333;background-color:#666;color:#fff;}
</style>
<c:import url="/Api/IncludeTop.do"/>	
	
<script>
$(document).ready(function() {
	

$("#search").click(function() {
	
	
	$("#searcjKey").submit();
	});

});



</script>
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
                    <li class="on"><a href="/notice_list.do;">공지사항</a></li>
                    <li><a href="/faq_list.do;">FAQ</a></li>
                </ul>
                <h1>전체 <span><strong><fmt:formatNumber value="${TotalCnt}" type="number"/></strong>개</span></h1>
				<div class="prd-sort absol noti-sort">
				<form method="post" action="/notice_list.do">
				<select id="searcjKey" name="searchKey" class="basic_select search_select">
					<option value="subcontent" <c:if test="${searchKey eq 'subcontent' }">selected</c:if> >제목+내용</option>
					<option value="subject" <c:if test="${searchKey eq 'subject' }">selected</c:if> >제목</option>
					<option value="content" <c:if test="${searchKey eq 'content' }">selected</c:if> >내용</option>
				</select>				
                    <div class="search-bar">
                    <input name="" type="text" id="searchKeyword" name="searchKeyword" class="search-input" placeholder="검색어를 입력하세요" value="<c:out value="${searchKeyword }"/>">
                    <a href="#;" id="search"><i class="xi-search"></i></a>
                    </div>
                 </form>
                </div>
                
                <div class="bo_list_noti">
                    <ul>
                    <c:forEach var="bbsNoticeList" items="${bbsNoticeList}" varStatus="status">
                        <li>
                            <a href="/notice_view.do?pageIndex=<c:out value="${paginationInfo.currentPageNo }"/>&searchKey=<c:out value="${searchKey}"/>&searchKeyword=<c:out value="${searchKeyword }"/>&bbs_seq=<c:out value="${bbsNoticeList.bbs_seq }"/>" >
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
                          <a href="/notice_view.do?pageIndex=<c:out value="${paginationInfo.currentPageNo }"/>&searchKey=<c:out value="${searchKey}"/>&searchKeyword=<c:out value="${searchKeyword }"/>&bbs_seq=<c:out value="${bbsList.bbs_seq }"/>">  
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
                <div class="pagination">
                <ul>
					<ui:pagination paginationInfo = "${paginationInfo}" type="image" jsFunction="jsPaging" />
				</ul>
				</div>
				
				<script type="text/javascript">
				// 페이징함수
				function jsPaging(pageNo) {
					//console.log(pageNo);
					var searchKey = $.trim($('#searchKey').val());
					var searchKeyword = $.trim($('#searchKeyword').val());
					var searchType = $.trim($('#searchType').val());
					var store_category = $.trim($('#store_category').val());
			
					var linkurl = "/notice_list.do?pageIndex="+pageNo;
					
					if(store_category) {
						linkurl += "&store_category="+store_category;
					}
					if(searchKey && searchKeyword) {
						linkurl += "&searchKey="+searchKey+"&searchKeyword="+searchKeyword;
					}
					if(searchType) {
						linkurl += "&searchType="+searchType;
					}

					//console.log(linkurl)
					location.href = linkurl;
				}
				</script>
				<!-- 
                    <div class="pagination">
                        <ul>
                            <li><a href="#;" class="page-action front"><i class="xi-angle-left-min"></i></a></li>
                            <li><a href="#;" class="page-link current">1</a></li>
                            <li><a href="#;" class="page-link">2</a></li>
                            <li><a href="#;" class="page-link">3</a></li>
                            <li><a href="#;" class="page-action last"><i class="xi-angle-right-min"></i></a></li>
                        </ul>
                        <!--<div class="write-btn"><button class="btn inquiry-btn">글쓰기</button></div>-->
                 <!--  </div>
                 -->   
                </div>
                
            </div>
            <!-- 공지사항리스트 -->
        </div>
    </div>
    <!-- // 컨테이너 -->

<c:import url="/Api/IncludeBottom.do"/>
