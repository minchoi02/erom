package egovframework.base.board.service.Impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.base.board.service.BaseBoardVO;
import egovframework.rte.psl.dataaccess.EgovAbstractDAO;

@Repository("BaseBoardDAO")
public class BaseBoardDAO extends EgovAbstractDAO {
		
	@SuppressWarnings("unchecked")
	public List<BaseBoardVO> get_main_slide(BaseBoardVO baseBoardVO) {
		return (List<BaseBoardVO>) list("get_main_slide",baseBoardVO);
	}
	public int get_main_slide_cnt(BaseBoardVO baseBoardVO) {
		return (Integer) select("get_main_slide_cnt",baseBoardVO);
	}

	@SuppressWarnings("unchecked")
	public List<BaseBoardVO> get_week(BaseBoardVO baseBoardVO) {
		return (List<BaseBoardVO>) list("get_week",baseBoardVO);
	}
	public int get_week_cnt(BaseBoardVO baseBoardVO) {
		return (Integer) select("get_week_cnt",baseBoardVO);
	}
	
	@SuppressWarnings("unchecked")
	public List<BaseBoardVO> get_bbs_promotion(BaseBoardVO baseBoardVO) {
		return (List<BaseBoardVO>) list("get_bbs_promotion",baseBoardVO);
	}
	public int get_bbs_promotion_cnt(BaseBoardVO baseBoardVO) {
		return (Integer) select("get_bbs_promotion_cnt",baseBoardVO);
	}
	
	@SuppressWarnings("unchecked")
	public List<BaseBoardVO> get_banner(BaseBoardVO baseBoardVO) {
		return (List<BaseBoardVO>) list("get_banner",baseBoardVO);
	}
	
	@SuppressWarnings("unchecked")
	public List<BaseBoardVO> get_index_banner(BaseBoardVO baseBoardVO) {
		return (List<BaseBoardVO>) list("get_index_banner",baseBoardVO);
	}
	
	
	@SuppressWarnings("unchecked")
	public List<BaseBoardVO> get_site_bbs_list(BaseBoardVO baseBoardVO) {
		return (List<BaseBoardVO>) list("get_site_bbs_list",baseBoardVO);
	}
	
	@SuppressWarnings("unchecked")
	public List<BaseBoardVO> get_site_bbs_limit_list(BaseBoardVO baseBoardVO) {
		return (List<BaseBoardVO>) list("get_site_bbs_limit_list",baseBoardVO);
	}
	
	public int get_site_bbs_list_cnt(BaseBoardVO baseBoardVO) {
		return (Integer) select("get_site_bbs_list_cnt",baseBoardVO);
	}
	
	public BaseBoardVO get_site_review_cnt(BaseBoardVO baseBoardVO) {
		return (BaseBoardVO) select("get_site_review_cnt",baseBoardVO);
	}

	public int insert_site_bbs(BaseBoardVO baseBoardVO) {
		return (Integer) insert("insert_site_bbs",baseBoardVO);
	}

	public void update_site_bbs(BaseBoardVO baseBoardVO) {
		update("update_site_bbs",baseBoardVO);
	}
	
	public void delete_site_bbs(BaseBoardVO baseBoardVO) {
		delete("delete_site_bbs",baseBoardVO);
	}
	
	@SuppressWarnings("unchecked")
	public List<BaseBoardVO> get_main_item(BaseBoardVO baseBoardVO) {
		return (List<BaseBoardVO>) list("get_main_item",baseBoardVO);
	}
	public int get_main_item_cnt(BaseBoardVO baseBoardVO) {
		return (Integer) select("get_main_item_cnt",baseBoardVO);
	}
	
	public BaseBoardVO get_site_bbs_info(BaseBoardVO baseBoardVO) {
		return (BaseBoardVO) select("get_site_bbs_info",baseBoardVO);
	}

}
