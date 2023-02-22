package egovframework.base.search.service.Impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.base.search.service.BaseSearchService;
import egovframework.base.search.service.BaseSearchVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;


@Service("BaseSearchService")
public class BaseSearchServiceImpl extends EgovAbstractServiceImpl implements BaseSearchService {

	@Resource(name="BaseSearchDAO")
	private BaseSearchDAO baseSearchDAO;

	/** ID Generation */
	@Resource(name = "egovIdGnrService")
	private EgovIdGnrService egovIdGnrService;

	// 키워드값 목록 가져오기
	@Override
	public List<BaseSearchVO> get_my_keyword(BaseSearchVO baseSearchVO) {
    	return baseSearchDAO.get_my_keyword(baseSearchVO);
    }	

	@Override
	public List<BaseSearchVO> get_best_keyword(BaseSearchVO baseSearchVO) {
    	return baseSearchDAO.get_best_keyword(baseSearchVO);
    }	

	@Override
	public List<BaseSearchVO> get_search_prod_limit(BaseSearchVO baseSearchVO) {
    	return baseSearchDAO.get_search_prod_limit(baseSearchVO);
    }	

	@Override
	public List<BaseSearchVO> get_search_prod_list(BaseSearchVO baseSearchVO) {
		return baseSearchDAO.get_search_prod_list(baseSearchVO);
	}	
	
	@Override
	public int get_search_prod_list_cnt(BaseSearchVO baseSearchVO) {
		return baseSearchDAO.get_search_prod_list_cnt(baseSearchVO);
	}	
	
	@Override
	public void set_keyword(BaseSearchVO baseSearchVO) {
		baseSearchDAO.set_keyword(baseSearchVO);
	}	
	
	@Override
	public int search_keyword(BaseSearchVO baseSearchVO) {
		return baseSearchDAO.search_keyword(baseSearchVO);
	}	
	
	@Override
	public void insert_keyword(BaseSearchVO baseSearchVO) {
		baseSearchDAO.insert_keyword(baseSearchVO);
	}	
	
	@Override
	public void update_keyword(BaseSearchVO baseSearchVO) {
		baseSearchDAO.update_keyword(baseSearchVO);
	}	
	
}
