package egovframework.base.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
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

import egovframework.admgrConfig.service.AdmgrConfigService;
import egovframework.admgrConfig.service.AdmgrConfigVO;
import egovframework.base.board.service.BaseBoardService;
import egovframework.base.board.service.BaseBoardVO;
import egovframework.base.member.service.BaseMemberService;
import egovframework.base.member.service.BaseMemberVO;
import egovframework.base.service.BaseService;
import egovframework.base.service.BaseVO;
import egovframework.base.shop.service.BaseShopService;
import egovframework.base.shop.service.BaseShopVO;
import egovframework.com.cmm.SessionVO;
import egovframework.com.cmm.service.EgovFileMngService;
import egovframework.com.cmm.service.EgovFileMngUtil;
import egovframework.com.cmm.service.FileVO;

@Controller
public class BaseController {
	
	@Resource(name = "EgovFileMngService")
	private EgovFileMngService fileMngService;
	
	@Resource(name = "EgovFileMngUtil")
	private EgovFileMngUtil fileUtil;	
	
	@Resource(name = "BaseShopService")
	private BaseShopService baseShopService;	
	
	@Resource(name = "BaseService")
	private BaseService baseService;	
	
	@Resource(name = "BaseMemberService")
	private BaseMemberService baseMemberService;	
	
	@Resource(name = "AdmgrConfigService")
	private AdmgrConfigService admgrConfigService;	
	
	@Resource(name = "BaseBoardService")
	private BaseBoardService baseBoardService;		
	
	//=========================================================
	@RequestMapping(value = "/Api/basedbrealupdate.do")
	public void dbrealupdate(
		@ModelAttribute("BaseVO") BaseVO baseVO, 
		ModelMap model, 
		HttpServletRequest request, 
		HttpServletResponse response
		) throws Exception {
		baseService.basedbrealupdate(null);
	}
	//=========================================================
	@RequestMapping(value = "/Api/basedbdevupdate.do")
	public void dbdevupdate(
		@ModelAttribute("BaseVO") BaseVO baseVO, 
		ModelMap model, 
		HttpServletRequest request, 
		HttpServletResponse response
		) throws Exception {
		baseService.basedbdevupdate(null);
	}
	//=========================================================
	@RequestMapping(value = "/Api/admgrIncludeTop.do")
	public String admgrIncludeTop(
		@ModelAttribute("BaseVO") BaseVO baseVO, 
		ModelMap model, 
		HttpServletRequest request, 
		HttpServletResponse response
		) throws Exception {
		model.addAttribute("SiteBaseConfig",admgrConfigService.get_base_config(null));
		return "admgr/admgrInclude/admgrIncludeTop";
	}
	//=========================================================
	@RequestMapping(value = "/Api/admgrIncludeTopSub.do")
	public String admgrIncludeTopSub(
		@ModelAttribute("BaseVO") BaseVO baseVO, 
		@ModelAttribute("BaseShopVO") BaseShopVO baseShopVO, 
		@ModelAttribute("BaseBoardVO") BaseBoardVO baseBoardVO, 
		@ModelAttribute("BaseMemberVO") BaseMemberVO baseMemberVO, 		
		ModelMap model, 
		HttpServletRequest request, 
		HttpServletResponse response
		) throws Exception {
		

		model.addAttribute("SiteBaseConfig",admgrConfigService.get_base_config(null));
		return "admgr/admgrInclude/admgrIncludeTopSub";
	}
	//=========================================================
	//=========================================================
	@RequestMapping(value = "/Api/admgrIncludeLeftMenu.do")
	public String admgrIncludeLeftMenu(
		@ModelAttribute("BaseVO") BaseVO baseVO, 
		ModelMap model, 
		HttpServletRequest request, 
		HttpServletResponse response
		) throws Exception {
		model.addAttribute("SiteBaseConfig",admgrConfigService.get_base_config(null));
		return "admgr/admgrInclude/admgrIncludeLeftMenu";
	}
	//=========================================================
	//=========================================================
	@RequestMapping(value = "/Api/admgrIncludeBottom.do")
	public String admgrIncludeBottom(
			@ModelAttribute("BaseVO") BaseVO baseVO, 
			ModelMap model, 
			HttpServletRequest request, 
			HttpServletResponse response
		) throws Exception {
		model.addAttribute("SiteBaseConfig",admgrConfigService.get_base_config(null));
		String store_category = request.getParameter("store_category");
		model.addAttribute("store_category", store_category);
		
		return "admgr/admgrInclude/admgrIncludeBottom";
	}
	//=========================================================
	//=========================================================
	@RequestMapping(value = "/Api/admgrIncludeBottomSub.do")
	public String admgrIncludeBottomSub(
			@ModelAttribute("BaseVO") BaseVO baseVO, 
			ModelMap model, 
			HttpServletRequest request, 
			HttpServletResponse response
		) throws Exception {
		model.addAttribute("SiteBaseConfig",admgrConfigService.get_base_config(null));
		return "admgr/admgrInclude/admgrIncludeBottomSub";
	}
	//=========================================================
	
