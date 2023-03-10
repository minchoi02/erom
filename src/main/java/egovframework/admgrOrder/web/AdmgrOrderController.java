package egovframework.admgrOrder.web;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ibm.icu.text.SimpleDateFormat;
import com.ibm.icu.util.Calendar;

import egovframework.admgrConfig.service.AdmgrConfigService;
import egovframework.admgrOrder.service.AdmgrOrderService;
import egovframework.admgrOrder.service.AdmgrOrderVO;
import egovframework.admgrProduct.service.AdmgrProductService;
import egovframework.admgrProduct.service.AdmgrProductVO;
import egovframework.admgrStore.service.AdmgrStoreService;
import egovframework.admgrStore.service.AdmgrStoreVO;
import egovframework.base.service.BaseService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
public class AdmgrOrderController {
	
	@Resource(name = "AdmgrOrderService")
	private AdmgrOrderService admgrOrderService;	
	
	@Resource(name = "BaseService")
	private BaseService baseService;	
	
	@Resource(name = "AdmgrProductService")
	private AdmgrProductService admgrProductService;	
	
	@Resource(name = "AdmgrStoreService")
	private AdmgrStoreService admgrStoreService;	
	
	@Resource(name = "AdmgrConfigService")
	private AdmgrConfigService admgrConfigService;	
	
	//=========================================================
	
	@RequestMapping(value = "/admgr/admgrOrder/orderList.do")
	public String admgrorderList(
		@ModelAttribute("AdmgrOrderVO") AdmgrOrderVO admgrOrderVO, 
		@ModelAttribute("AdmgrProductVO") AdmgrProductVO admgrProductVO, 
		ModelMap model,
		HttpServletRequest request, 
		HttpServletResponse response)
		throws Exception {
		
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
				//admgrProductVO.setuser_id("yhh6315");
				
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

				admgrOrderVO.setuser_level(adminLevel);
				admgrOrderVO.setod_store_id(sql_or);
			}
		
			String store_category = request.getParameter("store_category");
			model.addAttribute("store_category", store_category);
			
			String searchKey = request.getParameter("searchKey");
			model.addAttribute("searchKey", searchKey);
			
			String searchKeyword = request.getParameter("searchKeyword");
			model.addAttribute("searchKeyword", searchKeyword);
			
			String order_stat = request.getParameter("order_stat");
			model.addAttribute("order_stat", order_stat);
		
			
			/** pageing start */
			admgrOrderVO.setPageUnit(10);
			admgrOrderVO.setPageSize(10); 
			PaginationInfo paginationInfo = new PaginationInfo();
			paginationInfo.setCurrentPageNo(admgrOrderVO.getPageIndex());
			paginationInfo.setRecordCountPerPage(admgrOrderVO.getPageUnit());
			paginationInfo.setPageSize(admgrOrderVO.getPageSize());
	
			admgrOrderVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
			admgrOrderVO.setLastIndex(paginationInfo.getLastRecordIndex());
			admgrOrderVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

			admgrOrderVO.setsearchKey(searchKey);
			admgrOrderVO.setsearchKeyword(searchKeyword);
			
			String pay_st = request.getParameter("pay_st");
			model.addAttribute("pay_st", pay_st);
			String order_st = "";
			if(pay_st != null && pay_st != "" ) {
				switch(pay_st) {
					case "1" :  order_st = "READY"; break; 
					case "2" :  order_st = "PAYMENT"; break; 
					case "3" :  order_st = "CANCEL"; break; 
					case "4" :  order_st = "CANCELING"; break; 
					case "5" :  order_st = "TRANSFER"; break; 
					case "6" :  order_st = "COMPLETE"; break; 
				}
				admgrOrderVO.setorder_st(order_st);
			}
			
			SimpleDateFormat formatdate = new SimpleDateFormat ("yyyy-MM-dd");
			Date date = new Date();
			Calendar cal = Calendar.getInstance(); 

