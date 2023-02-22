package egovframework.base.index.service.Impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.base.index.service.BaseIndexService;
import egovframework.base.index.service.BaseIndexVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;


@Service("BaseIndexService")
public class BaseIndexServiceImpl extends EgovAbstractServiceImpl implements BaseIndexService {

	@Resource(name="BaseIndexDAO")
	private BaseIndexDAO baseIndexDAO;

	/** ID Generation */
	@Resource(name = "egovIdGnrService")
	private EgovIdGnrService egovIdGnrService;
	
	@Override
	public int pick_check(BaseIndexVO baseIndexVO) {
		return baseIndexDAO.pick_check(baseIndexVO);
	}
	
	@Override
	public void insert_pick(BaseIndexVO baseIndexVO) {
		baseIndexDAO.insert_pick(baseIndexVO);
	}
	
	@Override
	public void delete_pick(BaseIndexVO baseIndexVO) {
		baseIndexDAO.delete_pick(baseIndexVO);
	}
	
	@Override
	public List<BaseIndexVO> get_gps_store_list(BaseIndexVO baseIndexVO) {
		return baseIndexDAO.get_gps_store_list(baseIndexVO);
	}}
