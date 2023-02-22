package egovframework.base.board.web;

import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.parsing.GenericTokenParser;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.support.GenericTypeAwareAutowireCandidateResolver;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.admgrConfig.service.AdmgrConfigService;
import egovframework.admgrConfig.service.AdmgrConfigVO;
import egovframework.admgrCustomer.service.AdmgrCustomerService;
import egovframework.admgrCustomer.service.AdmgrCustomerVO;
import egovframework.base.board.service.BaseBoardService;
import egovframework.base.board.service.BaseBoardVO;
import egovframework.base.member.service.BaseMemberService;
import egovframework.base.member.service.BaseMemberVO;
import egovframework.base.service.BaseService;
import egovframework.base.service.BaseVO;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
public class BaseBoardController {

	@Resource(name = "BaseBoardService")
	private BaseBoardService baseBoardService;	
	
	@Resource(name = "BaseService")
	private BaseService baseService;	
	
	@Resource(name = "BaseMemberService")
	private BaseMemberService baseMemberService;	
	
	@Resource(name = "AdmgrConfigService")
	private AdmgrConfigService admgrConfigService;	
	
	@Resource(name = "AdmgrCustomerService")
	private AdmgrCustomerService admgrCustomerService;	
		
	
	//=========================================================

	//공지사항 리스트
		@RequestMapping(value = "/notice_list.do")
		public String notice_list(
				@ModelAttribute("admgrCustomerVO") AdmgrCustomerVO admgrCustomerVO, 
				ModelMap model, 
				HttpServletRequest request, 
				HttpServletResponse response
			) throws Exception {
			
			//HttpSession session = request.getSession(true);
			//String adminId = (String) session.getAttribute("adminId");
			//String adminLevel = (String) session.getAttribute("adminLevel");
			
			/*if(adminId == null || adminId == "" ) {
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>alert('관리자로그인이 필요합니다.'); location.href='/admgr/login.do'; </script>");
				out.flush();
				return null;
			}  else {*/
				
				/*if(adminLevel.equals("5")) {
					response.setContentType("text/html; charset=UTF-8");
					PrintWriter out = response.getWriter();
					out.println("<script>alert('권한이 필요합니다.'); history.back();</script>");
					out.flush();
					return null;
				}*/
				
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

				// 전체갯수 구하기
				int ListCnt = admgrCustomerService.get_bbs_list_cnt(admgrCustomerVO);
				paginationInfo.setTotalRecordCount(ListCnt);
				model.addAttribute("TotalCnt", ListCnt);
				model.addAttribute("paginationInfo", paginationInfo);

				// 해당페이지 시작번호를 구한다.
				int StartPageNumber = ListCnt - (admgrCustomerVO.getPageUnit() * (admgrCustomerVO.getPageIndex()-1)) + 1;
				model.addAttribute("StartPageNumber", StartPageNumber);
				/** paging end **/

				model.addAttribute("bbsNoticeList", admgrCustomerService.get_bbs_notice_list(admgrCustomerVO));			
				model.addAttribute("bbsList", admgrCustomerService.get_bbs_list(admgrCustomerVO));			
				
			

			
			return "/baseScmtour/E_customer/notice_list";
		}
		
		
		//공지사항 상세
		@RequestMapping(value = "/notice_view.do")
		public String noticeview(
				@ModelAttribute("admgrCustomerVO") AdmgrCustomerVO admgrCustomerVO, 
				@ModelAttribute("BaseVO") BaseVO baseVO, 
				ModelMap model, 			
				HttpServletRequest request, 
				HttpServletResponse response
			) throws Exception {
			System.out.println("123123124123123");
			System.out.println(request);
			System.out.println(response);
			System.out.println("123123124123123");
			System.out.println(request.getParameter("bbs_seq"));
			
			


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
					AdmgrCustomerVO pre_next = admgrCustomerService.get_bbs_info2(admgrCustomerVO);
					// pre_next 와 BBSInfo 셀렉트 안겹치게 해야 작동이 됨
					
					
					baseVO.setfild_id(bbsInfo.getbbs_file1());
					model.addAttribute("bbs_file1_info", baseService.getFileInfo(baseVO));
					baseVO.setfild_id(bbsInfo.getbbs_file2());
					model.addAttribute("bbs_file2_info", baseService.getFileInfo(baseVO));
		
					model.addAttribute("bbsInfo", bbsInfo);
					
					/*이전글, 다음글*/
					if (pre_next.getPRE_SEQ2() != null && !pre_next.getPRE_SEQ2().equals("")){
						model.addAttribute("PRE_SEQ", pre_next.getPRE_SEQ2());
					}else {
						model.addAttribute("PRE_SEQ", bbs_seq);
					}
					if (pre_next.getNEXT_SEQ2() != null && !pre_next.getNEXT_SEQ2().equals("")){
						model.addAttribute("NEXT_SEQ", pre_next.getNEXT_SEQ2());
					} else {
						model.addAttribute("NEXT_SEQ", bbs_seq);
					}
					
					model.addAttribute("bbsInfo2", pre_next);
					
					//System.out.println("pre_next :" + pre_next.getNEXT_SEQ2());
					
					//System.out.println(bbsInfo2);
					System.out.println("bbsInfo :" + bbsInfo);
					System.out.println("bbsInfo :" + bbsInfo.getPRE_SEQ());
				//	System.out.println("bbsInfo2 :" + bbsInfo2.getPRE_SEQ());
					
					System.out.println("pre_next :" + pre_next.getNEXT_SEQ2());
					System.out.println("pre_next :" + pre_next.getPRE_SEQ2());
					
					admgrCustomerService.get_bbs_increase_hit(admgrCustomerVO);
				}
			
