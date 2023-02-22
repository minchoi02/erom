<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:import url="/Api/IncludeTop.do"/>

<strong><p class="comment">현재 모드 : 모드입니다.</p></strong>
<input type="hidden" id="" value="" />
<br><br>
<br><br>

<strong><p class="comment">주의 : DB데이터 중 일부를 Replace처리하므로, 적용할 모드를 잘 선택해 주세요.</p></strong>
<br><br>
<br><br>
 
<strong><p class="comment">개발페이지로 DB데이터 전환</p></strong>
<br>
<button type="button" class="btns regbtn" onclick="godb(1);" ></buttton>
<br>
<br>

<strong><p class="comment">실제페이지로 DB데이터 변환</p></strong>
<br>
<button type="button" class="btns regbtn" onclick="godb(2);" ></buttton>
<br>
<br>

<script>
function chk(obj) {
	if(obj == 1)	{
		gourl = "";
	} else {
		gourl = "";
	}
	location.href = gourl;
}
</script>


<c:import url="/Api/IncludeBottom.do"/>