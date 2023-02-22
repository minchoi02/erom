package egovframework.admgrConfig.web;
import java.io.PrintWriter;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.admgrConfig.service.AdmgrConfigService;
import egovframework.admgrConfig.service.AdmgrConfigVO;
import egovframework.base.service.BaseService;
import egovframework.base.service.BaseVO;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
public class AdmgrConfigController {
	
	@Resource(name = "AdmgrConfigService")
	private AdmgrConfigService admgrConfigService;	
	
	@Resource(name = "BaseService")
	private BaseService baseService;	
	
	//=========================================================
	
	@RequestMapping(value = "/admgr/admgrConfig/baseSetting.do")
	public String admgrbaseSetting(
			@ModelAttribute("admgrConfigVO") AdmgrConfigVO admgrConfigVO, 
			@ModelAttribute("baseVO") BaseVO baseVO, 
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
		
			// 은행목록 가져오기
			baseVO.setbase_gp_cd("GP001");
			model.addAttribute("BankList", baseService.get_base_cd_list(baseVO));
			
			// 기본설정 가져오기
			model.addAttribute("BaseConfig",admgrConfigService.get_base_config(null));
			
			return "/admgr/admgrConfig/baseSetting";
		}
	}
	
	@RequestMapping(value = "/admgr/admgrConfig/baseSettingSave.do")
	public void admgrbaseSettingSave(
			@ModelAttribute("admgrConfigVO") AdmgrConfigVO admgrConfigVO, 
			@ModelAttribute("baseVO") BaseVO baseVO, 
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

			admgrConfigVO.setsite_nm(request.getParameter("site_nm"));
			admgrConfigVO.setsite_use_rule(request.getParameter("site_use_rule"));
			admgrConfigVO.setsite_personal(request.getParameter("site_personal"));
			admgrConfigVO.setsite_agree_place(request.getParameter("site_agree_place"));
			admgrConfigVO.setsite_customer_script(request.getParameter("site_customer_script"));
			admgrConfigVO.setsite_email(request.getParameter("site_email"));
			admgrConfigVO.setsite_tel(request.getParameter("site_tel"));
			admgrConfigVO.setsite_fax(request.getParameter("site_fax"));
			admgrConfigVO.setsite_zip(request.getParameter("site_zip"));
			admgrConfigVO.setsite_addr_1(request.getParameter("site_addr_1"));
			admgrConfigVO.setsite_addr_2(request.getParameter("site_addr_2"));
			admgrConfigVO.setsite_ceo_nm(request.getParameter("site_ceo_nm"));
			admgrConfigVO.setsite_company_nm(request.getParameter("site_company_nm"));
			admgrConfigVO.setsite_company_number(request.getParameter("site_company_number"));
			admgrConfigVO.setsite_company_to_number(request.getParameter("site_company_to_number"));
			admgrConfigVO.setsite_sail_auth_number(request.getParameter("site_sail_auth_number"));
			admgrConfigVO.setsite_info_adm_nm(request.getParameter("site_info_adm_nm"));
			admgrConfigVO.setsite_info_adm_email(request.getParameter("site_info_adm_email"));
			admgrConfigVO.setpay_use_bank_st(request.getParameter("pay_use_bank_st"));
			admgrConfigVO.setpay_use_card_st(request.getParameter("pay_use_card_st"));
			admgrConfigVO.setpay_bank_nm(request.getParameter("pay_bank_nm"));
			admgrConfigVO.setpay_bank_number(request.getParameter("pay_bank_number"));
			admgrConfigVO.setpay_bank_user(request.getParameter("pay_bank_user"));
			admgrConfigVO.setpay_card_calc(request.getParameter("pay_card_calc"));
			admgrConfigVO.setpay_real_calc(request.getParameter("pay_real_calc"));
			admgrConfigVO.setpay_virt_calc(request.getParameter("pay_virt_calc"));
			admgrConfigVO.setpay_pg_adm_url(request.getParameter("pay_pg_adm_url"));
			admgrConfigVO.setpay_pg_id(request.getParameter("pay_pg_id"));
			admgrConfigVO.setpay_pg_pwd(request.getParameter("pay_pg_pwd"));
			admgrConfigVO.setsns_use_login_st(request.getParameter("sns_use_login_st"));
			admgrConfigVO.setsns_naver_cid(request.getParameter("sns_naver_cid"));
			admgrConfigVO.setsns_naver_ckey(request.getParameter("sns_naver_ckey"));
			admgrConfigVO.setsns_daum_rakey(request.getParameter("sns_daum_rakey"));
			admgrConfigVO.setsns_daum_jskey(request.getParameter("sns_daum_jskey"));
			admgrConfigVO.setsns_daum_ckey(request.getParameter("sns_daum_ckey"));
			admgrConfigVO.setsns_facebook_cid(request.getParameter("sns_facebook_cid"));
			admgrConfigVO.setsns_facebook_ckey(request.getParameter("sns_facebook_ckey"));
			admgrConfigVO.setsns_apple_cid(request.getParameter("sns_apple_cid"));
			admgrConfigVO.setsns_apple_ckey(request.getParameter("sns_apple_ckey"));
			admgrConfigVO.setcalc_travel(request.getParameter("calc_travel"));
			admgrConfigVO.setcalc_house(request.getParameter("calc_house"));
			admgrConfigVO.setcalc_food(request.getParameter("calc_food"));
			admgrConfigVO.setcalc_market(request.getParameter("calc_market"));
			admgrConfigVO.setmileage_join_use_st(request.getParameter("mileage_join_use_st"));
			admgrConfigVO.setmileage_join(request.getParameter("mileage_join"));
			admgrConfigVO.setmileage_order_use_st(request.getParameter("mileage_order_use_st"));
			admgrConfigVO.setmileage_order(request.getParameter("mileage_order"));
			admgrConfigVO.setinfo_1(request.getParameter("info_1"));
			admgrConfigVO.setinfo_2(request.getParameter("info_2"));
			admgrConfigVO.setinfo_3(request.getParameter("info_3"));
			admgrConfigVO.setinfo_4(request.getParameter("info_4"));
			admgrConfigVO.setinfo_5(request.getParameter("info_5"));
			admgrConfigVO.settime_limit(request.getParameter("time_limit"));
			
			admgrConfigService.base_config_update(admgrConfigVO);
			
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('수정되었습니다.'); location.replace('/admgr/admgrConfig/baseSetting.do'); </script>");
			out.flush();
			
		}
	}
	

	@RequestMapping(value = "/admgr/admgrConfig/popupList.do")
	public String admgrpopupList(
			@ModelAttribute("admgrConfigVO") AdmgrConfigVO admgrConfigVO,
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
			/** EgovPropertyService */
			//admgrConfigVO.setPageUnit(propertiesService.getInt("pageUnit"));
			//admgrConfigVO.setPageSize(propertiesService.getInt("pageSize")); 
			if(adminLevel.equals("5")) {
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>alert('권한이 필요합니다.'); history.back();</script>");
				out.flush();
				return null;
			}
	
			String searchKeyword= request.getParameter("searchKeyword");
			admgrConfigVO.setsearchKeyword(searchKeyword);
			model.addAttribute("searchKeyword", searchKeyword);
			
			/** pageing start */
			admgrConfigVO.setPageUnit(15);
			admgrConfigVO.setPageSize(10); 
			PaginationInfo paginationInfo = new PaginationInfo();
			paginationInfo.setCurrentPageNo(admgrConfigVO.getPageIndex());
			paginationInfo.setRecordCountPerPage(admgrConfigVO.getPageUnit());
			paginationInfo.setPageSize(admgrConfigVO.getPageSize());
	
			admgrConfigVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
			admgrConfigVO.setLastIndex(paginationInfo.getLastRecordIndex());
			admgrConfigVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
			
			// 전체갯수 구하기
			int ListCnt = admgrConfigService.get_popup_list_cnt(admgrConfigVO);
			paginationInfo.setTotalRecordCount(ListCnt);
			model.addAttribute("TotalCnt", ListCnt);
			model.addAttribute("paginationInfo", paginationInfo);
			
			// 해당페이지 시작번호를 구한다.
			int StartPageNumber = ListCnt - (admgrConfigVO.getPageUnit() * (admgrConfigVO.getPageIndex()-1)) + 1;
			model.addAttribute("StartPageNumber", StartPageNumber);
			/** paging end **/
			
			model.addAttribute("popupList", admgrConfigService.get_popup_list(admgrConfigVO));
			
			return "/admgr/admgrConfig/popupList";
		}
	}

	@RequestMapping(value = "/admgr/admgrConfig/popupForm.do")
	public String admgrpopupForm(
			@ModelAttribute("admgrConfigVO") AdmgrConfigVO admgrConfigVO,
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

			String popup_seq = request.getParameter("popup_seq");
			admgrConfigVO.setpopup_seq(popup_seq);
			model.addAttribute("popup_seq", popup_seq);
			
			if(popup_seq != null && popup_seq != "") {
				AdmgrConfigVO popup_info = admgrConfigService.get_popup_info(admgrConfigVO);
				model.addAttribute("popupInfo", popup_info);
			}
			
			return "/admgr/admgrConfig/popupForm";
		}
	}

	@RequestMapping(value = "/admgr/admgrConfig/popupAction.do")
	public void admgrpopupAction(
			@ModelAttribute("admgrConfigVO") AdmgrConfigVO admgrConfigVO,
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

			String return_url = request.getParameter("return_url");	
			String popup_seq = request.getParameter("popup_seq");
			admgrConfigVO.setpopup_seq(popup_seq);
			model.addAttribute("popup_seq", popup_seq);
			
			String popup_use_st = request.getParameter("popup_use_st");
			if(popup_use_st == null || popup_use_st == "") {
				popup_use_st = "N";
			}
			String popup_nm = request.getParameter("popup_nm");
			String popup_top = request.getParameter("popup_top");
			String popup_left = request.getParameter("popup_left");
			String popup_width = request.getParameter("popup_width");
			String popup_height = request.getParameter("popup_height");
			String popup_st_dt_ymd = request.getParameter("popup_st_dt_ymd");
			String popup_st_dt_hour = request.getParameter("popup_st_dt_hour");
			String popup_st_dt_minute = request.getParameter("popup_st_dt_minute");
			String popup_ed_dt_ymd = request.getParameter("popup_ed_dt_ymd");
			String popup_ed_dt_hour = request.getParameter("popup_ed_dt_hour");
			String popup_ed_dt_minute = request.getParameter("popup_ed_dt_minute");
			String popup_content = request.getParameter("popup_content");

			String popup_st_dt = popup_st_dt_ymd + " " + popup_st_dt_hour + ":" + popup_st_dt_minute + ":00";
			String popup_ed_dt = popup_ed_dt_ymd + " " + popup_ed_dt_hour + ":" + popup_ed_dt_minute + ":00";
			
			admgrConfigVO.setpopup_nm(popup_nm);
			admgrConfigVO.setpopup_top(popup_top);
			admgrConfigVO.setpopup_left(popup_left);
			admgrConfigVO.setpopup_width(popup_width);
			admgrConfigVO.setpopup_height(popup_height);
			admgrConfigVO.setpopup_st_dt(popup_st_dt);
			admgrConfigVO.setpopup_ed_dt(popup_ed_dt);
			admgrConfigVO.setpopup_content(popup_content);
			admgrConfigVO.setpopup_use_st(popup_use_st);
			
			String save_mode = "insert";
			if(popup_seq != "" && popup_seq != null) {
				save_mode = "update";
			}
			
			if(("insert").equals(save_mode)) { 	//등록일때..
				admgrConfigService.insert_popup(admgrConfigVO);
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>alert('등록되었습니다.'); location.replace('/admgr/admgrConfig/popupList.do'); </script>");
				out.flush();
				return;
			} else { 	//수정일때..
				admgrConfigService.update_popup(admgrConfigVO);
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>alert('수정되었습니다.'); location.replace('"+return_url+"'); </script>");
				out.flush();			
				return;
			}
		}
			
	}
	
	@RequestMapping(value = "/admgr/admgrConfig/popupDel.do")
	public void admgrpopupDel(
			@ModelAttribute("admgrConfigVO") AdmgrConfigVO admgrConfigVO,
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

			String popup_seq = request.getParameter("popup_seq");
			admgrConfigVO.setpopup_seq(popup_seq);
			model.addAttribute("popup_seq", popup_seq);
			
			if(popup_seq != "" && popup_seq != null) {
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>alert('필수값이 없습니다.'); history.back(); </script>");
				out.flush();
				return;
			} else {
				admgrConfigService.delete_popup(admgrConfigVO);
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>alert('삭제되었습니다.'); location.replace('/admgr/admgrConfig/popupList.do'); </script>");
				out.flush();
				return;
			}
		}
	}
	
}
