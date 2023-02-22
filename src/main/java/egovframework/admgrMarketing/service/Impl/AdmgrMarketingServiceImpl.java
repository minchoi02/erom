package egovframework.admgrMarketing.service.Impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.admgrMarketing.service.AdmgrMarketingService;
import egovframework.admgrMarketing.service.AdmgrMarketingVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;


@Service("AdmgrMarketingService")
public class AdmgrMarketingServiceImpl extends EgovAbstractServiceImpl implements AdmgrMarketingService {

	@Resource(name="AdmgrMarketingDAO")
	private AdmgrMarketingDAO admgrMarketingDAO;

	/** ID Generation */
	@Resource(name = "egovIdGnrService")
	private EgovIdGnrService egovIdGnrService;
	
	public List<AdmgrMarketingVO> get_slide_list(AdmgrMarketingVO admgrMarketingVO) {
    	return admgrMarketingDAO.get_slide_list(admgrMarketingVO);
    }

	@Override
	public int get_slide_list_cnt(AdmgrMarketingVO admgrMarketingVO) {
    	return admgrMarketingDAO.get_slide_list_cnt(admgrMarketingVO);
    }

	@Override
	public AdmgrMarketingVO get_slide_info(AdmgrMarketingVO admgrMarketingVO) {
    	return admgrMarketingDAO.get_slide_info(admgrMarketingVO);
    }	
	
	@Override
	public void insert_slide(AdmgrMarketingVO admgrMarketingVO) {
		admgrMarketingDAO.insert_slide(admgrMarketingVO);
	}	
	
	@Override
	public void update_slide(AdmgrMarketingVO admgrMarketingVO) {
		admgrMarketingDAO.update_slide(admgrMarketingVO);
	}	
	
	@Override
	public void delete_slide(AdmgrMarketingVO admgrMarketingVO) {
		admgrMarketingDAO.delete_slide(admgrMarketingVO);
	}	
	
	public List<AdmgrMarketingVO> get_week_list(AdmgrMarketingVO admgrMarketingVO) {
    	return admgrMarketingDAO.get_week_list(admgrMarketingVO);
    }

	@Override
	public int get_week_list_cnt(AdmgrMarketingVO admgrMarketingVO) {
    	return admgrMarketingDAO.get_week_list_cnt(admgrMarketingVO);
    }

	@Override
	public AdmgrMarketingVO get_week_info(AdmgrMarketingVO admgrMarketingVO) {
    	return admgrMarketingDAO.get_week_info(admgrMarketingVO);
    }	

	@Override
	public void insert_week(AdmgrMarketingVO admgrMarketingVO) {
		admgrMarketingDAO.insert_week(admgrMarketingVO);
	}	
	
	@Override
	public void update_week(AdmgrMarketingVO admgrMarketingVO) {
		admgrMarketingDAO.update_week(admgrMarketingVO);
	}	
	
	@Override
	public void delete_week(AdmgrMarketingVO admgrMarketingVO) {
		admgrMarketingDAO.delete_week(admgrMarketingVO);
	}	
	
	public List<AdmgrMarketingVO> get_banner_list(AdmgrMarketingVO admgrMarketingVO) {
    	return admgrMarketingDAO.get_banner_list(admgrMarketingVO);
    }

	@Override
	public int get_banner_list_cnt(AdmgrMarketingVO admgrMarketingVO) {
    	return admgrMarketingDAO.get_banner_list_cnt(admgrMarketingVO);
    }

	@Override
	public AdmgrMarketingVO get_banner_info(AdmgrMarketingVO admgrMarketingVO) {
    	return admgrMarketingDAO.get_banner_info(admgrMarketingVO);
    }	

	@Override
	public void insert_banner(AdmgrMarketingVO admgrMarketingVO) {
		admgrMarketingDAO.insert_banner(admgrMarketingVO);
	}	
	
	@Override
	public void update_banner(AdmgrMarketingVO admgrMarketingVO) {
		admgrMarketingDAO.update_banner(admgrMarketingVO);
	}	
	
	@Override
	public void delete_banner(AdmgrMarketingVO admgrMarketingVO) {
		admgrMarketingDAO.delete_banner(admgrMarketingVO);
	}	
	
	public List<AdmgrMarketingVO> get_main_list(AdmgrMarketingVO admgrMarketingVO) {
    	return admgrMarketingDAO.get_main_list(admgrMarketingVO);
    }

	@Override
	public int get_main_list_cnt(AdmgrMarketingVO admgrMarketingVO) {
    	return admgrMarketingDAO.get_main_list_cnt(admgrMarketingVO);
    }

	@Override
	public AdmgrMarketingVO get_main_info(AdmgrMarketingVO admgrMarketingVO) {
    	return admgrMarketingDAO.get_main_info(admgrMarketingVO);
    }	

	@Override
	public void insert_main(AdmgrMarketingVO admgrMarketingVO) {
		admgrMarketingDAO.insert_main(admgrMarketingVO);
	}	
	
	@Override
	public void update_main(AdmgrMarketingVO admgrMarketingVO) {
		admgrMarketingDAO.update_main(admgrMarketingVO);
	}	
	
	@Override
	public void delete_main(AdmgrMarketingVO admgrMarketingVO) {
		admgrMarketingDAO.delete_main(admgrMarketingVO);
	}	
	
	
}