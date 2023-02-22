package egovframework.admgrMain.service;

import java.util.List;

import egovframework.admgrMain.service.AdmgrMainVO;

public interface AdmgrMainService {

	public List<AdmgrMainVO> get_main_member_list(AdmgrMainVO admgrmainVO) throws Exception;
	public List<AdmgrMainVO> get_main_order_list(AdmgrMainVO admgrmainVO) throws Exception;
	public List<AdmgrMainVO> get_main_bbs_list(AdmgrMainVO admgrmainVO) throws Exception;
	public List<AdmgrMainVO> get_main_product_list(AdmgrMainVO admgrmainVO) throws Exception;
	public List<AdmgrMainVO> get_main_store_list(AdmgrMainVO admgrmainVO) throws Exception;
	
}