	//=========================================================
	@RequestMapping(value = "/Api/IncludeTop.do")
	public String IncludeTop(
			@ModelAttribute("BaseVO") BaseVO baseVO, 
			@ModelAttribute("AdmgrConfigVO") AdmgrConfigVO admgrConfigVO, 
			@ModelAttribute("BaseMemberVO") BaseMemberVO baseMemberVO, 
			ModelMap model, 
			HttpServletRequest request, 
			HttpServletResponse response
		) throws Exception {
		// ??????????????? ????????????
		HttpSession session = request.getSession(true);
		String sess_id = (String) session.getId();
		session.setAttribute("isMobile", "0");
		session.setAttribute("isApp", "0");
		String user_id = (String) session.getAttribute("user_id");
		String user_ip = BaseService.getRemoteIP(request);
		
		if(user_id != null && user_id !="") {
			baseMemberVO.setuser_id(user_id);
			model.addAttribute("memberInfo", baseMemberService.get_site_user_info(baseMemberVO));
		}
		AdmgrConfigVO getConfig = admgrConfigService.get_base_config(null);
		model.addAttribute("SiteBaseConfig",getConfig);
		
		/* ???????????? ?????? */
		SimpleDateFormat formatdate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date date = new Date();
		Calendar cal = Calendar.getInstance(); 
		cal.setTime(date);
		// DB??? ????????? ??? ???????????? ?????? - ???, 20???????????? 20????????? ????????? ????????? ????????????.
		cal.add(Calendar.MINUTE, Integer.parseInt("-"+getConfig.gettime_limit()));
		String ChkTime = formatdate.format(cal.getTime());
		baseVO.settime_now(ChkTime);

		baseVO.setuser_id(user_id);
		baseVO.setuser_ip(user_ip);
		baseVO.setsess_id(sess_id);
		
		/* ???????????? */
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
			if ("dtoursc".indexOf(user_agent) > -1) {
				isApp = "1";
			}
		}
		
		//??????????????? ????????? ??????
		session.setAttribute("isMobile", isMobile);
		session.setAttribute("isApp", isApp);
		session.setAttribute("isMoOS", isMoOS);
		
