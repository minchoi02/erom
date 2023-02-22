package egovframework.base.search.web;

import java.io.PrintWriter;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.base.search.service.BaseSearchService;
import egovframework.base.search.service.BaseSearchVO;
import egovframework.base.service.BaseService;
import egovframework.base.shop.service.BaseShopVO;

@Controller
public class BaseSearchController {

	@Resource(name = "BaseSearchService")
	private BaseSearchService baseSearchService;	
	
	@Resource(name = "BaseService")
	private BaseService baseService;	
	
	//=========================================================

	@RequestMapping(value = "/search/search.do")
	public String Searchsearch(
			@ModelAttribute("BaseSearchVO") BaseSearchVO baseSearchVO, 
			ModelMap model, 
			HttpServletRequest request, 
			HttpServletResponse response
		) throws Exception {
		
		HttpSession session = request.getSession(true);
		String user_id = (String) session.getAttribute("user_id");
		String sess_id = (String) session.getId();
		String user_ip = BaseService.getRemoteIP(request);
		
		model.addAttribute("user_id", user_id);
		model.addAttribute("sess_id", sess_id);
		model.addAttribute("user_ip", user_ip);
		
		baseSearchVO.setuser_id(user_id);
		baseSearchVO.setsess_id(sess_id);
		baseSearchVO.setremote_addr(user_ip);
		
		//내 검색어
		model.addAttribute("myKeywordList", baseSearchService.get_my_keyword(baseSearchVO));
		
		// 힛트 검색어
		model.addAttribute("bestKeywordList", baseSearchService.get_best_keyword(baseSearchVO));
		
		return "/baseScmtour/baseSearch/search";
	}	

