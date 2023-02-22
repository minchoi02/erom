package egovframework.admgrSystem.web;
import java.io.PrintWriter;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.admgrSystem.service.AdmgrSystemService;
import egovframework.admgrSystem.service.AdmgrSystemVO;

@Controller
public class AdmgrSystemController {
	
	@Resource(name = "AdmgrSystemService")
	private AdmgrSystemService admgrSystemService;	
		
	//=========================================================
	
	//===============================================================================================================
	// * 코드관리 
	//===============================================================================================================
	@RequestMapping(value = "/admgr/admgrSystem/cdSetting.do")
	public String admgrcdSetting(
			@ModelAttribute("admgrSystemVO") AdmgrSystemVO admgrSystemVO, 
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
			
			//메인카티고리
			admgrSystemVO.setbase_gp_cd("GP001");
			model.addAttribute("gp001List", admgrSystemService.get_cd_list(admgrSystemVO));
			
			//admgrSystemVO.setbase_gp_cd("GP002");
			//model.addAttribute("gp002List", admgrSystemService.get_cd_list(admgrSystemVO));
			
			admgrSystemVO.setbase_gp_cd("GP003");
			model.addAttribute("gp003List", admgrSystemService.get_cd_list(admgrSystemVO));
			
			//admgrSystemVO.setbase_gp_cd("GP004");
			//model.addAttribute("gp004List", admgrSystemService.get_cd_list(admgrSystemVO));
			
			//admgrSystemVO.setbase_gp_cd("GP005");
			//model.addAttribute("gp005List", admgrSystemService.get_cd_list(admgrSystemVO));
			
			
			return "/admgr/admgrSystem/cdSetting";
		}
	}
	
	//===============================================================================================================
	// * 코드관리 
	//===============================================================================================================
	@RequestMapping(value = "/admgr/admgrSystem/cdSettingAction.do")
	public void admgrcdSettingAction(
			@ModelAttribute("admgrSystemVO") AdmgrSystemVO admgrSystemVO, 
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
			
			String base_cd = request.getParameter("base_cd");
			String base_cd_nm = request.getParameter("base_cd_nm");
			String base_api_cd  = request.getParameter("base_api_cd");
			String base_use_st  = request.getParameter("base_use_st");
			
			admgrSystemVO.setbase_cd(base_cd);
			admgrSystemVO.setbase_cd_nm(base_cd_nm);
			admgrSystemVO.setbase_api_cd(base_api_cd);
			admgrSystemVO.setbase_use_st(base_use_st);
			admgrSystemService.update_cd(admgrSystemVO);
			
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('처리되었습니다.'); location.replace('/admgr/admgrSystem/cdSetting.do'); </script>");
			out.flush();
			return;
			
		}
	}
	
	//===============================================================================================================
	// * 코드그룹관리 
	//===============================================================================================================
	@RequestMapping(value = "/admgr/admgrSystem/gpSetting.do")
	public String admgrgpSetting(
			@ModelAttribute("admgrSystemVO") AdmgrSystemVO admgrSystemVO, 
			ModelMap model, 
			HttpServletRequest request, 
			HttpServletResponse response
		) throws Exception {
		
		return "/admgr/admgrSystem/gpSetting";
	}

	//===============================================================================================================
	// * SMS 템플릿 
	//===============================================================================================================
	@RequestMapping(value = "/admgr/admgrSystem/smsTemplate.do")
	public String admgrsmsTemplate(
			@ModelAttribute("admgrSystemVO") AdmgrSystemVO admgrSystemVO, 
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
			
			//미결제주문
			admgrSystemVO.setsms_cd("ORDER");
			model.addAttribute("smsListOrder", admgrSystemService.get_sms_templete(admgrSystemVO));
			//결제완료
			admgrSystemVO.setsms_cd("PAYMENT");
			model.addAttribute("smsListPayment", admgrSystemService.get_sms_templete(admgrSystemVO));
			//주문취소
			admgrSystemVO.setsms_cd("CANCEL");
			model.addAttribute("smsListCancel", admgrSystemService.get_sms_templete(admgrSystemVO));
			//미결제 자동주문취소
			admgrSystemVO.setsms_cd("CANCELAUTO");
			model.addAttribute("smsListCancelAuto", admgrSystemService.get_sms_templete(admgrSystemVO));
			//배송시작
			admgrSystemVO.setsms_cd("DELIVERY_START");
			model.addAttribute("smsListDeliveryStart", admgrSystemService.get_sms_templete(admgrSystemVO));
			//QnA 등록
			admgrSystemVO.setsms_cd("QNAADD");
			model.addAttribute("smsListQnaAdd", admgrSystemService.get_sms_templete(admgrSystemVO));
			//QnA 답변등록
			admgrSystemVO.setsms_cd("QNAREPLY");
			model.addAttribute("smsListQnaReply", admgrSystemService.get_sms_templete(admgrSystemVO));
			//QnA 답변수정
			admgrSystemVO.setsms_cd("QNAREPLYMODIFY");
			model.addAttribute("smsListQnaReplyModify", admgrSystemService.get_sms_templete(admgrSystemVO));
			//1:1 문의등록
			admgrSystemVO.setsms_cd("MTMADD");
			model.addAttribute("smsListMtmAdd", admgrSystemService.get_sms_templete(admgrSystemVO));
			//1:1 문의답변등록
			admgrSystemVO.setsms_cd("MTMREPLY");
			model.addAttribute("smsListMtmReply", admgrSystemService.get_sms_templete(admgrSystemVO));
			//1:1 문의답변수정
			admgrSystemVO.setsms_cd("MTMREPLYMODIFY");
			model.addAttribute("smsListMtmReplyModify", admgrSystemService.get_sms_templete(admgrSystemVO));
			//결제안내 - 미결제
			admgrSystemVO.setsms_cd("PAYMENTNEED");
			model.addAttribute("smsListPaymentNeed", admgrSystemService.get_sms_templete(admgrSystemVO));
			//예약안내 - 1일전
			admgrSystemVO.setsms_cd("RESERVEINFO");
			model.addAttribute("smsListReserveInfo", admgrSystemService.get_sms_templete(admgrSystemVO));
	
			//결제완료시 상점통보용
			admgrSystemVO.setsms_cd("PAYMENT001");
			model.addAttribute("smsListPayment001", admgrSystemService.get_sms_templete(admgrSystemVO));
			//결제완료시 상점통보용
			admgrSystemVO.setsms_cd("PAYMENT002");
			model.addAttribute("smsListPayment002", admgrSystemService.get_sms_templete(admgrSystemVO));
			//결제완료시 상점통보용
			admgrSystemVO.setsms_cd("PAYMENT003");
			model.addAttribute("smsListPayment003", admgrSystemService.get_sms_templete(admgrSystemVO));
			//결제완료시 상점통보용
			admgrSystemVO.setsms_cd("PAYMENT004");
			model.addAttribute("smsListPayment004", admgrSystemService.get_sms_templete(admgrSystemVO));
			//취소시 상점통보용
			admgrSystemVO.setsms_cd("CANCEL001");
			model.addAttribute("smsListCancel001", admgrSystemService.get_sms_templete(admgrSystemVO));
			//취소시 상점통보용
			admgrSystemVO.setsms_cd("CANCEL002");
			model.addAttribute("smsListCancel002", admgrSystemService.get_sms_templete(admgrSystemVO));
			//취소시 상점통보용
			admgrSystemVO.setsms_cd("CANCEL003");
			model.addAttribute("smsListCancel003", admgrSystemService.get_sms_templete(admgrSystemVO));
			//취소시 상점통보용
			admgrSystemVO.setsms_cd("CANCEL004");
			model.addAttribute("smsListCancel004", admgrSystemService.get_sms_templete(admgrSystemVO));
			
			return "/admgr/admgrSystem/smsTemplate";
		}
	}

	//===============================================================================================================
	// * 문자 템플릿 수정 
	//===============================================================================================================
	@RequestMapping(value = "/admgr/admgrSystem/smsTemplateAction.do")
	public void admgrsmsTemplateAction(
			@ModelAttribute("admgrSystemVO") AdmgrSystemVO admgrSystemVO, 
			ModelMap model, 
			HttpServletRequest request, 
			HttpServletResponse response
		) throws Exception {
	
		String sms_cd = request.getParameter("sms_cd");
		String sms_use_user = request.getParameter("sms_use_user");
		String sms_use_store = request.getParameter("sms_use_store");
		String sms_use_center = request.getParameter("sms_use_center");
		String sms_content_user = request.getParameter("sms_content_user");
		String sms_content_store = request.getParameter("sms_content_store");
		String sms_content_center = request.getParameter("sms_content_center");
		
		if(sms_use_user == null || sms_use_user =="") {
			sms_use_user = "N";
		}
		if(sms_use_store == null || sms_use_store =="") {
			sms_use_store = "N";
		}
		if(sms_use_center == null || sms_use_center =="") {
			sms_use_center = "N";
		}
		
		admgrSystemVO.setsms_cd(sms_cd);
		admgrSystemVO.setsms_use_user(sms_use_user);
		admgrSystemVO.setsms_use_store(sms_use_store);
		admgrSystemVO.setsms_use_center(sms_use_center);
		admgrSystemVO.setsms_content_user(sms_content_user);
		admgrSystemVO.setsms_content_store(sms_content_store);
		admgrSystemVO.setsms_content_center(sms_content_center);
		
		admgrSystemService.set_sms_templete(admgrSystemVO);
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<script>alert('수정되었습니다.'); location.replace('/admgr/admgrSystem/smsTemplate.do'); </script>");
		out.flush();
		return;
	}
	
	//===============================================================================================================
	// * 메일 템플릿 
	//===============================================================================================================
	@RequestMapping(value = "/admgr/admgrSystem/mailTemplate.do")
	public String admgrmailTemplate(
			@ModelAttribute("admgrSystemVO") AdmgrSystemVO admgrSystemVO, 
			ModelMap model, 
			HttpServletRequest request, 
			HttpServletResponse response
		) throws Exception {
		
		return "/admgr/admgrSystem/mailTemplate";
	}

	//===============================================================================================================
	// * PUSH 템플릿 
	//===============================================================================================================
	@RequestMapping(value = "/admgr/admgrSystem/pushTemplate.do")
	public String admgrpushTemplate(
			@ModelAttribute("admgrSystemVO") AdmgrSystemVO admgrSystemVO, 
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
			
			//미결제주문
			admgrSystemVO.setpush_cd("ORDER");
			model.addAttribute("pushListOrder", admgrSystemService.get_push_templete(admgrSystemVO));
			//결제완료
			admgrSystemVO.setpush_cd("PAYMENT");
			model.addAttribute("pushListPayment", admgrSystemService.get_push_templete(admgrSystemVO));
			//주문취소
			admgrSystemVO.setpush_cd("CANCEL");
			model.addAttribute("pushListCancel", admgrSystemService.get_push_templete(admgrSystemVO));
			//미결제 자동주문취소
			admgrSystemVO.setpush_cd("CANCELAUTO");
			model.addAttribute("pushListCancelAuto", admgrSystemService.get_push_templete(admgrSystemVO));
			//배송시작
			admgrSystemVO.setpush_cd("DELIVERY_START");
			model.addAttribute("pushListDeliveryStart", admgrSystemService.get_push_templete(admgrSystemVO));
			//QnA 등록
			admgrSystemVO.setpush_cd("QNAADD");
			model.addAttribute("pushListQnaAdd", admgrSystemService.get_push_templete(admgrSystemVO));
			//QnA 답변등록
			admgrSystemVO.setpush_cd("QNAREPLY");
			model.addAttribute("pushListQnaReply", admgrSystemService.get_push_templete(admgrSystemVO));
			//QnA 답변수정
			admgrSystemVO.setpush_cd("QNAREPLYMODIFY");
			model.addAttribute("pushListQnaReplyModify", admgrSystemService.get_push_templete(admgrSystemVO));
			//1:1 문의등록
			admgrSystemVO.setpush_cd("MTMADD");
			model.addAttribute("pushListMtmAdd", admgrSystemService.get_push_templete(admgrSystemVO));
			//1:1 문의답변등록
			admgrSystemVO.setpush_cd("MTMREPLY");
			model.addAttribute("pushListMtmReply", admgrSystemService.get_push_templete(admgrSystemVO));
			//1:1 문의답변수정
			admgrSystemVO.setpush_cd("MTMREPLYMODIFY");
			model.addAttribute("pushListMtmReplyModify", admgrSystemService.get_push_templete(admgrSystemVO));
			//결제안내 - 미결제
			admgrSystemVO.setpush_cd("PAYMENTNEED");
			model.addAttribute("pushListPaymentNeed", admgrSystemService.get_push_templete(admgrSystemVO));
			//예약안내 - 1일전
			admgrSystemVO.setpush_cd("RESERVEINFO");
			model.addAttribute("pushListReserveInfo", admgrSystemService.get_push_templete(admgrSystemVO));
	
			//결제완료시 상점통보용
			admgrSystemVO.setpush_cd("PAYMENT001");
			model.addAttribute("pushListPayment001", admgrSystemService.get_push_templete(admgrSystemVO));
			//결제완료시 상점통보용
			admgrSystemVO.setpush_cd("PAYMENT002");
			model.addAttribute("pushListPayment002", admgrSystemService.get_push_templete(admgrSystemVO));
			//결제완료시 상점통보용
			admgrSystemVO.setpush_cd("PAYMENT003");
			model.addAttribute("pushListPayment003", admgrSystemService.get_push_templete(admgrSystemVO));
			//결제완료시 상점통보용
			admgrSystemVO.setpush_cd("PAYMENT004");
			model.addAttribute("pushListPayment004", admgrSystemService.get_push_templete(admgrSystemVO));
			//취소시 상점통보용
			admgrSystemVO.setpush_cd("CANCEL001");
			model.addAttribute("pushListCancel001", admgrSystemService.get_push_templete(admgrSystemVO));
			//취소시 상점통보용
			admgrSystemVO.setpush_cd("CANCEL002");
			model.addAttribute("pushListCancel002", admgrSystemService.get_push_templete(admgrSystemVO));
			//취소시 상점통보용
			admgrSystemVO.setpush_cd("CANCEL003");
			model.addAttribute("pushListCancel003", admgrSystemService.get_push_templete(admgrSystemVO));
			//취소시 상점통보용
			admgrSystemVO.setpush_cd("CANCEL004");
			model.addAttribute("pushListCancel004", admgrSystemService.get_push_templete(admgrSystemVO));		
			
			return "/admgr/admgrSystem/pushTemplate";
		}
	}
	//===============================================================================================================
	// * 푸쉬 템플릿 수정 
	//===============================================================================================================
	@RequestMapping(value = "/admgr/admgrSystem/pushTemplateAction.do")
	public void admgrpushTemplateAction(
			@ModelAttribute("admgrSystemVO") AdmgrSystemVO admgrSystemVO, 
			ModelMap model, 
			HttpServletRequest request, 
			HttpServletResponse response
		) throws Exception {
		
		String push_cd = request.getParameter("push_cd");
		String push_use_user = request.getParameter("push_use_user");
		String push_use_store = request.getParameter("push_use_store");
		String push_use_center = request.getParameter("push_use_center");
		String push_content_user = request.getParameter("push_content_user");
		String push_content_store = request.getParameter("push_content_store");
		String push_content_center = request.getParameter("push_content_center");
		
		if(push_use_user == null || push_use_user =="") {
			push_use_user = "N";
		}
		if(push_use_store == null || push_use_store =="") {
			push_use_store = "N";
		}
		if(push_use_center == null || push_use_center =="") {
			push_use_center = "N";
		}
		
		admgrSystemVO.setpush_cd(push_cd);
		admgrSystemVO.setpush_use_user(push_use_user);
		admgrSystemVO.setpush_use_store(push_use_store);
		admgrSystemVO.setpush_use_center(push_use_center);
		admgrSystemVO.setpush_content_user(push_content_user);
		admgrSystemVO.setpush_content_store(push_content_store);
		admgrSystemVO.setpush_content_center(push_content_center);
		
		admgrSystemService.set_push_templete(admgrSystemVO);
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<script>alert('수정되었습니다.'); location.replace('/admgr/admgrSystem/pushTemplate.do'); </script>");
		out.flush();
		return;
		
	}

}