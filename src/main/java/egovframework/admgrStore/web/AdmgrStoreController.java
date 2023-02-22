package egovframework.admgrStore.web;
import java.io.PrintWriter;
import java.util.Date;
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
import egovframework.admgrMember.service.AdmgrMemberService;
import egovframework.admgrMember.service.AdmgrMemberVO;
import egovframework.admgrProduct.service.AdmgrProductService;
import egovframework.admgrProduct.service.AdmgrProductVO;
import egovframework.admgrStore.service.AdmgrStoreService;
import egovframework.admgrStore.service.AdmgrStoreVO;
import egovframework.base.service.BaseService;
import egovframework.base.service.BaseVO;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
public class AdmgrStoreController {

	@Resource(name = "AdmgrStoreService")
	private AdmgrStoreService admgrStoreService;

	@Resource(name = "AdmgrMemberService")
	private AdmgrMemberService admgrMemberService;	

	@Resource(name = "AdmgrProductService")
	private AdmgrProductService admgrProductService;	
	
	@Resource(name = "AdmgrConfigService")
	private AdmgrConfigService admgrConfigService;	
	
	@Resource(name = "BaseService")
	private BaseService baseService;	
	
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;	
	
	//===============================================================================================================

	//===============================================================================================================
	// * 상첨리스트
	//===============================================================================================================
	@RequestMapping(value = "/admgr/admgrStore/storeList.do")
	public String admgrstoreList(
		@ModelAttribute("admgrStoreVO") AdmgrStoreVO admgrStoreVO,
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
				admgrStoreVO.setuser_id(adminId);
			}
			
			String searchKey = request.getParameter("searchKey");
			String searchKeyword = request.getParameter("searchKeyword");
			String searchType = request.getParameter("searchType");
			String search_sql = "";
			String searchTypeAdd = "";
			if(searchKeyword != null && searchKeyword != "") {
				String[] searchKeyword_arr = searchKeyword.trim().split(" ");
				if(searchKeyword_arr.length == 1) {
					search_sql = searchKey + " like '%"+searchKeyword+"%' ";
				}
				else if(searchKeyword_arr.length > 1) {
					search_sql = "(";
					for(int i=0; i<searchKeyword_arr.length; i++) {
						if(i == 0) {
							searchTypeAdd = "";
						} else {
							searchTypeAdd = " " +searchType + " ";
						}
						search_sql += searchTypeAdd + searchKey + " like '%"+searchKeyword_arr[i]+"%' ";
					}
					search_sql += ")";
				} else {
					search_sql = "";
				}
			}
			
			String store_category = request.getParameter("store_category");
			String store_use_st = request.getParameter("store_use_st");
			admgrStoreVO.setsearchKey(searchKey);
			admgrStoreVO.setsearchKeyword(searchKeyword);
			admgrStoreVO.setsearch_sql(search_sql);
			admgrStoreVO.setstore_category(store_category);
			admgrStoreVO.setstore_use_st(store_use_st);
			model.addAttribute("searchKey", searchKey);
			model.addAttribute("searchKeyword", searchKeyword);
			model.addAttribute("searchType", searchType);
			model.addAttribute("store_category", store_category);
			model.addAttribute("store_use_st", store_use_st);
			
			if(("5").equals(adminLevel)) {
				admgrStoreVO.setuser_id(adminId);
			}
			
			/** pageing start */
			admgrStoreVO.setPageUnit(15);
			admgrStoreVO.setPageSize(10); 
			PaginationInfo paginationInfo = new PaginationInfo();
			paginationInfo.setCurrentPageNo(admgrStoreVO.getPageIndex());
			paginationInfo.setRecordCountPerPage(admgrStoreVO.getPageUnit());
			paginationInfo.setPageSize(admgrStoreVO.getPageSize());
	
			admgrStoreVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
			admgrStoreVO.setLastIndex(paginationInfo.getLastRecordIndex());
			admgrStoreVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
			
			// 전체갯수 구하기
			int ListCnt = admgrStoreService.get_store_list_cnt(admgrStoreVO);
			paginationInfo.setTotalRecordCount(ListCnt);
			model.addAttribute("TotalCnt", ListCnt);
			model.addAttribute("paginationInfo", paginationInfo);
			
			// 해당페이지 시작번호를 구한다.
			int StartPageNumber = ListCnt - (admgrStoreVO.getPageUnit() * (admgrStoreVO.getPageIndex()-1)) + 1;
			model.addAttribute("StartPageNumber", StartPageNumber);
			/** paging end **/
			
			model.addAttribute("storeList", admgrStoreService.get_store_list(admgrStoreVO));
			
