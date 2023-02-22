package egovframework.base.board.service;

import java.util.List;

public interface BaseBoardService {

	public List<BaseBoardVO> get_main_slide(BaseBoardVO baseBoardVO) throws Exception;
	public int get_main_slide_cnt(BaseBoardVO baseBoardVO) throws Exception;
	
	public List<BaseBoardVO> get_week(BaseBoardVO baseBoardVO) throws Exception;
	public int get_week_cnt(BaseBoardVO baseBoardVO) throws Exception;
	
	public List<BaseBoardVO> get_bbs_promotion(BaseBoardVO baseBoardVO) throws Exception;
	public int get_bbs_promotion_cnt(BaseBoardVO baseBoardVO) throws Exception;
	
	public List<BaseBoardVO> get_banner(BaseBoardVO baseBoardVO) throws Exception;
	
	public List<BaseBoardVO> get_index_banner(BaseBoardVO baseBoardVO) throws Exception;
	public List<BaseBoardVO> get_site_bbs_list(BaseBoardVO baseBoardVO) throws Exception;
	public List<BaseBoardVO> get_site_bbs_limit_list(BaseBoardVO baseBoardVO) throws Exception;
	
	public int  get_site_bbs_list_cnt(BaseBoardVO baseBoardVO) throws Exception;
	public BaseBoardVO get_site_review_cnt(BaseBoardVO baseBoardVO) throws Exception;

	public int insert_site_bbs(BaseBoardVO baseBoardVO) throws Exception;
	public void update_site_bbs(BaseBoardVO baseBoardVO) throws Exception;
	public void delete_site_bbs(BaseBoardVO baseBoardVO) throws Exception;
	
	public List<BaseBoardVO> get_main_item(BaseBoardVO baseBoardVO) throws Exception;
	public int get_main_item_cnt(BaseBoardVO baseBoardVO) throws Exception;
	
	public BaseBoardVO get_site_bbs_info(BaseBoardVO baseBoardVO) throws Exception;
	
}