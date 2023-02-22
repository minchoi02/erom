package egovframework.base.index.web;

import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
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
public class BaseIndexController {

	@Resource(name = "BaseIndexService")
	private BaseIndexService baseIndexService;	
	
	@Resource(name = "BaseShopService")
	private BaseShopService baseShopService;	
	
	@Resource(name = "BaseMemberService")
	private BaseMemberService baseMemberService;	
	
	@Resource(name = "BaseBoardService")
	private BaseBoardService baseBoardService;	
	
	@Resource(name = "AdmgrConfigService")
	private AdmgrConfigService admgrConfigService;	
	
	@Resource(name = "BaseService")
	private BaseService baseService;	
	
	
	//=========================================================

	//=========================================================
	// 메인페이지
	//=========================================================
	@RequestMapping(value = "/index.do")
	public String index(
			@ModelAttribute("BaseIndexVO") BaseIndexVO baseIndexVO, 
			@ModelAttribute("BaseShopVO") BaseShopVO baseShopVO, 
			@ModelAttribute("BaseBoardVO") BaseBoardVO baseBoardVO,
			@ModelAttribute("BaseVO") BaseVO baseVO, 
			ModelMap model, 
			HttpServletRequest request, 
			HttpServletResponse response
		) throws Exception {
		
		HttpSession session = request.getSession(true);
		String sess_id = (String) session.getId();
		String user_id = (String) session.getAttribute("user_id");

		//메인슬라이드 가져오기
		baseBoardVO.setsql_limit(8);
		model.addAttribute("mainSlideList", baseBoardService.get_main_slide(baseBoardVO));
		//model.addAttribute("mainSlideListCnt", baseBoardService.get_main_slide_cnt(baseBoardVO));
		
		//추천여행코스 가져오기
		baseShopVO.setsql_limit(10);
		baseShopVO.setstore_category("CD002005");
		//model.addAttribute("recomTravelList", baseShopService.get_site_main_prod_list_recom_travel(baseShopVO));
		model.addAttribute("recomTravelList_cnt", baseShopService.get_site_main_prod_list_recom_travel_cnt(baseShopVO));
		
		// 금주의 관광/체럼 가져오기
		baseBoardVO.setstore_category("CD002001");
		//model.addAttribute("weekList1", baseBoardService.get_week(baseBoardVO));
		model.addAttribute("weekList1_cnt", baseBoardService.get_week_cnt(baseBoardVO));
		// 금주의 숙박가져오기
		baseBoardVO.setstore_category("CD002002");
		//model.addAttribute("weekList2", baseBoardService.get_week(baseBoardVO));
		model.addAttribute("weekList2_cnt", baseBoardService.get_week_cnt(baseBoardVO));
		// 금주의 맛집 가져오기
		baseBoardVO.setstore_category("CD002003");
		//model.addAttribute("weekList3", baseBoardService.get_week(baseBoardVO));
		model.addAttribute("weekList3_cnt", baseBoardService.get_week_cnt(baseBoardVO));
		// 금주의 장터 가져오기
		baseBoardVO.setstore_category("CD002004");
		baseBoardVO.setsql_limit(8);
		model.addAttribute("weekList4", baseBoardService.get_week(baseBoardVO));
		//model.addAttribute("weekList4_cnt", baseBoardService.get_week_cnt(baseBoardVO));

		// 프로모션 가져오기
		baseBoardVO.setbbs_id("event");
		baseBoardVO.setsql_limit(10);
		//model.addAttribute("promotionList", baseBoardService.get_bbs_promotion(baseBoardVO));
		model.addAttribute("promotionList_cnt", baseBoardService.get_bbs_promotion_cnt(baseBoardVO));
		//배너정보 가져오기 1
		/*baseBoardVO.setsql_limit(1);
		baseBoardVO.setbanner_zone_1("Y");
		model.addAttribute("banner1List", baseBoardService.get_banner(baseBoardVO));
		*/
		// 베스트 관광/체럼
		baseBoardVO.setstore_category("CD002001");
		baseBoardVO.setsql_limit(100);
		//model.addAttribute("mainItem1List", baseBoardService.get_main_item(baseBoardVO));
		model.addAttribute("mainItem1List_cnt", baseBoardService.get_main_item_cnt(baseBoardVO));
		
		// 베스트 맛집
		baseBoardVO.setstore_category("CD002002");
		baseBoardVO.setsql_limit(100);
		//model.addAttribute("mainItem2List", baseBoardService.get_main_item(baseBoardVO));
		model.addAttribute("mainItem2List_cnt", baseBoardService.get_main_item_cnt(baseBoardVO));
		
		//베스트 숙박
		baseBoardVO.setstore_category("CD002003");
		baseBoardVO.setsql_limit(100);
		//model.addAttribute("mainItem3List", baseBoardService.get_main_item(baseBoardVO));
		model.addAttribute("mainItem3List_cnt", baseBoardService.get_main_item_cnt(baseBoardVO));
		
		
		//베스트 특산품(장터) - 8개
		baseBoardVO.setstore_category("CD002004");
		baseBoardVO.setsql_limit(100);
		//model.addAttribute("mainItem4List", baseBoardService.get_main_item(baseBoardVO));
		model.addAttribute("mainItem4List_cnt", baseBoardService.get_main_item_cnt(baseBoardVO));
		
		String searchKey = request.getParameter("searchKey");
		String searchKeyword= request.getParameter("searchKeyword");
		String searchType = request.getParameter("searchType");
		String search_sql = "";
		String searchTypeAdd = "";		
		
		baseShopVO.setsearchKey(searchKey);
		baseShopVO.setsearchKeyword(searchKeyword);
		baseShopVO.setsearch_sql(search_sql);
		model.addAttribute("searchKey", searchKey);
		model.addAttribute("searchKeyword", searchKeyword);
		model.addAttribute("searchType", searchType);
		
		String store_category = request.getParameter("store_category");
		store_category = "CD002004";//이거 안들어가길래 sql에 강제로 박아넣음
		System.out.println(store_category);
		model.addAttribute("store_category", store_category);

		String prod_category = request.getParameter("prod_category");
		//prod_category = "CD005001";
		model.addAttribute("prod_category", prod_category);
		
		String orderby = request.getParameter("orderby");
		if(orderby == null || orderby == "") {
			orderby = "Recom";
		}		
		model.addAttribute("orderby", orderby);
		
		String prod_orderby  = request.getParameter("prod_orderby");
		if(prod_orderby == null || prod_orderby == "") {
			prod_orderby = "1";
		}
		model.addAttribute("prod_orderby", prod_orderby);	
		

		/** pageing start */
		baseShopVO.setPageUnit(8);
		baseShopVO.setPageSize(10); 
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(baseShopVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(baseShopVO.getPageUnit());
		paginationInfo.setPageSize(baseShopVO.getPageSize());

		baseShopVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		baseShopVO.setLastIndex(paginationInfo.getLastRecordIndex());
		baseShopVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

		// 전체갯수 구하기
		int ListCnt = baseShopService.get_site_prod_list_cnt(baseShopVO);
		paginationInfo.setTotalRecordCount(ListCnt);
		model.addAttribute("TotalCnt", ListCnt);
		model.addAttribute("paginationInfo", paginationInfo);
		
		// 해당페이지 시작번호를 구한다.
		int StartPageNumber = ListCnt - (baseShopVO.getPageUnit() * (baseShopVO.getPageIndex()-1)) + 1;
		model.addAttribute("StartPageNumber", StartPageNumber);
		/** paging end **/
		
		model.addAttribute("ProdList", baseShopService.get_index_prod_list(baseShopVO));

		//인덱스 배너정보 가져오기 1
		baseBoardVO.setsql_limit(1);
		baseBoardVO.setbanner_zone_2("Y");
		baseBoardVO.setseq_nm(6);
		model.addAttribute("banner2List_1", baseBoardService.get_index_banner(baseBoardVO));
		
		//인덱스 배너정보 가져오기 2
		baseBoardVO.setsql_limit(1);
		baseBoardVO.setbanner_zone_2("Y");
		baseBoardVO.setseq_nm(7);
		model.addAttribute("banner2List_2", baseBoardService.get_index_banner(baseBoardVO));
		
		//인덱스 배너정보 가져오기 3
		baseBoardVO.setsql_limit(1);
		baseBoardVO.setbanner_zone_2("Y");
		baseBoardVO.setseq_nm(8);
		model.addAttribute("banner2List_3", baseBoardService.get_index_banner(baseBoardVO));
		
						
		model.addAttribute("get_index_prod_list_1", baseShopService.get_index_prod_list_1(baseShopVO));
		model.addAttribute("get_index_prod_list_2", baseShopService.get_index_prod_list_2(baseShopVO));
		model.addAttribute("get_index_prod_list_3", baseShopService.get_index_prod_list_3(baseShopVO));
		model.addAttribute("get_index_prod_list_4", baseShopService.get_index_prod_list_4(baseShopVO));
		model.addAttribute("get_index_prod_list_5", baseShopService.get_index_prod_list_5(baseShopVO));		
		return "/baseScmtour/index";
	}
	
	
	
	
	
	//=========================================================
	// 상품리스트(전체적으로)
	//=========================================================
	@RequestMapping(value = "/list.do")
	public String list(
			@ModelAttribute("BaseShopVO") BaseShopVO baseShopVO, 
			@ModelAttribute("BaseVO") BaseVO baseVO, 
			ModelMap model, 
			HttpServletRequest request, 
			HttpServletResponse response
		) throws Exception {
		
		String searchKey = request.getParameter("searchKey");
		String searchKeyword= request.getParameter("searchKeyword");
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
		
		baseShopVO.setsearchKey(searchKey);
		baseShopVO.setsearchKeyword(searchKeyword);
		baseShopVO.setsearch_sql(search_sql);
		model.addAttribute("searchKey", searchKey);
		model.addAttribute("searchKeyword", searchKeyword);
		model.addAttribute("searchType", searchType);
				
		System.out.println("11111111111111111");
		String store_category = request.getParameter("store_category");
		store_category = "CD002004";
		System.out.println(store_category);
		model.addAttribute("store_category", store_category);

		String prod_category = request.getParameter("prod_category");
		//prod_category = "CD005001";
		model.addAttribute("prod_category", prod_category);
				
		
		String orderby = request.getParameter("orderby");
		if(orderby == null || orderby == "") {
			orderby = "Recom";
		}		
		model.addAttribute("orderby", orderby);
		
		String prod_orderby  = request.getParameter("prod_orderby");
		if(prod_orderby == null || prod_orderby == "") {
			prod_orderby = "1";
		}
		model.addAttribute("prod_orderby", prod_orderby);		
		System.out.println("222222222222222222");
		// 베스트상품 구하기
		baseShopVO.setstore_category(store_category);
		if(prod_category != null || prod_category != "") {
			baseShopVO.setprod_category(prod_category);
		}



		/** pageing start */
		baseShopVO.setPageUnit(8);
		baseShopVO.setPageSize(10); 
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(baseShopVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(baseShopVO.getPageUnit());
		paginationInfo.setPageSize(baseShopVO.getPageSize());

		baseShopVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		baseShopVO.setLastIndex(paginationInfo.getLastRecordIndex());
		baseShopVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

		// 전체갯수 구하기
		int ListCnt = baseShopService.get_site_prod_list_cnt(baseShopVO);
		paginationInfo.setTotalRecordCount(ListCnt);
		model.addAttribute("TotalCnt", ListCnt);
		model.addAttribute("paginationInfo", paginationInfo);
		
		// 해당페이지 시작번호를 구한다.
		int StartPageNumber = ListCnt - (baseShopVO.getPageUnit() * (baseShopVO.getPageIndex()-1)) + 1;
		model.addAttribute("StartPageNumber", StartPageNumber);
		/** paging end **/
		
		model.addAttribute("bestProdList", baseShopService.get_site_prod_list(baseShopVO));
		
		
		return "/baseScmtour/E_product/list";
	}
	
	
	
	//=========================================================
	// 상품상세
	//=========================================================
	@RequestMapping(value = "/detail_view.do")
	public String detail_view(
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
		
		return "/baseScmtour/E_product/detail_view";
	}

}
	
	
	//=========================================================
	// 기획전
	//=========================================================
	@RequestMapping(value = "/special.do")
	public String special(
			@ModelAttribute("BaseShopVO") BaseShopVO baseShopVO, 
			@ModelAttribute("BaseVO") BaseVO baseVO, 
			@ModelAttribute("BaseBoardVO") BaseBoardVO baseBoardVO,			
			ModelMap model, 
			HttpServletRequest request, 
			HttpServletResponse response
			
		)throws Exception {
		
		
		String searchKey = request.getParameter("searchKey");
		String searchKeyword= request.getParameter("searchKeyword");
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
		
		baseShopVO.setsearchKey(searchKey);
		baseShopVO.setsearchKeyword(searchKeyword);
		baseShopVO.setsearch_sql(search_sql);
		model.addAttribute("searchKey", searchKey);
		model.addAttribute("searchKeyword", searchKeyword);
		model.addAttribute("searchType", searchType);
				
		System.out.println("11111111111111111");
		String store_category = request.getParameter("store_category");
		store_category = "CD002004";
		System.out.println(store_category);
		model.addAttribute("store_category", store_category);
		
		
		String prod_category = request.getParameter("prod_category");
		prod_category = "CD005005";
		model.addAttribute("prod_category", prod_category);
		
		
		String orderby = request.getParameter("orderby");
		if(orderby == null || orderby == "") {
			orderby = "Recom";
		}		
		model.addAttribute("orderby", orderby);
		
		String prod_orderby  = request.getParameter("prod_orderby");
		if(prod_orderby == null || prod_orderby == "") {
			prod_orderby = "1";
		}
		model.addAttribute("prod_orderby", prod_orderby);		
		System.out.println("222222222222222222");
		// 베스트상품 구하기
		baseShopVO.setstore_category(store_category);
		if(prod_category != null || prod_category != "") {
			baseShopVO.setprod_category(prod_category);
		}



		/** pageing start */
		baseShopVO.setPageUnit(8);
		baseShopVO.setPageSize(10); 
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(baseShopVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(baseShopVO.getPageUnit());
		paginationInfo.setPageSize(baseShopVO.getPageSize());

		baseShopVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		baseShopVO.setLastIndex(paginationInfo.getLastRecordIndex());
		baseShopVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

		// 전체갯수 구하기
		int ListCnt = baseShopService.get_site_prod_list_cnt_special(baseShopVO);
		paginationInfo.setTotalRecordCount(ListCnt);
		model.addAttribute("TotalCnt", ListCnt);
		model.addAttribute("paginationInfo", paginationInfo);
		
		// 해당페이지 시작번호를 구한다.
		int StartPageNumber = ListCnt - (baseShopVO.getPageUnit() * (baseShopVO.getPageIndex()-1)) + 1;
		model.addAttribute("StartPageNumber", StartPageNumber);
		/** paging end **/
		
		model.addAttribute("bestProdList_sp", baseShopService.get_site_prod_list_special(baseShopVO));
				
		
		
		//인덱스 배너정보 가져오기 4
		baseBoardVO.setsql_limit(1);
		baseBoardVO.setbanner_zone_2("Y");
		baseBoardVO.setseq_nm(18);
		model.addAttribute("banner2List_4", baseBoardService.get_index_banner(baseBoardVO));
		
		
		
		
		return "/baseScmtour/E_product/special";
	}	
	

	//=========================================================
		// 상품리스트(건강식품)
		//=========================================================
		@RequestMapping(value = "/h_list.do")
		public String h_list(
				@ModelAttribute("BaseShopVO") BaseShopVO baseShopVO, 
				@ModelAttribute("BaseVO") BaseVO baseVO, 
				@ModelAttribute("BaseBoardVO") BaseBoardVO baseBoardVO,			
				ModelMap model, 
				HttpServletRequest request, 
				HttpServletResponse response
				
			)throws Exception {
			
			
			String searchKey = request.getParameter("searchKey");
			String searchKeyword= request.getParameter("searchKeyword");
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
			
			baseShopVO.setsearchKey(searchKey);
			baseShopVO.setsearchKeyword(searchKeyword);
			baseShopVO.setsearch_sql(search_sql);
			model.addAttribute("searchKey", searchKey);
			model.addAttribute("searchKeyword", searchKeyword);
			model.addAttribute("searchType", searchType);
					
			System.out.println("11111111111111111");
			String store_category = request.getParameter("store_category");
			store_category = "CD002004";
			System.out.println(store_category);
			model.addAttribute("store_category", store_category);
			
			
			String prod_category = request.getParameter("prod_category");
			prod_category = "CD005001";
			model.addAttribute("prod_category", prod_category);
			
			
			String orderby = request.getParameter("orderby");
			if(orderby == null || orderby == "") {
				orderby = "Recom";
			}		
			model.addAttribute("orderby", orderby);
			
			String prod_orderby  = request.getParameter("prod_orderby");
			if(prod_orderby == null || prod_orderby == "") {
				prod_orderby = "1";
			}
			model.addAttribute("prod_orderby", prod_orderby);		
			System.out.println("222222222222222222");
			// 베스트상품 구하기
			baseShopVO.setstore_category(store_category);
			if(prod_category != null || prod_category != "") {
				baseShopVO.setprod_category(prod_category);
			}



			/** pageing start */
			baseShopVO.setPageUnit(8);
			baseShopVO.setPageSize(10); 
			PaginationInfo paginationInfo = new PaginationInfo();
			paginationInfo.setCurrentPageNo(baseShopVO.getPageIndex());
			paginationInfo.setRecordCountPerPage(baseShopVO.getPageUnit());
			paginationInfo.setPageSize(baseShopVO.getPageSize());

			baseShopVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
			baseShopVO.setLastIndex(paginationInfo.getLastRecordIndex());
			baseShopVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

			// 전체갯수 구하기
			int ListCnt = baseShopService.get_site_prod_list_cnt_special(baseShopVO);
			paginationInfo.setTotalRecordCount(ListCnt);
			model.addAttribute("TotalCnt", ListCnt);
			model.addAttribute("paginationInfo", paginationInfo);
			
			// 해당페이지 시작번호를 구한다.
			int StartPageNumber = ListCnt - (baseShopVO.getPageUnit() * (baseShopVO.getPageIndex()-1)) + 1;
			model.addAttribute("StartPageNumber", StartPageNumber);
			/** paging end **/
			
			model.addAttribute("ProdList", baseShopService.get_site_prod_list_special(baseShopVO));
					

			
			
			return "/baseScmtour/E_product/h_list";
		}	
		
		
	//=========================================================
		// 상품리스트(푸드케어)
		//=========================================================
		@RequestMapping(value = "/f_list.do")
		public String food_list(
				@ModelAttribute("BaseShopVO") BaseShopVO baseShopVO, 
				@ModelAttribute("BaseVO") BaseVO baseVO, 
				@ModelAttribute("BaseBoardVO") BaseBoardVO baseBoardVO,			
				ModelMap model, 
				HttpServletRequest request, 
				HttpServletResponse response
				
			)throws Exception {
			
			
			String searchKey = request.getParameter("searchKey");
			String searchKeyword= request.getParameter("searchKeyword");
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
			
			baseShopVO.setsearchKey(searchKey);
			baseShopVO.setsearchKeyword(searchKeyword);
			baseShopVO.setsearch_sql(search_sql);
			model.addAttribute("searchKey", searchKey);
			model.addAttribute("searchKeyword", searchKeyword);
			model.addAttribute("searchType", searchType);
					
			System.out.println("11111111111111111");
			String store_category = request.getParameter("store_category");
			store_category = "CD002004";
			System.out.println(store_category);
			model.addAttribute("store_category", store_category);
			
			
			String prod_category = request.getParameter("prod_category");
			prod_category = "CD005002";
			model.addAttribute("prod_category", prod_category);
			
			
			String orderby = request.getParameter("orderby");
			if(orderby == null || orderby == "") {
				orderby = "Recom";
			}		
			model.addAttribute("orderby", orderby);
			
			String prod_orderby  = request.getParameter("prod_orderby");
			if(prod_orderby == null || prod_orderby == "") {
				prod_orderby = "1";
			}
			model.addAttribute("prod_orderby", prod_orderby);		
			System.out.println("222222222222222222");
			// 베스트상품 구하기
			baseShopVO.setstore_category(store_category);
			if(prod_category != null || prod_category != "") {
				baseShopVO.setprod_category(prod_category);
			}



			/** pageing start */
			baseShopVO.setPageUnit(8);
			baseShopVO.setPageSize(10); 
			PaginationInfo paginationInfo = new PaginationInfo();
			paginationInfo.setCurrentPageNo(baseShopVO.getPageIndex());
			paginationInfo.setRecordCountPerPage(baseShopVO.getPageUnit());
			paginationInfo.setPageSize(baseShopVO.getPageSize());

			baseShopVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
			baseShopVO.setLastIndex(paginationInfo.getLastRecordIndex());
			baseShopVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

			// 전체갯수 구하기
			int ListCnt = baseShopService.get_site_prod_list_cnt_special(baseShopVO);
			paginationInfo.setTotalRecordCount(ListCnt);
			model.addAttribute("TotalCnt", ListCnt);
			model.addAttribute("paginationInfo", paginationInfo);
			
			// 해당페이지 시작번호를 구한다.
			int StartPageNumber = ListCnt - (baseShopVO.getPageUnit() * (baseShopVO.getPageIndex()-1)) + 1;
			model.addAttribute("StartPageNumber", StartPageNumber);
			/** paging end **/
			
			model.addAttribute("ProdList", baseShopService.get_site_prod_list_special(baseShopVO));
					

			
			
			return "/baseScmtour/E_product/f_list";
		}	
		
		//=========================================================
		// 상품리스트(헬스&바디케어)
		//=========================================================
		@RequestMapping(value = "/b_list.do")
		public String b_list(
				@ModelAttribute("BaseShopVO") BaseShopVO baseShopVO, 
				@ModelAttribute("BaseVO") BaseVO baseVO, 
				@ModelAttribute("BaseBoardVO") BaseBoardVO baseBoardVO,			
				ModelMap model, 
				HttpServletRequest request, 
				HttpServletResponse response
				
			)throws Exception {
			
			
			String searchKey = request.getParameter("searchKey");
			String searchKeyword= request.getParameter("searchKeyword");
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
			
			baseShopVO.setsearchKey(searchKey);
			baseShopVO.setsearchKeyword(searchKeyword);
			baseShopVO.setsearch_sql(search_sql);
			model.addAttribute("searchKey", searchKey);
			model.addAttribute("searchKeyword", searchKeyword);
			model.addAttribute("searchType", searchType);
					
			System.out.println("11111111111111111");
			String store_category = request.getParameter("store_category");
			store_category = "CD002004";
			System.out.println(store_category);
			model.addAttribute("store_category", store_category);
			
			
			String prod_category = request.getParameter("prod_category");
			prod_category = "CD005003";
			model.addAttribute("prod_category", prod_category);
			
			
			String orderby = request.getParameter("orderby");
			if(orderby == null || orderby == "") {
				orderby = "Recom";
			}		
			model.addAttribute("orderby", orderby);
			
			String prod_orderby  = request.getParameter("prod_orderby");
			if(prod_orderby == null || prod_orderby == "") {
				prod_orderby = "1";
			}
			model.addAttribute("prod_orderby", prod_orderby);		
			System.out.println("222222222222222222");
			// 베스트상품 구하기
			baseShopVO.setstore_category(store_category);
			if(prod_category != null || prod_category != "") {
				baseShopVO.setprod_category(prod_category);
			}



			/** pageing start */
			baseShopVO.setPageUnit(8);
			baseShopVO.setPageSize(10); 
			PaginationInfo paginationInfo = new PaginationInfo();
			paginationInfo.setCurrentPageNo(baseShopVO.getPageIndex());
			paginationInfo.setRecordCountPerPage(baseShopVO.getPageUnit());
			paginationInfo.setPageSize(baseShopVO.getPageSize());

			baseShopVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
			baseShopVO.setLastIndex(paginationInfo.getLastRecordIndex());
			baseShopVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

			// 전체갯수 구하기
			int ListCnt = baseShopService.get_site_prod_list_cnt_special(baseShopVO);
			paginationInfo.setTotalRecordCount(ListCnt);
			model.addAttribute("TotalCnt", ListCnt);
			model.addAttribute("paginationInfo", paginationInfo);
			
			// 해당페이지 시작번호를 구한다.
			int StartPageNumber = ListCnt - (baseShopVO.getPageUnit() * (baseShopVO.getPageIndex()-1)) + 1;
			model.addAttribute("StartPageNumber", StartPageNumber);
			/** paging end **/
			
			model.addAttribute("ProdList", baseShopService.get_site_prod_list_special(baseShopVO));
					
			
			/*
			//인덱스 배너정보 가져오기 4
			baseBoardVO.setsql_limit(1);
			baseBoardVO.setbanner_zone_2("Y");
			baseBoardVO.setseq_nm(18);
			model.addAttribute("banner2List_4", baseBoardService.get_index_banner(baseBoardVO));			
			*/
			
			
			return "/baseScmtour/E_product/b_list";
		}	
		
		//=========================================================
		// 상품리스트(펫케어)
		//=========================================================
		@RequestMapping(value = "/p_list.do")
		public String p_list(
				@ModelAttribute("BaseShopVO") BaseShopVO baseShopVO, 
				@ModelAttribute("BaseVO") BaseVO baseVO, 
				@ModelAttribute("BaseBoardVO") BaseBoardVO baseBoardVO,			
				ModelMap model, 
				HttpServletRequest request, 
				HttpServletResponse response
				
			)throws Exception {
			
			
			String searchKey = request.getParameter("searchKey");
			String searchKeyword= request.getParameter("searchKeyword");
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
			
			baseShopVO.setsearchKey(searchKey);
			baseShopVO.setsearchKeyword(searchKeyword);
			baseShopVO.setsearch_sql(search_sql);
			model.addAttribute("searchKey", searchKey);
			model.addAttribute("searchKeyword", searchKeyword);
			model.addAttribute("searchType", searchType);
					
			System.out.println("11111111111111111");
			String store_category = request.getParameter("store_category");
			store_category = "CD002004";
			System.out.println(store_category);
			model.addAttribute("store_category", store_category);
			
			
			String prod_category = request.getParameter("prod_category");
			prod_category = "CD005004";
			model.addAttribute("prod_category", prod_category);
			
			
			String orderby = request.getParameter("orderby");
			if(orderby == null || orderby == "") {
				orderby = "Recom";
			}		
			model.addAttribute("orderby", orderby);
			
			String prod_orderby  = request.getParameter("prod_orderby");
			if(prod_orderby == null || prod_orderby == "") {
				prod_orderby = "1";
			}
			model.addAttribute("prod_orderby", prod_orderby);		
			System.out.println("222222222222222222");
			// 베스트상품 구하기
			baseShopVO.setstore_category(store_category);
			if(prod_category != null || prod_category != "") {
				baseShopVO.setprod_category(prod_category);
			}



			/** pageing start */
			baseShopVO.setPageUnit(8);
			baseShopVO.setPageSize(10); 
			PaginationInfo paginationInfo = new PaginationInfo();
			paginationInfo.setCurrentPageNo(baseShopVO.getPageIndex());
			paginationInfo.setRecordCountPerPage(baseShopVO.getPageUnit());
			paginationInfo.setPageSize(baseShopVO.getPageSize());

			baseShopVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
			baseShopVO.setLastIndex(paginationInfo.getLastRecordIndex());
			baseShopVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

			// 전체갯수 구하기
			int ListCnt = baseShopService.get_site_prod_list_cnt_special(baseShopVO);
			paginationInfo.setTotalRecordCount(ListCnt);
			model.addAttribute("TotalCnt", ListCnt);
			model.addAttribute("paginationInfo", paginationInfo);
			
			// 해당페이지 시작번호를 구한다.
			int StartPageNumber = ListCnt - (baseShopVO.getPageUnit() * (baseShopVO.getPageIndex()-1)) + 1;
			model.addAttribute("StartPageNumber", StartPageNumber);
			/** paging end **/
			
			model.addAttribute("ProdList", baseShopService.get_site_prod_list_special(baseShopVO));
					
			
			/*
			//인덱스 배너정보 가져오기 4
			baseBoardVO.setsql_limit(1);
			baseBoardVO.setbanner_zone_2("Y");
			baseBoardVO.setseq_nm(18);
			model.addAttribute("banner2List_4", baseBoardService.get_index_banner(baseBoardVO));
			*/
			
			
			
			return "/baseScmtour/E_product/p_list";
		}	
				
	//=========================================================
	// Index AjaxLoad
	//=========================================================
	@RequestMapping(value = "/Ajax/indexLoad.do")
	public String basAjaxindexLoad(
			@ModelAttribute("BaseIndexVO") BaseIndexVO baseIndexVO, 
			@ModelAttribute("BaseShopVO") BaseShopVO baseShopVO, 
			@ModelAttribute("BaseBoardVO") BaseBoardVO baseBoardVO, 
			ModelMap model, 
			HttpServletRequest request, 
			HttpServletResponse response
			) throws Exception {
		
		HttpSession session = request.getSession(true);
		String user_id = (String) session.getAttribute("user_id");
		String object = request.getParameter("object");
		
		String inc_file = "";
		switch(object) {
			case "main_visual" :
				baseBoardVO.setsql_limit(10);
				model.addAttribute("mainSlideList", baseBoardService.get_main_slide(baseBoardVO));
				inc_file = "index_main_slide"; break;
			case "mainWeekscCourse_content" :
				baseShopVO.setsql_limit(10);
				baseShopVO.setstore_category("CD002005");
				model.addAttribute("recomTravelList", baseShopService.get_site_main_prod_list_recom_travel(baseShopVO));
				inc_file = "index_recom_course"; 
				break;
			case "mainPromotion" : 
				baseBoardVO.setbbs_id("event");
				baseBoardVO.setsql_limit(10);
				model.addAttribute("promotionList", baseBoardService.get_bbs_promotion(baseBoardVO));
				inc_file = "index_promotion"; 
				break;
			case "mainProduct_001" : 
				baseBoardVO.setstore_category("CD002001");
				baseBoardVO.setsql_limit(15);
				model.addAttribute("weekList1", baseBoardService.get_week(baseBoardVO));
				inc_file = "index_prod_001"; 
				break;
			case "mainProduct_002" : 
				baseBoardVO.setstore_category("CD002002");
				baseBoardVO.setsql_limit(15);
				model.addAttribute("weekList2", baseBoardService.get_week(baseBoardVO));
				inc_file = "index_prod_002"; 
				break;
			case "mainProduct_003" : 
				baseBoardVO.setstore_category("CD002003");
				baseBoardVO.setsql_limit(15);
				model.addAttribute("weekList3", baseBoardService.get_week(baseBoardVO));
				inc_file = "index_prod_003"; 
				break;
			case "mainProduct_004" : 
				baseBoardVO.setstore_category("CD002004");
				baseBoardVO.setsql_limit(15);
				model.addAttribute("weekList4", baseBoardService.get_week(baseBoardVO));
				inc_file = "index_prod_004"; 
				break;
			case "mainTravelProduct" : 
				baseBoardVO.setstore_category("CD002001");
				baseBoardVO.setsql_limit(30);
				model.addAttribute("mainItem1List", baseBoardService.get_main_item(baseBoardVO));
				inc_file = "index_mainitem_001"; 
				break;
			case "mainRoomProduct" : 
				baseBoardVO.setstore_category("CD002002");
				baseBoardVO.setsql_limit(30);
				model.addAttribute("mainItem2List", baseBoardService.get_main_item(baseBoardVO));
				inc_file = "index_mainitem_002"; 
				break;
			case "mainFoodProduct" : 
				baseBoardVO.setstore_category("CD002003");
				baseBoardVO.setsql_limit(30);
				model.addAttribute("mainItem3List", baseBoardService.get_main_item(baseBoardVO));
				inc_file = "index_mainitem_003"; 
				break;
			case "mainMarketProduct" : 
				baseBoardVO.setstore_category("CD002004");
				baseBoardVO.setsql_limit(30);
				model.addAttribute("mainItem4List", baseBoardService.get_main_item(baseBoardVO));
				inc_file = "index_mainitem_004"; 
				break;
		}
		
		return "/baseScmtour/AjaxResult/"+inc_file;
	}

	
	
	

			
	//=========================================================
	// 내주변
	//=========================================================
	@RequestMapping(value = "/extention/myPlace.do")
	public String extentionmyPlace(
			@ModelAttribute("BaseIndexVO") BaseIndexVO baseIndexVO, 
			ModelMap model, 
			HttpServletRequest request, 
			HttpServletResponse response
		) throws Exception {

		HttpSession session = request.getSession(true);
		String user_id = (String) session.getAttribute("user_id");

		// 나의 GPS좌표 체크
		String strlat = request.getParameter("lat");
		String strlng = request.getParameter("lng");
		
		Double lat = 0.0;
		Double lng = 0.0;
		String isGps = "N";
		
		if(strlat != null && strlat != "") {
			lat = Double.valueOf(strlat);
			lng = Double.valueOf(strlng);
			isGps = "Y";
			
		} else {
			//테스트상점 좌표 - 털보네횟집
			//lat =  36.1574069430194;
			//lng =  126.499390122401;
			isGps = "N";
			//isGps = "Y";	//주석처리한다.. 실제에선..
		}

		model.addAttribute("isGps", isGps);
		model.addAttribute("user_lat", lat);
		model.addAttribute("user_lng", lng);

		int mapsize = 100;
		String maptype = request.getParameter("map_type");
		String mapsizestr = request.getParameter("map_size");
		if(mapsizestr != null && mapsizestr != "") {
			mapsize = Integer.valueOf(mapsizestr);
		}
		baseIndexVO.setmap_type(maptype);
		baseIndexVO.setmap_size(mapsize);

		if("Y".equals(isGps)) {
			baseIndexVO.setuser_lat(lat);
			baseIndexVO.setuser_lng(lng);
			model.addAttribute("get_store_list", baseIndexService.get_gps_store_list(baseIndexVO));
		} else {
			model.addAttribute("get_store_list", null);
		}

		return "/baseScmtour/baseExtention/myPlace";
	}
	
	//=========================================================
	// 찜하기
	//=========================================================
	@RequestMapping(value = "/Ajax/prodPick.do")
	public String AjaxPick(
		@ModelAttribute("BaseIndexVO") BaseIndexVO baseIndexVO, 
		@ModelAttribute("BaseShopVO") BaseShopVO baseShopVO, 
		@ModelAttribute("BaseMemberVO") BaseMemberVO baseMemberVO, 
		ModelMap model, 
		HttpServletRequest request, 
		HttpServletResponse response
		) throws Exception {
		
		HttpSession session = request.getSession(true);
		String user_id = (String) session.getAttribute("user_id");
		System.out.println("1111111111111111111111");
		if(user_id == null || user_id == "" ) {
			return null;
		}  else {

			String prod_id = request.getParameter("prod_id");
			baseIndexVO.setuser_id(user_id);
			baseIndexVO.setprod_id(prod_id);
			System.out.println("222222222222222222222222222222");
			//기존여부를 체크한다.
			String action_mode = "insert";
			int prod_cnt = baseIndexService.pick_check(baseIndexVO);
			if(prod_cnt > 0) {
				action_mode = "delete";
			}
			System.out.println("33333333333333333333333333333");
			//기존상황에 따라 체크한다.
			baseShopVO.setprod_id(prod_id);
			if(action_mode.equals("insert")) {
				baseIndexService.insert_pick(baseIndexVO);
				baseShopService.pick_plus(baseShopVO);
				model.addAttribute("res","A");
			} else {
				baseIndexService.delete_pick(baseIndexVO);
				baseShopService.pick_minus(baseShopVO);
				model.addAttribute("res","D");
			}

		
			return "/baseScmtour/AjaxResult/prodPick";
		}
	}

	//=========================================================
	// Qna, 1:1문의 등 간단저장용
	//=========================================================
	@RequestMapping(value = "/Ajax/bbs_save.do")
	public String AjaxBbsSave(
		@ModelAttribute("BaseIndexVO") BaseIndexVO baseIndexVO, 
		@ModelAttribute("BaseBoardVO") BaseBoardVO baseBoardVO, 
		@ModelAttribute("BaseShopVO") BaseShopVO baseShopVO, 
		@ModelAttribute("BaseMemberVO") BaseMemberVO baseMemberVO, 
		ModelMap model, 
		HttpServletRequest request, 
		HttpServletResponse response
		) throws Exception {
		
		HttpSession session = request.getSession(true);
		String user_id = (String) session.getAttribute("user_id");
		
		if(user_id == null || user_id == "" ) {
			return null;
		}  else {
			
			//회원정보를 가져옴.
			baseMemberVO.setuser_id(user_id);
			BaseMemberVO memberInfo = baseMemberService.get_site_user_info(baseMemberVO);
			String user_nm = memberInfo.getuser_nm();
			String user_hp = memberInfo.getuser_hp();
			String user_email = memberInfo.getuser_email();
			
			//Qna , MtM 용
			String bbs_id = request.getParameter("bbs_id");
			String bbs_seq = request.getParameter("bbs_seq");
			String bbs_action = request.getParameter("bbs_action");
			String bbs_content = request.getParameter("content");
			String bbs_prod_id = request.getParameter("prod_id");
			String bbs_secure_st = request.getParameter("bbs_secure_st");
			String bbs_star = request.getParameter("star");
			if(bbs_secure_st == null || bbs_secure_st == "") {
				bbs_secure_st = "N";
			}
			
			baseBoardVO.setbbs_id(bbs_id);
			baseBoardVO.setbbs_seq(bbs_seq);
			baseBoardVO.setuser_id(user_id);
			
			if(!("delete").equals(bbs_action)) {
				baseBoardVO.setuser_nm(user_nm);
				baseBoardVO.setbbs_writer_nm(user_nm);
				baseBoardVO.setbbs_writer_hp(user_hp);
				baseBoardVO.setbbs_writer_email(user_email);
				
				baseBoardVO.setbbs_content( bbs_content);
				baseBoardVO.setbbs_notice_st("N");
				baseBoardVO.setbbs_secure_st(bbs_secure_st);
				baseBoardVO.setbbs_star(bbs_star);
				baseBoardVO.setbbs_prod_id(bbs_prod_id);
	
				//상품정보를 가져와서, 카테고리정보, 상점정보를 넣어준다.
				baseShopVO.setprod_id(bbs_prod_id);
				BaseShopVO prod_info = baseShopService.get_site_prod_info(baseShopVO);
				String get_store_category = prod_info.getstore_category();
				String get_store_id = prod_info.getstore_id();
				
				baseBoardVO.setbbs_store_id(get_store_id);
				baseBoardVO.setbbs_store_category(get_store_category);
			}
			
			String res = "S";
			if(bbs_seq == null || bbs_seq == "") {
				int insert_id  = baseBoardService.insert_site_bbs(baseBoardVO);
				if(insert_id <= 0) {
					res = "F";
				}
			} else {
				BaseBoardVO bbs_info = baseBoardService.get_site_bbs_info(baseBoardVO);
				String bbs_user_id = bbs_info.getuser_id();
				if(bbs_user_id.equals(user_id)) {
					if(("delete").equals(bbs_action)) {
						baseBoardVO.setdel_st("Y");
						baseBoardService.delete_site_bbs(baseBoardVO);
						res = "S";
					} else {
						baseBoardService.update_site_bbs(baseBoardVO);
						res = "S";
					}
				} else {
					res = "P";
				}
			}

			model.addAttribute("res", res);
			
			return "/baseScmtour/AjaxResult/saveBbs";
		}
	}
	
	//=========================================================
	// 찜하기
	//=========================================================
	@RequestMapping(value = "/info/perRule.do")
	public String perRule(
		@ModelAttribute("BaseIndexVO") BaseIndexVO baseIndexVO, 
		@ModelAttribute("BaseShopVO") BaseShopVO baseShopVO, 
		@ModelAttribute("BaseMemberVO") BaseMemberVO baseMemberVO, 
		@ModelAttribute("AdmgrConfigVO") AdmgrConfigVO admgrConfigVO, 
		ModelMap model, 
		HttpServletRequest request, 
		HttpServletResponse response
		) throws Exception {
		AdmgrConfigVO config = admgrConfigService.get_base_config(null);
		String perRule = config.getsite_personal();
		model.addAttribute("perRule", perRule);
		return "/baseScmtour/baseIncludes/perRule";
	}
	
	
	//=========================================================
	// 찜하기
	//=========================================================
	@RequestMapping(value = "/info/siteRule.do")
	public String siteRule(
		@ModelAttribute("BaseIndexVO") BaseIndexVO baseIndexVO, 
		@ModelAttribute("BaseShopVO") BaseShopVO baseShopVO, 
		@ModelAttribute("BaseMemberVO") BaseMemberVO baseMemberVO, 
		@ModelAttribute("AdmgrConfigVO") AdmgrConfigVO admgrConfigVO, 
		ModelMap model, 
		HttpServletRequest request, 
		HttpServletResponse response
		) throws Exception {
		AdmgrConfigVO config = admgrConfigService.get_base_config(null);
		String siteRule = config.getsite_use_rule();
		model.addAttribute("siteRule", siteRule);
		return "/baseScmtour/baseIncludes/siteRule";

	}
	
	
	//=========================================================
	// 게시판 데이터 가져오기 - ajax
	//=========================================================
	
	@RequestMapping(value = "/Ajax/get_ajax_bbs.do")
	public void BoardAjaxGet(
		@ModelAttribute("BaseBoardVO") BaseBoardVO baseBoardVO, 
		ModelMap model, 
		HttpServletRequest request, 
		HttpServletResponse response
		) throws Exception {
		
		String bbs_id = request.getParameter("bbs_id");
		String bbs_seq = request.getParameter("bbs_seq");
		baseBoardVO.setbbs_id(bbs_id);
		baseBoardVO.setbbs_seq(bbs_seq);
		BaseBoardVO bbs_info = baseBoardService.get_site_bbs_info(baseBoardVO);
		String bbs_subject = bbs_info.getbbs_subject();
		String bbs_content = bbs_info.getbbs_content();
		String bbs_star = bbs_info.getbbs_star();
		String bbs_secure_st = bbs_info.getbbs_secure_st();
		
		JSONObject data = new JSONObject();
		data.put("bbs_subject", bbs_subject);
		data.put("bbs_content", bbs_content);
		data.put("bbs_star", bbs_star);
		data.put("bbs_secure_st", bbs_secure_st);

		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println(data);
		out.flush();
		return;
		
	}
}