			return "/baseScmtour/E_customer/notice_view";
		}
		
	
	//자주묻는질문
	@RequestMapping(value = "/faq_list.do")
	public String faq_list(
			ModelMap model, 
			HttpServletRequest request, 
			HttpServletResponse response
			
		)throws Exception {
		
		
		
		
		
		return "/baseScmtour/E_customer/faq_list";
	}
	
	//이벤트 리스트
	@RequestMapping(value = "/event_list.do")
	public String event_list(
			ModelMap model, 
			HttpServletRequest request, 
			HttpServletResponse response
			
		)throws Exception {
		
		
		
		
		
		return "/baseScmtour/E_customer/event_list";
	}
	
	//이벤트 상세보기
	@RequestMapping(value = "/event_view.do")
	public String event_view(
			ModelMap model, 
			HttpServletRequest request, 
			HttpServletResponse response
			
		)throws Exception {
		
		
		
		
		
		return "/baseScmtour/E_customer/event_view";
	}
	
	
	//=========================================================
	// 게시판 목록
	//=========================================================
	@RequestMapping(value = "/board/list.do")
	public String Boardlist(
		@ModelAttribute("BaseBoardVO") BaseBoardVO baseBoardVO, 
		ModelMap model, 
		HttpServletRequest request, 
		HttpServletResponse response
		) throws Exception {
		
		HttpSession session = request.getSession(true);
		String user_id = (String) session.getAttribute("user_id");
		String user_ip = BaseService.getRemoteIP(request);
		
		String bbs_id = request.getParameter("bd_id");
		String searchKeyword = request.getParameter("searchKeyword");
		model.addAttribute("bd_id", bbs_id);
		model.addAttribute("searchKeyword", searchKeyword);

		boolean isbbs = true;
		String[] bbs = {new String("NOTICE"), new String("MTM") , new String("QNA") , new String("FAQ") };
		isbbs = Arrays.stream(bbs).anyMatch(bbs_id::equals);
		if(isbbs == false) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('존재하지 않는 게시판입니다.'); history.back(); </script>");
			out.flush();
			return null;
		}
		
		// 보드스킨 - 임시소스
		String board_skin = "";
		switch(bbs_id) {
			//case "NOTICE" : board_skin = "notice";  break;
			case "QNA" : board_skin = "qna";  break;
			case "MTM" : board_skin = "mtm";  break;
			default : board_skin = "basic"; break;
		}
		
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
		baseBoardVO.setbbs_id(bbs_id);
		baseBoardVO.setsearchKeyword(searchKeyword);
		baseBoardVO.setbbs_notice_st("N");
		if(("MTM").equals(bbs_id)) {
			baseBoardVO.setuser_id(user_id);
		}
		int ListCnt = baseBoardService.get_site_bbs_list_cnt(baseBoardVO);
		paginationInfo.setTotalRecordCount(ListCnt);
		model.addAttribute("TotalCnt", ListCnt);
		model.addAttribute("paginationInfo", paginationInfo);

		// 해당페이지 시작번호를 구한다.
		int StartPageNumber = ListCnt - (baseBoardVO.getPageUnit() * (baseBoardVO.getPageIndex()-1)) + 1;
		model.addAttribute("StartPageNumber", StartPageNumber);
		/** paging end **/
		
		//일반글 목록
		model.addAttribute("bbsList", baseBoardService.get_site_bbs_list(baseBoardVO));

		//공지사항 목록
		baseBoardVO.setbbs_notice_st("Y");
		model.addAttribute("bbsNoticeList", baseBoardService.get_site_bbs_list(baseBoardVO));
		
		return "/baseScmtour/baseBoard/skins/" + board_skin + "/list";

	}

	//=========================================================
	// 게시판 보기
	//=========================================================
	@RequestMapping(value = "/board/view.do")
	public String BoardView(
			@ModelAttribute("BaseBoardVO") BaseBoardVO baseBoardVO, 
			@ModelAttribute("BaseVO") BaseVO baseVO, 
			@ModelAttribute("BaseMemberVO") BaseMemberVO baseMemberVO,
			@ModelAttribute("AdmgrConfigVO") AdmgrConfigVO admgrConfigVO, 
			@ModelAttribute("admgrCustomerVO") AdmgrCustomerVO admgrCustomerVO,
			ModelMap model, 
			HttpServletRequest request, 
			HttpServletResponse response
		) throws Exception {
		
		HttpSession session = request.getSession(true);
		String user_id = (String) session.getAttribute("user_id");
		String user_ip = BaseService.getRemoteIP(request);
		String bbs_id = request.getParameter("bd_id");
		
		if(!("NOTICE").equals(bbs_id) && (user_id == null || user_id == "")) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('접근권한이 없습니다(1).'); history.back(); </script>");
			out.flush();
			return null;
		}

		if(bbs_id == null || bbs_id == "") {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('비정상적인 접근입니다.'); history.back(); </script>");
			out.flush();
			return null;
		}		
		boolean isbbs = true;
		String[] bbs = {new String("NOTICE"), new String("MTM") , new String("QNA"), new String("FAQ") };
		isbbs = Arrays.stream(bbs).anyMatch(bbs_id::equals);
		if(isbbs == false) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('존재하지 않는 게시판입니다.'); history.back(); </script>");
			out.flush();
			return null;
		}		
		String bbs_seq = request.getParameter("bbs_seq");
		if(bbs_seq == null || bbs_seq == "") {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('비정상적인 접근입니다.'); history.back(); </script>");
			out.flush();
			return null;
		}		
		
		/* 로그작업 시작 */
		if(user_id != null && user_id !="") {
			baseMemberVO.setuser_id(user_id);
			model.addAttribute("memberInfo", baseMemberService.get_site_user_info(baseMemberVO));
		}
		AdmgrConfigVO getConfig = admgrConfigService.get_base_config(null);
		model.addAttribute("SiteBaseConfig",getConfig);
		
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
		if(bbs_seq != null && bbs_seq !="") {
			baseVO.setbbs_seq(bbs_seq);
			int is_view_bbs = baseService.get_log_bbs_view(baseVO);
			if(is_view_bbs == 0) {
				baseService.set_bbs_view_log(baseVO);
				baseService.set_bbs_view_cnt(baseVO);
			}
		}
		/* 로그작업 끝 */

		String pageIndex = request.getParameter("pageIndex");
		String searchKeyword = request.getParameter("searchKeyword");
		model.addAttribute("bd_id", bbs_id);
		model.addAttribute("bbs_seq", bbs_seq);
		model.addAttribute("pageIndex", pageIndex);
		model.addAttribute("searchKeyword", searchKeyword);

		// 보드스킨 - 임시소스
		String board_skin = "";
		switch(bbs_id) {
			//case "NOTICE" : board_skin = "notice";  break;
			case "QNA" : board_skin = "qna";  break;
			case "MTM" : board_skin = "mtm";  break;
			default : board_skin = "basic"; break;
		}
		
		baseBoardVO.setbbs_id(bbs_id);
		baseBoardVO.setbbs_seq(bbs_seq);
		baseBoardVO.setsearchKeyword(searchKeyword);
		admgrCustomerVO.setbbs_seq(bbs_seq);// admgr에도 set으로 seq집어넣어야됨
		admgrCustomerVO.setbbs_id(bbs_id);
		
		BaseBoardVO bbs_info = baseBoardService.get_site_bbs_info(baseBoardVO);
		if(bbs_info == null) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('존재하지 않는 글입니다.'); history.back(); </script>");
			out.flush();
			return null;
		}
		String get_bbs_seq = bbs_info.getbbs_seq();
		String get_user_id = bbs_info.getuser_id();

		
		if(!("NOTICE").equals(bbs_id)) {	
			if(!get_user_id.equals(user_id)) {
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>alert('접근권한이 없습니다(1).'); history.back(); </script>");
				out.flush();
				return null;
			}
		}
		model.addAttribute("bbsInfo", bbs_info);
		AdmgrCustomerVO pre_next = admgrCustomerService.get_bbs_info2(admgrCustomerVO);
		model.addAttribute("bbsInfo2", pre_next);
		admgrCustomerService.get_bbs_increase_hit(admgrCustomerVO);
		

		if (pre_next.getPRE_SEQ2() != null && !pre_next.getPRE_SEQ2().equals("")){
			model.addAttribute("PRE_SEQ", pre_next.getPRE_SEQ2());
		}else {
			model.addAttribute("PRE_SEQ", bbs_seq);
		}
		if (pre_next.getNEXT_SEQ2() != null && !pre_next.getNEXT_SEQ2().equals("")){
			model.addAttribute("NEXT_SEQ", pre_next.getNEXT_SEQ2());
		} else {
			model.addAttribute("NEXT_SEQ", bbs_seq);
		}
		
		
				
		
		
		baseVO.setfild_id(bbs_info.getbbs_file1());
		model.addAttribute("bbs_file1_info", baseService.getFileInfo(baseVO));
		baseVO.setfild_id(bbs_info.getbbs_file2());
		model.addAttribute("bbs_file2_info", baseService.getFileInfo(baseVO));
		
		return "/baseScmtour/baseBoard/skins/" + board_skin + "/view";

	}

	//=========================================================
	// 게시판 폼 - 1:1 문의만..
	//=========================================================
	@RequestMapping(value = "/board/form.do")
	public String Boardform(
		@ModelAttribute("BaseBoardVO") BaseBoardVO baseBoardVO, 
		@ModelAttribute("BaseVO") BaseVO baseVO, 
		ModelMap model, 
		HttpServletRequest request, 
		HttpServletResponse response
		) throws Exception {
		
		HttpSession session = request.getSession(true);
		String user_id = (String) session.getAttribute("user_id");
		String user_ip = BaseService.getRemoteIP(request);
		
		String bbs_id = request.getParameter("bd_id");
		String bbs_seq = request.getParameter("bbs_seq");
		String pageIndex = request.getParameter("pageIndex");
		String searchKeyword = request.getParameter("searchKeyword");
		model.addAttribute("bd_id", bbs_id);
		model.addAttribute("bbs_seq", bbs_seq);
		model.addAttribute("pageIndex", pageIndex);
		model.addAttribute("searchKeyword", searchKeyword);
		
		// 보드스킨 - 임시소스
		String board_skin = "";
		switch(bbs_id) {
			case "QNA" : board_skin = "qna";  break;
			case "MTM" : board_skin = "mtm";  break;
			default : board_skin = "basic"; break;
		}

		boolean isbbs = true;
		String[] bbs = {new String("NOTICE"), new String("MTM") , new String("QNA") };
		isbbs = Arrays.stream(bbs).anyMatch(bbs_id::equals);
		if(isbbs == false) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('존재하지 않는 게시판입니다.'); history.back(); </script>");
			out.flush();
			return null;
		}
		
		if(user_id == null || user_id == "") {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('접근권한이 없습니다(0).'); history.back(); </script>");
			out.flush();
			return null;
		}
		
		if(bbs_id == null || bbs_id == "") {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('접근권한이 없습니다(1).'); history.back(); </script>");
			out.flush();
			return null;
		}
		
		// 1:1문의만 접근 허용한다.
		if(!("MTM").equals(bbs_id)) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('접근권한이 없습니다(2).'); history.back(); </script>");
			out.flush();
			return null;
		}

		
		baseBoardVO.setbbs_id(bbs_id);
		baseBoardVO.setbbs_seq(bbs_seq);
		baseBoardVO.setsearchKeyword(searchKeyword);
		
		if(bbs_seq != null && bbs_seq != "") {
			BaseBoardVO bbs_info = baseBoardService.get_site_bbs_info(baseBoardVO);
			if(bbs_info == null) {
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>alert('해당글이 존재하지 않습니다.'); history.back(); </script>");
				out.flush();
				return null;
			}			
			
			String get_bbs_seq = bbs_info.getbbs_seq();
			String get_user_id = bbs_info.getuser_id();
			String get_reply_content = bbs_info.getbbs_reply_content();
			if(!get_user_id.equals(user_id)) {
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>alert('접근권한이 없습니다(4).'); history.back(); </script>");
				out.flush();
				return null;
			}
			if(get_reply_content != null && get_reply_content != "") {
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>alert('수정할 수 없습니다.'); history.back(); </script>");
				out.flush();
				return null;
			}
			
			model.addAttribute("bbsInfo", bbs_info);
		
			baseVO.setfild_id(bbs_info.getbbs_file1());
			model.addAttribute("bbs_file1_info", baseService.getFileInfo(baseVO));
			baseVO.setfild_id(bbs_info.getbbs_file2());
			model.addAttribute("bbs_file2_info", baseService.getFileInfo(baseVO));
		} else {
			model.addAttribute("bbsInfo", null);
		}
		
		return "/baseScmtour/baseBoard/skins/" + board_skin + "/form";

	}

	//=========================================================
	// 게시판 폼
	//=========================================================
	@RequestMapping(value = "/board/bbsAction.do")
	public void BoardAction(
		@ModelAttribute("BaseBoardVO") BaseBoardVO baseBoardVO, 
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
		String user_ip = BaseService.getRemoteIP(request);
		
		String bbs_id = request.getParameter("bd_id");
		String bbs_seq = request.getParameter("bbs_seq");
		String pageIndex = request.getParameter("pageIndex");
		
		if(!("MTM").equals(bbs_id) && (user_id == null || user_id == "")) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('접근권한이 없습니다.'); history.back(); </script>");
			out.flush();
			return;
		}
			
		boolean isbbs = true;
		String[] bbs = {new String("NOTICE"), new String("MTM") , new String("QNA") };
		isbbs = Arrays.stream(bbs).anyMatch(bbs_id::equals);
		if(isbbs == false) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('존재하지 않는 게시판입니다.'); history.back(); </script>");
			out.flush();
			return;
		}
		model.addAttribute("bd_id", bbs_id);
		baseBoardVO.setbbs_id(bbs_id);
		baseBoardVO.setuser_id(user_id);
		baseBoardVO.setbbs_writer_nm(user_nm);
		baseBoardVO.setbbs_writer_hp(user_hp);
		baseBoardVO.setbbs_writer_email(user_email);

		String bbs_prod_id = request.getParameter("bbs_prod_id");
		String bbs_subject = request.getParameter("bbs_subject");
		String bbs_content= request.getParameter("bbs_content");

		baseBoardVO.setbbs_prod_id(bbs_prod_id);
		baseBoardVO.setbbs_subject(bbs_subject);
		baseBoardVO.setbbs_content(bbs_content);
		baseBoardVO.setbbs_notice_st("N");
		baseBoardVO.setbbs_secure_st("N");

		//저장하자
		if(bbs_seq == null || bbs_seq =="") {
			baseBoardService.insert_site_bbs(baseBoardVO);
			
			if(("MTM").equals(bbs_id) || ("QNA").equals(bbs_id)) {
				//문자보내기
				baseVO.setsms_cd(bbs_id+"ADD");
				baseVO.setbbs_id(bbs_id);
				baseVO.setprod_id(bbs_prod_id);
				baseVO.setuser_hp(user_hp);
				baseService.sendSms(baseVO);
			}
			
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>function locationReplace(url){ if(history.replaceState){ history.replaceState(null, document.title, url); history.go(0); }else{ location.replace(url); } }</script>");
			out.println("<script>alert('등록되었습니다.'); locationReplace('/board/list.do?bd_id="+bbs_id+"'); </script>");
			out.flush();
			return;
		} else {
			baseBoardVO.setbbs_seq(bbs_seq);
			baseBoardVO.setmodify_style("article");
			baseBoardService.update_site_bbs(baseBoardVO);
			
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>function locationReplace(url){ if(history.replaceState){ history.replaceState(null, document.title, url); history.go(0); }else{ location.replace(url); } }</script>");
			out.println("<script>alert('수정되었습니다.'); locationReplace('/board/view.do?bd_id="+bbs_id+"&pageIndex="+pageIndex+"&bbs_seq="+bbs_seq+"'); </script>");
			out.flush();
			return;
		}
	}
	
	//=========================================================
	// 게시판 폼
	//=========================================================
	@RequestMapping(value = "/board/delete.do")
	public void Boarddelete(
			@ModelAttribute("BaseBoardVO") BaseBoardVO baseBoardVO, 
			ModelMap model, 
			HttpServletRequest request, 
			HttpServletResponse response
			) throws Exception {
		
		HttpSession session = request.getSession(true);
		String user_id = (String) session.getAttribute("user_id");
		String user_ip = BaseService.getRemoteIP(request);
		
		String bbs_id = request.getParameter("bd_id");
		String bbs_seq = request.getParameter("bbs_seq");
		String pageIndex = request.getParameter("pageIndex");
		baseBoardVO.setbbs_id(bbs_id);
		baseBoardVO.setbbs_seq(bbs_seq);
		
		if(!("MTM").equals(bbs_id) && (user_id == null || user_id == "")) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('접근권한이 없습니다.'); history.back(); </script>");
			out.flush();
			return;
		}
		
		boolean isbbs = true;
		String[] bbs = {new String("NOTICE"), new String("MTM") , new String("QNA") };
		isbbs = Arrays.stream(bbs).anyMatch(bbs_id::equals);
		if(isbbs == false) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('존재하지 않는 게시판입니다.'); history.back(); </script>");
			out.flush();
			return;
		}
		
		BaseBoardVO bbs_info = baseBoardService.get_site_bbs_info(baseBoardVO);
		if(bbs_info == null) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('해당글이 존재하지 않습니다.'); history.back(); </script>");
			out.flush();
			return;
		}			
		
		String get_bbs_seq = bbs_info.getbbs_seq();
		String get_user_id = bbs_info.getuser_id();
		String get_reply_content = bbs_info.getbbs_reply_content();
		if(!get_user_id.equals(user_id)) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('접근권한이 없습니다(4).'); history.back(); </script>");
			out.flush();
			return;
		}
		if(get_reply_content != null && get_reply_content != "") {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('수정할 수 없습니다.'); history.back(); </script>");
			out.flush();
			return;
		}

		model.addAttribute("bd_id", bbs_id);
		baseBoardVO.setbbs_id(bbs_id);
		baseBoardVO.setuser_id(user_id);
		
		//저장하자
		if(bbs_seq != null || bbs_seq !="") {
			baseBoardService.delete_site_bbs(baseBoardVO);
			
			//마지막페이지 다시 구하기 시작
			// 삭제 후, 페이징이 감소되어 오류나는 것을 방지하기 위함
			baseBoardVO.setPageUnit(10);
			baseBoardVO.setPageSize(10); 
			// request로 넘겨받은 것이 String이므로 숫자형으로 형변환
			int thisPageIndex = Integer.valueOf(pageIndex);
			// 전체갯수 구하기
			int ListCnt = baseBoardService.get_site_bbs_list_cnt(baseBoardVO);
			// 정수형으로 구함 - int은 몫만 반환
			int pageTypeInt = ListCnt/baseBoardVO.getPageUnit();
			// float형으로 다시구함
			float pageTypeFloat = (float)ListCnt/baseBoardVO.getPageUnit();
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
			
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>function locationReplace(url){ if(history.replaceState){ history.replaceState(null, document.title, url); history.go(0); }else{ location.replace(url); } }</script>");
			out.println("<script>alert('삭제되었습니다.'); locationReplace('/board/list.do?bd_id="+bbs_id+"&pageIndex="+newPageIndex+"'); </script>");
			out.flush();
			return;
		}
	}

}
