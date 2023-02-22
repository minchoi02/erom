package egovframework.admgrMain.web;
import java.io.PrintWriter;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.admgrMain.service.AdmgrMainService;
import egovframework.admgrMain.service.AdmgrMainVO;

@Controller
public class AdmgrMainController {

	@Resource(name = "AdmgrMainService")
	private AdmgrMainService admgrMainService;	
	
	//=========================================================

	@RequestMapping(value = "/admgr/index.do")
	public String admgr(@ModelAttribute("admgrMainVO") AdmgrMainVO admgrMainVO, ModelMap model, HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		//------------------------------------------------------------------------------------------------------------------------------
		// 세션체크한다. - 로그인페이지용
		HttpSession session = request.getSession(true);
		String adminId = (String) session.getAttribute("adminId");
		String adminLevel = (String) session.getAttribute("adminLevel");
				
		if(adminId == null || adminId == "" ) {
			return "redirect:/admgr/login.do";
		} else {
			return "redirect:/admgr/admgrMain.do";
		}
		//------------------------------------------------------------------------------------------------------------------------------		
	}

	@RequestMapping(value = "/admgr/admgrMain.do")
	public String admgrMain(
			@ModelAttribute("admgrMainVO") AdmgrMainVO admgrMainVO, 
			ModelMap model, 
			HttpServletRequest request, 
			HttpServletResponse response
		) throws Exception {
		
		//------------------------------------------------------------------------------------------------------------------------------
		// 세션체크한다. - 로그인페이지용
		HttpSession session = request.getSession(true);
		String adminId = (String) session.getAttribute("adminId");
		String adminLevel = (String) session.getAttribute("adminLevel");
		
		if(adminId == null || adminId == "" ) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('관리자 로그인이 필요합니다.'); location.href='/admgr/login.do';</script>");
			out.flush();
			return null;
		} else {
			//5개 가져오기
			int list_cnt = 5;
			admgrMainVO.setlist_cnt(list_cnt);
			if(adminLevel.equals("5")) {
				admgrMainVO.setstore_id(adminId);
			}
			
			// 신규회원목록
			if(!adminLevel.equals("5")) {
			model.addAttribute("mainMemberList", admgrMainService.get_main_member_list(admgrMainVO));
			}
			
			// 최근주문
			model.addAttribute("mainOrderList", admgrMainService.get_main_order_list(admgrMainVO));
			
			// 최근상품 QnA
			admgrMainVO.setbbs_id("qna");
			model.addAttribute("mainQnaList", admgrMainService.get_main_bbs_list(admgrMainVO));
			
			// 최근 1:1문의
			if(!adminLevel.equals("5")) {
			admgrMainVO.setbbs_id("mtm");
			model.addAttribute("mainMtmList", admgrMainService.get_main_bbs_list(admgrMainVO));
			}
		
			// 최근상품
			model.addAttribute("mainProductList", admgrMainService.get_main_product_list(admgrMainVO));
			
			// 최근상점
			model.addAttribute("mainStoreList", admgrMainService.get_main_store_list(admgrMainVO));

			return "/admgr/admgrMain";
		}
		//------------------------------------------------------------------------------------------------------------------------------
		
	}

}
