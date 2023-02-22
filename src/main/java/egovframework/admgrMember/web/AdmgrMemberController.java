package egovframework.admgrMember.web;
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

import egovframework.admgrMember.service.AdmgrMemberService;
import egovframework.admgrMember.service.AdmgrMemberVO;
import egovframework.base.service.BaseService;
import egovframework.base.service.BaseVO;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
public class AdmgrMemberController {

	@Resource(name = "AdmgrMemberService")
	private AdmgrMemberService admgrMemberService;	
	
	@Resource(name = "BaseService")
	private BaseService baseService;	
	
	/** EgovPropertyService */
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;
	
	//=========================================================

	
	//===============================================================================================================
	// * 회원목록
	//===============================================================================================================
	@RequestMapping(value = "/admgr/admgrMember/memberList.do")
	public String admgrmemberList(
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
			/** EgovPropertyService */
			//admgrMemberVO.setPageUnit(propertiesService.getInt("pageUnit"));
			//admgrMemberVO.setPageSize(propertiesService.getInt("pageSize")); 
			
			if(adminLevel.equals("5")) {
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>alert('권한이 필요합니다.'); history.back();</script>");
				out.flush();
				return null;
			}
	
			String user_level = request.getParameter("user_level");
			String searchKey = request.getParameter("searchKey");
			String searchKeyword= request.getParameter("searchKeyword");
			admgrMemberVO.setuser_level(user_level);
			admgrMemberVO.setsearchKey(searchKey);
			admgrMemberVO.setsearchKeyword(searchKeyword);
			model.addAttribute("user_level", user_level);
			model.addAttribute("searchKey", searchKey);
			model.addAttribute("searchKeyword", searchKeyword);
			
			/** pageing start */
			admgrMemberVO.setPageUnit(15);
			admgrMemberVO.setPageSize(10); 
			PaginationInfo paginationInfo = new PaginationInfo();
			paginationInfo.setCurrentPageNo(admgrMemberVO.getPageIndex());
			paginationInfo.setRecordCountPerPage(admgrMemberVO.getPageUnit());
			paginationInfo.setPageSize(admgrMemberVO.getPageSize());
	
			admgrMemberVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
			admgrMemberVO.setLastIndex(paginationInfo.getLastRecordIndex());
			admgrMemberVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
			
			// 전체갯수 구하기
			int ListCnt = admgrMemberService.get_member_list_cnt(admgrMemberVO);
			paginationInfo.setTotalRecordCount(ListCnt);
			model.addAttribute("TotalCnt", ListCnt);
			model.addAttribute("paginationInfo", paginationInfo);
			
			// 해당페이지 시작번호를 구한다.
			int StartPageNumber = ListCnt - (admgrMemberVO.getPageUnit() * (admgrMemberVO.getPageIndex()-1)) + 1;
			model.addAttribute("StartPageNumber", StartPageNumber);
			/** paging end **/
			
			model.addAttribute("MemberList", admgrMemberService.get_member_list(admgrMemberVO));
	
			return "/admgr/admgrMember/memberList";
		}
	}

	
	//===============================================================================================================
	// *  회원 폼
	//===============================================================================================================
	@RequestMapping(value = "/admgr/admgrMember/memberForm.do")
	public String admgrmemberForm(
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
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>alert('권한이 필요합니다.'); history.back();</script>");
				out.flush();
				return null;
			}

			String member_seq = request.getParameter("member_seq");
			model.addAttribute("member_seq", member_seq);

			String user_level = request.getParameter("user_level");
			String searchKey = request.getParameter("searchKey");
			String searchKeyword = request.getParameter("searchKeyword");
			admgrMemberVO.setuser_level(user_level);
			admgrMemberVO.setsearchKey(searchKey);
			admgrMemberVO.setsearchKeyword(searchKeyword);
			model.addAttribute("user_level", user_level);
			model.addAttribute("searchKey", searchKey);
			model.addAttribute("searchKeyword", searchKeyword);
			
			if(member_seq != null && member_seq != "") {
				admgrMemberVO.setuser_seq(member_seq);
				AdmgrMemberVO member_info = admgrMemberService.get_member_info(admgrMemberVO);
				model.addAttribute("memberInfo", member_info);
	
				admgrMemberVO.setuser_id(member_info.getuser_id());
				int get_member_mileage_total = admgrMemberService.get_member_mileage_total(admgrMemberVO);
				model.addAttribute("member_mileage_total", get_member_mileage_total);	
			
				//회원주소록 호출
				model.addAttribute("memberAddrList", admgrMemberService.get_member_addr_list(admgrMemberVO));
			}
			
			return "/admgr/admgrMember/memberForm";
		}
	}

	
	//===============================================================================================================
	// *  로그인페이지
	//===============================================================================================================
	@RequestMapping(value = "/admgr/login.do")
	public String admgrmemberLogin(
			@ModelAttribute("admgrMemberVO") AdmgrMemberVO admgrMemberVO, 
			ModelMap model, 
			HttpServletRequest request, 
			HttpServletResponse response
		) throws Exception {

		HttpSession session = request.getSession(true);
		String adminId = (String) session.getAttribute("adminId");
		String adminLevel = (String) session.getAttribute("adminLevel");
		
		if(adminId != null && adminId != "" ) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('이미 로그인되어 있습니다.'); location.replace('/admgr/index.do'); </script>");
			out.flush();
			return null;
		} else {  
			String user_level = request.getParameter("user_level");
			String searchKey = request.getParameter("searchKey");
			String searchKeyword= request.getParameter("searchKeyword");
			admgrMemberVO.setuser_level(user_level);
			admgrMemberVO.setsearchKey(searchKey);
			admgrMemberVO.setsearchKeyword(searchKeyword);
			model.addAttribute("user_level", user_level);
			model.addAttribute("searchKey", searchKey);
			model.addAttribute("searchKeyword", searchKeyword);
			
			return "/admgr/admgrMember/memberLogin";
		}
	}

	
	//===============================================================================================================
	// *  관리자로그인
	//===============================================================================================================
	@RequestMapping(value = "/admgr/loginAction.do")
	public void admgrmemberLoginAction(
			@ModelAttribute("admgrMemberVO") AdmgrMemberVO admgrMemberVO, 
			ModelMap model, 
			HttpServletRequest request, 
			HttpServletResponse response
		) throws Exception {
		
		//------------------------------------------------------------------------------------------------------------------------------
		// 세션체크한다. - 로그인전 페이지용
		HttpSession session = request.getSession(true);
		String adminId = (String) session.getAttribute("adminId");
		String adminLevel = (String) session.getAttribute("adminLevel");
		
		if(adminId != null && adminId != "" ) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('이미 로그인되어 있습니다.'); location.replace('/admgr/index.do'); </script>");
			out.flush();
			return;
		}
		//------------------------------------------------------------------------------------------------------------------------------
		
		String inAdminId = request.getParameter("admin_id");
		String inAdminPw = request.getParameter("admin_pw");
		
		String new_user_pw = "";
		if(inAdminPw != "" && inAdminPw != null) {
			new_user_pw = BaseService.encPasswd(inAdminId, inAdminPw);
		}
		admgrMemberVO.setuser_id(inAdminId);
		admgrMemberVO.setuser_pwd(new_user_pw);
		admgrMemberVO.setuser_level("5");
		AdmgrMemberVO isMember = admgrMemberService.get_is_member_data(admgrMemberVO);
		
		if(isMember == null) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('정보가 존재하지 않습니다.'); history.back();</script>");
			out.flush();
			return;
		}
		
		String user_nm = isMember.getuser_nm();
		String user_level = isMember.getuser_level();

		if(isMember != null &&  isMember.getuser_id() != "") {
			session.setAttribute("adminId", inAdminId);
			session.setAttribute("adminPw", inAdminPw);
			session.setAttribute("adminNm", user_nm);
			session.setAttribute("adminLevel", user_level);
			
			// 마지막 로그인 기록
			admgrMemberService.last_login_member(admgrMemberVO);
			// 로그 로그인 기록
			admgrMemberService.log_login_member(admgrMemberVO);
			
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>location.replace('/admgr/admgrMain.do');</script>");
			out.flush();
			return;
		} else {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('로그인정보가 맞지 않습니다\\n\\n다시 로그인하여 주새요.'); history.back(); </script>");
			out.flush();
			return;
		}
	}

	
	//===============================================================================================================
	// *  관리자로그아웃
	//===============================================================================================================
	@RequestMapping(value = "/admgr/logOut.do")
	public String admgrmemberLoginOut(
			@ModelAttribute("admgrMemberVO") AdmgrMemberVO admgrMemberVO, 
			ModelMap model, 
			HttpServletRequest request, 
			HttpServletResponse response
		) throws Exception {
		
		//------------------------------------------------------------------------------------------------------------------------------
		// 로그아웃 페이지용
		HttpSession session = request.getSession(false);
		if(session==null || session.isNew()){
			response.sendError(400);
			return null;
		}
		session.invalidate();
		//------------------------------------------------------------------------------------------------------------------------------
		
		return "redirect:/admgr/login.do";
	}

	
	//===============================================================================================================
	// *  회원아이디 중복확인
	//===============================================================================================================
	@RequestMapping(value = "/admgr/admgrMember/memberCheckId.do")
	public String admgrmemberCheckId(
			@ModelAttribute("admgrMemberVO") AdmgrMemberVO admgrMemberVO, 
			BaseVO baseVO, 
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

			String user_id = request.getParameter("user_id");
			admgrMemberVO.setuser_id(user_id);
	
			String res = "Y";
	
			// 금지아이디인지 확인한다.
			int deny_id_cnt = 0;
			baseVO.setbase_gp_cd("GP004");
			List<BaseVO> deny_id_list = baseService.get_base_cd_list(baseVO);
	
			for(int i = 0; i<deny_id_list.size(); i++) {
				if(user_id.contains((CharSequence) deny_id_list.get(i).getbase_cd_nm()) ) {
					deny_id_cnt++;
					break;
				}
			}
			
			// 중복아이디인지 확인한다.
			int is_id_cnt = admgrMemberService.get_is_check_id_cnt(admgrMemberVO);
	
			//결과출력
			if(deny_id_cnt > 0) {
				res = "D";
			}
			else if(is_id_cnt> 0) {
				res = "H";
			} 
			
			model.addAttribute("result", res);
			
			return "/admgr/admgrMember/memberCheckId";
		}
	}


	//===============================================================================================================
	// *  회원가입
	//===============================================================================================================
	@RequestMapping(value = "/admgr/admgrMember/memberFormAction.do")
	public void admgrmemberFormAction(
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
			
			if(adminLevel.equals("5")) {
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>alert('권한이 필요합니다.'); history.back();</script>");
				out.flush();
				return;
			}

			String return_url = request.getParameter("return_url");
			String member_seq = request.getParameter("member_seq");
			String save_mode = "insert";
			if(member_seq != "" && member_seq != null) {
				save_mode = "update";
			}
			model.addAttribute("member_seq", member_seq);
	
			String user_join_fl = "normal";
			String user_sex_fl = "N";
			String user_st = "Y";
			String user_id = request.getParameter("user_id").trim();
			String user_pw = request.getParameter("user_pw").trim();
			String user_nm = request.getParameter("user_nm").trim();
			String user_hp = request.getParameter("user_hp").trim();
			String user_email = request.getParameter("user_email").trim();
			String user_level = request.getParameter("user_level");
			String user_admin_memo = request.getParameter("user_admin_memo");
	
			if(user_id == null || user_id == "" ) {
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>alert('아이디가 없습니다.'); history.back(); </script>");
				out.flush();
				return;
			}
			if(save_mode.equals("insert")) { 	//등록일때..
				if(user_pw == null || user_pw == "" ) {
					response.setContentType("text/html; charset=UTF-8");
					PrintWriter out = response.getWriter();
					out.println("<script>alert('비밀번호가 없습니다.'); history.back(); </script>");
					out.flush();
					return;
				}
			}
			if(user_nm == null || user_nm == "" ) {
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>alert('이름이 없습니다.'); history.back(); </script>");
				out.flush();
				return;
			}
			
			String new_user_pw = "";
			if(user_pw != "" && user_pw != null) {
				new_user_pw = BaseService.encPasswd(user_id, user_pw);
			}
			admgrMemberVO.setuser_join_fl(user_join_fl);
			admgrMemberVO.setuser_seq(member_seq);
			admgrMemberVO.setuser_id(user_id);
			admgrMemberVO.setuser_pwd(new_user_pw);
			admgrMemberVO.setuser_nm(user_nm);
			admgrMemberVO.setuser_hp(user_hp);
			admgrMemberVO.setuser_email(user_email);
			admgrMemberVO.setuser_level(user_level);
			admgrMemberVO.setuser_admin_memo(user_admin_memo);
			admgrMemberVO.setuser_sex_fl(user_sex_fl);
			admgrMemberVO.setuser_st(user_st);
	
			if(("insert").equals(save_mode)) { 	//등록일때..
				admgrMemberService.insert_member(admgrMemberVO);
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>alert('등록되었습니다.'); location.replace('/admgr/admgrMember/memberList.do'); </script>");
				out.flush();
				return;
			} else { 	//수정일때..
				admgrMemberService.update_member(admgrMemberVO);
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>alert('수정되었습니다.'); location.replace('"+return_url+"'); </script>");
				out.flush();			
				return;
			}
		}
	}

	//===============================================================================================================
	// *  회원마일리지 목록
	//===============================================================================================================
	@RequestMapping(value = "/admgr/admgrMember/memberMileage.do")
	public String admgrmemberMileage(
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
			/** EgovPropertyService */
			//admgrMemberVO.setPageUnit(propertiesService.getInt("pageUnit"));
			//admgrMemberVO.setPageSize(propertiesService.getInt("pageSize")); 
			
			if(adminLevel.equals("5")) {
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>alert('권한이 필요합니다.'); history.back();</script>");
				out.flush();
				return null;
			}
	
			String searchKey = request.getParameter("searchKey");
			String searchKeyword= request.getParameter("searchKeyword");
			admgrMemberVO.setsearchKey(searchKey);
			admgrMemberVO.setsearchKeyword(searchKeyword);
			model.addAttribute("searchKey", searchKey);
			model.addAttribute("searchKeyword", searchKeyword);
			
			/** pageing start */
			admgrMemberVO.setPageUnit(15);
			admgrMemberVO.setPageSize(10); 
			PaginationInfo paginationInfo = new PaginationInfo();
			paginationInfo.setCurrentPageNo(admgrMemberVO.getPageIndex());
			paginationInfo.setRecordCountPerPage(admgrMemberVO.getPageUnit());
			paginationInfo.setPageSize(admgrMemberVO.getPageSize());
	
			admgrMemberVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
			admgrMemberVO.setLastIndex(paginationInfo.getLastRecordIndex());
			admgrMemberVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
			
			// 전체갯수 구하기
			int ListCnt = admgrMemberService.get_member_mileage_cnt(admgrMemberVO);
			paginationInfo.setTotalRecordCount(ListCnt);
			model.addAttribute("TotalCnt", ListCnt);
			model.addAttribute("paginationInfo", paginationInfo);
			
			// 해당페이지 시작번호를 구한다.
			int StartPageNumber = ListCnt - (admgrMemberVO.getPageUnit() * (admgrMemberVO.getPageIndex()-1)) + 1;
			model.addAttribute("StartPageNumber", StartPageNumber);
			/** paging end **/
			
			model.addAttribute("mileageList", admgrMemberService.get_member_mileage_list(admgrMemberVO));
			
			return "/admgr/admgrMember/memberMileage";
		}
	}


	//===============================================================================================================
	// *  마일리지 저장
	//===============================================================================================================
	@RequestMapping(value = "/admgr/admgrMember/memberMileageAction.do")
	public void admgrmemberMileageSave(
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
		}  else {	
			
			if(adminLevel.equals("5")) {
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>alert('권한이 필요합니다.'); history.back();</script>");
				out.flush();
				return;
			}
			
			String set_user_id = request.getParameter("set_user_id");
			String user_mileage_content = request.getParameter("user_mileage_content");
			String user_mileage_set = request.getParameter("user_mileage_set");
			String user_mileage = request.getParameter("user_mileage");
			
			if(user_mileage_set.equals("-")) { 	//마이너스 일때..
				user_mileage = "-"+user_mileage;
			}
			
			admgrMemberVO.setuser_id(set_user_id);
			admgrMemberVO.setuser_mileage_content(user_mileage_content);
			admgrMemberVO.setuser_mileage_set(user_mileage_set);
			admgrMemberVO.setuser_mileage(user_mileage);
			
			// 마일리지 테이블 삽입
			admgrMemberService.insert_mileage(admgrMemberVO);
			// 회원마일리지 수정
			admgrMemberService.update_user_mileage(admgrMemberVO);
			
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('등록되었습니다.'); location.replace('/admgr/admgrMember/memberMileage.do'); </script>");
			out.flush();
			return;
			
		}

	}

	
	//===============================================================================================================
	// *  모달 마일리지 회원검색
	//===============================================================================================================
	@RequestMapping(value = "/admgr/admgrModal/memberModalSearch.do")
	public String admgrmemberModalSearch(
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
			admgrMemberVO.setmodalsearchKey(modalsearchKey);
			admgrMemberVO.setmodalsearchKeyword(modalsearchKeyword);
			model.addAttribute("modalsearchKey", modalsearchKey);
			model.addAttribute("modalsearchKeyword", modalsearchKeyword);

			// 전체갯수 구하기
			int ListCnt = admgrMemberService.get_modal_member_list_cnt(admgrMemberVO);
			model.addAttribute("modalTotalCnt", ListCnt);
			
			model.addAttribute("modalMemberList", admgrMemberService.get_modal_member_list(admgrMemberVO));

			return "/admgr/admgrModal/modalmemberList";
		}

	}

	
	//===============================================================================================================
	// *  모달 상점회원 검색
	//===============================================================================================================
	@RequestMapping(value = "/admgr/admgrModal/storeMemberModalSearch.do")
	public String admgrstoreMemberModalSearch(
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

			String user_level = "5";
			String modalsearchKey = request.getParameter("modalsearchKey");
			String modalsearchKeyword = request.getParameter("modalsearchKeyword");
			admgrMemberVO.setuser_level(user_level);
			admgrMemberVO.setmodalsearchKey(modalsearchKey);
			admgrMemberVO.setmodalsearchKeyword(modalsearchKeyword);
			model.addAttribute("modalsearchKey", modalsearchKey);
			model.addAttribute("modalsearchKeyword", modalsearchKeyword);

			// 전체갯수 구하기
			int ListCnt = admgrMemberService.get_modal_member_list_cnt(admgrMemberVO);
			model.addAttribute("modalTotalCnt", ListCnt);
			
			model.addAttribute("modalMemberList", admgrMemberService.get_modal_member_list(admgrMemberVO));

			return "/admgr/admgrModal/modalStoreMemberList";
		}

	}
	
	
	
}
