package egovframework.admgrStatistics.service;

import java.util.List;

public interface AdmgrStatisticsService {

	public List<AdmgrStatisticsVO> get_keywords_list(AdmgrStatisticsVO admgrStatisticsVO) throws Exception;
	public int get_keywords_list_cnt(AdmgrStatisticsVO admgrStatisticsVO) throws Exception;
	
	public int get_sale_all_cnt(AdmgrStatisticsVO admgrStatisticsVO) throws Exception;
	public int get_sale_category_cnt(AdmgrStatisticsVO admgrStatisticsVO) throws Exception;
	
	public int get_conn_cnt(AdmgrStatisticsVO admgrStatisticsVO) throws Exception;
	
	public List<AdmgrStatisticsVO> get_sale_all_list(AdmgrStatisticsVO admgrStatisticsVO) throws Exception;
	public List<AdmgrStatisticsVO> get_sale_category_list(AdmgrStatisticsVO admgrStatisticsVO) throws Exception;
}