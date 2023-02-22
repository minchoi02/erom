package egovframework.base.shop.service;

import java.util.List;

import egovframework.base.board.service.BaseBoardVO;

public interface BaseShopService {

	public List<BaseShopVO> get_main_item_top(BaseShopVO baseShopVO) throws Exception;
	public BaseShopVO get_site_prod_info(BaseShopVO baseShopVO) throws Exception;
	public BaseShopVO get_site_store_info(BaseShopVO baseShopVO) throws Exception;
	
	public List<BaseShopVO> get_site_main_prod_list_recom_travel(BaseShopVO BaseShopVO) throws Exception;
	public int get_site_main_prod_list_recom_travel_cnt(BaseShopVO BaseShopVO) throws Exception;
	public List<BaseShopVO> get_option_list(BaseShopVO BaseShopVO) throws Exception;

	public List<BaseShopVO> get_site_prod_list(BaseShopVO baseShopVO) throws Exception;
	public List<BaseShopVO> get_index_prod_list(BaseShopVO baseShopVO) throws Exception;	
	public List<BaseShopVO> get_index_prod_list_1(BaseShopVO baseShopVO) throws Exception;
	public List<BaseShopVO> get_index_prod_list_2(BaseShopVO baseShopVO) throws Exception;
	public List<BaseShopVO> get_index_prod_list_3(BaseShopVO baseShopVO) throws Exception;
	public List<BaseShopVO> get_index_prod_list_4(BaseShopVO baseShopVO) throws Exception;
	public List<BaseShopVO> get_index_prod_list_5(BaseShopVO baseShopVO) throws Exception;	
	public List<BaseShopVO> get_site_prod_list_special(BaseShopVO baseShopVO) throws Exception;
	public int get_site_prod_list_cnt(BaseShopVO baseShopVO) throws Exception;
	public int get_site_prod_list_cnt_special(BaseShopVO baseShopVO) throws Exception;
	public List<BaseShopVO> get_prod_room_list(BaseShopVO baseShopVO) throws Exception;
	
	public List<BaseShopVO> get_site_prod_ajax_list(BaseShopVO baseShopVO) throws Exception;
	public int get_site_prod_ajax_list_cnt(BaseShopVO baseShopVO) throws Exception;
	
	public void pick_plus(BaseShopVO baseShopVO) throws Exception;
	public void pick_minus(BaseShopVO baseShopVO) throws Exception;
	
	public BaseShopVO get_cp_info(BaseShopVO baseShopVO) throws Exception;
	
	public BaseShopVO get_site_room_info(BaseShopVO baseShopVO) throws Exception;

	public List<BaseShopVO> get_fav_zone_list(BaseShopVO baseShopVO) throws Exception;
	public int get_fav_zone_list_cnt(BaseShopVO baseShopVO) throws Exception;
	
	public List<BaseShopVO> get_fav_market_list(BaseShopVO baseShopVO) throws Exception;
	public int get_fav_market_list_cnt(BaseShopVO baseShopVO) throws Exception;

	public int get_has_coupon(BaseShopVO baseShopVO) throws Exception;
	public void issue_coupon(BaseShopVO baseShopVO) throws Exception;

	public BaseShopVO get_day_check(BaseShopVO baseShopVO) throws Exception;
	
	public int cart_save(BaseShopVO baseShopVO) throws Exception;
	
	public List<BaseShopVO> get_cart_list(BaseShopVO baseShopVO) throws Exception;
	public int get_cart_cnt(BaseShopVO baseShopVO) throws Exception;
	public List<BaseShopVO> get_member_coupon_list(BaseShopVO baseShopVO) throws Exception;

	public void del_cart_category(BaseShopVO baseShopVO) throws Exception;
	public void del_cart_item(BaseShopVO baseShopVO) throws Exception;

	public BaseShopVO get_cart_info(BaseShopVO baseShopVO) throws Exception;
	
	public void set_order_master(BaseShopVO baseShopVO) throws Exception;
	
	public void set_order_detail(BaseShopVO baseShopVO) throws Exception;
	
	public void set_cart_delete(BaseShopVO baseShopVO) throws Exception;
	
	public BaseShopVO get_site_coupon_info(BaseShopVO baseShopVO) throws Exception;
	
	public List<BaseShopVO> get_site_order_list(BaseShopVO baseShopVO) throws Exception;
	public List<BaseShopVO> get_site_order_detail_list(BaseShopVO baseShopVO) throws Exception;
	public List<BaseShopVO> get_site_order_reserve_list(BaseShopVO baseShopVO) throws Exception;
	
	public List<BaseShopVO> get_site_my_order_no_market_detail_list(BaseShopVO baseShopVO) throws Exception;
	public List<BaseShopVO> get_site_my_order_market_detail_list(BaseShopVO baseShopVO) throws Exception;

	public List<BaseShopVO> get_cart4_store_list(BaseShopVO baseShopVO) throws Exception;
	
	public int is_order_use(BaseShopVO baseShopVO) throws Exception;
	public void use_save(BaseShopVO baseShopVO) throws Exception;

	public void delete_delivery_price(BaseShopVO baseShopVO) throws Exception;
	public void insert_delivery_price(BaseShopVO baseShopVO) throws Exception;
	
	public void add_member_info(BaseShopVO baseShopVO) throws Exception;
	public void add_addr_info(BaseShopVO baseShopVO) throws Exception;
	
	public List<BaseShopVO> get_cart_addr_list(BaseShopVO baseShopVO) throws Exception;
	
	public int get_order_id_check(BaseShopVO baseShopVO) throws Exception;
	
	public BaseShopVO get_cart_opt_data(BaseShopVO baseShopVO) throws Exception;
	public void update_option(BaseShopVO baseShopVO) throws Exception;
	
	public BaseShopVO get_site_order_master_info(BaseShopVO baseShopVO) throws Exception;
	public int get_site_order_all_list_cnt(BaseShopVO baseShopVO) throws Exception;
	public List<BaseShopVO> get_site_order_all_list(BaseShopVO baseShopVO) throws Exception;
	public List<BaseShopVO> get_site_order_detail_all_list(BaseShopVO baseShopVO) throws Exception;

	public void set_update_order_master(BaseShopVO baseShopVO) throws Exception;
	public void set_update_order_detail(BaseShopVO baseShopVO) throws Exception;
	
	public BaseShopVO get_vbank_info(BaseShopVO baseShopVO) throws Exception;
	
	public void order_all_cancel(BaseShopVO baseShopVO) throws Exception;
	public void orderdetail_all_cancel(BaseShopVO baseShopVO) throws Exception;
	public void orderdetail_sel_cancel(BaseShopVO baseShopVO) throws Exception;
	
}
