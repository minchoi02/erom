package egovframework.admgrProduct.web;
import java.io.PrintWriter;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.logging.log4j.util.Strings;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ibm.icu.text.SimpleDateFormat;
import com.ibm.icu.util.Calendar;

import antlr.collections.List;
import egovframework.admgrConfig.service.AdmgrConfigService;
import egovframework.admgrConfig.service.AdmgrConfigVO;
import egovframework.admgrMember.service.AdmgrMemberVO;
import egovframework.admgrProduct.service.AdmgrProductService;
import egovframework.admgrProduct.service.AdmgrProductVO;
import egovframework.admgrStore.service.AdmgrStoreService;
import egovframework.admgrStore.service.AdmgrStoreVO;
import egovframework.base.service.BaseService;
import egovframework.base.service.BaseVO;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
public class AdmgrProductController {

	@Resource(name = "AdmgrProductService")
	private AdmgrProductService admgrProductService;	
	
	@Resource(name = "AdmgrStoreService")
	private AdmgrStoreService admgrStoreService;	
	
	@Resource(name = "AdmgrConfigService")
	private AdmgrConfigService admgrConfigService;	
	
	@Resource(name = "BaseService")
	private BaseService baseService;	
	
	//===============================================================================================================
	// *  상품목록
	//===============================================================================================================
	@RequestMapping(value = "/admgr/admgrProduct/productList.do")
	public String admgrproductList(
		@ModelAttribute("AdmgrProductVO") AdmgrProductVO admgrProductVO,
		@ModelAttribute("admgrMemberVO") AdmgrMemberVO admgrMemberVO, 
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
			
			String store_category = request.getParameter("store_category");
			model.addAttribute("store_category", store_category);
			
			if(store_category == null || store_category == "") {
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>alert('상품기본 카테고리 값이 필요합니다.'); history.back(); </script>");
				out.flush();
				return null;
			} else {
				
				if(adminLevel.equals("5")) {
					admgrProductVO.setuser_id(adminId);
				}
				
				String include_file = "";
				switch(store_category) {
					/*case "CD002001" :  
						include_file = "/admgr/admgrProduct/productTravel";
						break;
					case "CD002002" :  
						include_file = "/admgr/admgrProduct/productRoom";
						break;
					case "CD002003" :  
						include_file = "/admgr/admgrProduct/productFood";
						break;
						*/
					case "CD002004" :  
						include_file = "/admgr/admgrProduct/productMarket";
						break;
					/*case "CD002005" :  
						include_file =  "/admgr/admgrProduct/productCourse";
						break;
						*/
				}
				
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

				admgrProductVO.setsearchKey(searchKey);
				admgrProductVO.setsearchKeyword(searchKeyword);
				admgrProductVO.setsearch_sql(search_sql);
				model.addAttribute("searchKey", searchKey);
				model.addAttribute("searchKeyword", searchKeyword);
				model.addAttribute("searchType", searchType);
				
				/** pageing start */
				admgrProductVO.setPageUnit(15);
				admgrProductVO.setPageSize(10); 
				PaginationInfo paginationInfo = new PaginationInfo();
				paginationInfo.setCurrentPageNo(admgrProductVO.getPageIndex());
				paginationInfo.setRecordCountPerPage(admgrProductVO.getPageUnit());
				paginationInfo.setPageSize(admgrProductVO.getPageSize());
		
				admgrProductVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
				admgrProductVO.setLastIndex(paginationInfo.getLastRecordIndex());
				admgrProductVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

				// 전체갯수 구하기
				int ListCnt = admgrProductService.get_product_list_cnt(admgrProductVO);
				paginationInfo.setTotalRecordCount(ListCnt);
				model.addAttribute("TotalCnt", ListCnt);
				model.addAttribute("paginationInfo", paginationInfo);
				
				// 해당페이지 시작번호를 구한다.
				int StartPageNumber = ListCnt - (admgrProductVO.getPageUnit() * (admgrProductVO.getPageIndex()-1)) + 1;
				model.addAttribute("StartPageNumber", StartPageNumber);
				/** paging end **/
				
				admgrProductVO.setstore_category(store_category);
				if(store_category.equals("CD002005")) {
					model.addAttribute("prodList", admgrProductService.get_product_list_recom_travel(admgrProductVO));
				} else {
					model.addAttribute("prodList", admgrProductService.get_product_list(admgrProductVO));
				}
				
				return include_file;
			}
		
		}
	}

	//===============================================================================================================
	// *  상품정렬 목록
	//===============================================================================================================
	@RequestMapping(value = "/admgr/admgrProduct/productOrderbyList.do")
	public String admgrproductOerbyList(
		@ModelAttribute("AdmgrProductVO") AdmgrProductVO admgrProductVO,
		@ModelAttribute("admgrMemberVO") AdmgrMemberVO admgrMemberVO, 
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
			
			String store_category = request.getParameter("store_category");
			model.addAttribute("store_category", store_category);
			
			String prod_category = request.getParameter("prod_category");
			model.addAttribute("prod_category", prod_category);
			
			System.out.println(store_category);
			System.out.println(store_category);
			System.out.println(store_category);
			System.out.println(store_category);
			if(store_category == null || store_category == "") {
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>alert('상품기본 카테고리 값이 필요합니다.'); history.back(); </script>");
				out.flush();
				return null;
			} else {
				
				if(adminLevel.equals("5")) {
					admgrProductVO.setuser_id(adminId);
				}
				
				String searchKey = request.getParameter("searchKey");
				String searchKeyword= request.getParameter("searchKeyword");
				String searchType = request.getParameter("searchType");
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

				admgrProductVO.setsearchKey(searchKey);
				admgrProductVO.setsearchKeyword(searchKeyword);
				admgrProductVO.setsearch_sql(search_sql);
				model.addAttribute("searchKey", searchKey);
				model.addAttribute("searchKeyword", searchKeyword);
				model.addAttribute("searchType", searchType);
				
				/** pageing start */
				admgrProductVO.setPageUnit(15);
				admgrProductVO.setPageSize(10); 
				PaginationInfo paginationInfo = new PaginationInfo();
				paginationInfo.setCurrentPageNo(admgrProductVO.getPageIndex());
				paginationInfo.setRecordCountPerPage(admgrProductVO.getPageUnit());
				paginationInfo.setPageSize(admgrProductVO.getPageSize());
		
				admgrProductVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
				admgrProductVO.setLastIndex(paginationInfo.getLastRecordIndex());
				admgrProductVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

				// 전체갯수 구하기
				int ListCnt = admgrProductService.get_product_list_cnt(admgrProductVO);
				paginationInfo.setTotalRecordCount(ListCnt);
				model.addAttribute("TotalCnt", ListCnt);
				model.addAttribute("paginationInfo", paginationInfo);
				
				// 해당페이지 시작번호를 구한다.
				int StartPageNumber = ListCnt - (admgrProductVO.getPageUnit() * (admgrProductVO.getPageIndex()-1)) + 1;
				model.addAttribute("StartPageNumber", StartPageNumber);
				/** paging end **/
				
				admgrProductVO.setstore_category(store_category);
				//admgrProductVO.setprod_use_st("Y"); 진열관리에서 상품 판매중,판매종료 상관없이 나오도록

				if(store_category.equals("CD002005")) {
					model.addAttribute("prodList", admgrProductService.get_product_list_recom_travel(admgrProductVO));
				} else {
					model.addAttribute("prodList", admgrProductService.get_product_list(admgrProductVO));
				}
				
				return "/admgr/admgrProduct/productOrderbyList";
			}
		
		}
	}
	
	//===============================================================================================================
		// *  상품정렬 목록 저장
		//===============================================================================================================
		@RequestMapping(value = "/admgr/admgrProduct/productOrderbySave.do")
		public void admgrproductOerbySave(
			@ModelAttribute("AdmgrProductVO") AdmgrProductVO admgrProductVO,
			@ModelAttribute("admgrMemberVO") AdmgrMemberVO admgrMemberVO, 
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
				
				String pageIndex = request.getParameter("pageIndex");
				model.addAttribute("pageIndex", pageIndex);
				
				String store_category = request.getParameter("store_category");
				model.addAttribute("store_category", store_category);
				
				String prod_category = request.getParameter("prod_category");
				model.addAttribute("prod_category", prod_category);
				
				String prod_seq = request.getParameter("prod_seq");
				model.addAttribute("prod_seq", prod_seq);
				
				String prod_id = request.getParameter("prod_id");
				model.addAttribute("prod_id", prod_id);
				
				String searchKey = request.getParameter("searchKey");
				model.addAttribute("searchKey", searchKey);

				String searchKeyword = request.getParameter("searchKeyword");
				model.addAttribute("searchKeyword", searchKeyword);
				
				String prod_use_st = request.getParameter("prod_use_st");
				if(prod_use_st == null || prod_use_st == "") {
					prod_use_st = "Y";
				}
				model.addAttribute("prod_use_st", prod_use_st);
				
				String prod_use_pay_st = request.getParameter("prod_use_pay_st");
				if(prod_use_pay_st == null || prod_use_pay_st == "") {
					prod_use_pay_st = "N";
				}
				model.addAttribute("prod_use_pay_st", prod_use_pay_st);
				
				String prod_orderby  = request.getParameter("prod_orderby");
				if(prod_orderby == null || prod_orderby == "") {
					prod_orderby = "1";
				}
				model.addAttribute("prod_orderby", prod_orderby);
				
				admgrProductVO.setprod_use_st(prod_use_st);
				admgrProductVO.setprod_use_pay_st(prod_use_pay_st);
				admgrProductVO.setprod_orderby(prod_orderby);
				admgrProductVO.setprod_seq(prod_seq);
				admgrProductService.product_orderby_update(admgrProductVO);
				
				if(store_category == "CD002004") {
					response.setContentType("text/html; charset=UTF-8");
					PrintWriter out = response.getWriter();
					out.println("<script>alert('수정되었습니다.'); location.replace('/admgr/admgrProduct/productOrderbyList.do?pageIndex="+pageIndex+"&store_category="+store_category+"&prod_category="+prod_category+"&searchKey="+searchKey+"&searchKeyword="+searchKeyword+"'); </script>");
					out.flush();
					return;
				} else {
					response.setContentType("text/html; charset=UTF-8");
					PrintWriter out = response.getWriter();
					out.println("<script>alert('수정되었습니다.'); location.replace('/admgr/admgrProduct/productOrderbyList.do?pageIndex="+pageIndex+"&store_category="+store_category+"&searchKey="+searchKey+"&searchKeyword="+searchKeyword+"'); </script>");
					out.flush();
					return;
				}
			}
		}

	//===============================================================================================================
	// *  상품판매종료 목록
	//===============================================================================================================
	@RequestMapping(value = "/admgr/admgrProduct/productEndList.do")
	public String admgrproductEndList(
		@ModelAttribute("AdmgrProductVO") AdmgrProductVO admgrProductVO,
		@ModelAttribute("admgrMemberVO") AdmgrMemberVO admgrMemberVO, 
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
				admgrProductVO.setuser_id(adminId);
			}

			String store_category = request.getParameter("store_category");
			model.addAttribute("store_category", store_category);
			
			if(store_category == null || store_category == "") {
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>alert('상품기본 카테고리 값이 필요합니다.'); history.back(); </script>");
				out.flush();
				return null;
			} else {
				
				String searchKey = request.getParameter("searchKey");
				String searchKeyword= request.getParameter("searchKeyword");
				String searchType = request.getParameter("searchType");
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
				admgrProductVO.setsearchKey(searchKey);
				admgrProductVO.setsearchKeyword(searchKeyword);
				admgrProductVO.setsearch_sql(search_sql);
				model.addAttribute("searchKey", searchKey);
				model.addAttribute("searchKeyword", searchKeyword);
				model.addAttribute("searchType", searchType);
				
				/** pageing start */
				admgrProductVO.setPageUnit(100);
				admgrProductVO.setPageSize(10); 
				PaginationInfo paginationInfo = new PaginationInfo();
				paginationInfo.setCurrentPageNo(admgrProductVO.getPageIndex());
				paginationInfo.setRecordCountPerPage(admgrProductVO.getPageUnit());
				paginationInfo.setPageSize(admgrProductVO.getPageSize());
		
				admgrProductVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
				admgrProductVO.setLastIndex(paginationInfo.getLastRecordIndex());
				admgrProductVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

				// 전체갯수 구하기
				int ListCnt = admgrProductService.get_product_list_cnt(admgrProductVO);
				paginationInfo.setTotalRecordCount(ListCnt);
				model.addAttribute("TotalCnt", ListCnt);
				model.addAttribute("paginationInfo", paginationInfo);
				
				// 해당페이지 시작번호를 구한다.
				int StartPageNumber = ListCnt - (admgrProductVO.getPageUnit() * (admgrProductVO.getPageIndex()-1)) + 1;
				model.addAttribute("StartPageNumber", StartPageNumber);
				/** paging end **/
				
				admgrProductVO.setstore_category(store_category);
				admgrProductVO.setprod_use_st("N");

				if(store_category.equals("CD002005")) {
					model.addAttribute("prodList", admgrProductService.get_product_list_recom_travel(admgrProductVO));
				} else {
					model.addAttribute("prodList", admgrProductService.get_product_list(admgrProductVO));
				}
				
				return "/admgr/admgrProduct/productEndList";
			}
		
		}
	}	
	
	//===============================================================================================================
	// *  상품폼
	//===============================================================================================================
	@RequestMapping(value = "/admgr/admgrProduct/productForm.do")
	public String admgrproductForm(
		@ModelAttribute("AdmgrProductVO") AdmgrProductVO admgrProductVO,
		@ModelAttribute("admgrMemberVO") AdmgrMemberVO admgrMemberVO, 
		@ModelAttribute("admgrStoreVO") AdmgrStoreVO admgrStoreVO, 
		@ModelAttribute("admgrConfigVO") AdmgrConfigVO admgrConfigVO, 
		@ModelAttribute("BaseVO") BaseVO baseVO, 
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
			String store_category = request.getParameter("store_category");
			String prod_seq = request.getParameter("prod_seq");
			String searchKey = request.getParameter("searchKey");
			String searchKeyword = request.getParameter("searchKeyword");
			String pageIndex = request.getParameter("pageIndex");
			if(pageIndex == null || pageIndex == "") {
				pageIndex = "1";
			}
			model.addAttribute("store_category", store_category);
			model.addAttribute("prod_seq", prod_seq);
			model.addAttribute("searchKey", searchKey);
			model.addAttribute("searchKeyword", searchKeyword);
			model.addAttribute("pageIndex", pageIndex);
			
			String save_mode = "insert";
			if(prod_seq != null && prod_seq != "") {
				save_mode = "update";
			}
		
			if(store_category == null || store_category == "") {
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>alert('상품기본 카테고리 값이 필요합니다.'); history.back(); </script>");
				out.flush();
				return null;
			} else {
				
				if(adminLevel.equals("5")) {
					admgrProductVO.setuser_id(adminId);
					// 상점관리자이므로 아이디기반으로 상점목록을 가져온다.
					model.addAttribute("get_id_store_list", admgrProductService.get_id_store_list(admgrProductVO));
				}
				
				// 기본정보 호춣
				model.addAttribute("BaseConfig", admgrConfigService.get_base_config(null));

				String include_file = "";
				switch(store_category) {
					/*case "CD002001" :  
						include_file = "/admgr/admgrProduct/productTravelForm";
						break;
					case "CD002002" :  
						include_file = "/admgr/admgrProduct/productRoomForm";
						break;
					case "CD002003" :  
						include_file = "/admgr/admgrProduct/productFoodForm";
						break;
						*/
					case "CD002004" :  
						include_file = "/admgr/admgrProduct/productMarketForm";
						break;
					/*case "CD002005" :  
						include_file =  "/admgr/admgrProduct/productCourseForm";
						break;
						*/
				}
				
				if(save_mode == "update" ) {
					// 상품정보 호춣
					admgrProductVO.setprod_seq(prod_seq);
					admgrProductVO.setsearchKey(searchKey);
					admgrProductVO.setsearchKeyword(searchKeyword);
					AdmgrProductVO prod_info = admgrProductService.get_prod_info(admgrProductVO);
					if(prod_info == null) {
						response.setContentType("text/html; charset=UTF-8");
						PrintWriter out = response.getWriter();
						out.println("<script>alert('상품이 존재하지 않습니다.'); history.back(); </script>");
						out.flush();
						return null;
					}
					model.addAttribute("prodInfo", prod_info);
					
					//추천관광지정보 가져오기
					String recom_1 = prod_info.getprod_recom_1();
					if(recom_1 != null && recom_1 != "") {
						admgrProductVO.setprod_id(recom_1);
						model.addAttribute("prodRecomInfo_1", admgrProductService.get_recom_info(admgrProductVO));
					}
					String recom_2 = prod_info.getprod_recom_2();
					if(recom_2 != null && recom_2 != "") {
						admgrProductVO.setprod_id(recom_2);
						model.addAttribute("prodRecomInfo_2", admgrProductService.get_recom_info(admgrProductVO));
					}
					String recom_3 = prod_info.getprod_recom_3();
					if(recom_3 != null && recom_3 != "") {
						admgrProductVO.setprod_id(recom_3);
						model.addAttribute("prodRecomInfo_3", admgrProductService.get_recom_info(admgrProductVO));
					}
					String recom_4 = prod_info.getprod_recom_4();
					if(recom_4 != null && recom_4 != "") {
						admgrProductVO.setprod_id(recom_4);
						model.addAttribute("prodRecomInfo_4", admgrProductService.get_recom_info(admgrProductVO));
					}
					String recom_5 = prod_info.getprod_recom_5();
					if(recom_5 != null && recom_5 != "") {
						admgrProductVO.setprod_id(recom_5);
						model.addAttribute("prodRecomInfo_5", admgrProductService.get_recom_info(admgrProductVO));
					}
					String recom_6 = prod_info.getprod_recom_6();
					if(recom_6 != null && recom_6 != "") {
						admgrProductVO.setprod_id(recom_6);
						model.addAttribute("prodRecomInfo_6", admgrProductService.get_recom_info(admgrProductVO));
					}
					String recom_7 = prod_info.getprod_recom_7();
					if(recom_7 != null && recom_7 != "") {
						admgrProductVO.setprod_id(recom_7);
						model.addAttribute("prodRecomInfo_7", admgrProductService.get_recom_info(admgrProductVO));
					}
					String recom_8 = prod_info.getprod_recom_8();
					if(recom_8 != null && recom_8 != "") {
						admgrProductVO.setprod_id(recom_8);
						model.addAttribute("prodRecomInfo_8", admgrProductService.get_recom_info(admgrProductVO));
					}
					String recom_9 = prod_info.getprod_recom_9();
					if(recom_9 != null && recom_9 != "") {
						admgrProductVO.setprod_id(recom_9);
						model.addAttribute("prodRecomInfo_9", admgrProductService.get_recom_info(admgrProductVO));
					}
					String recom_10 = prod_info.getprod_recom_10();
					if(recom_10 != null && recom_10 != "") {
						admgrProductVO.setprod_id(recom_10);
						model.addAttribute("prodRecomInfo_10", admgrProductService.get_recom_info(admgrProductVO));
					}
							

					// 상품옵션정보를 호출한다.
					String prod_id = prod_info.getprod_id();
					admgrProductVO.setprod_id(prod_id);
					model.addAttribute("prodOptionInfo", admgrProductService.get_product_option(admgrProductVO));
					
					// 스토어정보 호춣
					if(!("CD002005").equals(store_category)) {
						String store_id =prod_info.getstore_id();
						admgrStoreVO.setstore_id(store_id);
						AdmgrStoreVO store_info = admgrStoreService.get_store_simple_id_info(admgrStoreVO);
						model.addAttribute("storeInfo", store_info);
						
						if(adminLevel.equals("5")) {
							String store_user_id = store_info.getuser_id();
							if(!adminId.equals(store_user_id)) {
								response.setContentType("text/html; charset=UTF-8");
								PrintWriter out = response.getWriter();
								out.println("<script>alert('권한이 필요합니다.'); history.back();</script>");
								out.flush();
								return null;
							}
						}
						
					}
					
				} else {
					
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
	
					//상점아이디 생성
					String Prod_id = "P"+todateformat+rankey1+rankey2+rankey3+rankey4+rankey5;
					model.addAttribute("ProdId", Prod_id);
					
					//오늘날짜 출력
					model.addAttribute("today", todayformat);
					
				}
				
				// 상품카테고리 목록 얻어외기
				baseVO.setbase_gp_cd("GP005");
				model.addAttribute("categoryList", baseService.get_base_cd_list(baseVO));
				
				return include_file;
				
			}
		
		}
	}
	
	//===============================================================================================================
	// *  상품등록
	//===============================================================================================================
	@RequestMapping(value = "/admgr/admgrProduct/productInsert.do")
	public String admgrproductInsert(
		@ModelAttribute("AdmgrProductVO") AdmgrProductVO admgrProductVO,
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
			
			String return_url = request.getParameter("return_url");
			String searchKey = request.getParameter("searchKey");
			String searchKeyword = request.getParameter("searchKeyword");
			String pageIndex = request.getParameter("pageIndex");
			if(pageIndex == null || pageIndex == "") {
				pageIndex = "1";
			}
			model.addAttribute("pageIndex", pageIndex);
			model.addAttribute("searchKey", searchKey);
			model.addAttribute("searchKeyword", searchKeyword);
			
			String store_category = request.getParameter("store_category");
			String prod_seq = request.getParameter("prod_seq");
			String prod_id = request.getParameter("prod_id");
			String prod_nm = request.getParameter("prod_nm");
			String prod_use_st = request.getParameter("prod_use_st");
			if(prod_use_st == null || prod_use_st == "") {
				prod_use_st = "N";
			}
			String store_id = request.getParameter("store_id");
			String store_nm = request.getParameter("store_nm");
			String prod_orderby = request.getParameter("prod_orderby");
			String prod_comment = request.getParameter("prod_comment");
			String prod_price = request.getParameter("prod_price");
			String prod_price_percent = request.getParameter("prod_price_percent");
			if(prod_price == null || prod_price == "") {
				prod_price = "0";
			}
			String prod_min_price = request.getParameter("prod_min_price");
			if(prod_min_price == null || prod_min_price == "") {
				prod_min_price = "0";
			}
			String prod_market_price = request.getParameter("prod_market_price");
			if(prod_market_price == null || prod_market_price == "") {
				prod_market_price = "0";
			}
			String prod_st_dt_ymd = request.getParameter("prod_st_dt_ymd");
			String prod_st_dt_hour = request.getParameter("prod_st_dt_hour");
			String prod_st_dt_minute = request.getParameter("prod_st_dt_minute");
			String prod_ed_dt_ymd = request.getParameter("prod_ed_dt_ymd");
			String prod_ed_dt_hour = request.getParameter("prod_ed_dt_hour");
			String prod_ed_dt_minute = request.getParameter("prod_ed_dt_minute");
			String prod_st_dt = prod_st_dt_ymd + " " + prod_st_dt_hour + ":" + prod_st_dt_minute + ":00";
			String prod_ed_dt = prod_ed_dt_ymd + " " + prod_ed_dt_hour + ":" + prod_ed_dt_minute + ":00";
			String prod_hit_cnt = "0";
			String prod_pick_cnt = "0";
			String prod_star = "0";
			String prod_order_cnt = "0";
			String prod_use_coupon_st = "N";
			String prod_use_mileage_st = "N";
			String prod_use_pay_st = request.getParameter("prod_use_pay_st");
			if(prod_use_pay_st == null || prod_use_pay_st =="") {
				if(store_category.equals("CD002004")) {
					prod_use_pay_st = "Y";
				} else {
					prod_use_pay_st = "N";
				}
			}
			String prod_bundle_delivery = "N";
			String prod_content_time = request.getParameter("prod_content_time");
			String prod_content_pay = request.getParameter("prod_content_pay");
			String prod_content_precautions = request.getParameter("prod_content_precautions");
			String prod_content_course = request.getParameter("prod_content_course");
			
			admgrProductVO.setstore_category(store_category);
			admgrProductVO.setprod_seq(prod_seq);
			admgrProductVO.setprod_id(prod_id);
			admgrProductVO.setprod_nm(prod_nm);
			admgrProductVO.setprod_use_st(prod_use_st);
			admgrProductVO.setstore_id (store_id);
			admgrProductVO.setstore_nm(store_nm);
			admgrProductVO.setprod_comment(prod_comment);
			admgrProductVO.setprod_price(prod_price);
			admgrProductVO.setprod_price_percent(prod_price_percent);
			admgrProductVO.setprod_min_price(prod_min_price);
			admgrProductVO.setprod_market_price(prod_market_price);
			admgrProductVO.setprod_orderby(prod_orderby);
			admgrProductVO.setprod_st_dt(prod_st_dt);
			admgrProductVO.setprod_ed_dt(prod_ed_dt);
			admgrProductVO.setprod_hit_cnt(prod_hit_cnt);
			admgrProductVO.setprod_pick_cnt(prod_pick_cnt);
			admgrProductVO.setprod_star(prod_star);
			admgrProductVO.setprod_order_cnt(prod_order_cnt);
			admgrProductVO.setprod_use_coupon_st(prod_use_coupon_st);
			admgrProductVO.setprod_use_mileage_st(prod_use_mileage_st);
			admgrProductVO.setprod_use_pay_st(prod_use_pay_st);
			admgrProductVO.setprod_bundle_delivery(prod_bundle_delivery);
			admgrProductVO.setprod_content_time(prod_content_time);
			admgrProductVO.setprod_content_pay(prod_content_pay);
			admgrProductVO.setprod_content_precautions(prod_content_precautions);
			admgrProductVO.setprod_content_course(prod_content_course);
			
			String prod_img_1 = request.getParameter("prod_img_1_id");
			String prod_img_2 = request.getParameter("prod_img_2_id");
			String prod_img_3 = request.getParameter("prod_img_3_id");
			String prod_img_4 = request.getParameter("prod_img_4_id");
			String prod_img_5 = request.getParameter("prod_img_5_id");
			String prod_img_6 = request.getParameter("prod_img_6_id");
			String prod_img_7 = request.getParameter("prod_img_7_id");
			String prod_img_8 = request.getParameter("prod_img_8_id");
			String prod_img_9 = request.getParameter("prod_img_9_id");
			String prod_img_10 = request.getParameter("prod_img_10_id");
			String prod_movie = request.getParameter("prod_movie_id");
			admgrProductVO.setprod_img_1(prod_img_1);
			admgrProductVO.setprod_img_2(prod_img_2);
			admgrProductVO.setprod_img_3(prod_img_3);
			admgrProductVO.setprod_img_4(prod_img_4);
			admgrProductVO.setprod_img_5(prod_img_5);
			admgrProductVO.setprod_img_6(prod_img_6);
			admgrProductVO.setprod_img_7(prod_img_7);
			admgrProductVO.setprod_img_8(prod_img_8);
			admgrProductVO.setprod_img_9(prod_img_9);
			admgrProductVO.setprod_img_10(prod_img_10);
			admgrProductVO.setprod_movie(prod_movie);
			
			String prod_maker = request.getParameter("prod_maker");
			String prod_country = request.getParameter("prod_country");
			String del_st = "N"; 
			admgrProductVO.setprod_maker(prod_maker);
			admgrProductVO.setprod_country(prod_country);
			admgrProductVO.setdel_st(del_st);
			
			String prod_category = request.getParameter("prod_category");
			String prod_category_cd = request.getParameter("prod_category_cd");
			String prod_info_1 = request.getParameter("prod_info_1");
			String prod_info_2 = request.getParameter("prod_info_2");
			String prod_info_3 = request.getParameter("prod_info_3");
			String prod_info_4 = request.getParameter("prod_info_4");
			String prod_info_5 = request.getParameter("prod_info_5");
			String prod_info_6 = request.getParameter("prod_info_6");
			String prod_info_7 = request.getParameter("prod_info_7");
			String prod_info_8 = request.getParameter("prod_info_8");
			String prod_info_9 = request.getParameter("prod_info_9");
			String prod_info_10 = request.getParameter("prod_info_10");
			String prod_info_11 = request.getParameter("prod_info_11");
			String prod_info_12 = request.getParameter("prod_info_12");
			String prod_info_13 = request.getParameter("prod_info_13");
			String prod_info_14 = request.getParameter("prod_info_14");
			String prod_info_15 = request.getParameter("prod_info_15");

			if(store_category.equals("CD002004")) {
				if(prod_category_cd.equals("1")) {
					prod_info_1 = request.getParameter("prod_info1_1");
					prod_info_2 = request.getParameter("prod_info1_2");
					prod_info_3 = request.getParameter("prod_info1_3");
					prod_info_4 = request.getParameter("prod_info1_4");
					prod_info_5 = request.getParameter("prod_info1_5");
					prod_info_6 = request.getParameter("prod_info1_6");
					prod_info_7 = request.getParameter("prod_info1_7");
					prod_info_8 = request.getParameter("prod_info1_8");
					prod_info_9 = request.getParameter("prod_info1_9");
					prod_info_10 = request.getParameter("prod_info1_10");
					prod_info_11 = request.getParameter("prod_info1_11");
					prod_info_12 = request.getParameter("prod_info1_12");
					prod_info_13 = request.getParameter("prod_info1_13");
					prod_info_14 = request.getParameter("prod_info1_14");
					prod_info_15 = request.getParameter("prod_info1_15");
				}
				if(prod_category_cd.equals("2")) {
					prod_info_1 = request.getParameter("prod_info2_1");
					prod_info_2 = request.getParameter("prod_info2_2");
					prod_info_3 = request.getParameter("prod_info2_3");
					prod_info_4 = request.getParameter("prod_info2_4");
					prod_info_5 = request.getParameter("prod_info2_5");
					prod_info_6 = request.getParameter("prod_info2_6");
					prod_info_7 = request.getParameter("prod_info2_7");
					prod_info_8 = request.getParameter("prod_info2_8");
					prod_info_9 = request.getParameter("prod_info2_9");
					prod_info_10 = request.getParameter("prod_info2_10");
					prod_info_11 = request.getParameter("prod_info2_11");
					prod_info_12 = request.getParameter("prod_info2_12");
					prod_info_13 = request.getParameter("prod_info2_13");
					prod_info_14 = request.getParameter("prod_info2_14");
					prod_info_15 = request.getParameter("prod_info2_15");
				}
				if(prod_category_cd.equals("3")) {
					prod_info_1 = request.getParameter("prod_info3_1");
					prod_info_2 = request.getParameter("prod_info3_2");
					prod_info_3 = request.getParameter("prod_info3_3");
					prod_info_4 = request.getParameter("prod_info3_4");
					prod_info_5 = request.getParameter("prod_info3_5");
					prod_info_6 = request.getParameter("prod_info3_6");
					prod_info_7 = request.getParameter("prod_info3_7");
					prod_info_8 = request.getParameter("prod_info3_8");
					prod_info_9 = request.getParameter("prod_info3_9");
					prod_info_10 = request.getParameter("prod_info3_10");
					prod_info_11 = request.getParameter("prod_info3_11");
					prod_info_12 = request.getParameter("prod_info3_12");
					prod_info_13 = request.getParameter("prod_info3_13");
					prod_info_14 = request.getParameter("prod_info3_14");
					prod_info_15 = request.getParameter("prod_info3_15");
				}
				if(prod_category_cd.equals("4")) {
					prod_info_1 = request.getParameter("prod_info4_1");
					prod_info_2 = request.getParameter("prod_info4_2");
					prod_info_3 = request.getParameter("prod_info4_3");
					prod_info_4 = request.getParameter("prod_info4_4");
					prod_info_5 = request.getParameter("prod_info4_5");
					prod_info_6 = request.getParameter("prod_info4_6");
					prod_info_7 = request.getParameter("prod_info4_7");
					prod_info_8 = request.getParameter("prod_info4_8");
					prod_info_9 = request.getParameter("prod_info4_9");
					prod_info_10 = request.getParameter("prod_info4_10");
					prod_info_11 = request.getParameter("prod_info4_11");
					prod_info_12 = request.getParameter("prod_info4_12");
					prod_info_13 = request.getParameter("prod_info4_13");
					prod_info_14 = request.getParameter("prod_info4_14");
					prod_info_15 = request.getParameter("prod_info4_15");
				}
				if(prod_category_cd.equals("5")) {
					prod_info_1 = request.getParameter("prod_info5_1");
					prod_info_2 = request.getParameter("prod_info5_2");
					prod_info_3 = request.getParameter("prod_info5_3");
					prod_info_4 = request.getParameter("prod_info5_4");
					prod_info_5 = request.getParameter("prod_info5_5");
					prod_info_6 = request.getParameter("prod_info5_6");
					prod_info_7 = request.getParameter("prod_info5_7");
					prod_info_8 = request.getParameter("prod_info5_8");
					prod_info_9 = request.getParameter("prod_info5_9");
					prod_info_10 = request.getParameter("prod_info5_10");
					prod_info_11 = request.getParameter("prod_info5_11");
					prod_info_12 = request.getParameter("prod_info5_12");
					prod_info_13 = request.getParameter("prod_info5_13");
					prod_info_14 = request.getParameter("prod_info5_14");
					prod_info_15 = request.getParameter("prod_info5_15");
				}
			}
			admgrProductVO.setprod_category(prod_category);
			admgrProductVO.setprod_category_cd(prod_category_cd);
			admgrProductVO.setprod_info_1(prod_info_1);
			admgrProductVO.setprod_info_2(prod_info_2);
			admgrProductVO.setprod_info_3(prod_info_3);
			admgrProductVO.setprod_info_4(prod_info_4);
			admgrProductVO.setprod_info_5(prod_info_5);
			admgrProductVO.setprod_info_6(prod_info_6);
			admgrProductVO.setprod_info_7(prod_info_7);
			admgrProductVO.setprod_info_8(prod_info_8);
			admgrProductVO.setprod_info_9(prod_info_9);
			admgrProductVO.setprod_info_10(prod_info_10);
			admgrProductVO.setprod_info_11(prod_info_11);
			admgrProductVO.setprod_info_12(prod_info_12);
			admgrProductVO.setprod_info_13(prod_info_13);
			admgrProductVO.setprod_info_14(prod_info_14);
			admgrProductVO.setprod_info_15(prod_info_15);
			
			String prod_trade_info_1 = request.getParameter("prod_trade_info_1");
			String prod_trade_info_2 = request.getParameter("prod_trade_info_2");
			String prod_trade_info_3 = request.getParameter("prod_trade_info_3");
			String prod_trade_info_4 = request.getParameter("prod_trade_info_4");
			String prod_trade_info_5 = request.getParameter("prod_trade_info_5");
			admgrProductVO.setprod_trade_info_1(prod_trade_info_1);
			admgrProductVO.setprod_trade_info_2(prod_trade_info_2);
			admgrProductVO.setprod_trade_info_3(prod_trade_info_3);
			admgrProductVO.setprod_trade_info_4(prod_trade_info_4);
			admgrProductVO.setprod_trade_info_5(prod_trade_info_5);
			
			String prod_recom_1 = request.getParameter("prod_recom_1");
			String prod_recom_2 = request.getParameter("prod_recom_2");
			String prod_recom_3 = request.getParameter("prod_recom_3");
			String prod_recom_4 = request.getParameter("prod_recom_4");
			String prod_recom_5 = request.getParameter("prod_recom_5");
			String prod_recom_6 = request.getParameter("prod_recom_6");
			String prod_recom_7 = request.getParameter("prod_recom_7");
			String prod_recom_8 = request.getParameter("prod_recom_8");
			String prod_recom_9 = request.getParameter("prod_recom_9");
			String prod_recom_10 = request.getParameter("prod_recom_10");
			admgrProductVO.setprod_recom_1(prod_recom_1);
			admgrProductVO.setprod_recom_2(prod_recom_2);
			admgrProductVO.setprod_recom_3(prod_recom_3);
			admgrProductVO.setprod_recom_4(prod_recom_4);
			admgrProductVO.setprod_recom_5(prod_recom_5);
			admgrProductVO.setprod_recom_6(prod_recom_6);
			admgrProductVO.setprod_recom_7(prod_recom_7);
			admgrProductVO.setprod_recom_8(prod_recom_8);
			admgrProductVO.setprod_recom_9(prod_recom_9);
			admgrProductVO.setprod_recom_10(prod_recom_10);

			String[] prod_age = request.getParameterValues("prod_age");
			String db_prod_gae = "";
			if(prod_age != null ) {
				for(int i=0; i<prod_age.length; i++) {
					if(prod_age[i] != "" && prod_age[i] != null ) {
						db_prod_gae += prod_age[i] + ",";
					}
				}
			}
			String[] prod_season = request.getParameterValues("prod_season");
			String db_prod_season = "";
			if(prod_season != null ) {
				for(int i=0; i<prod_season.length; i++) {
					if(prod_season[i] != "" && prod_season[i] != null ) {
						db_prod_season += prod_season[i] + ",";
					}
				}
			}
			String[] prod_travel_type = request.getParameterValues("prod_travel_type");
			String db_prod_travel_type= "";
			if(prod_travel_type != null ) {
				for(int i=0; i<prod_travel_type.length; i++) {
					if(prod_travel_type[i] != "" && prod_travel_type[i] != null ) {
						db_prod_travel_type += prod_travel_type[i] + ",";
					}
				}
			}
			
			admgrProductVO.setprod_age(db_prod_gae);
			admgrProductVO.setprod_season(db_prod_season);
			admgrProductVO.setprod_travel_type(db_prod_travel_type);
						
			int insert_id = admgrProductService.insert_product(admgrProductVO);
			
			//옵션전체재등록
			String[] prod_option_nm = request.getParameterValues("prod_option_nm");
			String[] prod_option_price = request.getParameterValues("prod_option_price");
			//String[] prod_option_use_st = request.getParameterValues("prod_option_use_st");
			if(prod_option_nm != null ) {
				for(int i=0; i<prod_option_nm.length; i++) {
					if(prod_option_nm[i] != "" && prod_option_nm[i] != null && prod_option_price[i] != "" && prod_option_price[i] != null ) {
						admgrProductVO.setopt_nm(prod_option_nm[i]);
						admgrProductVO.setopt_price(prod_option_price[i]);
						admgrProductVO.setopt_orderby("1");
						admgrProductVO.setopt_use_st("Y");
						admgrProductService.insert_product_option(admgrProductVO);
					}
				}
			}
			
			String add_url = "";
			if(searchKeyword != null && searchKeyword != "") {
				add_url += "&searchKey="+searchKey;
			}
			if(searchKeyword != null && searchKeyword != "") {
				add_url += "&searchKeyword="+searchKeyword;
			}
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('등록되었습니다.'); location.replace('/admgr/admgrProduct/productList.do?store_category="+store_category+add_url+"'); </script>");
			out.flush();			

			return null;
		}
	}

	//===============================================================================================================
	// *  상품수정
	//===============================================================================================================
	@RequestMapping(value = "/admgr/admgrProduct/productUpdate.do")
	public void admgrproductUpdate(
		@ModelAttribute("AdmgrProductVO") AdmgrProductVO admgrProductVO,
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
				admgrProductVO.setuser_id(adminId);
			}
			admgrProductVO.setuser_level(adminLevel);
			
			String searchKey = request.getParameter("searchKey");
			String searchKeyword = request.getParameter("searchKeyword");
			String pageIndex = request.getParameter("pageIndex");
			if(pageIndex == null || pageIndex == "") {
				pageIndex = "1";
			}
			model.addAttribute("pageIndex", pageIndex);
			model.addAttribute("searchKey", searchKey);
			model.addAttribute("searchKeyword", searchKeyword);

			String return_url = request.getParameter("return_url");
			
			String store_category = request.getParameter("store_category");
			String prod_seq = request.getParameter("prod_seq");
			String prod_nm = request.getParameter("prod_nm");
			String prod_use_st = request.getParameter("prod_use_st");
			String store_id = request.getParameter("store_id");
			String store_nm = request.getParameter("store_nm");
			String prod_price = request.getParameter("prod_price");
			String prod_price_percent = request.getParameter("prod_price_percent");
			if(prod_price == null || prod_price == "") {
				prod_price = "0";
			}
			String prod_min_price = request.getParameter("prod_min_price");
			if(prod_min_price == null || prod_min_price == "") {
				prod_min_price = "0";
			}
			String prod_market_price = request.getParameter("prod_market_price");
			if(prod_market_price == null || prod_market_price == "") {
				prod_market_price = "0";
			}
			String prod_orderby = request.getParameter("prod_orderby");
			String prod_comment = request.getParameter("prod_comment");
			String prod_st_dt_ymd = request.getParameter("prod_st_dt_ymd");
			String prod_st_dt_hour = request.getParameter("prod_st_dt_hour");
			String prod_st_dt_minute = request.getParameter("prod_st_dt_minute");
			String prod_ed_dt_ymd = request.getParameter("prod_ed_dt_ymd");
			String prod_ed_dt_hour = request.getParameter("prod_ed_dt_hour");
			String prod_ed_dt_minute = request.getParameter("prod_ed_dt_minute");
			String prod_st_dt = prod_st_dt_ymd + " " + prod_st_dt_hour + ":" + prod_st_dt_minute + ":00";
			String prod_ed_dt = prod_ed_dt_ymd + " " + prod_ed_dt_hour + ":" + prod_ed_dt_minute + ":00";
			String prod_use_coupon_st = "N";
			String prod_use_mileage_st = "N";
			String prod_use_pay_st = request.getParameter("prod_use_pay_st");
			if(prod_use_pay_st == null || prod_use_pay_st =="") {
				if(store_category.equals("CD002004")) {
					prod_use_pay_st = "Y";
				} else {
					prod_use_pay_st = "N";
				}
			}
			String prod_bundle_delivery = "N";
			String prod_content_time = request.getParameter("prod_content_time");
			String prod_content_pay = request.getParameter("prod_content_pay");
			String prod_content_precautions = request.getParameter("prod_content_precautions");
			String prod_content_course = request.getParameter("prod_content_course");
			
			admgrProductVO.setstore_category(store_category);
			admgrProductVO.setprod_seq(prod_seq);
			admgrProductVO.setprod_nm(prod_nm);
			admgrProductVO.setprod_use_st(prod_use_st);
			admgrProductVO.setstore_id (store_id);
			admgrProductVO.setstore_nm(store_nm);
			admgrProductVO.setprod_comment(prod_comment);
			admgrProductVO.setprod_price(prod_price);
			admgrProductVO.setprod_price_percent(prod_price_percent);
			admgrProductVO.setprod_min_price(prod_min_price);
			admgrProductVO.setprod_market_price(prod_market_price);
			admgrProductVO.setprod_orderby(prod_orderby);
			admgrProductVO.setprod_st_dt(prod_st_dt);
			admgrProductVO.setprod_ed_dt(prod_ed_dt);
			admgrProductVO.setprod_use_coupon_st(prod_use_coupon_st);
			admgrProductVO.setprod_use_mileage_st(prod_use_mileage_st);
			admgrProductVO.setprod_use_pay_st(prod_use_pay_st);
			admgrProductVO.setprod_bundle_delivery(prod_bundle_delivery);
			admgrProductVO.setprod_content_time(prod_content_time);
			admgrProductVO.setprod_content_pay(prod_content_pay);
			admgrProductVO.setprod_content_precautions(prod_content_precautions);
			admgrProductVO.setprod_content_course(prod_content_course);

			String prod_img_1 = request.getParameter("prod_img_1_id");
			String prod_old_img_1= request.getParameter("prod_old_img_1_id");
			String prod_img_1_del = request.getParameter("prod_img_1_del");
			String prod_img_2 = request.getParameter("prod_img_2_id");
			String prod_old_img_2= request.getParameter("prod_old_img_2_id");
			String prod_img_2_del = request.getParameter("prod_img_2_del");
			String prod_img_3 = request.getParameter("prod_img_3_id");
			String prod_old_img_3= request.getParameter("prod_old_img_3_id");
			String prod_img_3_del = request.getParameter("prod_img_3_del");
			String prod_img_4 = request.getParameter("prod_img_4_id");
			String prod_old_img_4= request.getParameter("prod_old_img_4_id");
			String prod_img_4_del = request.getParameter("prod_img_4_del");
			String prod_img_5 = request.getParameter("prod_img_5_id");
			String prod_old_img_5= request.getParameter("prod_old_img_5_id");
			String prod_img_5_del = request.getParameter("prod_img_5_del");
			String prod_img_6 = request.getParameter("prod_img_6_id");
			String prod_old_img_6= request.getParameter("prod_old_img_6_id");
			String prod_img_6_del = request.getParameter("prod_img_6_del");
			String prod_img_7 = request.getParameter("prod_img_7_id");
			String prod_old_img_7= request.getParameter("prod_old_img_7_id");
			String prod_img_7_del = request.getParameter("prod_img_7_del");
			String prod_img_8 = request.getParameter("prod_img_8_id");
			String prod_old_img_8= request.getParameter("prod_old_img_8_id");
			String prod_img_8_del = request.getParameter("prod_img_8_del");
			String prod_img_9 = request.getParameter("prod_img_9_id");
			String prod_old_img_9= request.getParameter("prod_old_img_9_id");
			String prod_img_9_del = request.getParameter("prod_img_9_del");
			String prod_img_10 = request.getParameter("prod_img_10_id");
			String prod_old_img_10= request.getParameter("prod_old_img_10_id");
			String prod_img_10_del = request.getParameter("prod_img_10_del");
			String prod_movie = request.getParameter("prod_movie_id");
			String prod_old_movie= request.getParameter("prod_old_movie_id");
			String prod_movie_del = request.getParameter("prod_movie_del");
			
			if(prod_img_1_del == null || prod_img_1_del == "") {
				prod_img_1_del = "N";
			}
			if(prod_img_2_del == null || prod_img_2_del == "") {
				prod_img_2_del = "N";
			}
			if(prod_img_3_del == null || prod_img_3_del == "") {
				prod_img_3_del = "N";
			}
			if(prod_img_4_del == null || prod_img_4_del == "") {
				prod_img_4_del = "N";
			}
			if(prod_img_5_del == null || prod_img_5_del == "") {
				prod_img_5_del = "N";
			}
			if(prod_img_6_del == null || prod_img_6_del == "") {
				prod_img_6_del = "N";
			}
			if(prod_img_7_del == null || prod_img_7_del == "") {
				prod_img_7_del = "N";
			}
			if(prod_img_8_del == null || prod_img_8_del == "") {
				prod_img_8_del = "N";
			}
			if(prod_img_9_del == null || prod_img_9_del == "") {
				prod_img_9_del = "N";
			}
			if(prod_img_10_del == null || prod_img_10_del == "") {
				prod_img_10_del = "N";
			}			
			if(prod_movie_del == null || prod_movie_del == "") {
				prod_movie_del = "N";
			}			

			if(prod_img_1_del.equals("Y")) {
				admgrProductVO.setprod_img_1(prod_img_1);
			} else {
				if(prod_img_1 != null && prod_img_1 != "") {
					admgrProductVO.setprod_img_1(prod_img_1);
				} else {
					admgrProductVO.setprod_img_1(prod_old_img_1);
				}
			}
			if(prod_img_2_del.equals("Y")) {
				admgrProductVO.setprod_img_2(prod_img_2);
			} else {
				if(prod_img_2 != null && prod_img_2 != "") {
					admgrProductVO.setprod_img_2(prod_img_2);
				} else {
					admgrProductVO.setprod_img_2(prod_old_img_2);
				}
			}
			if(prod_img_3_del.equals("Y")) {
				admgrProductVO.setprod_img_3(prod_img_3);
			} else {
				if(prod_img_3 != null && prod_img_3 != "") {
					admgrProductVO.setprod_img_3(prod_img_3);
				} else {
					admgrProductVO.setprod_img_3(prod_old_img_3);
				}
			}
			if(prod_img_4_del.equals("Y")) {
				admgrProductVO.setprod_img_4(prod_img_4);
			} else {
				if(prod_img_4 != null && prod_img_4 != "") {
					admgrProductVO.setprod_img_4(prod_img_4);
				} else {
					admgrProductVO.setprod_img_4(prod_old_img_4);
				}
			}
			if(prod_img_5_del.equals("Y")) {
				admgrProductVO.setprod_img_5(prod_img_5);
			} else {
				if(prod_img_5 != null && prod_img_5 != "") {
					admgrProductVO.setprod_img_5(prod_img_5);
				} else {
					admgrProductVO.setprod_img_5(prod_old_img_5);
				}
			}
			if(prod_img_6_del.equals("Y")) {
				admgrProductVO.setprod_img_6(prod_img_6);
			} else {
				if(prod_img_6 != null && prod_img_6 != "") {
					admgrProductVO.setprod_img_6(prod_img_6);
				} else {
					admgrProductVO.setprod_img_6(prod_old_img_6);
				}
			}
			if(prod_img_7_del.equals("Y")) {
				admgrProductVO.setprod_img_7(prod_img_7);
			} else {
				if(prod_img_7 != null && prod_img_7 != "") {
					admgrProductVO.setprod_img_7(prod_img_7);
				} else {
					admgrProductVO.setprod_img_7(prod_old_img_7);
				}
			}
			if(prod_img_8_del.equals("Y")) {
				admgrProductVO.setprod_img_8(prod_img_8);
			} else {
				if(prod_img_8 != null && prod_img_8 != "") {
					admgrProductVO.setprod_img_8(prod_img_8);
				} else {
					admgrProductVO.setprod_img_8(prod_old_img_8);
				}
			}
			if(prod_img_9_del.equals("Y")) {
				admgrProductVO.setprod_img_9(prod_img_9);
			} else {
				if(prod_img_9 != null && prod_img_9 != "") {
					admgrProductVO.setprod_img_9(prod_img_9);
				} else {
					admgrProductVO.setprod_img_9(prod_old_img_9);
				}
			}
			if(prod_img_10_del.equals("Y")) {
				admgrProductVO.setprod_img_10(prod_img_10);
			} else {
				if(prod_img_10 != null && prod_img_10 != "") {
					admgrProductVO.setprod_img_10(prod_img_10);
				} else {
					admgrProductVO.setprod_img_10(prod_old_img_10);
				}
			}			
			if(prod_movie_del.equals("Y")) {
				admgrProductVO.setprod_movie(prod_movie);
			} else {
				if(prod_movie != null && prod_movie != "") {
					admgrProductVO.setprod_movie(prod_movie);
				} else {
					admgrProductVO.setprod_movie(prod_old_movie);
				}
			}			
			
			String prod_maker = request.getParameter("prod_maker");
			String prod_country = request.getParameter("prod_country");
			String del_st = "N"; 
			admgrProductVO.setprod_maker(prod_maker);
			admgrProductVO.setprod_country(prod_country);
			admgrProductVO.setdel_st(del_st);
			
			String prod_category = request.getParameter("prod_category");
			String prod_category_cd = request.getParameter("prod_category_cd");
			String prod_info_1 = request.getParameter("prod_info_1");
			String prod_info_2 = request.getParameter("prod_info_2");
			String prod_info_3 = request.getParameter("prod_info_3");
			String prod_info_4 = request.getParameter("prod_info_4");
			String prod_info_5 = request.getParameter("prod_info_5");
			String prod_info_6 = request.getParameter("prod_info_6");
			String prod_info_7 = request.getParameter("prod_info_7");
			String prod_info_8 = request.getParameter("prod_info_8");
			String prod_info_9 = request.getParameter("prod_info_9");
			String prod_info_10 = request.getParameter("prod_info_10");
			String prod_info_11 = request.getParameter("prod_info_11");
			String prod_info_12 = request.getParameter("prod_info_12");
			String prod_info_13 = request.getParameter("prod_info_13");
			String prod_info_14 = request.getParameter("prod_info_14");
			String prod_info_15 = request.getParameter("prod_info_15");

			if(store_category.equals("CD002004")) {
				if(prod_category_cd.equals("1")) {
					prod_info_1 = request.getParameter("prod_info1_1");
					prod_info_2 = request.getParameter("prod_info1_2");
					prod_info_3 = request.getParameter("prod_info1_3");
					prod_info_4 = request.getParameter("prod_info1_4");
					prod_info_5 = request.getParameter("prod_info1_5");
					prod_info_6 = request.getParameter("prod_info1_6");
					prod_info_7 = request.getParameter("prod_info1_7");
					prod_info_8 = request.getParameter("prod_info1_8");
					prod_info_9 = request.getParameter("prod_info1_9");
					prod_info_10 = request.getParameter("prod_info1_10");
					prod_info_11 = request.getParameter("prod_info1_11");
					prod_info_12 = request.getParameter("prod_info1_12");
					prod_info_13 = request.getParameter("prod_info1_13");
					prod_info_14 = request.getParameter("prod_info1_14");
					prod_info_15 = request.getParameter("prod_info1_15");
				}
				if(prod_category_cd.equals("2")) {
					prod_info_1 = request.getParameter("prod_info2_1");
					prod_info_2 = request.getParameter("prod_info2_2");
					prod_info_3 = request.getParameter("prod_info2_3");
					prod_info_4 = request.getParameter("prod_info2_4");
					prod_info_5 = request.getParameter("prod_info2_5");
					prod_info_6 = request.getParameter("prod_info2_6");
					prod_info_7 = request.getParameter("prod_info2_7");
					prod_info_8 = request.getParameter("prod_info2_8");
					prod_info_9 = request.getParameter("prod_info2_9");
					prod_info_10 = request.getParameter("prod_info2_10");
					prod_info_11 = request.getParameter("prod_info2_11");
					prod_info_12 = request.getParameter("prod_info2_12");
					prod_info_13 = request.getParameter("prod_info2_13");
					prod_info_14 = request.getParameter("prod_info2_14");
					prod_info_15 = request.getParameter("prod_info2_15");
				}
				if(prod_category_cd.equals("3")) {
					prod_info_1 = request.getParameter("prod_info3_1");
					prod_info_2 = request.getParameter("prod_info3_2");
					prod_info_3 = request.getParameter("prod_info3_3");
					prod_info_4 = request.getParameter("prod_info3_4");
					prod_info_5 = request.getParameter("prod_info3_5");
					prod_info_6 = request.getParameter("prod_info3_6");
					prod_info_7 = request.getParameter("prod_info3_7");
					prod_info_8 = request.getParameter("prod_info3_8");
					prod_info_9 = request.getParameter("prod_info3_9");
					prod_info_10 = request.getParameter("prod_info3_10");
					prod_info_11 = request.getParameter("prod_info3_11");
					prod_info_12 = request.getParameter("prod_info3_12");
					prod_info_13 = request.getParameter("prod_info3_13");
					prod_info_14 = request.getParameter("prod_info3_14");
					prod_info_15 = request.getParameter("prod_info3_15");
				}
				if(prod_category_cd.equals("4")) {
					prod_info_1 = request.getParameter("prod_info4_1");
					prod_info_2 = request.getParameter("prod_info4_2");
					prod_info_3 = request.getParameter("prod_info4_3");
					prod_info_4 = request.getParameter("prod_info4_4");
					prod_info_5 = request.getParameter("prod_info4_5");
					prod_info_6 = request.getParameter("prod_info4_6");
					prod_info_7 = request.getParameter("prod_info4_7");
					prod_info_8 = request.getParameter("prod_info4_8");
					prod_info_9 = request.getParameter("prod_info4_9");
					prod_info_10 = request.getParameter("prod_info4_10");
					prod_info_11 = request.getParameter("prod_info4_11");
					prod_info_12 = request.getParameter("prod_info4_12");
					prod_info_13 = request.getParameter("prod_info4_13");
					prod_info_14 = request.getParameter("prod_info4_14");
					prod_info_15 = request.getParameter("prod_info4_15");
				}
				if(prod_category_cd.equals("5")) {
					prod_info_1 = request.getParameter("prod_info5_1");
					prod_info_2 = request.getParameter("prod_info5_2");
					prod_info_3 = request.getParameter("prod_info5_3");
					prod_info_4 = request.getParameter("prod_info5_4");
					prod_info_5 = request.getParameter("prod_info5_5");
					prod_info_6 = request.getParameter("prod_info5_6");
					prod_info_7 = request.getParameter("prod_info5_7");
					prod_info_8 = request.getParameter("prod_info5_8");
					prod_info_9 = request.getParameter("prod_info5_9");
					prod_info_10 = request.getParameter("prod_info5_10");
					prod_info_11 = request.getParameter("prod_info5_11");
					prod_info_12 = request.getParameter("prod_info5_12");
					prod_info_13 = request.getParameter("prod_info5_13");
					prod_info_14 = request.getParameter("prod_info5_14");
					prod_info_15 = request.getParameter("prod_info5_15");
				}
			}
			admgrProductVO.setprod_category(prod_category);
			admgrProductVO.setprod_category_cd(prod_category_cd);
			admgrProductVO.setprod_info_1(prod_info_1);
			admgrProductVO.setprod_info_2(prod_info_2);
			admgrProductVO.setprod_info_3(prod_info_3);
			admgrProductVO.setprod_info_4(prod_info_4);
			admgrProductVO.setprod_info_5(prod_info_5);
			admgrProductVO.setprod_info_6(prod_info_6);
			admgrProductVO.setprod_info_7(prod_info_7);
			admgrProductVO.setprod_info_8(prod_info_8);
			admgrProductVO.setprod_info_9(prod_info_9);
			admgrProductVO.setprod_info_10(prod_info_10);
			admgrProductVO.setprod_info_11(prod_info_11);
			admgrProductVO.setprod_info_12(prod_info_12);
			admgrProductVO.setprod_info_13(prod_info_13);
			admgrProductVO.setprod_info_14(prod_info_14);
			admgrProductVO.setprod_info_15(prod_info_15);
			
			String prod_trade_info_1 = request.getParameter("prod_trade_info_1");
			String prod_trade_info_2 = request.getParameter("prod_trade_info_2");
			String prod_trade_info_3 = request.getParameter("prod_trade_info_3");
			String prod_trade_info_4 = request.getParameter("prod_trade_info_4");
			String prod_trade_info_5 = request.getParameter("prod_trade_info_5");
			admgrProductVO.setprod_trade_info_1(prod_trade_info_1);
			admgrProductVO.setprod_trade_info_2(prod_trade_info_2);
			admgrProductVO.setprod_trade_info_3(prod_trade_info_3);
			admgrProductVO.setprod_trade_info_4(prod_trade_info_4);
			admgrProductVO.setprod_trade_info_5(prod_trade_info_5);
			
			String prod_recom_1 = request.getParameter("prod_recom_1");
			String prod_recom_2 = request.getParameter("prod_recom_2");
			String prod_recom_3 = request.getParameter("prod_recom_3");
			String prod_recom_4 = request.getParameter("prod_recom_4");
			String prod_recom_5 = request.getParameter("prod_recom_5");
			String prod_recom_6 = request.getParameter("prod_recom_6");
			String prod_recom_7 = request.getParameter("prod_recom_7");
			String prod_recom_8 = request.getParameter("prod_recom_8");
			String prod_recom_9 = request.getParameter("prod_recom_9");
			String prod_recom_10 = request.getParameter("prod_recom_10");
			admgrProductVO.setprod_recom_1(prod_recom_1);
			admgrProductVO.setprod_recom_2(prod_recom_2);
			admgrProductVO.setprod_recom_3(prod_recom_3);
			admgrProductVO.setprod_recom_4(prod_recom_4);
			admgrProductVO.setprod_recom_5(prod_recom_5);
			admgrProductVO.setprod_recom_6(prod_recom_6);
			admgrProductVO.setprod_recom_7(prod_recom_7);
			admgrProductVO.setprod_recom_8(prod_recom_8);
			admgrProductVO.setprod_recom_9(prod_recom_9);
			admgrProductVO.setprod_recom_10(prod_recom_10);
			
			String[] prod_age = request.getParameterValues("prod_age");
			String db_prod_gae = "";
			if(prod_age != null ) {
				for(int i=0; i<prod_age.length; i++) {
					if(prod_age[i] != "" && prod_age[i] != null ) {
						db_prod_gae += prod_age[i] + ",";
					}
				}
			}
			String[] prod_season = request.getParameterValues("prod_season");
			String db_prod_season = "";
			if(prod_season != null ) {
				for(int i=0; i<prod_season.length; i++) {
					if(prod_season[i] != "" && prod_season[i] != null ) {
						db_prod_season += prod_season[i] + ",";
					}
				}
			}
			String[] prod_travel_type = request.getParameterValues("prod_travel_type");
			String db_prod_travel_type= "";
			if(prod_travel_type != null ) {
				for(int i=0; i<prod_travel_type.length; i++) {
					if(prod_travel_type[i] != "" && prod_travel_type[i] != null ) {
						db_prod_travel_type += prod_travel_type[i] + ",";
					}
				}
			}
			
			admgrProductVO.setprod_age(db_prod_gae);
			admgrProductVO.setprod_season(db_prod_season);
			admgrProductVO.setprod_travel_type(db_prod_travel_type);

			// 상품정보 수정
			admgrProductService.update_product(admgrProductVO);

			//옵션삭제
			admgrProductService.delete_product_option(admgrProductVO);
			//옵션전체재등록
			String[] prod_option_nm = request.getParameterValues("prod_option_nm");
			String[] prod_option_price = request.getParameterValues("prod_option_price");
			//String[] prod_option_use_st = request.getParameterValues("prod_option_use_st");
			if(prod_option_nm != null ) {
				for(int i=0; i<prod_option_nm.length; i++) {
					if(prod_option_nm[i] != "" && prod_option_nm[i] != null && prod_option_price[i] != "" && prod_option_price[i] != null ) {
						admgrProductVO.setopt_nm(prod_option_nm[i]);
						admgrProductVO.setopt_price(prod_option_price[i]);
						admgrProductVO.setopt_orderby("1");
						admgrProductVO.setopt_use_st("Y");
						admgrProductService.insert_product_option(admgrProductVO);
					}
				}
			}
		
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('수정되었습니다.'); location.replace('"+return_url+"'); </script>");
			out.flush();			
			return;
		
		}
	}

	//===============================================================================================================
	// *  상품삭제
	//===============================================================================================================
	@RequestMapping(value = "/admgr/admgrProduct/productDelete.do")
	public void admgrproductDelete(
		@ModelAttribute("AdmgrProductVO") AdmgrProductVO admgrProductVO,
		@ModelAttribute("AdmgrStoreVO") AdmgrStoreVO admgrStoreVO,
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
			
			String searchKey = request.getParameter("searchKey");
			String searchKeyword = request.getParameter("searchKeyword");
			String pageIndex = request.getParameter("pageIndex");
			model.addAttribute("pageIndex", pageIndex);
			model.addAttribute("searchKey", searchKey);
			model.addAttribute("searchKeyword", searchKeyword);
			
			String store_category = request.getParameter("store_category");
			String prod_seq = request.getParameter("prod_seq");
			
			admgrProductVO.setprod_seq(prod_seq);
			//상품정보 호출
			AdmgrProductVO prod_info = admgrProductService.get_prod_info(admgrProductVO);
			
			// 스토어정보 호춣
			String store_id = prod_info.getstore_id();
			admgrStoreVO.setstore_id(store_id);
			AdmgrStoreVO store_info = admgrStoreService.get_store_simple_id_info(admgrStoreVO);
			String store_user_id = store_info.getuser_id();

			
			if(adminLevel.equals("5")) {
				if(!adminId.equals(store_user_id)) {
					response.setContentType("text/html; charset=UTF-8");
					PrintWriter out = response.getWriter();
					out.println("<script>alert('권한이 필요합니다.'); history.back();</script>");
					out.flush();
					return;
				}
			}
			
			//삭제한다.
			admgrProductService.delete_product(admgrProductVO);
			
			//마지막페이지 다시 구하기 시작
			// 삭제 후, 페이징이 감소되어 오류나는 것을 방지하기 위함
			admgrProductVO.setsearchKey(searchKey);
			admgrProductVO.setsearchKeyword(searchKeyword);
			admgrProductVO.setPageUnit(15);
			admgrProductVO.setPageSize(10); 
			// request로 넘겨받은 것이 String이므로 숫자형으로 형변환
			int thisPageIndex = Integer.valueOf(pageIndex);
			// 전체갯수 구하기
			int ListCnt = admgrProductService.get_product_list_cnt(admgrProductVO);
			// 정수형으로 구함 - int은 몫만 반환
			int pageTypeInt = ListCnt/admgrProductVO.getPageUnit();
			// float형으로 다시구함
			float pageTypeFloat = (float)ListCnt/admgrProductVO.getPageUnit();
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
			
			String return_url = "/admgr/admgrProduct/productList.do";
			String query_string = "?pageIndex="+newPageIndex+"&store_category="+store_category+"&searchKey="+searchKey+"&searchKeyword="+searchKeyword;
			return_url += query_string;
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('삭제되었습니다.'); location.href='"+return_url+"'; </script>");
			out.flush();
			return;
			
		}
	}

	//===============================================================================================================
	// *  숙박 - 룸목록
	//===============================================================================================================
	@RequestMapping(value = "/admgr/admgrModal/getRoomList.do")
	public String admgrmodalRoomList(
		@ModelAttribute("AdmgrProductVO") AdmgrProductVO admgrProductVO,
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
			
			String prod_id = request.getParameter("prod_id");
			
			if(prod_id != null && prod_id != "") {
				model.addAttribute("roomList", admgrProductService.get_room_list(admgrProductVO));
			}
			
			return "/admgr/admgrModal/modalRoomList";
		}
	}
	
	//===============================================================================================================
	// *  숙박 - 룸목록
	//===============================================================================================================
	@RequestMapping(value = "/admgr/admgrModal/getRoomDel.do")
	public String admgrmodalRoomDel(
			@ModelAttribute("AdmgrProductVO") AdmgrProductVO admgrProductVO,
			ModelMap model,
			HttpServletRequest request,
			HttpServletResponse response
			) throws Exception {
		
		HttpSession session = request.getSession(true);
		String adminId = (String) session.getAttribute("adminId");
		String adminLevel = (String) session.getAttribute("adminLevel");
		
		if(adminId == null || adminId == "" ) {
			model.addAttribute("res", "AN");
			return null;
		}  else {
			
			String room_seq = request.getParameter("room_seq");
			
			if(room_seq != null && room_seq != "") {
				admgrProductVO.setprod_room_seq(room_seq);
				admgrProductService.delete_room(admgrProductVO);
				model.addAttribute("res", "Y");
			} else {
				model.addAttribute("res", "N");
			}
			
			return "/admgr/admgrModal/modalRoomDel";
		}
	}
	
	//===============================================================================================================
	// *  숙박 - 룸정보
	//===============================================================================================================
	@RequestMapping(value = "/admgr/admgrModal/getRoomForm.do")
	public String admgrmodalRoomForm(
		@ModelAttribute("AdmgrProductVO") AdmgrProductVO admgrProductVO,
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
			
			String prod_id = request.getParameter("prod_id");
			String prod_room_seq = request.getParameter("room_seq");
			
			if(prod_room_seq != null && prod_room_seq != "") {
				admgrProductVO.setprod_id(prod_id);
				admgrProductVO.setprod_room_seq(prod_room_seq);
				model.addAttribute("roomInfo", admgrProductService.get_room_info(admgrProductVO));
			}
			
			return "/admgr/admgrModal/modalRoomForm";
		}
	}
	
	//===============================================================================================================
	// *  숙박 - 룸정보 저장
	//===============================================================================================================
	@RequestMapping(value = "/admgr/admgrModal/setRoom.do")
	public String admgrsetRoom(
			@ModelAttribute("AdmgrProductVO") AdmgrProductVO admgrProductVO,
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
			
			String prod_id = request.getParameter("prod_id");
			String prod_room_seq = request.getParameter("room_seq");
			String prod_room_nm= request.getParameter("room_nm");
			String prod_room_use_st = request.getParameter("room_use_st");
			String prod_room_orderby = request.getParameter("room_orderby");
			String prod_room_img_1 =  request.getParameter("room_img_1_id");
			String prod_room_old_img_1 =  request.getParameter("room_old_img_1_id");
			String prod_room_img_1_del = request.getParameter("room_img_1_del");
			String prod_room_img_2 =  request.getParameter("room_img_2_id");
			String prod_room_old_img_2 =  request.getParameter("room_old_img_2_id");
			String prod_room_img_2_del = request.getParameter("room_img_2_del");
			String prod_room_img_3 =  request.getParameter("room_img_3_id");
			String prod_room_old_img_3 =  request.getParameter("room_old_img_3_id");
			String prod_room_img_3_del = request.getParameter("room_img_3_del");
			String prod_room_img_4 =  request.getParameter("room_img_4_id");
			String prod_room_old_img_4 =  request.getParameter("room_old_img_4_id");
			String prod_room_img_4_del = request.getParameter("room_img_4_del");
			String prod_room_img_5 =  request.getParameter("room_img_5_id");
			String prod_room_old_img_5 =  request.getParameter("room_old_img_5_id");
			String prod_room_img_5_del = request.getParameter("room_img_5_del");
			String prod_room_img_6 =  request.getParameter("room_img_6_id");
			String prod_room_old_img_6 =  request.getParameter("room_old_img_6_id");
			String prod_room_img_6_del = request.getParameter("room_img_6_del");
			String prod_room_img_7 =  request.getParameter("room_img_7_id");
			String prod_room_old_img_7 =  request.getParameter("room_old_img_7_id");
			String prod_room_img_7_del = request.getParameter("room_img_7_del");
			String prod_room_img_8 =  request.getParameter("room_img_8_id");
			String prod_room_old_img_8 =  request.getParameter("room_old_img_8_id");
			String prod_room_img_8_del = request.getParameter("room_img_8_del");
			String prod_room_img_9 =  request.getParameter("room_img_9_id");
			String prod_room_old_img_9 =  request.getParameter("room_old_img_9_id");
			String prod_room_img_9_del = request.getParameter("room_img_9_del");
			String prod_room_img_10 =  request.getParameter("room_img_10_id");
			String prod_room_old_img_10 =  request.getParameter("room_old_img_10_id");
			String prod_room_img_10_del = request.getParameter("room_img_10_del");
			String prod_room_content_1 = request.getParameter("room_content_1");
			String prod_room_content_2 = request.getParameter("room_content_2");
			String prod_room_default_cnt = request.getParameter("room_default_cnt");
			String prod_room_max_cnt = request.getParameter("room_max_cnt");
			String prod_room_adult_price = request.getParameter("room_adult_price");
			String prod_room_young_price = request.getParameter("room_young_price");
			String prod_room_normal_normal_price = request.getParameter("room_normal_normal_price");
			if(prod_room_normal_normal_price == null || prod_room_normal_normal_price == "") {
				prod_room_normal_normal_price = "0";
			}
			String prod_room_normal_normal_sale_price = request.getParameter("room_normal_normal_sale_price");
			if(prod_room_normal_normal_sale_price == null || prod_room_normal_normal_sale_price == "") {
				prod_room_normal_normal_sale_price = "0";
			}
			String prod_room_normal_holiday_price = request.getParameter("room_normal_holiday_price");
			if(prod_room_normal_holiday_price == null || prod_room_normal_holiday_price == "") {
				prod_room_normal_holiday_price = "0";
			}
			String prod_room_normal_holiday_sale_price = request.getParameter("room_normal_holiday_sale_price");
			if(prod_room_normal_holiday_sale_price == null || prod_room_normal_holiday_sale_price == "") {
				prod_room_normal_holiday_sale_price = "0";
			}
			String prod_room_ready_normal_price = request.getParameter("room_ready_normal_price");
			if(prod_room_ready_normal_price == null || prod_room_ready_normal_price == "") {
				prod_room_ready_normal_price = "0";
			}
			String prod_room_ready_normal_sale_price = request.getParameter("room_ready_normal_sale_price");
			if(prod_room_ready_normal_sale_price == null || prod_room_ready_normal_sale_price == "") {
				prod_room_ready_normal_sale_price = "0";
			}
			String prod_room_ready_holiday_price = request.getParameter("room_ready_holiday_price");
			if(prod_room_ready_holiday_price == null || prod_room_ready_holiday_price == "") {
				prod_room_ready_holiday_price = "0";
			}
			String prod_room_ready_holiday_sale_price = request.getParameter("room_ready_holiday_sale_price");
			if(prod_room_ready_holiday_sale_price == null || prod_room_ready_holiday_sale_price == "") {
				prod_room_ready_holiday_sale_price = "0";
			}
			String prod_room_ready2_normal_price = request.getParameter("room_ready2_normal_price");
			if(prod_room_ready2_normal_price == null || prod_room_ready2_normal_price == "") {
				prod_room_ready2_normal_price = "0";
			}
			String prod_room_ready2_normal_sale_price = request.getParameter("room_ready2_normal_sale_price");
			if(prod_room_ready2_normal_sale_price == null || prod_room_ready2_normal_sale_price == "") {
				prod_room_ready2_normal_sale_price = "0";
			}
			String prod_room_ready2_holiday_price = request.getParameter("room_ready2_holiday_price");
			if(prod_room_ready2_holiday_price == null || prod_room_ready2_holiday_price == "") {
				prod_room_ready2_holiday_price = "0";
			}
			String prod_room_ready2_holiday_sale_price = request.getParameter("room_ready2_holiday_sale_price");
			if(prod_room_ready2_holiday_sale_price == null || prod_room_ready2_holiday_sale_price == "") {
				prod_room_ready2_holiday_sale_price = "0";
			}
			String prod_room_busy_normal_price = request.getParameter("room_busy_normal_price");
			if(prod_room_busy_normal_price == null || prod_room_busy_normal_price == "") {
				prod_room_busy_normal_price = "0";
			}
			String prod_room_busy_normal_sale_price = request.getParameter("room_busy_normal_sale_price");
			if(prod_room_busy_normal_sale_price == null || prod_room_busy_normal_sale_price == "") {
				prod_room_busy_normal_sale_price = "0";
			}
			String prod_room_busy_holiday_price = request.getParameter("room_busy_holiday_price");
			if(prod_room_busy_holiday_price == null || prod_room_busy_holiday_price == "") {
				prod_room_busy_holiday_price = "0";
			}
			String prod_room_busy_holiday_sale_price = request.getParameter("room_busy_holiday_sale_price");
			if(prod_room_busy_holiday_sale_price == null || prod_room_busy_holiday_sale_price == "") {
				prod_room_busy_holiday_sale_price = "0";
			}

			if(prod_room_img_1_del == null || prod_room_img_1_del == "") {
				prod_room_img_1_del = "N";
			}
			if(prod_room_img_2_del == null || prod_room_img_2_del == "") {
				prod_room_img_2_del = "N";
			}
			if(prod_room_img_3_del == null || prod_room_img_3_del == "") {
				prod_room_img_3_del = "N";
			}
			if(prod_room_img_4_del == null || prod_room_img_4_del == "") {
				prod_room_img_4_del = "N";
			}
			if(prod_room_img_5_del == null || prod_room_img_5_del == "") {
				prod_room_img_5_del = "N";
			}
			if(prod_room_img_6_del == null || prod_room_img_6_del == "") {
				prod_room_img_6_del = "N";
			}
			if(prod_room_img_7_del == null || prod_room_img_7_del == "") {
				prod_room_img_7_del = "N";
			}
			if(prod_room_img_8_del == null || prod_room_img_8_del == "") {
				prod_room_img_8_del = "N";
			}
			if(prod_room_img_9_del == null || prod_room_img_9_del == "") {
				prod_room_img_9_del = "N";
			}
			if(prod_room_img_10_del == null || prod_room_img_10_del == "") {
				prod_room_img_10_del = "N";
			}			

			if(prod_room_img_1_del.equals("Y")) {
				admgrProductVO.setprod_room_img_1(prod_room_img_1);
			} else {
				if(prod_room_img_1 != null && prod_room_img_1 != "") {
					admgrProductVO.setprod_room_img_1(prod_room_img_1);
				} else {
					admgrProductVO.setprod_room_img_1(prod_room_old_img_1);
				}
			}
			if(prod_room_img_2_del.equals("Y")) {
				admgrProductVO.setprod_room_img_2(prod_room_img_2);
			} else {
				if(prod_room_img_2 != null && prod_room_img_2 != "") {
					admgrProductVO.setprod_room_img_2(prod_room_img_2);
				} else {
					admgrProductVO.setprod_room_img_2(prod_room_old_img_2);
				}
			}
			if(prod_room_img_3_del.equals("Y")) {
				admgrProductVO.setprod_room_img_3(prod_room_img_3);
			} else {
				if(prod_room_img_3 != null && prod_room_img_3 != "") {
					admgrProductVO.setprod_room_img_3(prod_room_img_3);
				} else {
					admgrProductVO.setprod_room_img_3(prod_room_old_img_3);
				}
			}
			if(prod_room_img_4_del.equals("Y")) {
				admgrProductVO.setprod_room_img_4(prod_room_img_4);
			} else {
				if(prod_room_img_4 != null && prod_room_img_4 != "") {
					admgrProductVO.setprod_room_img_4(prod_room_img_4);
				} else {
					admgrProductVO.setprod_room_img_4(prod_room_old_img_4);
				}
			}
			if(prod_room_img_5_del.equals("Y")) {
				admgrProductVO.setprod_room_img_5(prod_room_img_5);
			} else {
				if(prod_room_img_5 != null && prod_room_img_5 != "") {
					admgrProductVO.setprod_room_img_5(prod_room_img_5);
				} else {
					admgrProductVO.setprod_room_img_5(prod_room_old_img_5);
				}
			}
			if(prod_room_img_6_del.equals("Y")) {
				admgrProductVO.setprod_room_img_6(prod_room_img_6);
			} else {
				if(prod_room_img_6 != null && prod_room_img_6 != "") {
					admgrProductVO.setprod_room_img_6(prod_room_img_6);
				} else {
					admgrProductVO.setprod_room_img_6(prod_room_old_img_6);
				}
			}
			if(prod_room_img_7_del.equals("Y")) {
				admgrProductVO.setprod_room_img_7(prod_room_img_7);
			} else {
				if(prod_room_img_7 != null && prod_room_img_7 != "") {
					admgrProductVO.setprod_room_img_7(prod_room_img_7);
				} else {
					admgrProductVO.setprod_room_img_7(prod_room_old_img_7);
				}
			}
			if(prod_room_img_8_del.equals("Y")) {
				admgrProductVO.setprod_room_img_8(prod_room_img_8);
			} else {
				if(prod_room_img_8 != null && prod_room_img_8 != "") {
					admgrProductVO.setprod_room_img_8(prod_room_img_8);
				} else {
					admgrProductVO.setprod_room_img_8(prod_room_old_img_8);
				}
			}
			if(prod_room_img_9_del.equals("Y")) {
				admgrProductVO.setprod_room_img_9(prod_room_img_9);
			} else {
				if(prod_room_img_9 != null && prod_room_img_9 != "") {
					admgrProductVO.setprod_room_img_9(prod_room_img_9);
				} else {
					admgrProductVO.setprod_room_img_9(prod_room_old_img_9);
				}
			}
			if(prod_room_img_10_del.equals("Y")) {
				admgrProductVO.setprod_room_img_10(prod_room_img_10);
			} else {
				if(prod_room_img_10 != null && prod_room_img_10 != "") {
					admgrProductVO.setprod_room_img_10(prod_room_img_10);
				} else {
					admgrProductVO.setprod_room_img_10(prod_room_old_img_10);
				}
			}			

			admgrProductVO.setprod_id(prod_id);
			admgrProductVO.setprod_room_seq(prod_room_seq);
			admgrProductVO.setprod_room_nm(prod_room_nm);
			admgrProductVO.setprod_room_use_st(prod_room_use_st);
			admgrProductVO.setprod_room_orderby(prod_room_orderby);

			admgrProductVO.setprod_room_content_1(prod_room_content_1);
			admgrProductVO.setprod_room_content_2(prod_room_content_2);
			admgrProductVO.setprod_room_default_cnt(prod_room_default_cnt);
			admgrProductVO.setprod_room_max_cnt(prod_room_max_cnt);
			admgrProductVO.setprod_room_adult_price(prod_room_adult_price);
			admgrProductVO.setprod_room_young_price(prod_room_young_price);
			admgrProductVO.setprod_room_normal_normal_price(prod_room_normal_normal_price);
			admgrProductVO.setprod_room_normal_normal_sale_price(prod_room_normal_normal_sale_price);
			admgrProductVO.setprod_room_normal_holiday_price(prod_room_normal_holiday_price);
			admgrProductVO.setprod_room_normal_holiday_sale_price(prod_room_normal_holiday_sale_price);
			admgrProductVO.setprod_room_ready_normal_price(prod_room_ready_normal_price);
			admgrProductVO.setprod_room_ready_normal_sale_price(prod_room_ready_normal_sale_price);
			admgrProductVO.setprod_room_ready_holiday_price(prod_room_ready_holiday_price);
			admgrProductVO.setprod_room_ready_holiday_sale_price(prod_room_ready_holiday_sale_price);
			admgrProductVO.setprod_room_ready2_normal_price(prod_room_ready2_normal_price);
			admgrProductVO.setprod_room_ready2_normal_sale_price(prod_room_ready2_normal_sale_price);
			admgrProductVO.setprod_room_ready2_holiday_price(prod_room_ready2_holiday_price);
			admgrProductVO.setprod_room_ready2_holiday_sale_price(prod_room_ready2_holiday_sale_price);
			admgrProductVO.setprod_room_busy_normal_price(prod_room_busy_normal_price);
			admgrProductVO.setprod_room_busy_normal_sale_price(prod_room_busy_normal_sale_price);
			admgrProductVO.setprod_room_busy_holiday_price(prod_room_busy_holiday_price);
			admgrProductVO.setprod_room_busy_holiday_sale_price(prod_room_busy_holiday_sale_price);

			if(prod_room_seq != null && prod_room_seq != "") {
				admgrProductService.update_room(admgrProductVO);				
			} else {
				admgrProductService.insert_room(admgrProductVO);
			}
		
			model.addAttribute("res", "Y");
		return "/admgr/admgrModal/modalRoomResult";
		}
	}
	
	
	//===============================================================================================================
	// *  숙박 - 룸정보 삭제
	//===============================================================================================================
	@RequestMapping(value = "/admgr/admgrModal/setRoomDel.do")
	public String admgrsetRoomDel(
			@ModelAttribute("AdmgrProductVO") AdmgrProductVO admgrProductVO,
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
			
			String prod_room_seq = request.getParameter("room_seq");
			admgrProductVO.setprod_room_seq(prod_room_seq);
			
			admgrProductService.delete_room(admgrProductVO);
			
			model.addAttribute("res", "Y");
			return "/admgr/admgrModal/modalRoomResult";
		}
	}
	
	

}