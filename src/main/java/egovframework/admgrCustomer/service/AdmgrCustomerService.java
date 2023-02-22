package egovframework.admgrCustomer.service;

import java.util.List;

public interface AdmgrCustomerService {

	/* bbs notice 목록 */
	public List<AdmgrCustomerVO> get_bbs_notice_list(AdmgrCustomerVO admgrCustomerVO) throws Exception;
	/* bbs 목록 */
	public List<AdmgrCustomerVO> get_bbs_list(AdmgrCustomerVO admgrCustomerVO) throws Exception;
	
	/* bbs 목록 갯수 */
	public int get_bbs_list_cnt(AdmgrCustomerVO admgrCustomerVO) throws Exception;
	
	/* bbs 정보*/
	public AdmgrCustomerVO get_bbs_info(AdmgrCustomerVO admgrCustomerVO) throws Exception;
	
	/* bbs 정보*/
	public AdmgrCustomerVO get_bbs_info2(AdmgrCustomerVO admgrCustomerVO) throws Exception;
	
	/* bbs 정보*/
	public void insert_bbs(AdmgrCustomerVO admgrCustomerVO) throws Exception;
	
	/* bbs 정보*/
	public void update_bbs(AdmgrCustomerVO admgrCustomerVO) throws Exception;

	/* bbs 조회수증가*/
	public void get_bbs_increase_hit(AdmgrCustomerVO admgrCustomerVO) throws Exception;
	
	/* bbs 정보*/
	public void delete_bbs(AdmgrCustomerVO admgrCustomerVO) throws Exception;
	
}