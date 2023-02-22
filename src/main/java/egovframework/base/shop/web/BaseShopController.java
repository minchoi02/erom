package egovframework.base.shop.web;

import java.io.PrintWriter;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Calendar;
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

import egovframework.admgrConfig.service.AdmgrConfigService;
import egovframework.admgrConfig.service.AdmgrConfigVO;
import egovframework.base.board.service.BaseBoardService;
import egovframework.base.board.service.BaseBoardVO;
import egovframework.base.index.service.BaseIndexService;
import egovframework.base.index.service.BaseIndexVO;
import egovframework.base.member.service.BaseMemberService;
import egovframework.base.member.service.BaseMemberVO;
import egovframework.base.service.BaseService;
import egovframework.base.service.BaseVO;
import egovframework.base.shop.service.BaseShopService;
import egovframework.base.shop.service.BaseShopVO;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
public class BaseShopController {

	@Resource(name = "BaseShopService")
	private BaseShopService baseShopService;	
	
	@Resource(name = "BaseBoardService")
	private BaseBoardService baseBoardService;	
	
	@Resource(name = "BaseMemberService")
	private BaseMemberService baseMemberService;	
	
	@Resource(name = "BaseIndexService")
	private BaseIndexService baseIndexService;	
	
	@Resource(name = "BaseService")
	private BaseService baseService;	
	
	@Resource(name = "AdmgrConfigService")
	private AdmgrConfigService admgrConfigService;	
	
	//=========================================================

