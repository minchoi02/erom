package egovframework.admgrCustomer.web;
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

import egovframework.admgrCustomer.service.AdmgrCustomerService;
import egovframework.admgrCustomer.service.AdmgrCustomerVO;
import egovframework.admgrExtention.service.AdmgrExtentionService;
import egovframework.admgrExtention.service.AdmgrExtentionVO;
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
public class AdmgrCustomerController {
	
	@Resource(name = "AdmgrCustomerService")
	private AdmgrCustomerService admgrCustomerService;	
	
	@Resource(name = "BaseService")
	private BaseService baseService;	
	
	@Resource(name = "AdmgrMemberService")
	private AdmgrMemberService admgrMemberService;	
	
	@Resource(name = "AdmgrProductService")
	private AdmgrProductService admgrProductService;	
	
	@Resource(name = "AdmgrStoreService")
	private AdmgrStoreService admgrStoreService;	
	
	@Resource(name = "AdmgrExtentionService")
	private AdmgrExtentionService admgrExtentionService;	
	
	/** EgovPropertyService */
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;
	
	//===============================================================================================================
	// * ???????????? ??????
	//===============================================================================================================
	@RequestMapping(value = "/admgr/admgrCustomer/noticeList.do")
	public String admgrnoticeList(
			@ModelAttribute("admgrCustomerVO") AdmgrCustomerVO admgrCustomerVO, 
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
			out.println("<script>alert('????????????????????? ???????????????.'); location.href='/admgr/login.do'; </script>");
			out.flush();
			return null;
		}  else {
			
			if(adminLevel.equals("5")) {
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>alert('????????? ???????????????.'); history.back();</script>");
				out.flush();
				return null;
			}
			
			String bbs_id = "NOTICE";
			String searchKey = request.getParameter("searchKey");
			String searchKeyword = request.getParameter("searchKeyword");
			model.addAttribute("bbs_id", bbs_id);
			model.addAttribute("searchKey", searchKey);
			model.addAttribute("searchKeyword", searchKeyword);
			admgrCustomerVO.setbbs_id(bbs_id);
			admgrCustomerVO.setsearchKey(searchKey);
			admgrCustomerVO.setsearchKeyword(searchKeyword);
			
			/** pageing start */
			admgrCustomerVO.setPageUnit(15);
			admgrCustomerVO.setPageSize(10); 
			PaginationInfo paginationInfo = new PaginationInfo();
			paginationInfo.setCurrentPageNo(admgrCustomerVO.getPageIndex());
			paginationInfo.setRecordCountPerPage(admgrCustomerVO.getPageUnit());
			paginationInfo.setPageSize(admgrCustomerVO.getPageSize());

			admgrCustomerVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
			admgrCustomerVO.setLastIndex(paginationInfo.getLastRecordIndex());
			admgrCustomerVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

			// ???????????? ?????????
			int ListCnt = admgrCustomerService.get_bbs_list_cnt(admgrCustomerVO);
			paginationInfo.setTotalRecordCount(ListCnt);
			model.addAttribute("TotalCnt", ListCnt);
			model.addAttribute("paginationInfo", paginationInfo);

			// ??????????????? ??????????????? ?????????.
			int StartPageNumber = ListCnt - (admgrCustomerVO.getPageUnit() * (admgrCustomerVO.getPageIndex()-1)) + 1;
			model.addAttribute("StartPageNumber", StartPageNumber);
			/** paging end **/

			model.addAttribute("bbsNoticeList", admgrCustomerService.get_bbs_notice_list(admgrCustomerVO));			
			model.addAttribute("bbsList", admgrCustomerService.get_bbs_list(admgrCustomerVO));			
			
			return "/admgr/admgrCustomer/noticeList";
		}
	}

	//===============================================================================================================
	// *  ???????????? ???
	//===============================================================================================================
	@RequestMapping(value = "/admgr/admgrCustomer/noticeForm.do")
	public String admgrnoticeForm(
			@ModelAttribute("admgrCustomerVO") AdmgrCustomerVO admgrCustomerVO, 
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
			out.println("<script>alert('????????????????????? ???????????????.'); location.href='/admgr/login.do'; </script>");
			out.flush();
			return null;
		}  else {
			
			if(adminLevel.equals("5")) {
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>alert('????????? ???????????????.'); history.back();</script>");
				out.flush();
				return null;
			}

			String bbs_id = "NOTICE";
			String bbs_seq = request.getParameter("bbs_seq");
			String searchKey = request.getParameter("searchKey");
			String searchKeyword = request.getParameter("searchKeyword");
			String pageIndex = request.getParameter("pageIndex");
			if(pageIndex == null || pageIndex =="") {
				pageIndex = "1";
			}
			model.addAttribute("bbs_id", bbs_id);
			model.addAttribute("bbs_seq", bbs_seq);
			model.addAttribute("searchKey", searchKey);
			model.addAttribute("searchKeyword", searchKeyword);
			model.addAttribute("pageIndex", pageIndex);
			admgrCustomerVO.setbbs_id(bbs_id);
			admgrCustomerVO.setbbs_seq(bbs_seq);
			admgrCustomerVO.setsearchKey(searchKey);
			admgrCustomerVO.setsearchKeyword(searchKeyword);
			admgrCustomerVO.setpageIndex(pageIndex);

			if(bbs_seq != null && bbs_seq !="") {
				AdmgrCustomerVO bbsInfo = admgrCustomerService.get_bbs_info(admgrCustomerVO);
				
				baseVO.setfild_id(bbsInfo.getbbs_file1());
				model.addAttribute("bbs_file1_info", baseService.getFileInfo(baseVO));
				baseVO.setfild_id(bbsInfo.getbbs_file2());
				model.addAttribute("bbs_file2_info", baseService.getFileInfo(baseVO));
	
				model.addAttribute("bbsInfo", bbsInfo);
			}
			
			return "/admgr/admgrCustomer/noticeForm";
		
		}
	}

	//===============================================================================================================
	// *  ???????????? ??????
	//===============================================================================================================
	@RequestMapping(value = "/admgr/admgrCustomer/noticeAction.do")
	public void admgrnoticeAction(
			@ModelAttribute("admgrCustomerVO") AdmgrCustomerVO admgrCustomerVO, 
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
			out.println("<script>alert('????????????????????? ???????????????.'); location.href='/admgr/login.do'; </script>");
			out.flush();
			return;
		}  else {
			
			if(adminLevel.equals("5")) {
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>alert('????????? ???????????????.'); history.back();</script>");
				out.flush();
				return;
			}

			String bbs_id = "NOTICE";
			String bbs_seq = request.getParameter("bbs_seq");
			String searchKey = request.getParameter("searchKey");
			String searchKeyword = request.getParameter("searchKeyword");
			String pageIndex = request.getParameter("pageIndex");
			if(pageIndex == null || pageIndex =="") {
				pageIndex = "1";
			}
			String return_url = request.getParameter("return_url");
			model.addAttribute("bbs_id", bbs_id);
			model.addAttribute("bbs_seq", bbs_seq);
			model.addAttribute("searchKey", searchKey);
			model.addAttribute("searchKeyword", searchKeyword);
			model.addAttribute("pageIndex", pageIndex);
			model.addAttribute("return_url", return_url);
			admgrCustomerVO.setbbs_id(bbs_id);
			admgrCustomerVO.setbbs_seq(bbs_seq);
			admgrCustomerVO.setsearchKey(searchKey);
			admgrCustomerVO.setsearchKeyword(searchKeyword);
			admgrCustomerVO.setpageIndex(pageIndex);
	
			String bbs_subject = request.getParameter("bbs_subject");
			String bbs_notice_st = request.getParameter("bbs_notice_st");
			String bbs_secure_st = request.getParameter("bbs_secure_st");
			String bbs_content = request.getParameter("bbs_content");
			String bbs_reply_subject = request.getParameter("bbs_reply_subject");
			String bbs_reply_content = request.getParameter("bbs_reply_content");
			String bbs_file1 = request.getParameter("bbs_file1_id");
			String bbs_old_file1 = request.getParameter("bbs_old_file1_id");
			String bbs_file1_del = request.getParameter("bbs_file1_del");
			String bbs_file2 = request.getParameter("bbs_file2_id");
			String bbs_old_file2 = request.getParameter("bbs_old_file2_id");
			String bbs_file2_del = request.getParameter("bbs_file2_del");
				
			if(bbs_notice_st == null || bbs_notice_st == "") {
				bbs_notice_st = "N";
			}
			if(bbs_secure_st == null || bbs_secure_st == "") {
				bbs_secure_st = "N";
			}
			if(bbs_file1_del == null || bbs_file1_del == "") {
				bbs_file1_del = "N";
			}
			if(bbs_file2_del == null || bbs_file2_del == "") {
				bbs_file2_del = "N";
			}

			admgrCustomerVO.setbbs_subject(bbs_subject);
			admgrCustomerVO.setbbs_notice_st(bbs_notice_st);
			admgrCustomerVO.setbbs_secure_st(bbs_secure_st);
			admgrCustomerVO.setbbs_content(bbs_content);
			admgrCustomerVO.setbbs_reply_subject(bbs_reply_subject);
			admgrCustomerVO.setbbs_reply_content(bbs_reply_content);

			String save_mode = "insert";
			if(bbs_seq != "" && bbs_seq != null) {
				save_mode = "update";
			}
			
			if(("insert").equals(save_mode)) { 	//????????????..
				admgrCustomerVO.setbbs_file1(bbs_file1);
				admgrCustomerVO.setbbs_file2(bbs_file2);
				admgrCustomerVO.setdel_st("N");
				admgrCustomerService.insert_bbs(admgrCustomerVO);
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>alert('?????????????????????.'); location.replace('/admgr/admgrCustomer/noticeList.do'); </script>");
				out.flush();
				return;
			} else { 	//????????????..
				if(bbs_file1_del.equals("Y")) {
					admgrCustomerVO.setbbs_file1(bbs_file1);
				} else {
					if(bbs_file1 != null && bbs_file1 != "") {
						admgrCustomerVO.setbbs_file1(bbs_file1);
					} else {
						admgrCustomerVO.setbbs_file1(bbs_old_file1);
					}
				}
				if(bbs_file2_del.equals("Y")) {
					admgrCustomerVO.setbbs_file2(bbs_file2);
				} else {
					if(bbs_file2 != null && bbs_file2 != "") {
						admgrCustomerVO.setbbs_file2(bbs_file2);
					} else {
						admgrCustomerVO.setbbs_file2(bbs_old_file2);
					}
				}
				admgrCustomerService.update_bbs(admgrCustomerVO);
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>alert('?????????????????????.'); location.replace('"+return_url+"'); </script>");
				out.flush();			
				return;
			}
		
		}
	}
	

	//===============================================================================================================
	// * 1:1?????? ??????
	//===============================================================================================================
	@RequestMapping(value = "/admgr/admgrCustomer/mtmList.do")
	public String admgrmtmList(
			@ModelAttribute("admgrCustomerVO") AdmgrCustomerVO admgrCustomerVO, 
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
			out.println("<script>alert('????????????????????? ???????????????.'); location.href='/admgr/login.do'; </script>");
			out.flush();
			return null;
		}  else {
			
			if(adminLevel.equals("5")) {
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>alert('????????? ???????????????.'); history.back();</script>");
				out.flush();
				return null;
			}

			String bbs_id = "MTM";
			String searchKey = request.getParameter("searchKey");
			String searchKeyword = request.getParameter("searchKeyword");
			model.addAttribute("bbs_id", bbs_id);
			model.addAttribute("searchKey", searchKey);
			model.addAttribute("searchKeyword", searchKeyword);
			admgrCustomerVO.setbbs_id(bbs_id);
			admgrCustomerVO.setsearchKey(searchKey);
			admgrCustomerVO.setsearchKeyword(searchKeyword);
			
			/** pageing start */
			admgrCustomerVO.setPageUnit(15);
			admgrCustomerVO.setPageSize(10); 
			PaginationInfo paginationInfo = new PaginationInfo();
			paginationInfo.setCurrentPageNo(admgrCustomerVO.getPageIndex());
			paginationInfo.setRecordCountPerPage(admgrCustomerVO.getPageUnit());
			paginationInfo.setPageSize(admgrCustomerVO.getPageSize());

			admgrCustomerVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
			admgrCustomerVO.setLastIndex(paginationInfo.getLastRecordIndex());
			admgrCustomerVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

			// ???????????? ?????????
			int ListCnt = admgrCustomerService.get_bbs_list_cnt(admgrCustomerVO);
			paginationInfo.setTotalRecordCount(ListCnt);
			model.addAttribute("TotalCnt", ListCnt);
			model.addAttribute("paginationInfo", paginationInfo);

			// ??????????????? ??????????????? ?????????.
			int StartPageNumber = ListCnt - (admgrCustomerVO.getPageUnit() * (admgrCustomerVO.getPageIndex()-1)) + 1;
			model.addAttribute("StartPageNumber", StartPageNumber);
			/** paging end **/

			model.addAttribute("bbsNoticeList", admgrCustomerService.get_bbs_notice_list(admgrCustomerVO));			
			model.addAttribute("bbsList", admgrCustomerService.get_bbs_list(admgrCustomerVO));			
			
			return "/admgr/admgrCustomer/mtmList";
		}
	}

	//===============================================================================================================
	// *  1:1?????? ???
	//===============================================================================================================
	@RequestMapping(value = "/admgr/admgrCustomer/mtmForm.do")
	public String admgrmtmForm(
			@ModelAttribute("admgrCustomerVO") AdmgrCustomerVO admgrCustomerVO, 
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
			out.println("<script>alert('????????????????????? ???????????????.'); location.href='/admgr/login.do'; </script>");
			out.flush();
			return null;
		}  else {
			
			if(adminLevel.equals("5")) {
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>alert('????????? ???????????????.'); history.back();</script>");
				out.flush();
				return null;
			}

			String bbs_id = "MTM";
			String bbs_seq = request.getParameter("bbs_seq");
			String searchKey = request.getParameter("searchKey");
			String searchKeyword = request.getParameter("searchKeyword");
			String pageIndex = request.getParameter("pageIndex");
			if(pageIndex == null || pageIndex =="") {
				pageIndex = "1";
			}
			model.addAttribute("bbs_id", bbs_id);
			model.addAttribute("bbs_seq", bbs_seq);
			model.addAttribute("searchKey", searchKey);
			model.addAttribute("searchKeyword", searchKeyword);
			model.addAttribute("pageIndex", pageIndex);
			admgrCustomerVO.setbbs_id(bbs_id);
			admgrCustomerVO.setbbs_seq(bbs_seq);
			admgrCustomerVO.setsearchKey(searchKey);
			admgrCustomerVO.setsearchKeyword(searchKeyword);
			admgrCustomerVO.setpageIndex(pageIndex);
			
			AdmgrCustomerVO bbsInfo = admgrCustomerService.get_bbs_info(admgrCustomerVO);
			model.addAttribute("bbsInfo", bbsInfo);
			
			String user_id = bbsInfo.getuser_id();
			String reply_user_id = bbsInfo.getreply_user_id();
			
			admgrMemberVO.setuser_id(user_id);
			model.addAttribute("userInfo", admgrMemberService.get_member_id_info(admgrMemberVO));

			admgrMemberVO.setuser_id(reply_user_id);
			model.addAttribute("replyuserInfo", admgrMemberService.get_member_id_info(admgrMemberVO));
			
			return "/admgr/admgrCustomer/mtmForm";
		}
	}
	
	//===============================================================================================================
	// *  1:1?????? ??????
	//===============================================================================================================
	@RequestMapping(value = "/admgr/admgrCustomer/mtmAction.do")
	public void admgrmtmAction(
			@ModelAttribute("admgrCustomerVO") AdmgrCustomerVO admgrCustomerVO, 
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
			out.println("<script>alert('????????????????????? ???????????????.'); location.href='/admgr/login.do'; </script>");
			out.flush();
			return;
		}  else {
			
			if(adminLevel.equals("5")) {
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>alert('????????? ???????????????.'); history.back();</script>");
				out.flush();
				return;
			}

			String bbs_id = "MTM";
			String bbs_seq = request.getParameter("bbs_seq");
			String searchKey = request.getParameter("searchKey");
			String searchKeyword = request.getParameter("searchKeyword");
			String pageIndex = request.getParameter("pageIndex");
			String modify_style = request.getParameter("modify_style");
			if(pageIndex == null || pageIndex =="") {
				pageIndex = "1";
			}
			String return_url = request.getParameter("return_url");
			String reply_del_st = "N";
			model.addAttribute("bbs_id", bbs_id);
			model.addAttribute("bbs_seq", bbs_seq);
			model.addAttribute("searchKey", searchKey);
			model.addAttribute("searchKeyword", searchKeyword);
			model.addAttribute("pageIndex", pageIndex);
			model.addAttribute("return_url", return_url);
			admgrCustomerVO.setbbs_id(bbs_id);
			admgrCustomerVO.setbbs_seq(bbs_seq);
			admgrCustomerVO.setsearchKey(searchKey);
			admgrCustomerVO.setsearchKeyword(searchKeyword);
			admgrCustomerVO.setpageIndex(pageIndex);
			admgrCustomerVO.setreply_del_st(reply_del_st);
			admgrCustomerVO.setmodify_style(modify_style);
	
			String bbs_reply_subject = request.getParameter("bbs_reply_subject");
			String bbs_reply_content = request.getParameter("bbs_reply_content");
			String bbs_user_hp = request.getParameter("bbs_user_hp");

			admgrCustomerVO.setbbs_reply_subject(bbs_reply_subject);
			admgrCustomerVO.setbbs_reply_content(bbs_reply_content);
			
			if(bbs_user_hp != null && bbs_user_hp != "") {
				String Add = "REPLYMODIFY";
				if(("reply_insert").equals(modify_style)) {
					Add = "REPLY";
				}
				baseVO.setsms_cd(bbs_id+Add);
				baseVO.setbbs_id(bbs_id);
				baseVO.setprod_id("");
				baseVO.setuser_hp(bbs_user_hp);
				baseService.sendSms(baseVO);
			}

			admgrCustomerService.update_bbs(admgrCustomerVO);
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('?????????????????????.'); location.replace('"+return_url+"'); </script>");
			out.flush();			
			return;
			
		}
	}


	//===============================================================================================================
	// * ??????QnA ??????
	//===============================================================================================================
	@RequestMapping(value = "/admgr/admgrCustomer/qnaList.do")
	public String admgrqnaList(
			@ModelAttribute("admgrCustomerVO") AdmgrCustomerVO admgrCustomerVO, 
			@ModelAttribute("admgrProductVO") AdmgrProductVO admgrProductVO, 
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
			out.println("<script>alert('????????????????????? ???????????????.'); location.href='/admgr/login.do'; </script>");
			out.flush();
			return null;
		}  else {
			
			if(adminLevel.equals("5")) {
				admgrProductVO.setuser_id(adminId);
				
				// ???????????????????????? ????????????????????? ??????????????? ????????????.
				List<AdmgrProductVO> get_id_store_list = admgrProductService.get_id_store_list(admgrProductVO);
				String sql_or = "(";
				String or = "";
				for(int i = 0; i<get_id_store_list.size(); i++) {
					if(i == 0) { or = ""; } 
					else { or = ","; }
					sql_or += or + "'"+get_id_store_list.get(i).getstore_id()+"'";  
				}
				sql_or += ")";

				admgrCustomerVO.setuser_level(adminLevel);
				admgrCustomerVO.setbbs_store_id(sql_or);
			}
			
			String bbs_id = "QNA";
			String searchKey = request.getParameter("searchKey");
			String searchKeyword = request.getParameter("searchKeyword");
			String store_category = request.getParameter("store_category");
			model.addAttribute("bbs_id", bbs_id);
			model.addAttribute("searchKey", searchKey);
			model.addAttribute("searchKeyword", searchKeyword);
			model.addAttribute("store_category", store_category);
			admgrCustomerVO.setbbs_id(bbs_id);
			admgrCustomerVO.setsearchKey(searchKey);
			admgrCustomerVO.setsearchKeyword(searchKeyword);
			admgrCustomerVO.setbbs_store_category(store_category);
			
			/** pageing start */
			admgrCustomerVO.setPageUnit(15);
			admgrCustomerVO.setPageSize(10); 
			PaginationInfo paginationInfo = new PaginationInfo();
			paginationInfo.setCurrentPageNo(admgrCustomerVO.getPageIndex());
			paginationInfo.setRecordCountPerPage(admgrCustomerVO.getPageUnit());
			paginationInfo.setPageSize(admgrCustomerVO.getPageSize());

			admgrCustomerVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
			admgrCustomerVO.setLastIndex(paginationInfo.getLastRecordIndex());
			admgrCustomerVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

			// ???????????? ?????????
			int ListCnt = admgrCustomerService.get_bbs_list_cnt(admgrCustomerVO);
			paginationInfo.setTotalRecordCount(ListCnt);
			model.addAttribute("TotalCnt", ListCnt);
			model.addAttribute("paginationInfo", paginationInfo);

			// ??????????????? ??????????????? ?????????.
			int StartPageNumber = ListCnt - (admgrCustomerVO.getPageUnit() * (admgrCustomerVO.getPageIndex()-1)) + 1;
			model.addAttribute("StartPageNumber", StartPageNumber);
			/** paging end **/

			model.addAttribute("bbsList", admgrCustomerService.get_bbs_list(admgrCustomerVO));			
			
			return "/admgr/admgrCustomer/qnaList";
		}
	}

	//===============================================================================================================
	// * ??????QnA ???
	//===============================================================================================================
	@RequestMapping(value = "/admgr/admgrCustomer/qnaForm.do")
	public String admgrqnaForm(
			@ModelAttribute("admgrCustomerVO") AdmgrCustomerVO admgrCustomerVO, 
			@ModelAttribute("admgrMemberVO") AdmgrMemberVO admgrMemberVO, 
			@ModelAttribute("admgrProductVO") AdmgrProductVO admgrProductVO, 
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
			out.println("<script>alert('????????????????????? ???????????????.'); location.href='/admgr/login.do'; </script>");
			out.flush();
			return null;
		}  else {
			
			if(adminLevel.equals("5")) {
				admgrProductVO.setuser_id(adminId);
				
				// ???????????????????????? ????????????????????? ??????????????? ????????????.
				List<AdmgrProductVO> get_id_store_list = admgrProductService.get_id_store_list(admgrProductVO);
				String sql_or = "(";
				String or = "";
				for(int i = 0; i<get_id_store_list.size(); i++) {
					if(i == 0) { or = ""; } 
					else { or = ","; }
					sql_or += or + "'"+get_id_store_list.get(i).getstore_id()+"'";  
				}
				sql_or += ")";

				admgrCustomerVO.setuser_level(adminLevel);
				admgrCustomerVO.setbbs_store_id(sql_or);
			}
			
			String bbs_id = "QNA";
			String store_category = request.getParameter("store_category");
			String bbs_seq = request.getParameter("bbs_seq");
			String searchKey = request.getParameter("searchKey");
			String searchKeyword = request.getParameter("searchKeyword");
			String pageIndex = request.getParameter("pageIndex");
			if(pageIndex == null || pageIndex =="") {
				pageIndex = "1";
			}
			model.addAttribute("bbs_id", bbs_id);
			model.addAttribute("store_category", store_category);
			model.addAttribute("bbs_seq", bbs_seq);
			model.addAttribute("searchKey", searchKey);
			model.addAttribute("searchKeyword", searchKeyword);
			model.addAttribute("pageIndex", pageIndex);
			admgrCustomerVO.setbbs_id(bbs_id);
			admgrCustomerVO.setbbs_store_category(store_category);
			admgrCustomerVO.setbbs_seq(bbs_seq);
			admgrCustomerVO.setsearchKey(searchKey);
			admgrCustomerVO.setsearchKeyword(searchKeyword);
			admgrCustomerVO.setpageIndex(pageIndex);
			
			AdmgrCustomerVO bbsInfo = admgrCustomerService.get_bbs_info(admgrCustomerVO);
			model.addAttribute("bbsInfo", bbsInfo);
			if(bbsInfo == null) {
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>alert('?????? ?????????, ????????? ???????????????.'); history.back(); </script>");
				out.flush();
				return null;
			}
			
			String get_user_id = bbsInfo.getuser_id();
			String get_reply_user_id = bbsInfo.getreply_user_id();
			String get_store_category = bbsInfo.getbbs_store_category();
			String get_store_id= bbsInfo.getbbs_store_id();
			String get_prod_id = bbsInfo.getbbs_prod_id();
			
			admgrMemberVO.setuser_id(get_user_id);
			model.addAttribute("userInfo", admgrMemberService.get_member_id_info(admgrMemberVO));

			admgrMemberVO.setuser_id(get_reply_user_id);
			model.addAttribute("replyuserInfo", admgrMemberService.get_member_id_info(admgrMemberVO));

			admgrStoreVO.setstore_id(get_store_id);
			model.addAttribute("storeInfo", admgrStoreService.get_store_simple_id_info(admgrStoreVO));

			admgrProductVO.setprod_id(get_prod_id);
			model.addAttribute("prodInfo", admgrProductService.get_prod_simple_id_info(admgrProductVO));

			return "/admgr/admgrCustomer/qnaForm";
		}
	}
	
	//===============================================================================================================
	// * ??????QnA ??????
	//===============================================================================================================
	@RequestMapping(value = "/admgr/admgrCustomer/qnaAction.do")
	public void admgrqnaAction(
			@ModelAttribute("admgrCustomerVO") AdmgrCustomerVO admgrCustomerVO, 
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
			out.println("<script>alert('????????????????????? ???????????????.'); location.href='/admgr/login.do'; </script>");
			out.flush();
			return;
		}  else {
			
			String bbs_id = "QNA";
			String store_category = request.getParameter("store_category");
			String bbs_seq = request.getParameter("bbs_seq");
			String searchKey = request.getParameter("searchKey");
			String searchKeyword = request.getParameter("searchKeyword");
			String pageIndex = request.getParameter("pageIndex");
			String modify_style = request.getParameter("modify_style");
			if(pageIndex == null || pageIndex =="") {
				pageIndex = "1";
			}
			String return_url = request.getParameter("return_url");
			String reply_del_st = "N";
			model.addAttribute("bbs_id", bbs_id);
			model.addAttribute("bbs_seq", bbs_seq);
			model.addAttribute("searchKey", searchKey);
			model.addAttribute("searchKeyword", searchKeyword);
			model.addAttribute("pageIndex", pageIndex);
			model.addAttribute("return_url", return_url);
			model.addAttribute("store_category", store_category);
			admgrCustomerVO.setbbs_id(bbs_id);
			admgrCustomerVO.setbbs_seq(bbs_seq);
			admgrCustomerVO.setsearchKey(searchKey);
			admgrCustomerVO.setsearchKeyword(searchKeyword);
			admgrCustomerVO.setpageIndex(pageIndex);
			admgrCustomerVO.setreply_del_st(reply_del_st);
			admgrCustomerVO.setmodify_style(modify_style);
	
			String bbs_reply_user_id = adminId;
			String bbs_reply_subject = request.getParameter("bbs_reply_subject");
			String bbs_reply_content = request.getParameter("bbs_reply_content");
			String bbs_user_hp = request.getParameter("bbs_user_hp");
			String bbs_prod_id = request.getParameter("bbs_prod_id");
			
			admgrCustomerVO.setbbs_reply_user_id(bbs_reply_user_id);
			admgrCustomerVO.setbbs_reply_subject(bbs_reply_subject);
			admgrCustomerVO.setbbs_reply_content(bbs_reply_content);

			admgrCustomerService.update_bbs(admgrCustomerVO);
			
			if(bbs_user_hp != null && bbs_user_hp != "") {
				String Add = "REPLYMODIFY";
				if(("reply_insert").equals(modify_style)) {
					Add = "REPLY";
				}
				baseVO.setsms_cd(bbs_id+Add);
				baseVO.setbbs_id(bbs_id);
				baseVO.setprod_id(bbs_prod_id);
				baseVO.setuser_hp(bbs_user_hp);
				baseService.sendSms(baseVO);
			}
			
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('?????????????????????.'); location.replace('"+return_url+"'); </script>");
			out.flush();			
			return;
			
		}
	}

	//===============================================================================================================
	// * ?????? ??????
	//===============================================================================================================
	@RequestMapping(value = "/admgr/admgrCustomer/reviewList.do")
	public String admgrreviewList(
			@ModelAttribute("admgrCustomerVO") AdmgrCustomerVO admgrCustomerVO, 
			@ModelAttribute("admgrProductVO") AdmgrProductVO admgrProductVO, 
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
			out.println("<script>alert('????????????????????? ???????????????.'); location.href='/admgr/login.do'; </script>");
			out.flush();
			return null;
		}  else {
			
			if(adminLevel.equals("5")) {
				admgrProductVO.setuser_id(adminId);
				
				// ???????????????????????? ????????????????????? ??????????????? ????????????.
				List<AdmgrProductVO> get_id_store_list = admgrProductService.get_id_store_list(admgrProductVO);
				String sql_or = "(";
				String or = "";
				for(int i = 0; i<get_id_store_list.size(); i++) {
					if(i == 0) { or = ""; } 
					else { or = ","; }
					sql_or += or + "'"+get_id_store_list.get(i).getstore_id()+"'";  
				}
				sql_or += ")";

				admgrCustomerVO.setuser_level(adminLevel);
				admgrCustomerVO.setbbs_store_id(sql_or);
			}
			
			String bbs_id = "REVIEW";
			String searchKey = request.getParameter("searchKey");
			String searchKeyword = request.getParameter("searchKeyword");
			String store_category = request.getParameter("store_category");
			model.addAttribute("bbs_id", bbs_id);
			model.addAttribute("searchKey", searchKey);
			model.addAttribute("searchKeyword", searchKeyword);
			model.addAttribute("store_category", store_category);
			admgrCustomerVO.setbbs_id(bbs_id);
			admgrCustomerVO.setsearchKey(searchKey);
			admgrCustomerVO.setsearchKeyword(searchKeyword);
			admgrCustomerVO.setbbs_store_category(store_category);
			
			/** pageing start */
			admgrCustomerVO.setPageUnit(15);
			admgrCustomerVO.setPageSize(10); 
			PaginationInfo paginationInfo = new PaginationInfo();
			paginationInfo.setCurrentPageNo(admgrCustomerVO.getPageIndex());
			paginationInfo.setRecordCountPerPage(admgrCustomerVO.getPageUnit());
			paginationInfo.setPageSize(admgrCustomerVO.getPageSize());

			admgrCustomerVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
			admgrCustomerVO.setLastIndex(paginationInfo.getLastRecordIndex());
			admgrCustomerVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

			// ???????????? ?????????
			int ListCnt = admgrCustomerService.get_bbs_list_cnt(admgrCustomerVO);
			paginationInfo.setTotalRecordCount(ListCnt);
			model.addAttribute("TotalCnt", ListCnt);
			model.addAttribute("paginationInfo", paginationInfo);

			// ??????????????? ??????????????? ?????????.
			int StartPageNumber = ListCnt - (admgrCustomerVO.getPageUnit() * (admgrCustomerVO.getPageIndex()-1)) + 1;
			model.addAttribute("StartPageNumber", StartPageNumber);
			/** paging end **/

			model.addAttribute("bbsList", admgrCustomerService.get_bbs_list(admgrCustomerVO));			

			return "/admgr/admgrCustomer/reviewList";
		}
	}

	//===============================================================================================================
	// * ?????? ???
	//===============================================================================================================
	@RequestMapping(value = "/admgr/admgrCustomer/reviewForm.do")
	public String admgrreviewForm(
			@ModelAttribute("admgrCustomerVO") AdmgrCustomerVO admgrCustomerVO, 
			@ModelAttribute("admgrMemberVO") AdmgrMemberVO admgrMemberVO, 
			@ModelAttribute("admgrProductVO") AdmgrProductVO admgrProductVO, 
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
			out.println("<script>alert('????????????????????? ???????????????.'); location.href='/admgr/login.do'; </script>");
			out.flush();
			return null;
		}  else {
			
			if(adminLevel.equals("5")) {
				admgrProductVO.setuser_id(adminId);
				
				// ???????????????????????? ????????????????????? ??????????????? ????????????.
				List<AdmgrProductVO> get_id_store_list = admgrProductService.get_id_store_list(admgrProductVO);
				String sql_or = "(";
				String or = "";
				for(int i = 0; i<get_id_store_list.size(); i++) {
					if(i == 0) { or = ""; } 
					else { or = ","; }
					sql_or += or + "'"+get_id_store_list.get(i).getstore_id()+"'";  
				}
				sql_or += ")";

				admgrCustomerVO.setuser_level(adminLevel);
				admgrCustomerVO.setbbs_store_id(sql_or);
			}
			
			String bbs_id = "REVIEW";
			String store_category = request.getParameter("store_category");
			String bbs_seq = request.getParameter("bbs_seq");
			String searchKey = request.getParameter("searchKey");
			String searchKeyword = request.getParameter("searchKeyword");
			String pageIndex = request.getParameter("pageIndex");
			if(pageIndex == null || pageIndex =="") {
				pageIndex = "1";
			}
			model.addAttribute("bbs_id", bbs_id);
			model.addAttribute("store_category", store_category);
			model.addAttribute("bbs_seq", bbs_seq);
			model.addAttribute("searchKey", searchKey);
			model.addAttribute("searchKeyword", searchKeyword);
			model.addAttribute("pageIndex", pageIndex);
			admgrCustomerVO.setbbs_id(bbs_id);
			admgrCustomerVO.setbbs_store_category(store_category);
			admgrCustomerVO.setbbs_seq(bbs_seq);
			admgrCustomerVO.setsearchKey(searchKey);
			admgrCustomerVO.setsearchKeyword(searchKeyword);
			admgrCustomerVO.setpageIndex(pageIndex);
			
			AdmgrCustomerVO bbsInfo = admgrCustomerService.get_bbs_info(admgrCustomerVO);
			model.addAttribute("bbsInfo", bbsInfo);
			if(bbsInfo == null) {
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>alert('?????? ?????????, ????????? ???????????????.'); history.back(); </script>");
				out.flush();
				return null;
			}
			
			String user_id = bbsInfo.getuser_id();
			String reply_user_id = bbsInfo.getreply_user_id();
			
			admgrMemberVO.setuser_id(user_id);
			model.addAttribute("userInfo", admgrMemberService.get_member_id_info(admgrMemberVO));

			admgrMemberVO.setuser_id(reply_user_id);
			model.addAttribute("replyuserInfo", admgrMemberService.get_member_id_info(admgrMemberVO));
			
			return "/admgr/admgrCustomer/reviewForm";
		}
	}
	
	//===============================================================================================================
	// * ?????? ??????
	//===============================================================================================================
	@RequestMapping(value = "/admgr/admgrCustomer/reviewAction.do")
	public void admgrreviewAction(
			@ModelAttribute("admgrCustomerVO") AdmgrCustomerVO admgrCustomerVO, 
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
			out.println("<script>alert('????????????????????? ???????????????.'); location.href='/admgr/login.do'; </script>");
			out.flush();
			return;
		}  else {
			
			String bbs_id = "REVIEW";
			String store_category = request.getParameter("store_category");
			String bbs_seq = request.getParameter("bbs_seq");
			String searchKey = request.getParameter("searchKey");
			String searchKeyword = request.getParameter("searchKeyword");
			String pageIndex = request.getParameter("pageIndex");
			String modify_style = request.getParameter("modify_style");
			if(pageIndex == null || pageIndex =="") {
				pageIndex = "1";
			}
			String return_url = request.getParameter("return_url");
			String reply_del_st = "N";
			model.addAttribute("bbs_id", bbs_id);
			model.addAttribute("bbs_seq", bbs_seq);
			model.addAttribute("searchKey", searchKey);
			model.addAttribute("searchKeyword", searchKeyword);
			model.addAttribute("pageIndex", pageIndex);
			model.addAttribute("return_url", return_url);
			model.addAttribute("store_category", return_url);
			admgrCustomerVO.setbbs_id(bbs_id);
			admgrCustomerVO.setbbs_seq(bbs_seq);
			admgrCustomerVO.setsearchKey(searchKey);
			admgrCustomerVO.setsearchKeyword(searchKeyword);
			admgrCustomerVO.setpageIndex(pageIndex);
			admgrCustomerVO.setreply_del_st(reply_del_st);
			admgrCustomerVO.setmodify_style(modify_style);
	
			String bbs_reply_user_id = adminId;
			String bbs_reply_subject = request.getParameter("bbs_reply_subject");
			String bbs_reply_content = request.getParameter("bbs_reply_content");

			admgrCustomerVO.setbbs_reply_user_id(bbs_reply_user_id);
			admgrCustomerVO.setbbs_reply_subject(bbs_reply_subject);
			admgrCustomerVO.setbbs_reply_content(bbs_reply_content);

			admgrCustomerService.update_bbs(admgrCustomerVO);
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('?????????????????????.'); location.replace('"+return_url+"'); </script>");
			out.flush();			
			return;
			
		}
	}

	//===============================================================================================================
	// * ???????????? ??????
	//===============================================================================================================
	@RequestMapping(value = "/admgr/admgrCustomer/eventList.do")
	public String admgreventList(
			@ModelAttribute("admgrCustomerVO") AdmgrCustomerVO admgrCustomerVO, 
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
			out.println("<script>alert('????????????????????? ???????????????.'); location.href='/admgr/login.do'; </script>");
			out.flush();
			return null;
		}  else {
			
			if(adminLevel.equals("5")) {
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>alert('????????? ???????????????.'); history.back();</script>");
				out.flush();
				return null;
			}

			String bbs_id = "EVENT";
			String searchKey = request.getParameter("searchKey");
			String searchKeyword = request.getParameter("searchKeyword");
			model.addAttribute("bbs_id", bbs_id);
			model.addAttribute("searchKey", searchKey);
			model.addAttribute("searchKeyword", searchKeyword);
			admgrCustomerVO.setbbs_id(bbs_id);
			admgrCustomerVO.setsearchKey(searchKey);
			admgrCustomerVO.setsearchKeyword(searchKeyword);
			
			/** pageing start */
			admgrCustomerVO.setPageUnit(15);
			admgrCustomerVO.setPageSize(10); 
			PaginationInfo paginationInfo = new PaginationInfo();
			paginationInfo.setCurrentPageNo(admgrCustomerVO.getPageIndex());
			paginationInfo.setRecordCountPerPage(admgrCustomerVO.getPageUnit());
			paginationInfo.setPageSize(admgrCustomerVO.getPageSize());

			admgrCustomerVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
			admgrCustomerVO.setLastIndex(paginationInfo.getLastRecordIndex());
			admgrCustomerVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

			// ???????????? ?????????
			int ListCnt = admgrCustomerService.get_bbs_list_cnt(admgrCustomerVO);
			paginationInfo.setTotalRecordCount(ListCnt);
			model.addAttribute("TotalCnt", ListCnt);
			model.addAttribute("paginationInfo", paginationInfo);

			// ??????????????? ??????????????? ?????????.
			int StartPageNumber = ListCnt - (admgrCustomerVO.getPageUnit() * (admgrCustomerVO.getPageIndex()-1)) + 1;
			model.addAttribute("StartPageNumber", StartPageNumber);
			/** paging end **/

			model.addAttribute("bbsList", admgrCustomerService.get_bbs_list(admgrCustomerVO));			
			
			return "/admgr/admgrCustomer/eventList";
		}
	}
	
	//===============================================================================================================
	// * ???????????? ???
	//===============================================================================================================
	@RequestMapping(value = "/admgr/admgrCustomer/eventForm.do")
	public String admgreventForm(
			@ModelAttribute("admgrCustomerVO") AdmgrCustomerVO admgrCustomerVO, 
			@ModelAttribute("AdmgrExtentionVO") AdmgrExtentionVO admgrExtentionVO, 
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
			out.println("<script>alert('????????????????????? ???????????????.'); location.href='/admgr/login.do'; </script>");
			out.flush();
			return null;
		}  else {
			
			if(adminLevel.equals("5")) {
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>alert('????????? ???????????????.'); history.back();</script>");
				out.flush();
				return null;
			}

			String bbs_id = "EVENT";
			String bbs_seq = request.getParameter("bbs_seq");
			String searchKey = request.getParameter("searchKey");
			String searchKeyword = request.getParameter("searchKeyword");
			String pageIndex = request.getParameter("pageIndex");
			if(pageIndex == null || pageIndex =="") {
				pageIndex = "1";
			}
			
			model.addAttribute("bbs_id", bbs_id);
			model.addAttribute("bbs_seq", bbs_seq);
			model.addAttribute("searchKey", searchKey);
			model.addAttribute("searchKeyword", searchKeyword);
			model.addAttribute("pageIndex", pageIndex);
			admgrCustomerVO.setbbs_id(bbs_id);
			admgrCustomerVO.setbbs_seq(bbs_seq);
			admgrCustomerVO.setsearchKey(searchKey);
			admgrCustomerVO.setsearchKeyword(searchKeyword);
			admgrCustomerVO.setpageIndex(pageIndex);
			
			if(bbs_seq != null && bbs_seq !="") {
				AdmgrCustomerVO bbsInfo = admgrCustomerService.get_bbs_info(admgrCustomerVO);
				
				baseVO.setfild_id(bbsInfo.getbbs_file1());
				model.addAttribute("bbs_file1_info", baseService.getFileInfo(baseVO));
				baseVO.setfild_id(bbsInfo.getbbs_file2());
				model.addAttribute("bbs_file2_info", baseService.getFileInfo(baseVO));
	
				model.addAttribute("bbsInfo", bbsInfo);
				
				String cp1 = bbsInfo.getbbs_cp1();
				String cp2 = bbsInfo.getbbs_cp2();
				String cp3 = bbsInfo.getbbs_cp3();
				String cp4 = bbsInfo.getbbs_cp4();
				String cp5 = bbsInfo.getbbs_cp5();
				String cp6 = bbsInfo.getbbs_cp6();
				String cp7 = bbsInfo.getbbs_cp7();
				String cp8 = bbsInfo.getbbs_cp8();
				String cp9 = bbsInfo.getbbs_cp9();
				String cp10 = bbsInfo.getbbs_cp10();
				if(cp1 != null && cp1 != "") {
					admgrExtentionVO.setcoupon_id(cp1);
					model.addAttribute("bbs_cp1_info", admgrExtentionService.get_coupon_id_info(admgrExtentionVO));
				}
				if(cp2 != null && cp2 != "") {
					admgrExtentionVO.setcoupon_id(cp2);
					model.addAttribute("bbs_cp2_info", admgrExtentionService.get_coupon_id_info(admgrExtentionVO));
				}
				if(cp3 != null && cp3 != "") {
					admgrExtentionVO.setcoupon_id(cp3);
					model.addAttribute("bbs_cp3_info", admgrExtentionService.get_coupon_id_info(admgrExtentionVO));
				}
				if(cp4 != null && cp4 != "") {
					admgrExtentionVO.setcoupon_id(cp4);
					model.addAttribute("bbs_cp4_info", admgrExtentionService.get_coupon_id_info(admgrExtentionVO));
				}
				if(cp5 != null && cp5 != "") {
					admgrExtentionVO.setcoupon_id(cp5);
					model.addAttribute("bbs_cp5_info", admgrExtentionService.get_coupon_id_info(admgrExtentionVO));
				}
				if(cp6 != null && cp6 != "") {
					admgrExtentionVO.setcoupon_id(cp6);
					model.addAttribute("bbs_cp6_info", admgrExtentionService.get_coupon_id_info(admgrExtentionVO));
				}
				if(cp7 != null && cp7 != "") {
					admgrExtentionVO.setcoupon_id(cp7);
					model.addAttribute("bbs_cp7_info", admgrExtentionService.get_coupon_id_info(admgrExtentionVO));
				}
				if(cp8 != null && cp8 != "") {
					admgrExtentionVO.setcoupon_id(cp8);
					model.addAttribute("bbs_cp8_info", admgrExtentionService.get_coupon_id_info(admgrExtentionVO));
				}
				if(cp9 != null && cp9 != "") {
					admgrExtentionVO.setcoupon_id(cp9);
					model.addAttribute("bbs_cp9_info", admgrExtentionService.get_coupon_id_info(admgrExtentionVO));
				}
				if(cp10 != null && cp10 != "") {
					admgrExtentionVO.setcoupon_id(cp10);
					model.addAttribute("bbs_cp10_info", admgrExtentionService.get_coupon_id_info(admgrExtentionVO));
				}

			}
			
			return "/admgr/admgrCustomer/eventForm";
		}
	}
	
	//===============================================================================================================
	// * ???????????? ??????
	//===============================================================================================================
	@RequestMapping(value = "/admgr/admgrCustomer/eventAction.do")
	public void admgreventAction(
			@ModelAttribute("admgrCustomerVO") AdmgrCustomerVO admgrCustomerVO, 
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
			out.println("<script>alert('????????????????????? ???????????????.'); location.href='/admgr/login.do'; </script>");
			out.flush();
			return;
		}  else {
			
			if(adminLevel.equals("5")) {
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>alert('????????? ???????????????.'); history.back();</script>");
				out.flush();
				return;
			}

			String bbs_id = "EVENT";
			String bbs_seq = request.getParameter("bbs_seq");
			String searchKey = request.getParameter("searchKey");
			String searchKeyword = request.getParameter("searchKeyword");
			String pageIndex = request.getParameter("pageIndex");
			String return_url = request.getParameter("return_url");
			if(pageIndex == null || pageIndex =="") {
				pageIndex = "1";
			}

			model.addAttribute("bbs_id", bbs_id);
			model.addAttribute("bbs_seq", bbs_seq);
			model.addAttribute("searchKey", searchKey);
			model.addAttribute("searchKeyword", searchKeyword);
			model.addAttribute("pageIndex", pageIndex);
			model.addAttribute("return_url", return_url);
			
			String bbs_notice_st = request.getParameter("bbs_notice_st");
			String bbs_secure_st = request.getParameter("bbs_secure_st");
			String bbs_subject = request.getParameter("bbs_subject");
			String bbs_content = request.getParameter("bbs_content");
			String bbs_st_dt_ymd = request.getParameter("bbs_st_dt_ymd");
			String bbs_st_dt_hour= request.getParameter("bbs_st_dt_hour");
			String bbs_st_dt_minute = request.getParameter("bbs_st_dt_minute");
			String bbs_ed_dt_ymd = request.getParameter("bbs_ed_dt_ymd");
			String bbs_ed_dt_hour = request.getParameter("bbs_ed_dt_hour");
			String bbs_ed_dt_minute = request.getParameter("bbs_ed_dt_minute");
			String bbs_cp1 = request.getParameter("bbs_cp1");
			String bbs_cp2 = request.getParameter("bbs_cp2");
			String bbs_cp3 = request.getParameter("bbs_cp3");
			String bbs_cp4 = request.getParameter("bbs_cp4");
			String bbs_cp5 = request.getParameter("bbs_cp5");
			String bbs_cp6 = request.getParameter("bbs_cp6");
			String bbs_cp7 = request.getParameter("bbs_cp7");
			String bbs_cp8 = request.getParameter("bbs_cp8");
			String bbs_cp9 = request.getParameter("bbs_cp9");
			String bbs_cp10 = request.getParameter("bbs_cp10");
			String bbs_file1= request.getParameter("bbs_file1_id");
			String bbs_old_file1 = request.getParameter("bbs_old_file1_id");
			String bbs_file1_del = request.getParameter("bbs_file1_del");
			String bbs_file2 = request.getParameter("bbs_file2_id");
			String bbs_old_file2= request.getParameter("bbs_old_file2_id");
			String bbs_file2_del = request.getParameter("bbs_file2_del");
			String bbs_use_date = request.getParameter("bbs_use_date");

			String bbs_st_dt = bbs_st_dt_ymd + " " + bbs_st_dt_hour + ":" + bbs_st_dt_minute + ":00";
			String bbs_ed_dt = bbs_ed_dt_ymd + " " + bbs_ed_dt_hour + ":" + bbs_ed_dt_minute + ":00";
			
			if(bbs_notice_st == null || bbs_notice_st == "") {
				bbs_notice_st = "N";
			}
			if(bbs_secure_st == null || bbs_secure_st == "") {
				bbs_secure_st = "N";
			}
			if(bbs_file1_del == null || bbs_file1_del == "") {
				bbs_file1_del = "N";
			}
			if(bbs_file2_del == null || bbs_file2_del == "") {
				bbs_file2_del = "N";
			}
			if(bbs_use_date == null || bbs_use_date == "") {
				bbs_use_date = "N";
			}

			admgrCustomerVO.setbbs_id(bbs_id);
			admgrCustomerVO.setbbs_seq(bbs_seq);
			admgrCustomerVO.setpageIndex(pageIndex);
			admgrCustomerVO.setbbs_subject(bbs_subject);
			admgrCustomerVO.setbbs_content(bbs_content);
			admgrCustomerVO.setbbs_cp1(bbs_cp1);
			admgrCustomerVO.setbbs_cp2(bbs_cp2);
			admgrCustomerVO.setbbs_cp3(bbs_cp3);
			admgrCustomerVO.setbbs_cp4(bbs_cp4);
			admgrCustomerVO.setbbs_cp5(bbs_cp5);
			admgrCustomerVO.setbbs_cp6(bbs_cp6);
			admgrCustomerVO.setbbs_cp7(bbs_cp7);
			admgrCustomerVO.setbbs_cp8(bbs_cp8);
			admgrCustomerVO.setbbs_cp9(bbs_cp9);
			admgrCustomerVO.setbbs_cp10(bbs_cp10);
			admgrCustomerVO.setbbs_st_dt(bbs_st_dt);
			admgrCustomerVO.setbbs_ed_dt(bbs_ed_dt);
			admgrCustomerVO.setbbs_use_date(bbs_use_date);
			
			String save_mode = "insert";
			if(bbs_seq != "" && bbs_seq != null) {
				save_mode = "update";
			}
	
			if(("insert").equals(save_mode)) { 	//????????????..
				admgrCustomerVO.setbbs_file1(bbs_file1);
				admgrCustomerVO.setbbs_file2(bbs_file2);
				admgrCustomerVO.setdel_st("N");
				admgrCustomerService.insert_bbs(admgrCustomerVO);
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>alert('?????????????????????.'); location.replace('/admgr/admgrCustomer/eventList.do'); </script>");
				out.flush();
				return;
			} else { 	//????????????..
				if(bbs_file1_del.equals("Y")) {
					admgrCustomerVO.setbbs_file1(bbs_file1);
				} else {
					if(bbs_file1 != null && bbs_file1 != "") {
						admgrCustomerVO.setbbs_file1(bbs_file1);
					} else {
						admgrCustomerVO.setbbs_file1(bbs_old_file1);
					}
				}
				if(bbs_file2_del.equals("Y")) {
					admgrCustomerVO.setbbs_file2(bbs_file2);
				} else {
					if(bbs_file2 != null && bbs_file2 != "") {
						admgrCustomerVO.setbbs_file2(bbs_file2);
					} else {
						admgrCustomerVO.setbbs_file2(bbs_old_file2);
					}
				}
				admgrCustomerService.update_bbs(admgrCustomerVO);
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>alert('?????????????????????.'); location.replace('"+return_url+"'); </script>");
				out.flush();			
				return;
			}
			
			
		}
	}


	//===============================================================================================================
	// * ????????? ?????? - ??????
	//===============================================================================================================
	@RequestMapping(value = "/admgr/admgrCustomer/bbsDelete.do")
	public void admgrbbsDelete(
			@ModelAttribute("admgrCustomerVO") AdmgrCustomerVO admgrCustomerVO, 
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
			out.println("<script>alert('????????????????????? ???????????????.'); location.href='/admgr/login.do'; </script>");
			out.flush();
			return;
		}  else {
			
			if(adminLevel.equals("5")) {
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>alert('????????? ???????????????.'); history.back();</script>");
				out.flush();
				return;
			}

			String bbs_id = request.getParameter("bbs_id");
			String bbs_seq = request.getParameter("bbs_seq");
			String searchKey = request.getParameter("searchKey");
			String searchKeyword = request.getParameter("searchKeyword");
			String pageIndex = request.getParameter("pageIndex");
			String del_st = "Y";
			model.addAttribute("bbs_id", bbs_id);
			model.addAttribute("searchKey", searchKey);
			model.addAttribute("searchKeyword", searchKeyword);

			admgrCustomerVO.setbbs_id(bbs_id);
			admgrCustomerVO.setbbs_seq(bbs_seq);
			admgrCustomerVO.setdel_st(del_st);
			admgrCustomerService.delete_bbs(admgrCustomerVO);

			//?????????????????? ?????? ????????? ??????
			// ?????? ???, ???????????? ???????????? ???????????? ?????? ???????????? ??????
			admgrCustomerVO.setPageUnit(15);
			admgrCustomerVO.setPageSize(10); 
			// request??? ???????????? ?????? String????????? ??????????????? ?????????
			int thisPageIndex = Integer.valueOf(pageIndex);
			// ???????????? ?????????
			int ListCnt = admgrCustomerService.get_bbs_list_cnt(admgrCustomerVO);
			// ??????????????? ?????? - int??? ?????? ??????
			int pageTypeInt = ListCnt/admgrCustomerVO.getPageUnit();
			// float????????? ????????????
			float pageTypeFloat = (float)ListCnt/admgrCustomerVO.getPageUnit();
			// ?????? 0 ???????????? 1??? ??????
			if(pageTypeInt<1) { pageTypeInt = 1; }
			if(pageTypeFloat<1) { pageTypeFloat = 1; }
			// ????????? ??????
			int LastPage = pageTypeInt;
			if( (pageTypeFloat - pageTypeInt) > 0 ) {
				// ??????????????? ?????????..  ??????????????? 1??? ?????? ???????????? ?????? ??? ????????? ??????
				LastPage = pageTypeInt+1;
			}
			// ?????????????????? ???????????? - ???????????? ???
			int newPageIndex = thisPageIndex;
			if(LastPage - thisPageIndex < 0) {
				// ????????? ?????? ?????????????????? ???????????????... ????????????????????? ???????????? ???????????? ??????.
				// ???????????? ???????????????????????? ???????????? ???????????? ???????????? ????????????.. ????????? ???????????? ???????????? ????????????.
				newPageIndex = LastPage; 
			}
			// ?????????????????? ?????? ????????? ???			
			
			String return_url = "";
			String query_string = "?pageIndex="+newPageIndex+"&searchKey="+searchKey+"&searchKeyword="+searchKeyword;
			switch(bbs_id) {
				case "NOTICE" :
					return_url = "/admgr/admgrCustomer/noticeList.do";
					break;
				case "MTM" :
					return_url = "/admgr/admgrCustomer/mtmList.do";
					break;
				case "QNA" :
					return_url = "/admgr/admgrCustomer/qnaList.do";
					break;
				case "REVIEW" :
					return_url = "/admgr/admgrCustomer/reviewList.do";
					break;
				case "EVENT" :
					return_url = "/admgr/admgrCustomer/eventList.do";
					break;					
			}
			return_url += query_string;
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('?????????????????????.'); location.href='"+return_url+"'; </script>");
			out.flush();
			return;
			
			
		}
	}
	
	
}
