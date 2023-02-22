package egovframework.admgrConfig.service.Impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.admgrConfig.service.AdmgrConfigService;
import egovframework.admgrConfig.service.AdmgrConfigVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;


@Service("AdmgrConfigService")
public class AdmgrConfigServiceImpl extends EgovAbstractServiceImpl implements AdmgrConfigService {

	@Resource(name="AdmgrConfigDAO")
	private AdmgrConfigDAO admgrConfigDAO;

	/** ID Generation */
	@Resource(name = "egovIdGnrService")
	private EgovIdGnrService egovIdGnrService;
	
    // 사이트 기본정보 호출
	@Override
	public AdmgrConfigVO get_base_config(AdmgrConfigVO admgrConfigVO) {
    	return admgrConfigDAO.get_base_config(admgrConfigVO);
    }

	@Override
	public void base_config_update(AdmgrConfigVO admgrConfigVO) {
		admgrConfigDAO.base_config_update(admgrConfigVO);
	}

	@Override
	public List<AdmgrConfigVO> get_popup_list(AdmgrConfigVO admgrConfigVO) {
    	return admgrConfigDAO.get_popup_list(admgrConfigVO);
    }

	@Override
	public int get_popup_list_cnt(AdmgrConfigVO admgrConfigVO) {
    	return admgrConfigDAO.get_popup_list_cnt(admgrConfigVO);
    }	
	
	@Override
	public AdmgrConfigVO get_popup_info(AdmgrConfigVO admgrConfigVO) {
    	return admgrConfigDAO.get_popup_info(admgrConfigVO);
    }

	@Override
	public void insert_popup(AdmgrConfigVO admgrConfigVO) {
		admgrConfigDAO.insert_popup(admgrConfigVO);
	}

	@Override
	public void update_popup(AdmgrConfigVO admgrConfigVO) {
		admgrConfigDAO.update_popup(admgrConfigVO);
	}

	@Override
	public void delete_popup(AdmgrConfigVO admgrConfigVO) {
		admgrConfigDAO.delete_popup(admgrConfigVO);
	}

	

}
