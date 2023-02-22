package egovframework.admgrMain.service.lmpl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.admgrMain.service.AdmgrMainVO;
import egovframework.rte.psl.dataaccess.EgovAbstractDAO;

@Repository("AdmgrMainDAO")
public class AdmgrMainDAO extends EgovAbstractDAO {

	@SuppressWarnings("unchecked")
	public List<AdmgrMainVO> get_main_member_list(AdmgrMainVO admgrMainVO) {
		return (List<AdmgrMainVO>) list("get_main_member_list",admgrMainVO);
	}	

	@SuppressWarnings("unchecked")
	public List<AdmgrMainVO> get_main_order_list(AdmgrMainVO admgrMainVO) {
		return (List<AdmgrMainVO>) list("get_main_order_list",admgrMainVO);
	}	
	
	@SuppressWarnings("unchecked")
	public List<AdmgrMainVO> get_main_bbs_list(AdmgrMainVO admgrMainVO) {
		return (List<AdmgrMainVO>) list("get_main_bbs_list",admgrMainVO);
	}	

	@SuppressWarnings("unchecked")
	public List<AdmgrMainVO> get_main_product_list(AdmgrMainVO admgrMainVO) {
		return (List<AdmgrMainVO>) list("get_main_product_list",admgrMainVO);
	}	
	
	@SuppressWarnings("unchecked")
	public List<AdmgrMainVO> get_main_store_list(AdmgrMainVO admgrMainVO) {
		return (List<AdmgrMainVO>) list("get_main_store_list",admgrMainVO);
	}	
	
}