	@RequestMapping(value = "/search/searchResult.do")
	public String SearchsearchResult(
		@ModelAttribute("BaseSearchVO") BaseSearchVO baseSearchVO, 
		@ModelAttribute("BaseShopVO") BaseShopVO baseShopVO, 
		ModelMap model, 
		HttpServletRequest request, 
		HttpServletResponse response
		) throws Exception {
		
		HttpSession session = request.getSession(true);
		String user_id = (String) session.getAttribute("user_id");
		String sess_id = (String) session.getId();
		String user_ip = BaseService.getRemoteIP(request);

		String searchKeyword = request.getParameter("searchKeyword");
		String searchType = "or";
		String search_sql = "";
		String searchTypeAdd = "";
		if(searchKeyword != null && searchKeyword != "") {
			String[] searchKeyword_arr = searchKeyword.split(" ");
			if(searchKeyword_arr.length == 1) {
				search_sql = "( REPLACE(PROD_NM,' ','') like '%"+searchKeyword+"%' or REPLACE(STORE_NM,' ','') like '%"+searchKeyword+"%' )";
			}
			else if(searchKeyword_arr.length > 1) {
				search_sql = "(";
				for(int i=0; i<searchKeyword_arr.length; i++) {
					if(i == 0) {
						searchTypeAdd = "";
					} else {
						searchTypeAdd = " " +searchType + " ";
					}
					search_sql += searchTypeAdd + "( REPLACE(PROD_NM,' ','')  like '%"+searchKeyword_arr[i]+"%' or REPLACE(STORE_NM,' ','') like '%"+searchKeyword+"%' ) ";
				}
				search_sql += ")";
			} else {
				search_sql = "";
			}
		}
		String store_category = request.getParameter("store_category");
		model.addAttribute("searchKeyword", searchKeyword);
		model.addAttribute("store_category", store_category);
		
		//넘어온 키워드 처리
		baseSearchVO.setuser_id(user_id);
		baseSearchVO.setsess_id(sess_id);
		baseSearchVO.setremote_addr(user_ip);
		baseSearchVO.setkeywords(searchKeyword);
		baseSearchVO.setsearch_sql(search_sql);
		//date 테이블처리
		baseSearchService.set_keyword(baseSearchVO);	
		
		//등록된 키워드가 있는지 체크한다.
		//hit 테이블처리
		int use_keyword = baseSearchService.search_keyword(baseSearchVO);
		if(use_keyword > 0) {
			// 키워드 삽입
			baseSearchService.update_keyword(baseSearchVO);
		} else {
			//키워드값 증가
			baseSearchService.insert_keyword(baseSearchVO);			
		}
		

		baseSearchVO.setsearchKeyword(searchKeyword);
		if(store_category == null || store_category == "") {
			baseSearchVO.setstore_category("CD002001");		//체험관광
			model.addAttribute("category1List", baseSearchService.get_search_prod_limit(baseSearchVO));

			baseSearchVO.setstore_category("CD002002");		//숙박
			model.addAttribute("category2List", baseSearchService.get_search_prod_limit(baseSearchVO));

			baseSearchVO.setstore_category("CD002003");		//음식
			model.addAttribute("category3List", baseSearchService.get_search_prod_limit(baseSearchVO));

			baseSearchVO.setstore_category("CD002004");		//장터
			model.addAttribute("category4List", baseSearchService.get_search_prod_limit(baseSearchVO));

			baseSearchVO.setstore_category("CD002005");		//추천관광
			model.addAttribute("category5List", baseSearchService.get_search_prod_limit(baseSearchVO));
		} else {
			/*
			baseSearchVO.setsql_start(StartPage);
			baseSearchVO.setsql_limit(Integer.parseInt(pagePerCnt));
			baseSearchVO.setstore_category(store_category);
			model.addAttribute("category1List", baseSearchService.get_search_prod_list(baseSearchVO));
			model.addAttribute("TotalCnt", baseSearchService.get_search_prod_list_cnt(baseSearchVO));
			*/
		}
		return "/baseScmtour/baseSearch/searchResult";
		
	}	

	
	@RequestMapping(value = "/Ajax/itemSearchList.do")
	public String itemSearchList(
		@ModelAttribute("BaseSearchVO") BaseSearchVO baseSearchVO, 
		@ModelAttribute("BaseShopVO") BaseShopVO baseShopVO, 
		ModelMap model, 
		HttpServletRequest request, 
		HttpServletResponse response
		) throws Exception {
		
		HttpSession session = request.getSession(true);
		String user_id = (String) session.getAttribute("user_id");
		String sess_id = (String) session.getId();
		String user_ip = BaseService.getRemoteIP(request);

		String searchKeyword = request.getParameter("searchKeyword");
		if(searchKeyword == null || searchKeyword == "") {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('검색어를 입력하셔야 합니다.'); history.back(); </script>");
			out.flush();
			return null;
		}
		String searchKey = "PROD_NM";
		String searchType = "or";
		String search_sql = "";
		String searchTypeAdd = "";
		if(searchKeyword != null && searchKeyword != "") {
			String[] searchKeyword_arr = searchKeyword.split(" ");
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
		model.addAttribute("searchKeyword", searchKeyword);
		model.addAttribute("store_category", store_category);
		
		String pageNum = request.getParameter("pageNum");
		String pagePerCnt = request.getParameter("pagePerCnt");

		int StartPage = Integer.parseInt(pageNum) * Integer.parseInt(pagePerCnt); 
		baseShopVO.setsql_start(StartPage);
		baseShopVO.setsql_limit(Integer.parseInt(pagePerCnt));
		
		int LastNum = StartPage + Integer.parseInt(pagePerCnt);
		model.addAttribute("LastNum", LastNum);
		
		//넘어온 키워드 처리
		baseSearchVO.setuser_id(user_id);
		baseSearchVO.setsess_id(sess_id);
		baseSearchVO.setremote_addr(user_ip);
		baseSearchVO.setkeywords(searchKeyword);
		//date 테이블처리
		baseSearchService.set_keyword(baseSearchVO);	
		
		//등록된 키워드가 있는지 체크한다.
		//hit 테이블처리
		int use_keyword = baseSearchService.search_keyword(baseSearchVO);
		if(use_keyword > 0) {
			// 키워드 삽입
			baseSearchService.update_keyword(baseSearchVO);
		} else {
			//키워드값 증가
			baseSearchService.insert_keyword(baseSearchVO);			
		}
		

		baseSearchVO.setsearchKeyword(searchKeyword);
		baseSearchVO.setsql_start(StartPage);
		baseSearchVO.setsql_limit(Integer.parseInt(pagePerCnt));
		baseSearchVO.setstore_category(store_category);
		baseSearchVO.setsearch_sql(search_sql);
		model.addAttribute("categoryList", baseSearchService.get_search_prod_list(baseSearchVO));
		model.addAttribute("TotalCnt", baseSearchService.get_search_prod_list_cnt(baseSearchVO));

		return "/baseScmtour/AjaxResult/AjaxItemSearchList";
		
	}	

}