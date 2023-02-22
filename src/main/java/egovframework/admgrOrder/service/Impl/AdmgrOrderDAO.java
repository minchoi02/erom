package egovframework.admgrOrder.service.Impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.admgrOrder.service.AdmgrOrderVO;
import egovframework.rte.psl.dataaccess.EgovAbstractDAO;

@Repository("AdmgrOrderDAO")
public class AdmgrOrderDAO extends EgovAbstractDAO {
	
	@SuppressWarnings("unchecked")
	public List<AdmgrOrderVO> get_order_list(AdmgrOrderVO admgrOrderVO) {
		return (List<AdmgrOrderVO>) list("get_order_list",admgrOrderVO);
	}
	
	@SuppressWarnings("unchecked")
	public List<AdmgrOrderVO> get_order_detail_list(AdmgrOrderVO admgrOrderVO) {
		return (List<AdmgrOrderVO>) list("get_order_detail_list",admgrOrderVO);
	}
	
	@SuppressWarnings("unchecked")
	public List<AdmgrOrderVO> get_order_cancel_list(AdmgrOrderVO admgrOrderVO) {
		return (List<AdmgrOrderVO>) list("get_order_cancel_list",admgrOrderVO);
	}
	
	public int get_order_list_cnt(AdmgrOrderVO admgrOrderVO) {
		return (Integer) select("get_order_list_cnt",admgrOrderVO);
	}
	
	public int get_order_detail_list_cnt(AdmgrOrderVO admgrOrderVO) {
		return (Integer) select("get_order_detail_list_cnt",admgrOrderVO);
	}

	public AdmgrOrderVO get_order_master_info(AdmgrOrderVO admgrOrderVO) {
		return (AdmgrOrderVO) select("get_order_master_info",admgrOrderVO);
	}

	public void update_order_master(AdmgrOrderVO admgrOrderVO) {
		update("update_order_master",admgrOrderVO);
	}
	
	public void update_order_detail(AdmgrOrderVO admgrOrderVO) {
		update("update_order_detail",admgrOrderVO);
	}
	
	public void update_master_payment(AdmgrOrderVO admgrOrderVO) {
		update("update_master_payment",admgrOrderVO);
	}
	
}