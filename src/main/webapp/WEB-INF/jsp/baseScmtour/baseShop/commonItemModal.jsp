<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>


	<!-- 모달팝업 // Q&A 작성하기 -->
	<div id="writeqna" class="modal fade writeqna" tabindex="-1" role="dialog">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header bgOrangeGra">
					<button type="button" class="closebtn" data-dismiss="modal" aria-label="Close"><i class="fal fa-times"></i></button>
					<h4 class="modal-title" id="qna_title"> Q&A 작성</h4>
					<input type="hidden" id="qna_bbs_seq" value=""/>
				</div>
				<div class="modal-body">
					<div class="writebox"><textarea rows="12" class="basic_textarea w100" name="qna_content" id="qna_content" placeholder="내용을 작성해주세요."></textarea></div>
					<div class="secretbox mgt10px">
						<input type="checkbox" id="bbs_secure_st" name="bbs_secure_st" value="Y" class="basic_check" /><label for="bbs_secure_st"><span></span> 비밀글을 원할 시 체크해주세요</label>
					</div>
					<div class="btnArea alignCenter mgt10px">
						<button type="button" id="submit_review_btn" class="btns orangebtn h50px w100" onclick="save_qna('QNA', '<c:out value="${prod_id}"/>','<c:out value="${prodInfo.store_id}"/>');">확 인</button>
					</div>
				</div>
			</div>
			</form>
		</div>
	</div>
	<!-- 모달팝업 // Q&A 작성하기 -->
	

	<!-- 모달팝업 // 리뷰 작성하기 -->
	<div id="writereview" class="modal fade writereview" tabindex="-1" role="dialog">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header bgOrangeGra">
					<button type="button" class="closebtn" data-dismiss="modal" aria-label="Close"><i class="fal fa-times"></i></button>
					<h4 class="modal-title" id="review_title"> 리뷰 작성</h4>
					<input type="hidden" id="review_bbs_seq" value=""/>
				</div>
				<div class="modal-body">
					<div class="starchoice alignCenter">
						<a href="#;" id='star_a_1' class="star1" onclick="star_set(1); return false; "><i id='star_1' class="fas fa-star"></i></a>
						<a href="#;" id='star_a_2' class="star2" onclick="star_set(2); return false; "><i id='star_2' class="fal fa-star"></i></a>
						<a href="#;" id='star_a_3' class="star3" onclick="star_set(3); return false; "><i id='star_3' class="fal fa-star"></i></a>
						<a href="#;" id='star_a_4' class="star4" onclick="star_set(4); return false; "><i id='star_4' class="fal fa-star"></i></a>
						<a href="#;" id='star_a_5' class="star5" onclick="star_set(5); return false; "><i id='star_5' class="fal fa-star"></i></a>
						<input type="hidden" id=set_star value="1" />
					</div>
					<div class="writebox mgt10px"><textarea rows="12" class="basic_textarea w100" name="review_content" id="review_content" placeholder="리뷰 내용을 작성해주세요."></textarea></div>
					<div class="btnArea alignCenter mgt10px">
						<button type="button" id="submit_review_btn" class="btns orangebtn h50px w100" onclick="save_review('REVIEW', '<c:out value="${prod_id}"/>','<c:out value="${prodInfo.store_id}"/>');">확 인</button>
					</div>
				</div>
			</div>
			</form>
		</div>
	</div>
	
	<!-- 모달팝업 > 객실안내 { -->
	<div id="roomInfo" class="modal fade roominfo" tabindex="1" role="dialog">
		<div class="modal-dialog" role="document" >
			<div class="modal-content" >
				<div class="modal-header bgOrangeGra">
					<button type="button" class="closebtn" data-dismiss="modal" aria-label="Close"><i class="fal fa-times"></i></button>
					<h4 class="modal-title">객실안내</h4>
				</div>
				<div class="modal-body" id="roomdetail">
					<dl class="nopm">
						<dt>기본정보</dt>
						<dd>기본정보가 들어가는 공간입니다.</dd>
					</dl>
					<dl class="nopm">
						<dt>편의시설</dt>
						<dd>편의시설이 들어가는 공간입니다.</dd>
					</dl>
				</div>
			</div>
		</div>
	</div>
	<!-- } 모달팝업 > 객실안내 -->
	
	<!-- 모달팝업 // 리뷰 작성하기 -->