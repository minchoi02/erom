package egovframework.admgrOrder.service;

import java.util.List;

public interface AdmgrOrderService {

	public List<AdmgrOrderVO> get_order_list(AdmgrOrderVO admgrOrderVO) throws Exception;
	public List<AdmgrOrderVO> get_order_detail_list(AdmgrOrderVO admgrOrderVO) throws Exception;
	
	public List<AdmgrOrderVO> get_order_cancel_list(AdmgrOrderVO admgrOrderVO) throws Exception;
	
	public int get_order_list_cnt(AdmgrOrderVO admgrOrderVO) throws Exception;
	public int get_order_detail_list_cnt(AdmgrOrderVO admgrOrderVO) throws Exception;
	
	public AdmgrOrderVO get_order_master_info(AdmgrOrderVO admgrOrderVO) throws Exception;

	public void update_order_master(AdmgrOrderVO admgrOrderVO) throws Exception;
	public void update_order_detail(AdmgrOrderVO admgrOrderVO) throws Exception;
	
	public void update_master_payment(AdmgrOrderVO admgrOrderVO) throws Exception;
	
}