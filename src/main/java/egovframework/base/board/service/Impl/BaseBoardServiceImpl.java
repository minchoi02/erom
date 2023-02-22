package egovframework.base.board.service.Impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.base.board.service.BaseBoardService;
import egovframework.base.board.service.BaseBoardVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;


@Service("BaseBoardService")
public class BaseBoardServiceImpl extends EgovAbstractServiceImpl implements BaseBoardService {

	@Resource(name="BaseBoardDAO")
	private BaseBoardDAO baseBoardDAO;

	/** ID Generation */
	@Resource(name = "egovIdGnrService")
	private EgovIdGnrService egovIdGnrService;
	
	@Override
	public List<BaseBoardVO> get_main_slide(BaseBoardVO baseBoardVO) {
    	return baseBoardDAO.get_main_slide(baseBoardVO);
    }
	@Override
	public int get_main_slide_cnt(BaseBoardVO baseBoardVO) {
		return baseBoardDAO.get_main_slide_cnt(baseBoardVO);
	}

	@Override
	public List<BaseBoardVO> get_week(BaseBoardVO baseBoardVO) {
		return baseBoardDAO.get_week(baseBoardVO);
	}
	@Override
	public int get_week_cnt(BaseBoardVO baseBoardVO) {
		return baseBoardDAO.get_week_cnt(baseBoardVO);
	}
	
	@Override
	public List<BaseBoardVO> get_bbs_promotion(BaseBoardVO baseBoardVO) {
		return baseBoardDAO.get_bbs_promotion(baseBoardVO);
	}
	@Override
	public int get_bbs_promotion_cnt(BaseBoardVO baseBoardVO) {
		return baseBoardDAO.get_bbs_promotion_cnt(baseBoardVO);
	}
	
	@Override
	public List<BaseBoardVO> get_banner(BaseBoardVO baseBoardVO) {
		return baseBoardDAO.get_banner(baseBoardVO);
	}
	@Override
	public List<BaseBoardVO> get_index_banner(BaseBoardVO baseBoardVO) {
		return baseBoardDAO.get_index_banner(baseBoardVO);
	}
	
	@Override
	public List<BaseBoardVO> get_site_bbs_list(BaseBoardVO baseBoardVO) {
		return baseBoardDAO.get_site_bbs_list(baseBoardVO);
	}
	
	@Override
	public List<BaseBoardVO> get_site_bbs_limit_list(BaseBoardVO baseBoardVO) {
		return baseBoardDAO.get_site_bbs_limit_list(baseBoardVO);
	}
	
	@Override
	public int get_site_bbs_list_cnt(BaseBoardVO baseBoardVO) {
		return baseBoardDAO.get_site_bbs_list_cnt(baseBoardVO);
	}
	
	@Override
	public BaseBoardVO get_site_review_cnt(BaseBoardVO baseBoardVO) {
		return baseBoardDAO.get_site_review_cnt(baseBoardVO);
	}

	@Override
	public int insert_site_bbs(BaseBoardVO baseBoardVO) {
		return baseBoardDAO.insert_site_bbs(baseBoardVO);
	}

	@Override
	public void update_site_bbs(BaseBoardVO baseBoardVO) {
		baseBoardDAO.update_site_bbs(baseBoardVO);
	}
	
	@Override
	public void delete_site_bbs(BaseBoardVO baseBoardVO) {
		baseBoardDAO.delete_site_bbs(baseBoardVO);
	}
	
	@Override
	public List<BaseBoardVO> get_main_item(BaseBoardVO baseBoardVO) {
		return baseBoardDAO.get_main_item(baseBoardVO);
	}
	public int get_main_item_cnt(BaseBoardVO baseBoardVO) {
		return baseBoardDAO.get_main_item_cnt(baseBoardVO);
	}
	
	@Override
	public BaseBoardVO get_site_bbs_info(BaseBoardVO baseBoardVO) {
		return baseBoardDAO.get_site_bbs_info(baseBoardVO);
	}
	

}
