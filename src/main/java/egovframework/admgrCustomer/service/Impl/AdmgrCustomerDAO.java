package egovframework.admgrCustomer.service.Impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.admgrCustomer.service.AdmgrCustomerVO;
import egovframework.rte.psl.dataaccess.EgovAbstractDAO;

@Repository("AdmgrCustomerDAO")
public class AdmgrCustomerDAO extends EgovAbstractDAO {

	@SuppressWarnings("unchecked")
	public List<AdmgrCustomerVO> get_bbs_list(AdmgrCustomerVO admgrCustomerVO) {
		return (List<AdmgrCustomerVO>) list("get_bbs_list",admgrCustomerVO);
	}
	
	@SuppressWarnings("unchecked")
	public List<AdmgrCustomerVO> get_bbs_notice_list(AdmgrCustomerVO admgrCustomerVO) {
		return (List<AdmgrCustomerVO>) list("get_bbs_notice_list",admgrCustomerVO);
	}
	
	public int get_bbs_list_cnt(AdmgrCustomerVO admgrCustomerVO) {
		return (Integer) select("get_bbs_list_cnt",admgrCustomerVO);
	}
	
	public AdmgrCustomerVO get_bbs_info(AdmgrCustomerVO admgrCustomerVO) {
		return (AdmgrCustomerVO) select("get_bbs_info",admgrCustomerVO);
	}

	public AdmgrCustomerVO get_bbs_info2(AdmgrCustomerVO admgrCustomerVO) {
		return (AdmgrCustomerVO) select("get_bbs_info2",admgrCustomerVO);
	}
	
	public void insert_bbs(AdmgrCustomerVO admgrCustomerVO) {
		insert("insert_bbs",admgrCustomerVO);
	}
	
	public void update_bbs(AdmgrCustomerVO admgrCustomerVO) {
		update("update_bbs",admgrCustomerVO);
	}
	
	public void get_bbs_increase_hit(AdmgrCustomerVO admgrCustomerVO) {
		update("get_bbs_increase_hit",admgrCustomerVO);
	}	
	
	public void delete_bbs(AdmgrCustomerVO admgrCustomerVO) {
		update("delete_bbs",admgrCustomerVO);
	}
	
}