package egovframework.admgrStatistics.service.Impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.admgrStatistics.service.AdmgrStatisticsVO;
import egovframework.rte.psl.dataaccess.EgovAbstractDAO;

@Repository("AdmgrStatisticsDAO")
public class AdmgrStatisticsDAO extends EgovAbstractDAO {

	@SuppressWarnings("unchecked")
	public List<AdmgrStatisticsVO> get_keywords_list(AdmgrStatisticsVO admgrStatisticsVO) {
		return (List<AdmgrStatisticsVO>) list("get_keywords_list", admgrStatisticsVO);
	}
	
	@SuppressWarnings("unchecked")
	public List<AdmgrStatisticsVO> get_sale_all_list(AdmgrStatisticsVO admgrStatisticsVO) {
		return (List<AdmgrStatisticsVO>) list("get_sale_all_list", admgrStatisticsVO);
	}
	@SuppressWarnings("unchecked")
	public List<AdmgrStatisticsVO> get_sale_category_list(AdmgrStatisticsVO admgrStatisticsVO) {
		return (List<AdmgrStatisticsVO>) list("get_sale_category_list", admgrStatisticsVO);
	}
	
	public int get_keywords_list_cnt(AdmgrStatisticsVO admgrStatisticsVO) {
		return (Integer) select("get_keywords_list_cnt", admgrStatisticsVO);
	}
	
	public int get_sale_all_cnt(AdmgrStatisticsVO admgrStatisticsVO) {
		return (Integer) select("get_sale_all_cnt", admgrStatisticsVO);
	}
	public int get_sale_category_cnt(AdmgrStatisticsVO admgrStatisticsVO) {
		return (Integer) select("get_sale_category_cnt", admgrStatisticsVO);
	}
	
	public int get_conn_cnt(AdmgrStatisticsVO admgrStatisticsVO) {
		return (Integer) select("get_conn_cnt", admgrStatisticsVO);
	}
	
	
}