package egovframework.admgrStatistics.web;
import java.io.PrintWriter;
import java.util.Date;

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

import egovframework.admgrStatistics.service.AdmgrStatisticsService;
import egovframework.admgrStatistics.service.AdmgrStatisticsVO;
import egovframework.admgrStore.service.AdmgrStoreVO;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
public class AdmgrStatisticsController {
	
	@Resource(name = "AdmgrStatisticsService")
	private AdmgrStatisticsService admgrStatisticsService;
	
	@RequestMapping(value = "/admgr/admgrStatistics/keywordList.do")
	public String admgrkeywordList(
		@ModelAttribute("admgrStatisticsVO") AdmgrStatisticsVO admgrStatisticsVO,
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
			
			String search_ym = request.getParameter("search_ym");
			if(search_ym == null || search_ym == "") {
				
				//이번년 얻기
				SimpleDateFormat formatdatey = new SimpleDateFormat("yyyy");
				Date datey = new Date();
				Calendar caly = Calendar.getInstance(); 
				caly.setTime(datey);
				String thisY= formatdatey.format(caly.getTime());
				model.addAttribute("thisY", thisY);
				
				//이번년 얻기
				SimpleDateFormat formatdateym = new SimpleDateFormat("yyyy-MM");
				Date dateym = new Date();
				Calendar calym = Calendar.getInstance(); 
				calym.setTime(dateym);
				String thisYm = formatdateym.format(calym.getTime());
				model.addAttribute("thisYm", thisYm);
				search_ym = thisYm;
				model.addAttribute("search_ym", search_ym);
				
			} else {
				String[] ym_arr = search_ym.split("-");
				model.addAttribute("thisY", ym_arr[0]);
				model.addAttribute("thisYm", search_ym);
			}
			
			/** pageing start */
			admgrStatisticsVO.setPageUnit(15);
			admgrStatisticsVO.setPageSize(10); 
			PaginationInfo paginationInfo = new PaginationInfo();
			paginationInfo.setCurrentPageNo(admgrStatisticsVO.getPageIndex());
			paginationInfo.setRecordCountPerPage(admgrStatisticsVO.getPageUnit());
			paginationInfo.setPageSize(admgrStatisticsVO.getPageSize());
	
			admgrStatisticsVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
			admgrStatisticsVO.setLastIndex(paginationInfo.getLastRecordIndex());
			admgrStatisticsVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
			
			// 전체갯수 구하기
			admgrStatisticsVO.setreg_dt(search_ym);
			int ListCnt = admgrStatisticsService.get_keywords_list_cnt(admgrStatisticsVO);
			paginationInfo.setTotalRecordCount(ListCnt);
			model.addAttribute("TotalCnt", ListCnt);
			model.addAttribute("paginationInfo", paginationInfo);
			
			// 해당페이지 시작번호를 구한다.
			int StartPageNumber = ListCnt - (admgrStatisticsVO.getPageUnit() * (admgrStatisticsVO.getPageIndex()-1)) + 1;
			model.addAttribute("StartPageNumber", StartPageNumber);
			
			model.addAttribute("keywordsList", admgrStatisticsService.get_keywords_list(admgrStatisticsVO));
			/** paging end **/
			
			return "/admgr/admgrStatistics/keywordList";
			
		}
	}

	@RequestMapping(value = "/admgr/admgrStatistics/connection.do")
	public String admgrconnection(
		@ModelAttribute("admgrStatisticsVO") AdmgrStatisticsVO admgrStatisticsVO,
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
			
			String search_ym = request.getParameter("search_ym");
			String thisY = "0";
			String thisM = "0";
			if(search_ym == null || search_ym == "") {
				
				//이번년 얻기
				SimpleDateFormat formatdatey = new SimpleDateFormat("yyyy");
				Date datey = new Date();
				Calendar caly = Calendar.getInstance(); 
				caly.setTime(datey);
				thisY= formatdatey.format(caly.getTime());
				model.addAttribute("thisY", thisY);
				
				//이번년 얻기
				SimpleDateFormat formatdateym = new SimpleDateFormat("yyyy-MM");
				Date dateym = new Date();
				Calendar calym = Calendar.getInstance(); 
				calym.setTime(dateym);
				String thisYm = formatdateym.format(calym.getTime());
				model.addAttribute("thisYm", thisYm);
				search_ym = thisYm;
				model.addAttribute("search_ym", search_ym);
				String[] ym_arr = search_ym.split("-");
				thisM = ym_arr[1];				
				
			} else {
				String[] ym_arr = search_ym.split("-");
				thisY = ym_arr[0];
				thisM = ym_arr[1];
				model.addAttribute("thisY", ym_arr[0]);
				model.addAttribute("thisYm", search_ym);
			}
			
			//마지막날짜 구하기
			SimpleDateFormat formatdateymd = new SimpleDateFormat("yyyy-MM-dd");
			Calendar calymd = Calendar.getInstance();
			calymd.set(Integer.parseInt(thisY), Integer.parseInt(thisM)-1, 1);
			int lastday = calymd.getActualMaximum(Calendar.DAY_OF_MONTH);
			model.addAttribute("lastday", Integer.toString(lastday));
			
			// 데이터를 뽑아보자
			int StartYear = 2020;
			int yearCnt = Integer.parseInt(thisY) - StartYear + 1;
			model.addAttribute("yearCnt", yearCnt);
			
			//년도별 데이터
			for(int i=2020; i<=2030; i++) {
				String year = Integer.toString(i);
				admgrStatisticsVO.setreg_dt(year);
				int get_cnt = admgrStatisticsService.get_conn_cnt(admgrStatisticsVO);
				model.addAttribute("Cnt"+year, get_cnt);
			}
			
			//월별데이터
			for(int i = 1; i<= 12; i++) {
				String month = Integer.toString(i);
				if(month.length() == 1) {
					month = "0"+month;
				}
				String setym = thisY+"-"+month;
				admgrStatisticsVO.setreg_dt(setym);
				int get_cnt = admgrStatisticsService.get_conn_cnt(admgrStatisticsVO);
				model.addAttribute("Cnt"+month, get_cnt);
				
			}
			
			//일별데이터
			for(int i = 1; i<= lastday; i++) {
				String month = Integer.toString(i);
				if(month.length() == 1) {
					month = "0"+month;
				}
				String day = Integer.toString(i);
				if(day.length() == 1) {
					day = "0"+day;
				}
				String setymd = thisY+"-"+thisM+"-"+day;
				admgrStatisticsVO.setreg_dt(setymd);
				int get_cnt = admgrStatisticsService.get_conn_cnt(admgrStatisticsVO);
				model.addAttribute("CntD"+day, get_cnt);
				
			}
			
			return "/admgr/admgrStatistics/connection";
		}
	}

	@RequestMapping(value = "/admgr/admgrStatistics/statistics.do")
	public String admgrstatistics(
		@ModelAttribute("admgrStatisticsVO") AdmgrStatisticsVO admgrStatisticsVO,
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
			
			String search_ym = request.getParameter("search_ym");
			if(search_ym == null || search_ym == "") {
				
				//이번년 얻기
				SimpleDateFormat formatdatey = new SimpleDateFormat("yyyy");
				Date datey = new Date();
				Calendar caly = Calendar.getInstance(); 
				caly.setTime(datey);
				String thisY= formatdatey.format(caly.getTime());
				model.addAttribute("thisY", thisY);
				
				//이번년 얻기
				SimpleDateFormat formatdateym = new SimpleDateFormat("yyyy-MM");
				Date dateym = new Date();
				Calendar calym = Calendar.getInstance(); 
				calym.setTime(dateym);
				String thisYm = formatdateym.format(calym.getTime());
				model.addAttribute("thisYm", thisYm);
				search_ym = thisYm;
				model.addAttribute("search_ym", search_ym);
				
			} else {
				String[] ym_arr = search_ym.split("-");
				model.addAttribute("thisY", ym_arr[0]);
				model.addAttribute("thisYm", search_ym);
			}
			
			admgrStatisticsVO.setreg_dt(search_ym);
			int ListCnt = admgrStatisticsService.get_sale_all_cnt(admgrStatisticsVO);
			
			admgrStatisticsVO.setod_store_category("CD002001");
			int ListCnt1 = admgrStatisticsService.get_sale_category_cnt(admgrStatisticsVO);
			model.addAttribute("ListCnt1", ListCnt1);
			
			admgrStatisticsVO.setod_store_category("CD002002");
			int ListCnt2 = admgrStatisticsService.get_sale_category_cnt(admgrStatisticsVO);			
			model.addAttribute("ListCnt2", ListCnt2);
			
			admgrStatisticsVO.setod_store_category("CD002003");
			int ListCnt3 = admgrStatisticsService.get_sale_category_cnt(admgrStatisticsVO);			
			model.addAttribute("ListCnt3", ListCnt3);
			
			admgrStatisticsVO.setod_store_category("CD002004");
			int ListCnt4 = admgrStatisticsService.get_sale_category_cnt(admgrStatisticsVO);
			model.addAttribute("ListCnt4", ListCnt4);
			
			model.addAttribute("BestList10", admgrStatisticsService.get_sale_all_list(admgrStatisticsVO));
			
			admgrStatisticsVO.setod_store_category("CD002001");
			model.addAttribute("bestList101", admgrStatisticsService.get_sale_category_list(admgrStatisticsVO));
			
			admgrStatisticsVO.setod_store_category("CD002002");
			model.addAttribute("bestList102", admgrStatisticsService.get_sale_category_list(admgrStatisticsVO));
			
			admgrStatisticsVO.setod_store_category("CD002003");
			model.addAttribute("bestList103", admgrStatisticsService.get_sale_category_list(admgrStatisticsVO));
			
			admgrStatisticsVO.setod_store_category("CD002004");
			model.addAttribute("bestList104", admgrStatisticsService.get_sale_category_list(admgrStatisticsVO));
			
			
			return "/admgr/admgrStatistics/statistics";
			
		}
	}

}