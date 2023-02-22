<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:set var="headerType" value="subHeader" />
<c:set var="headerName" value="bbs_mtm" />
<c:import url="/Api/IncludeTop.do"/>

<c:if test="${empty user_id }">
<script>
$(window).bind("pageshow", function (event) {
getLogin('/board/list.do?bd_id=MTM');
});
</script>
</c:if>

	<%@ include file="../../commonList.jsp" %>

			<div class="pagination alignCenter">
					<ul>
						<ui:pagination paginationInfo="${paginationInfo}" type="image"
							jsFunction="jsPaging" />
					</ul>
			</div>
			<div class="btnArea alignRight">
				<a href="/board/form.do?bd_id=${bd_id }" class="btns orangebtn"><i class="far fa-user-edit"></i> 글쓰기</a>
			</div>
		</article>
	</section>
	
	<script type="text/javascript">
		// 페이징함수 
		function jsPaging(pageNo) {
			//console.log(pageNo);
			var searchKeyword = $.trim($('#searchKeyword').val());
	
			var linkurl = "/board/list.do?bd_id=<c:out value="${bd_id}"/>&pageIndex="+pageNo;

			if(searchKeyword) {
				linkurl += "&searchKeyword="+searchKeyword;
			}
			//console.log(linkurl)
			location.href = linkurl;
		}
		</script>
		
			</div>

		</div>
		<!-- 공지사항리스트 -->
	</div>
</div>
<!-- // 컨테이너 -->		

<c:import url="/Api/IncludeBottom.do"/>