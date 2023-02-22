package egovframework.admgrMarketing.service.Impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.admgrMarketing.service.AdmgrMarketingVO;
import egovframework.rte.psl.dataaccess.EgovAbstractDAO;

@Repository("AdmgrMarketingDAO")
public class AdmgrMarketingDAO extends EgovAbstractDAO {
		
	@SuppressWarnings("unchecked")
	public List<AdmgrMarketingVO> get_slide_list(AdmgrMarketingVO admgrMarketingVO) {
		return (List<AdmgrMarketingVO>) list("get_slide_list",admgrMarketingVO);
	}
	
	public int get_slide_list_cnt(AdmgrMarketingVO admgrMarketingVO) {
		return (Integer) select("get_slide_list_cnt",admgrMarketingVO);
	}
	
	public AdmgrMarketingVO get_slide_info(AdmgrMarketingVO admgrMarketingVO) {
		return (AdmgrMarketingVO) select("get_slide_info",admgrMarketingVO);
	}
	
	public void insert_slide(AdmgrMarketingVO admgrMarketingVO) {
		insert("insert_slide",admgrMarketingVO);
	}
	
	public void update_slide(AdmgrMarketingVO admgrMarketingVO) {
		update("update_slide",admgrMarketingVO);
	}
	
	public void delete_slide(AdmgrMarketingVO admgrMarketingVO) {
		update("delete_slide",admgrMarketingVO);
	}
	
	@SuppressWarnings("unchecked")
	public List<AdmgrMarketingVO> get_week_list(AdmgrMarketingVO admgrMarketingVO) {
		return (List<AdmgrMarketingVO>) list("get_week_list",admgrMarketingVO);
	}
	
	public int get_week_list_cnt(AdmgrMarketingVO admgrMarketingVO) {
		return (Integer) select("get_week_list_cnt",admgrMarketingVO);
	}
	
	public AdmgrMarketingVO get_week_info(AdmgrMarketingVO admgrMarketingVO) {
		return (AdmgrMarketingVO) select("get_week_info",admgrMarketingVO);
	}
	
	public void insert_week(AdmgrMarketingVO admgrMarketingVO) {
		insert("insert_week",admgrMarketingVO);
	}
	
	public void update_week(AdmgrMarketingVO admgrMarketingVO) {
		update("update_week",admgrMarketingVO);
	}
	
	public void delete_week(AdmgrMarketingVO admgrMarketingVO) {
		update("delete_week",admgrMarketingVO);
	}
	
	@SuppressWarnings("unchecked")
	public List<AdmgrMarketingVO> get_banner_list(AdmgrMarketingVO admgrMarketingVO) {
		return (List<AdmgrMarketingVO>) list("get_banner_list",admgrMarketingVO);
	}
	
	public int get_banner_list_cnt(AdmgrMarketingVO admgrMarketingVO) {
		return (Integer) select("get_banner_list_cnt",admgrMarketingVO);
	}
	
	public AdmgrMarketingVO get_banner_info(AdmgrMarketingVO admgrMarketingVO) {
		return (AdmgrMarketingVO) select("get_banner_info",admgrMarketingVO);
	}
	
	public void insert_banner(AdmgrMarketingVO admgrMarketingVO) {
		insert("insert_banner",admgrMarketingVO);
	}
	
	public void update_banner(AdmgrMarketingVO admgrMarketingVO) {
		update("update_banner",admgrMarketingVO);
	}
	
	public void delete_banner(AdmgrMarketingVO admgrMarketingVO) {
		update("delete_banner",admgrMarketingVO);
	}
	
	@SuppressWarnings("unchecked")
	public List<AdmgrMarketingVO> get_main_list(AdmgrMarketingVO admgrMarketingVO) {
		return (List<AdmgrMarketingVO>) list("get_main_list",admgrMarketingVO);
	}
	
	public int get_main_list_cnt(AdmgrMarketingVO admgrMarketingVO) {
		return (Integer) select("get_main_list_cnt",admgrMarketingVO);
	}
	
	public AdmgrMarketingVO get_main_info(AdmgrMarketingVO admgrMarketingVO) {
		return (AdmgrMarketingVO) select("get_main_info",admgrMarketingVO);
	}
	
	public void insert_main(AdmgrMarketingVO admgrMarketingVO) {
		insert("insert_main",admgrMarketingVO);
	}
	
	public void update_main(AdmgrMarketingVO admgrMarketingVO) {
		update("update_main",admgrMarketingVO);
	}
	
	public void delete_main(AdmgrMarketingVO admgrMarketingVO) {
		update("delete_main",admgrMarketingVO);
	}
	
	


}
