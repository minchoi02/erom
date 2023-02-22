package egovframework.base.shop.service.Impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.base.shop.service.BaseShopVO;
import egovframework.rte.psl.dataaccess.EgovAbstractDAO;

@Repository("BaseShopDAO")
public class BaseShopDAO extends EgovAbstractDAO {
		
	@SuppressWarnings("unchecked")
	public List<BaseShopVO> get_main_item_top(BaseShopVO baseShopVO) {
		return (List<BaseShopVO>) list("get_main_item_top",baseShopVO);
	}
	
	public BaseShopVO get_site_prod_info(BaseShopVO baseShopVO) {
		return (BaseShopVO) select("get_site_prod_info",baseShopVO);
	}
	
	public BaseShopVO get_site_store_info(BaseShopVO baseShopVO) {
		return (BaseShopVO) select("get_site_store_info",baseShopVO);
	}
	
	@SuppressWarnings("unchecked")
	public List<BaseShopVO> get_site_prod_list(BaseShopVO baseShopVO) {
		return (List<BaseShopVO>) list("get_site_prod_list",baseShopVO);
	}
	@SuppressWarnings("unchecked")
	public List<BaseShopVO> get_site_prod_list_special(BaseShopVO baseShopVO) {
		return (List<BaseShopVO>) list("get_site_prod_list_special",baseShopVO);
	}	
	@SuppressWarnings("unchecked")
	public List<BaseShopVO> get_index_prod_list(BaseShopVO baseShopVO) {
		return (List<BaseShopVO>) list("get_index_prod_list",baseShopVO);
	}	
	
	@SuppressWarnings("unchecked")
	public List<BaseShopVO> get_index_prod_list_1(BaseShopVO baseShopVO) {
		return (List<BaseShopVO>) list("get_index_prod_list_1",baseShopVO);
	}	

	@SuppressWarnings("unchecked")
	public List<BaseShopVO> get_index_prod_list_2(BaseShopVO baseShopVO) {
		return (List<BaseShopVO>) list("get_index_prod_list_2",baseShopVO);
	}	
	@SuppressWarnings("unchecked")
	public List<BaseShopVO> get_index_prod_list_3(BaseShopVO baseShopVO) {
		return (List<BaseShopVO>) list("get_index_prod_list_3",baseShopVO);
	}	
	@SuppressWarnings("unchecked")
	public List<BaseShopVO> get_index_prod_list_4(BaseShopVO baseShopVO) {
		return (List<BaseShopVO>) list("get_index_prod_list_4",baseShopVO);
	}		
	@SuppressWarnings("unchecked")
	public List<BaseShopVO> get_index_prod_list_5(BaseShopVO baseShopVO) {
		return (List<BaseShopVO>) list("get_index_prod_list_5",baseShopVO);
	}			
	
	public int get_site_prod_list_cnt_special(BaseShopVO baseShopVO) {
		return (Integer) select("get_site_prod_list_cnt_special",baseShopVO);
	}
	public int get_site_prod_list_cnt(BaseShopVO baseShopVO) {
		return (Integer) select("get_site_prod_list_cnt",baseShopVO);
	}	
	
	@SuppressWarnings("unchecked")
	public List<BaseShopVO> get_prod_room_list(BaseShopVO baseShopVO) {
		return (List<BaseShopVO>) list("get_prod_room_list",baseShopVO);
	}
	
	@SuppressWarnings("unchecked")
	public List<BaseShopVO> get_site_prod_ajax_list(BaseShopVO baseShopVO) {
		return (List<BaseShopVO>) list("get_site_prod_ajax_list",baseShopVO);
	}
	
	public int get_site_prod_ajax_list_cnt(BaseShopVO baseShopVO) {
		return (Integer) select("get_site_prod_ajax_list_cnt",baseShopVO);
	}
	
	@SuppressWarnings("unchecked")
	public List<BaseShopVO> get_site_main_prod_list_recom_travel(BaseShopVO baseShopVO) {
		return (List<BaseShopVO>) list("get_site_main_prod_list_recom_travel",baseShopVO);
	}
	public int get_site_main_prod_list_recom_travel_cnt(BaseShopVO baseShopVO) {
		return (Integer) select("get_site_main_prod_list_recom_travel_cnt",baseShopVO);
	}
	
