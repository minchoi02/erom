package egovframework.admgrMarketing.web;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import egovframework.admgrMarketing.service.AdmgrMarketingService;
import egovframework.admgrMarketing.service.AdmgrMarketingVO;
import egovframework.admgrProduct.service.AdmgrProductService;
import egovframework.admgrProduct.service.AdmgrProductVO;
import egovframework.base.service.BaseService;
import egovframework.com.cmm.service.EgovFileMngService;
import egovframework.com.cmm.service.EgovFileMngUtil;
import egovframework.com.cmm.service.EgovProperties;
import egovframework.com.cmm.service.FileVO;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
public class AdmgrMarketingController {

	@Resource(name = "EgovFileMngService")
	private EgovFileMngService fileMngService;
	
	@Resource(name = "EgovFileMngUtil")
	private EgovFileMngUtil fileUtil;	
	
	@Resource(name = "AdmgrMarketingService")
	private AdmgrMarketingService admgrMarketingService;	
	
	@Resource(name = "AdmgrProductService")
	private AdmgrProductService admgrProductService;	
	
	@Resource(name = "BaseService")
	private BaseService baseService;	
	
	//===============================================================================================================
	// *  메인슬라이드
	//===============================================================================================================	
	@RequestMapping(value = "/admgr/admgrMarketing/mainSlide.do")
	public String admgrmainSlide(
			@ModelAttribute("admgrMarketingVO") AdmgrMarketingVO admgrMarketingVO, 
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

			String searchKeyword = request.getParameter("searchKeyword");
			String slide_seq = request.getParameter("slide_seq");

			admgrMarketingVO.setsearchKeyword(searchKeyword);
			admgrMarketingVO.setslide_seq(slide_seq);
			model.addAttribute("searchKeyword", searchKeyword);
			model.addAttribute("slide_seq", slide_seq);

			if(slide_seq != null && slide_seq != "") {
				model.addAttribute("slideInfo", admgrMarketingService.get_slide_info(admgrMarketingVO));
			}
			
			/** pageing start */
			admgrMarketingVO.setPageUnit(10);
			admgrMarketingVO.setPageSize(10); 
			PaginationInfo paginationInfo = new PaginationInfo();
			paginationInfo.setCurrentPageNo(admgrMarketingVO.getPageIndex());
			paginationInfo.setRecordCountPerPage(admgrMarketingVO.getPageUnit());
			paginationInfo.setPageSize(admgrMarketingVO.getPageSize());
	
			admgrMarketingVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
			admgrMarketingVO.setLastIndex(paginationInfo.getLastRecordIndex());
			admgrMarketingVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
			
			// 전체갯수 구하기
			int ListCnt = admgrMarketingService.get_slide_list_cnt(admgrMarketingVO);
			paginationInfo.setTotalRecordCount(ListCnt);
			model.addAttribute("TotalCnt", ListCnt);
			model.addAttribute("paginationInfo", paginationInfo);

			// 해당페이지 시작번호를 구한다.
			int StartPageNumber = ListCnt - (admgrMarketingVO.getPageUnit() * (admgrMarketingVO.getPageIndex()-1)) + 1;
			model.addAttribute("StartPageNumber", StartPageNumber);
			/** paging end **/			
			
			model.addAttribute("slideList", admgrMarketingService.get_slide_list(admgrMarketingVO));
			
			return "/admgr/admgrMarketing/mainSlide";
		}
	}
	
	//===============================================================================================================
	// *  메인슬라이드 저장
	//===============================================================================================================	
	@RequestMapping(value = "/admgr/admgrMarketing/mainSlideAction.do")
	public void admgrmainSlideAction(
			final MultipartHttpServletRequest multiRequest, 
			@ModelAttribute("admgrMarketingVO") AdmgrMarketingVO admgrMarketingVO, 
			ModelMap model, 
			HttpServletRequest request, 
			HttpServletResponse response,
			SessionStatus status			
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

			String slide_seq = request.getParameter("fslide_seq");
			model.addAttribute("slide_seq", slide_seq);			
			
			String action_mode = request.getParameter("faction_mode");
			String return_url = request.getParameter("freturn_url");

			String action_str = "";
			String action_return_url = "";
			
			String slide_use_st = request.getParameter("fslide_use_st");;
			String slide_subject =  request.getParameter("fslide_subject");
			String slide_link =  request.getParameter("fslide_link");
			String slide_target =  request.getParameter("fslide_target");
			String slide_st_dt_ymd =  request.getParameter("fslide_st_dt_ymd");
			String slide_st_dt_hour =  request.getParameter("fslide_st_dt_hour");
			String slide_st_dt_minute =  request.getParameter("fslide_st_dt_minute");
			String slide_ed_dt_ymd =  request.getParameter("fslide_ed_dt_ymd");
			String slide_ed_dt_hour =  request.getParameter("fslide_ed_dt_hour");
			String slide_ed_dt_minute =  request.getParameter("fslide_ed_dt_minute");
			String slide_img =  request.getParameter("fslide_img");

			String slide_st_dt = slide_st_dt_ymd + " " + slide_st_dt_hour + ":" + slide_st_dt_minute + ":00";
			String slide_ed_dt = slide_ed_dt_ymd + " " + slide_ed_dt_hour + ":" + slide_ed_dt_minute + ":00";
			
			admgrMarketingVO.setslide_seq(slide_seq);
			admgrMarketingVO.setslide_subject(slide_subject);
			admgrMarketingVO.setslide_link(slide_link);
			admgrMarketingVO.setslide_target(slide_target);
			admgrMarketingVO.setslide_st_dt(slide_st_dt);
			admgrMarketingVO.setslide_ed_dt(slide_ed_dt);
			admgrMarketingVO.setslide_img(slide_img);
			admgrMarketingVO.setslide_use_st(slide_use_st);

			/* 파일첨부 영역 { */
			String saveFilePath =  "Globals.fileEditorPath";
			List<FileVO> result = null;
			String attachFileId = "";
			final Map<String, MultipartFile> files = multiRequest.getFileMap();
			            
			if(!files.isEmpty()) {
				result = fileUtil.parseFileInf(files, "SLIDE_",0,"", saveFilePath);
				attachFileId = fileMngService.insertFileInfs(result);
				admgrMarketingVO.setslide_img(attachFileId);
			}
			/* } 파일첨부 영역 */
		
			switch(action_mode) {
				case "insert" :  
					admgrMarketingService.insert_slide(admgrMarketingVO);
					action_str = "등록";
					action_return_url = "/admgr/admgrMarketing/mainSlide.do";
					break;
				case "update" :
					admgrMarketingService.update_slide(admgrMarketingVO);
					action_str = "수정";
					action_return_url = return_url;
					break;
			}
			
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('"+action_str+"되었습니다.'); location.replace('"+action_return_url+"'); </script>");
			out.flush();			
			return;

		}
	}

	//===============================================================================================================
	// *  슬라이드 삭제
	//===============================================================================================================
	@RequestMapping(value = "/admgr/admgrMarketing/slideDelete.do")
	public void admgrSlidedelete(
			@ModelAttribute("admgrMarketingVO") AdmgrMarketingVO admgrMarketingVO, 
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
			
			String slide_seq = request.getParameter("slide_seq");
			String searchKeyword = request.getParameter("searchKeyword");
			String pageIndex = request.getParameter("pageIndex");
			if(pageIndex != null && pageIndex != "") {
				pageIndex = "1";
			}
			
			admgrMarketingVO.setslide_seq(slide_seq);
			admgrMarketingService.delete_slide(admgrMarketingVO);
			String action_return_url = "/admgr/admgrMarketing/mainSlide.do?pageIndex="+pageIndex+"&searchKeyword="+searchKeyword;

			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('삭제되었습니다.'); location.replace('"+action_return_url+"'); </script>");
			out.flush();			
			return;

		}
	}	
	
	//===============================================================================================================
	// *  금주의 상품
	//===============================================================================================================
	@RequestMapping(value = "/admgr/admgrMarketing/week.do")
	public String admgrweek(
			@ModelAttribute("admgrMarketingVO") AdmgrMarketingVO admgrMarketingVO, 
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

			String store_category = request.getParameter("store_category");
			String searchKeyword = request.getParameter("searchKeyword");
			String week_seq = request.getParameter("week_seq");
			admgrMarketingVO.setstore_category(store_category);
			admgrMarketingVO.setsearchKeyword(searchKeyword);
			admgrMarketingVO.setsearchKeyword(week_seq);
			model.addAttribute("store_category", store_category);
			model.addAttribute("searchKeyword", searchKeyword);
			model.addAttribute("week_seq", week_seq);

			if(week_seq != null && week_seq != "") {
				model.addAttribute("weekInfo", admgrMarketingService.get_week_info(admgrMarketingVO));
			}
			
			/** pageing start */
			admgrMarketingVO.setPageUnit(10);
			admgrMarketingVO.setPageSize(10); 
			PaginationInfo paginationInfo = new PaginationInfo();
			paginationInfo.setCurrentPageNo(admgrMarketingVO.getPageIndex());
			paginationInfo.setRecordCountPerPage(admgrMarketingVO.getPageUnit());
			paginationInfo.setPageSize(admgrMarketingVO.getPageSize());
	
			admgrMarketingVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
			admgrMarketingVO.setLastIndex(paginationInfo.getLastRecordIndex());
			admgrMarketingVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
			
			int ListCnt = admgrMarketingService.get_week_list_cnt(admgrMarketingVO);
			paginationInfo.setTotalRecordCount(ListCnt);
			model.addAttribute("TotalCnt", ListCnt);
			model.addAttribute("paginationInfo", paginationInfo);
			
			// 해당페이지 시작번호를 구한다.
			int StartPageNumber = ListCnt - (admgrMarketingVO.getPageUnit() * (admgrMarketingVO.getPageIndex()-1)) + 1;
			model.addAttribute("StartPageNumber", StartPageNumber);
			
			model.addAttribute("weekList", admgrMarketingService.get_week_list(admgrMarketingVO));
			
			return "/admgr/admgrMarketing/week";
		}
	}

	//===============================================================================================================
	// *  금주의 상품 저장
	//===============================================================================================================
	@RequestMapping(value = "/admgr/admgrMarketing/weekAction.do")
	public void admgrWeekAction(
			@ModelAttribute("admgrMarketingVO") AdmgrMarketingVO admgrMarketingVO, 
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

			String week_seq = request.getParameter("week_seq");
			model.addAttribute("week_seq", week_seq);			
			
			String action_mode = request.getParameter("action_mode");
			String return_url = request.getParameter("return_url");

			String action_str = "";
			String action_return_url = "";

			String week_use_st = request.getParameter("week_use_st");
			if(week_use_st == null || week_use_st =="") {
				week_use_st = "Y";
			}
			String store_category =  request.getParameter("store_category");
			String prod_id =  request.getParameter("prod_id");
			String week_st_dt_ymd =  request.getParameter("week_st_dt_ymd");
			String week_st_dt_hour =  request.getParameter("week_st_dt_hour");
			String week_st_dt_minute =  request.getParameter("week_st_dt_minute");
			String week_ed_dt_ymd =  request.getParameter("week_ed_dt_ymd");
			String week_ed_dt_hour =  request.getParameter("week_ed_dt_hour");
			String week_ed_dt_minute =  request.getParameter("week_ed_dt_minute");

			String week_st_dt = week_st_dt_ymd + " " + week_st_dt_hour + ":" + week_st_dt_minute + ":00";
			String week_ed_dt = week_ed_dt_ymd + " " + week_ed_dt_hour + ":" + week_ed_dt_minute + ":00";
			
			admgrMarketingVO.setweek_seq(week_seq);
			admgrMarketingVO.setstore_category(store_category);
			admgrMarketingVO.setprod_id(prod_id);
			admgrMarketingVO.setweek_st_dt(week_st_dt);
			admgrMarketingVO.setweek_ed_dt(week_ed_dt);
			admgrMarketingVO.setweek_use_st(week_use_st);
			
			switch(action_mode) {
				case "insert" :  
					admgrMarketingService.insert_week(admgrMarketingVO);
					action_str = "등록";
					action_return_url = "/admgr/admgrMarketing/week.do";
					break;
				case "update" :
					admgrMarketingService.update_week(admgrMarketingVO);
					action_str = "수정";
					action_return_url = return_url;
					break;
				case "delete" :
					admgrMarketingVO.setweek_use_st("N");
					admgrMarketingService.delete_week(admgrMarketingVO);
					action_str = "삭제";
					action_return_url = return_url;
					break;
			}
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('"+action_str+"되었습니다.'); location.replace('"+action_return_url+"'); </script>");
			out.flush();			
			return;

		}
	}

	//===============================================================================================================
	// *  금주의 서천 삭제
	//===============================================================================================================
	@RequestMapping(value = "/admgr/admgrMarketing/weekDelete.do")
	public void admgrWeekdelete(
			@ModelAttribute("admgrMarketingVO") AdmgrMarketingVO admgrMarketingVO, 
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
			
			String week_seq = request.getParameter("week_seq");
			String searchKey= request.getParameter("searchKey");
			String searchKeyword = request.getParameter("searchKeyword");
			String store_category = request.getParameter("store_category");
			String pageIndex = request.getParameter("pageIndex");
			if(pageIndex != null && pageIndex != "") {
				pageIndex = "1";
			}
			
			admgrMarketingVO.setweek_seq(week_seq);
			admgrMarketingService.delete_week(admgrMarketingVO);
			String action_return_url = "/admgr/admgrMarketing/week.do?pageIndex="+pageIndex+"&store_category="+store_category+"&searchKey="+searchKey+"&searchKeyword="+searchKeyword;

			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('삭제되었습니다.'); location.replace('"+action_return_url+"'); </script>");
			out.flush();			
			return;

		}
	}		
	
	//===============================================================================================================
	// *  배너
	//===============================================================================================================
	@RequestMapping(value = "/admgr/admgrMarketing/banner.do")
	public String admgrbanner(
			@ModelAttribute("admgrMarketingVO") AdmgrMarketingVO admgrMarketingVO, 
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

			String zone = request.getParameter("zone");
			String searchKeyword = request.getParameter("searchKeyword");
			String banner_seq = request.getParameter("banner_seq");
			admgrMarketingVO.setzone(zone);
			admgrMarketingVO.setsearchKeyword(searchKeyword);
			admgrMarketingVO.setbanner_seq(banner_seq);
			model.addAttribute("zone", zone);
			model.addAttribute("searchKeyword", searchKeyword);
			model.addAttribute("banner_seq", banner_seq);

			if(banner_seq != null && banner_seq != "") {
				model.addAttribute("bannerInfo", admgrMarketingService.get_banner_info(admgrMarketingVO));
			}
			
			/** pageing start */
			admgrMarketingVO.setPageUnit(10);
			admgrMarketingVO.setPageSize(10); 
			PaginationInfo paginationInfo = new PaginationInfo();
			paginationInfo.setCurrentPageNo(admgrMarketingVO.getPageIndex());
			paginationInfo.setRecordCountPerPage(admgrMarketingVO.getPageUnit());
			paginationInfo.setPageSize(admgrMarketingVO.getPageSize());
	
			admgrMarketingVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
			admgrMarketingVO.setLastIndex(paginationInfo.getLastRecordIndex());
			admgrMarketingVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
			
			// 전체갯수 구하기
			int ListCnt = admgrMarketingService.get_banner_list_cnt(admgrMarketingVO);
			paginationInfo.setTotalRecordCount(ListCnt);
			model.addAttribute("TotalCnt", ListCnt);
			model.addAttribute("paginationInfo", paginationInfo);

			// 해당페이지 시작번호를 구한다.
			int StartPageNumber = ListCnt - (admgrMarketingVO.getPageUnit() * (admgrMarketingVO.getPageIndex()-1)) + 1;
			model.addAttribute("StartPageNumber", StartPageNumber);
			/** paging end **/
			
			model.addAttribute("bannerList", admgrMarketingService.get_banner_list(admgrMarketingVO));
			
			return "/admgr/admgrMarketing/banner";
		}
	}
	
	//===============================================================================================================
	// *  배너 저장
	//===============================================================================================================
	@RequestMapping(value = "/admgr/admgrMarketing/bannerAction.do")
	public void admgrBannerAction(
			final MultipartHttpServletRequest multiRequest, 
			@ModelAttribute("admgrMarketingVO") AdmgrMarketingVO admgrMarketingVO, 
			ModelMap model, 
			HttpServletRequest request, 
			HttpServletResponse response,
			SessionStatus status
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
			
			String banner_seq = request.getParameter("fbanner_seq");
			model.addAttribute("banner_seq", banner_seq);			
			
			String action_mode = request.getParameter("faction_mode");
			String return_url = request.getParameter("freturn_url");

			String action_str = "";
			String action_return_url = "";
			
			String banner_use_st = request.getParameter("fbanner_use_st");;
			String banner_zone_1 =  request.getParameter("fbanner_zone_1");
			if(banner_zone_1 == null || banner_zone_1 == "") {
				banner_zone_1 = "N";
			}
			String banner_zone_2 =  request.getParameter("fbanner_zone_2");
			if(banner_zone_2 == null || banner_zone_2 == "") {
				banner_zone_2 = "N";
			}
			String banner_zone_3 =  request.getParameter("fbanner_zone_3");
			if(banner_zone_3 == null || banner_zone_3 == "") {
				banner_zone_3 = "N";
			}
			String banner_subject =  request.getParameter("fbanner_subject");
			String banner_link =  request.getParameter("fbanner_link");
			String banner_target =  request.getParameter("fbanner_target");
			String banner_st_dt_ymd =  request.getParameter("fbanner_st_dt_ymd");
			String banner_st_dt_hour =  request.getParameter("fbanner_st_dt_hour");
			String banner_st_dt_minute =  request.getParameter("fbanner_st_dt_minute");
			String banner_ed_dt_ymd =  request.getParameter("fbanner_ed_dt_ymd");
			String banner_ed_dt_hour =  request.getParameter("fbanner_ed_dt_hour");
			String banner_ed_dt_minute =  request.getParameter("fbanner_ed_dt_minute");

			String banner_st_dt = banner_st_dt_ymd + " " + banner_st_dt_hour + ":" + banner_st_dt_minute + ":00";
			String banner_ed_dt = banner_ed_dt_ymd + " " + banner_ed_dt_hour + ":" + banner_ed_dt_minute + ":00";
			
			/* 파일첨부 영역 { */
			String saveFilePath =  "Globals.fileBannerPath";
	        List<FileVO> result = null;
	        String attachFileId = "";
	        final Map<String, MultipartFile> files = multiRequest.getFileMap();
            
	        if(!files.isEmpty()) {
				result = fileUtil.parseFileInf(files, "BANNER_",0,"", saveFilePath);
				attachFileId = fileMngService.insertFileInfs(result);
	        }
			/* } 파일첨부 영역 */
			
			admgrMarketingVO.setbanner_seq(banner_seq);
			admgrMarketingVO.setbanner_zone_1(banner_zone_1);
			admgrMarketingVO.setbanner_zone_2(banner_zone_2);
			admgrMarketingVO.setbanner_zone_3(banner_zone_3);
			admgrMarketingVO.setbanner_subject(banner_subject);
			admgrMarketingVO.setbanner_link(banner_link);
			admgrMarketingVO.setbanner_target(banner_target);
			admgrMarketingVO.setbanner_st_dt(banner_st_dt);
			admgrMarketingVO.setbanner_ed_dt(banner_ed_dt);
        	admgrMarketingVO.setbanner_img(attachFileId);
			admgrMarketingVO.setbanner_use_st(banner_use_st);
			
			switch(action_mode) {
				case "insert" :  
					admgrMarketingService.insert_banner(admgrMarketingVO);
					action_str = "등록";
					action_return_url = "/admgr/admgrMarketing/banner.do";
					break;
				case "update" :
					admgrMarketingService.update_banner(admgrMarketingVO);
					action_str = "수정";
					action_return_url = return_url;
					break;
			}
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('"+action_str+"되었습니다.'); location.replace('"+action_return_url+"'); </script>");
			out.flush();			
			return;

		}
	}
	
	//===============================================================================================================
	// *  배너 삭제
	//===============================================================================================================
	@RequestMapping(value = "/admgr/admgrMarketing/bannerDelete.do")
	public void admgrBannerdelete(
			@ModelAttribute("admgrMarketingVO") AdmgrMarketingVO admgrMarketingVO, 
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

			String banner_seq = request.getParameter("banner_seq");
			String zone = request.getParameter("zone");
			String searchKeyword = request.getParameter("searchKeyword");
			String pageIndex = request.getParameter("pageIndex");
			if(pageIndex != null && pageIndex != "") {
				pageIndex = "1";
			}
			
			admgrMarketingVO.setbanner_seq(banner_seq);
			admgrMarketingService.delete_banner(admgrMarketingVO);
			String action_return_url = "/admgr/admgrMarketing/banner.do?pageIndex="+pageIndex+"&zone="+zone+"&searchKeyword="+searchKeyword;

			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('삭제되었습니다.'); location.replace('"+action_return_url+"'); </script>");
			out.flush();			
			return;

		}
	}
		
	//===============================================================================================================
	// *  메인상품
	//===============================================================================================================
	@RequestMapping(value = "/admgr/admgrMarketing/mainProduct.do")
	public String admgrmainProduct(
			@ModelAttribute("admgrMarketingVO") AdmgrMarketingVO admgrMarketingVO, 
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

			String store_category = request.getParameter("store_category");
			String searchKeyword = request.getParameter("searchKeyword");
			String main_seq = request.getParameter("main_seq");
			admgrMarketingVO.setstore_category(store_category);
			admgrMarketingVO.setsearchKeyword(searchKeyword);
			admgrMarketingVO.setmain_seq(main_seq);
			model.addAttribute("store_category", store_category);
			model.addAttribute("searchKeyword", searchKeyword);
			model.addAttribute("main_seq", main_seq);

			if(main_seq != null && main_seq != "") {
				model.addAttribute("mainInfo", admgrMarketingService.get_main_info(admgrMarketingVO));
			}
			
			/** pageing start */
			admgrMarketingVO.setPageUnit(10);
			admgrMarketingVO.setPageSize(10); 
			PaginationInfo paginationInfo = new PaginationInfo();
			paginationInfo.setCurrentPageNo(admgrMarketingVO.getPageIndex());
			paginationInfo.setRecordCountPerPage(admgrMarketingVO.getPageUnit());
			paginationInfo.setPageSize(admgrMarketingVO.getPageSize());
	
			admgrMarketingVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
			admgrMarketingVO.setLastIndex(paginationInfo.getLastRecordIndex());
			admgrMarketingVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
			
			// 전체갯수 구하기
			int ListCnt = admgrMarketingService.get_main_list_cnt(admgrMarketingVO);
			paginationInfo.setTotalRecordCount(ListCnt);
			model.addAttribute("TotalCnt", ListCnt);
			model.addAttribute("paginationInfo", paginationInfo);

			// 해당페이지 시작번호를 구한다.
			int StartPageNumber = ListCnt - (admgrMarketingVO.getPageUnit() * (admgrMarketingVO.getPageIndex()-1)) + 1;
			model.addAttribute("StartPageNumber", StartPageNumber);
			/** paging end **/
			
			model.addAttribute("mainList", admgrMarketingService.get_main_list(admgrMarketingVO));

			return "/admgr/admgrMarketing/mainProduct";
		}
	}

	//===============================================================================================================
	// *  메인상품 저장
	//===============================================================================================================
	@RequestMapping(value = "/admgr/admgrMarketing/mainProductAction.do")
	public void admgrmainProductAction(
			@ModelAttribute("admgrMarketingVO") AdmgrMarketingVO admgrMarketingVO, 
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

			String main_seq = request.getParameter("main_seq");
			model.addAttribute("main_seq", main_seq);			
			
			String action_mode = request.getParameter("action_mode");
			String return_url = request.getParameter("return_url");

			String action_str = "";
			String action_return_url = "";
			
			String main_use_st = request.getParameter("main_use_st");;
			String store_category =  request.getParameter("store_category");
			String prod_seq =  request.getParameter("prod_seq");
			String main_st_dt_ymd =  request.getParameter("main_st_dt_ymd");
			String main_st_dt_hour =  request.getParameter("main_st_dt_hour");
			String main_st_dt_minute =  request.getParameter("main_st_dt_minute");
			String main_ed_dt_ymd =  request.getParameter("main_ed_dt_ymd");
			String main_ed_dt_hour =  request.getParameter("main_ed_dt_hour");
			String main_ed_dt_minute =  request.getParameter("main_ed_dt_minute");

			String main_st_dt = main_st_dt_ymd + " " + main_st_dt_hour + ":" + main_st_dt_minute + ":00";
			String main_ed_dt = main_ed_dt_ymd + " " + main_ed_dt_hour + ":" + main_ed_dt_minute + ":00";
			
			admgrMarketingVO.setmain_seq(main_seq);
			admgrMarketingVO.setstore_category(store_category);
			admgrMarketingVO.setprod_seq(prod_seq);
			admgrMarketingVO.setmain_st_dt(main_st_dt);
			admgrMarketingVO.setmain_ed_dt(main_ed_dt);
			admgrMarketingVO.setmain_use_st(main_use_st);
			
			switch(action_mode) {
				case "insert" :  
					admgrMarketingService.insert_main(admgrMarketingVO);
					action_str = "등록";
					action_return_url = "/admgr/admgrMarketing/mainProduct.do";
					break;
				case "update" :
					admgrMarketingService.update_main(admgrMarketingVO);
					action_str = "수정";
					action_return_url = return_url;
					break;
				case "delete" :
					admgrMarketingVO.setmain_use_st("N");
					admgrMarketingService.delete_main(admgrMarketingVO);
					action_str = "삭제";
					action_return_url = return_url;
					break;
			}
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('"+action_str+"되었습니다.'); location.replace('"+action_return_url+"'); </script>");
			out.flush();			
			return;

		}
	}

	//===============================================================================================================
	// *  메인상품 삭제
	//===============================================================================================================
	@RequestMapping(value = "/admgr/admgrMarketing/mainDelete.do")
	public void admgrMaindelete(
			@ModelAttribute("admgrMarketingVO") AdmgrMarketingVO admgrMarketingVO, 
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

			String main_seq = request.getParameter("main_seq");
			String store_category = request.getParameter("store_category");
			String searchKey= request.getParameter("searchKey");
			String searchKeyword = request.getParameter("searchKeyword");
			String pageIndex = request.getParameter("pageIndex");
			if(pageIndex != null && pageIndex != "") {
				pageIndex = "1";
			}
			
			admgrMarketingVO.setmain_seq(main_seq);
			admgrMarketingService.delete_week(admgrMarketingVO);
			String action_return_url = "/admgr/admgrMarketing/mainProduct.do?pageIndex="+pageIndex+"&store_category="+store_category+"&searchKey="+searchKey+"&searchKeyword="+searchKeyword;

			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('삭제되었습니다.'); location.replace('"+action_return_url+"'); </script>");
			out.flush();			
			return;

		}
	}		
	
	//===============================================================================================================
	// *  모달 상품검색
	//===============================================================================================================
	@RequestMapping(value = "/admgr/admgrModal/prodModalList.do")
	public String admgrprodModalSearch(
			@ModelAttribute("admgrMarketingVO") AdmgrMarketingVO admgrMarketingVO, 
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

			String modalstore_category = request.getParameter("modalstore_category");
			String modalprod_use_pay_st= request.getParameter("modalprod_use_pay_st");
			String modalsearchKey = request.getParameter("modalsearchKey");
			String modalsearchKeyword = request.getParameter("modalsearchKeyword");
			
			admgrProductVO.setstore_category(modalstore_category);
			admgrProductVO.setprod_use_pay_st(modalprod_use_pay_st);
			admgrProductVO.setsearchKey(modalsearchKey);
			admgrProductVO.setsearchKeyword(modalsearchKeyword);
			model.addAttribute("modalsearchKey", modalsearchKey);
			model.addAttribute("modalsearchKeyword", modalsearchKeyword);

			// 전체갯수 구하기
			int ListCnt = admgrProductService.get_product_modal_list_cnt(admgrProductVO);
			model.addAttribute("modalTotalCnt", ListCnt);
			
			model.addAttribute("modalProductList", admgrProductService.get_product_modal_list(admgrProductVO));

			return "/admgr/admgrModal/modalProductList";
		}

	}	
}
