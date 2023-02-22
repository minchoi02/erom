package egovframework.admgrExtention.web;
import java.io.PrintWriter;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ibm.icu.text.SimpleDateFormat;
import com.ibm.icu.util.Calendar;

import egovframework.admgrConfig.service.AdmgrConfigService;
import egovframework.admgrConfig.service.AdmgrConfigVO;
import egovframework.admgrExtention.service.AdmgrExtentionService;
import egovframework.admgrExtention.service.AdmgrExtentionVO;
import egovframework.base.service.BaseService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
public class AdmgrExtentionController {

	@Resource(name = "AdmgrExtentionService")
	private AdmgrExtentionService admgrExtentionService;	
	
	@Resource(name = "BaseService")
	private BaseService baseService;
	
	@Resource(name = "AdmgrConfigService")
	private AdmgrConfigService admgrConfigService;	
	
	
	//===============================================================================================================
	// *  푸쉬;
	//===============================================================================================================
	@RequestMapping(value = "/admgr/admgrExtention/push.do")
	public String admgrpush(	
			@ModelAttribute("AdmgrExtentionVO") AdmgrExtentionVO admgrExtentionVO,
			ModelMap model,
			HttpServletRequest request,
			HttpServletResponse response
			) throws Exception {
			
			HttpSession session = request.getSession(true);
			String adminId = (String) session.getAttribute("adminId");
			String adminLevel = (String) session.getAttribute("adminLevel");
			
			if(adminId == null || adminId == "" ) {
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>alert('관리자로그인이 필요합니다.'); location.href='/admgr/login.do'; </script>");
				out.flush();
				return null;
			}  else {
				
				if(adminLevel.equals("5")) {
					response.setContentType("text/html; charset=UTF-8");
					PrintWriter out = response.getWriter();
					out.println("<script>alert('권한이 필요합니다.'); history.back();</script>");
					out.flush();
					return null;
				}

				return "/admgr/admgrExtention/push";
			}
	}