		int is_view_agent = baseService.get_log_agent(baseVO);
		if(is_view_agent == 0) {
			baseVO.setuser_agent(user_agent);
			baseService.set_log_agent(baseVO);
		}

		
		/* ???????????? ??? */
		return "baseScmtour/baseIncludes/includeTop";
	}
	//=========================================================
	@RequestMapping(value = "/Api/IncludeTopSub.do")
	public String IncludeTopSub(
		@ModelAttribute("BaseVO") BaseVO baseVO, 
		@ModelAttribute("BaseMemberVO") BaseMemberVO baseMemberVO, 
		@ModelAttribute("BaseShopVO") BaseShopVO baseShopVO, 
		@ModelAttribute("BaseBoardVO") BaseBoardVO baseBoardVO,		
		ModelMap model, 
		HttpServletRequest request, 
		HttpServletResponse response
		) throws Exception {
		// ??????????????? ????????????
		HttpSession session = request.getSession(true);
		String user_id = (String) session.getAttribute("user_id");	
		if(user_id != null && user_id !="") {
			baseMemberVO.setuser_id(user_id);
			model.addAttribute("memberInfo", baseMemberService.get_site_user_info(baseMemberVO));
		}
		model.addAttribute("SiteBaseConfig",admgrConfigService.get_base_config(null));
		baseShopVO.setuser_id(user_id);
		baseShopVO.setstore_category("CD002004");
		model.addAttribute("cartList4", baseShopService.get_cart_list(baseShopVO));
		System.out.println( baseShopService.get_cart_list(baseShopVO));
		System.out.println("11111111111111111111111111111111");
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
		
		
		//?????? ??????
		baseBoardVO.setsql_limit(5);
		baseBoardVO.setbanner_zone_1("Y");
		baseBoardVO.setbanner_zone_2("N");
		model.addAttribute("banner1List", baseBoardService.get_banner(baseBoardVO));
				
		
		//??????????????? ????????? ??????
		session.setAttribute("isMobile", isMobile);
		session.setAttribute("isApp", isApp);
		session.setAttribute("isMoOS", isMoOS);
		
		return "baseScmtour/baseIncludes/includeTopSub";
	}
	//=========================================================
	@RequestMapping(value = "/Api/IncludeBottom.do")
	public String IncludeBottom(
		@ModelAttribute("BaseVO") BaseVO baseVO, 
		@ModelAttribute("BaseMemberVO") BaseMemberVO baseMemberVO, 
		ModelMap model, 
		HttpServletRequest request, 
		HttpServletResponse response
		) throws Exception {
		// ??????????????? ????????????
		HttpSession session = request.getSession(true);
		String user_id = (String) session.getAttribute("user_id");	
		if(user_id != null && user_id !="") {
			baseMemberVO.setuser_id(user_id);
			model.addAttribute("memberInfo", baseMemberService.get_site_user_info(baseMemberVO));
		}
		model.addAttribute("SiteBaseConfig",admgrConfigService.get_base_config(null));
		String lat = request.getParameter("lat");
		String lng = request.getParameter("lng");
		model.addAttribute("lat", lat);
		model.addAttribute("lng", lng);
		return "baseScmtour/baseIncludes/includeBottom";
	}
	//=========================================================

	//=========================================================
	@RequestMapping(value = "/Api/editorFileUpload.do")
	public String EditorFileUpload(
			final MultipartHttpServletRequest multiRequest,
			SessionVO sessionVO,
			ModelMap model, 
			HttpServletRequest request, 
			HttpServletResponse response,
			SessionStatus status
		) throws Exception {
		
		/* ???????????? ?????? { */
		String saveFilePath =  "Globals.fileEditorPath";
        List<FileVO> result = null;
        String attachFileId = "";
        final Map<String, MultipartFile> files = multiRequest.getFileMap();
        
        if(!files.isEmpty()) {
			result = fileUtil.parseFileInf(files, "EDITOR_",0,"", saveFilePath);
			attachFileId = fileMngService.insertFileInfs(result);
        } else {
        	System.out.println("==================");
        	System.out.println("NO File");
        	System.out.println("==================");
        }
		/* } ???????????? ?????? */
        
       model.addAttribute("filePath", attachFileId);          //????????????
		
       return "CKEditor5/CKEditor5UploadComplete";
	}

	//=========================================================
	@RequestMapping(value = "/Api/FileUpload.do")
	public String FileUpload(
		final MultipartHttpServletRequest multiRequest,
		SessionVO sessionVO,
		ModelMap model, 
		HttpServletRequest request, 
		HttpServletResponse response,
		SessionStatus status
		) throws Exception {
	
		String fileurl = request.getParameter("uploadUrl");
		String urlSet = "";
		String fileFname = "";
		switch(fileurl) {
			case "store" :  fileFname = "STORE_"; urlSet = "Globals.fileStorePath"; break;
			case "base" :  fileFname = "BASE_"; urlSet = "Globals.fileBasePath"; break;
			case "editor" :  fileFname = "EDITOR_"; urlSet = "Globals.fileEditorPath"; break;
			case "item" :  fileFname = "ITEM_"; urlSet = "Globals.fileItemPath"; break;
			case "banner" :  fileFname = "BANER_"; urlSet = "Globals.fileBannerPath"; break;
			case "slide" :  fileFname = "SLIDE_"; urlSet = "Globals.fileSlidePath"; break;
			case "event" :  fileFname = "EVENT_"; urlSet = "Globals.fileEventPath"; break;
			case "popup" :  fileFname = "POPUP_"; urlSet = "Globals.filePopupPath"; break;
			case "design" :  fileFname = "DESIGN_"; urlSet = "Globals.fileDesignPath"; break;
			case "bbs" :  fileFname = "BBS_"; urlSet = "Globals.fileBbsPath"; break;
			case "movie" :  fileFname = "MOVIE_"; urlSet = "Globals.fileMoviePath"; break;
			case "etc" :  fileFname = "ETC_"; urlSet = "Globals.fileEtcPath"; break;
		}
		
		/* ???????????? ?????? { */
		String saveFilePath =  urlSet;
		List<FileVO> result = null;
		String attachFileId = "";
		final Map<String, MultipartFile> files = multiRequest.getFileMap();
		
		if(!files.isEmpty()) {
			result = fileUtil.parseFileInf(files, fileFname,0,"", saveFilePath);
			attachFileId = fileMngService.insertFileInfs(result);
		} else {
			System.out.println("==================");
			System.out.println("NO File");
			System.out.println("==================");
		}
		/* } ???????????? ?????? */
		
		model.addAttribute("attachFileId", attachFileId);          //????????????
		
		return "api/upload_result";
	}

	//=========================================================
	@RequestMapping(value = "/Api/appVerCheck.do")
	public String appVerCheck(
		@ModelAttribute("BaseVO") BaseVO baseVO,
		SessionVO sessionVO,
		ModelMap model, 
		HttpServletRequest request, 
		HttpServletResponse response,
		SessionStatus status
		) throws Exception {
	
		BaseVO app_version_info = baseService.app_version_info(null);
		model.addAttribute("androidVer",app_version_info.getandroid());
		model.addAttribute("iosVer",app_version_info.getios());
		
		return "api/app_version";
	}

	//=========================================================
	@RequestMapping(value = "/Api/appTokenUpdate.do")
	public void appTokenUpdate(
		@ModelAttribute("BaseVO") BaseVO baseVO,
		SessionVO sessionVO,
		ModelMap model, 
		HttpServletRequest request, 
		HttpServletResponse response,
		SessionStatus status
		) throws Exception {
	
		String user_device_token = request.getParameter("user_device_token");
		String user_device_os = request.getParameter("user_device_os");
		String user_id = request.getParameter("user_id");
		
		baseVO.setuser_id(user_id);
		baseVO.setuser_device_os(user_device_os);
		baseVO.setuser_device_token(user_device_token);		
		
		baseService.update_member_token(baseVO);
		
	}
	
	//=========================================================
	@RequestMapping(value = "/Api/CalcInsert.do")
	public void CalcInsert(
		@ModelAttribute("BaseVO") BaseVO baseVO,
		SessionVO sessionVO,
		ModelMap model, 
		HttpServletRequest request, 
		HttpServletResponse response,
		SessionStatus status
		) throws Exception {
	
		// ????????? ??? ????????? ????????????.
		List<BaseVO> get_calc_list = baseService.get_calc_target_list(null);
		if(get_calc_list != null) {
			for(int i=0; i<get_calc_list.size(); i++) {
				String cal_order_id = get_calc_list.get(i).getod_order_id();
				String cal_order_detail_seq = get_calc_list.get(i).getod_seq();
				baseVO.setcal_order_id(cal_order_id);
				baseVO.setcal_order_detail_seq(cal_order_detail_seq);
				baseVO.setcal_st("N");
				//??????????????? ??????
				baseService.insert_calc(baseVO);
				//??????????????? ???????????? - ????????? ?????????????????? ??????
				//baseService.update_order_calc_st(baseVO);
			}
		}
	}
	
	//=========================================================
	// ????????? ??????????????????
	//=========================================================
	@RequestMapping(value = "/Api/autoProcess.do")
	public void autoProcess(
		@ModelAttribute("BaseVO") BaseVO baseVO,
		@ModelAttribute("AdmgrConfigVO") AdmgrConfigVO admgrConfigVO,
		SessionVO sessionVO,
		ModelMap model, 
		HttpServletRequest request, 
		HttpServletResponse response,
		SessionStatus status
		) throws Exception {
		
		AdmgrConfigVO baseSiteConfig = admgrConfigService.get_base_config(null);
		//???????????????
		String calc_card = baseSiteConfig.getpay_card_calc();
		//??????????????????
		String calc_real = baseSiteConfig.getpay_real_calc();
		//?????????????????????
		String calc_virt= baseSiteConfig.getpay_virt_calc();
		
		//7??? ????????? ??????
		SimpleDateFormat formatdate = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat formatdateh = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date date = new Date();
		Calendar cal = Calendar.getInstance(); 
		
		cal.setTime(date);
		cal.add(Calendar.DATE, -1);
		String chkrevdt = formatdate.format(cal.getTime());
		
		cal.setTime(date);
		cal.add(Calendar.DATE, -7);
		String chkmarketdt = formatdate.format(cal.getTime());
		
		cal.setTime(date);
		cal.add(Calendar.HOUR, -3);
		String cancel_dt3 = formatdateh.format(cal.getTime());
		cal.setTime(date);
		cal.add(Calendar.HOUR, -6);
		String cancel_dt6 = formatdateh.format(cal.getTime());
		cal.setTime(date);
		cal.add(Calendar.HOUR, -9);
		String cancel_dt9 = formatdateh.format(cal.getTime());
		cal.setTime(date);
		cal.add(Calendar.HOUR, -12);
		String cancel_dt12 = formatdateh.format(cal.getTime());
		cal.setTime(date);
		cal.add(Calendar.HOUR, -15);
		String cancel_dt15 = formatdateh.format(cal.getTime());
		cal.setTime(date);
		cal.add(Calendar.HOUR, -18);
		String cancel_dt18 = formatdateh.format(cal.getTime());
		cal.setTime(date);
		cal.add(Calendar.HOUR, -21);
		String cancel_dt21 = formatdateh.format(cal.getTime());
		cal.setTime(date);
		cal.add(Calendar.HOUR, -24);
		String cancel_dt24 = formatdateh.format(cal.getTime());

		//1. ???????????? ??????????????? - ?????? 3???
		baseVO.setorder_pay_time("3");
		baseVO.setcancel_dt(cancel_dt3);
		//baseService.update_auto_cancel_master(baseVO);
		List<BaseVO> cancel_reserve_list3 = baseService.get_auto_cancel_reserve_list(baseVO);
		for(int i=0; i<cancel_reserve_list3.size(); i++) {
			baseVO.setorder_id(cancel_reserve_list3.get(i).getorder_id());
			baseVO.setorder_id(cancel_reserve_list3.get(i).getorder_pay_cd());
			baseVO.setorder_id(cancel_reserve_list3.get(i).getorder_total_price());
			baseService.insert_cancel_recerve(baseVO);
		}

		baseVO.setorder_pay_time("6");
		baseVO.setcancel_dt(cancel_dt6);
		//baseService.update_auto_cancel_master(baseVO);
		List<BaseVO> cancel_reserve_list6 = baseService.get_auto_cancel_reserve_list(baseVO);
		for(int i=0; i<cancel_reserve_list6.size(); i++) {
			baseVO.setorder_id(cancel_reserve_list6.get(i).getorder_id());
			baseVO.setorder_id(cancel_reserve_list6.get(i).getorder_pay_cd());
			baseVO.setorder_id(cancel_reserve_list6.get(i).getorder_total_price());
			baseService.insert_cancel_recerve(baseVO);
		}

		baseVO.setorder_pay_time("9");
		baseVO.setcancel_dt(cancel_dt9);
		//baseService.update_auto_cancel_master(baseVO);
		List<BaseVO> cancel_reserve_list9 = baseService.get_auto_cancel_reserve_list(baseVO);
		for(int i=0; i<cancel_reserve_list9.size(); i++) {
			baseVO.setorder_id(cancel_reserve_list9.get(i).getorder_id());
			baseVO.setorder_id(cancel_reserve_list9.get(i).getorder_pay_cd());
			baseVO.setorder_id(cancel_reserve_list9.get(i).getorder_total_price());
			baseService.insert_cancel_recerve(baseVO);
		}

		baseVO.setorder_pay_time("12");
		baseVO.setcancel_dt(cancel_dt12);
		//baseService.update_auto_cancel_master(baseVO);
		List<BaseVO> cancel_reserve_list12 = baseService.get_auto_cancel_reserve_list(baseVO);
		for(int i=0; i<cancel_reserve_list12.size(); i++) {
			baseVO.setorder_id(cancel_reserve_list12.get(i).getorder_id());
			baseVO.setorder_id(cancel_reserve_list12.get(i).getorder_pay_cd());
			baseVO.setorder_id(cancel_reserve_list12.get(i).getorder_total_price());
			baseService.insert_cancel_recerve(baseVO);
		}

		baseVO.setorder_pay_time("15");
		baseVO.setcancel_dt(cancel_dt15);
		//baseService.update_auto_cancel_master(baseVO);
		List<BaseVO> cancel_reserve_list15 = baseService.get_auto_cancel_reserve_list(baseVO);
		for(int i=0; i<cancel_reserve_list15.size(); i++) {
			baseVO.setorder_id(cancel_reserve_list15.get(i).getorder_id());
			baseVO.setorder_id(cancel_reserve_list15.get(i).getorder_pay_cd());
			baseVO.setorder_id(cancel_reserve_list15.get(i).getorder_total_price());
			baseService.insert_cancel_recerve(baseVO);
		}

		baseVO.setorder_pay_time("18");
		baseVO.setcancel_dt(cancel_dt18);
		//baseService.update_auto_cancel_master(baseVO);
		List<BaseVO> cancel_reserve_list18 = baseService.get_auto_cancel_reserve_list(baseVO);
		for(int i=0; i<cancel_reserve_list18.size(); i++) {
			baseVO.setorder_id(cancel_reserve_list18.get(i).getorder_id());
			baseVO.setorder_id(cancel_reserve_list18.get(i).getorder_pay_cd());
			baseVO.setorder_id(cancel_reserve_list18.get(i).getorder_total_price());
			baseService.insert_cancel_recerve(baseVO);
		}

		baseVO.setorder_pay_time("21");
		baseVO.setcancel_dt(cancel_dt21);
		//baseService.update_auto_cancel_master(baseVO);
		List<BaseVO> cancel_reserve_list21 = baseService.get_auto_cancel_reserve_list(baseVO);
		for(int i=0; i<cancel_reserve_list21.size(); i++) {
			baseVO.setorder_id(cancel_reserve_list21.get(i).getorder_id());
			baseVO.setorder_id(cancel_reserve_list21.get(i).getorder_pay_cd());
			baseVO.setorder_id(cancel_reserve_list21.get(i).getorder_total_price());
			baseService.insert_cancel_recerve(baseVO);
		}

		baseVO.setorder_pay_time("24");
		baseVO.setcancel_dt(cancel_dt24);
		//baseService.update_auto_cancel_master(baseVO);
		List<BaseVO> cancel_reserve_list24 = baseService.get_auto_cancel_reserve_list(baseVO);
		for(int i=0; i<cancel_reserve_list24.size(); i++) {
			baseVO.setorder_id(cancel_reserve_list24.get(i).getorder_id());
			baseVO.setorder_id(cancel_reserve_list24.get(i).getorder_pay_cd());
			baseVO.setorder_id(cancel_reserve_list24.get(i).getorder_total_price());
			baseService.insert_cancel_recerve(baseVO);
		}

		//????????? ????????? ????????? ????????????.
		//baseService.update_auto_cancel_detail(baseVO);
		
		//2-1. ?????????????????? 1?????? ???????????? ???????????? ???????????? ?????? ?????? ???????????? ???????????? ??????????????? ??????????????????.
		// ????????? ?????? ????????????, ????????? ????????? ????????? 1??? ?????? ??????????????? ???????????? ????????????.
		baseVO.setchkdt(chkrevdt);
		baseVO.setod_order_stat("PAYMENT");
		baseVO.setstore_category("CD002001");
		baseService.update_auto_order_end(baseVO);
		baseVO.setstore_category("CD002002");
		baseService.update_auto_order_end(baseVO);
		baseVO.setstore_category("CD002003");
		baseService.update_auto_order_end(baseVO);

		//2-2. ???????????? ?????? 7?????? ???????????? ???????????? ???????????? ?????? ?????? ???????????? ???????????? ??????????????? ??????????????????.
		baseVO.setchkdt(chkmarketdt);
		baseVO.setstore_category("CD002004");
		baseVO.setod_order_stat("TRANSFER");
		baseService.update_auto_order_end(baseVO);
		
		//3. ???????????? ??????
		String cal_order_id = "";
		String cal_order_detail_seq = "";
		String cal_store_category = "";
		String cal_store_id = "";
		String cal_store_user_id = "";
		String cal_prod_category = "";
		String cal_prod_id = "";
		String cal_room_seq = "";
		String cal_room_nm = "";
		String cal_order_pay_st = "";
		String cal_card_adjustment = "";
		String cal_calc_cate1 = "";
		String cal_calc_cate2 = "";
		String cal_calc_cate3 = "";
		String cal_calc_cate4 = "";
		String cal_category_adjustment = "";
		String cal_order_price = "";
		String cal_delivery_price = "";
		String cal_coupon_id = "";
		String cal_coupon_price = "";
		String cal_use_mileage = "";
		String cal_st = "N";
		String cal_order_dt = "";
		String cal_calc_price = "";
		double cal_calc_res = 0;
		
		//?????? ?????? ??????
		SimpleDateFormat todate = new SimpleDateFormat();
		Calendar calen = Calendar.getInstance(); 
		todate.applyPattern("yyyyMMddHHmmss");
		String todayformat = todate.format(calen.getTime()); 
		// ??????????????? ????????? ?????????
		int rankey1 = (int) (Math.random() * 9)+1;
		int rankey2 = (int) (Math.random() * 9)+1;
		int rankey3 = (int) (Math.random() * 9)+1;
		int rankey4 = (int) (Math.random() * 9)+1;
		int rankey5 = (int) (Math.random() * 9)+1;

		//??????????????? ??????
		String cal_id = "CAL"+todayformat+rankey1+rankey2+rankey3+rankey4+rankey5;
		
		List<BaseVO> get_calc_list = baseService.get_calc_target_list(baseVO);
		if(get_calc_list != null) {
			for(int i=0; i<get_calc_list.size(); i++) {
				
				cal_order_id = get_calc_list.get(i).getod_order_id();
				cal_order_detail_seq = get_calc_list.get(i).getod_seq();
				cal_store_category = get_calc_list.get(i).getod_store_category();
				cal_prod_category = get_calc_list.get(i).getod_prod_category();
				cal_prod_id = get_calc_list.get(i).getod_prod_id();
				cal_store_id = get_calc_list.get(i).getod_store_id();
				cal_store_user_id = get_calc_list.get(i).getuser_id();
				cal_room_seq = get_calc_list.get(i).getod_room_seq();
				cal_room_nm = get_calc_list.get(i).getod_room_nm();
				cal_order_pay_st = get_calc_list.get(i).getorder_pay_st();
				switch(cal_order_pay_st) {
					case "C" : cal_card_adjustment = calc_card; break;
					case "R" : cal_card_adjustment = calc_real; break;
					case "V" : cal_card_adjustment = calc_virt; break;
				}
				cal_calc_cate1 = get_calc_list.get(i).getstore_travel_calc_percent();
				cal_calc_cate2 = get_calc_list.get(i).getstore_house_calc_percent();
				cal_calc_cate3 = get_calc_list.get(i).getstore_food_calc_percent();
				cal_calc_cate4 = get_calc_list.get(i).getstore_market_calc_percent();
				switch(cal_store_category) {
					case "CD002001" : cal_category_adjustment = cal_calc_cate1; break;
					case "CD002002" : cal_category_adjustment = cal_calc_cate2; break;
					case "CD002003" : cal_category_adjustment = cal_calc_cate3; break;
					case "CD002004" : cal_category_adjustment = cal_calc_cate4; break;
				}
				cal_order_price = get_calc_list.get(i).getod_prod_total_price();
				cal_delivery_price = get_calc_list.get(i).getorder_total_delivery_price();
				cal_coupon_id = get_calc_list.get(i).getorder_use_coupon_id();
				cal_coupon_price = get_calc_list.get(i).getorder_coupon_price();
				cal_use_mileage = get_calc_list.get(i).getorder_use_mileage();
				cal_order_dt = get_calc_list.get(i).getreg_dt();
				
				cal_calc_res = Double.parseDouble(cal_order_price)*(Double.parseDouble(cal_category_adjustment)/100);
				String[] cal_calc_res_arr = Double.toString(cal_calc_res).split("\\.");
				cal_calc_price = cal_calc_res_arr[0];

				baseVO.setcal_id(cal_id);
				baseVO.setcal_order_id(cal_order_id);
				baseVO.setcal_order_detail_seq(cal_order_detail_seq);
				baseVO.setcal_store_id(cal_store_id);
				baseVO.setcal_store_user_id(cal_store_user_id);
				baseVO.setcal_store_category(cal_store_category);
				baseVO.setcal_prod_category(cal_prod_category);
				baseVO.setcal_prod_id(cal_prod_id);
				baseVO.setcal_room_seq(cal_room_seq);
				baseVO.setcal_room_nm(cal_room_nm);
				baseVO.setcal_order_pay_st(cal_order_pay_st);
				baseVO.setcal_card_adjustment(cal_card_adjustment);	
				baseVO.setcal_category_adjustment(cal_category_adjustment);
				baseVO.setcal_order_price(cal_order_price);
				baseVO.setcal_delivery_price(cal_delivery_price);
				baseVO.setcal_coupon_id(cal_coupon_id);
				baseVO.setcal_coupon_price(cal_coupon_price);
				baseVO.setcal_use_mileage(cal_use_mileage);
				baseVO.setcal_st(cal_st);
				baseVO.setcal_order_dt(cal_order_dt);
				baseVO.setcal_calc_price(cal_calc_price);
				
				// ?????? ????????? ???????????? ????????????.
				int isCalc = baseService.is_calc(baseVO);
				if(isCalc == 0) {
					//??????????????? ??????
					baseService.insert_calc(baseVO);
				}
			}
		}
		
	}
	
	//=========================================================
	// ????????? ?????? ??????????????????
	//=========================================================
	@RequestMapping(value = "/Api/autoCancelProcess.do")
	public String autoCancelProcess(
		@ModelAttribute("BaseVO") BaseVO baseVO,
		@ModelAttribute("AdmgrConfigVO") AdmgrConfigVO admgrConfigVO,
		SessionVO sessionVO,
		ModelMap model, 
		HttpServletRequest request, 
		HttpServletResponse response,
		SessionStatus status
		) throws Exception {
		
		//???????????? ????????????
		model.addAttribute("cancelReserveList", baseService.cancel_reserve_list(baseVO));
		
		return "/baseScmtour/AjaxResult/AjaxAutoCancel";
		
	}
	
	//=========================================================
	// ????????? ?????? ??????????????????
	//=========================================================
	@RequestMapping(value = "/Api/orderCancelDB.do")
	public void orderCancelDB(
		@ModelAttribute("BaseVO") BaseVO baseVO,
		@ModelAttribute("AdmgrConfigVO") AdmgrConfigVO admgrConfigVO,
		SessionVO sessionVO,
		ModelMap model, 
		HttpServletRequest request, 
		HttpServletResponse response,
		SessionStatus status
		) throws Exception {
		
		String order_id = request.getParameter("order_id");
		if(order_id != null && order_id != "") {
			baseVO.setorder_id(order_id);
			//????????? ????????? ????????? ??????
			baseService.update_auto_cancel_master(baseVO);
			//????????? ????????? ?????? ??????
			baseService.update_auto_cancel_detail(baseVO);
		}
		
	}
	
	//=========================================================
	//??????
	//=========================================================
	@RequestMapping(value = "/Api/smst.do")
	public void smst(
		@ModelAttribute("BaseVO") BaseVO baseVO,
		SessionVO sessionVO,
		ModelMap model, 
		HttpServletRequest request, 
		HttpServletResponse response,
		SessionStatus status
		) throws Exception {
		
		//baseVO.setsms_cd("PAYMENT");
		baseVO.setsms_cd("PAYMENT001");
		baseVO.setorder_id("O2020060110311889668");
		baseService.sendSms(baseVO);
	}
	
	//=========================================================
	//??????
	//=========================================================
	@RequestMapping(value = "/Api/sms.do")
	public void sms(
		@ModelAttribute("BaseVO") BaseVO baseVO,
		SessionVO sessionVO,
		ModelMap model, 
		HttpServletRequest request, 
		HttpServletResponse response,
		SessionStatus status
		) throws Exception {
		
		String base_header = "[?????? ?????????] ";
		String sms_cd = "CUSTOM";
		String sms_to_group = request.getParameter("sms_to_group");
		String sms_to_user = request.getParameter("sms_to_user");
		String sms_content = request.getParameter("sms_content");
		String sms_reserve_set = request.getParameter("sms_reserve_set");
		String sms_reserve_dt = null;
		if("set".equals(sms_reserve_set)) {
			String sms_reserve_date = request.getParameter("sms_reserve_date");
			String sms_reserve_time = request.getParameter("sms_reserve_time");
			sms_reserve_dt = sms_reserve_date+" "+sms_reserve_time+":00:00";
		}
		
		BaseVO site_config = baseService.get_base_sms_info(baseVO);
		String sendnum = site_config.getsms_send();

		//?????????????????? ????????? ????????????, ????????? ??????????????????.
		if(sms_to_user != null && sms_to_user != "" && sms_content != null && sms_content != "") {
			//????????????
			baseVO.setuser_id(sms_to_user);
			BaseVO member = baseService.get_sms_member_info(baseVO);
			baseVO.settr_phone(member.getuser_hp());
			baseVO.settr_callback(sendnum);
			baseVO.settr_senddate(sms_reserve_dt);
			baseVO.setsms_target("U");
			baseVO.setsms_type("U");
			if(sms_content.length() > 40) {
				baseVO.settr_subject(base_header);
				baseVO.settr_msg(sms_content);
				baseService.insert_mms(baseVO);
			} else {
				baseVO.settr_msg(base_header+sms_content);
				baseService.insert_sms(baseVO);
			}
			baseService.insert_sms_list(baseVO);
			
		} else {
			//????????????
			if(sms_to_group != null && sms_to_group != "" && sms_content != null && sms_content != "") {
				baseVO.setuser_level(sms_to_group);
				List<BaseVO> group = baseService.get_sms_group_list(baseVO);
				for(int i=0; i<group.size(); i++) {
					baseVO.settr_phone(group.get(i).getuser_hp());
					baseVO.settr_callback(sendnum);
					baseVO.settr_senddate(sms_reserve_dt);
					baseVO.setsms_target("U");
					baseVO.setsms_type("U");
					if(sms_content.length() > 40) {
						baseVO.settr_subject(base_header);
						baseVO.settr_msg(sms_content);
						baseService.insert_mms(baseVO);
					} else {
						baseVO.settr_msg(base_header+sms_content);
						baseService.insert_sms(baseVO);
					}
				}
			}
		}
		//??????
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<script>function locationReplace(url){ if(history.replaceState){ history.replaceState(null, document.title, url); history.go(0); }else{ location.replace(url); } }</script>");
		out.println("<script>alert('SMS??? ?????????????????????.'); locationReplace('/admgr/admgrExtention/sms.do');</script>");
		out.flush();
		
	}
	
	//=========================================================
	// ??????
	//=========================================================
	@RequestMapping(value = "/Api/push.do")
	public void push(
		@ModelAttribute("BaseVO") BaseVO baseVO,
		SessionVO sessionVO,
		ModelMap model, 
		HttpServletRequest request, 
		HttpServletResponse response,
		SessionStatus status
		) throws Exception {
		
		String push_group = request.getParameter("push_group");
		String push_content = request.getParameter("push_content");
		
		baseVO.setuser_level(push_group);
		
		
		BaseVO getUser = baseService.get_sms_member_info(baseVO);
		String mobile_os = getUser.getuser_device_os();
		String mobile_token = getUser.getuser_device_token();
		baseVO.setuser_device_os(mobile_os);
		baseVO.setuser_device_token(mobile_token);
		baseVO.setpush_content(push_content);
		//baseService.sendPush(baseVO);
		
	}
	
	
	//=========================================================
	// test
	//=========================================================
	@RequestMapping(value = "/test.do")
	public String testtest(
		@ModelAttribute("BaseVO") BaseVO baseVO,
		SessionVO sessionVO,
		ModelMap model, 
		HttpServletRequest request, 
		HttpServletResponse response,
		SessionStatus status
		) throws Exception {

		return "/baseScmtour/test";
		
	}
	
}