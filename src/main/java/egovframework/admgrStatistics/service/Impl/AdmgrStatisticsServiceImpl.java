package egovframework.admgrStatistics.service.Impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.admgrStatistics.service.AdmgrStatisticsService;
import egovframework.admgrStatistics.service.AdmgrStatisticsVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;

@Service("AdmgrStatisticsService")
public class AdmgrStatisticsServiceImpl extends EgovAbstractServiceImpl implements AdmgrStatisticsService {

	@Resource(name="AdmgrStatisticsDAO")
	private AdmgrStatisticsDAO admgrStatisticsDAO;
	
	/* ID Generation */
	@Resource(name="egovIdGnrService")
	private EgovIdGnrService egovIdGnrService;

	@Override
	public List<AdmgrStatisticsVO> get_keywords_list(AdmgrStatisticsVO admgrStatisticsVO) {
		return admgrStatisticsDAO.get_keywords_list(admgrStatisticsVO);
	}
	
	@Override
	public int get_keywords_list_cnt(AdmgrStatisticsVO admgrStatisticsVO) {
		return admgrStatisticsDAO.get_keywords_list_cnt(admgrStatisticsVO);
	}
	
	@Override
	public List<AdmgrStatisticsVO> get_sale_all_list(AdmgrStatisticsVO admgrStatisticsVO) {
		return admgrStatisticsDAO.get_sale_all_list(admgrStatisticsVO);
	}
	@Override
	public List<AdmgrStatisticsVO> get_sale_category_list(AdmgrStatisticsVO admgrStatisticsVO) {
		return admgrStatisticsDAO.get_sale_category_list(admgrStatisticsVO);
	}
	
	@Override
	public int get_sale_all_cnt(AdmgrStatisticsVO admgrStatisticsVO) {
		return admgrStatisticsDAO.get_sale_all_cnt(admgrStatisticsVO);
	}
	@Override
	public int get_sale_category_cnt(AdmgrStatisticsVO admgrStatisticsVO) {
		return admgrStatisticsDAO.get_sale_category_cnt(admgrStatisticsVO);
	}
	
	@Override
	public int get_conn_cnt(AdmgrStatisticsVO admgrStatisticsVO) {
		return admgrStatisticsDAO.get_conn_cnt(admgrStatisticsVO);
	}
	
}