	//===============================================================================================================
	// *  문자
	//===============================================================================================================
	@RequestMapping(value = "/admgr/admgrExtention/sms.do")
	public String admgrsms(
		@ModelAttribute("AdmgrExtentionVO") AdmgrExtentionVO admgrExtentionVO,
		@ModelAttribute("AdmgrConfigVO") AdmgrConfigVO admgrConfigVO,
		ModelMap model,
		HttpServletRequest request,
		HttpServletResponse response
		) throws Exception {
		
		HttpSession session = request.getSession(true);
		String adminId = (String) session.getAttribute("adminId");
		String adminLevel = (String) session.getAttribute("adminLevel");
		
		if(adminId == null || adminId == "" ) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('관리자로그인이 필요합니다.'); location.href='/admgr/login.do'; </script>");
			out.flush();
			return null;
		}  else {
			
			if(adminLevel.equals("5")) {
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>alert('권한이 필요합니다.'); history.back();</script>");
				out.flush();
				return null;
			}
			
			AdmgrConfigVO getConfig = admgrConfigService.get_base_config(null);
			String callback = getConfig.getsms_send(); 
			
			String searchKeyword = request.getParameter("searchKeyword");
			String sms_add = request.getParameter("sms_add");
			String sms_msg = request.getParameter("sms_msg");
			String sms_target = request.getParameter("sms_target");
			
			
			String[] sms_number = request.getParameterValues("sms_number");
			
			admgrExtentionVO.setuser_level("2");
			List<AdmgrExtentionVO> memberList = admgrExtentionService.get_sms_member_list(admgrExtentionVO); 
			model.addAttribute("memberList", memberList);
			model.addAttribute("memberListCnt", admgrExtentionService.get_sms_member_list_cnt(admgrExtentionVO));
			
			admgrExtentionVO.setuser_level("5");
			List<AdmgrExtentionVO> storeList = admgrExtentionService.get_sms_store_list(admgrExtentionVO); 
			model.addAttribute("storeList", storeList);
			model.addAttribute("storeListCnt", admgrExtentionService.get_sms_store_list_cnt(admgrExtentionVO));

			if(sms_add != null && sms_add != "") {
				admgrExtentionVO.setsms_type("U");
				admgrExtentionVO.setsms_target("I");
				admgrExtentionVO.settr_callback(callback);
				admgrExtentionVO.settr_msg(sms_msg);

				switch(sms_target) {
					case "normal_sel" :
						for(int i=0; i<sms_number.length; i++) {
							if(sms_number[i] != null && sms_number[i] != "") {
								admgrExtentionVO.settr_phone(sms_number[i]);
								admgrExtentionService.sms_add(admgrExtentionVO);
								admgrExtentionService.sms_add_log(admgrExtentionVO);
							}
						}
						break;
					case "store_sel" :
						for(int i=0; i<sms_number.length; i++) {
							if(sms_number[i] != null && sms_number[i] != "") {
								admgrExtentionVO.settr_phone(sms_number[i]);
								admgrExtentionService.sms_add(admgrExtentionVO);
								admgrExtentionService.sms_add_log(admgrExtentionVO);
							}
						}
						break;
					case "normal_all" :
						for(int i=0; i<memberList.size(); i++) {
							admgrExtentionVO.settr_phone(memberList.get(i).getuser_hp());
							admgrExtentionService.sms_add(admgrExtentionVO);
							admgrExtentionService.sms_add_log(admgrExtentionVO);
						}
						break;
					case "store_all" :
						for(int i=0; i<storeList.size(); i++) {
							admgrExtentionVO.settr_phone(storeList.get(i).getuser_hp());
							admgrExtentionService.sms_add(admgrExtentionVO);
							admgrExtentionService.sms_add_log(admgrExtentionVO);
						}
						break;
					case "all" :
						for(int i=0; i<memberList.size(); i++) {
							admgrExtentionVO.settr_phone(memberList.get(i).getuser_hp());
							admgrExtentionService.sms_add(admgrExtentionVO);
							admgrExtentionService.sms_add_log(admgrExtentionVO);
						}
						for(int i=0; i<storeList.size(); i++) {
							admgrExtentionVO.settr_phone(storeList.get(i).getuser_hp());
							admgrExtentionService.sms_add(admgrExtentionVO);
							admgrExtentionService.sms_add_log(admgrExtentionVO);
						}
						break;
					case "input" :
						for(int i=0; i<sms_number.length; i++) {
							if(sms_number[i] != null && sms_number[i] != "") {
								admgrExtentionVO.settr_phone(sms_number[i]);
								admgrExtentionService.sms_add(admgrExtentionVO);
								admgrExtentionService.sms_add_log(admgrExtentionVO);
							}
						}
						break;
				}
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>alert('문자가 발송되었습니다.'); location.replace('/admgr/admgrExtention/sms.do');</script>");
				out.flush();
				return null;
			}
			
			/** pageing start */
			admgrExtentionVO.setPageUnit(10);
			admgrExtentionVO.setPageSize(10); 
			PaginationInfo paginationInfo = new PaginationInfo();
			paginationInfo.setCurrentPageNo(admgrExtentionVO.getPageIndex());
			paginationInfo.setRecordCountPerPage(admgrExtentionVO.getPageUnit());
			paginationInfo.setPageSize(admgrExtentionVO.getPageSize());

			admgrExtentionVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
			admgrExtentionVO.setLastIndex(paginationInfo.getLastRecordIndex());
			admgrExtentionVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

			// 전체갯수 구하기
			int ListCnt = admgrExtentionService.get_sms_list_cnt(admgrExtentionVO);
			paginationInfo.setTotalRecordCount(ListCnt);
			model.addAttribute("TotalCnt", ListCnt);
			model.addAttribute("paginationInfo", paginationInfo);

			// 해당페이지 시작번호를 구한다.
			int StartPageNumber = ListCnt - (admgrExtentionVO.getPageUnit() * (admgrExtentionVO.getPageIndex()-1)) + 1;
			model.addAttribute("StartPageNumber", StartPageNumber);
			/** paging end **/
			
			List<AdmgrExtentionVO> smsList = admgrExtentionService.get_sms_list(admgrExtentionVO);
			model.addAttribute("smsList",smsList);

			return "/admgr/admgrExtention/sms";
		}
	}

	//===============================================================================================================
		// *  문자
		//===============================================================================================================
		@RequestMapping(value = "/admgr/admgrExtention/smsAction.do")
		public void admgrsmsAction(
			@ModelAttribute("AdmgrExtentionVO") AdmgrExtentionVO admgrExtentionVO,
			ModelMap model,
			HttpServletRequest request,
			HttpServletResponse response
			) throws Exception {
			
			HttpSession session = request.getSession(true);
			String adminId = (String) session.getAttribute("adminId");
			String adminLevel = (String) session.getAttribute("adminLevel");
			
			if(adminId == null || adminId == "" ) {
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>alert('관리자로그인이 필요합니다.'); location.href='/admgr/login.do'; </script>");
				out.flush();
				return;
			}  else {
				
				if(adminLevel.equals("5")) {
					response.setContentType("text/html; charset=UTF-8");
					PrintWriter out = response.getWriter();
					out.println("<script>alert('권한이 필요합니다.'); history.back();</script>");
					out.flush();
					return;
				}
				

			}
		}
	
	
	//===============================================================================================================
	// *  메일
	//===============================================================================================================
	@RequestMapping(value = "/admgr/admgrExtention/mail.do")
	public String admgrmail(
		@ModelAttribute("AdmgrExtentionVO") AdmgrExtentionVO admgrExtentionVO,
		ModelMap model,
		HttpServletRequest request,
		HttpServletResponse response
		) throws Exception {
		
		HttpSession session = request.getSession(true);
		String adminId = (String) session.getAttribute("adminId");
		String adminLevel = (String) session.getAttribute("adminLevel");
		
		if(adminId == null || adminId == "" ) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('관리자로그인이 필요합니다.'); location.href='/admgr/login.do'; </script>");
			out.flush();
			return null;
		}  else {
			
			if(adminLevel.equals("5")) {
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>alert('권한이 필요합니다.'); history.back();</script>");
				out.flush();
				return null;
			}

			return "/admgr/admgrExtention/mail";
		}
	}

	//===============================================================================================================
	// *  쿠폰
	//===============================================================================================================
	@RequestMapping(value = "/admgr/admgrExtention/coupon.do")
	public String admgrcoupon(
		@ModelAttribute("AdmgrExtentionVO") AdmgrExtentionVO admgrExtentionVO,
		ModelMap model,
		HttpServletRequest request,
		HttpServletResponse response
		) throws Exception {
		
		HttpSession session = request.getSession(true);
		String adminId = (String) session.getAttribute("adminId");
		String adminLevel = (String) session.getAttribute("adminLevel");
		
		if(adminId == null || adminId == "" ) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('관리자로그인이 필요합니다.'); location.href='/admgr/login.do'; </script>");
			out.flush();
			return null;
		}  else {
			
			if(adminLevel.equals("5")) {
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>alert('권한이 필요합니다.'); history.back();</script>");
				out.flush();
				return null;
			}
			
			//오늘 날짜 얻기
			SimpleDateFormat todate = new SimpleDateFormat();
			SimpleDateFormat today = new SimpleDateFormat();

			Calendar cal = Calendar.getInstance(); 
			
			todate.applyPattern("yyyyMMddHHmmss");
			today.applyPattern("yyyy-MM-dd");
			
			String todateformat = todate.format(cal.getTime()); 
			String todayformat = today.format(cal.getTime()); 
			// 상점아이디 랜덤값 만들기
			int rankey1 = (int) (Math.random() * 9)+1;
			int rankey2 = (int) (Math.random() * 9)+1;
			int rankey3 = (int) (Math.random() * 9)+1;
			int rankey4 = (int) (Math.random() * 9)+1;
			int rankey5 = (int) (Math.random() * 9)+1;

			//쿠폰아이디 생성
			String make_coupon_id = "C"+todateformat+rankey1+rankey2+rankey3+rankey4+rankey5;
			model.addAttribute("couponId", make_coupon_id);
			
			String coupon_seq = request.getParameter("coupon_seq");
			String searchKeyword = request.getParameter("searchKeyword");
			String pageIndex = request.getParameter("pageIndex");
			String store_category = request.getParameter("store_category");
			if(pageIndex == null || pageIndex =="") {
				pageIndex = "1";
			}
			model.addAttribute("coupon_seq", coupon_seq);
			model.addAttribute("searchKeyword", searchKeyword);
			model.addAttribute("pageIndex", pageIndex);
			model.addAttribute("store_category", store_category);
			
			if(coupon_seq != null && coupon_seq != "") {
				admgrExtentionVO.setcoupon_seq(coupon_seq);
				model.addAttribute("couponInfo", admgrExtentionService.get_coupon_info(admgrExtentionVO));
			}
			
			/** pageing start */
			admgrExtentionVO.setPageUnit(10);
			admgrExtentionVO.setPageSize(10); 
			PaginationInfo paginationInfo = new PaginationInfo();
			paginationInfo.setCurrentPageNo(admgrExtentionVO.getPageIndex());
			paginationInfo.setRecordCountPerPage(admgrExtentionVO.getPageUnit());
			paginationInfo.setPageSize(admgrExtentionVO.getPageSize());

			admgrExtentionVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
			admgrExtentionVO.setLastIndex(paginationInfo.getLastRecordIndex());
			admgrExtentionVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

			// 전체갯수 구하기
			int ListCnt = admgrExtentionService.get_coupon_list_cnt(admgrExtentionVO);
			paginationInfo.setTotalRecordCount(ListCnt);
			model.addAttribute("TotalCnt", ListCnt);
			model.addAttribute("paginationInfo", paginationInfo);

			// 해당페이지 시작번호를 구한다.
			int StartPageNumber = ListCnt - (admgrExtentionVO.getPageUnit() * (admgrExtentionVO.getPageIndex()-1)) + 1;
			model.addAttribute("StartPageNumber", StartPageNumber);
			/** paging end **/		
			
			model.addAttribute("couponList", admgrExtentionService.get_coupon_list(admgrExtentionVO));
			
			return "/admgr/admgrExtention/coupon";
		}
	}
	
	//===============================================================================================================
	// *  쿠폰 저장
	//===============================================================================================================
	@RequestMapping(value = "/admgr/admgrExtention/couponAction.do")
	public void admgrcouponAction(
		@ModelAttribute("AdmgrExtentionVO") AdmgrExtentionVO admgrExtentionVO,
		ModelMap model,
		HttpServletRequest request,
		HttpServletResponse response
		) throws Exception {
		
		HttpSession session = request.getSession(true);
		String adminId = (String) session.getAttribute("adminId");
		String adminLevel = (String) session.getAttribute("adminLevel");
		
		if(adminId == null || adminId == "" ) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('관리자로그인이 필요합니다.'); location.href='/admgr/login.do'; </script>");
			out.flush();
			return;
		}  else {
			
			if(adminLevel.equals("5")) {
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>alert('권한이 필요합니다.'); history.back();</script>");
				out.flush();
				return;
			}
			
			String coupon_seq = request.getParameter("coupon_seq");
			String searchKeyword = request.getParameter("searchKeyword");
			String pageIndex = request.getParameter("pageIndex");
			String coupon_use_st = request.getParameter("coupon_use_st");
			String return_url = request.getParameter("return_url");
			if(pageIndex == null || pageIndex =="") {
				pageIndex = "1";
			}
			String del_st = "N";
			
			String save_mode = "insert";
			if(coupon_seq != "" && coupon_seq != null) {
				save_mode = "update";
			}
			
			String coupon_id = request.getParameter("coupon_id");
			String coupon_nm = request.getParameter("coupon_nm");
			String store_category = request.getParameter("store_category");
			String coupon_set_st = request.getParameter("coupon_set_st");
			String coupon_set_price = request.getParameter("coupon_set_price");
			String coupon_st_dt_ymd = request.getParameter("coupon_st_dt_ymd");
			String coupon_st_dt_hour = request.getParameter("coupon_st_dt_hour");
			String coupon_st_dt_minute = request.getParameter("coupon_st_dt_minute");
			String coupon_ed_dt_ymd = request.getParameter("coupon_ed_dt_ymd");
			String coupon_ed_dt_hour = request.getParameter("coupon_ed_dt_hour");
			String coupon_ed_dt_minute = request.getParameter("coupon_ed_dt_minute");
			
			String coupon_st_dt = coupon_st_dt_ymd + " " + coupon_st_dt_hour + ":" + coupon_st_dt_minute + ":00";
			String coupon_ed_dt = coupon_ed_dt_ymd + " " + coupon_ed_dt_hour + ":" + coupon_ed_dt_minute + ":00";
			
			admgrExtentionVO.setcoupon_id(coupon_id);
			admgrExtentionVO.setcoupon_nm(coupon_nm);
			admgrExtentionVO.setstore_category(store_category);
			admgrExtentionVO.setcoupon_set_st(coupon_set_st);
			admgrExtentionVO.setcoupon_set_price(coupon_set_price);
			admgrExtentionVO.setcoupon_st_dt(coupon_st_dt);
			admgrExtentionVO.setcoupon_ed_dt(coupon_ed_dt);
			admgrExtentionVO.setcoupon_set_st(coupon_set_st);
			admgrExtentionVO.setcoupon_use_st(coupon_use_st);
			admgrExtentionVO.setdel_st(del_st);
			admgrExtentionVO.setsearchKeyword(searchKeyword);
			
			if(("insert").equals(save_mode)) { 	//등록일때..
				admgrExtentionService.insert_coupon(admgrExtentionVO);
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>alert('등록되었습니다.'); location.replace('"+return_url+"'); </script>");
				out.flush();
				return;
			} else { 	//수정일때..
				admgrExtentionService.update_coupon(admgrExtentionVO);
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>alert('수정되었습니다.'); location.replace('"+return_url+"'); </script>");
				out.flush();			
				return;
			}
			
		}
	}

	//===============================================================================================================
	// *  쿠폰 삭제
	//===============================================================================================================
	@RequestMapping(value = "/admgr/admgrExtention/couponDel.do")
	public void admgrcouponDel(
		@ModelAttribute("AdmgrExtentionVO") AdmgrExtentionVO admgrExtentionVO,
		ModelMap model,
		HttpServletRequest request,
		HttpServletResponse response
		) throws Exception {
		
		HttpSession session = request.getSession(true);
		String adminId = (String) session.getAttribute("adminId");
		String adminLevel = (String) session.getAttribute("adminLevel");
		
		if(adminId == null || adminId == "" ) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('관리자로그인이 필요합니다.'); location.href='/admgr/login.do'; </script>");
			out.flush();
			return;
		}  else {
			
			if(adminLevel.equals("5")) {
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>alert('권한이 필요합니다.'); history.back();</script>");
				out.flush();
				return;
			}

			
			String coupon_seq = request.getParameter("coupon_seq");
			String searchKeyword = request.getParameter("searchKeyword");
			String pageIndex = request.getParameter("pageIndex");
			String store_category = request.getParameter("store_category");
			String del_st = "Y";
			
			admgrExtentionVO.setcoupon_seq(coupon_seq);
			admgrExtentionVO.setdel_st(del_st);
			admgrExtentionService.delete_coupon(admgrExtentionVO);
			
			//마지막페이지 다시 구하기 시작
			// 삭제 후, 페이징이 감소되어 오류나는 것을 방지하기 위함
			admgrExtentionVO.setPageUnit(15);
			admgrExtentionVO.setPageSize(10); 
			// request로 넘겨받은 것이 String이므로 숫자형으로 형변환
			int thisPageIndex = Integer.valueOf(pageIndex);
			// 전체갯수 구하기
			int ListCnt = admgrExtentionService.get_coupon_list_cnt(admgrExtentionVO);
			// 정수형으로 구함 - int은 몫만 반환
			int pageTypeInt = ListCnt/admgrExtentionVO.getPageUnit();
			// float형으로 다시구함
			float pageTypeFloat = (float)ListCnt/admgrExtentionVO.getPageUnit();
			// 값이 0 이하일때 1로 설정
			if(pageTypeInt<1) { pageTypeInt = 1; }
			if(pageTypeFloat<1) { pageTypeFloat = 1; }
			// 기본값 설정
			int LastPage = pageTypeInt;
			if( (pageTypeFloat - pageTypeInt) > 0 ) {
				// 한페이지가 넘을때..  마지막값에 1을 더해 페이지가 하나 더 있음을 설정
				LastPage = pageTypeInt+1;
			}
			// 마지막페이지 기본설정 - 념겨받은 값
			int newPageIndex = thisPageIndex;
			if(LastPage - thisPageIndex < 0) {
				// 삭제로 인해 최종페이지가 바뀌었다면... 최종페이지에서 넘겨받은 페이지를 뺀다.
				// 재설정된 마지막페이지내에 념겨받은 페이지가 존재하지 않는다면.. 마지막 재설정된 페이지를 반환한다.
				newPageIndex = LastPage; 
			}
			// 마지막페이지 다시 구하기 끝		
			
			String return_url = "/admgr/admgrExtention/coupon.do?pageIndex="+newPageIndex+"&store_category="+store_category+"&searchKeyword="+searchKeyword;
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('삭제되었습니다.'); location.href='"+return_url+"'; </script>");
			out.flush();
			return;
			
		}
	}

	//===============================================================================================================
	// *  쿠폰 모달 조회
	//===============================================================================================================
	@RequestMapping(value = "/admgr/admgrModal/couponModalSearch.do")
	public String admgrccouponModalSearch(
		@ModelAttribute("AdmgrExtentionVO") AdmgrExtentionVO admgrExtentionVO,
		ModelMap model,
		HttpServletRequest request,
		HttpServletResponse response
		) throws Exception {
		
		HttpSession session = request.getSession(true);
		String adminId = (String) session.getAttribute("adminId");
		String adminLevel = (String) session.getAttribute("adminLevel");
		
		if(adminId == null || adminId == "" ) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('관리자로그인이 필요합니다.'); location.href='/admgr/login.do'; </script>");
			out.flush();
			return null;
		}  else {
			
			String cp_bbs_id = request.getParameter("cp_bbs_id");
			String searchKeyword = request.getParameter("modalsearchKeyword");
			model.addAttribute("cp_bbs_id", cp_bbs_id);
			admgrExtentionVO.setsearchKeyword(searchKeyword);
			
			model.addAttribute("modalCouponList", admgrExtentionService.get_modal_coupon_list(admgrExtentionVO));
			model.addAttribute("modalTotalCnt", admgrExtentionService.get_modal_coupon_list_cnt(admgrExtentionVO));
			
			return "/admgr/admgrModal/modalCouponList";
			
		}
	}

	
}