			return "/admgr/admgrStore/storeList";
		}
	}

	//===============================================================================================================
	// * 상첨 등록수정폼
	//===============================================================================================================
	@RequestMapping(value = "/admgr/admgrStore/storeForm.do")
	public String admgrstoreForm(
		@ModelAttribute("admgrStoreVO") AdmgrStoreVO admgrStoreVO,
		@ModelAttribute("admgrMemberVO") AdmgrMemberVO admgrMemberVO,
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
			
			String store_seq = request.getParameter("store_seq");
			String store_category = request.getParameter("store_category");
			String searchKey = request.getParameter("searchKey");
			String searchKeyword = request.getParameter("searchKeyword");
			String pageIndex = request.getParameter("pageIndex");
			model.addAttribute("store_seq", store_seq);
			model.addAttribute("store_category", store_category);
			model.addAttribute("searchKey", searchKey);
			model.addAttribute("searchKeyword", searchKeyword);
			model.addAttribute("pageIndex", pageIndex);

			String save_mode = "insert";
			if(store_seq != null && store_seq != "") {
				save_mode = "update";
			}
			//상덤로그인일때ㅔ
			if(adminLevel.equals("5")) {
				save_mode = "update";
			}
			
			
			// 기본정보를 호출한다.
			// 은행목록 가져오기
			baseVO.setbase_gp_cd("GP001");
			model.addAttribute("BankList", baseService.get_base_cd_list(baseVO));
				
			//택배사호출
			baseVO.setbase_gp_cd("GP003");
			model.addAttribute("TransList", baseService.get_base_cd_list(baseVO));

			//기본설정 읽어오기
			model.addAttribute("BaseConfig", admgrConfigService.get_base_config(null));

			if(save_mode == "update" ) {
				// 몰 설정정보 호출
				admgrStoreVO.setstore_seq(store_seq);
				AdmgrStoreVO store_info = admgrStoreService.get_store_info(admgrStoreVO);
				model.addAttribute("storeInfo", store_info);
				
				String get_user_seq = store_info.getuser_seq();
				admgrMemberVO.setuser_seq(get_user_seq);
				AdmgrMemberVO memberInfo = admgrMemberService.get_member_info(admgrMemberVO);
				String get_user_id = store_info.getuser_id();
				model.addAttribute("memberInfo", memberInfo);
				
				//상점로그인일때 자신의 몰인지체크한다.
				if(adminLevel.equals("5")) {
					if(!adminId.equals(get_user_id)) {
						response.setContentType("text/html; charset=UTF-8");
						PrintWriter out = response.getWriter();
						out.println("<script>alert('권한이 필요합니다.'); history.back();</script>");
						out.flush();
						return null;
					}
				}

				
				String get_store_id = store_info.getstore_id();
				admgrStoreVO.setstore_id(get_store_id);
				
//				admgrStoreVO.setstore_category("CD002001");
//				model.addAttribute("CD002001_deny_date", admgrStoreService.get_deny_date_list(admgrStoreVO));
//				model.addAttribute("CD002001_deny_date_cnt", admgrStoreService.get_deny_date_list(admgrStoreVO));
//				admgrStoreVO.setstore_category("CD002002");
//				model.addAttribute("CD002002_deny_date", admgrStoreService.get_deny_date_list(admgrStoreVO));
//				model.addAttribute("CD002002_deny_date_cnt", admgrStoreService.get_deny_date_list(admgrStoreVO));
				admgrStoreVO.setstore_category("CD002003");
				model.addAttribute("CD002003_deny_date", admgrStoreService.get_deny_date_list(admgrStoreVO));
				model.addAttribute("CD002003_deny_date_cnt", admgrStoreService.get_deny_date_list(admgrStoreVO));
				
				
			} else {
				
				if(adminLevel.equals("5")) {
					response.setContentType("text/html; charset=UTF-8");
					PrintWriter out = response.getWriter();
					out.println("<script>alert('권한이 필요합니다.'); history.back();</script>");
					out.flush();
					return null;
				}
				
				//오늘 날짜 얻기
				SimpleDateFormat todate = new SimpleDateFormat();
				Calendar cal = Calendar.getInstance(); 
				todate.applyPattern("yyyyMMddHHmmss");
				String todayformat = todate.format(cal.getTime()); 
				// 상점아이디 랜덤값 만들기
				int rankey1 = (int) (Math.random() * 9)+1;
				int rankey2 = (int) (Math.random() * 9)+1;
				int rankey3 = (int) (Math.random() * 9)+1;
				int rankey4 = (int) (Math.random() * 9)+1;
				int rankey5 = (int) (Math.random() * 9)+1;

				//상점아이디 생성
				String store_id = "ST"+todayformat+rankey1+rankey2+rankey3+rankey4+rankey5;
				model.addAttribute("StoreId", store_id);

			}
			
			return "/admgr/admgrStore/storeForm";
		}
	}

	//===============================================================================================================
	// *  상점등록수정 액션
	//===============================================================================================================
	@RequestMapping(value = "/admgr/admgrStore/storeAction.do")
	public void admgrstoreAction(
		@ModelAttribute("admgrStoreVO") AdmgrStoreVO admgrStoreVO,
		@ModelAttribute("admgrMemberVO") AdmgrMemberVO admgrMemberVO,
		@ModelAttribute("admgrProductVO") AdmgrProductVO admgrProductVO,
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
			String return_url = request.getParameter("return_url");
			String store_seq = request.getParameter("store_seq");
			
			String save_mode = "insert";
			if(store_seq != null && store_seq != "") {
				save_mode = "update";
			}
			
			String store_nm = request.getParameter("store_nm");
			String store_id = request.getParameter("store_id");
			String user_id = request.getParameter("user_id");
			String store_use_st = request.getParameter("store_use_st");
			if(store_use_st == null || store_use_st == "") {
				store_use_st = "R";
			}
			String store_company_nm = request.getParameter("store_company_nm");
			String store_ceo_nm = request.getParameter("store_ceo_nm");
			String store_zip = request.getParameter("store_zip");
			String store_addr_1 = request.getParameter("store_addr_1");
			String store_addr_2 = request.getParameter("store_addr_2");
			String store_lat = request.getParameter("store_lat");
			String store_lng = request.getParameter("store_lng");
			String store_number = request.getParameter("store_number");
			String store_auth_number = request.getParameter("store_auth_number");
			String store_tel = request.getParameter("store_tel");
			String store_email = request.getParameter("store_email");
			String store_fax = request.getParameter("store_fax");
			String store_url = request.getParameter("store_url");
			String store_hp_1 = request.getParameter("store_hp_1");
			String store_hp_2 = request.getParameter("store_hp_2");
			String store_url_naver_blog = request.getParameter("store_url_naver_blog");
			String store_url_naver_cafe = request.getParameter("store_url_naver_cafe");
			String store_url_facebook = request.getParameter("store_url_facebook");
			String store_url_twitter = request.getParameter("store_url_twitter");
			String store_url_youtube = request.getParameter("store_url_youtube");
			String store_url_instagram = request.getParameter("store_url_instagram");
			String store_introduction = request.getParameter("store_introduction");
			String store_bank_nm_cd = request.getParameter("store_bank_nm_cd");
			String store_bank_number = request.getParameter("store_bank_number");
			String store_bank_user_nm = request.getParameter("store_bank_user_nm");
			String store_admin_memo = request.getParameter("store_admin_memo");

			String store_travel_min_order_price = request.getParameter("store_travel_min_order_price");
			if(store_travel_min_order_price == null || store_travel_min_order_price == "") {
				store_travel_min_order_price = "0";
			}
			String store_house_min_order_price = request.getParameter("store_house_min_order_price");
			if(store_house_min_order_price == null || store_house_min_order_price == "") {
				store_house_min_order_price = "0";
			}
			String store_food_min_order_price = request.getParameter("store_food_min_order_price");
			if(store_food_min_order_price == null || store_food_min_order_price == "") {
				store_food_min_order_price = "0";
			}
			
			String store_img_1 = request.getParameter("store_img_1_id");
			String store_old_img_1 = request.getParameter("store_old_img_1_id");
			String store_img_1_del = request.getParameter("store_img_1_del");
			String store_img_2 = request.getParameter("store_img_2_id");
			String store_old_img_2 = request.getParameter("store_old_img_2_id");
			String store_img_2_del = request.getParameter("store_img_2_del");
			String store_img_3 = request.getParameter("store_img_3_id");
			String store_old_img_3 = request.getParameter("store_old_img_3_id");
			String store_img_3_del = request.getParameter("store_img_3_del");
			String store_img_4 = request.getParameter("store_img_4_id");
			String store_old_img_4 = request.getParameter("store_old_img_4_id");
			String store_img_4_del = request.getParameter("store_img_4_del");
			String store_img_5 = request.getParameter("store_img_5_id");
			String store_old_img_5 = request.getParameter("store_old_img_5_id");
			String store_img_5_del = request.getParameter("store_img_5_del");
			String store_img_6 = request.getParameter("store_img_6_id");
			String store_old_img_6 = request.getParameter("store_old_img_6_id");
			String store_img_6_del = request.getParameter("store_img_6_del");
			String store_img_7 = request.getParameter("store_img_7_id");
			String store_old_img_7 = request.getParameter("store_old_img_7_id");
			String store_img_7_del = request.getParameter("store_img_7_del");
			String store_img_8 = request.getParameter("store_img_8_id");
			String store_old_img_8 = request.getParameter("store_old_img_8_id");
			String store_img_8_del = request.getParameter("store_img_8_del");
			String store_img_9 = request.getParameter("store_img_9_id");
			String store_old_img_9 = request.getParameter("store_old_img_9_id");
			String store_img_9_del = request.getParameter("store_img_9_del");
			String store_img_10 = request.getParameter("store_img_10_id");
			String store_old_img_10 = request.getParameter("store_old_img_10_id");
			String store_img_10_del = request.getParameter("store_img_10_del");

			String store_movie = request.getParameter("store_movie_id");
			String store_old_movie = request.getParameter("store_old_movie_id");
			String store_movie_del = request.getParameter("store_movie_del");
			
			String store_use_travel = request.getParameter("store_use_travel");
			if(store_use_travel == null || store_use_travel == "") {
				store_use_travel = "N";
			}
			String store_use_house = request.getParameter("store_use_house");
			if(store_use_house == null || store_use_house == "") {
				store_use_house = "N";
			}
			String store_use_food = request.getParameter("store_use_food");
			if(store_use_food == null || store_use_food == "") {
				store_use_food = "N";
			}
			String store_use_market = request.getParameter("store_use_market");
			if(store_use_market == null || store_use_market == "") {
				store_use_market = "N";
			}

			if(store_img_1_del == null || store_img_1_del == "") {
				store_img_1_del = "N";
			}
			if(store_img_2_del == null || store_img_2_del == "") {
				store_img_2_del = "N";
			}
			if(store_img_3_del == null || store_img_3_del == "") {
				store_img_3_del = "N";
			}
			if(store_img_4_del == null || store_img_4_del == "") {
				store_img_4_del = "N";
			}
			if(store_img_5_del == null || store_img_5_del == "") {
				store_img_5_del = "N";
			}
			if(store_img_6_del == null || store_img_6_del == "") {
				store_img_6_del = "N";
			}
			if(store_img_7_del == null || store_img_7_del == "") {
				store_img_7_del = "N";
			}
			if(store_img_8_del == null || store_img_8_del == "") {
				store_img_8_del = "N";
			}
			if(store_img_9_del == null || store_img_9_del == "") {
				store_img_9_del = "N";
			}
			if(store_img_10_del == null || store_img_10_del == "") {
				store_img_10_del = "N";
			}
			if(store_movie_del == null || store_movie_del == "") {
				store_movie_del = "N";
			}

			
			String store_travel_calc_percent = request.getParameter("store_travel_calc_percent");
			String store_travel_return_day_7 = request.getParameter("store_travel_return_day_7");
			String store_travel_return_day_5 = request.getParameter("store_travel_return_day_5");
			String store_travel_return_day_3 = request.getParameter("store_travel_return_day_3");
			String store_travel_return_day_2 = request.getParameter("store_travel_return_day_2");
			String store_travel_return_day_1 = request.getParameter("store_travel_return_day_1");
			String store_travel_return_day_0 = request.getParameter("store_travel_return_day_0");
			String store_travel_reserve_note = request.getParameter("store_travel_reserve_note");
			
			String store_house_calc_percent = request.getParameter("store_house_calc_percent");
			String store_house_return_day_7 = request.getParameter("store_house_return_day_7");
			String store_house_return_day_5 = request.getParameter("store_house_return_day_5");
			String store_house_return_day_3 = request.getParameter("store_house_return_day_3");
			String store_house_return_day_2 = request.getParameter("store_house_return_day_2");
			String store_house_return_day_1 = request.getParameter("store_house_return_day_1");
			String store_house_return_day_0 = request.getParameter("store_house_return_day_0");
			String store_house_reserve_note = request.getParameter("store_house_reserve_note");
			
			String store_food_calc_percent = request.getParameter("store_food_calc_percent");
			String store_food_return_day_7 = request.getParameter("store_food_return_day_7");
			String store_food_return_day_5 = request.getParameter("store_food_return_day_5");
			String store_food_return_day_3 = request.getParameter("store_food_return_day_3");
			String store_food_return_day_2 = request.getParameter("store_food_return_day_2");
			String store_food_return_day_1 = request.getParameter("store_food_return_day_1");
			String store_food_return_day_0 = request.getParameter("store_food_return_day_0");
			String store_food_reserve_note = request.getParameter("store_food_reserve_note");
			
			String store_market_calc_percent = request.getParameter("store_market_calc_percent");
			String store_market_delivery_company_cd_1 = request.getParameter("store_market_delivery_company_cd_1");
			String store_market_delivery_company_cd_2 = request.getParameter("store_market_delivery_company_cd_2");
			String store_market_delivery_company_cd_3 = request.getParameter("store_market_delivery_company_cd_3");
			String store_market_default_delivery_price = request.getParameter("store_market_default_delivery_price");
			String store_market_free_delivery_price = request.getParameter("store_market_free_delivery_price");
			String store_market_jeju_delivery_price = request.getParameter("store_market_jeju_delivery_price");
			String store_market_delivery = request.getParameter("store_market_delivery");
			String store_market_returnchange = request.getParameter("store_market_returnchange");
			String store_market_order_note = request.getParameter("store_market_order_note");
			
			String store_info_1 = request.getParameter("store_info_1");
			String store_info_2 = request.getParameter("store_info_2");
			String store_info_3 = request.getParameter("store_info_3");
			String store_info_4 = request.getParameter("store_info_4");
			String store_info_5 = request.getParameter("store_info_5");
			
			String store_info1_1 = request.getParameter("store_info1_1");
			String store_info1_2 = request.getParameter("store_info1_2");
			String store_info1_3 = request.getParameter("store_info1_3");
			String store_info1_4 = request.getParameter("store_info1_4");
			String store_info1_5 = request.getParameter("store_info1_5");

			String store_info2_1 = request.getParameter("store_info2_1");
			String store_info2_2 = request.getParameter("store_info2_2");
			String store_info2_3 = request.getParameter("store_info2_3");
			String store_info2_4 = request.getParameter("store_info2_4");
			String store_info2_5 = request.getParameter("store_info2_5");
			String store_info2_6 = request.getParameter("store_info2_6");
			String store_info2_7 = request.getParameter("store_info2_7");

			String store_info3_1 = request.getParameter("store_info3_1");
			String store_info3_2 = request.getParameter("store_info3_2");
			String store_info3_3 = request.getParameter("store_info3_3");
			String store_info3_4 = request.getParameter("store_info3_4");
			String store_info3_5 = request.getParameter("store_info3_5");
			String store_info3_6 = request.getParameter("store_info3_6");
			String store_info3_7 = request.getParameter("store_info3_7");
			String store_info3_8 = request.getParameter("store_info3_8");
			String store_info3_9 = request.getParameter("store_info3_9");
			String store_info3_10 = request.getParameter("store_info3_10");

			String store_info4_1 = request.getParameter("store_info4_1");
			String store_info4_2 = request.getParameter("store_info4_2");
			String store_info4_3 = request.getParameter("store_info4_3");
			String store_info4_4 = request.getParameter("store_info4_4");
			String store_info4_5 = request.getParameter("store_info4_5");
			String store_info4_6 = request.getParameter("store_info4_6");
			String store_info4_7 = request.getParameter("store_info4_7");
			String store_info4_8 = request.getParameter("store_info4_8");
			String store_info4_9 = request.getParameter("store_info4_9");
			String store_info4_10 = request.getParameter("store_info4_10");
			String store_info4_11 = request.getParameter("store_info4_11");

			String store_info5_1 = request.getParameter("store_info5_1");
			String store_info5_2 = request.getParameter("store_info5_2");
			String store_info5_3 = request.getParameter("store_info5_3");
			String store_info5_4 = request.getParameter("store_info5_4");
			String store_info5_5 = request.getParameter("store_info5_5");
			String store_info5_6 = request.getParameter("store_info5_6");
			String store_info5_7 = request.getParameter("store_info5_7");
			String store_info5_8 = request.getParameter("store_info5_8");
			String store_info5_9 = request.getParameter("store_info5_9");
			String store_info5_10 = request.getParameter("store_info5_10");

			String store_info6_1 = request.getParameter("store_info6_1");
			String store_info6_2 = request.getParameter("store_info6_2");
			String store_info6_3 = request.getParameter("store_info6_3");
			String store_info6_4 = request.getParameter("store_info6_4");
			String store_info6_5 = request.getParameter("store_info6_5");
			String store_info6_6 = request.getParameter("store_info6_6");
			String store_info6_7 = request.getParameter("store_info6_7");
			String store_info6_8 = request.getParameter("store_info6_8");
			String store_info6_9 = request.getParameter("store_info6_9");
			String store_info6_10 = request.getParameter("store_info6_10");
			String store_info6_11 = request.getParameter("store_info6_11");
			String store_info6_12 = request.getParameter("store_info6_12");
			String store_info6_13 = request.getParameter("store_info6_13");

			String store_info7_1 = request.getParameter("store_info7_1");
			String store_info7_2 = request.getParameter("store_info7_2");
			String store_info7_3 = request.getParameter("store_info7_3");
			String store_info7_4 = request.getParameter("store_info7_4");
			String store_info7_5 = request.getParameter("store_info7_5");
			String store_info7_6 = request.getParameter("store_info7_6");
			String store_info7_7 = request.getParameter("store_info7_7");
			String store_info7_8 = request.getParameter("store_info7_8");
			String store_info7_9 = request.getParameter("store_info7_9");
			String store_info7_10 = request.getParameter("store_info7_10");
			String store_info7_11 = request.getParameter("store_info7_11");

			String store_info8_1 = request.getParameter("store_info8_1");
			String store_info8_2 = request.getParameter("store_info8_2");
			String store_info8_3 = request.getParameter("store_info8_3");
			String store_info8_4 = request.getParameter("store_info8_4");
			String store_info8_5 = request.getParameter("store_info8_5");

			admgrStoreVO.setstore_seq(store_seq);
			admgrStoreVO.setstore_nm(store_nm);
			admgrStoreVO.setstore_id(store_id);
			admgrStoreVO.setuser_id(user_id);
			admgrStoreVO.setstore_use_st(store_use_st);
			admgrStoreVO.setstore_company_nm(store_company_nm);
			admgrStoreVO.setstore_ceo_nm(store_ceo_nm);
			admgrStoreVO.setstore_zip(store_zip);
			admgrStoreVO.setstore_addr_1(store_addr_1);
			admgrStoreVO.setstore_addr_2(store_addr_2);
			admgrStoreVO.setstore_lat(store_lat);
			admgrStoreVO.setstore_lng(store_lng);
			admgrStoreVO.setstore_number(store_number);
			admgrStoreVO.setstore_auth_number(store_auth_number);
			admgrStoreVO.setstore_tel(store_tel);
			admgrStoreVO.setstore_email(store_email);
			admgrStoreVO.setstore_fax(store_fax);
			admgrStoreVO.setstore_url(store_url);
			admgrStoreVO.setstore_hp_1(store_hp_1);
			admgrStoreVO.setstore_hp_2(store_hp_2);
			admgrStoreVO.setstore_url_naver_blog(store_url_naver_blog);
			admgrStoreVO.setstore_url_naver_cafe(store_url_naver_cafe);
			admgrStoreVO.setstore_url_facebook(store_url_facebook);
			admgrStoreVO.setstore_url_twitter(store_url_twitter);
			admgrStoreVO.setstore_url_youtube(store_url_youtube);
			admgrStoreVO.setstore_url_instagram(store_url_instagram);
			admgrStoreVO.setstore_introduction(store_introduction);
			admgrStoreVO.setstore_bank_nm_cd(store_bank_nm_cd);
			admgrStoreVO.setstore_bank_number(store_bank_number);
			admgrStoreVO.setstore_bank_user_nm(store_bank_user_nm);
			admgrStoreVO.setstore_admin_memo(store_admin_memo);
			
			admgrStoreVO.setstore_travel_min_order_price(store_travel_min_order_price);
			admgrStoreVO.setstore_house_min_order_price(store_house_min_order_price);
			admgrStoreVO.setstore_food_min_order_price(store_food_min_order_price);

			admgrStoreVO.setstore_img_1(store_img_1);
			admgrStoreVO.setstore_img_2(store_img_2);
			admgrStoreVO.setstore_img_3(store_img_3);
			admgrStoreVO.setstore_img_4(store_img_4);
			admgrStoreVO.setstore_img_5(store_img_5);
			admgrStoreVO.setstore_img_6(store_img_6);
			admgrStoreVO.setstore_img_7(store_img_7);
			admgrStoreVO.setstore_img_8(store_img_8);
			admgrStoreVO.setstore_img_9(store_img_9);
			admgrStoreVO.setstore_img_10(store_img_10);

			admgrStoreVO.setstore_use_travel(store_use_travel);
			admgrStoreVO.setstore_use_house(store_use_house);
			admgrStoreVO.setstore_use_food(store_use_food);
			admgrStoreVO.setstore_use_market(store_use_market);
			
			admgrStoreVO.setstore_travel_calc_percent(store_travel_calc_percent);
			admgrStoreVO.setstore_travel_return_day_7(store_travel_return_day_7);
			admgrStoreVO.setstore_travel_return_day_5(store_travel_return_day_5);
			admgrStoreVO.setstore_travel_return_day_3(store_travel_return_day_3);
			admgrStoreVO.setstore_travel_return_day_2(store_travel_return_day_2);
			admgrStoreVO.setstore_travel_return_day_1(store_travel_return_day_1);
			admgrStoreVO.setstore_travel_return_day_0(store_travel_return_day_0);
			admgrStoreVO.setstore_travel_reserve_note(store_travel_reserve_note);
			
			admgrStoreVO.setstore_house_calc_percent(store_house_calc_percent);
			admgrStoreVO.setstore_house_return_day_7(store_house_return_day_7);
			admgrStoreVO.setstore_house_return_day_5(store_house_return_day_5);
			admgrStoreVO.setstore_house_return_day_3(store_house_return_day_3);
			admgrStoreVO.setstore_house_return_day_2(store_house_return_day_2);
			admgrStoreVO.setstore_house_return_day_1(store_house_return_day_1);
			admgrStoreVO.setstore_house_return_day_0(store_house_return_day_0);
			admgrStoreVO.setstore_house_reserve_note(store_house_reserve_note);
			
			admgrStoreVO.setstore_food_calc_percent(store_food_calc_percent);
			admgrStoreVO.setstore_food_return_day_7(store_food_return_day_7);
			admgrStoreVO.setstore_food_return_day_5(store_food_return_day_5);
			admgrStoreVO.setstore_food_return_day_3(store_food_return_day_3);
			admgrStoreVO.setstore_food_return_day_2(store_food_return_day_2);
			admgrStoreVO.setstore_food_return_day_1(store_food_return_day_1);
			admgrStoreVO.setstore_food_return_day_0(store_food_return_day_0);
			admgrStoreVO.setstore_food_reserve_note(store_food_reserve_note);
			
			admgrStoreVO.setstore_market_calc_percent(store_market_calc_percent);
			admgrStoreVO.setstore_market_delivery_company_cd_1(store_market_delivery_company_cd_1);
			admgrStoreVO.setstore_market_delivery_company_cd_2(store_market_delivery_company_cd_2);
			admgrStoreVO.setstore_market_delivery_company_cd_3(store_market_delivery_company_cd_3);
			admgrStoreVO.setstore_market_default_delivery_price(store_market_default_delivery_price);
			admgrStoreVO.setstore_market_free_delivery_price(store_market_free_delivery_price);
			admgrStoreVO.setstore_market_jeju_delivery_price(store_market_jeju_delivery_price);
			admgrStoreVO.setstore_market_delivery(store_market_delivery);
			admgrStoreVO.setstore_market_returnchange(store_market_returnchange);
			admgrStoreVO.setstore_market_order_note(store_market_order_note);

			admgrStoreVO.setstore_info_1(store_info_1);
			admgrStoreVO.setstore_info_2(store_info_2);
			admgrStoreVO.setstore_info_3(store_info_3);
			admgrStoreVO.setstore_info_4(store_info_4);
			admgrStoreVO.setstore_info_5(store_info_5);
			
			admgrStoreVO.setstore_info1_1(store_info1_1);
			admgrStoreVO.setstore_info1_2(store_info1_2);
			admgrStoreVO.setstore_info1_3(store_info1_3);
			admgrStoreVO.setstore_info1_4(store_info1_4);
			admgrStoreVO.setstore_info1_5(store_info1_5);

			admgrStoreVO.setstore_info2_1(store_info2_1);
			admgrStoreVO.setstore_info2_2(store_info2_2);
			admgrStoreVO.setstore_info2_3(store_info2_3);
			admgrStoreVO.setstore_info2_4(store_info2_4);
			admgrStoreVO.setstore_info2_5(store_info2_5);
			admgrStoreVO.setstore_info2_6(store_info2_6);
			admgrStoreVO.setstore_info2_7(store_info2_7);

			admgrStoreVO.setstore_info3_1(store_info3_1);
			admgrStoreVO.setstore_info3_2(store_info3_2);
			admgrStoreVO.setstore_info3_3(store_info3_3);
			admgrStoreVO.setstore_info3_4(store_info3_4);
			admgrStoreVO.setstore_info3_5(store_info3_5);
			admgrStoreVO.setstore_info3_6(store_info3_6);
			admgrStoreVO.setstore_info3_7(store_info3_7);
			admgrStoreVO.setstore_info3_8(store_info3_8);
			admgrStoreVO.setstore_info3_9(store_info3_9);
			admgrStoreVO.setstore_info3_10(store_info3_10);

			admgrStoreVO.setstore_info4_1(store_info4_1);
			admgrStoreVO.setstore_info4_2(store_info4_2);
			admgrStoreVO.setstore_info4_3(store_info4_3);
			admgrStoreVO.setstore_info4_4(store_info4_4);
			admgrStoreVO.setstore_info4_5(store_info4_5);
			admgrStoreVO.setstore_info4_6(store_info4_6);
			admgrStoreVO.setstore_info4_7(store_info4_7);
			admgrStoreVO.setstore_info4_8(store_info4_8);
			admgrStoreVO.setstore_info4_9(store_info4_9);
			admgrStoreVO.setstore_info4_10(store_info4_10);
			admgrStoreVO.setstore_info4_11(store_info4_11);

			admgrStoreVO.setstore_info5_1(store_info5_1);
			admgrStoreVO.setstore_info5_2(store_info5_2);
			admgrStoreVO.setstore_info5_3(store_info5_3);
			admgrStoreVO.setstore_info5_4(store_info5_4);
			admgrStoreVO.setstore_info5_5(store_info5_5);
			admgrStoreVO.setstore_info5_6(store_info5_6);
			admgrStoreVO.setstore_info5_7(store_info5_7);
			admgrStoreVO.setstore_info5_8(store_info5_8);
			admgrStoreVO.setstore_info5_9(store_info5_9);
			admgrStoreVO.setstore_info5_10(store_info5_10);

			admgrStoreVO.setstore_info6_1(store_info6_1);
			admgrStoreVO.setstore_info6_2(store_info6_2);
			admgrStoreVO.setstore_info6_3(store_info6_3);
			admgrStoreVO.setstore_info6_4(store_info6_4);
			admgrStoreVO.setstore_info6_5(store_info6_5);
			admgrStoreVO.setstore_info6_6(store_info6_6);
			admgrStoreVO.setstore_info6_7(store_info6_7);
			admgrStoreVO.setstore_info6_8(store_info6_8);
			admgrStoreVO.setstore_info6_9(store_info6_9);
			admgrStoreVO.setstore_info6_10(store_info6_10);
			admgrStoreVO.setstore_info6_11(store_info6_11);
			admgrStoreVO.setstore_info6_12(store_info6_12);
			admgrStoreVO.setstore_info6_13(store_info6_13);

			admgrStoreVO.setstore_info7_1(store_info7_1);
			admgrStoreVO.setstore_info7_2(store_info7_2);
			admgrStoreVO.setstore_info7_3(store_info7_3);
			admgrStoreVO.setstore_info7_4(store_info7_4);
			admgrStoreVO.setstore_info7_5(store_info7_5);
			admgrStoreVO.setstore_info7_6(store_info7_6);
			admgrStoreVO.setstore_info7_7(store_info7_7);
			admgrStoreVO.setstore_info7_8(store_info7_8);
			admgrStoreVO.setstore_info7_9(store_info7_9);
			admgrStoreVO.setstore_info7_10(store_info7_10);
			admgrStoreVO.setstore_info7_11(store_info7_11);

			admgrStoreVO.setstore_info8_1(store_info8_1);
			admgrStoreVO.setstore_info8_2(store_info8_2);
			admgrStoreVO.setstore_info8_3(store_info8_3);
			admgrStoreVO.setstore_info8_4(store_info8_4);
			admgrStoreVO.setstore_info8_5(store_info8_5);
			
			//예약불가일을 모두 삭제
			admgrStoreService.delete_deny_date(admgrStoreVO);
			//예약불가일 등록
//			String[] CD002001_deny_ymd = request.getParameterValues("CD002001_deny_ymd");
//			String[] CD002002_deny_ymd = request.getParameterValues("CD002002_deny_ymd");
			String[] CD002003_deny_ymd = request.getParameterValues("CD002003_deny_ymd");

/*			if(CD002001_deny_ymd != null ) {
				for(int i=0; i<CD002001_deny_ymd.length; i++) {
					if(CD002001_deny_ymd[i] != "" && CD002001_deny_ymd[i] != null ) {
						admgrStoreVO.setstore_category("CD002001");
						admgrStoreVO.setstore_deny_date(CD002001_deny_ymd[i]);
						admgrStoreService.insert_deny_date(admgrStoreVO);
					}
				}
			}
			if(CD002002_deny_ymd != null ) {
				for(int i=0; i<CD002002_deny_ymd.length; i++) {
					if(CD002002_deny_ymd[i] != "" && CD002002_deny_ymd[i] != null ) {
						admgrStoreVO.setstore_id(store_id);
						admgrStoreVO.setstore_category("CD002002");
						admgrStoreVO.setstore_deny_date(CD002002_deny_ymd[i]);
						admgrStoreService.insert_deny_date(admgrStoreVO);
					}
				}
			}
*/			
			if(CD002003_deny_ymd != null ) {
				for(int i=0; i<CD002003_deny_ymd.length; i++) {
					if(CD002003_deny_ymd[i] != "" && CD002003_deny_ymd[i] != null ) {
						admgrStoreVO.setstore_id(store_id);
						admgrStoreVO.setstore_category("CD002003");
						admgrStoreVO.setstore_deny_date(CD002003_deny_ymd[i]);
						admgrStoreService.insert_deny_date(admgrStoreVO);
					}
				}
			}			
			
			//숙박예약시간설정
			String[] store_food_reserve_time = request.getParameterValues("store_food_reserve_time");
			String store_food_reserve_time_set = "";
			if(store_food_reserve_time != null ) {
				for(int i=0; i<store_food_reserve_time.length; i++) {
					if(store_food_reserve_time[i] != "" && store_food_reserve_time[i] != null ) {
						store_food_reserve_time_set += store_food_reserve_time[i] + ",";
					}
				}
			}
			admgrStoreVO.setstore_food_reserve_time(store_food_reserve_time_set);
			
			if(("insert").equals(save_mode)) { 	//등록일때..
				admgrStoreService.insert_store(admgrStoreVO);
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>alert('등록되었습니다.'); location.replace('/admgr/admgrStore/storeList.do'); </script>");
				out.flush();
				return;
			} else { 	//수정일때..
				
				if(store_img_1_del.equals("Y")) {
					admgrStoreVO.setstore_img_1(store_img_1);
				} else {
					if(store_img_1 != null && store_img_1 != "") {
						admgrStoreVO.setstore_img_1(store_img_1);
					} else {
						admgrStoreVO.setstore_img_1(store_old_img_1);
					}
				}
				if(store_img_2_del.equals("Y")) {
					admgrStoreVO.setstore_img_2(store_img_2);
				} else {
					if(store_img_2 != null && store_img_2 != "") {
						admgrStoreVO.setstore_img_2(store_img_2);
					} else {
						admgrStoreVO.setstore_img_2(store_old_img_2);
					}
				}
				if(store_img_3_del.equals("Y")) {
					admgrStoreVO.setstore_img_3(store_img_3);
				} else {
					if(store_img_3 != null && store_img_3 != "") {
						admgrStoreVO.setstore_img_3(store_img_3);
					} else {
						admgrStoreVO.setstore_img_3(store_old_img_3);
					}
				}
				if(store_img_4_del.equals("Y")) {
					admgrStoreVO.setstore_img_4(store_img_4);
				} else {
					if(store_img_4 != null && store_img_4 != "") {
						admgrStoreVO.setstore_img_4(store_img_4);
					} else {
						admgrStoreVO.setstore_img_4(store_old_img_4);
					}
				}
				if(store_img_5_del.equals("Y")) {
					admgrStoreVO.setstore_img_5(store_img_5);
				} else {
					if(store_img_5 != null && store_img_5 != "") {
						admgrStoreVO.setstore_img_5(store_img_5);
					} else {
						admgrStoreVO.setstore_img_5(store_old_img_5);
					}
				}
				if(store_img_6_del.equals("Y")) {
					admgrStoreVO.setstore_img_6(store_img_6);
				} else {
					if(store_img_6 != null && store_img_6 != "") {
						admgrStoreVO.setstore_img_6(store_img_6);
					} else {
						admgrStoreVO.setstore_img_6(store_old_img_6);
					}
				}
				if(store_img_7_del.equals("Y")) {
					admgrStoreVO.setstore_img_7(store_img_7);
				} else {
					if(store_img_7 != null && store_img_7 != "") {
						admgrStoreVO.setstore_img_7(store_img_7);
					} else {
						admgrStoreVO.setstore_img_7(store_old_img_7);
					}
				}
				if(store_img_8_del.equals("Y")) {
					admgrStoreVO.setstore_img_8(store_img_8);
				} else {
					if(store_img_8 != null && store_img_8 != "") {
						admgrStoreVO.setstore_img_8(store_img_8);
					} else {
						admgrStoreVO.setstore_img_8(store_old_img_8);
					}
				}
				if(store_img_9_del.equals("Y")) {
					admgrStoreVO.setstore_img_9(store_img_9);
				} else {
					if(store_img_9 != null && store_img_9 != "") {
						admgrStoreVO.setstore_img_9(store_img_9);
					} else {
						admgrStoreVO.setstore_img_9(store_old_img_9);
					}
				}
				if(store_img_10_del.equals("Y")) {
					admgrStoreVO.setstore_img_10(store_img_10);
				} else {
					if(store_img_10 != null && store_img_10 != "") {
						admgrStoreVO.setstore_img_10(store_img_10);
					} else {
						admgrStoreVO.setstore_img_10(store_old_img_10);
					}
				}
				if(store_movie_del.equals("Y")) {
					admgrStoreVO.setstore_movie(store_movie);
				} else {
					if(store_movie != null && store_movie != "") {
						admgrStoreVO.setstore_movie(store_movie);
					} else {
						admgrStoreVO.setstore_movie(store_old_movie);
					}
				}
				
				admgrStoreVO.setuser_level(adminLevel);
				admgrStoreService.update_store(admgrStoreVO);
			
				// 상품검색편의로 상품에 상점명을 넣는다. 여기서 업데이트를 진행해준다.
				admgrProductService.update_store_nm(admgrProductVO);

				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>alert('수정되었습니다.'); location.replace('"+return_url+"'); </script>");
				out.flush();			
				return;
			}
			
		}
	}
	
	//===============================================================================================================
	// *  모달 상점 회원검색
	//===============================================================================================================
	@RequestMapping(value = "/admgr/admgrModal/storeModalSearch.do")
	public String admgrStoreModalSearch(
			@ModelAttribute("admgrStoreVO") AdmgrStoreVO admgrStoreVO,
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
			out.println("AN");
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

			String modalsearchKey = request.getParameter("modalsearchKey");
			String modalsearchKeyword = request.getParameter("modalsearchKeyword");
			String modalstore_category = request.getParameter("store_category");
			admgrStoreVO.setsearchKey(modalsearchKey);
			admgrStoreVO.setsearchKeyword(modalsearchKeyword);
			admgrStoreVO.setstore_category(modalstore_category);
			model.addAttribute("modalsearchKey", modalsearchKey);
			model.addAttribute("modalsearchKeyword", modalsearchKeyword);
			model.addAttribute("modalstore_category", modalstore_category);

			// 전체갯수 구하기
			int ListCnt = admgrStoreService.get_modal_store_list_cnt(admgrStoreVO);
			model.addAttribute("modalTotalCnt", ListCnt);
			
			model.addAttribute("modalStoreList", admgrStoreService.get_modal_store_list(admgrStoreVO));

			return "/admgr/admgrModal/modalStoreList";
		}

	}	
	
	//===============================================================================================================
	// *  모달 상점 회원검색
	//===============================================================================================================
	@RequestMapping(value = "/admgr/admgrModal/storeInfodata.do")
	public String admgrstoreInfodata(
			@ModelAttribute("admgrStoreVO") AdmgrStoreVO admgrStoreVO,
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
			out.println("AN");
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

			String store_category = request.getParameter("store_category");
			String store_id = request.getParameter("store_id");
			model.addAttribute("store_category", store_category);
			model.addAttribute("store_id", store_id);
			
			// 전체갯수 구하기
			admgrStoreVO.setmodalsearchKey(store_id);
			model.addAttribute("storeInfoAjax", admgrStoreService.get_store_simple_id_info(admgrStoreVO));
			
			return "/admgr/admgrModal/AjaxStoreInfo";
		}
		
	}	
	
	//===============================================================================================================
	// *  상첨 정산리스트
	//===============================================================================================================
	@RequestMapping(value = "/admgr/admgrStore/storeCalculateList.do")
	public String admgrstoreCalculateList(
		@ModelAttribute("admgrStoreVO") AdmgrStoreVO admgrStoreVO,
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
			
			String search_ym = request.getParameter("search_ym");
			if(search_ym == null || search_ym == "") {
				
				//이번년 얻기
				SimpleDateFormat formatdatey = new SimpleDateFormat("yyyy");
				Date datey = new Date();
				Calendar caly = Calendar.getInstance(); 
				caly.setTime(datey);
				String thisY= formatdatey.format(caly.getTime());
				model.addAttribute("thisY", thisY);
				
				//이번년 얻기
				SimpleDateFormat formatdateym = new SimpleDateFormat("yyyy-MM");
				Date dateym = new Date();
				Calendar calym = Calendar.getInstance(); 
				calym.setTime(dateym);
				String thisYm = formatdateym.format(calym.getTime());
				model.addAttribute("thisYm", thisYm);
				search_ym = thisYm;
				model.addAttribute("search_ym", search_ym);
				
			} else {
				String[] ym_arr = search_ym.split("-");
				model.addAttribute("thisY", ym_arr[0]);
				model.addAttribute("thisYm", search_ym);
			}
			
			admgrStoreVO.setcal_reg_dt(search_ym);
			if(adminLevel.equals("5")) {
				admgrStoreVO.setcal_store_user_id(adminId);
			}
			
			/** pageing start */
			admgrStoreVO.setPageUnit(15);
			admgrStoreVO.setPageSize(10); 
			PaginationInfo paginationInfo = new PaginationInfo();
			paginationInfo.setCurrentPageNo(admgrStoreVO.getPageIndex());
			paginationInfo.setRecordCountPerPage(admgrStoreVO.getPageUnit());
			paginationInfo.setPageSize(admgrStoreVO.getPageSize());
	
			admgrStoreVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
			admgrStoreVO.setLastIndex(paginationInfo.getLastRecordIndex());
			admgrStoreVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
			
			// 전체갯수 구하기
			int ListCnt = admgrStoreService.get_calc_list_cnt(admgrStoreVO);
			paginationInfo.setTotalRecordCount(ListCnt);
			model.addAttribute("TotalCnt", ListCnt);
			model.addAttribute("paginationInfo", paginationInfo);
			
			// 해당페이지 시작번호를 구한다.
			int StartPageNumber = ListCnt - (admgrStoreVO.getPageUnit() * (admgrStoreVO.getPageIndex()-1)) + 1;
			model.addAttribute("StartPageNumber", StartPageNumber);
			/** paging end **/
			
			List<AdmgrStoreVO> calc_list = admgrStoreService.get_calc_list(admgrStoreVO);
			model.addAttribute("calcList", calc_list);
			
			return "/admgr/admgrStore/storeCalculateList";
		}
	}

	//===============================================================================================================
	// *  상첨 정산상세
	//===============================================================================================================
	@RequestMapping(value = "/admgr/admgrStore/storeCalculateDetail.do")
	public String admgrstoreCalculateDetail(
		@ModelAttribute("admgrStoreVO") AdmgrStoreVO admgrStoreVO,
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
		
		//기본설정 읽어오기
		model.addAttribute("BaseConfig", admgrConfigService.get_base_config(null));
		
		String search_ym = request.getParameter("search_ym");
		String store_id = request.getParameter("store_id");
		String pageIndex = request.getParameter("pageIndex");
		if(search_ym == null || search_ym == "") {
			//오늘 날짜 얻기
			SimpleDateFormat todate = new SimpleDateFormat();
			SimpleDateFormat today = new SimpleDateFormat();
			Calendar cal = Calendar.getInstance(); 
			today.applyPattern("yyyy-MM");
			search_ym = today.format(cal.getTime()); 
		}
		model.addAttribute("search_ym", search_ym);
		model.addAttribute("store_id", store_id);
		model.addAttribute("pageIndex", pageIndex);

		admgrStoreVO.setcal_reg_dt(search_ym);
		admgrStoreVO.setcal_store_id(store_id);
		if(adminLevel.equals("5")) {
			admgrStoreVO.setcal_store_user_id(adminId);
		}
		
		admgrStoreVO.setstore_id(store_id);
		AdmgrStoreVO store_info = admgrStoreService.get_store_simple_id_info(admgrStoreVO);
		if(("5").equals(adminLevel)) {
			String get_user_id = store_info.getuser_id();
			if(!get_user_id.equals(adminId)) {
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				//작업시 아래라인 주석
				out.println("<script>alert('권한이 없습니다.'); history.back(); </script>");
				out.flush();
				return null;
			}
		}
		model.addAttribute("storeInfo", store_info);
		
		List<AdmgrStoreVO> calc_detail_list = admgrStoreService.get_calc_master_list(admgrStoreVO);
		model.addAttribute("calcDetailList", calc_detail_list);
		String order_id = "";
		String cal_id= "";
		if(calc_detail_list != null) {
			for(int i=0; i<calc_detail_list.size(); i++) {
				cal_id = calc_detail_list.get(i).getcal_id();
				order_id = calc_detail_list.get(i).getcal_order_id();
				admgrStoreVO.setcal_order_id(order_id);
				admgrStoreVO.setcal_id(cal_id);
				model.addAttribute("calcDetailList_"+order_id+"_"+cal_id, admgrStoreService.get_calc_detail_list(admgrStoreVO));
			}
		}
		
		return "/admgr/admgrStore/storeCalculateDetail";
		}
	}
	
	//===============================================================================================================
	// *  상첨 저장
	//===============================================================================================================
	@RequestMapping(value = "/admgr/admgrStore/storeCalculateSave.do")
	public void admgrstoreCalculateSave(
			@ModelAttribute("admgrStoreVO") AdmgrStoreVO admgrStoreVO,
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
			
			if(!("10").equals(adminLevel)) {
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>alert('권한이 없습니다.'); history.back(); </script>");
				out.flush();
				return;
			}
			
			//기본설정 읽어오기
			model.addAttribute("BaseConfig", admgrConfigService.get_base_config(null));
			
			String search_ym = request.getParameter("search_ym");
			String store_id = request.getParameter("store_id");
			String pageIndex = request.getParameter("pageIndex");
			String save_type = request.getParameter("save_type");
			model.addAttribute("search_ym", search_ym);
			model.addAttribute("store_id", store_id);
			model.addAttribute("pageIndex", pageIndex);
			
			if(("content").equals(save_type)) {
				String[] cal_seqs = request.getParameterValues("cal_seq");
				for(int i=0; i<cal_seqs.length; i++) {
					String cal_content = request.getParameter("cal_content_"+cal_seqs[i]);
					admgrStoreVO.setcal_content(cal_content);
					admgrStoreVO.setcal_seq(cal_seqs[i]);
					admgrStoreService.update_calc_content(admgrStoreVO);
				}
			}
			if(("cancel").equals(save_type)) {
				String[] cal_ids = request.getParameterValues("calc_checked");
				for(int i=0; i<cal_ids.length; i++) {
					String[] cal_ids_arr = cal_ids[i].split( "\\_");
					String cal_id = cal_ids_arr[0];
					String cal_order_id = cal_ids_arr[1];
					String cal_store_id = cal_ids_arr[2];
					String cal_st = "N";
					admgrStoreVO.setcal_id(cal_id);
					admgrStoreVO.setcal_order_id(cal_order_id);
					admgrStoreVO.setcal_store_id(cal_store_id);
					admgrStoreVO.setcal_st(cal_st);
					admgrStoreService.update_calc_status(admgrStoreVO);
				}
			}
			if(("auth").equals(save_type)) {
				String[] cal_ids = request.getParameterValues("calc_checked");
				for(int i=0; i<cal_ids.length; i++) {
					String[] cal_ids_arr = cal_ids[i].split( "\\_");
					String cal_id = cal_ids_arr[0];
					String cal_order_id = cal_ids_arr[1];
					String cal_store_id = cal_ids_arr[2];
					String cal_st = "Y";
					admgrStoreVO.setcal_id(cal_id);
					admgrStoreVO.setcal_order_id(cal_order_id);
					admgrStoreVO.setcal_store_id(cal_store_id);
					admgrStoreVO.setcal_st(cal_st);
					admgrStoreService.update_calc_status(admgrStoreVO);
				}
			}
			
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('처리되었습니다.'); location.replace('/admgr/admgrStore/storeCalculateDetail.do?pageIndex="+pageIndex+"&store_id="+store_id+"&search_ym="+search_ym+"'); </script>");
			out.flush();
			return;
			
		}
	}

}
