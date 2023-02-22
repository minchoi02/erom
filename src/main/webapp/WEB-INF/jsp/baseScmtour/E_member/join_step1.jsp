<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:import url="/Api/IncludeTop.do"/>	

	<div class="joinBg">
    	<div class="inner">
            <div class="joinArea">
                <div class="titleArea">
                    <h1><img src="/resource/img/logo.png" /></h1>
                    <span>이롬 헬스케어 가입 유형을 선택해주세요.</span>
                </div>
                <div class="joinCate">
                	<div class="member">
                        <a href="/join_step2.do">
                            <div class="imgArea"><img src="/resource/img/erom-mem1.svg" /></div>
                            <div class="bgTxt">EROMIAN<br />MEMBERSHIP</div>
                            <h1>이로미안 <strong>멤버쉽회원</strong></h1>
                        </a>
                    </div>
                    <div class="consumer">
                        <a href="#">
                            <div class="imgArea"><img src="/resource/img/erom-mem2.svg" /></div>
                            <div class="bgTxt">EROMIAN<br />CONSUMER</div>
                            <h1>이로미안 <strong>소비자회원</strong></h1>
                        </a>
                    </div>
                    <div class="normal">
                        <a href="#">
                            <div class="imgArea"><img src="/resource/img/erom-mem3.svg" /></div>
                            <div class="bgTxt">EROM<br />HEALTH CARE</div>
                            <h1>이롬헬스케어 <strong>일반회원</strong></h1>
                        </a>
                    </div>
                </div>
            </div>
            
    	</div>
    </div>
	

<c:import url="/Api/IncludeBottom.do"/>