	@SuppressWarnings("unchecked")
	public List<BaseShopVO> get_option_list(BaseShopVO baseShopVO) {
		return (List<BaseShopVO>) list("get_option_list",baseShopVO);
	}
	
	@SuppressWarnings("unchecked")
	public List<BaseShopVO> get_cart_addr_list(BaseShopVO baseShopVO) {
		return (List<BaseShopVO>) list("get_cart_addr_list",baseShopVO);
	}
	
	public void pick_plus(BaseShopVO baseShopVO) {
		update("pick_plus",baseShopVO);
	}
	
	public void pick_minus(BaseShopVO baseShopVO) {
		update("pick_minus",baseShopVO);
	}
	
	public BaseShopVO get_cp_info(BaseShopVO baseShopVO) {
		return (BaseShopVO) select("get_cp_info",baseShopVO);
	}
	
	public BaseShopVO get_site_room_info(BaseShopVO baseShopVO) {
		return (BaseShopVO) select("get_site_room_info",baseShopVO);
	}

	@SuppressWarnings("unchecked")
	public List<BaseShopVO> get_fav_zone_list(BaseShopVO baseShopVO) {
		return (List<BaseShopVO>) list("get_fav_zone_list",baseShopVO);
	}
	
	public int get_fav_zone_list_cnt(BaseShopVO baseShopVO) {
		return (Integer) select("get_fav_zone_list_cnt",baseShopVO);
	}
	
	@SuppressWarnings("unchecked")
	public List<BaseShopVO> get_fav_market_list(BaseShopVO baseShopVO) {
		return (List<BaseShopVO>) list("get_fav_market_list",baseShopVO);
	}
	
	public int get_fav_market_list_cnt(BaseShopVO baseShopVO) {
		return (Integer) select("get_fav_market_list_cnt",baseShopVO);
	}
	
	public int get_has_coupon(BaseShopVO baseShopVO) {
		return (Integer) select("get_has_coupon",baseShopVO);
	}
	
	public void issue_coupon(BaseShopVO baseShopVO) {
		insert("issue_coupon",baseShopVO);
	}
	
	public BaseShopVO get_day_check(BaseShopVO baseShopVO) {
		return (BaseShopVO) select("get_day_check",baseShopVO);
	}
	
	public int cart_save(BaseShopVO baseShopVO) {
		return (Integer) insert("cart_save",baseShopVO);
	}
	
	@SuppressWarnings("unchecked")
	public List<BaseShopVO> get_cart_list(BaseShopVO baseShopVO) {
		return (List<BaseShopVO>) list("get_cart_list",baseShopVO);
	}

	public int get_cart_cnt(BaseShopVO baseShopVO) {
		return (Integer) select("get_cart_cnt",baseShopVO);
	}
	
	@SuppressWarnings("unchecked")
	public List<BaseShopVO> get_member_coupon_list(BaseShopVO baseShopVO) {
		return (List<BaseShopVO>) list("get_member_coupon_list",baseShopVO);
	}
	
	@SuppressWarnings("unchecked")
	public List<BaseShopVO> get_site_order_list(BaseShopVO baseShopVO) {
		return (List<BaseShopVO>) list("get_site_order_list",baseShopVO);
	}
	
	@SuppressWarnings("unchecked")
	public List<BaseShopVO> get_site_order_detail_list(BaseShopVO baseShopVO) {
		return (List<BaseShopVO>) list("get_site_order_detail_list",baseShopVO);
	}
	
	@SuppressWarnings("unchecked")
	public List<BaseShopVO> get_site_order_reserve_list(BaseShopVO baseShopVO) {
		return (List<BaseShopVO>) list("get_site_order_reserve_list",baseShopVO);
	}
	
	@SuppressWarnings("unchecked")
	public List<BaseShopVO> get_site_my_order_no_market_detail_list(BaseShopVO baseShopVO) {
		return (List<BaseShopVO>) list("get_site_my_order_no_market_detail_list",baseShopVO);
	}
	
	@SuppressWarnings("unchecked")
	public List<BaseShopVO> get_site_my_order_market_detail_list(BaseShopVO baseShopVO) {
		return (List<BaseShopVO>) list("get_site_my_order_market_detail_list",baseShopVO);
	}
	
