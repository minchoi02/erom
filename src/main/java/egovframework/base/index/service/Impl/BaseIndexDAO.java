package egovframework.base.index.service.Impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.base.index.service.BaseIndexVO;
import egovframework.rte.psl.dataaccess.EgovAbstractDAO;

@Repository("BaseIndexDAO")
public class BaseIndexDAO extends EgovAbstractDAO {
		
	public int pick_check(BaseIndexVO baseIndexVO) {
		return (Integer) select("pick_check",baseIndexVO);
	}
	
	public void insert_pick(BaseIndexVO baseIndexVO) {
		insert("insert_pick",baseIndexVO);
	}
	
	public void delete_pick(BaseIndexVO baseIndexVO) {
		delete("delete_pick",baseIndexVO);
	}
	
	@SuppressWarnings("unchecked")
	public List<BaseIndexVO> get_gps_store_list(BaseIndexVO baseIndexVO) {
		return (List<BaseIndexVO>) list("get_gps_store_list",baseIndexVO);
	}
	
	
}