			String order_st_dt = request.getParameter("order_st_dt");
			String order_ed_dt = request.getParameter("order_ed_dt");
			if(order_st_dt == null || order_st_dt == "") {
				cal.setTime(date);
				cal.add(Calendar.DATE, -7);
				order_st_dt = formatdate.format(cal.getTime());
			}
			if(order_ed_dt == null || order_ed_dt == "") {
				cal.setTime(date);
				order_ed_dt = formatdate.format(cal.getTime());
			}
			model.addAttribute("order_st_dt", order_st_dt);
			model.addAttribute("order_ed_dt", order_ed_dt);
			admgrOrderVO.setorder_st_dt(order_st_dt+" 00:00:00");
			admgrOrderVO.setorder_ed_dt(order_ed_dt+" 23:59:59");
			
			
			// ???????????? ?????????
			int ListCnt = admgrOrderService.get_order_list_cnt(admgrOrderVO);
			paginationInfo.setTotalRecordCount(ListCnt);
			model.addAttribute("TotalCnt", ListCnt);
			model.addAttribute("paginationInfo", paginationInfo);
			
			// ??????????????? ??????????????? ?????????.
			int StartPageNumber = ListCnt - (admgrOrderVO.getPageUnit() * (admgrOrderVO.getPageIndex()-1)) + 1;
			model.addAttribute("StartPageNumber", StartPageNumber);
			/** paging end **/
			List<AdmgrOrderVO> order_master_list = admgrOrderService.get_order_list(admgrOrderVO);
			model.addAttribute("orderList", order_master_list);
			for(int i=0; i<order_master_list.size(); i++) {
				String od_order_id = order_master_list.get(i).getorder_id();
				admgrOrderVO.setod_order_id(od_order_id);
				model.addAttribute("orderDetailList_"+od_order_id, admgrOrderService.get_order_detail_list(admgrOrderVO));
				model.addAttribute("orderDetailListCnt_"+od_order_id, admgrOrderService.get_order_detail_list_cnt(admgrOrderVO));
			}
			