	//=========================================================
	// 주문페이지
	//=========================================================
	@RequestMapping(value = "/shop/order.do")
	public String Shoporder(
			@ModelAttribute("BaseShopVO") BaseShopVO baseShopVO, 
			ModelMap model, 
			HttpServletRequest request, 
			HttpServletResponse response
		) throws Exception {

		String store_category = request.getParameter("store_category");
		model.addAttribute("store_category", store_category);

		String prod_category = request.getParameter("prod_category");
		model.addAttribute("prod_category", prod_category);		
		
		String prod_id = request.getParameter("prod_id");
		model.addAttribute("prod_id", prod_id);		
		
		//상품정보를 끌어온다.
		baseShopVO.setprod_id(prod_id);
		BaseShopVO prod_info = baseShopService.get_site_prod_info(baseShopVO);

		if(prod_info == null) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('존재하지 않는 상품입니다.'); history.back(); </script>");
			out.flush();
			return null;
		} else  {	
			model.addAttribute("prodInfo", prod_info);
			String prod_comment = prod_info.getprod_comment();
			model.addAttribute("prod_comment", BaseService.nl2br(prod_comment));
		
			//상점정보 가져오ㄱ;
			String store_id = prod_info.getstore_id();
			baseShopVO.setstore_id(store_id);
			BaseShopVO store_info = baseShopService.get_site_store_info(baseShopVO);
			model.addAttribute("storeInfo", store_info);
			
			//옵션정보 가져오기
			model.addAttribute("optList", baseShopService.get_option_list(baseShopVO));
			
			if(store_category.equals("CD002002")) {
				String reserve_st_dt = request.getParameter("reserve_st_dt");
				model.addAttribute("reserve_st_dt", reserve_st_dt);

				//model.addAttribute("reserve_st_dt_str", BaseService.getWeekStr(reserve_st_dt,"S"));	//입실일 요일
				model.addAttribute("reserve_st_dt_str", BaseService.getWeekStr(reserve_st_dt,"S"));	//입실일 요일
				
				String reserve_ed_dt = request.getParameter("reserve_ed_dt");
				model.addAttribute("reserve_ed_dt", reserve_ed_dt);
				model.addAttribute("reserve_ed_dt_str", BaseService.getWeekStr(reserve_ed_dt,"S"));	//퇴실일 요일
				
				//비수기,준성수기,성수기 날짜 구하자
				String rs_st_date = store_info.getstore_house_ready_date_st_dt(); //준성수기 시작
 				String rs_ed_date = store_info.getstore_house_ready_date_ed_dt(); //준성수기 끝
				String bu_st_date = store_info.getstore_house_busy_date_st_dt(); //성수기 시작
				String bu_ed_date = store_info.getstore_house_busy_date_ed_dt(); //성수기 끝
				String rs_st_date2 = store_info.getstore_house_ready2_date_st_dt(); //준성수기 시작
 				String rs_ed_date2 = store_info.getstore_house_ready2_date_ed_dt(); //준성수기 끝
				
				//숙박기간
				String diffDay = BaseService.getDateDiff(reserve_st_dt, reserve_ed_dt);
				model.addAttribute("sleepDt", diffDay);
				
				//날짜가 비수기/준성수기/성수기 인지 체크
				int normal_normal = 0;	//비수기인가?
				int normal_holiday = 0;	//비수기인가?
				int ready_normal = 0;	//준성수기인가?
				int ready_holiday = 0;	//준성수기인가?
				int busy_normal = 0; //성수기인가?
				int busy_holiday = 0; //성수기인가?
				int ready2_normal = 0;	//준성수기인가?
				int ready2_holiday = 0;	//준성수기인가?

				Calendar cal = Calendar.getInstance() ;
				SimpleDateFormat rdate = new SimpleDateFormat("yyyy-MM-dd");
				Date set_date = rdate.parse(reserve_st_dt);
				cal.setTime(set_date);
				
				baseShopVO.setstore_id(store_id);
				for(int i=0; i<Integer.parseInt(diffDay); i++) {
					//날짜를 구해보자.
					if(i == 0) {
						cal.add(Calendar.DATE, 0);
					} else {
						cal.add(Calendar.DATE, 1);
					}
					String chk_date = rdate.format(cal.getTime());
					
					//날짜별 요일구하기
					String Yoil = BaseService.getWeekStr(chk_date,"N");
					//String Yoilstr = BaseService.getWeekStr(chk_date,"S");
					
					//비수기, 준성수기, 비수기 체크
					baseShopVO.setset_date(chk_date);
					BaseShopVO get_day_check = baseShopService.get_day_check(baseShopVO);
					String date_check = get_day_check.getroom_day_check();
					switch(date_check) {
						case "R" :	//준성수기 
							if(Yoil.equals("7")) {
								ready_holiday++; 
							} else {
								ready_normal++;
							}
							break;
						case "R2" :	//준성수기 2
							if(Yoil.equals("7")) {
								ready2_holiday++; 
							} else {
								ready2_normal++;
							}
							break;
						case "B" : //성수기
							if(Yoil.equals("7")) {
								busy_holiday++; 
							} else {
								busy_normal++;
							}
							break;
						default : //비수기
							if(Yoil.equals("7")) {
								normal_holiday++; 
							} else {
								normal_normal++;
							}
							break;
					}
					
				}
				model.addAttribute("normal_normal", normal_normal);
				model.addAttribute("normal_holiday", normal_holiday);
				model.addAttribute("ready_normal", ready_normal);
				model.addAttribute("ready_holiday", ready_holiday);
				model.addAttribute("busy_normal", busy_normal);
				model.addAttribute("busy_holiday", busy_holiday);
				model.addAttribute("ready2_normal", ready2_normal);
				model.addAttribute("ready2_holiday", ready2_holiday);
				
				String prod_room_seq = request.getParameter("prod_room_seq");
				model.addAttribute("prod_room_seq", prod_room_seq);

				baseShopVO.setprod_room_seq(prod_room_seq);
				baseShopVO.setreserve_st_dt(reserve_st_dt);
				baseShopVO.setreserve_ed_dt(reserve_ed_dt);
				BaseShopVO room_info = baseShopService.get_site_room_info(baseShopVO);
				if(room_info == null) {
					response.setContentType("text/html; charset=UTF-8");
					PrintWriter out = response.getWriter();
					out.println("<script>alert('존재하지 않는 상품입니다.'); history.back(); </script>");
					out.flush();
					return null;
				} else {
					model.addAttribute("roomInfo", room_info);
				}
			}
		
		return "/baseScmtour/baseShop/order";
		}
	}

	//=========================================================
	// 상품목록
	//=========================================================
	@RequestMapping(value = "/shop/itemList.do")
	public String ShopitemList(
			@ModelAttribute("BaseShopVO") BaseShopVO baseShopVO, 
			@ModelAttribute("BaseVO") BaseVO baseVO, 
			ModelMap model, 
			HttpServletRequest request, 
			HttpServletResponse response
		) throws Exception {
		
		String store_category = request.getParameter("store_category");
		model.addAttribute("store_category", store_category);
		
		String prod_category = request.getParameter("prod_category");
		model.addAttribute("prod_category", prod_category);
		
		String orderby = request.getParameter("orderby");
		if(orderby == null || orderby == "") {
			orderby = "Recom";
		}		
		model.addAttribute("orderby", orderby);
		
		// 베스트상품 구하기
		baseShopVO.setstore_category(store_category);
		if(prod_category != null || prod_category != "") {
			baseShopVO.setprod_category(prod_category);
		}
		baseShopVO.setsql_limit(10);
		model.addAttribute("bestProdList", baseShopService.get_main_item_top(baseShopVO));
		
		//일반상품목록 구하기 --> ajajx로 처리함.
		if(store_category.equals("CD002004")) {
			baseVO.setbase_cd("CD005001");
			model.addAttribute("prod_category_1", baseService.get_base_cd_info(baseVO));
			baseVO.setbase_cd("CD005002");
			model.addAttribute("prod_category_2", baseService.get_base_cd_info(baseVO));
			baseVO.setbase_cd("CD005003");
			model.addAttribute("prod_category_3", baseService.get_base_cd_info(baseVO));
			baseVO.setbase_cd("CD005004");
			model.addAttribute("prod_category_4", baseService.get_base_cd_info(baseVO));
			baseVO.setbase_cd("CD005005");
			model.addAttribute("prod_category_5", baseService.get_base_cd_info(baseVO));
		}
		
		// 전체갯수 구하기
		baseShopVO.setstore_category(store_category);
		int ListCnt = baseShopService.get_site_prod_list_cnt(baseShopVO);
		model.addAttribute("ListCnt", ListCnt);
		
		return "/baseScmtour/baseShop/itemList";
	}

	//=========================================================
	// 상품목록
	// 요청이 들어올때마다  뿌림.
	//=========================================================
	@RequestMapping(value = "/Ajax/itemList.do")
	public String ShopitemAjaxList(
			@ModelAttribute("BaseShopVO") BaseShopVO baseShopVO, 
			ModelMap model, 
			HttpServletRequest request, 
			HttpServletResponse response
		) throws Exception {
		
		String pageNum = request.getParameter("pageNum");
		model.addAttribute("pageNum", pageNum);
		
		String pagePerCnt = request.getParameter("pagePerCnt");
		model.addAttribute("pagePerCnt", pagePerCnt);
		
		String store_category = request.getParameter("store_category");
		model.addAttribute("store_category", store_category);
		
		String prod_category = request.getParameter("prod_category");
		model.addAttribute("prod_category", prod_category);
		
		String orderby = request.getParameter("orderby");
		if(orderby == null || orderby == "") {
			orderby = "Recom";
		}		
		model.addAttribute("orderby", orderby);
		baseShopVO.setorderby(orderby);
		
		// 상품 구하기
		baseShopVO.setstore_category(store_category);
		if(prod_category != null || prod_category != "") {
			baseShopVO.setprod_category(prod_category);
		}
		
		int StartPage = Integer.parseInt(pageNum) * Integer.parseInt(pagePerCnt); 
		baseShopVO.setsql_start(StartPage);
		baseShopVO.setsql_limit(Integer.parseInt(pagePerCnt));
		
		int LastNum = StartPage + Integer.parseInt(pagePerCnt);
		model.addAttribute("LastNum", LastNum);

		// 전체갯수 구하기
		int ListCnt = baseShopService.get_site_prod_ajax_list_cnt(baseShopVO);
		model.addAttribute("ListCnt", ListCnt);
		
		String prod_age = request.getParameter("prod_age");
		String prod_season = request.getParameter("prod_season");
		String prod_travel_type= request.getParameter("prod_travel_type");
		
		if(prod_age != null && prod_age != "") {
			model.addAttribute("prod_age", prod_age);
			baseShopVO.setprod_age(prod_age);
		}
		if(prod_season != null && prod_season != "") {
			model.addAttribute("prod_season", prod_season);
			baseShopVO.setprod_season(prod_season);
		}
		if(prod_travel_type != null && prod_travel_type != "") {
			model.addAttribute("prod_travel_type", prod_travel_type);
			baseShopVO.setprod_travel_type(prod_travel_type);
		}
		
		HttpSession session = request.getSession(true);
		String user_id = (String) session.getAttribute("user_id");
		if(user_id != null && user_id !="") {
			baseShopVO.setuser_id(user_id);
		}

		model.addAttribute("siteProdList", baseShopService.get_site_prod_ajax_list(baseShopVO));
		
		return "/baseScmtour/AjaxResult/AjaxItemList";
	}

	//=========================================================
	// 상품상세
	//=========================================================
	@RequestMapping(value = "/shop/itemView.do")
	public String ShopitemView(
			@ModelAttribute("BaseShopVO") BaseShopVO baseShopVO, 
			@ModelAttribute("BaseBoardVO") BaseBoardVO baseBoardVO, 
			@ModelAttribute("BaseIndexVO") BaseIndexVO baseIndexVO, 
			@ModelAttribute("BaseMemberVO") BaseMemberVO baseMemberVO, 
			@ModelAttribute("AdmgrConfigVO") AdmgrConfigVO admgrConfigVO, 
			@ModelAttribute("BaseVO") BaseVO baseVO, 
			ModelMap model, 
			HttpServletRequest request, 
			HttpServletResponse response
		) throws Exception {
		
		String store_category = request.getParameter("store_category");
		model.addAttribute("store_category", store_category);

		String prod_category = request.getParameter("prod_category");
		model.addAttribute("prod_category", prod_category);

		String orderby = request.getParameter("orderby");
		if(orderby == null || orderby == "") {
			orderby = "Recom";
		}		
		model.addAttribute("orderby", orderby);
		
		String prod_id = request.getParameter("prod_id");
		model.addAttribute("prod_id", prod_id);
		
		AdmgrConfigVO getConfig = admgrConfigService.get_base_config(null);
		model.addAttribute("SiteBaseConfig",getConfig);
		
		/* 로그작업 시작 */
		HttpSession session = request.getSession(true);
		session.setAttribute("isMobile", "0");
		String user_id = (String) session.getAttribute("user_id");
		String user_ip = BaseService.getRemoteIP(request);
		
		if(user_id != null && user_id !="") {
			baseMemberVO.setuser_id(user_id);
			model.addAttribute("memberInfo", baseMemberService.get_site_user_info(baseMemberVO));
		}
		SimpleDateFormat formatdate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date date = new Date();
		Calendar cal = Calendar.getInstance(); 
		cal.setTime(date);
		// DB에 설정된 분 이전으로 세팅 - 즉, 20분설정시 20분전에 기록이 있는지 체크한다.
		cal.add(Calendar.MINUTE, Integer.parseInt("-"+getConfig.gettime_limit()));
		String ChkTime = formatdate.format(cal.getTime());
		baseVO.settime_now(ChkTime);

		baseVO.setuser_id(user_id);
		baseVO.setuser_ip(user_ip);

		if(prod_id != null && prod_id !="") {
			baseVO.setprod_id(prod_id);
			int is_view_prod = baseService.get_log_prod_view(baseVO);
			if(is_view_prod == 0) {
				baseService.set_prod_view_log(baseVO);
				baseService.set_prod_view_cnt(baseVO);
			}
		}
		/* 로그작업 끝 */
		
		baseShopVO.setprod_id(prod_id);
		BaseShopVO prod_info = baseShopService.get_site_prod_info(baseShopVO);

		System.out.println(prod_info);
		System.out.println(prod_info);
		System.out.println(prod_info);
		System.out.println(prod_info);
		if(prod_info == null) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('존재하지 않는 상품입니다.'); history.back(); </script>");
			out.flush();
			return null;
		} else  {		
			
			/*
			SimpleDateFormat todate = new SimpleDateFormat();
			Calendar caladult = Calendar.getInstance(); 
			todate.applyPattern("yyyyMMdd");
			String today = todate.format(caladult.getTime());
			
			caladult.add(Calendar.YEAR, -19);
			String authday = todate.format(caladult.getTime());
			
			System.out.println("==================");
			System.out.println("today : "+today);
			System.out.println("==================");
			System.out.println("==================");
			System.out.println("authday : "+authday);
			System.out.println("==================");
			*/

			String get_prod_comment = prod_info.getprod_comment();
			model.addAttribute("prod_comment_str", BaseService.nl2br(get_prod_comment));
			
			String get_prod_content_time = prod_info.getprod_content_time();
			model.addAttribute("prod_content_time_str", BaseService.nl2br(get_prod_content_time));
			
			String get_prod_content_pay = prod_info.getprod_content_pay();
			model.addAttribute("prod_content_pay_str", BaseService.nl2br(get_prod_content_pay));
			
			String get_prod_content_precautions = prod_info.getprod_content_precautions();
			model.addAttribute("prod_content_precautions_str", BaseService.nl2br(get_prod_content_precautions));
			
			String get_store_market_returnchange = prod_info.getstore_market_returnchange();
			model.addAttribute("store_market_returnchange_str", BaseService.nl2br(get_store_market_returnchange));
			
			String get_store_market_delivery = prod_info.getstore_market_delivery();
			model.addAttribute("store_market_delivery_str", BaseService.nl2br(get_store_market_delivery));
			
			String get_store_market_order_note= prod_info.getstore_market_order_note();
			model.addAttribute("store_market_order_note_str", BaseService.nl2br(get_store_market_order_note));
			
			String get_prod_trade_info_1 = prod_info.getprod_trade_info_1();
			model.addAttribute("prod_trade_info_1_str", BaseService.nl2br(get_prod_trade_info_1));

			String get_prod_trade_info_2 = prod_info.getprod_trade_info_2();
			model.addAttribute("prod_trade_info_2_str", BaseService.nl2br(get_prod_trade_info_2));
			
			String get_prod_trade_info_3 = prod_info.getprod_trade_info_3();
			model.addAttribute("prod_trade_info_3_str", BaseService.nl2br(get_prod_trade_info_3));
			
			String get_prod_trade_info_4 = prod_info.getprod_trade_info_4();
			model.addAttribute("prod_trade_info_4_str", BaseService.nl2br(get_prod_trade_info_4));
			
			String get_prod_trade_info_5 = prod_info.getprod_trade_info_5();
			model.addAttribute("prod_trade_info_5_str", BaseService.nl2br(get_prod_trade_info_5));
			
			model.addAttribute("prodInfo", prod_info);
			
			String is_prod_fav = "N";
			if(user_id != null && user_id != "" ) {
				//찜한 상품인지 체크
				baseIndexVO.setprod_id(prod_id);
				baseIndexVO.setuser_id(user_id);
				int is_fav = baseIndexService.pick_check(baseIndexVO);
				if(is_fav > 0) {
					is_prod_fav = "Y";
				}
			}
			model.addAttribute("isProdFav", is_prod_fav);
			
			if(store_category.equals("CD002005")) {
				// 리뷰 정보 구하기
				baseBoardVO.setbbs_prod_id(prod_id);
				baseBoardVO.setbbs_id("REVIEW");
				
				BaseBoardVO get_total_cnt = baseBoardService.get_site_review_cnt(baseBoardVO);
				model.addAttribute("reviewCnt", get_total_cnt);
				
				baseBoardVO.setsql_limit(10000);
				model.addAttribute("reviewList", baseBoardService.get_site_bbs_limit_list(baseBoardVO));

				// 총 평점 구하기
				int total_cnt = get_total_cnt.gettotal_cnt();
				int total_star = get_total_cnt.gettotal_star();
				
				double real_star = 0;
				int real_star_int = 0;
				
				if(total_cnt > 0) {
					real_star = Math.round( (total_star/total_cnt)*100)/100.0;
					real_star_int = (int)( total_star/total_cnt);
				}
				model.addAttribute("real_avg", real_star);
				model.addAttribute("int_real_avg", real_star_int);
				

			} else {
				String get_store_id = prod_info.getstore_id();
				baseShopVO.setstore_id(get_store_id);
				BaseShopVO store_info = baseShopService.get_site_store_info(baseShopVO);
				
				String get_store_introduction = store_info.getstore_introduction();
				model.addAttribute("store_introduction_str", BaseService.nl2br(get_store_introduction));
				
				model.addAttribute("storeInfo", store_info);
				
				//상품옵션정보를 가져온다
				model.addAttribute("optionList", baseShopService.get_option_list(baseShopVO));
				
				if(store_category.equals("CD002002")) {
					//방장보 불러오기
					String reserve_st_dt = request.getParameter("reserve_st_dt");
					String reserve_ed_dt = request.getParameter("reserve_ed_dt");
					model.addAttribute("reserve_st_dt", reserve_st_dt);
					model.addAttribute("reserve_ed_dt", reserve_ed_dt);
					baseShopVO.setreserve_st_dt(reserve_st_dt);
					baseShopVO.setreserve_ed_dt(reserve_ed_dt);
					model.addAttribute("roomList", baseShopService.get_prod_room_list(baseShopVO));
				}

			}
			
			return "/baseScmtour/baseShop/itemView";
		}
	
	}

	//=========================================================
	// 상품리뷰
	//=========================================================
	@RequestMapping(value = "/shop/itemReView.do")
	public String ShopitemReView(
			@ModelAttribute("BaseShopVO") BaseShopVO baseShopVO, 
			@ModelAttribute("BaseBoardVO") BaseBoardVO baseBoardVO, 
			@ModelAttribute("BaseIndexVO") BaseIndexVO baseIndexVO, 
			ModelMap model, 
			HttpServletRequest request, 
			HttpServletResponse response
		) throws Exception {
		
		String store_category = request.getParameter("store_category");
		model.addAttribute("store_category", store_category);

		String prod_category = request.getParameter("prod_category");
		model.addAttribute("prod_category", prod_category);
		
		String orderby = request.getParameter("orderby");
		if(orderby == null || orderby == "") {
			orderby = "Recom";
		}		
		model.addAttribute("orderby", orderby);
		
		String prod_id = request.getParameter("prod_id");
		model.addAttribute("prod_id", prod_id);
		
		baseShopVO.setprod_id(prod_id);
		BaseShopVO prod_info = baseShopService.get_site_prod_info(baseShopVO);
		
		if(prod_info == null) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('존재하지 않는 상품입니다.'); history.back(); </script>");
			out.flush();
			return null;
		} else  {		

			HttpSession session = request.getSession(true);
			String user_id = (String) session.getAttribute("user_id");
						
			String get_store_id = prod_info.getstore_id();
			baseShopVO.setstore_id(get_store_id);
			BaseShopVO store_info = baseShopService.get_site_store_info(baseShopVO);
			model.addAttribute("storeInfo", store_info);
			
			//상품옵션정보를 가져온다
			model.addAttribute("optionList", baseShopService.get_option_list(baseShopVO));
			

			model.addAttribute("prodInfo", prod_info);
			
			// 리뷰 정보 구하기
			baseBoardVO.setbbs_prod_id(prod_id);
			baseBoardVO.setbbs_id("REVIEW");
			
			BaseBoardVO get_total_cnt = baseBoardService.get_site_review_cnt(baseBoardVO);
			model.addAttribute("reviewCnt", get_total_cnt);
			// 총 평점 구하기
			int total_cnt = get_total_cnt.gettotal_cnt();
			int total_star = get_total_cnt.gettotal_star();
			
			double real_star = 0;
			int real_star_int = 0;
			
			if(total_cnt > 0) {
				real_star = Math.round( (total_star/total_cnt)*100)/100.0;
				real_star_int = (int)( total_star/total_cnt);
			}
			model.addAttribute("real_avg", real_star);
			model.addAttribute("int_real_avg", real_star_int);

			// 리뷰목록 구하기
			/** pageing start */
			baseBoardVO.setPageUnit(10);
			baseBoardVO.setPageSize(300); 
			PaginationInfo paginationInfo = new PaginationInfo();
			paginationInfo.setCurrentPageNo(baseBoardVO.getPageIndex());
			paginationInfo.setRecordCountPerPage(baseBoardVO.getPageUnit());
			paginationInfo.setPageSize(baseBoardVO.getPageSize());

			baseBoardVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
			baseBoardVO.setLastIndex(paginationInfo.getLastRecordIndex());
			baseShopVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

			// 전체갯수 구하기
			int ListCnt = baseBoardService.get_site_bbs_list_cnt(baseBoardVO);
			paginationInfo.setTotalRecordCount(ListCnt);
			model.addAttribute("TotalCnt", ListCnt);
			model.addAttribute("paginationInfo", paginationInfo);

			// 해당페이지 시작번호를 구한다.
			int StartPageNumber = ListCnt - (baseShopVO.getPageUnit() * (baseShopVO.getPageIndex()-1)) + 1;
			model.addAttribute("StartPageNumber", StartPageNumber);
			/** paging end **/
			
			baseBoardVO.setsql_limit(10000);
			model.addAttribute("reviewList", baseBoardService.get_site_bbs_limit_list(baseBoardVO));
			
			model.addAttribute("prodInfo", prod_info);
			
			String is_prod_fav = "N";
			if(user_id != null && user_id != "" ) {
				//찜한 상품인지 체크
				baseIndexVO.setprod_id(prod_id);
				baseIndexVO.setuser_id(user_id);
				int is_fav = baseIndexService.pick_check(baseIndexVO);
				if(is_fav > 0) {
					is_prod_fav = "Y";
				}
			}
			model.addAttribute("isProdFav", is_prod_fav);
			
			return "/baseScmtour/baseShop/itemReView";
		}
	}

	//=========================================================
	// 상품 QnA
	//=========================================================
	@RequestMapping(value = "/shop/itemQna.do")
	public String ShopitemQna(
			@ModelAttribute("BaseShopVO") BaseShopVO baseShopVO, 
			@ModelAttribute("BaseBoardVO") BaseBoardVO baseBoardVO, 
			@ModelAttribute("BaseIndexVO") BaseIndexVO baseIndexVO, 
			ModelMap model, 
			HttpServletRequest request, 
			HttpServletResponse response
		) throws Exception {
		
		HttpSession session = request.getSession(true);
		String user_id = (String) session.getAttribute("user_id");
		
		String store_category = request.getParameter("store_category");
		model.addAttribute("store_category", store_category);

		String prod_category = request.getParameter("prod_category");
		model.addAttribute("prod_category", prod_category);
		
		String orderby = request.getParameter("orderby");
		if(orderby == null || orderby == "") {
			orderby = "Recom";
		}		
		model.addAttribute("orderby", orderby);
		
		String prod_id = request.getParameter("prod_id");
		model.addAttribute("prod_id", prod_id);
		
		baseShopVO.setprod_id(prod_id);
		BaseShopVO prod_info = baseShopService.get_site_prod_info(baseShopVO);
		
		if(prod_info == null) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('존재하지 않는 상품입니다.'); history.back(); </script>");
			out.flush();
			return null;
		} else  {		
			String get_store_id = prod_info.getstore_id();
			baseShopVO.setstore_id(get_store_id);
			BaseShopVO store_info = baseShopService.get_site_store_info(baseShopVO);
			model.addAttribute("storeInfo", store_info);
			
			//상품옵션정보를 가져온다
			model.addAttribute("optionList", baseShopService.get_option_list(baseShopVO));
			

			model.addAttribute("prodInfo", prod_info);
			
			// 리뷰목록 구하기
			// 리뷰 정보 구하기
			baseBoardVO.setbbs_prod_id(prod_id);
			baseBoardVO.setbbs_id("QNA");
			
			/** pageing start */
			baseBoardVO.setPageUnit(10);
			baseBoardVO.setPageSize(300); 
			PaginationInfo paginationInfo = new PaginationInfo();
			paginationInfo.setCurrentPageNo(baseBoardVO.getPageIndex());
			paginationInfo.setRecordCountPerPage(baseBoardVO.getPageUnit());
			paginationInfo.setPageSize(baseBoardVO.getPageSize());

			baseBoardVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
			baseBoardVO.setLastIndex(paginationInfo.getLastRecordIndex());
			baseShopVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

			// 전체갯수 구하기
			int ListCnt = baseBoardService.get_site_bbs_list_cnt(baseBoardVO);
			paginationInfo.setTotalRecordCount(ListCnt);
			model.addAttribute("TotalCnt", ListCnt);
			model.addAttribute("paginationInfo", paginationInfo);

			// 해당페이지 시작번호를 구한다.
			int StartPageNumber = ListCnt - (baseShopVO.getPageUnit() * (baseShopVO.getPageIndex()-1)) + 1;
			model.addAttribute("StartPageNumber", StartPageNumber);
			/** paging end **/
			
			model.addAttribute("qnaList", baseBoardService.get_site_bbs_list(baseBoardVO));
			
			model.addAttribute("prodInfo", prod_info);
			
			String is_prod_fav = "N";
			if(user_id != null && user_id != "" ) {
				//찜한 상품인지 체크
				baseIndexVO.setprod_id(prod_id);
				baseIndexVO.setuser_id(user_id);
				int is_fav = baseIndexService.pick_check(baseIndexVO);
				if(is_fav > 0) {
					is_prod_fav = "Y";
				}
			}
			model.addAttribute("isProdFav", is_prod_fav);
			
			return "/baseScmtour/baseShop/itemQna";
		}
	}

	//=========================================================
	// 상품정보
	//=========================================================
	@RequestMapping(value = "/shop/itemInfo.do")
	public String ShopitemInfo(
			@ModelAttribute("BaseShopVO") BaseShopVO baseShopVO, 
			@ModelAttribute("BaseIndexVO") BaseIndexVO baseIndexVO, 
			ModelMap model, 
			HttpServletRequest request, 
			HttpServletResponse response
		) throws Exception {
		
		HttpSession session = request.getSession(true);
		String user_id = (String) session.getAttribute("user_id");
		
		String store_category = request.getParameter("store_category");
		model.addAttribute("store_category", store_category);

		String prod_category = request.getParameter("prod_category");
		model.addAttribute("prod_category", prod_category);
		
		String orderby = request.getParameter("orderby");
		if(orderby == null || orderby == "") {
			orderby = "Recom";
		}		
		model.addAttribute("orderby", orderby);
		
		String prod_id = request.getParameter("prod_id");
		model.addAttribute("prod_id", prod_id);
		
		baseShopVO.setprod_id(prod_id);
		BaseShopVO prod_info = baseShopService.get_site_prod_info(baseShopVO);
		
		if(prod_info == null) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('존재하지 않는 상품입니다.'); history.back(); </script>");
			out.flush();
			return null;
		} else  {		

			String get_prod_comment = prod_info.getprod_comment();
			model.addAttribute("prod_comment_str", BaseService.nl2br(get_prod_comment));
			
			String get_prod_content_time = prod_info.getprod_content_time();
			model.addAttribute("prod_content_time_str", BaseService.nl2br(get_prod_content_time));
			
			String get_prod_content_pay = prod_info.getprod_content_pay();
			model.addAttribute("prod_content_pay_str", BaseService.nl2br(get_prod_content_pay));
			
			String get_prod_content_precautions = prod_info.getprod_content_precautions();
			model.addAttribute("prod_content_precautions_str", BaseService.nl2br(get_prod_content_precautions));
			
			String get_prod_trade_info_1 = prod_info.getprod_trade_info_1();
			model.addAttribute("prod_trade_info_1_str", BaseService.nl2br(get_prod_trade_info_1));

			String get_prod_trade_info_2 = prod_info.getprod_trade_info_2();
			model.addAttribute("prod_trade_info_2_str", BaseService.nl2br(get_prod_trade_info_2));
			
			String get_prod_trade_info_3 = prod_info.getprod_trade_info_3();
			model.addAttribute("prod_trade_info_3_str", BaseService.nl2br(get_prod_trade_info_3));
			
			String get_prod_trade_info_4 = prod_info.getprod_trade_info_4();
			model.addAttribute("prod_trade_info_4_str", BaseService.nl2br(get_prod_trade_info_4));
			
			String get_prod_trade_info_5 = prod_info.getprod_trade_info_5();
			model.addAttribute("prod_trade_info_5_str", BaseService.nl2br(get_prod_trade_info_5));

			String get_store_id = prod_info.getstore_id();
			baseShopVO.setstore_id(get_store_id);
			BaseShopVO store_info = baseShopService.get_site_store_info(baseShopVO);
			model.addAttribute("storeInfo", store_info);
			
			//상품옵션정보를 가져온다
			model.addAttribute("optionList", baseShopService.get_option_list(baseShopVO));
			
			
			model.addAttribute("prodInfo", prod_info);
			
			String is_prod_fav = "N";
			if(user_id != null && user_id != "" ) {
				//찜한 상품인지 체크
				baseIndexVO.setprod_id(prod_id);
				baseIndexVO.setuser_id(user_id);
				int is_fav = baseIndexService.pick_check(baseIndexVO);
				if(is_fav > 0) {
					is_prod_fav = "Y";
				}
			}
			model.addAttribute("isProdFav", is_prod_fav);
			
			//if(store_category.equals("CD002004")) {
				baseShopVO.setsql_limit(1000);
				model.addAttribute("prod_store_list", baseShopService.get_site_prod_list(baseShopVO));
			//}
			
			return "/baseScmtour/baseShop/itemInfo";
		}
	}

	//=========================================================
	// 더보기 모어페이지
	//=========================================================
	@RequestMapping(value = "/shop/more.do")
	public String ShopMore(
		@ModelAttribute("BaseShopVO") BaseShopVO baseShopVO, 
		@ModelAttribute("BaseBoardVO") BaseBoardVO baseBoardVO, 
		@ModelAttribute("BaseMemberVO") BaseMemberVO baseMemberVO, 
		ModelMap model, 
		HttpServletRequest request, 
		HttpServletResponse response
		) throws Exception {

		HttpSession session = request.getSession(true);
		String user_id = (String) session.getAttribute("user_id");		
		
		// 회원정보를 구해오기
		if(user_id != null && user_id !="") {
			baseMemberVO.setuser_id(user_id);
			model.addAttribute("memberInfo", baseMemberService.get_site_user_info(baseMemberVO));
		
			baseShopVO.setuser_id(user_id);
			baseShopVO.setsql_limit(15);

			//내 관광상품 구매내역
			model.addAttribute("myshowList", baseShopService.get_site_my_order_no_market_detail_list(baseShopVO));
			
			//내 틀산품 구매내역
			model.addAttribute("mymarketList", baseShopService.get_site_my_order_market_detail_list(baseShopVO));
		}
		
		//배너 모어
		baseBoardVO.setsql_limit(1);
		baseBoardVO.setbanner_zone_3("Y");
		model.addAttribute("banner3List", baseBoardService.get_banner(baseBoardVO));
		
		//공지사항 3개 불러오기
		String bbs_id = "NOTICE";
		baseBoardVO.setbbs_id(bbs_id);
		baseBoardVO.setsql_limit(3);
		model.addAttribute("noticeList", baseBoardService.get_site_bbs_limit_list(baseBoardVO));
		
		return "/baseScmtour/baseShop/more";
	}

	//=========================================================
	// 프로모션 목록
	//=========================================================
	@RequestMapping(value = "/shop/promotionList.do")
	public String ShopPromotionList(
		@ModelAttribute("BaseShopVO") BaseShopVO baseShopVO, 
		@ModelAttribute("BaseBoardVO") BaseBoardVO baseBoardVO, 
		ModelMap model, 
		HttpServletRequest request, 
		HttpServletResponse response
		) throws Exception {
		
		String pageIndex = request.getParameter("pageIndex");
		if(pageIndex == null || pageIndex =="") {
			pageIndex = "1";
		}
		model.addAttribute("pageIndex", pageIndex);
		
		String searchKeyword = request.getParameter("searchKeyword");
		model.addAttribute("searchKeyword", searchKeyword);
		
		String bbs_use = request.getParameter("bbs_use");
		if(bbs_use == null || bbs_use == "") {
			bbs_use = "Y";
		}
		model.addAttribute("bbs_use", bbs_use);
		
		/** pageing start */
		baseBoardVO.setPageUnit(10);
		baseBoardVO.setPageSize(10); 
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(baseBoardVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(baseBoardVO.getPageUnit());
		paginationInfo.setPageSize(baseBoardVO.getPageSize());

		baseBoardVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		baseBoardVO.setLastIndex(paginationInfo.getLastRecordIndex());
		baseBoardVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

		// 전체갯수 구하기
		baseBoardVO.setbbs_id("EVENT");
		baseBoardVO.setbbs_use(bbs_use);
		baseBoardVO.setbbs_use_date("Y");
		baseBoardVO.setsearchKeyword(searchKeyword);
		int ListCnt = baseBoardService.get_site_bbs_list_cnt(baseBoardVO);
		paginationInfo.setTotalRecordCount(ListCnt);
		model.addAttribute("TotalCnt", ListCnt);
		model.addAttribute("paginationInfo", paginationInfo);

		// 해당페이지 시작번호를 구한다.
		int StartPageNumber = ListCnt - (baseBoardVO.getPageUnit() * (baseBoardVO.getPageIndex()-1)) + 1;
		model.addAttribute("StartPageNumber", StartPageNumber);
		/** paging end **/
		
		model.addAttribute("promotionList", baseBoardService.get_site_bbs_list(baseBoardVO));
		
		return "/baseScmtour/baseShop/promotionList";
	}

	//=========================================================
	// 프로모션 상세
	//=========================================================
	@RequestMapping(value = "/shop/promotionView.do")
	public String ShopPromotionView(
		@ModelAttribute("BaseShopVO") BaseShopVO baseShopVO, 
		@ModelAttribute("BaseBoardVO") BaseBoardVO baseBoardVO, 
		ModelMap model, 
		HttpServletRequest request, 
		HttpServletResponse response
		) throws Exception {
		
		String pageIndex = request.getParameter("pageIndex");
		if(pageIndex == null || pageIndex =="") {
			pageIndex = "1";
		}
		String bbs_use = request.getParameter("bbs_use");
		String bbs_seq = request.getParameter("bbs_seq");
		String searchKey = request.getParameter("searchKey");
		model.addAttribute("pageIndex", pageIndex);
		model.addAttribute("bbs_use", bbs_use);
		model.addAttribute("searchKey", searchKey);
		
		baseBoardVO.setbbs_id("EVENT");
		baseBoardVO.setbbs_seq(bbs_seq);
		baseBoardVO.setbbs_use(bbs_use);
		baseBoardVO.setbbs_use_date("Y");
		BaseBoardVO bbs_info = baseBoardService.get_site_bbs_info(baseBoardVO);
		if(bbs_info == null) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('데이터가 존재하지 않습니다.'); history.back(); </script>");
			out.flush();
			return null;
		} else {

			HttpSession session = request.getSession(true);
			String user_id = (String) session.getAttribute("user_id");

			String get_cp_id_1 = bbs_info.getbbs_cp1();
			String get_cp_id_2 = bbs_info.getbbs_cp2();
			String get_cp_id_3 = bbs_info.getbbs_cp3();
			String get_cp_id_4 = bbs_info.getbbs_cp4();
			String get_cp_id_5 = bbs_info.getbbs_cp5();
			String get_cp_id_6 = bbs_info.getbbs_cp6();
			String get_cp_id_7 = bbs_info.getbbs_cp7();
			String get_cp_id_8 = bbs_info.getbbs_cp8();
			String get_cp_id_9 = bbs_info.getbbs_cp9();
			String get_cp_id_10 = bbs_info.getbbs_cp10();
			
			baseShopVO.setuser_id(user_id);
			if(get_cp_id_1 !=null && get_cp_id_1 != "") {
				baseShopVO.setcoupon_id(get_cp_id_1);
				model.addAttribute("cp_1", baseShopService.get_cp_info(baseShopVO));
			}
			if(get_cp_id_2 !=null && get_cp_id_2 != "") {
				baseShopVO.setcoupon_id(get_cp_id_2);
				model.addAttribute("cp_2", baseShopService.get_cp_info(baseShopVO));
			}
			if(get_cp_id_3 !=null && get_cp_id_3 != "") {
				baseShopVO.setcoupon_id(get_cp_id_3);
				model.addAttribute("cp_3", baseShopService.get_cp_info(baseShopVO));
			}
			if(get_cp_id_4 !=null && get_cp_id_4 != "") {
				baseShopVO.setcoupon_id(get_cp_id_4);
				model.addAttribute("cp_4", baseShopService.get_cp_info(baseShopVO));
			}
			if(get_cp_id_5 !=null && get_cp_id_5 != "") {
				baseShopVO.setcoupon_id(get_cp_id_5);
				model.addAttribute("cp_5", baseShopService.get_cp_info(baseShopVO));
			}
			if(get_cp_id_6 !=null && get_cp_id_6 != "") {
				baseShopVO.setcoupon_id(get_cp_id_6);
				model.addAttribute("cp_6", baseShopService.get_cp_info(baseShopVO));
			}
			if(get_cp_id_7 !=null && get_cp_id_7 != "") {
				baseShopVO.setcoupon_id(get_cp_id_7);
				model.addAttribute("cp_7", baseShopService.get_cp_info(baseShopVO));
			}
			if(get_cp_id_8 !=null && get_cp_id_8 != "") {
				baseShopVO.setcoupon_id(get_cp_id_8);
				model.addAttribute("cp_8", baseShopService.get_cp_info(baseShopVO));
			}
			if(get_cp_id_9 !=null && get_cp_id_9 != "") {
				baseShopVO.setcoupon_id(get_cp_id_9);
				model.addAttribute("cp_9", baseShopService.get_cp_info(baseShopVO));
			}
			if(get_cp_id_10 !=null && get_cp_id_10 != "") {
				baseShopVO.setcoupon_id(get_cp_id_10);
				model.addAttribute("cp_10", baseShopService.get_cp_info(baseShopVO));
			}
			
			//이전글 구하기
			//다음글 구하기
			
			model.addAttribute("promotionInfo", bbs_info);
			return "/baseScmtour/baseShop/promotionView";
		}

	}

	//=========================================================
	// 관솽/맛집/숙박 구매내역
	//=========================================================
	@RequestMapping(value = "/mypage/orderReserveList.do")
	public String orderReserveList(
		@ModelAttribute("BaseShopVO") BaseShopVO baseShopVO, 
		ModelMap model, 
		HttpServletRequest request, 
		HttpServletResponse response
		) throws Exception {
		
		HttpSession session = request.getSession(true);
		String user_id = (String) session.getAttribute("user_id");
		
		baseShopVO.setuser_id(user_id);
		
		baseShopVO.setstore_category("CD002001");
		model.addAttribute("orderDetailList1", baseShopService.get_site_order_reserve_list(baseShopVO));
		
		baseShopVO.setstore_category("CD002002");
		model.addAttribute("orderDetailList2", baseShopService.get_site_order_reserve_list(baseShopVO));
		
		baseShopVO.setstore_category("CD002003");
		model.addAttribute("orderDetailList3", baseShopService.get_site_order_reserve_list(baseShopVO));
		
		
		return "/baseScmtour/baseOrder/orderReserveList";

	}
	
	//=========================================================
	// 서천장터 구매내역
	//=========================================================
	@RequestMapping(value = "/mypage/orderMarketList.do")
	public String orderMarketList(
		@ModelAttribute("BaseShopVO") BaseShopVO baseShopVO, 
		ModelMap model, 
		HttpServletRequest request, 
		HttpServletResponse response
		) throws Exception {
		
		HttpSession session = request.getSession(true);
		String user_id = (String) session.getAttribute("user_id");
		
		baseShopVO.setuser_id(user_id);
		baseShopVO.setstore_category("CD002004");
		List<BaseShopVO> order_master_list = baseShopService.get_site_order_list(baseShopVO);
		for(int i=0; i<order_master_list.size(); i++) {
			String od_order_id = order_master_list.get(i).getorder_id();
			baseShopVO.setod_order_id(od_order_id);
			model.addAttribute("orderDetailList_"+od_order_id, baseShopService.get_site_order_detail_list(baseShopVO));
		}
		
		model.addAttribute("orderList", order_master_list);
		
		return "/baseScmtour/baseOrder/orderMarketList";
		
	}
	
	//=========================================================
	// 통합 구매내역
	//=========================================================
	@RequestMapping(value = "/mypage/orderList.do")
	public String ordernewList(
		@ModelAttribute("BaseShopVO") BaseShopVO baseShopVO, 
		@ModelAttribute("AdmgrConfigVO") AdmgrConfigVO admgrConfigVO, 
		@ModelAttribute("BaseVO") BaseVO baseVO, 
		ModelMap model, 
		HttpServletRequest request, 
		HttpServletResponse response
		) throws Exception {
		
		HttpSession session = request.getSession(true);
		String user_id = (String) session.getAttribute("user_id");
		
		AdmgrConfigVO getConfig = admgrConfigService.get_base_config(null);
		model.addAttribute("SiteBaseConfig",getConfig);
		String bank_cd = getConfig.getpay_bank_nm();
		baseVO.setbase_cd(bank_cd);
		model.addAttribute("bank_name", baseService.get_base_cd_info(baseVO));
		
		/** pageing start */
		baseShopVO.setPageUnit(10);
		baseShopVO.setPageSize(10); 
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(baseShopVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(baseShopVO.getPageUnit());
		paginationInfo.setPageSize(baseShopVO.getPageSize());

		baseShopVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		baseShopVO.setLastIndex(paginationInfo.getLastRecordIndex());
		baseShopVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

		baseShopVO.setuser_id(user_id);
		// 전체갯수 구하기
		int ListCnt = baseShopService.get_site_order_all_list_cnt(baseShopVO);
		paginationInfo.setTotalRecordCount(ListCnt);
		model.addAttribute("TotalCnt", ListCnt);
		model.addAttribute("paginationInfo", paginationInfo);

		// 해당페이지 시작번호를 구한다.
		int StartPageNumber = ListCnt - (baseShopVO.getPageUnit() * (baseShopVO.getPageIndex()-1)) + 1;
		model.addAttribute("StartPageNumber", StartPageNumber);
		/** paging end **/
		
		List<BaseShopVO> order_master_list = baseShopService.get_site_order_all_list(baseShopVO);
		model.addAttribute("orderMasterList",order_master_list);
		for(int i=0; i<order_master_list.size(); i++) {
			String od_order_id = order_master_list.get(i).getorder_id();
			baseShopVO.setod_order_id(od_order_id);
			model.addAttribute("orderDetailList_"+od_order_id, baseShopService.get_site_order_detail_all_list(baseShopVO));
		}
		
		return "/baseScmtour/baseOrder/orderList";

	}
	
	//=========================================================
	// 통합 구매 상세내역
	//=========================================================
	@RequestMapping(value = "/mypage/orderDetail.do")
	public String ordernewDetail(
		@ModelAttribute("BaseShopVO") BaseShopVO baseShopVO, 
		ModelMap model, 
		HttpServletRequest request, 
		HttpServletResponse response
		) throws Exception {
		
		HttpSession session = request.getSession(true);
		String user_id = (String) session.getAttribute("user_id");
		String order_id = request.getParameter("order_id");
		String pageIndex = request.getParameter("pageIndex");
		if(pageIndex == null || pageIndex == "") {
			pageIndex = "1";
		}
		model.addAttribute("order_id", order_id);
		model.addAttribute("pageIndex", pageIndex);
		
		baseShopVO.setuser_id(user_id);
		baseShopVO.setorder_id(order_id);
		baseShopVO.setod_order_id(order_id);
		model.addAttribute("orderMasterInfo", baseShopService.get_site_order_master_info(baseShopVO));
		model.addAttribute("orderDetailList", baseShopService.get_site_order_detail_all_list(baseShopVO));
		
		return "/baseScmtour/baseOrder/orderDetail";
		
	}
	
	//=========================================================
	// 룸 상세
	//=========================================================
	@RequestMapping(value = "/Ajax/roomDetail.do")
	public String roomDeail(
		@ModelAttribute("BaseShopVO") BaseShopVO baseShopVO, 
		ModelMap model, 
		HttpServletRequest request, 
		HttpServletResponse response
		) throws Exception {

		String room_seq = request.getParameter("room_seq");
		String store_id = request.getParameter("store_id");
		if(room_seq != null && room_seq !="") {
			baseShopVO.setprod_room_seq(room_seq);
			BaseShopVO room_detail = baseShopService.get_site_room_info(baseShopVO);
			model.addAttribute("roomDetail", room_detail);
			model.addAttribute("prod_room_content_1_str", BaseService.nl2br(room_detail.getprod_room_content_1()));
			model.addAttribute("prod_room_content_2_str", BaseService.nl2br(room_detail.getprod_room_content_2()));
			baseShopVO.setstore_id(store_id);
			BaseShopVO store_info = baseShopService.get_site_store_info(baseShopVO);
			model.addAttribute("storeInfo", store_info);
		}
		
		return "/baseScmtour/AjaxResult/AjaxRoomDetail";
	}


	//=========================================================
	// 룸 상세
	//=========================================================
	@RequestMapping(value = "/Ajax/favList.do")
	public String favList(
		@ModelAttribute("BaseShopVO") BaseShopVO baseShopVO, 
		ModelMap model, 
		HttpServletRequest request, 
		HttpServletResponse response
		) throws Exception {
		
		String store_category_type = request.getParameter("store_category");
		model.addAttribute("store_category_type", store_category_type);
		
		HttpSession session = request.getSession(true);
		String user_id = (String) session.getAttribute("user_id");
		String pageNum = request.getParameter("pageNum");
		String pagePerCnt = request.getParameter("pagePerCnt");
		
		int StartPage = Integer.parseInt(pageNum) * Integer.parseInt(pagePerCnt); 
		baseShopVO.setsql_start(StartPage);
		baseShopVO.setsql_limit(Integer.parseInt(pagePerCnt));
		
		int LastNum = StartPage + Integer.parseInt(pagePerCnt);
		model.addAttribute("LastNum", LastNum);
		
		// 전체갯수 구하기
		if(user_id != null || user_id != "") {
			baseShopVO.setuser_id(user_id);

			if(store_category_type.equals("zone")) {
				int ListCnt = baseShopService.get_fav_zone_list_cnt(baseShopVO);
				model.addAttribute("ListCnt", ListCnt);
				model.addAttribute("favList", baseShopService.get_fav_zone_list(baseShopVO));
			} else {
				int ListCnt = baseShopService.get_fav_market_list_cnt(baseShopVO);
				model.addAttribute("ListCnt", ListCnt);
				model.addAttribute("favList", baseShopService.get_fav_market_list(baseShopVO));
			}
			
		}
		
		return "/baseScmtour/AjaxResult/ajaxFavList";

	}
	
	
	//===============================================================================================================
	// * 쿠폰 다운로드
	//===============================================================================================================
	@RequestMapping(value = "/Ajax/couponIssue.do")
	public String MembercouponIssue(
		@ModelAttribute("BaseShopVO") BaseShopVO baseShopVO, 
		ModelMap model, 
		HttpServletRequest request, 
		HttpServletResponse response
		) throws Exception {
		
		HttpSession session = request.getSession(true);
		String user_id = (String) session.getAttribute("user_id");
		if(user_id == null || user_id == "") {
			model.addAttribute("res", "AN");
		} else {
			//이미 보유했는지 체크한다.
			String coupon_id = request.getParameter("coupon_id");
			baseShopVO.setcoupon_id(coupon_id);
			baseShopVO.setuser_id(user_id);
			int isHasCP = baseShopService.get_has_coupon(baseShopVO);
			
			if(isHasCP > 0) {
				model.addAttribute("res", "A");
			} else {
				//쿠폰내역이 없으니 다운로드한다.
				baseShopService.issue_coupon(baseShopVO);
				model.addAttribute("res", "Y");
			}
			
		}
		return "/baseScmtour/AjaxResult/AjaxCoupon";
	}
	

	//===============================================================================================================
	// * 장바구니에 저장
	//===============================================================================================================
	@RequestMapping(value = "/Ajax/cartSave.do")
	public String cartSave(
		@ModelAttribute("BaseShopVO") BaseShopVO baseShopVO, 
		ModelMap model, 
		HttpServletRequest request, 
		HttpServletResponse response
		) throws Exception {
		
		HttpSession session = request.getSession(true);
		String user_id = (String) session.getAttribute("user_id");
		String sess_id = (String) session.getId();
		
		if(user_id == null || user_id == "") {
			model.addAttribute("res", "AN");
		} else {
			//이미 보유했는지 체크한다.
			String store_category = request.getParameter("store_category");
			String store_id = request.getParameter("store_id");
			String store_nm = request.getParameter("store_nm");
			String prod_category = request.getParameter("prod_category");
			String prod_id = request.getParameter("prod_id");
			String prod_nm = request.getParameter("prod_nm");
			String prod_price = request.getParameter("prod_price");
			String prod_price_percent = request.getParameter("prod_price_percent");
			String prod_opt_seqs = request.getParameter("prod_opt_seqs"); 
			String prod_opt_nms = request.getParameter("prod_opt_nms"); 
			String prod_opt_prices = request.getParameter("prod_opt_prices"); 
			String prod_opt_cnts = request.getParameter("prod_opt_cnts"); 
			String total_price = request.getParameter("total_price"); 
			String prod_room_seq = request.getParameter("prod_room_seq");
			String reserve_st_dt = request.getParameter("reserve_st_dt");
			String reserve_ed_dt = request.getParameter("reserve_ed_dt");
			String reserve_time = request.getParameter("reserve_time");
			String reserve_user_nm = request.getParameter("reserve_user_nm");
			String reserve_user_call = request.getParameter("reserve_user_call");
			System.out.println("11111111113111111111111111");
			baseShopVO.setsess_id(sess_id);
			baseShopVO.setuser_id(user_id);
			baseShopVO.setstore_category(store_category);
			baseShopVO.setstore_id(store_id);
			baseShopVO.setstore_nm(store_nm);
			baseShopVO.setprod_category(prod_category);
			baseShopVO.setprod_id(prod_id);
			baseShopVO.setprod_nm(prod_nm);
			baseShopVO.setprod_price(prod_price);
			baseShopVO.setprod_price_percent(prod_price_percent);
			baseShopVO.setopt_seqs(prod_opt_seqs);
			baseShopVO.setopt_nms(prod_opt_nms);
			baseShopVO.setopt_prices(prod_opt_prices);
			baseShopVO.setopt_cnts(prod_opt_cnts);
			baseShopVO.setprod_room_seq(prod_room_seq);
			baseShopVO.setreserve_st_dt(reserve_st_dt);
			baseShopVO.setreserve_ed_dt(reserve_ed_dt);
			baseShopVO.setreserve_time(reserve_time);
			baseShopVO.setreserve_user_nm(reserve_user_nm);
			baseShopVO.setreserve_user_call(reserve_user_call);
			baseShopVO.settotal_price(total_price);
			System.out.println("222222222222222222222222222");
			int cart_save = baseShopService.cart_save(baseShopVO);
			System.out.println(cart_save);
			if(cart_save > 0) {
				model.addAttribute("res", "Y");
			} else {
				model.addAttribute("res", "F");				
			}
			
		}
		return "/baseScmtour/AjaxResult/AjaxCartSave";
	}
	
	//===============================================================================================================
	// * 장바구니
	//===============================================================================================================
	@RequestMapping(value = "/shop/cart.do")
	public String cart(
		@ModelAttribute("BaseShopVO") BaseShopVO baseShopVO, 
		ModelMap model, 
		HttpServletRequest request, 
		HttpServletResponse response
		) throws Exception {
		
		HttpSession session = request.getSession(true);
		String user_id = (String) session.getAttribute("user_id");
		String sess_id = (String) session.getId();
		
		if(user_id != null && user_id != "") {
			
			//장바구니 정보
			baseShopVO.setuser_id(user_id);
			model.addAttribute("cartcnt", baseShopService.get_cart_cnt(baseShopVO));
			
			baseShopVO.setstore_category("CD002001");
			model.addAttribute("cartList1", baseShopService.get_cart_list(baseShopVO));
			baseShopVO.setstore_category("CD002002");
			model.addAttribute("cartList2", baseShopService.get_cart_list(baseShopVO));
			baseShopVO.setstore_category("CD002003");
			model.addAttribute("cartList3", baseShopService.get_cart_list(baseShopVO));
			baseShopVO.setstore_category("CD002004");
			model.addAttribute("cartList4", baseShopService.get_cart_list(baseShopVO));
			
			//장바구니의 장터상품 상점별 합 및 상점별 배송비정책 가져오기
			model.addAttribute("cartStore4", baseShopService.get_cart4_store_list(baseShopVO));
			
			//쿠폰정보
			model.addAttribute("couponList", baseShopService.get_member_coupon_list(baseShopVO));
			
			//회원주소록 정보를 호출한다.
			model.addAttribute("addrList", baseShopService.get_cart_addr_list(baseShopVO));
			
		}

		return "/baseScmtour/baseShop/cart";
	}

	//===============================================================================================================
	// * 장바구니삭제 - 카테고리 전체
	//===============================================================================================================
	@RequestMapping(value = "/Ajax/cartCateDel.do")
	public void cartCateDel(
			@ModelAttribute("BaseShopVO") BaseShopVO baseShopVO, 
			ModelMap model, 
			HttpServletRequest request, 
			HttpServletResponse response
			) throws Exception {
		
		HttpSession session = request.getSession(true);
		String user_id = (String) session.getAttribute("user_id");
		String sess_id = (String) session.getId();
		
		if(user_id == null || user_id == "") {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("AN");
			out.flush();
			return;
		} else {
			String store_category = request.getParameter("store_category");
			baseShopVO.setuser_id(user_id);
			baseShopVO.setstore_category(store_category);
			baseShopService.del_cart_category(baseShopVO);
			
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("Y");
			out.flush();
			return;
			
		}
	}
	
	//===============================================================================================================
	// * 장바구니삭제 - 개별 아이템
	//===============================================================================================================
	@RequestMapping(value = "/Ajax/cartItemDel.do")
	public void cartItemDel(
			@ModelAttribute("BaseShopVO") BaseShopVO baseShopVO, 
			ModelMap model, 
			HttpServletRequest request, 
			HttpServletResponse response
			) throws Exception {
		
		HttpSession session = request.getSession(true);
		String user_id = (String) session.getAttribute("user_id");
		String sess_id = (String) session.getId();
		
		if(user_id == null || user_id == "") {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("AN");
			out.flush();
			return;
		} else {
			baseShopVO.setuser_id(user_id);
			String del_seqs = request.getParameter("del_item");
			String[] del_seq_arr = del_seqs.split(",");
			for(int i=0; i<del_seq_arr.length; i++) {
				baseShopVO.setcart_seq(del_seq_arr[i]);
				baseShopService.del_cart_item(baseShopVO);
			}
			
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("Y");
			out.flush();
			return;
			
		}
	}
	
	//===============================================================================================================
	// * 장바구니삭제 - 개별 아이템
	//===============================================================================================================
	@RequestMapping(value = "/shop/orderSave.do")
	public void orderSave(
		@ModelAttribute("BaseShopVO") BaseShopVO baseShopVO, 
		@ModelAttribute("BaseVO") BaseVO baseVO, 
		ModelMap model, 
		HttpServletRequest request, 
		HttpServletResponse response
		) throws Exception {
		
		HttpSession session = request.getSession(true);
		String user_id = (String) session.getAttribute("user_id");
		String user_nm = (String) session.getAttribute("user_nm");
		String user_hp = (String) session.getAttribute("user_hp");
		String user_email = (String) session.getAttribute("user_email");
		String sess_id = (String) session.getId();
		String isMobile = (String) session.getAttribute("isMobile");
		
		if(user_id == null || user_id == "") {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('로그인 권한이 필요합니다.'); location.href='/member/joinLogin.do?return_url="+URLEncoder.encode("/shop/cart.do", "UTF-8")+"'; </script>");
			out.flush();
			return;
		} else {

			String order_id = request.getParameter("order_id");
			String forder_total_price = request.getParameter("forder_total_price");
			String forder_paytype = request.getParameter("forder_paytype");
			String db_pay_type = "";
			String db_order_st = "";
			String forder_cart_seq = request.getParameter("forder_cart_seq");
			String forder_user_name = request.getParameter("forder_user_name");
			String forder_user_hp = request.getParameter("forder_user_hp");
			String forder_user_email = request.getParameter("forder_user_email");
			String forder_user_call = request.getParameter("forder_user_call");
			String forder_user_zip = request.getParameter("forder_user_zip");
			String forder_user_addr1 = request.getParameter("forder_user_addr1");
			String forder_user_addr2 = request.getParameter("forder_user_addr2");
			String forder_user_message = request.getParameter("forder_user_message");
			String order_pay_cd = request.getParameter("order_pay_cd");
			String forder_coupon_id = request.getParameter("forder_coupon_id");
			String forder_coupon_calc_price = request.getParameter("forder_coupon_calc_price");
			String forder_mileage = request.getParameter("forder_mileage");
			String forder_delivery = request.getParameter("forder_delivery");

			String order_time = request.getParameter("order_time");
			String order_pay_bankcd = request.getParameter("order_pay_bankcd");
			String order_pay_bankname = request.getParameter("order_pay_bankname");
			String order_pay_banknum = request.getParameter("order_pay_banknum");
			String order_pay_bankuser = request.getParameter("order_pay_bankuser");
			String order_pay_stat = request.getParameter("order_pay_stat");
			
			if(("bank").equals(forder_paytype)) {
				if(forder_user_name == null || forder_user_name =="" || ("+++++").equals(forder_user_name)) {
					forder_user_name = user_nm;
				}
				if(forder_user_hp == null || forder_user_hp =="" || ("+++++").equals(forder_user_hp)) {
					forder_user_hp = user_hp;
				}
				if(forder_user_email == null || forder_user_email =="" || ("+++++").equals(forder_user_email)) {
					forder_user_email = user_email;
				}

				if(forder_user_zip == null || forder_user_zip =="" || ("+++++").equals(forder_user_zip)) {
					forder_user_zip = "";
				}
				if(forder_user_addr1 == null || forder_user_addr1 =="" || ("+++++").equals(forder_user_addr1)) {
					forder_user_addr1 = "";
				}
				if(forder_user_addr2 == null || forder_user_addr2 =="" || ("+++++").equals(forder_user_addr2)) {
					forder_user_addr2 = "";
				}
				
				switch(forder_paytype) {
					case "bank" : db_pay_type = "B"; db_order_st = "READY"; break;
					case "realbank" : db_pay_type = "R"; db_order_st = "PAYMENT"; break;
					case "card" : db_pay_type = "C"; db_order_st = "PAYMENT"; break;
					case "virtual" : db_pay_type = "V"; db_order_st = "READY"; break;
				}
				if(forder_coupon_calc_price == null || forder_coupon_calc_price =="" || ("+++++").equals(forder_coupon_calc_price)) {
					forder_coupon_calc_price = "0";
				}
				if(forder_mileage == null || forder_mileage =="" || ("+++++").equals(forder_mileage)) {
					forder_mileage = "0";
				}
				if(forder_delivery == null || forder_delivery =="" || ("+++++").equals(forder_delivery)) {
					forder_delivery = "0";
				}
				if(forder_user_message == null || forder_user_message =="" || ("+++++").equals(forder_user_message)) {
					forder_user_message = "";
				}
				if(forder_user_call == null || forder_user_call =="" || ("+++++").equals(forder_user_call)) {
					forder_user_call = "";
				}
				if(forder_coupon_id == null || forder_coupon_id =="" || ("+++++").equals(forder_coupon_id)) {
					forder_coupon_id = "";
				}
				
			} else {	// 사용자결제 모바일에서 폼을 조정하였다.
				
				//String forder_user_hp_sum = request.getParameter("forder_user_hp");
				forder_user_hp = request.getParameter("forder_user_hp");
				String forder_user_zip_sum = request.getParameter("forder_user_zip");
				String forder_user_call_sum = request.getParameter("forder_user_call");
				String order_paytype = request.getParameter("order_paytype");
				
				//String[] data1 = forder_user_hp_sum.split(":::");  //forder_user_hp
				String[] data2 = forder_user_zip_sum.split(":::");	//forder_user_zip, forder_user_addr1, forder_user_addr2, forder_user_message, forder_user_call
				String[] data3 = forder_user_call_sum.split(":::");	//forder_user_name, forder_user_email, coupon_id, coupon_sale_price, forder_mileage, forder_delivery

				
				if(!(data3[0].trim()).equals("+++++")) {
					forder_user_name = data3[0].trim();
				} else {
					forder_user_name = user_nm;
				}
				if(!(data3[1].trim()).equals("+++++")) {
					forder_user_email = data3[1].trim();
				} else {
					forder_user_email = user_email;
				}

				forder_user_call = "";
				if(!(data2[4].trim()).equals("+++++")) {
					forder_user_call = data2[4].trim();
				}
				
				forder_user_zip = "";
				if(!(data2[0].trim()).equals("+++++")) {
					forder_user_zip = data2[0].trim();
				}
				
				forder_user_addr1 = "";
				if(!(data2[1].trim()).equals("+++++")) {
					forder_user_addr1 = data2[1].trim();
				}
				
				forder_user_addr2 = "";
				if(!(data2[2].trim()).equals("+++++")) {
					forder_user_addr2 = data2[2].trim();
				}
				
				forder_user_message = "";
				if(!(data2[3].trim()).equals("+++++")) {
					forder_user_message = data2[3].trim();
				}
				
				switch(order_paytype) {
					case "SC0030" : db_pay_type = "T"; db_order_st = "PAYMENT"; break;
					case "SC0010" : db_pay_type = "C"; db_order_st = "PAYMENT"; break;
					case "SC0040" : db_pay_type = "V"; db_order_st = "READY"; break;
				}
				
				forder_coupon_id = "";
				if(!(data3[2].trim()).equals("+++++")) {
					forder_coupon_id = data3[2].trim();
				}
				
				forder_coupon_calc_price = "0";
				if(!(data3[3].trim()).equals("+++++")) {
					forder_coupon_calc_price = data3[3].trim();
				}
				
				forder_mileage = "0";
				if(!(data3[4].trim()).equals("+++++")) {
					forder_mileage = data3[4].trim();
				}
				
				forder_delivery = "0";
				if(!(data3[5].trim()).equals("+++++")) {
					forder_delivery = data3[5].trim();
				}
			}
			
			//넘어온 주소를 회원주소록에 넣는다.
			// 향후 장바구니에서 주소록시스템 작업
			String master_order_id = order_id;
			baseShopVO.setorder_id(order_id);
			baseShopVO.setorder_user_id(user_id);
			baseShopVO.setorder_user_nm(forder_user_name);
			baseShopVO.setorder_hp(forder_user_hp);
			baseShopVO.setorder_tel(forder_user_call);
			baseShopVO.setorder_email(forder_user_email);
			baseShopVO.setorder_zip(forder_user_zip);
			baseShopVO.setorder_addr1(forder_user_addr1);
			baseShopVO.setorder_addr2(forder_user_addr2);
			baseShopVO.setorder_total_price(forder_total_price);
			baseShopVO.setorder_use_coupon_id(forder_coupon_id);
			baseShopVO.setorder_coupon_price(forder_coupon_calc_price);
			baseShopVO.setorder_use_mileage("0");	//아직 적용전
			baseShopVO.setorder_save_mileage("0");	//정책필요
			baseShopVO.setorder_total_delivery_price(forder_delivery);
			//B-무통장, C-카드, T-실시간계좌이체, V-가상계좌
			baseShopVO.setorder_pay_st(db_pay_type);
			baseShopVO.setorder_pay_vbank_nm(null);
			baseShopVO.setorder_pay_vbank_number(null);
			baseShopVO.setorder_pay_vbank_user(null);
			// 'ORDER','READY','PAYMENT','TRANSFER','COMPLETE','CHANGE_IN','CHANGE','CHANGE_CANCEL','RETURN_IN','RETURN','RETURN_CANCEL','REFUND','REFUND_COMPLETE'
			// 'CANCELING' 추가 - CANCEL_IN 대체
			baseShopVO.setorder_st(db_order_st);
			baseShopVO.setorder_memo(forder_user_message);
			baseShopVO.setorder_pay_cd(order_pay_cd);

			baseShopVO.setorder_pay_time(order_time);
			baseShopVO.setorder_pay_vbank_cd(order_pay_bankcd);
			baseShopVO.setorder_pay_vbank_nm(order_pay_bankname);
			baseShopVO.setorder_pay_vbank_number(order_pay_banknum);
			baseShopVO.setorder_pay_vbank_user(order_pay_bankuser);
			baseShopVO.setorder_pay_stat(order_pay_stat);
			
			//가상계좌일때.. 정보를 가져와서 업데이트한다.
			BaseShopVO get_vbank = baseShopService.get_vbank_info(baseShopVO);
			if(get_vbank != null) {
				order_pay_bankcd = get_vbank.getbank_cd();
				order_pay_bankname = get_vbank.getbank_nm();
				order_pay_banknum = get_vbank.getbank_num();
				order_pay_bankuser = get_vbank.getbank_user();
				order_pay_stat = get_vbank.getbank_pay_stat();
				baseShopVO.setorder_pay_vbank_cd(order_pay_bankcd);
				baseShopVO.setorder_pay_vbank_nm(order_pay_bankname);
				baseShopVO.setorder_pay_vbank_number(order_pay_banknum);
				baseShopVO.setorder_pay_vbank_user(order_pay_bankuser);
				baseShopVO.setorder_pay_stat(order_pay_stat);
				
			} 
			
			// 중복된 주문정보가 있는지 체크한다.
			int is_order = baseShopService.get_order_id_check(baseShopVO);
			if(is_order > 0) {
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>function locationReplace(url){ if(history.replaceState){ history.replaceState(null, document.title, url); history.go(0); }else{ location.replace(url); } }</script>");
				out.println("<script>alert('이미 중복된 주문번호가 존재합니다. 주문내역 확인후, 다시 시도하여 주세요.'); locationReplace('/shop/cart.do');</script>");
				out.flush();
				return;
			}
			
			// 마스터 저장
			baseShopService.set_order_master(baseShopVO);
			
			// 디테일저장
			String[] cart_seqs = forder_cart_seq.split(",");
			for(int i=0; i<cart_seqs.length; i++) {
				//장바구니 정보를 불러온다.
				if(cart_seqs[i] != null && cart_seqs[i] !="") {
					String cart_seq = cart_seqs[i];
					baseShopVO.setcart_seq(cart_seq);
					BaseShopVO cart_info = baseShopService.get_cart_info(baseShopVO);
					String store_category = cart_info.getstore_category();
					
					baseShopVO.setod_order_id(order_id);
					baseShopVO.setod_store_id(cart_info.getstore_id());
					baseShopVO.setod_prod_id(cart_info.getprod_id());
					baseShopVO.setod_prod_nm(cart_info.getprod_nm());
					baseShopVO.setod_room_seq(cart_info.getprod_room_seq());
					baseShopVO.setod_prod_opt_seq(cart_info.getopt_seqs());
					baseShopVO.setod_prod_opt_nm(cart_info.getopt_nms());
					baseShopVO.setod_prod_opt_price(cart_info.getopt_prices());
					baseShopVO.setod_prod_opt_cnt(cart_info.getopt_cnts());
					baseShopVO.setod_store_category(cart_info.getstore_category());
					baseShopVO.setod_prod_category(cart_info.getprod_category());
					baseShopVO.setod_prod_price(cart_info.getprod_price());
					baseShopVO.setod_prod_price_percent(cart_info.getprod_price_percent());
					baseShopVO.setod_prod_total_price(cart_info.gettotal_price());
					baseShopVO.setod_st_dt(cart_info.getreserve_st_dt());
					baseShopVO.setod_ed_dt(cart_info.getreserve_ed_dt());
					baseShopVO.setod_user_nm(cart_info.getreserve_user_nm());
					baseShopVO.setod_user_call(cart_info.getreserve_user_call());
					baseShopVO.setod_order_stat(db_order_st);
					
					baseShopService.set_order_detail(baseShopVO);
					
					if(("PAYMENT").equals(db_order_st)) {
						String order_cate = "";
						if(("CD002001").equals(store_category)) {
							order_cate = "001";
						}
						if(("CD002002").equals(store_category)) {
							order_cate = "002";
						}
						if(("CD002003").equals(store_category)) {
							order_cate = "003";
						}
						if(("CD002004").equals(store_category)) {
							order_cate = "004";
						}
						baseVO.setsms_cd("PAYMENT"+order_cate);
						baseVO.setorder_id(master_order_id);
						baseService.sendSms(baseVO);
					}
					
					//저장 후, 장바구니쪽 삭제한다.
					baseShopVO.setcart_seq(cart_info.getcart_seq());
					baseShopService.set_cart_delete(baseShopVO);
					
				}
			}
			if(("C").equals(db_pay_type) || ("T").equals(db_pay_type)) {
				baseVO.setsms_cd("PAYMENT");
			} else {
				baseVO.setsms_cd("ORDER");
			}
			baseVO.setorder_id(master_order_id);
			baseService.sendSms(baseVO);
		}
		
		//페이지이동
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<script>function locationReplace(url){ if(history.replaceState){ history.replaceState(null, document.title, url); history.go(0); }else{ location.replace(url); } }</script>");
		//out.println("<script>locationReplace('/mypage/orderReserveList.do');</script>");
		out.println("<script>locationReplace('/mypage/orderList.do');</script>");
		out.flush();
		return;

	}
	
	//===============================================================================================================
	// * 장바구니삭제 - 개별 아이템
	//===============================================================================================================
	@RequestMapping(value = "/shop/orderChange.do")
	public void orderChange(
		@ModelAttribute("BaseShopVO") BaseShopVO baseShopVO, 
		ModelMap model, 
		HttpServletRequest request, 
		HttpServletResponse response
		) throws Exception {
		
		HttpSession session = request.getSession(true);
		String user_id = (String) session.getAttribute("user_id");
		String user_nm = (String) session.getAttribute("user_nm");
		String user_hp = (String) session.getAttribute("user_hp");
		String user_email = (String) session.getAttribute("user_email");
		String sess_id = (String) session.getId();
		String isMobile = (String) session.getAttribute("isMobile");
		
		if(user_id == null || user_id == "") {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('로그인 권한이 필요합니다.'); location.href='/member/joinLogin.do?return_url="+URLEncoder.encode("/shop/cart.do", "UTF-8")+"'; </script>");
			out.flush();
			return;
		} else {

			String order_id = request.getParameter("order_id");
			String order_pay_stat = request.getParameter("order_pay_stat");
			String order_pay_bankcd = request.getParameter("order_pay_bankcd");
			String order_pay_bankname = request.getParameter("order_pay_bankname");
			String order_pay_banknum = request.getParameter("order_pay_banknum");
			String order_pay_bankuser = request.getParameter("order_pay_bankuser");
			
			baseShopVO.setorder_pay_vbank_cd(order_pay_bankcd);
			baseShopVO.setorder_pay_vbank_nm(order_pay_bankname);
			baseShopVO.setorder_pay_vbank_number(order_pay_banknum);
			baseShopVO.setorder_pay_vbank_user(order_pay_bankuser);
			
			baseShopVO.setorder_id(order_id);
			baseShopVO.setorder_pay_stat(order_pay_stat);
			baseShopService.set_update_order_master(baseShopVO);
			baseShopService.set_update_order_detail(baseShopVO);
			
		}
		
	}
	
	//===============================================================================================================
	// * 주문취소 
	//===============================================================================================================
	@RequestMapping(value = "/shop/orderCancel.do")
	public void orderCancel(
		@ModelAttribute("BaseShopVO") BaseShopVO baseShopVO, 
		ModelMap model, 
		HttpServletRequest request, 
		HttpServletResponse response
		) throws Exception {
		
		HttpSession session = request.getSession(true);
		String user_id = (String) session.getAttribute("user_id");
		String user_nm = (String) session.getAttribute("user_nm");
		String user_hp = (String) session.getAttribute("user_hp");
		String user_email = (String) session.getAttribute("user_email");
		String sess_id = (String) session.getId();
		String isMobile = (String) session.getAttribute("isMobile");
		
		if(user_id == null || user_id == "") {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("AN");
			out.flush();
			return;
		} else {

			String order_id = request.getParameter("order_id");
			String od_seq = request.getParameter("od_seq");
			String cancel_type = request.getParameter("cancel_type");
			
			baseShopVO.setorder_id(order_id);
			if("A".equals(cancel_type)) {
				baseShopService.order_all_cancel(baseShopVO);
				baseShopService.orderdetail_all_cancel(baseShopVO);
			} else {
				baseShopVO.setod_seq(od_seq);
				baseShopService.orderdetail_sel_cancel(baseShopVO);
			}
			
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("Y");
			out.flush();
			return;
			
		}
		
	}
	
	//===============================================================================================================
	// * 결제모듈
	//===============================================================================================================
	@RequestMapping(value = "/PG/PayReq.do")
	public String PayReq(
		@ModelAttribute("BaseShopVO") BaseShopVO baseShopVO, 
		ModelMap model, 
		HttpServletRequest request, 
		HttpServletResponse response
		) throws Exception {
		HttpSession session = request.getSession(true);
		String user_id = (String) session.getAttribute("user_id");
		String sess_id = (String) session.getId();
		return "/baseScmtour/LGDACOM/payreq";
	}
	//===============================================================================================================
	// * 결제모듈
	//===============================================================================================================
	@RequestMapping(value = "/PG/PayRes.do")
	public String PayRes(
		@ModelAttribute("BaseShopVO") BaseShopVO baseShopVO, 
		ModelMap model, 
		HttpServletRequest request, 
		HttpServletResponse response
		) throws Exception {
		HttpSession session = request.getSession(true);
		String user_id = (String) session.getAttribute("user_id");
		String sess_id = (String) session.getId();
		return "/baseScmtour/LGDACOM/payres";
	}
	//===============================================================================================================
	// * 결제모듈
	//===============================================================================================================
	@RequestMapping(value = "/PG/ReturnUrl.do")
	public String returnUrl(
		@ModelAttribute("BaseShopVO") BaseShopVO baseShopVO, 
		ModelMap model, 
		HttpServletRequest request, 
		HttpServletResponse response
		) throws Exception {
		HttpSession session = request.getSession(true);
		String user_id = (String) session.getAttribute("user_id");
		String sess_id = (String) session.getId();
		
		String user_agent = request.getHeader("User-Agent");
		String isMobile = "0";
		String isApp = "0";
		String isMoOS = "android";
		if(user_agent.indexOf("iPhone") > -1) {
			isMoOS = "apple";
		}
		String[] mobileos = {"iPhone", "iPod", "Android", "BlackBerry", "Windows CE", "Nokia", "Webos", "Opera Mini", "SonyEricsson", "Opera Mobi", "IEMobile", "dtoursc"};
		if (user_agent != null && !user_agent.equals("")) {
			for(int i = 0; i < mobileos.length; i++) {
				if (user_agent.indexOf(mobileos[i]) > -1) {
					isMobile = "1";
				}
			}
			for(int i = 0; i < mobileos.length; i++) {
				if (("dtoursc").equals(mobileos[i])) {
					isApp = "1";
				}
			}
		}
		
		//모바일여부 세션에 담기
		session.setAttribute("isMobile", isMobile);
		session.setAttribute("isApp", isApp);
		session.setAttribute("isMoOS", isMoOS);
		
		return "/baseScmtour/LGDACOM/returnurl";
	}
	//===============================================================================================================
	// * 결제모듈
	//===============================================================================================================
	@RequestMapping(value = "/PG/Cancel.do")
	public String Cancel(
		@ModelAttribute("BaseShopVO") BaseShopVO baseShopVO, 
		ModelMap model, 
		HttpServletRequest request, 
		HttpServletResponse response
		) throws Exception {
		HttpSession session = request.getSession(true);
		String user_id = (String) session.getAttribute("user_id");
		String sess_id = (String) session.getId();
		return "/baseScmtour/LGDACOM/Cancel";
	}
	//===============================================================================================================
	// * 결제모듈
	//===============================================================================================================
	@RequestMapping(value = "/PG/CasNoteUrl.do")
	public String CasNoteUrl(
		@ModelAttribute("BaseShopVO") BaseShopVO baseShopVO, 
		ModelMap model, 
		HttpServletRequest request, 
		HttpServletResponse response
		) throws Exception {
		HttpSession session = request.getSession(true);
		String user_id = (String) session.getAttribute("user_id");
		String sess_id = (String) session.getId();
		return "/baseScmtour/LGDACOM/cas_noteurl";
	}
	//===============================================================================================================
	// * 결제모듈
	//===============================================================================================================
	@RequestMapping(value = "/PG/CashReceipt.do")
	public String CashReceipt(
		@ModelAttribute("BaseShopVO") BaseShopVO baseShopVO, 
		ModelMap model, 
		HttpServletRequest request, 
		HttpServletResponse response
		) throws Exception {
		HttpSession session = request.getSession(true);
		String user_id = (String) session.getAttribute("user_id");
		String sess_id = (String) session.getId();
		return "/baseScmtour/LGDACOM/CashReceipt";
	}
			
	//===============================================================================================================
	// * 장바구니
	//===============================================================================================================
	@RequestMapping(value = "/shop/payment.do")
	public String payment(
		@ModelAttribute("BaseShopVO") BaseShopVO baseShopVO, 
		ModelMap model, 
		HttpServletRequest request, 
		HttpServletResponse response
		) throws Exception {
		
		HttpSession session = request.getSession(true);
		String user_id = (String) session.getAttribute("user_id");
		String user_nm = (String) session.getAttribute("user_nm");
		String sess_id = (String) session.getId();
		String user_ip = BaseService.getRemoteIP(request);
		model.addAttribute("user_ip", user_ip);

		String order_user_zip_teset = request.getParameter("order_user_zip");
		System.out.println("==================");
		System.out.println("order_user_zip_teset : "+order_user_zip_teset);
		System.out.println("==================");

		
		String[] check_item = request.getParameterValues("check_item");
		if(check_item == null) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('선택된 상품이 없습니다.'); location.href='/shop/cart.do'; </script>");
			out.flush();
			return null;
		}
		
		String sql_or = "(";
		String seq_or = "";
		int i = 0;
		String or = "";
		for(String val : check_item) {
			if(i == 0) { or = ""; } 
			else { or = ","; }
			sql_or += or + val;  
			seq_or += or + val;  
			i++;
		}
		sql_or += ")";
		
		if(user_id != null && user_id != "") {
			
			SimpleDateFormat todate = new SimpleDateFormat();
			SimpleDateFormat today = new SimpleDateFormat();
			
			Calendar cal = Calendar.getInstance(); 
			
			todate.applyPattern("yyyyMMddHHmmss");
			today.applyPattern("yyyy-MM-dd");
			
			String todateformat = todate.format(cal.getTime()); 
			String todayformat = today.format(cal.getTime()); 
			// 주문번호 랜덤값 만들기
			int rankey1 = (int) (Math.random() * 9)+1;
			int rankey2 = (int) (Math.random() * 9)+1;
			int rankey3 = (int) (Math.random() * 9)+1;
			int rankey4 = (int) (Math.random() * 9)+1;
			int rankey5 = (int) (Math.random() * 9)+1;
			
			//주문번호 생성
			String Order_id = "O"+todateformat+rankey1+rankey2+rankey3+rankey4+rankey5;
			model.addAttribute("order_id", Order_id);
			
			//배송비를 업데이트 하자 - 현재 생성된 주문코드로 작업
			String[] d_store_id = request.getParameterValues("d_store_id");
			String[] d_store_base = request.getParameterValues("d_store_base");
			String[] d_store_order = request.getParameterValues("d_store_order");
			String[] d_store_delivery = request.getParameterValues("d_store_delivery");
			
			
			//배송비데이터 삭제
			baseShopVO.setorder_id(Order_id);
			if(d_store_id != null) {
				for(int j=0; j<d_store_id.length; j++) {
					if(d_store_id[j] != "" && d_store_id[j] != null ) {
						baseShopVO.setstore_id(d_store_id[j]);
						baseShopVO.setosd_base(d_store_base[j]);
						baseShopVO.setosd_order_price(d_store_order[j]);
						baseShopVO.setosd_delivery_price(d_store_delivery[j]);
						baseShopService.insert_delivery_price(baseShopVO);
					}
				}
			}

			//장바구니 정보
			baseShopVO.setuser_id(user_id);
			baseShopVO.setsql_or(sql_or);
			model.addAttribute("cartcnt", baseShopService.get_cart_cnt(baseShopVO));
			
			baseShopVO.setstore_category("CD002001");
			model.addAttribute("cartList1", baseShopService.get_cart_list(baseShopVO));
			baseShopVO.setstore_category("CD002002");
			model.addAttribute("cartList2", baseShopService.get_cart_list(baseShopVO));
			baseShopVO.setstore_category("CD002003");
			model.addAttribute("cartList3", baseShopService.get_cart_list(baseShopVO));
			baseShopVO.setstore_category("CD002004");
			model.addAttribute("cartList4", baseShopService.get_cart_list(baseShopVO));
			
			String member_nm = request.getParameter("order_user_nm");
			String member_email = request.getParameter("order_user_email");
			String member_hp = request.getParameter("order_user_hp");
			String member_call = request.getParameter("order_user_call");
			String member_addr_nm = request.getParameter("addr_nm");
			String member_zip = request.getParameter("order_user_zip");
			String member_addr1 = request.getParameter("order_user_addr1");
			String member_addr2 = request.getParameter("order_user_addr2");
			String member_msg= request.getParameter("order_user_msg");
			String member_paytype= request.getParameter("order_paytype");
			String member_mileage = request.getParameter("order_mileage");
			String order_user_pay = request.getParameter("order_user_pay");
			String order_time = request.getParameter("order_time");
			
			model.addAttribute("forder_cart_seq", seq_or);
			model.addAttribute("forder_user_nm", member_nm);
			model.addAttribute("forder_user_email", member_email);
			model.addAttribute("forder_user_hp", member_hp);
			model.addAttribute("forder_user_call", member_call);
			model.addAttribute("forder_user_zip", member_zip);
			model.addAttribute("forder_user_addr1", member_addr1);
			model.addAttribute("forder_user_addr2", member_addr2);
			model.addAttribute("forder_user_message", member_msg);
			model.addAttribute("forder_paytype", member_paytype);
			model.addAttribute("forder_mileage", member_mileage);
			model.addAttribute("order_user_pay", order_user_pay);
			model.addAttribute("order_time", order_time);
			
			
			//얼렁 주소록에 저장하자.. 동의시..
			baseShopVO.setuser_id(user_id);
			String member_save = request.getParameter("member_save");
			String addr_save = request.getParameter("addr_save");
			
			if(("Y").equals(member_save)) {
				baseShopVO.setuser_nm(member_nm);
				baseShopVO.setuser_hp(member_hp);
				baseShopVO.setuser_email(member_email);
				baseShopService.add_member_info(baseShopVO);
			}
			if(("Y").equals(addr_save)) {
				baseShopVO.setaddr_nm(member_addr_nm);
				baseShopVO.setaddr_zip(member_zip);
				baseShopVO.setaddr_1(member_addr1);
				baseShopVO.setaddr_2(member_addr2);
				baseShopService.add_addr_info(baseShopVO);
			}
			
			
			//쿠폰정보
			String coupon_id = request.getParameter("order_user_coupon");
			model.addAttribute("coupon_id", coupon_id);
			baseShopVO.setcoupon_id(coupon_id);
			BaseShopVO coupon_info = baseShopService.get_site_coupon_info(baseShopVO);
			model.addAttribute("couponInfo", coupon_info);
			
			String all_total_price = request.getParameter("all_total_price");
			model.addAttribute("all_total_price", all_total_price);
			String coupon_sale_price = request.getParameter("coupon_sale_price");
			model.addAttribute("coupon_sale_price", coupon_sale_price);
			String delivery_price = request.getParameter("delivery_price");
			model.addAttribute("delivery_price", delivery_price);
		}

		return "/baseScmtour/baseShop/payment";
	}

	//===============================================================================================================
	// * 결제모듈
	//===============================================================================================================
	@RequestMapping(value = "/Ajax/orderUseSave.do")
	public void orderUseSave(
			@ModelAttribute("BaseShopVO") BaseShopVO baseShopVO, 
			ModelMap model, 
			HttpServletRequest request, 
			HttpServletResponse response
			) throws Exception {
		HttpSession session = request.getSession(true);
		String user_id = (String) session.getAttribute("user_id");
		String sess_id = (String) session.getId();
		
		if(user_id == null || user_id == "") {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("AN");
			out.flush();
			return;
		} else  {
			//주문자 본인인지 확인한다.
			String od_seq = request.getParameter("od_seq");
			baseShopVO.setod_seq(od_seq);
			baseShopVO.setuser_id(user_id);
			int is = baseShopService.is_order_use(baseShopVO);
			if(is > 0) {
				baseShopService.use_save(baseShopVO);
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("S");
				out.flush();
				return;
			} else {
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("A");
				out.flush();
				return;
			}
		}
	}
	
	//===============================================================================================================
	// * 결제모듈
	//===============================================================================================================
	@RequestMapping(value = "/Ajax/optionUpdate.do")
	public void optionUpdate(
		@ModelAttribute("BaseShopVO") BaseShopVO baseShopVO, 
		ModelMap model, 
		HttpServletRequest request, 
		HttpServletResponse response
		) throws Exception {
		HttpSession session = request.getSession(true);
		String user_id = (String) session.getAttribute("user_id");
		String sess_id = (String) session.getId();
		if(user_id == null || user_id == "") {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("AN");
			out.flush();
			return;
		} else  {
			String cart_seq = request.getParameter("cart_seq");
			String opt_seq = request.getParameter("opt_seq");
			String opt_cnt = request.getParameter("opt_cnt");
			baseShopVO.setopt_seq(cart_seq);
			BaseShopVO cart_data = baseShopService.get_cart_opt_data(baseShopVO);
			String store_category = cart_data.getstore_category();
			String prod_id = cart_data.getprod_id();
			String store_id = cart_data.getstore_id();
			String prod_room_seq = cart_data.getprod_room_seq();
			String total_price = cart_data.gettotal_price();
			String opt_seqs = cart_data.getopt_seqs();
			String opt_prices = cart_data.getopt_prices();
			String opt_cnts = cart_data.getopt_cnts();

			String[] opt_seq_arr = opt_seqs.split("\\|\\|\\|");
			String[] opt_prices_arr = opt_prices.split("\\|\\|\\|");
			String[] opt_cnts_arr = opt_cnts.split("\\|\\|\\|");
			
			String new_opt_cnt = "";
			int new_total_price = 0;
			for(int i=0; i<opt_seq_arr.length; i++) {
				
				if(opt_seq_arr[i] != null && opt_seq_arr[i] != "") {
					if(opt_seq.equals(opt_seq_arr[i])) {
						new_opt_cnt += opt_cnt+"|||";
						new_total_price += Integer.parseInt(opt_cnt) * Integer.parseInt(opt_prices_arr[i]);
					} else {
						new_opt_cnt += opt_cnts_arr[i]+"|||";
						new_total_price += Integer.parseInt(opt_cnts_arr[i]) * Integer.parseInt(opt_prices_arr[i]);
					}
				}
			}
			
			// DB에 업데이트한다.
			String new_total_price_str = Integer.toString(new_total_price);
			baseShopVO.setcart_seq(cart_seq);
			baseShopVO.setopt_cnts(new_opt_cnt);
			baseShopVO.settotal_price(new_total_price_str);
			
			//업데이트한다.  리턴없음.  
			baseShopService.update_option(baseShopVO);
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("S");
			out.flush();
			return;
		}
		
	}
	
	
	//===============================================================================================================
	// * checkplus 메인
	//===============================================================================================================
	@RequestMapping(value = "/shop/checkPlusMain.do")
	public String checkPlusMain(
		@ModelAttribute("BaseShopVO") BaseShopVO baseShopVO, 
		ModelMap model, 
		HttpServletRequest request, 
		HttpServletResponse response
		) throws Exception {
		HttpSession session = request.getSession(true);
		String user_id = (String) session.getAttribute("user_id");
		String sess_id = (String) session.getId();
		String user_adult = (String) session.getAttribute("adultAuth");
		
		if(user_id == null || user_id == "") {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("AN");
			out.flush();
			return null;
		} else  {
			
			return "/baseScmtour/baseCheckPlus/checkPlusMain";
		}
	}
	
	//===============================================================================================================
	// * checkplus 성공
	//===============================================================================================================
	@RequestMapping(value = "/shop/checkPlusSuccess.do")
	public String checkPlusSuccess(
		@ModelAttribute("BaseShopVO") BaseShopVO baseShopVO, 
		ModelMap model, 
		HttpServletRequest request, 
		HttpServletResponse response
		) throws Exception {
		HttpSession session = request.getSession(true);
		String user_id = (String) session.getAttribute("user_id");
		String sess_id = (String) session.getId();
		if(user_id == null || user_id == "") {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("AN");
			out.flush();
			return null;
		} else  {
			
			SimpleDateFormat todate = new SimpleDateFormat();
			Calendar cal = Calendar.getInstance(); 
			todate.applyPattern("yyyyMMdd");
			String today = todate.format(cal.getTime());
			
			cal.add(Calendar.YEAR, -19);
			String authday = todate.format(cal.getTime());
			model.addAttribute("authday", authday);
			/*
			System.out.println("==================");
			System.out.println("today : "+today);
			System.out.println("==================");
			System.out.println("==================");
			System.out.println("authday : "+authday);
			System.out.println("==================");
			*/
			
			return "/baseScmtour/baseCheckPlus/checkPlusSuccess";
		}
	}
	
	//===============================================================================================================
	// * checkplus 메인
	//===============================================================================================================
	@RequestMapping(value = "/shop/checkPlusFail.do")
	public String checkPlusFail(
		@ModelAttribute("BaseShopVO") BaseShopVO baseShopVO, 
		ModelMap model, 
		HttpServletRequest request, 
		HttpServletResponse response
		) throws Exception {
		HttpSession session = request.getSession(true);
		String user_id = (String) session.getAttribute("user_id");
		String sess_id = (String) session.getId();
		
		if(user_id == null || user_id == "") {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("AN");
			out.flush();
			return null;
		} else  {
			return "/baseScmtour/baseCheckPlus/checkPlusFail";
		}
	}
	
	//===============================================================================================================
	// * checkplus 메인
	//===============================================================================================================
	@RequestMapping(value = "/shop/adultSession.do")
	public void adultSession(
		@ModelAttribute("BaseShopVO") BaseShopVO baseShopVO, 
		ModelMap model, 
		HttpServletRequest request, 
		HttpServletResponse response
		) throws Exception {
		
		HttpSession session = request.getSession(true);
		String user_id = (String) session.getAttribute("user_id");
		String sess_id = (String) session.getId();
		
		session.setAttribute("adultAuth", "Y");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<script>opener.location.reload();self.window.close();</script>");
		out.flush();
		return;
		
	}
	
	//===============================================================================================================
	// * 배송트래킹 조회
	//===============================================================================================================
	@RequestMapping(value = "/mypage/transfer.do")
	public String transfer(
		@ModelAttribute("BaseShopVO") BaseShopVO baseShopVO, 
		@ModelAttribute("BaseVO") BaseVO baseVO, 
		ModelMap model, 
		HttpServletRequest request, 
		HttpServletResponse response
		) throws Exception {
		
		String tcomp = request.getParameter("tcomp");
		String tnum = request.getParameter("tnum");
		
		if(tnum != "" && tnum != null) {
			tnum = tnum.replace("-","");
		}
		
		baseVO.setbase_cd(tcomp);
		BaseVO tcodeValue = baseService.get_base_cd_info(baseVO);
		String tcode = tcodeValue.getbase_api_cd();
		
		AdmgrConfigVO getConfig = admgrConfigService.get_base_config(null);
		String tkey = getConfig.gettracking_key();
		model.addAttribute("tkey", tkey);
		
		model.addAttribute("tcode", tcode);
		model.addAttribute("tnum", tnum);
		
		return "/baseScmtour/baseOrder/transfer";
		
	}
	
	
}
