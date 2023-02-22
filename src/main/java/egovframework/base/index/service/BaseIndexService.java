package egovframework.base.index.service;

import java.util.List;

public interface BaseIndexService {

	public int pick_check(BaseIndexVO baseIndexVO) throws Exception;
	public void insert_pick(BaseIndexVO baseIndexVO) throws Exception;
	public void delete_pick(BaseIndexVO baseIndexVO) throws Exception;
	public List<BaseIndexVO> get_gps_store_list(BaseIndexVO baseIndexVO) throws Exception;
	
}