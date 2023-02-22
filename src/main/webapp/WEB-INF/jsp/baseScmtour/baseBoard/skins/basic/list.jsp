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
<c:set var="headerType" value="subHeader" />
<c:set var="headerName" value="bbs_basic" />
<c:import url="/Api/IncludeTop.do"/>

	<c:import url="../../commonList.jsp"/>
			  <div class="pagination">
                <ul>
					<ui:pagination paginationInfo = "${paginationInfo}" type="image" jsFunction="jsPaging" />
				</ul>
			</div>
			<%-- <div class="pagenation alignCenter">
			
				<ui:pagination paginationInfo = "${paginationInfo}" type="image" jsFunction="jsPaging" />
			</div> --%>
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
            <!-- 게시판리스트 -->
        </div>
    </div>
    <!-- // 컨테이너 -->
	

<c:import url="/Api/IncludeBottom.do"/>