	@SuppressWarnings("unchecked")
	public List<BaseShopVO> get_cart4_store_list(BaseShopVO baseShopVO) {
		return (List<BaseShopVO>) list("get_cart4_store_list",baseShopVO);
	}
	
	public void del_cart_category(BaseShopVO baseShopVO) {
		delete("del_cart_category",baseShopVO);
	}
	
	public void del_cart_item(BaseShopVO baseShopVO) {
		delete("del_cart_item",baseShopVO);
	}
	
	public BaseShopVO get_cart_info(BaseShopVO baseShopVO) {
		return (BaseShopVO) select("get_cart_info",baseShopVO);
	}
	
	public void set_order_master(BaseShopVO baseShopVO) {
		insert("set_order_master",baseShopVO);
	}
	
	public void set_order_detail(BaseShopVO baseShopVO) {
		insert("set_order_detail",baseShopVO);
	}
	
	public void set_cart_delete(BaseShopVO baseShopVO) {
		delete("set_cart_delete",baseShopVO);
	}
	
	public BaseShopVO get_site_coupon_info(BaseShopVO baseShopVO) {
		return (BaseShopVO) select("get_site_coupon_info",baseShopVO);
	}
	
	public int is_order_use(BaseShopVO baseShopVO) {
		return (Integer) select("is_order_use",baseShopVO);
	}
	
	public void use_save(BaseShopVO baseShopVO) {
		update("use_save",baseShopVO);
	}
	
	public void delete_delivery_price(BaseShopVO baseShopVO) {
		delete("delete_delivery_price",baseShopVO);
	}
	
	public void insert_delivery_price(BaseShopVO baseShopVO) {
		insert("insert_delivery_price",baseShopVO);
	}
	
	public void add_member_info(BaseShopVO baseShopVO) {
		delete("add_member_info",baseShopVO);
	}
	
	public void add_addr_info(BaseShopVO baseShopVO) {
		insert("add_addr_info",baseShopVO);
	}
	
	public int get_order_id_check(BaseShopVO baseShopVO) {
		return (Integer) select("get_order_id_check",baseShopVO);
	}

	
	public BaseShopVO get_cart_opt_data(BaseShopVO baseShopVO) {
		return (BaseShopVO) select("get_cart_opt_data",baseShopVO);
	}
	
	public void update_option(BaseShopVO baseShopVO) {
		update("update_option",baseShopVO);
	}
	
	public BaseShopVO get_site_order_master_info(BaseShopVO baseShopVO) {
		return (BaseShopVO) select("get_site_order_master_info",baseShopVO);
	}
	public int get_site_order_all_list_cnt(BaseShopVO baseShopVO) {
		return (Integer) select("get_site_order_all_list_cnt",baseShopVO);
	}

	@SuppressWarnings("unchecked")
	public List<BaseShopVO> get_site_order_all_list(BaseShopVO baseShopVO) {
		return (List<BaseShopVO>) list("get_site_order_all_list",baseShopVO);
	}
	@SuppressWarnings("unchecked")
	public List<BaseShopVO> get_site_order_detail_all_list(BaseShopVO baseShopVO) {
		return (List<BaseShopVO>) list("get_site_order_detail_all_list",baseShopVO);
	}
	
	public void set_update_order_master(BaseShopVO baseShopVO) {
		update("set_update_order_master",baseShopVO);
	}
	public void set_update_order_detail(BaseShopVO baseShopVO) {
		update("set_update_order_detail",baseShopVO);
	}
	
	public BaseShopVO get_vbank_info(BaseShopVO baseShopVO) {
		return (BaseShopVO) select("get_vbank_info",baseShopVO);
	}
	
	public void order_all_cancel(BaseShopVO baseShopVO) {
		update("order_all_cancel",baseShopVO);
	}
	public void orderdetail_all_cancel(BaseShopVO baseShopVO) {
		update("orderdetail_all_cancel",baseShopVO);
	}
	public void orderdetail_sel_cancel(BaseShopVO baseShopVO) {
		update("orderdetail_sel_cancel",baseShopVO);
	}


}