			return "/admgr/admgrOrder/orderList";
		}
	}

	@RequestMapping(value = "/admgr/admgrOrder/orderCancelingList.do")
	public String admgrorderCanclingList(
		@ModelAttribute("AdmgrOrderVO") AdmgrOrderVO admgrOrderVO, 
		@ModelAttribute("AdmgrProductVO") AdmgrProductVO admgrProductVO, 
		ModelMap model,
		HttpServletRequest request, 
		HttpServletResponse response)
		throws Exception {
		
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
				//admgrProductVO.setuser_id("yhh6315");
				
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

				admgrOrderVO.setuser_level(adminLevel);
				admgrOrderVO.setod_store_id(sql_or);
			}
		
			admgrOrderVO.setorder_st("CANCELING");
			
			List<AdmgrOrderVO> order_cancel_list = admgrOrderService.get_order_cancel_list(admgrOrderVO);
			model.addAttribute("order_cancel_list", order_cancel_list);
			
			return "/admgr/admgrOrder/orderCancelingList";
		}
	}

	@RequestMapping(value = "/admgr/admgrOrder/orderForm.do")
	public String admgrorderForm(
		@ModelAttribute("AdmgrOrderVO") AdmgrOrderVO admgrOrderVO, 
		@ModelAttribute("AdmgrProductVO") AdmgrProductVO admgrProductVO, 
		@ModelAttribute("AdmgrStoreVO") AdmgrStoreVO admgrStoreVO, 
		ModelMap model, 
		HttpServletRequest request, 
		HttpServletResponse response) 
		throws Exception {
		
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
				//admgrProductVO.setuser_id("yhh6315");
				
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

				admgrOrderVO.setuser_level(adminLevel);
				admgrOrderVO.setod_store_id(sql_or);
			}
			
			String pageIndex = request.getParameter("pageIndex");
			if(pageIndex == null || pageIndex =="") {
				pageIndex = "1";
			}
			model.addAttribute("pageIndex", pageIndex);
			
			String order_st_st = request.getParameter("order_st_st");
			model.addAttribute("order_st_st", order_st_st);
			
			String order_ed_st = request.getParameter("order_ed_st");
			model.addAttribute("order_ed_st", order_ed_st);
			
			String searchKey = request.getParameter("searchKey");
			model.addAttribute("searchKey", searchKey);
			
			String searchKeyword = request.getParameter("searchKeyword");
			model.addAttribute("searchKeyword", searchKeyword);
			
			String pay_st = request.getParameter("pay_st");
			model.addAttribute("pay_st", pay_st);
			
			String order_id = request.getParameter("order_id");
			model.addAttribute("order_id", order_id);

			admgrOrderVO.setod_order_id(order_id);
			AdmgrOrderVO order_info = admgrOrderService.get_order_master_info(admgrOrderVO);
			
			if(order_info == null) {
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>alert('??????????????? ???????????? ????????????.'); history.back();</script>");
				out.flush();
				return null;
			}
			model.addAttribute("orderInfo", order_info);
			
			List<AdmgrOrderVO> order_detail_list = admgrOrderService.get_order_detail_list(admgrOrderVO);
			model.addAttribute("orderDetailList", order_detail_list);
			
			//?????????????????? ????????????.
			admgrOrderVO.setorder_st("CANCELING");
			List<AdmgrOrderVO> order_cancel_list = admgrOrderService.get_order_cancel_list(admgrOrderVO);
			model.addAttribute("order_cancel_list", order_cancel_list);
			
			return "/admgr/admgrOrder/orderForm";
		}
	}

	//---------------------------------------------------------------

	@RequestMapping(value = "/admgr/admgrOrder/orderFormSave.do")
	public void admgrorderFormSave(
			@ModelAttribute("AdmgrOrderVO") AdmgrOrderVO admgrOrderVO, 
			ModelMap model, 
			HttpServletRequest request, 
			HttpServletResponse response) 
					throws Exception {
		
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
			
			//?????? ?????? ??????
			SimpleDateFormat todayformat = new SimpleDateFormat();
			Calendar cal = Calendar.getInstance(); 
			todayformat.applyPattern("yyyy-MM-dd");
			String today = todayformat.format(cal.getTime()); 
			
			String pageIndex = request.getParameter("pageIndex");
			if(pageIndex == null || pageIndex =="") {
				pageIndex = "1";
			}
			model.addAttribute("pageIndex", pageIndex);
			
			String order_st_dt = request.getParameter("order_st_dt");
			model.addAttribute("order_st_dt", order_st_dt);
			
			String order_ed_dt = request.getParameter("order_ed_dt");
			model.addAttribute("order_ed_dt", order_ed_dt);
			
			String searchKey = request.getParameter("searchKey");
			model.addAttribute("searchKey", searchKey);
			
			String searchKeyword = request.getParameter("searchKeyword");
			model.addAttribute("searchKeyword", searchKeyword);
			
			String order_pay_date = request.getParameter("order_pay_date");
			model.addAttribute("order_pay_date", order_pay_date);
			
			String pay_st = request.getParameter("pay_st");
			model.addAttribute("pay_st", pay_st);
			
			String order_id = request.getParameter("order_id");
			
			String order_memo = request.getParameter("order_memo");
			String order_st = request.getParameter("order_st");
			
			String[] od_seq = request.getParameterValues("od_seq");
			String[] od_stat = request.getParameterValues("od_stat");
			String[] od_order_stat = request.getParameterValues("od_order_stat");
			String[] od_delivery_company_id = request.getParameterValues("od_delivery_company_id");
			String[] od_delivery_number = request.getParameterValues("od_delivery_number");
			
			String order_cancel_date = null;
			if(("CANCEL").equals(order_st)) {
				order_cancel_date = today;
				//????????? ?????????...
				
			}
			
			if(adminLevel.equals("5")) {
				admgrOrderVO.setuser_level("5");
			}
			
			//??????????????? ?????????????????? ?????????.
			admgrOrderVO.setorder_id(order_id);
			admgrOrderVO.setorder_pay_date(order_pay_date);
			admgrOrderVO.setorder_cancel_date(order_cancel_date);
			//admgrOrderVO.setorder_st(order_st);
			admgrOrderVO.setorder_memo(order_memo);
			admgrOrderService.update_order_master(admgrOrderVO);
			/*
			System.out.println("==================");
			System.out.println(od_seq.length);
			System.out.println("==================");
			System.out.println("==================");
			System.out.println(od_stat.length);
			System.out.println("==================");
			System.out.println("==================");
			System.out.println(od_order_stat.length);
			System.out.println("==================");
			System.out.println("==================");
			System.out.println(od_delivery_company_id.length);
			System.out.println("==================");
			System.out.println("==================");
			System.out.println(od_delivery_number.length);
			System.out.println("==================");
			*/
			String od_seq_val = ""; 
			String od_stat_val = ""; 
			String od_order_stat_val = ""; 
			String od_delivery_company_id_val = ""; 
			String od_delivery_number_val = ""; 
			
			for(int i=0; i< od_seq.length; i++) {
				od_seq_val = ""; 
				od_stat_val = ""; 
				od_order_stat_val = ""; 
				od_delivery_company_id_val = ""; 
				od_delivery_number_val = ""; 
				//if(od_seq[i] != null && od_seq[i] != "") {
				if(!"".equals(od_seq[i])) {
					od_seq_val = od_seq[i];
				}
				//if(od_stat[i] != null && od_stat[i] != "") {
				if(!"".equals(od_stat[i])) {
					od_stat_val = od_stat[i];
				}
				//if(od_order_stat[i] != null && od_order_stat[i] != "") {
				if(!"".equals(od_order_stat[i])) {
					od_order_stat_val = od_order_stat[i];
				}
				//if(od_delivery_company_id[i] != null && od_delivery_company_id[i] != "") {
				if(!"".equals(od_delivery_company_id[i])) {
					od_delivery_company_id_val = od_delivery_company_id[i];
				}
				//if(od_delivery_number[i] != null && od_delivery_number[i] != "") {
				if(!"".equals(od_delivery_number[i])) {
					od_delivery_number_val = od_delivery_number[i];
				}
				admgrOrderVO.setod_seq(od_seq_val);
				admgrOrderVO.setod_stat(od_stat_val);
				admgrOrderVO.setod_order_stat(od_order_stat_val);
				admgrOrderVO.setod_delivery_company_id(od_delivery_company_id_val);
				admgrOrderVO.setod_delivery_number(od_delivery_number_val);
				admgrOrderService.update_order_detail(admgrOrderVO);
			}


			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('?????????????????????.'); location.replace('/admgr/admgrOrder/orderForm.do?pageIndex="+pageIndex+"&order_st_dt="+order_st_dt+"&order_ed_dt="+order_ed_dt+"&searchKey="+searchKey+"&searchKeyword="+searchKeyword+"&order_id="+order_id+"'); </script>");
			out.flush();
			return;
		}
	}
	
	//---------------------------------------------------------------
	
	@RequestMapping(value = "/admgr/admgrOrder/orderCancelPG.do")
	public String admgorderCancelPG(
		@ModelAttribute("AdmgrOrderVO") AdmgrOrderVO admgrOrderVO, 
		ModelMap model, 
		HttpServletRequest request, 
		HttpServletResponse response) 
		throws Exception {
		
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
			
			String cprice = request.getParameter("cprice");
			String tid = request.getParameter("autnNum");
			String mid = "sctong";
			
			model.addAttribute("cprice", cprice);
			model.addAttribute("tid", tid);
			model.addAttribute("mid", mid);
			
			return "/admgr/admgrOrder/orderCancel";
			
		}
	}
	
	//---------------------------------------------------------------
	
	@RequestMapping(value = "/admgr/admgrOrder/orderCancelPGAuto.do")
	public String admgorderCancelPGAuto(
		@ModelAttribute("AdmgrOrderVO") AdmgrOrderVO admgrOrderVO, 
		ModelMap model, 
		HttpServletRequest request, 
		HttpServletResponse response) 
		throws Exception {
		
		String cprice = request.getParameter("cprice");
		String tid = request.getParameter("autnNum");
		String mid = "sctong";
		
		model.addAttribute("cprice", cprice);
		model.addAttribute("tid", tid);
		model.addAttribute("mid", mid);
			
		return "/admgr/admgrOrder/orderCancel";
			
	}
	
	//---------------------------------------------------------------
	

}
