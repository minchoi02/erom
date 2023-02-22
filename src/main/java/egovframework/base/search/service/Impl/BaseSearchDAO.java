package egovframework.base.search.service.Impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.base.search.service.BaseSearchVO;
import egovframework.rte.psl.dataaccess.EgovAbstractDAO;

@Repository("BaseSearchDAO")
public class BaseSearchDAO extends EgovAbstractDAO {
		
	@SuppressWarnings("unchecked")
	public List<BaseSearchVO> get_my_keyword(BaseSearchVO baseSearchVO) {
		return (List<BaseSearchVO>) list("get_my_keyword",baseSearchVO);
	}
	
	@SuppressWarnings("unchecked")
	public List<BaseSearchVO> get_best_keyword(BaseSearchVO baseSearchVO) {
		return (List<BaseSearchVO>) list("get_best_keyword",baseSearchVO);
	}
	
	@SuppressWarnings("unchecked")
	public List<BaseSearchVO> get_search_prod_limit(BaseSearchVO baseSearchVO) {
		return (List<BaseSearchVO>) list("get_search_prod_limit",baseSearchVO);
	}
	
	@SuppressWarnings("unchecked")
	public List<BaseSearchVO> get_search_prod_list(BaseSearchVO baseSearchVO) {
		return (List<BaseSearchVO>) list("get_search_prod_list",baseSearchVO);
	}
	
	public int get_search_prod_list_cnt(BaseSearchVO baseSearchVO) {
		return (Integer) select("get_search_prod_list_cnt",baseSearchVO);
	}
	
	public void set_keyword(BaseSearchVO baseSearchVO) {
		insert("set_keyword",baseSearchVO);
	}
	
	public int search_keyword(BaseSearchVO baseSearchVO) {
		return (Integer) select("search_keyword",baseSearchVO);
	}
	
	public void insert_keyword(BaseSearchVO baseSearchVO) {
		insert("insert_keyword",baseSearchVO);
	}
	
	public void update_keyword(BaseSearchVO baseSearchVO) {
		update("update_keyword",baseSearchVO);
	}
	
}
