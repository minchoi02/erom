<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:import url="/Api/IncludeTop.do"/>

	<!-- 전체검색 리스트 { -->
	<section id="searchList" class="search_page bgs">
		<article class="spheader">
			<div class="backarea"><a href="javascript:history.back();" class="backbtn"><i class="fal fa-arrow-left"></i><span class="sound_only">뒤로가기</span></a></div>
			<h2><em>Search</em></h2>
			<div class="search_userbox">
				<ul class="nopm floats">
					<!--<li><a href="./search_list.php" class="subtn searchbtn"><i class="far fa-search"></i><span class="sound_only">검색 버튼</span></a></li>-->
					<c:choose>
						<c:when test="${empty user_id }">
						<li><a href="javascript:getLogin('/search/search.do')" class="subtn userbtn"><i class="far fa-lock-alt"></i><span class="sound_only">로그인 버튼</span></a></li>
						</c:when>
						<c:otherwise>
						<li><a href="/shop/more.do" class="subtn userbtn"><i class="fas fa-sign-in-alt"></i> <i class="fas fa-sign-out-alt"></i><span class="sound_only">로그인 버튼</span></a></li>
						</c:otherwise>
					</c:choose>
				</ul>
			</div>
			<div class="searchbox">
				<input type="text"  id="searchKeyword" name="searchKeyword" class="search_input w100" placeholder="검색어를 입력해주세요" />
				<button type=button onclick="searchSubmit();" class="search_button"><i class="far fa-search"></i><span class="skip">검색</span></button>
			</div>
		</article>
		<article class="recommend_keyword floats">
			<div class="rk_l">
				<dl class="nopm">
					<dt>내 검색어</dt>
					<dd>
						<ul class="nopm">
						<c:forEach var="myKeywordList" items="${myKeywordList}" varStatus="status">
							<li><a href="javascript:searchGo('<c:out value="${myKeywordList.keywords}"/>'); "><c:out value="${myKeywordList.keywords}"/></a></li>
						</c:forEach>
						</ul>
					</dd>
				</dl>
			</div>
			<div class="rk_r">
				<dl class="nopm">
					<dt>인기 검색어</dt>
					<dd>
						<ul class="nopm">
						<c:forEach var="bestKeywordList" items="${bestKeywordList}" varStatus="status">
							<li><a href="javascript:searchGo('<c:out value="${bestKeywordList.keywords}"/>'); "><c:out value="${bestKeywordList.keywords}"/></a></li>
						</c:forEach>
						</ul>
					</dd>
				</dl>
			</div>
		</article>
	</section>
	<!-- } 전체검색 리스트 -->
	<script>
	$('#searchKeyword').keypress(function(event){
		if(event.keyCode == 13 ) {
			searchSubmit();
			return false;
		}
	});
	</script>

<c:import url="/Api/IncludeBottom.do"/>