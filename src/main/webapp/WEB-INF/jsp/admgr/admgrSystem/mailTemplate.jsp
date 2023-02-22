<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:import url="/Api/admgrIncludeTop.do"/>
<c:import url="/Api/admgrIncludeLeftMenu.do"/>
<% 
response.setHeader("Cache-Control", "no-cache");
response.setHeader("Pragma", "no-cache");
response.setHeader("Expires", "0");
%>

		<!-- 콘텐츠 영역 { -->
		<div id="content">
			<h1 class="bigTit">메일템플릿 관리</h1>
			<div class="pageComment">
				<div class="comment_ico"><i class="fad fa-comment-alt-smile"></i></div>
				<p>
					메일발송용 템플릿을 관리합니다.
				</p>
			</div>
			
			<!-- 부가기능 > 푸시관리 { -->
			<section id="pushState" class="page_content floats">
                <!-- 푸시 리스트 { -->
                <table class="admin_tbl admin_list_tbl mgt10px">
                    <caption>메일 리스트</caption>
                    <colgroup>
                        <col width="100" />
                        <col />
                        <col />
                        <col />
                    </colgroup>
                    <thead>
                        <tr>
                            <th>상태</th>
                            <th>회원</th>
                            <th>상점</th>
                            <th>관리자</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <th class="alignCenter">회원가입</th>
                            <td>
                                <p><input type="checkbox" id="typeChk1_1" class="admin_check"><label for="typeChk1_1">사용</label></p>
                                <textarea name="" id="" class="w100 mgt10px admin_textarea" cols="30" rows="10"></textarea>
                                <p class="mgt10px">*설명</p>
                                <p class="mgt10px">{회원명}, {가입일}</p>
                            </td>
                            <td>
                                <p><input type="checkbox" id="typeChk2_1" class="admin_check"><label for="typeChk2_1">사용</label></p>
                                <textarea name="" id="" class="w100 mgt10px admin_textarea" cols="30" rows="10"></textarea>
                                <p class="mgt10px">*설명</p>
                                <p class="mgt10px">{회원명}, {가입일}</p>
                            </td>
                            <td>
                                <p><input type="checkbox" id="typeChk3_1" class="admin_check"><label for="typeChk3_1">사용</label></p>
                                <textarea name="" id="" class="w100 mgt10px admin_textarea" cols="30" rows="10"></textarea>
                                <p class="mgt10px">*설명</p>
                                <p class="mgt10px">{회원명}, {가입일}</p>
                            </td>
                        </tr>
                        <tr>
                            <th class="alignCenter">주문완료</th>
                            <td>
                                <p><input type="checkbox" id="typeChk1_2" class="admin_check"><label for="typeChk1_2">사용</label></p>
                                <textarea name="" id="" class="w100 mgt10px admin_textarea" cols="30" rows="10"></textarea>
                                <p class="mgt10px">*설명</p>
                                <p class="mgt10px">{회원명}, {가입일}</p>
                            </td>
                            <td>
                                <p><input type="checkbox" id="typeChk2_2" class="admin_check"><label for="typeChk2_2">사용</label></p>
                                <textarea name="" id="" class="w100 mgt10px admin_textarea" cols="30" rows="10"></textarea>
                                <p class="mgt10px">*설명</p>
                                <p class="mgt10px">{회원명}, {가입일}</p>
                            </td>
                            <td>
                                <p><input type="checkbox" id="typeChk3_2" class="admin_check"><label for="typeChk3_2">사용</label></p>
                                <textarea name="" id="" class="w100 mgt10px admin_textarea" cols="30" rows="10"></textarea>
                                <p class="mgt10px">*설명</p>
                                <p class="mgt10px">{회원명}, {가입일}</p>
                            </td>
                        </tr>
                        <tr>
                            <th class="alignCenter">주문취소</th>
                            <td>
                                <p><input type="checkbox" id="typeChk1_3" class="admin_check"><label for="typeChk1_3">사용</label></p>
                                <textarea name="" id="" class="w100 mgt10px admin_textarea" cols="30" rows="10"></textarea>
                                <p class="mgt10px">*설명</p>
                                <p class="mgt10px">{회원명}, {가입일}</p>
                            </td>
                            <td>
                                <p><input type="checkbox" id="typeChk2_3" class="admin_check"><label for="typeChk2_3">사용</label></p>
                                <textarea name="" id="" class="w100 mgt10px admin_textarea" cols="30" rows="10"></textarea>
                                <p class="mgt10px">*설명</p>
                                <p class="mgt10px">{회원명}, {가입일}</p>
                            </td>
                            <td>
                                <p><input type="checkbox" id="typeChk3_3" class="admin_check"><label for="typeChk3_3">사용</label></p>
                                <textarea name="" id="" class="w100 mgt10px admin_textarea" cols="30" rows="10"></textarea>
                                <p class="mgt10px">*설명</p>
                                <p class="mgt10px">{회원명}, {가입일}</p>
                            </td>
                        </tr>
                        <tr>
                            <th class="alignCenter">1:1 문의 등록</th>
                            <td>
                                <p><input type="checkbox" id="typeChk1_3" class="admin_check"><label for="typeChk1_3">사용</label></p>
                                <textarea name="" id="" class="w100 mgt10px admin_textarea" cols="30" rows="10"></textarea>
                                <p class="mgt10px">*설명</p>
                                <p class="mgt10px">{회원명}, {가입일}</p>
                            </td>
                            <td>
                                <p><input type="checkbox" id="typeChk2_3" class="admin_check"><label for="typeChk2_3">사용</label></p>
                                <textarea name="" id="" class="w100 mgt10px admin_textarea" cols="30" rows="10"></textarea>
                                <p class="mgt10px">*설명</p>
                                <p class="mgt10px">{회원명}, {가입일}</p>
                            </td>
                            <td>
                                <p><input type="checkbox" id="typeChk3_3" class="admin_check"><label for="typeChk3_3">사용</label></p>
                                <textarea name="" id="" class="w100 mgt10px admin_textarea" cols="30" rows="10"></textarea>
                                <p class="mgt10px">*설명</p>
                                <p class="mgt10px">{회원명}, {가입일}</p>
                            </td>
                        </tr>
                        <tr>
                            <th class="alignCenter">1:1 문의 답변등록</th>
                            <td>
                                <p><input type="checkbox" id="typeChk1_3" class="admin_check"><label for="typeChk1_3">사용</label></p>
                                <textarea name="" id="" class="w100 mgt10px admin_textarea" cols="30" rows="10"></textarea>
                                <p class="mgt10px">*설명</p>
                                <p class="mgt10px">{회원명}, {가입일}</p>
                            </td>
                            <td>
                                <p><input type="checkbox" id="typeChk2_3" class="admin_check"><label for="typeChk2_3">사용</label></p>
                                <textarea name="" id="" class="w100 mgt10px admin_textarea" cols="30" rows="10"></textarea>
                                <p class="mgt10px">*설명</p>
                                <p class="mgt10px">{회원명}, {가입일}</p>
                            </td>
                            <td>
                                <p><input type="checkbox" id="typeChk3_3" class="admin_check"><label for="typeChk3_3">사용</label></p>
                                <textarea name="" id="" class="w100 mgt10px admin_textarea" cols="30" rows="10"></textarea>
                                <p class="mgt10px">*설명</p>
                                <p class="mgt10px">{회원명}, {가입일}</p>
                            </td>
                        </tr>
                        <tr>
                            <th class="alignCenter">QnA 등록</th>
                            <td>
                                <p><input type="checkbox" id="typeChk1_3" class="admin_check"><label for="typeChk1_3">사용</label></p>
                                <textarea name="" id="" class="w100 mgt10px admin_textarea" cols="30" rows="10"></textarea>
                                <p class="mgt10px">*설명</p>
                                <p class="mgt10px">{회원명}, {가입일}</p>
                            </td>
                            <td>
                                <p><input type="checkbox" id="typeChk2_3" class="admin_check"><label for="typeChk2_3">사용</label></p>
                                <textarea name="" id="" class="w100 mgt10px admin_textarea" cols="30" rows="10"></textarea>
                                <p class="mgt10px">*설명</p>
                                <p class="mgt10px">{회원명}, {가입일}</p>
                            </td>
                            <td>
                                <p><input type="checkbox" id="typeChk3_3" class="admin_check"><label for="typeChk3_3">사용</label></p>
                                <textarea name="" id="" class="w100 mgt10px admin_textarea" cols="30" rows="10"></textarea>
                                <p class="mgt10px">*설명</p>
                                <p class="mgt10px">{회원명}, {가입일}</p>
                            </td>
                        </tr>
                        <tr>
                            <th class="alignCenter">QnA 답변 등록</th>
                            <td>
                                <p><input type="checkbox" id="typeChk1_3" class="admin_check"><label for="typeChk1_3">사용</label></p>
                                <textarea name="" id="" class="w100 mgt10px admin_textarea" cols="30" rows="10"></textarea>
                                <p class="mgt10px">*설명</p>
                                <p class="mgt10px">{회원명}, {가입일}</p>
                            </td>
                            <td>
                                <p><input type="checkbox" id="typeChk2_3" class="admin_check"><label for="typeChk2_3">사용</label></p>
                                <textarea name="" id="" class="w100 mgt10px admin_textarea" cols="30" rows="10"></textarea>
                                <p class="mgt10px">*설명</p>
                                <p class="mgt10px">{회원명}, {가입일}</p>
                            </td>
                            <td>
                                <p><input type="checkbox" id="typeChk3_3" class="admin_check"><label for="typeChk3_3">사용</label></p>
                                <textarea name="" id="" class="w100 mgt10px admin_textarea" cols="30" rows="10"></textarea>
                                <p class="mgt10px">*설명</p>
                                <p class="mgt10px">{회원명}, {가입일}</p>
                            </td>
                        </tr>
                       <tr>
                            <th class="alignCenter">관광/체험 예약</th>
                            <td>
                                <p><input type="checkbox" id="typeChk1_3" class="admin_check"><label for="typeChk1_3">사용</label></p>
                                <textarea name="" id="" class="w100 mgt10px admin_textarea" cols="30" rows="10"></textarea>
                                <p class="mgt10px">*설명</p>
                                <p class="mgt10px">{회원명}, {가입일}</p>
                            </td>
                            <td>
                                <p><input type="checkbox" id="typeChk2_3" class="admin_check"><label for="typeChk2_3">사용</label></p>
                                <textarea name="" id="" class="w100 mgt10px admin_textarea" cols="30" rows="10"></textarea>
                                <p class="mgt10px">*설명</p>
                                <p class="mgt10px">{회원명}, {가입일}</p>
                            </td>
                            <td>
                                <p><input type="checkbox" id="typeChk3_3" class="admin_check"><label for="typeChk3_3">사용</label></p>
                                <textarea name="" id="" class="w100 mgt10px admin_textarea" cols="30" rows="10"></textarea>
                                <p class="mgt10px">*설명</p>
                                <p class="mgt10px">{회원명}, {가입일}</p>
                            </td>
                        </tr>
                       <tr>
                            <th class="alignCenter">숙박 예약</th>
                            <td>
                                <p><input type="checkbox" id="typeChk1_3" class="admin_check"><label for="typeChk1_3">사용</label></p>
                                <textarea name="" id="" class="w100 mgt10px admin_textarea" cols="30" rows="10"></textarea>
                                <p class="mgt10px">*설명</p>
                                <p class="mgt10px">{회원명}, {가입일}</p>
                            </td>
                            <td>
                                <p><input type="checkbox" id="typeChk2_3" class="admin_check"><label for="typeChk2_3">사용</label></p>
                                <textarea name="" id="" class="w100 mgt10px admin_textarea" cols="30" rows="10"></textarea>
                                <p class="mgt10px">*설명</p>
                                <p class="mgt10px">{회원명}, {가입일}</p>
                            </td>
                            <td>
                                <p><input type="checkbox" id="typeChk3_3" class="admin_check"><label for="typeChk3_3">사용</label></p>
                                <textarea name="" id="" class="w100 mgt10px admin_textarea" cols="30" rows="10"></textarea>
                                <p class="mgt10px">*설명</p>
                                <p class="mgt10px">{회원명}, {가입일}</p>
                            </td>
                        </tr>
                       <tr>
                            <th class="alignCenter">맛집 예약</th>
                            <td>
                                <p><input type="checkbox" id="typeChk1_3" class="admin_check"><label for="typeChk1_3">사용</label></p>
                                <textarea name="" id="" class="w100 mgt10px admin_textarea" cols="30" rows="10"></textarea>
                                <p class="mgt10px">*설명</p>
                                <p class="mgt10px">{회원명}, {가입일}</p>
                            </td>
                            <td>
                                <p><input type="checkbox" id="typeChk2_3" class="admin_check"><label for="typeChk2_3">사용</label></p>
                                <textarea name="" id="" class="w100 mgt10px admin_textarea" cols="30" rows="10"></textarea>
                                <p class="mgt10px">*설명</p>
                                <p class="mgt10px">{회원명}, {가입일}</p>
                            </td>
                            <td>
                                <p><input type="checkbox" id="typeChk3_3" class="admin_check"><label for="typeChk3_3">사용</label></p>
                                <textarea name="" id="" class="w100 mgt10px admin_textarea" cols="30" rows="10"></textarea>
                                <p class="mgt10px">*설명</p>
                                <p class="mgt10px">{회원명}, {가입일}</p>
                            </td>
                        </tr>
                       <tr>
                            <th class="alignCenter">구매완료</th>
                            <td>
                                <p><input type="checkbox" id="typeChk1_3" class="admin_check"><label for="typeChk1_3">사용</label></p>
                                <textarea name="" id="" class="w100 mgt10px admin_textarea" cols="30" rows="10"></textarea>
                                <p class="mgt10px">*설명</p>
                                <p class="mgt10px">{회원명}, {가입일}</p>
                            </td>
                            <td>
                                <p><input type="checkbox" id="typeChk2_3" class="admin_check"><label for="typeChk2_3">사용</label></p>
                                <textarea name="" id="" class="w100 mgt10px admin_textarea" cols="30" rows="10"></textarea>
                                <p class="mgt10px">*설명</p>
                                <p class="mgt10px">{회원명}, {가입일}</p>
                            </td>
                            <td>
                                <p><input type="checkbox" id="typeChk3_3" class="admin_check"><label for="typeChk3_3">사용</label></p>
                                <textarea name="" id="" class="w100 mgt10px admin_textarea" cols="30" rows="10"></textarea>
                                <p class="mgt10px">*설명</p>
                                <p class="mgt10px">{회원명}, {가입일}</p>
                            </td>
                        </tr>
						<tr>
                            <th class="alignCenter">입금안내</th>
                            <td>
                                <p><input type="checkbox" id="typeChk1_3" class="admin_check"><label for="typeChk1_3">사용</label></p>
                                <textarea name="" id="" class="w100 mgt10px admin_textarea" cols="30" rows="10"></textarea>
                                <p class="mgt10px">*설명</p>
                                <p class="mgt10px">{회원명}, {가입일}</p>
                            </td>
                            <td>
                                <p><input type="checkbox" id="typeChk2_3" class="admin_check"><label for="typeChk2_3">사용</label></p>
                                <textarea name="" id="" class="w100 mgt10px admin_textarea" cols="30" rows="10"></textarea>
                                <p class="mgt10px">*설명</p>
                                <p class="mgt10px">{회원명}, {가입일}</p>
                            </td>
                            <td>
                                <p><input type="checkbox" id="typeChk3_3" class="admin_check"><label for="typeChk3_3">사용</label></p>
                                <textarea name="" id="" class="w100 mgt10px admin_textarea" cols="30" rows="10"></textarea>
                                <p class="mgt10px">*설명</p>
                                <p class="mgt10px">{회원명}, {가입일}</p>
                            </td>
                        </tr>
                         <tr>
                            <th class="alignCenter">주문취소</th>
                            <td>
                                <p><input type="checkbox" id="typeChk1_3" class="admin_check"><label for="typeChk1_3">사용</label></p>
                                <textarea name="" id="" class="w100 mgt10px admin_textarea" cols="30" rows="10"></textarea>
                                <p class="mgt10px">*설명</p>
                                <p class="mgt10px">{회원명}, {가입일}</p>
                            </td>
                            <td>
                                <p><input type="checkbox" id="typeChk2_3" class="admin_check"><label for="typeChk2_3">사용</label></p>
                                <textarea name="" id="" class="w100 mgt10px admin_textarea" cols="30" rows="10"></textarea>
                                <p class="mgt10px">*설명</p>
                                <p class="mgt10px">{회원명}, {가입일}</p>
                            </td>
                            <td>
                                <p><input type="checkbox" id="typeChk3_3" class="admin_check"><label for="typeChk3_3">사용</label></p>
                                <textarea name="" id="" class="w100 mgt10px admin_textarea" cols="30" rows="10"></textarea>
                                <p class="mgt10px">*설명</p>
                                <p class="mgt10px">{회원명}, {가입일}</p>
                            </td>
                        </tr>
                    </tbody>
                </table>
                <!-- } 푸시 리스트 -->
			</section>
			<!-- } 부가기능 > 푸시관리 -->
		</div>
		<!-- } 콘텐츠 영역 -->


<c:import url="/Api/admgrIncludeBottom.do"/>