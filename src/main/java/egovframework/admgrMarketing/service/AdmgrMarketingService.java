package egovframework.admgrMarketing.service;

import java.util.List;

import egovframework.admgrMarketing.service.AdmgrMarketingVO;

public interface AdmgrMarketingService {

	/* 메인슬라이드 */
	public List<AdmgrMarketingVO> get_slide_list(AdmgrMarketingVO admgrMarketingVO) throws Exception;
	public AdmgrMarketingVO get_slide_info(AdmgrMarketingVO admgrMarketingVO) throws Exception;
	public void insert_slide(AdmgrMarketingVO admgrMarketingVO) throws Exception;
	public void update_slide(AdmgrMarketingVO admgrMarketingVO) throws Exception;
	public void delete_slide(AdmgrMarketingVO admgrMarketingVO) throws Exception;
	
	/* 메인슬라이드 갯수 */
	public int get_slide_list_cnt(AdmgrMarketingVO admgrMarketingVO) throws Exception;

	/* 금주의 상품 */
	public List<AdmgrMarketingVO> get_week_list(AdmgrMarketingVO admgrMarketingVO) throws Exception;
	public AdmgrMarketingVO get_week_info(AdmgrMarketingVO admgrMarketingVO) throws Exception;
	public void insert_week(AdmgrMarketingVO admgrMarketingVO) throws Exception;
	public void update_week(AdmgrMarketingVO admgrMarketingVO) throws Exception;
	public void delete_week(AdmgrMarketingVO admgrMarketingVO) throws Exception;
	
	/* 금주의 상품 갯수 */
	public int get_week_list_cnt(AdmgrMarketingVO admgrMarketingVO) throws Exception;

	/* 배너 */
	public List<AdmgrMarketingVO> get_banner_list(AdmgrMarketingVO admgrMarketingVO) throws Exception;
	public AdmgrMarketingVO get_banner_info(AdmgrMarketingVO admgrMarketingVO) throws Exception;
	public void insert_banner(AdmgrMarketingVO admgrMarketingVO) throws Exception;
	public void update_banner(AdmgrMarketingVO admgrMarketingVO) throws Exception;
	public void delete_banner(AdmgrMarketingVO admgrMarketingVO) throws Exception;
	
	/* 배너 갯수 */
	public int get_banner_list_cnt(AdmgrMarketingVO admgrMarketingVO) throws Exception;

	/* 메인상품 */
	public List<AdmgrMarketingVO> get_main_list(AdmgrMarketingVO admgrMarketingVO) throws Exception;
	public AdmgrMarketingVO get_main_info(AdmgrMarketingVO admgrMarketingVO) throws Exception;
	public void insert_main(AdmgrMarketingVO admgrMarketingVO) throws Exception;
	public void update_main(AdmgrMarketingVO admgrMarketingVO) throws Exception;
	public void delete_main(AdmgrMarketingVO admgrMarketingVO) throws Exception;
	
	/* 메인상품 갯수 */
	public int get_main_list_cnt(AdmgrMarketingVO admgrMarketingVO) throws Exception;

	
}