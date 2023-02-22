package egovframework.base.search.service;

import java.util.List;

public interface BaseSearchService {

	
	/* 내 키워드 */
	public List<BaseSearchVO> get_my_keyword(BaseSearchVO baseSearchVO) throws Exception;
	
	/* 베스트키워드 */
	public List<BaseSearchVO> get_best_keyword(BaseSearchVO baseSearchVO) throws Exception;
	
	/* 키워드 상품목록 */
	public List<BaseSearchVO> get_search_prod_limit(BaseSearchVO baseSearchVO) throws Exception;
	public List<BaseSearchVO> get_search_prod_list(BaseSearchVO baseSearchVO) throws Exception;
	public int get_search_prod_list_cnt(BaseSearchVO baseSearchVO) throws Exception;
	
	/* 키워드 데이트테이블 삽입 */
	public void set_keyword(BaseSearchVO baseSearchVO) throws Exception;
	
	/* 히트 테이블에 값이 있는지 체크 */
	public int search_keyword(BaseSearchVO baseSearchVO) throws Exception;
	
	/* 키워드 추가 */
	public void insert_keyword(BaseSearchVO baseSearchVO) throws Exception;
	
	/* 키워드 숫자 증가 */
	public void update_keyword(BaseSearchVO baseSearchVO) throws Exception;
	
}